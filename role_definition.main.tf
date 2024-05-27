resource "azurerm_role_definition" "name" {
  for_each = {
    for role_definition in var.role_definitions :
    role_definition.name => role_definition
    if role_definition.name != null
  }

  name        = each.value.name
  scope       = each.value.scope
  description = each.value.description

  dynamic "permissions" {
    for_each = each.value.permissions != null ? toset([each.value.permissions]) : toset([])
    content {
      actions          = permissions.value.actions
      data_actions     = permissions.value.data_actions
      not_actions      = permissions.value.not_actions
      not_data_actions = permissions.value.not_data_actions
    }
  }

  assignable_scopes = each.value.assignable_scopes
}
