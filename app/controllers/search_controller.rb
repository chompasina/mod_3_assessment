class SearchController <ApplicationController
  respond_to :json
  
  def index
    @response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeType,name,city,distance,phone&apiKey=7a3heu7emrjz6qbsugmepbv6")
    @total = JSON.parse(@response.body)["total"]
    @stores = JSON.parse(@response.body)["stores"].each do |store|
      OpenStruct.new(store)
    end
  end
  
end