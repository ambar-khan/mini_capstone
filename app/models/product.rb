class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :price, numericality: { :greater_than_or_equal_to => 0 }
  validates :description, length: { in: 10..500}
  belongs_to :supplier
  has_many :images
  has_many :orders
  
  def tax
    price * 0.09
  end

  # def is_discounted
  #   price < 1000
  # end

  def total
    tax = price * 0.09
    total = price + tax
    "Price for computer: $#{price}, tax at 9%: $#{tax}. Total cost for computer including tax is $#{total}"
  end

end
