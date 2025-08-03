; Highlights for Yarn Spinner (tree-sitter yarn_spinner)

; Comments
(comment) @comment

; File-level hashtags and inline hashtags
(file_hashtag
  (hashtag_marker) @punctuation.special
  (hashtag_text) @tag)

(hashtag
  (hashtag_marker) @punctuation.special
  (hashtag_text) @tag)

; Node headers
(title_header
  (header_title_kw) @keyword
  (identifier) @title)

(when_header
  (header_when_kw) @keyword
  (expression) @condition)

(header
  key: (identifier) @property
  value: (rest_of_line) @text.literal)

; Body delimiters
(body_start) @punctuation.special
(body_end) @punctuation.special

; Statements and structural arrows
(shortcut_arrow) @punctuation.special
(line_group_arrow) @punctuation.special

; Commands
(command_statement
  (command_start) @punctuation.special
  (command_end) @punctuation.special)

(command_start) @punctuation.special
(command_end) @punctuation.special
(command_text_chunk) @preproc

; Inline expressions
(expression_start) @punctuation.bracket
(expression_end) @punctuation.bracket

; Text content
(text) @text.literal
(line_formatted_text) @text.literal
(command_formatted_text) @text.literal

; Variables and identifiers
(variable
  "$" @punctuation.delimiter
  (identifier) @variable)

(identifier) @identifier

; Numbers and strings
(number) @number
(string) @string
; Provide escapes within strings if grammar exposes them as plain content
; (string_escape) @string.escape

; Expressions and operators
; (binary_expression
;   (operator) @operator)

; (unary_expression
;   (operator) @operator)

(paren_expression
  "(" @punctuation.bracket
  ")" @punctuation.bracket)

(call_expression
  function: (identifier) @function
  "(" @punctuation.bracket
  "," @punctuation.delimiter
  ")" @punctuation.bracket)

(member_expression
  type: (identifier)? @type
  "." @punctuation.delimiter
  member: (identifier) @property)

; Line conditions using command keywords
(command_if_kw) @keyword
(command_once_kw) @keyword
(kw_not) @keyword
(kw_and) @keyword
(kw_or) @keyword
(kw_xor) @keyword
(kw_is) @keyword
(kw_eq) @keyword
(kw_neq) @keyword
(kw_lt) @keyword
(kw_gt) @keyword
(kw_lte) @keyword
(kw_gte) @keyword

; Newlines are tokens; no highlight necessary, but capture for completeness
; (newline)
