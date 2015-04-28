json.array!(@todoitems) do |todoitem|
  json.extract! todoitem, :id, :title, :description
  json.url todoitem_url(todoitem, format: :json)
end
