require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'
require 'pry'
require 'rspec'
require 'rspec/expectations'
require 'timeout'
require 'faker'

# $driver = Selenium::WebDriver.for :firefox
# $driver.get $basicurl
# $driver.manage.window.maximize
$dropdown = Selenium::WebDriver::Support::Select
$wait = Selenium::WebDriver::Wait.new(:timeout => 15)
$delete_cookies = Selenium::WebDriver::Options.new(:delete_all_cookies)
#
def page_header
  @page_header ||= PageHeader.new
end

def list_items_page
  @list_items_page ||= ListItemsPage.new
end

def item_page
  @item_page ||= ItemPage.new
end

def category_page
  @category_page ||= CategoryPage.new
end

def facet_menu
  @facet_menu ||= FacetMenu.new
end

def brand_page
  @brand_page ||= BrandPage.new
end

def sign_in_page
  @sign_in_page ||= SignInPage.new
end

def screen_actions
  @screen_actions ||= ScreenActions.new
end

def fake_data
  @fake_data ||= FakeData.new
end

def my_account_page
  @my_account_page ||= MyAccountPage.new
end
def my_buys
  @my_buys ||= MyBuys.new
end
def home_page
  @home_page ||= HomePage.new
end
def cartpage
  @cartpage ||= CartPage.new
end
def checkout_page
  @checkout_page ||= CheckoutPage.new
end
