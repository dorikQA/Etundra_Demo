class CheckoutPage < ScreenActions

  def checkout_headers
  titles = $driver.find_elements(:xpath,"//span[@class= 'panel-title checkout-panel-header']")
  titles.map! {|x| x.text}
   titles.each do |x|
     puts x
   end
  end

  def placeorder_buttons
  $driver.find_elements(:xpath,"//button[contains(text(), 'PLACE YOUR ORDER')]")
  end

  def whathappens_text_req
    "When clicking \"Proceed to secure payment\" you will be directed to a secure payment page where you will be asked to enter payment information."
  end
  def whathappens_text_act
    $driver.find_element(:xpath, "//span[@class = 'checkout-summary-body']").text

  end


end