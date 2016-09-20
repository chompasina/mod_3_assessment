class BestBuyStores <OpenStruct
  attr_reader :total
  
  def self.search_by_zip(zip)
    service.search_by_zip(zip).map do |store|
      new(store)
    end
    
    @response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,name,city,distance,phone&apiKey=7a3heu7emrjz6qbsugmepbv6&page=1")
    @response2 = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,name,city,distance,phone&apiKey=7a3heu7emrjz6qbsugmepbv6&page=2")
    @first_stores = JSON.parse(@response.body)["stores"]
    @second_stores = JSON.parse(@response2.body)["stores"]
    @stores = @first_stores + @second_stores
    @stores.take(15).each do |store|
      new(store)
    end
  end
  
  def self.service
    BestBuyService.new
  end
  
  def self.total(zip)
    @response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,name,city,distance,phone&apiKey=7a3heu7emrjz6qbsugmepbv6&page=1")
    @total = JSON.parse(@response.body)["total"]
  end
end