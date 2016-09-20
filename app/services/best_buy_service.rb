class BestBuyService
  def initialize
    @conn = Faraday.new("https://api.bestbuy.com/v1/stores") do |faraday| 
      faraday.request  :url_encoded            
      faraday.response :logger                  
      faraday.adapter  Faraday.default_adapter  
    end
  end
  
  def search_by_zip(zip)
    # @response = @conn.get("(area(#{zip},25))", {format: "json", show: "storeType,name,city,distance,phone", apiKey: "7a3heu7emrjz6qbsugmepbv6", page: 1})
    # @response2 = @conn.get("(area(#{zip},25))", {format: "json", show: "storeType,name,city,distance,phone", apiKey: "7a3heu7emrjz6qbsugmepbv6", page: 2})
    # @first_stores = JSON.parse(@response.body)["stores"]
    # @second_stores = JSON.parse(@response2.body)["stores"]
    # @stores = @first_stores + @second_stores
    
    @response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,name,city,distance,phone&apiKey=7a3heu7emrjz6qbsugmepbv6&page=1")
    @response2 = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,name,city,distance,phone&apiKey=7a3heu7emrjz6qbsugmepbv6&page=2")
    @first_stores = JSON.parse(@response.body)["stores"]
    @second_stores = JSON.parse(@response2.body)["stores"]
    @stores = @first_stores + @second_stores
  end
  
  def total(zip)
    @response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,name,city,distance,phone&apiKey=7a3heu7emrjz6qbsugmepbv6&page=1")
    @total = JSON.parse(@response.body)["total"]
  end
end