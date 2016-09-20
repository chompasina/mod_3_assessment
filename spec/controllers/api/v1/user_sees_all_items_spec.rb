require 'rails_helper'

describe "User can see all items" do
  scenario "they visit items index" do
    get '/api/v1/items'
    
    expect(200).to eq(status_code)
    
  end
end