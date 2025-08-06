; Text objects for Yarn Spinner (tree-sitter yarn_spinner)
; These define text objects for Vim-style navigation in Zed

; Nodes act as class-level objects (large sections)
(node) @class.around

; Node body content (between --- and ===)
(node
  (body_start)
  (statement)* @class.inside
  (body_end))

; If statement blocks act as function-level objects
(if_statement) @function.around

(if_clause
  (command_end)
  (statement)* @function.inside)

(else_if_clause
  (command_end)
  (statement)* @function.inside)

(else_clause
  (command_end)
  (statement)* @function.inside)

; Once statement blocks
(once_statement) @function.around

(once_clause
  (command_end)
  (statement)* @function.inside)

(once_alternate_clause
  (command_end)
  (statement)* @function.inside)

; Enum statement blocks
(enum_statement) @function.around

(enum_statement
  (command_end)
  (enum_case_statement)* @function.inside
  (command_start))

; Shortcut option blocks
(shortcut_option) @function.around

(shortcut_option
  (line_statement)
  (indent)
  (statement)* @function.inside
  (dedent))

; Line group blocks
(line_group_item) @function.around

(line_group_item
  (line_statement)
  (indent)
  (statement)* @function.inside
  (dedent))

; Comments
(comment) @comment.around

; Function calls as function objects
(function_call) @function.around

(function_call
  "("
  (expression)* @function.inside
  ")")

; Parenthesized expressions
(paren_expression) @function.around

(paren_expression
  "("
  (expression) @function.inside
  ")")

; Command statements as function objects
(command_statement) @function.around

(command_statement
  (command_start)
  (_)* @function.inside
  (command_end))
