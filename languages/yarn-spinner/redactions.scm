; Redactions for Yarn Spinner (tree-sitter yarn_spinner)
; Define rules for redacting sensitive content when screen sharing

; Redact string literals that might contain sensitive information
(string) @redact

; Redact numeric values that might be sensitive
(number) @redact

; Redact variable references that might expose sensitive state
(variable) @redact

; Redact expressions in set statements (variable assignments)
(set_statement
  (expression) @redact)

; Redact function call arguments that might contain sensitive data
(function_call
  (expression) @redact)

; Redact expressions in when headers (conditional logic)
(when_header
  expr: (_) @redact)

; Redact expressions in header when expressions
(header_when_expression
  (expression) @redact)

; Redact line conditions that might reveal logic
(line_condition
  (expression)? @redact)

; Redact expressions in if clauses
(if_clause
  (expression) @redact)

; Redact expressions in else if clauses
(else_if_clause
  (expression) @redact)

; Redact expressions in once clauses
(once_clause
  (expression)? @redact)

; Redact enum case values
(enum_case_statement
  value: (expression)? @redact)

; Redact expressions in declare statements
(declare_statement
  (expression) @redact)

; Redact jump destinations that might reveal story structure
(jump_statement
  destination: (identifier)? @redact)

; Redact jump expressions (dynamic destinations)
(jump_statement
  (expression) @redact)

; Redact command text that might contain sensitive information
(command_text) @redact

; Redact header values that might contain metadata
(header
  value: (rest_of_line)? @redact)

; Redact node titles that might reveal story structure
(title_header
  title: (rest_of_line) @redact)

; Redact hashtag text that might contain sensitive tags
(hashtag_text) @redact

; Redact file hashtag text
(file_hashtag
  text: (hashtag_text) @redact)

; Redact inline hashtag text
(hashtag
  text: (hashtag_text) @redact)

; Redact text content that might contain sensitive dialogue
(text) @redact

; Redact expressions within line formatted text
(line_formatted_text
  (expression) @redact)
