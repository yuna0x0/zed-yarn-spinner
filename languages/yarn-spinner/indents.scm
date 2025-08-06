; Indentation rules for Yarn Spinner (tree-sitter yarn_spinner)
;
; These rules provide sensible indentation for Yarn Spinner structures
; based on the current grammar, focusing on:
; - Indenting inside node bodies (between --- and ===)
; - Indenting content within if/once statement blocks
; - Indenting shortcut options and line groups
; - Indenting expressions and function calls

; 1) Node body content - indent statements between body_start and body_end
(node
  (body_start)
  ; (statement)* @indent
  (body_end) @end)

; 2) If statement blocks
(if_clause
  (command_end)
  (statement)* @indent)

(else_if_clause
  (command_end)
  (statement)* @indent)

(else_clause
  (command_end)
  (statement)* @indent)

; 3) Once statement blocks
(once_clause
  (command_end)
  (statement)* @indent)

(once_alternate_clause
  (command_end)
  (statement)* @indent)

; 4) Enum case statements
(enum_statement
  (command_end)
  (enum_case_statement)+ @indent
  (command_start) @end)

; 5) Shortcut options - indent content after the arrow
(shortcut_option
  (shortcut_arrow)
  (line_statement)
  (indent)
  (statement)* @indent
  (dedent) @end)

; 6) Line group items - indent content after the arrow
(line_group_item
  (line_group_arrow)
  (line_statement)
  (indent)
  (statement)* @indent
  (dedent) @end)

; 7) Parenthesized expressions
(paren_expression
  "(" @indent
  ")" @end)

; 8) Function calls
(function_call
  "(" @indent
  ")" @end)

; 9) Expression interpolation braces
(expression_start) @indent
(expression_end) @end

; 10) Command blocks (for multi-line commands)
(command_start) @indent
(command_end) @end

; 11) Handle explicit indent/dedent tokens from external scanner
(indent) @indent
(dedent) @end
