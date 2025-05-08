# frozen_string_literal: true

class Product
  attr_reader :code, :price, :name

  def initialize(name, code, price)
    @name = name
    @code = code
    @price = price
  end
end
