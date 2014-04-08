$(document).on "nested:fieldAdded", (event) ->
  field = event.field
  descriptionField = field.find("#step_description")
  new_id = Math.floor((Math.random() * 10000) + 3)
  descriptionField.attr("id",descriptionField.attr("id") + '_' + new_id)
  return
