#!/bin/sh

input=$(cat)

# Context usage
ctx_used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
ctx_size=$(echo "$input" | jq -r '.context_window.context_window_size // empty')

# Five-hour rate limit
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_resets=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')

# Seven-day rate limit
seven_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
seven_resets=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# Build progress bar (10 chars wide)
make_bar() {
  pct="$1"
  filled=$(awk "BEGIN { printf \"%d\", ($pct / 100) * 10 + 0.5 }")
  bar=""
  i=0
  while [ $i -lt $filled ]; do bar="${bar}#"; i=$((i+1)); done
  while [ $i -lt 10 ]; do bar="${bar}-"; i=$((i+1)); done
  echo "$bar"
}

parts=""

# Context percentage
if [ -n "$ctx_used" ]; then
  ctx_int=$(printf "%.0f" "$ctx_used")
  if [ -n "$ctx_size" ]; then
    ctx_k=$(awk "BEGIN { printf \"%d\", ($ctx_size / 1000) + 0.5 }")
    parts="ctx:${ctx_int}% / ${ctx_k}k"
  else
    parts="ctx:${ctx_int}%"
  fi
fi

# Five-hour rate limit bar with reset countdown
if [ -n "$five_pct" ]; then
  five_int=$(printf "%.0f" "$five_pct")
  five_reset_str=""
  if [ -n "$five_resets" ]; then
    now=$(date +%s)
    diff=$((five_resets - now))
    if [ $diff -gt 0 ]; then
      diff_hours=$(( diff / 3600 ))
      diff_min=$(( (diff % 3600) / 60 ))
      if [ $diff_hours -ge 1 ]; then
        five_reset_str="(in ${diff_hours}h${diff_min}m)"
      else
        five_reset_str="(in ${diff_min}m)"
      fi
    else
      five_reset_str="(resetting)"
    fi
  fi
  if [ -n "$parts" ]; then
    parts="${parts} | 5h:${five_int}%${five_reset_str}"
  else
    parts="5h:${five_int}%${five_reset_str}"
  fi
fi

# Seven-day rate limit percentage with reset time
if [ -n "$seven_pct" ]; then
  seven_int=$(printf "%.0f" "$seven_pct")
  seven_reset_str=""
  if [ -n "$seven_resets" ]; then
    now=$(date +%s)
    diff=$((seven_resets - now))
    if [ $diff -gt 0 ]; then
      diff_days=$(( diff / 86400 ))
      diff_hours=$(( (diff % 86400) / 3600 ))
      if [ $diff_days -ge 1 ]; then
        seven_reset_str="(in ${diff_days}d)"
      elif [ $diff_hours -ge 1 ]; then
        seven_reset_str="(in ${diff_hours}h)"
      else
        diff_min=$(( diff / 60 ))
        seven_reset_str="(in ${diff_min}m)"
      fi
    else
      seven_reset_str="(resetting)"
    fi
  fi
  if [ -n "$parts" ]; then
    parts="${parts} | 7d:${seven_int}%${seven_reset_str}"
  else
    parts="7d:${seven_int}%${seven_reset_str}"
  fi
fi

printf "%s" "$parts"
