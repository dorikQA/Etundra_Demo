class HomePage < ScreenActions

  def trending_items_list
   list = $driver.find_elements(:xpath, "//div[@class = 'list-overlay addtocart']")
   # trending__items = []
   # list.each do |item|
   #   if item.displayed?
   #     trending__items << item
   #   end
   # end
  end

  def trendingitem_addtocart
    buttons = $wait.until {buttons =  $driver.find_elements(:xpath, "//div[@class = 'slick-list draggable']//button")}
   #  puts buttons.count
   #  #displayed_buttons = []
   #  buttons.each do |button|
   #    if button.displayed?
   #      button.click
   #      #displayed_buttons << button
   #    end
   #  end
   # #  puts displayed_buttons.count
   # # return displayed_buttons[0]
  end

  def trending_items_header
    $driver.find_element(:xpath,"//h2[contains(text(),'Trending Items')]")

  end





###########
end