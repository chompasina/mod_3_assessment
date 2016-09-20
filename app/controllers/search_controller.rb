class SearchController <ApplicationController
  respond_to :json
  
  def index
    @stores = BestBuyStores.search_by_zip(params[:search])
    @total = BestBuyStores.total(params[:search])
  end
  
end