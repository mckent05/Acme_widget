# frozen_string_literal: true

require_relative '../product'

RSpec.describe Product do
  describe Product do
    it 'initiliazes product correctly with name, code , and price' do
      product = Product.new('Green Widget', 'G01', 24.95)

      expect(product.name).to eq('Green Widget')
      expect(product.price).to eq(24.95)
      expect(product.code).to eq('G01')
    end
  end
end
