; Indentation rules for Yarn Spinner (tree-sitter yarn_spinner)
;
; These rules are conservative and aim to give sensible indentation for
; common Yarn Spinner structures without relying on indentation-sensitive
; parsing. They focus on:
; - Indenting inside node bodies (between --- and ===)
; - Indenting continuation lines for options/groups
; - Indenting content within command delimiters and parenthesized expressions

; 1) Indent between body delimiters: after --- until ===
; Indent the content within nodes after the body_start marker
(node
  (body_start)
  ; (statement)* @indent
  (body_end) @end)

; 2) Parentheses in expressions
(paren_expression
  "(" @indent
  ")" @end)

; Function calls behave similarly to parentheses
(function_call
  "(" @indent
  ")" @end)

; 3) Command blocks: provide visual indentation between << and >>
; Many Yarn commands are single-line, but this helps when authors
; format multi-line commands or long conditions.
(command_start) @indent
(command_end) @end

; 4) If statement blocks
(if_clause
  (command_end)
  (statement)* @indent)

(else_if_clause
  (command_end)
  (statement)* @indent)

(else_clause
  (command_end)
  (statement)* @indent)

; 5) Shortcut options and line groups
; Indent the content that follows an arrow as a continuation.
(shortcut_option
  (shortcut_arrow)
  (line_statement)
  (indent)? @indent
  (dedent)? @end)

(line_group_item
  (line_group_arrow)
  (line_statement)
  (indent)? @indent
  (dedent)? @end)

; 6) General: if a line has an inline expression with braces,
; do not change indentation globally, but ensure braces are treated as pairs.
; Note: actual matching handled in brackets.scm; here we treat multiline
; expressions as indent scopes if authors choose to line-break within them.
(expression_start) @indent
(expression_end) @end

; 7) Handle indented statement blocks
(statement
  (indent)
  (statement)* @indent
  (dedent) @end)
