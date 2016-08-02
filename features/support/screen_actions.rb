class ScreenActions

  include RSpec::Matchers

  def expectation_error
    RSpec::Expectations::ExpectationNotMetError
  end

  def assets_element_was_not_found
    Selenium::WebDriver::Error::NoSuchElementError || Selenium::WebDriver::Error::InvalidSelectorError
  end

  def assert_raise_message
    "Can't find element : "
  end

  def field_req_error_message(error_message)

    $driver.find_element(:xpath, "//span[contains(text(),'#{error_message}')]")
  end

  def button_name(button_name)
    begin
      $wait.until { $driver.find_element(:xpath, "//button[text()= '#{button_name}']") }
    rescue
      raise assets_element_was_not_found
    end
  end

  def button_value(button_name)
    if button_name == 'Search'
      visible_button = []
      buttons = $wait.until { $driver.find_elements(:xpath, "//*[@value = '#{button_name}']") }
      puts buttons.size
      for i in buttons
        if i.displayed?
          visible_button.push(i)
        end
      end
      return visible_button[0]
    else
      begin
        $wait.until { $driver.find_element(:xpath, "//*[@value = '#{button_name}']") }
      rescue
        raise assets_element_was_not_found
      end
    end
  end

  def link_name(link_name)
    $driver.find_element(:link_text, "#{link_name}")
  end

  def page_verification(page_name)
    if page_name == "My Account"
      expect(my_account_page.page_title). to eq(page_name.upcase)
      expect(my_account_page.section_titles_act).to eq(my_account_page.section_titles_req)

    elsif page_name == "Home page"
      expect(page_header.logo_image).to be_truthy
      expect(page_header.button_value("Search")).to be_truthy

    elsif page_name == "Sign In"
      expect(sign_in_page.signin_page_title).to be_truthy

    elsif page_name == "Forgot Password"
      expect(sign_in_page.forgot_page_elements).to be_truthy
      expect(sign_in_page.page_title).to eq(page_name.downcase)

    elsif page_name == 'Reset Password'
      expect(sign_in_page.page_title).to eq("reset instructions sent")

    end
  end

  def header_icon(icon_name)
    begin
      $wait.until { $driver.find_element(:xpath, "//span[contains(text(), '#{icon_name}')]") }
    rescue
      raise assets_element_was_not_found + "#{icon_name}"
    end
  end


    def click
      begin
        base_click
      rescue Selenium::WebDriver::Error::ElementNotVisibleError
        location_once_scrolled_into_view
        base_click
      end
    end

  def chat_popup_close
     popup = $driver.find_elements(:xpath, "//div[@class = 'lhnInviteContainer']")
  if popup.count > 0
    $driver.find_element(:xpath, "//a[@class = 'LHNInviteCloseButton']").click
  end
  end


end