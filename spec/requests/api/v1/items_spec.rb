require 'rails_helper'

describe "User can see all items" do
  scenario "they visit items index" do
    get '/api/v1/items'
    
    json = JSON.parse(response.body)
    
    expect(response).to be_success
    require "pry"; binding.pry
    expect(json['items'].length).to eq(500)
    
  end
end