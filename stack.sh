#!/usr/bin/env bash
stack=()

push() {
  local value=$1
  stack+=("$value")
}

pop() {
  local result=$1
  eval "$result='${stack[-1]}'"
  unset "stack[-1]"
}

print() {
  printf "Stack: \n"
  for elem in "${stack[@]}"; do 
    printf "%s\n" "$elem"
  done
}
