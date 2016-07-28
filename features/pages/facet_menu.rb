require_relative 'page_header'
require_relative 'item_page'

class FacetMenu < ScreenActions

  def questioncircle(special_row)
    begin
      $wait.until { $driver.find_element(:xpath, "//li[a[contains(text(), '#{special_row}')]]//span[contains(@class, 'fa-question-circle')]") }
    rescue
      raise assert_raise_message + special_row
    end
  end

  def facet_subcategory(facet_subcategory)
    begin
      $wait.until { $driver.find_element(:xpath, "//div[@class = 'navigation-group panel panel-default']//a[contains(text(), '#{facet_subcategory}')]") }
    rescue assets_element_was_not_found
      raise assert_raise_message + (facet_subcategory)
    end
  end

  def special_row(special_row)
    begin
      $wait.until { $driver.find_element(:xpath, "//div[@class = 'cat-nav panel-collapse specials collapse in']//a[contains(text(), '#{special_row}')]") }
    rescue
      if assets_element_was_not_found
        raise assert_raise_message + (special_row)
      end
    end
  end

  def special_item_qty(special_row)
    begin
      $wait.until { $driver.find_element(:xpath, "//div[@class = 'cat-nav panel-collapse specials collapse in']//a[contains(text(), '#{special_row}')]/span[@class = 'count']").text.gsub!(/[()]/, "") }
    rescue
      raise assert_raise_message + (special_row)

    end
  end

  def tooltip
    sleep 2
    begin
      tooltip = $wait.until { $driver.find_element(:xpath, "//div[@role = 'tooltip']") }
      tooltip.text.downcase
    rescue
      raise assert_raise_message + 'tooltip message'
    end
  end

  def quickshipplustip_req
    quickshipplustip = 'QUICK SHIP PLUS items have been carefully curated as quick-moving, must-have products and are stocked in our Colorado warehouse. These items typically ship out same day Monday through Friday (excluding holidays) when the order is placed before 4:30 PM Mountain Time.'.downcase
  end

  def stockedtip_req
    stockedtip = 'STOCKED items typically ship out same day Monday through Friday (excluding holidays) when the order is placed before 4:30 PM Mountain Time.' 'STOCKED items typically ship out same day Monday through Friday (excluding holidays) when the order is placed before 4:30 PM Mountain Time.'.downcase
  end
  #*********************************************************
  def subcategories_links
    $wait.until{$driver.find_elements(:xpath,("//div[@class = 'cat-nav panel-collapse sub-categories collapse in']//a"))}

  end

  def brands_links
    $wait.until{$driver.find_elements(:xpath,("//div[@class = 'cat-nav panel-collapse brands collapse in']//a"))}
  end


end