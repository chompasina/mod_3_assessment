require 'rails_helper'

describe "API consumer views items" do
  scenario "they visit items index" do
    visit '/api/v1/items'
    
    expect(page).to have_content("Items")
    
  end
end