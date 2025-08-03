; Redactions for Yarn Spinner (tree-sitter yarn_spinner)
; Define rules for redacting sensitive content when screen sharing

; Redact string literals that might contain sensitive information
(string) @redact

; Redact numeric values that might be sensitive
(number) @redact

; Redact variable values in set statements
(set_statement
  (expression) @redact)

; Redact function call arguments that might contain sensitive data
(function_call
  (expression) @redact)

; Redact expressions in when headers (conditional logic)
(when_header
  expr: (expression) @redact)

; Redact variable references that might expose sensitive state
(variable) @redact

; Redact jump destinations that might reveal story structure
(jump_statement
  destination: (identifier) @redact)

(command_statement
  (command_formatted_text) @redact)

; Redact header values that might contain metadata
(header
  value: (rest_of_line) @redact)
