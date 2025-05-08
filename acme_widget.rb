# frozen_string_literal: true

require_relative './basket'
require_relative './offer'
require_relative './product'

product_catalogue = [
  Product.new('Red Widget', 'R01', 32.95),
  Product.new('Blue Widget', 'B01', 7.95),
  Product.new('Green Widget', 'G01', 24.95)
]

offer = [
  Offer.new({ discount_type: :buy_one_get_one_half_price,
              product_code: 'R01',
              discount_rate: 0.5 })
]

test_products = [
  %w[B01 G01],
  %w[R01 R01],
  %w[R01 G01],
  %w[B01 B01 R01 R01 R01]
]

test_products.each do |products|
  basket = Basket.new(product_catalogue, offer)
  products.each do |product|
    basket.add(product)
  end
  p basket.total
end
