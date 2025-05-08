class Product
  attr_reader :code, :price
  
  def initialize(name, code, price)
    @name = name
    @code = code
    @price = price
  end
end