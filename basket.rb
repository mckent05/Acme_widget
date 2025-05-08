# frozen_string_literal: true

require_relative 'offer'
require_relative 'delivery_rules'
require_relative 'product'

class Basket
  attr_reader :cart_items

  def initialize(product_catalogue, offers)
    @product_catalogue = product_catalogue
    @delivery_charge_rules = DeliveryRules.new
    @offers = offers
    @cart_items = []
  end

  def add(product_code)
    # raise error if product code is not a string
    raise ArgumentError, 'Product code must be a string' unless product_code.is_a?(String)

    product = @product_catalogue.find { |product_cat| product_cat.code == product_code }
    @cart_items << product if product
  end

  def total
    cart_subtotal = @cart_items.sum(&:price) #calculate the sum of all items in the cart

    # get discount for the products that meet conditions for the offer
    discount = @offers.sum { |offer| offer.apply_offer(@cart_items) }

    # calculate the discount before getting the delivery fee
    discounted_total = cart_subtotal - discount

    #calculate delivery feebased on the discounted price
    delivery_fee = @delivery_charge_rules.delivery_rate(discounted_total)

    format_result(discounted_total + delivery_fee)
  end

  def format_result(total)
    formatted_result = (total * 100).floor / 100.0
    "$#{formatted_result}"
  end
end


