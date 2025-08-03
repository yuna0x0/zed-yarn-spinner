; Runnables for Yarn Spinner (tree-sitter yarn_spinner)
; Define rules for detecting runnable content in Yarn files

; Detect nodes that can be run/executed
; Each node with a title can be considered runnable
(node
  (title_header
    title: (identifier) @run @node_title
  )
  (#set! tag yarn-node)
)

; Detect nodes with when conditions as conditional runnables
(node
  (when_header
    expr: (expression) @condition
  )
  (title_header
    title: (identifier) @run @conditional_node
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
  destination: (identifier) @run @jump_target
  (#set! tag yarn-jump)
)

; Detect detour statements as subroutine calls
(jump_statement
  (command_detour_kw)
  destination: (identifier) @run @detour_target
  (#set! tag yarn-detour)
)
