#!/usr/bin/env bash

# Expanded list of popular programming languages
languages=$(cat <<EOF
rust
c
cpp
python
java
javascript
typescript
go
csharp
ruby
php
swift
kotlin
scala
haskell
lua
perl
bash
r
dart
elixir
EOF
)

# User selects language and property via fzf
selected=$(printf "$languages\n" | fzf --prompt="Select language: ")
# Read through user's input and then pass the output as variable query
read -p "query: " query

# Fetch cheat sheet
curl cht.sh/$selected/$query | less -R
