class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  enum pay_type: {
    "Bitcoin" => 0,
    "Credit Card" => 1,
  }

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
