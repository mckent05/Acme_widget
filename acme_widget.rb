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

basket = Basket.new(product_catalogue, offer)
basket.add('R01')
basket.add('R01')
p basket.total
