#!/usr/bin/env bash

path="$HOME/.local/share/fcitx5/rime"
while [ $# -gt 0 ]; do
  case "$1" in
    -i)
      path="$HOME/.config/ibus/rime"
      shift
      ;;
    -f)
      path="$HOME/.config/fcitx/rime"
      shift
      ;;
    *)
      shift
      ;;
  esac
done
mkdir -p "$path"
cd "$path" || exit
rm -f haha.html
wget --tries=100 --retry-connrefused --waitretry=5 -O haha.html https://ejsoon.vip/haha
downloadlink=$(awk '/<h3>碼表下載<\/h3>/{ getline; if (match($0, /https:\/\/ejsoon\.vip\/wp-content\/uploads\/.*\/haha_.*\.cin/)) { print substr($0, RSTART, RLENGTH); exit; } }' haha.html)
rm haha.html*
file=$(echo "$downloadlink" | sed 's/^https:\/\/ejsoon\.vip\/wp-content\/uploads\/.*\///')
version=$(echo "$file" | sed 's/^haha_//' | sed 's/\.cin$//')
rm -f "$file"
wget --tries=100 --retry-connrefused --waitretry=5 "$downloadlink"
awk '/^%chardef begin$/{ in_table=1; next } /^%chardef end$/{ in_table=0; exit } in_table { print }' "$file" >haha.txt
rm "$file"*
awk '{ print $2 "\t" $1 }' haha.txt >haha.dict.txt
rm haha.txt
cat >haha.schema.yaml <<EOF
# haha.schema.yaml
#
schema:
  schema_id: haha
  name: "哈哈倉頡"
  version: "$version"
EOF
cat >>haha.schema.yaml <<'EOF'
  author: "尹卂"
  description: "https://ejsoon.vip/haha"
engine:
  processors:
    - ascii_composer
    - key_binder
    - speller
    - selector
    - punctuator
    - express_editor
  segmentors:
    - ascii_segmentor
    - abc_segmentor
    - punct_segmentor
    - fallback_segmentor
  translators:
    - punct_translator
    - table_translator
switches:
  - name: ascii_mode
    reset: 0
    states: [ 中文, 西文 ]
  - name: ascii_punct
    states: ["。，", ".,"]
speller:
  alphabet: zyxwvutsrqponmlkjihgfedcba
  max_code_length: 4
  auto_select: true
  auto_clear: max_length
translator:
  dictionary: haha
  enable_completion: false
  enable_user_dict: false
  enable_sentence: false
  preedit_format:
    - xform/^([a-z]*)$/\U$1\E/
    - "xlit|ABCDEFGHIJKLMNOPQRSTUVWXYZ|日月金木水火土竹戈十大中一弓人心手口尸廿山女田難卜重|"
  comment_format:
    - "xlit|abcdefghijklmnopqrstuvwxyz~|日月金木水火土竹戈十大中一弓人心手口尸廿山女田難卜重～|"
menu:
  page_size: 9
  alternative_select_keys: "123456789"
key_binder:
  bindings:
    - { accept: semicolon, send: 2, when: has_menu }
    - { accept: apostrophe, send: 3, when: has_menu }
    - { accept: slash, send: 4, when: has_menu }
punctuator:
  full_shape:
    ",": {commit: "，"}
    ".": {commit: "。"}
    "/": {commit: "、"}
    "!": {commit: "！"}
    "@": {commit: "•"}
    "^": {commit: "……"}
    "$": {commit: "￥"}
    "_": {commit: "——"}
    "-": {commit: "―"}
    "|": {commit: "︱"}
    "?": {commit: "？"}
    ":": {commit: "："}
    ";": {commit: "；"}
    "[": {commit: "「"}
    "]": {commit: "」"}
    "{": {commit: "『"}
    "}": {commit: "』"}
    "(": {commit: "（"}
    ")": {commit: "）"}
    "\"": {commit: "“”"}
    "'": {commit: "‘’"}
    "<": {commit: "《"}
    ">": {commit: "》"}
  half_shape:
    ",": {commit: "，"}
    ".": {commit: "。"}
    "/": {commit: "、"}
    "!": {commit: "！"}
    "@": {commit: "•"}
    "^": {commit: "……"}
    "$": {commit: "￥"}
    "_": {commit: "——"}
    "-": {commit: "―"}
    "|": {commit: "︱"}
    "?": {commit: "？"}
    ":": {commit: "："}
    ";": {commit: "；"}
    "[": {commit: "「"}
    "]": {commit: "」"}
    "{": {commit: "『"}
    "}": {commit: "』"}
    "(": {commit: "（"}
    ")": {commit: "）"}
    "\"": {commit: "“”"}
    "'": {commit: "‘’"}
    "<": {commit: "《"}
    ">": {commit: "》"}
EOF
cat >haha.dict.yaml <<EOF
# haha.dict.yaml
#
---
name: haha
version: "$version"
sort: original
...
# no comment
EOF
cat haha.dict.txt >>haha.dict.yaml
rm haha.dict.txt
cat >default.custom.yaml <<EOF
patch:
  schema_list:
    - {schema: haha}
EOF
