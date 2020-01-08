#!/usr/bin/env bash

# Good reference: https://linuxhint.com/associative_array_bash/

# shellcheck disable=SC1091
source stack.sh

declare last_bracket

process_brace() {
  local brace=$1
  case $brace in
    "[")
      push "["
      return 0
      ;;
    "]")
      local last_bracket
      if [[ $last_bracket -eq "[" ]]; then
        return 0
      else
        return 1
      fi
      ;;
  esac
}

main() {
  local braces=$1
  local -a char_arr

  for (( i=0 ; i < ${#braces} ; i++ )); do 
    char_arr[i]=${braces:i:1}; 
  done

  echo "$char_arr[@]"

  push 5
  print
  push 10
  print
  local popped_val=99
  pop "popped_val"
  printf "Pop: %d\n" "$popped_val"
  print
}

main "$@"

