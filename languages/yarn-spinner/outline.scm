; Outline for Yarn Spinner
; Show each node using its title from the title_header

; Capture the node title for the outline name
(title_header
  title: (identifier) @name) @annotation

; Treat the entire node as an outline item, using the closest title_header @name
(node) @item

; Also capture when headers for conditional nodes
(when_header
  expr: (expression) @name) @annotation

; Capture other headers as context
(header
  key: (identifier) @name
  value: (rest_of_line)? @context) @annotation
