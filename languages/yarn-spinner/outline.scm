; Outline for Yarn Spinner
; Show each node using its title from the title_header

; Capture the node title for the outline name
(title_header
  title: (rest_of_line) @name) @annotation

; Treat the entire node as an outline item, using the closest title_header @name
(node) @item

; Also capture when headers for conditional nodes
(when_header
  expr: (_) @name) @annotation

; Capture other headers as context
(header
  key: (identifier) @name
  value: (rest_of_line)? @context) @annotation

; Capture if statements as outline items
(if_statement) @item

; Capture if clause conditions as names
(if_clause
  (if_kw)
  (expression) @name) @annotation

; Capture else if clause conditions as names
(else_if_clause
  (elseif_kw)
  (expression) @name) @annotation

; Capture else clauses
(else_clause
  (else_kw) @name) @annotation

; Capture once statements as outline items
(once_statement) @item

; Capture once clause conditions as names
(once_clause
  (once_kw)
  (if_kw)?
  (expression)? @name) @annotation

; Capture enum statements as outline items
(enum_statement
  name: (identifier) @name) @item

; Capture enum cases as sub-items
(enum_case_statement
  name: (identifier) @name) @annotation

; Capture shortcut options as outline items
(shortcut_option) @item

; Capture line group items as outline items
(line_group_item) @item

; Capture function calls as context
(call_statement
  (function_call
    function: (identifier) @name)) @annotation

; Capture jump statements as context
(jump_statement
  destination: (identifier)? @name) @annotation
