Given(/^Open "([^"]*)" site$/) do |url|
  $driver.get url

end

Then /^Verify that menu contains categories:$/ do |categories_table|
  categories_table.raw.flatten.each do |category_name|
    category = page_header.category_name(category_name)
    $driver.mouse.move_to category
  end
end

And(/^Click on category "([^"]*)"$/) do |category_name|
  page_header.category_name(category_name).click
  $driver.mouse.move_to page_header.logo_image

end
Then /^Verify that user on "([^"]*)" page$/ do |brandname|
  expect(brand_page.page_title.text.downcase).to eq(brandname.downcase)
end
Then /^Verify that user located on "([^"]*)" page$/ do |pagetitle|
  expect(category_page.pagetitle.text.downcase).to eq(pagetitle.downcase)
end

Then /^Verify facet menu contains facet subcategory$/ do |facet_subcategories|
  facet_subcategories.raw.flatten.each do |facet_subcategory|
    facet_menu.facet_subcategory(facet_subcategory)
  end
end

Then(/^Verify this category "Specials" includes "([^"]*)" items$/) do |special_row|
  facet_menu.special_row(special_row)
end
#
Then /^Verify "([^"]*)" displays quantity of available items$/ do |special_row|
  qty = facet_menu.special_item_qty(special_row)
  if qty.to_i == 0
    fail "Facet doesn't has items.  #{special_row}"
  end
end
Then /^When user move mouse to \? mark "([^"]*)" pop over message displayed$/ do |special_row|
  $driver.mouse.move_to facet_menu.questioncircle(special_row)
  tooltip = facet_menu.tooltip
  expect(tooltip).to be_truthy
  if special_row == "Quick Ship Plus"
    expect(tooltip).to eq (facet_menu.quickshipplustip_req)
  elsif special_row == "Stocked"
    expect(tooltip).to eq (facet_menu.stockedtip_req)
  end
end

Then(/^Click search button$/) do
  page_header.search_button.click
end
Then(/^Enter "([^"]*)" to search field$/) do |product_name|
  page_header.searchfield.send_keys product_name
end
And(/^Verify the title of page display "([^"]*)" page displays correct product name sections$/) do |product_name|
  fail("Page title doesn't match search example") if brand_page.page_title.text.downcase != product_name
end
And(/^Search result should display qty products found$/) do
  qty = list_items_page.qty_product_found
  productsfound = list_items_page.productsfound
  puts qty.text + " " + productsfound.text
end
Then(/^Message "([^"]*)" should be displayed of no products found$/) do |message|

  if list_items_page.qty_product_found.text.to_i == 0
    puts list_items_page.no_result.text
    expect(list_items_page.no_result.text).to include(message)
    # expect(page_header.no_result.should include(message)).to raise_error(RSpec::Expectations::ExpectationNotMetError)
  end
end

And(/^Verify item title contains "([^"]*)"$/) do |itemcode|

  #puts item_page.product_code.text
  expect(item_page.product_code.text).to eq(itemcode)
end

And(/^Press "Enter" on keyboard$/) do
  $driver.action.send_keys(:enter).perform
end

Then(/^Verify page correct "([^"]*)" item page opens$/) do |sku|
  expect(item_page.item_sku.text).to eq(sku)
end

Then(/^"My account" popover should popup$/) do
  expect(page_header.account_popover).to be
end
Then(/^Verify popover title is "([^"]*)"$/) do |title|
  expect(page_header.account_popover_title.text).to eq(title)

end
Then /^Close My Account pop over$/ do

  close_button = $driver.find_element("//div[@class = 'popover-header']/button")
  $driver.mouse.move_to close_button
  #page_header.account_popover_close_button.click
end
Then /^Verify My Account popover closed$/ do
  expect($driver.find_element("//div[@class = 'popover-header']")).to be false
  #expext(page_header.account_popover).to be false
end
Then /^"My account" popover contains links:$/ do |accountlinks|
  accountlinks.raw.flatten.each do |linkname|
    linkname = page_header.myaccount_links(linkname)
    $driver.mouse.move_to linkname
  end
end
Then /^Tap to close My Account button$/ do
  page_header.account_popover_close_button.click
  # expect(close_button.displayed?).to be true, "expected button to be displayed, got #{close_button.inspect}'"
end

Then /^Verify My Account popup was closed$/ do
 expect(page_header.account_popover_header.count).to be == 0
end

Then(/^Click on "([^"]*)" icon$/) do |icon_name|
  sleep 5
  $driver.mouse.move_to page_header.header_icon(icon_name)

  page_header.header_icon(icon_name).click
  $driver.mouse.move_to page_header.logo_image
end

Then /^Click "([^"]*)" link$/ do |link_name|
  page_header.link_name(link_name).click
end

Then(/^Enter email "([^"]*)"$/) do |email|
  sign_in_page.sign_in_email_field.send_keys email
end
And(/^Enter valid password "([^"]*)"$/) do |password|
  sign_in_page.sign_in_password.send_keys password
end
Then /^Tap "([^"]*)" button$/ do |button_name|
  element =  $driver.find_element(:id,"menu-primary-section").click
  # $driver.mouse.move_to element
  # element.click
 sign_in_page.button_name(button_name).click
end
Then /^Verify "Sign In" side title and text$/ do
  expect(sign_in_page.sign_in_title).to eq(sign_in_page.sign_in_title_req)
  expect(sign_in_page.description_text_act.downcase).to include(sign_in_page.sign_in_welcome_text_req.downcase)
end

