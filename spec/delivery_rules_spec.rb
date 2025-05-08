# frozen_string_literal: true

require_relative '../basket'

RSpec.describe DeliveryRules do
  let(:delivery) { DeliveryRules.new }

  describe DeliveryRules do
    it 'returns the correct delivery rate based on the price' do
      expect(delivery.delivery_rate(20)).to eq(4.95)
      expect(delivery.delivery_rate(49.9999)).to eq(4.95)
      expect(delivery.delivery_rate(89.9999)).to eq(2.95)
      expect(delivery.delivery_rate(90)).to eq(0)
    end
  end
end
