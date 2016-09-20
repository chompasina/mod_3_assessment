class Api::V1::ItemsController < ApplicationController
  respond_to :JSON
#   When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
# 
# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
# 
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
# 
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  def index
    @items = Item.all
    
    respond_with @items
  end
  
  def show
    @item = Item.find(params[:id])
    
    respond_with @item
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end
end