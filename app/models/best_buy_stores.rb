class BestBuyStores <OpenStruct
  attr_reader :total
  
  def self.search_by_zip(zip)
    service.search_by_zip(zip).take(15).map do |store|
      new(store)
    end
  end
  
  def self.service
    BestBuyService.new
  end
  
  def self.total(zip)
    service.total(zip)
  end
end