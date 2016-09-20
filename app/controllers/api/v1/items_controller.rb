class Api::V1::ItemsController < ApplicationController
  respond_to :JSON
  protect_from_forgery :except => :destroy

  def index
    @items = Item.all
    
    respond_with @items
  end
  
  def show
    @item = Item.find(params[:id])
    
    respond_with @item
  end
  
  def destroy
    Item.find(params[:id]).destroy
    redirect_to root_url
  end
  
  def create
    @item = Item.create(item_params)
  end
  
  private
  
  def item_params
    params.permit(:name, :description, :image_url)
  end
end