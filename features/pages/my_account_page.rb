class MyAccountPage
  def page_title
    $driver.find_element(:xpath, "//div[@class = 'row myaccount-header']").text
  end
  def my_account_details_title
    $driver.find_element(:xpath, "//span[@class = 'myaccount-panel-header' and text() = 'My Account Details']").text
  end
  def my_order_history_title
    $driver.find_element(:xpath, "//span[@class = 'myaccount-panel-header' and text() = 'My Order History']").text
  end
  def  my_freq_purchased_title
    $driver.find_element(:xpath, "//span[@class = 'myaccount-panel-header' and text() = 'My Frequently Purchased']").text
  end

  def my_loyalty_program_title

    $driver.find_element(:xpath, "//span[@class = 'myaccount-panel-header-loyalty' and text() = 'My Frequently Purchased']")

  end
  def titles
   titles = $driver.find_elements(:xpath, "//span[contains(@class, 'myaccount-panel-header')]")
    titles.map! {|x| x.text}
  end

def section_titles_act
  section1 = $driver.find_element(:xpath, "//span[@class = 'myaccount-panel-header' and text() = 'My Account Details']").text
  section2 = $driver.find_element(:xpath, "//span[@class = 'myaccount-panel-header' and text() = 'My Order History']").text
  section3 = $driver.find_element(:xpath, "//span[@class = 'myaccount-panel-header' and text() = 'My Frequently Purchased']").text
  section4 = $driver.find_element(:xpath, "//span[@class = 'myaccount-panel-header-loyalty' and text() = 'My Loyalty Program']").text
  section_titles_act = [section1, section2, section3, section4]
end
  def section_titles_req
    section_titles_req = ['My Account Details','My Order History','My Frequently Purchased','My Loyalty Program']
  end
  def user_name
    $driver.find_element(:xpath,"//div[@class= 'form-group'][1]//span[2]").text.chomp("!")
  end
  def user_email
    $driver.find_element(:xpath,"//div[@class= 'form-group'][2]//span[2]").text
  end
  def account_name
    $driver.find_element(:xpath,"//div[@class= 'form-group'][3]//span[2]").text
  end

  def my_accound_expand_details(section_name)
    if section_name == "My Accounts Detail"
      $driver.find_element(:id, "account-details-info-link")
    elsif section_name == "My Loyalty Program "
      $driver.find_element(:id, "loyalty-info-link")
    elsif section_name == "My Order History"
      $driver.find_element(:id, "order-history-info-link")
    elsif section_name == "My Frequently Purchased"
      $driver.find_element(:id, "freq-purch-items-info-link")
    end
  end

end