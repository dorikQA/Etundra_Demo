require_relative 'page_header'
require_relative 'list_items_page'


class ItemPage < ScreenActions


  def item_full_name
    $driver.find_elements(:xpath, "//span[@class = 'product-fullname']")
  end

  def item_brandname
    $driver.find_elements(:xpath, "//span[@class = 'product-brandname']")
  end

  def product_code
    $driver.find_element(:xpath, "//span[@class = 'product-brandcode']")
  end

  def item_sku
    $wait.until { $driver.find_element(:xpath, "//span[@itemprop = 'sku']") }
  end

  def item_price
    $driver.find_element(:xpath, "//span[@class = 'actual '][./span[@class = 'description']]/span[@class = 'amount']")
  end

  def items_prices
    $driver.find_element(:xpath, "//span[@class = 'amount']")
  end

#***********************************************************************************************************************


  def mybuys_relatedproducts_itemprices
    $driver.find_elements(:xpath, "//div[@class = 'related mybuys-container']//span[@class = 'amount']")
  end

  def mybuys_relatedproducts_itemnames
    $driver.find_elements(:xpath, "//div[@class = 'related mybuys-container']//span[@class = 'product-fullname']")
  end

  def mybuys_relatedproducts_addtocart
    $driver.find_elements(:xpath, "//div[@class = 'related mybuys-container']//div[@class = 'addtocart']")
  end

  def mybuys_relatedproducts_addtocart_qty
    $driver.find_elements(:xpath, "//div[@class = 'related mybuys-container']//input[@class = 'quantity form-control']")
  end

  def mybuys_relatedproducts_sku
    $driver.find_elements(:xpath, "//div[@class = 'related mybuys-container']//div[@class = 'product-sku']")
  end

end

#***********************************************************************************************************************

def mybuys_alsobought_itemprices
  $driver.find_elements(:xpath, "//div[@class = 'also-bought mybuys-container']//span[@class = 'amount']")
end

def mybuys_alsobought_itemnames
  $driver.find_elements(:xpath, "//div[@class = 'also-bought mybuys-container']//span[@class = 'product-fullname']")
end

def mybuys_alsobought_addtocart
  $driver.find_elements(:xpath, "//div[@class = 'also-bought mybuys-container']//div[@class = 'addtocart']")
end

def mybuys_alsobought_addtocart_qty
  $driver.find_elements(:xpath, "//div[@class = 'also-bought mybuys-container']//input[@class = 'quantity form-control']")
end

def mybuys_alsobought_sku
  $driver.find_elements(:xpath, "//div[@class = 'also-bought mybuys-container']//div[@class = 'product-sku']")
end


#***********************************************************************************************************************

def mybuys_alsobought_itemprices

end
