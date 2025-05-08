# frozen_string_literal: true

require_relative '../basket'

RSpec.describe Basket do
  let(:catalog) do
    [
      Product.new('Red Widget', 'R01', 32.95),
      Product.new('Green Widget', 'G01', 24.95),
      Product.new('Blue Widget', 'B01', 7.95)
    ]
  end

  let(:offers) do
    [
      Offer.new(
        { discount_type: :buy_one_get_one_half_price, product_code: 'R01', discount_rate: 0.5 }
      )
    ]
  end

  let(:basket) { Basket.new(catalog, offers) }

  describe Basket do
    it 'adds a valid product to the cart' do
      basket.add('R01')
      basket.add('R01')

      expect(basket.cart_items.count).to eq(2)
    end

    it 'does not add an invalid product to the cart' do
      basket.add('R02')
      basket.add('R02')

      expect(basket.cart_items.count).to eq(0)
    end

    it 'calculates the correct cost for B01, G01' do
      %w[B01 G01].each { |code| basket.add(code) }

      expect(basket.total).to eq('$37.85')
    end

    it 'calculates the correct cost for R01, R01' do
      %w[R01 R01].each { |code| basket.add(code) }

      expect(basket.total).to eq('$54.37')
    end

    it 'calculates the correct cost for R01, G01' do
      %w[R01 G01].each { |code| basket.add(code) }

      expect(basket.total).to eq('$60.85')
    end

    it 'calculates the correct cost for R01, R01, R01, B01, B01' do
      %w[R01 R01 R01 B01 B01].each { |code| basket.add(code) }

      expect(basket.total).to eq('$98.27')
    end
  end
end
