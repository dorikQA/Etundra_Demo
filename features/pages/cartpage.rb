class CartPage
  def proceed_checkout_button
    elements = $driver.find_elements(:xpath, "//button[contains(text(), 'Proceed to Checkout')]")
    return elements[0]
    #
    # elements2 = []
    # elements.each do |element|
    #   if element.displayed?
    #     elements2 << element
    #   end
    # end
    # return elements2[0]
  end
  def coupon_code_header
    $driver.find_element(:xpath, "//h3[contains(text(), 'Coupon Code')]")
  end

end