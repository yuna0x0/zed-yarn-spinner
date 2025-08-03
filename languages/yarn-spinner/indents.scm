; Indentation rules for Yarn Spinner (tree-sitter yarn_spinner)
;
; These rules are conservative and aim to give sensible indentation for
; common Yarn Spinner structures without relying on indentation-sensitive
; parsing. They focus on:
; - Indenting inside node bodies (between --- and ===)
; - Indenting continuation lines for options/groups
; - Indenting content within command delimiters and parenthesized expressions

; 1) Indent between body delimiters: after --- until ===
; Indent the entire body region.
; (body
;   (_) @indent)

; When we reach the body_end (===), reduce indentation.
(body_end) @end

; 2) Parentheses in expressions
(paren_expression
  "(" @indent
  ")" @end)

; Calls behave similarly to parentheses
(call_expression
  "(" @indent
  ")" @end)

; 3) Command blocks: provide visual indentation between << and >>
; Many Yarn commands are single-line, but this helps when authors
; format multi-line commands or long conditions.
(command_start) @indent
(command_end) @end

; 4) Shortcut options and line groups
; Indent the line that follows an arrow as a continuation.
(shortcut_option
  (shortcut_arrow)
  (_) @indent)

(line_group_item
  (line_group_arrow)
  (_) @indent)

; 5) General: if a line has an inline expression with braces,
; do not change indentation globally, but ensure braces are treated as pairs.
; Note: actual matching handled in brackets.scm; here we treat multiline
; expressions as indent scopes if authors choose to line-break within them.
(expression_start) @indent
(expression_end) @end
