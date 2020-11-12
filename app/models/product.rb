class Product < ApplicationRecord
  def product_tax
    tax = price * 0.09
  end

  def is_discounted
   if price < 10
      return true
   else
     return false
   end
  end

  def total
    tax = price * 0.09
    total = price + tax
    "Price for computer: $#{price}, tax at 9%: $#{tax}. Total cost for computer including tax is $#{total}"
  end

end
