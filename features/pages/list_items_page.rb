require_relative 'page_header'
require_relative 'item_page'

class ListItemsPage < ScreenActions
  def products_prices
    begin
      products_price = $wait.until { $driver.find_elements("//span[@class = 'amount']") }
    rescue
      raise assert_raise_message
    end
    puts products_price.length
  end

  def products_images
    begin
      products_image = $wait.until { $driver.find_elements("//img[@class = 'grid-image img-responsive']") }
    rescue
      raise assert_raise_message
    end
    products_images = []
    products_image.each do |image|
      if image.displayed?
        products_images << image
      end
    end
  end

  def products_sku
    begin
      $wait.until { $driver.find_elements("//div[@class = 'product-sku']") }
    rescue
      raise assert_raise_message
    end
  end

  def products_names
    begin
      products_name = $wait.until { $driver.find_elements(:xpath, "//span[@class = 'product-fullname']") }
    rescue
      raise assert_raise_message
    end
    products_names = []
    products_name.each do |name|
      if name.displayed?
        products_names << name
      end
    end
  end

#***********************************************************************************************************************

  def no_result
    begin
      $driver.find_element(:id, "sli_noresult")
    rescue
      raise assert_raise_message
    end
  end

  def qty_product_found
    begin
      $wait.until { $driver.find_element(:xpath, "//div[@class = 'products-found']/span[@class = 'badge']") }
    rescue
      raise assert_raise_message
    end
  end

  def productsfound
    begin
      $wait.until { $driver.find_element(:xpath, "//div[@class = 'products-found']/span[2]") }
    rescue
      raise assert_raise_message
    end
  end

end