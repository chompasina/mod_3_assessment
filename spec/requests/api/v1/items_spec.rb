require 'rails_helper'

describe "User can see all items" do
  scenario "they visit items index" do
    #   When I send a GET request to `/api/v1/items`
    # I receive a 200 JSON response containing all items
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
    items = create(:item)
    get 'api/v1/items'
    
    json = JSON.parse(response.body)
    
    expect(response).to be_success
    require "pry"; binding.pry
    expect(json['items'].length).to eq(500)
    
  end
  
  scenario "they can see a specific item" do
    # When I send a GET request to `/api/v1/items/1`
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    # 
  end
  
  scenario "they can delete an item" do
    
    # When I send a DELETE request to `/api/v1/items/1`
    # I receive a 204 JSON response if the record is successfully deleted
    # 
  end
  
  scenario "they can create an item" do
    # When I send a POST request to `/api/v1/items` with a name, description, and image_url
    # I receive a 201 JSON  response if the record is successfully created
    # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at

  end
end