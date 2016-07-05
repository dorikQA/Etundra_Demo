class SignInPage < ScreenActions
  include RSpec::Matchers

  # def sign_in_page_title
  #   $driver.find_elements(:xpath, "//div[contains(@class, 'ection-head')]")
  # end

  def sign_in_title
    $driver.find_element(:xpath, "//div[@class = 'signin-welcome']/h2").text.downcase
  end

  def sign_in_email_field
    $driver.find_element(:id, "EmailAddress")
  end

  def sign_in_password
    $driver.find_element(:id, "Password")
  end

  def remeber_me_button
    $driver.find_element(:id, "RememberMe")
  end

  def register_firstname
    $driver.find_element(:xpath, "//form[@class = ' register-form']//*[@id = 'FirstName']")

  end

  def register_lastname
    $driver.find_element(:id, "LastName")
  end

  def register_email
    $driver.find_element(:id, "Email")
  end

  def register_phonenumber

    $driver.find_element(:xpath, "//form[@class = ' register-form']//*[@id = 'PhoneNumber']")
  end

  def resister_pass
    $driver.find_element(:xpath, "//form[@class = ' register-form']//*[@id = 'Password']")
  end

  def register_retype_pass
    $driver.find_element(:id, "PasswordConfirm")
  end

  def register_companytype_dropdown
    $driver.find_element(:id, "SelfDescription")
  end

  def register_companyname
    $driver.find_element(:id, "CompanyName")
  end

  def register_cancel
    $driver.find_element(:xpath, "//a[@class = 'btn btn-default' and text() = 'Cancel']")
  end

  def signup_popup_close
    popup = $driver.find_elements(:xpath, "//div[@class = 'popup-overlay']")
    $driver.find_element(:xpath, "//img[contains(@id, 'popup-subcription-closes-icon')]").click if popup.count > 0
  end

  def bissness_types
    $driver.find_elements(:xpath, "//select[@id = 'SelfDescription']//option")
  end

  #**************************

  #signin, forgot page, reset password

  def description_text_act
    $driver.find_element(:xpath, "//div[contains(@class, 'signin-welcome')]/p").text
  end

  def signin_page_title
    $driver.find_element(:xpath, "//div[contains(@class, 'signin-welcome')]/h2")
  end

  def page_title
    $driver.find_element(:xpath, "//div[contains(@class, 'signin-welcome')]/h1").text.downcase
  end

  def reset_page_email
    $driver.find_element(:xpath, "//div[contains(@class, 'signin-welcome')]/b")
  end

  def forgot_pass_email
    $driver.find_element(:xpath, "//div[@class = 'email form-group ']//input[@id = 'EmailAddress']")
  end

  def forgot_page_elements
    $wait.until { screen_actions.button_value('Reset Password') }
    $wait.until { screen_actions.link_name("Return to Login") }


  end
  def forgot_page_text_act
    $driver.find_element(:xpath, "//div[@class = 'need-help form-group']/*").text
  end

  def forgot_page_text_req
     "Need help? Chat now or call 1-888-388-6372"
  end

  def reset_pass_text_req(valid_email)
    text = "An e-mail has been sent to " + "'#{valid_email}'" + ". To finish resetting your password, please follow the instructions contained in the email."
    # text1 = "An e-mail has been sent to"
    # text2 = "To finish resetting your password, please follow the instructions contained in the email"
    # # text = [text1, valid_email, text2]
    # # text.join(" ").to_str
    # # return text

  end

  def bissness_dropdown
    $driver.find_element(:xpath, "//select[@name = 'SortingAttribute']")
  end

  def sign_in_welcome_text_req
    'Log in with an existing account - If you have purchased from eTundra.com and have previously created a password protected account, please sign in below'.downcase
  end

  def sign_in_title_req
    'Sign In'.downcase
  end

  def register_title_act
    $driver.find_element(:xpath, "//div[@class = 'register-welcome']/h2").text.downcase
  end

  def reg_new_customer_text_act
    $driver.find_element(:xpath, "//div[@class = 'register-welcome']/p").text
  end

  def reg_new_customer_text_req
    "Create an account and become a VIP member today! As a VIP member, you’ll receive Loyalty Credits to be used on future purchases, have easy access to your account and order details, and you’ll be the first to find out about special offers and pricing."
  end

  def reg_new_account_text_req
    text1 = "Create an account and become a VIP member today!"
    text2 = "As a VIP member you’ll receive:"
    text = [text1, text2]
  end

  def reg_new_account_text_act
    text = $driver.find_elements(:xpath, "(//div[@class = 'register-welcome']/p)")
    text.map! { |text| text.text.strip }
  end

  def reg_new_account_bullets_act
    bullets = $driver.find_elements(:xpath, "//div[@class = 'register-welcome']//li[contains(text(), *)]")
    bullets.map! { |bullet| bullet.text.strip }
  end

  def reg_new_account_bullets_req
    bullet1 = 'Loyalty Credits to be used on future purchases'
    bullet2 = 'Easy access to your account and order details'
    bullet3 = 'Be the first to find out about special offers and pricing'
    bullets_req = [bullet1, bullet2, bullet3]
  end


  # def register_field(register_field)
  #   $driver.find_element(:xpath,"//form[@class = ' register-form']//input[@id = '#{register_field}]")
  # end

  # def sign_in_button
  #   $driver.find_element(:xpath, "//button[@class = 'btn btn-primary' and text() = 'Sign In']")
  # end
  # def forgot_pass_link
  #   $driver.find_element(:link_text, "Forgot your password?")
  # end
  # def reset_button
  #   $driver.find_element(:xpath, "//*[@value = 'Reset Password']")
  # end

  # def forgot_pass_link
  #   $driver.find_element(:link_text, "Forgot your password?")
  # end
  # def return_to_login_link
  #   $driver.find_element(:xpath,"//*[text()= 'Return to Login']")
  # end
  #def register_button
  #   $driver.find_element(:xpath, "//button[@class = 'btn btn-primary' and text() = 'Register']")
  # end
  # def reset_message_title(page_title)
  #  $driver.find_element(:xpath, "//div[contains(@class, 'signin-welcome')]/h1")
  # end
  # def forgot_pass_title
  #   $driver.find_element(:xpath, "//div[contains(@class, 'signin-welcome')]/h1")
  # end
  #**********************

end