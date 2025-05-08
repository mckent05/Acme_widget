class Offer
  def initialize(discount_terms)
    @discount_terms = discount_terms
  end

  def apply_offer(cart_items)
    cart_items_discount = 0
    if @discount_terms[:discount_type] == :buy_one_get_one_half_price
      product_code = @discount_terms[:product_code]
      if product_code == "R01"
        items = cart_items.filter { |cart_item| cart_item.code == product_code }
        cart_items_discount = (items.count / 2 ) * (@discount_terms[:discount_rate].to_f * items[0].price)
      end
    end
  end
end