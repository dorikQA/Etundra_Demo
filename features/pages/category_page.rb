require_relative 'page_header'
require_relative 'item_page'


class CategoryPage < ScreenActions

# def pagetitle(pagetitle)
#   begin
#     $wait.until {$driver.find_element(:xpath,"//div[@class = 'page-title ']/*[contains(text(), '#{pagetitle}')]")}
#   rescue
#     raise assert_raise_message + (pagetitle)
#   end
# end

  def pagetitle
    begin
      $wait.until { $driver.find_element(:xpath, "//div[@class = 'page-title ']/*") }
    rescue
      raise assert_raise_message
    end
  end


#***********************************************
end