Then /^Verify "([^"]*)" or "([^"]*)" side title and register text$/ do |name1, name2|

  register_title_act = sign_in_page.register_title_act

  if register_title_act == name2.downcase
    expect(sign_in_page.reg_new_customer_text_act).to eq(sign_in_page.reg_new_customer_text_req)
  elsif register_title_act == name1.downcase
    expect(sign_in_page.reg_new_account_text_act).to match_array(sign_in_page.reg_new_account_text_req)
    expect(sign_in_page.reg_new_account_bullets_act).to match_array(sign_in_page.reg_new_account_bullets_req)
  end
end

Then /^Verify "([^"]*)" displayed$/ do |username|
  username_act = page_header.user_name.text
  expect(username_act).to eq(username)
end

And /^Tap "([^"]*)" link$/ do |link_name|
  sign_in_page.link_name(link_name).click
end

Then(/^Verify error message "([^"]*)" displayed$/) do |error_message|

  sign_in_page.field_req_error_message(error_message)
end

Then /^Enter "([^"]*)" for resetting password$/ do |email|
  sign_in_page.forgot_pass_email.clear
  sign_in_page.forgot_pass_email.send_keys(email)
end

Then /^Press "([^"]*)" button$/ do |button_name|
  screen_actions.button_value(button_name).click
end

Then /^ Verify page notifies user that email is not associated$/ do
  expect
end

Then /^Verify Register account side text$/ do
  sign_in_page.register_text_verification
end

Then /^Enter (First Name|Last Name|Phone Number|Email|Password|Retyped|Company Name)/ do |user_data|

  if user_data == "First Name"
    @firstname = Faker::Name.first_name
    sign_in_page.register_firstname.send_keys @firstname

  elsif user_data == "Last Name"

    sign_in_page.register_lastname.send_keys Faker::Name.last_name

  elsif user_data == "Email"
    sign_in_page.register_email.send_keys Faker::Internet.email

  elsif user_data == "Phone Number"
    sign_in_page.register_phonenumber.send_keys Faker::PhoneNumber.cell_phone

  elsif user_data == "Password"
    @password = Faker::Internet.password
    sign_in_page.resister_pass.send_keys @password

  elsif user_data == "Retyped"
    sign_in_page.register_retype_pass.send_keys @password

  elsif user_data == "Company Name"
    sign_in_page.register_companyname.send_keys Faker::Name.first_name
  end
end

Then /^Verify correct username displayed$/ do
  username_act = page_header.user_name.text
  expect(username_act).to eq(@firstname)
end

Then /^From dropdown select "([^"]*)" company business type$/ do |bussiness_type|

  bisseness_type_drop= $dropdown.new(sign_in_page.register_companytype_dropdown)
  bisseness_type_drop.select_by(:value, "#{bussiness_type}")
end

Then /^Click My Account link?/ do
  page_header.my_account_link.click
end

Then /^Verify user on "([^"]*)" page$/ do |page_name|
  screen_actions.page_verification(page_name)
end

Then /^Tap "([^"]*)" plus button$/ do |section_name|
  my_account_page.my_accound_expand_details(section_name).click
end

Then /^Test "([^"]*)"$/ do |button_name|
  screen_actions.button_value(button_name).click
end

Then /^"([^"]*)" page should display title, correct messages, buttons and "([^"]*)" if required$/ do |page_name, valid_email|
  if page_name == 'Forgot Password'
    sign_in_page.page_verification(page_name)
    expect(sign_in_page.forgot_page_text_act).to eq(sign_in_page.forgot_page_text_req)
  elsif page_name == 'Reset Password'
    sign_in_page.page_verification(page_name)
    expect(sign_in_page.description_text_act).to eq(sign_in_page.reset_pass_text_req(valid_email))
  end
end

Then /^Verify Reset page displayed with correct text and title, "([^"]*)"$/ do |email|
  sign_in_page.verify_reset_page(email)
end

Then /^"([^"]*)" should contains "([^"]*)", "([^"]*)", "([^"]*)", required sections:$/ do |page_name, user_name, email, account_name|


  expect(sign_in_page.page_verification(page_name)).to  be_truthy

  expect(my_account_page.user_email).to eq(email)
  expect(my_account_page.user_name).to eq(user_name)
  expect(my_account_page.account_name).to eq(account_name)


end
Then /^Move mouse to the header "([^"]*)"$/ do |category_name|
  $driver.mouse.move_to page_header.category_name(category_name)
end
Then /^Verify "([^"]*)" pop-window displays subcategories and brands links$/ do |category_name|
  qty =  page_header.header_category_subcategories(category_name).count
  puts qty
end

Then /^Verify left panel "Sub Categories" contains sub-categories$/ do
 leftside_subcategories_qty = facet_menu.subcategories_links.count
  puts  leftside_subcategories_qty
  expect(leftside_subcategories_qty > 0).to be true
end
Then /^Click random "Subcategory" from left panel$/ do
  subcategory  = facet_menu.subcategories_links.sample
  puts  subcategory.text
  puts subcategory.attribute("href")
  subcategory.location_once_scrolled_into_view
  #subcategory.click

end

Then /^Verify page displays items and items have prices, SKU and images$/ do
  expect(list_items_page.products_prices.count > 0).to be true
  expect(list_items_page.products_images.count > 0).to be true
  expect(list_items_page.products_names.count > 0).to be true
  expect(list_items_page.products_sku.count > 0).to be true
end



# Then /^Test$/ do
#  element =  $driver.find_element(:id,"menu-primary-section")
#  $driver.mouse.move_to element
#  element.click
#
#   $driver.find_element(:xpath,"//button[text() = 'Register']").click
#
# end