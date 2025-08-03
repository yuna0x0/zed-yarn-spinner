; Bracket matching for Yarn Spinner (tree-sitter yarn_spinner)
; Match parentheses in expressions
(paren_expression
  "(" @open
  ")" @close)

; Function call parentheses and commas
(call_expression
  "(" @open
  ")" @close)

; Expression interpolation braces { ... }
(expression_start) @open
(expression_end) @close

; Double-quoted strings as paired quotes
; ("\"" @open "\"" @close)

; Command delimiters << ... >>
(command_start) @open
(command_end) @close
