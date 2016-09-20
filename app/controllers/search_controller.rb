class SearchController <ApplicationController
  respond_to :json
  
  def index
    @stores = BestBuyStores.search_by_zip(params[:zip], params[:distance])
    
    # @response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeType,name,city,distance,phone&apiKey=7a3heu7emrjz6qbsugmepbv6&page=1")
    # @response2 = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeType,name,city,distance,phone&apiKey=7a3heu7emrjz6qbsugmepbv6&page=2")
    # @total = JSON.parse(@response.body)["total"]
    # @first_stores = JSON.parse(@response.body)["stores"]
    # @second_stores = JSON.parse(@response2.body)["stores"]
    # @stores = @first_stores + @second_stores
    # @stores.take(15).each do |store|
    #   OpenStruct.new(store)
    # end
  end
  
end