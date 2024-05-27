variable "role_definitions" {
  type = list(object({
    role_definition_id = optional(string)       # A unique UUID/GUID which identifies this role - one will be generated if not specified. Changing this forces a new resource to be created.
    name               = string                 # The name of the Role Definition.
    scope              = string                 # The scope at which the Role Definition applies to.
    description        = optional(string)       # A description of the Role Definition.
    permissions = optional(object({             # A permissions block
      actions          = optional(list(string)) # One or more Allowed Actions
      data_actions     = optional(list(string)) # One or more Allowed DataActions
      not_actions      = optional(list(string)) # One or more Disallowed Actions
      not_data_actions = optional(list(string)) # One or more Disallowed DataActions
    }))
    assignable_scopes = optional(list(string)) # One or more assignable scopes for this Role Definition
  }))
  description = "A custom Role Definition, used to assign Roles to Users/Principals."
  default     = [{ name = null, scope = null }]
}
