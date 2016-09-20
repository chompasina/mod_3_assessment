# json.partial! "items", item: @item
json.extract! @item, :id, :name, :description, :image_url
