; Outline for Yarn Spinner
; Show each node using its title from the title_header

; Capture the node title for the outline name
(title_header
  (identifier) @name) @annotation

; Treat the entire node as an outline item, using the closest title_header @name
(node) @item
