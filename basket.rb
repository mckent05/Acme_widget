require_relative 'delivery_rules'

class Basket

  attr_reader :cart_items

  def initialize(product_catalogue, offers)
    @product_catalogue = product_catalogue
    @delivery_charge_rules = DeliveryRules.new
    @offers = offers
    @cart_items = []
  end

  def add(product_code)
    raise ArgumentError, "Product code must be a string" unless product_code.is_a?(String)
    product = @product_catalogue.find { |product| product.code == product_code}
    @cart_items << product if product
  end

  def total
    cart_subtotal = @cart_items.sum(&:price)
    discount = @offers.sum { |offer| offer.apply_offer(@cart_items)}
    discounted_total = cart_subtotal - discount
    delivery_fee = @delivery_charge_rules.delivery_rate(discounted_total)
    "$#{(discounted_total + delivery_fee).round(2)}"
  end
end

