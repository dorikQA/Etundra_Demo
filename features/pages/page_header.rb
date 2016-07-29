require_relative 'item_page'


class PageHeader < ScreenActions

  def category_name(category_name)
    begin
      $driver.find_element(:xpath, "//div[@class = 'mnu-group hzof-items' ]//span[text() = '#{category_name}']")
    rescue assets_element_was_not_found
      raise assert_raise_message + (category_name)
    end
  end

  def logo_image
    begin
      logo = $wait.until { $driver.find_element(:xpath, "//div[@class = 'logo-header row']") }
    rescue
      raise assert_raise_message + "#{logo}"
    end
  end


  def searchfield
    $driver.find_element(:xpath, "//input[@class = 'form-control valid' and contains(@placeholder,'Product name')]")
  end

  ####################################

  def account_icon_option(popover_option)
    $driver.find_element(:xpath, "//span[@class = 'menu-label' and text() = '#{popover_option}']")
  end

  def account_popover_close_button
    $wait.until { $driver.find_element(:xpath, "//button[@class = 'close']") }

  end

  def account_popover_header
    elements = $wait.until { $driver.find_elements(:xpath, "//div[@class = 'popover-header']") }
    puts elements.count

    # if elements.count > 0
    #   elements.each {|i| push(i.displayed? == true) }
    # end
    # return elements

  end

  # def account_popup_verification
  #   $wait.until {$driver.find_elements(:xpath, "//div[@class = 'popover-header']")}
  #
  # end
  def account_popover_title(title)
    $driver.find_element(:xpath, "//div[@class = 'popover-header']/h3")
  end

  def myaccount_links(link_name)
    begin
      $wait.until { $driver.find_element(:xpath, "//ul[@class = 'menu']//span[@class = 'menu-label' and text() = '#{link_name}']") }
    rescue
      raise "Fuck"
    end
  end

  def sign_in_link
    $wait.until { $driver.find_element(:xpath, "//ul[@class = 'menu']//span[@class = 'menu-label' and text() = 'Sign In']") }

  end

  def my_account_link
    $wait.until { $driver.find_element(:xpath, "//ul[@class = 'menu']//span[@class = 'menu-label' and text() = 'My Account']") }

  end

  def user_name
    $driver.find_element(:xpath, "//div[@class = 'user-info']/span[2]")
  end

  def header_category_subcategories(category_name)
    $wait.until {$driver.find_elements(:xpath, "//div[@class = 'mnu-item hzof-item'][.//span[text() = '#{category_name}']]//div/a")}
  end

  def header_subcategories_qty(category_name)
    @@header_subcategories_qty = page_header.header_category_subcategories(category_name).count
  end

  def cart_icon
   $driver.find_element(:id, 'quickcart')
  end

  # def search_button
  #   $driver.find_element(:xpath,"//div[@class = 'input-group']//span[@class = 'input-group-btn']")
  # end

  # def account_icon
  #   begin
  #     account_icon = $wait.until { $driver.find_element(:xpath,"//div[@class = 'mnu mnu-account']")}
  #   rescue
  #     raise assets_element_was_not_found + "#{account_icon}"
  #   end
  # end
  ######################
end
