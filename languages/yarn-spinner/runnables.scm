; Runnables for Yarn Spinner (tree-sitter yarn_spinner)
; Define rules for detecting runnable content in Yarn files

; Detect nodes that can be run/executed
; Each node with a title can be considered runnable
(node
  (title_header
    title: (rest_of_line) @run @node_title
  )
  (#set! tag yarn-node)
)

; Detect nodes with when conditions as conditional runnables
(node
  (when_header
    expr: (_) @condition
  )
  (title_header
    title: (rest_of_line) @run @conditional_node
  )?
  (#set! tag yarn-conditional-node)
)

; Detect call statements as runnable functions
(call_statement
  (function_call
    function: (identifier) @run @function_name
  )
  (#set! tag yarn-function-call)
)

; Detect jump statements as navigation points
(jump_statement
  (jump_kw)
  destination: (identifier) @run @jump_target
  (#set! tag yarn-jump)
)

; Detect detour statements as subroutine calls
(jump_statement
  (detour_kw)
  destination: (identifier) @run @detour_target
  (#set! tag yarn-detour)
)

; Detect dynamic jump statements with expressions
(jump_statement
  (jump_kw)
  (expression) @run @dynamic_jump
  (#set! tag yarn-dynamic-jump)
)

; Detect dynamic detour statements with expressions
(jump_statement
  (detour_kw)
  (expression) @run @dynamic_detour
  (#set! tag yarn-dynamic-detour)
)

; Detect if statements as conditional blocks
(if_statement
  (if_clause
    (expression) @condition
  )
  (#set! tag yarn-conditional-block)
)

; Detect once statements as one-time blocks
(once_statement
  (once_clause
    (expression)? @condition
  )
  (#set! tag yarn-once-block)
)

; Detect enum statements as type definitions
(enum_statement
  name: (identifier) @run @enum_name
  (#set! tag yarn-enum)
)

; Detect shortcut options as interactive choices
(shortcut_option
  (line_statement) @run @choice_text
  (#set! tag yarn-choice)
)

; Detect line group items as grouped content
(line_group_item
  (line_statement) @run @group_text
  (#set! tag yarn-group)
)
