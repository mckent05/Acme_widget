# frozen_string_literal: true

class DeliveryRules
  def delivery_rate(total)
    return 4.95 if total < 50
    return 2.95 if total < 90

    0
  end
end
