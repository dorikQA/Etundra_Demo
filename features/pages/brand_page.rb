require_relative 'page_header'
require_relative 'item_page'


class BrandPage < ScreenActions

  def page_title
    begin
      $wait.until { $driver.find_element(:xpath, "//div[@class = 'page-title ']/*") }
    rescue
      raise assert_raise_message
    end
  end


end