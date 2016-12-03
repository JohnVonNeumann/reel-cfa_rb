class Order < ApplicationRecord
  enum pay_type: {
    "Bitcoin" => 0,
    "Credit Card" => 1,
  }
end
