# frozen_string_literal: true

require_relative '../basket'

RSpec.describe Offer do
  let(:offers) do
    [
      Offer.new(
        { discount_type: :buy_one_get_one_half_price, product_code: 'R01', discount_rate: 0.5 }
      )
    ]
  end

  let(:catalog) do
    [
      Product.new('Red Widget', 'R01', 32.95),
      Product.new('Green Widget', 'G01', 24.95),
      Product.new('Blue Widget', 'B01', 7.95)
    ]
  end

  describe Offer do
    let(:offer) { offers.first }
    let(:valid_product) { catalog.find { |product| product.code == 'R01' } }
    let(:invalid_product) { catalog.find { |product| product.code == 'G01' } }
    it 'returns zero discount for a valid product' do
      cart_items = [valid_product]
      expect(offer.apply_offer(cart_items)).to eq(0)
    end

    it 'returns the right discount for two valid products' do
      cart_items = [valid_product, valid_product]
      expect(offer.apply_offer(cart_items).round(2)).to eq(16.48)
    end

    it 'returns zero discount for invalid products' do
      cart_items = [invalid_product, invalid_product]
      expect(offer.apply_offer(cart_items).round(2)).to eq(0)
    end
  end
end
