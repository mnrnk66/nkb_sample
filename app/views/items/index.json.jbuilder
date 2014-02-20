json.array!(@items) do |item|
  json.extract! item, :id, :code, :name
  json.url item_url(item, format: :json)
end
