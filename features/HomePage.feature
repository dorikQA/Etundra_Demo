
Feature: Home page

  Background:
    Given Open "https://www.etundra.com" site
#1
  @smoke
  Scenario: Home Page - Categories menu verification
    Then Verify that menu contains categories:
      | Equipment          |
      | Parts              |
      | Plumbing           |
      | Kitchen            |
      | Dining Room        |
      | Disposables        |
      | Furniture          |
      | Specialty Supplies |
      | Clearance          |
      | Brands             |
#      | More...            |
##2
  @smoke
  Scenario Outline: Filter categories verification - facet menu
    Then Click on category "<category_name>"
    And Verify that user located on "<pagetitle>" page
    Examples:
      | category_name      | pagetitle                                |
      | Equipment          | Restaurant & Food Service Equipment      |
      | Parts              | Restaurant Equipment Parts & Hardware    |
      | Plumbing           | Commercial Plumbing Supplies             |
      | Kitchen            | Kitchen Supplies                         |
      | Dining Room        | Restaurant Dining Room Supplies          |
      | Disposables        | Disposables                              |
      | Furniture          | Restaurant Furniture                     |
      | Specialty Supplies | Specialty Shop Supplies                  |
      | Clearance          | Discount Restaurant Supply and Equipment |
#3
  @smoke
  Scenario Outline: Verify that each category from list below contains required facet filter category
    Then Click on category "<category_name>"
    And Verify facet menu contains facet subcategory
      | Specials       |
      | Sub Categories |
      | Brands         |
      | Pricing        |

    Examples:
      | category_name      |
      | Equipment          |
      | Parts              |
      | Plumbing           |
      | Kitchen            |
      | Dining Room        |
      | Disposables        |
      | Furniture          |
      | Specialty Supplies |
      | Clearance          |
#4
  @smoke
  Scenario Outline: Verification of Quick Ship Plus in Specials and quantity of items
    Then Click on category "<category_name>"
    Then Verify this category "Specials" includes "Quick Ship Plus" items
    And Verify "Quick Ship Plus" displays quantity of available items
    And When user move mouse to ? mark "Quick Ship Plus" pop over message displayed
    Examples:
      | category_name      |
      | Equipment          |
#      | Parts              |
#      | Plumbing           |
#      | Kitchen            |
#      | Dining Room        |
#      | Disposables        |
#      | Furniture          |
#      | Specialty Supplies |
#      | Clearance          |
#  #5

  Scenario Outline: Verification of Stocked Item in Specials and quantity of items
    Then Click on category "<category_name>"
    And Verify this category "Specials" includes "Stocked Item" items
    Then Verify "Stocked Item" displays quantity of available items
    Then When user move mouse to ? mark "Stocked Item" pop over message displayed
    Examples:
      | category_name      |
      | Equipment          |
      | Parts              |
      | Plumbing           |
      | Kitchen            |
      | Dining Room        |
      | Disposables        |
      | Furniture          |
      | Specialty Supplies |
      | Clearance          |
##6

  Scenario Outline: Search by product name functionality
    Then Enter "<product_name>" to search field
    Then Press "Search" button
    And Verify the title of page display "<product_name>" page displays correct product name sections
    And Search result should display qty products found
    Then Message "Search was unable to find any results" should be displayed of no products found
    Examples:
      | product_name |
      | vitamix      |
      | coffee       |
      | parts        |
      | ewfhgkh      |
      | 250          |
#7

  Scenario Outline: Search by product name functionality - verify that some search redirect user to brand page
    Then Enter "<product_name>" to search field
    Then Press "Search" button
    And Verify that user on "<brandname>" page
    Examples:
      | product_name | brandname |
      | cambro       | cambro    |
#8
  @vail
  Scenario Outline: Search by item number functionality
    Then Enter "<item_code>" to search field
    Then Press "Search" button
    And Verify item title contains "<item_code>"
    Examples:
      | item_code |
      | 990042400 |
      | RL35-0000 |
      | 114251    |
      | 5400      |
      | WB-4      |
#9
  @vail
  Scenario Outline: Search by SKU functionality
    Then Enter "<sku>" to search field
    Then Press "Enter" on keyboard
    And Verify page correct "<sku>" item page opens
    Examples:
      | sku     |
      | 54183   |
      | ISI1007 |
      | ISI1004 |
      | 51309   |
      | 56102   |
#10
  @vail
  Scenario Outline: Verification of Stocked facet, pop-over message and quantity of items
    Then Click on category "<category_name>"
    Then Verify this category "Specials" includes "Quick Ship Plus" items
    And Verify "Quick Ship Plus" displays quantity of available items
    And When user move mouse to ? mark "Quick Ship Plus" pop over message displayed
    Examples:
      | category_name      |
      | Equipment          |
      | Parts              |
      | Plumbing           |
      | Kitchen            |
      | Dining Room        |
      | Disposables        |
      | Furniture          |
      | Specialty Supplies |
      | Clearance          |

 #11
  Scenario Outline: Verification of Quick Ship Plus facet, pop-over message and quantity of items
    Then Click on category "<category_name>"
    Then  Verify this category "Specials" includes "Stocked Item" items
    Then Verify "Stocked Item" displays quantity of available items
    Then When user move mouse to ? mark "Stocked Item" pop over message displayed
    Examples:
      | category_name      |
      | Equipment          |
      | Parts              |
      | Plumbing           |
      | Kitchen            |
      | Dining Room        |
      | Disposables        |
      | Furniture          |
      | Specialty Supplies |
      | Clearance          |
#12

  Scenario: Verify that user ables to open Account popup, popup contains links and use can close this pop up
    Then Click on "Account" icon
    Then "My account" popover contains links:
      | My Account |
      | Sign In    |
    And Tap to close My Account button
    And Verify My Account popup was closed
#13

  Scenario: User should be able to open Sign in page and correct text should be displayed
    When Click on "Account" icon
    And Click "Sign In" link
    And Verify "Sign In" side title and text
    Then Verify "Register a New Account" or "New Customer" side title and register text


  #14
  Scenario Outline: User should be able sign in with valid credentials
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Enter email "<email>"

    And Enter valid password "<password>"
    And Tap "Sign In" button
    And Verify user on "Home page" page
    When Click on "Account" icon
    Then Verify "<username>" displayed
    Examples:
      | email                 | password  | username |
      | t.d.etundra@gmail.com | Zxc123zxc | Tatsiana |


  #15 # invalid email
  Scenario Outline: Forgot password functionality- Invalid email
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Tap "Forgot your password?" link
    And "Forgot Password" page should display title, correct messages, buttons
    Then Enter "<email>" for resetting password
    Then Press "Reset Password" button
    And "Forgot Password" page should display title, correct messages, buttons
    Examples:
      | email             |
      | invalid@gmail.com |

#16  # email field is empty
  Scenario: Forgot password funtionality - Empty email
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Tap "Forgot your password?" link
    Then Press "Reset Password" button
    Then Verify error message "The Email Address field is required" displayed

  #17 # correct email
  Scenario Outline: Forgot password functionality- Correct email
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Tap "Forgot your password?" link
    Then Enter "<email>" for resetting password
    Then Press "Reset Password" button
    And Verify Reset page displayed with correct text and title, "<email>"
    Examples:
      | email                 |
      | t.d.etundra@gmail.com |

  Scenario Outline: Forgot password functionality- combination of scenarios
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Tap "Forgot your password?" link
    And Verify user on "Forgot Password" page
    And  "Forgot Password" page should display title, correct messages, buttons and "<valid_email>" if required
    Then Press "Reset Password" button
    Then Verify error message "The Email Address field is required" displayed
    Then Enter "<invalid_email>" for resetting password
    Then Press "Reset Password" button
    And "Forgot Password" page should display title, correct messages, buttons and "<valid_email>" if required
    Then Enter "<valid_email>" for resetting password
    Then Press "Reset Password" button
    And Verify Reset page displayed with correct text and title, "<valid_email>"
    Examples:
      | valid_email           | invalid_email     |
      | t.d.etundra@gmail.com | invalid@gmail.com |

#16

  Scenario: User registration verification
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Enter First Name
    Then Enter Last Name
    Then Enter Email
    And Enter Phone Number
    And Enter Password
    And Enter Retyped
    Then From dropdown select "Restaurant" company business type
    And Enter Company Name
    Then Tap "Register" button
    And Verify user on "Home page" page
    When Click on "Account" icon
    Then Verify correct username displayed

#17
  Scenario: User registration error handling verification
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Tap "Register" button
    And Verify error message "The First name field is required" displayed
    And Verify error message "The Last name field is required" displayed
    And Verify error message "The Email field is required" displayed
    And Verify error message "The Phone field is required" displayed
    And Verify error message "The Password field is required" displayed
    And Verify error message "The Retype Password field is required" displayed
    And Verify error message "The Company Type field is require" displayed
#18
  Scenario Outline: User should able login trough My account
    And Verify user on "Home page" page
    Then Click on "Account" icon
   #Then Click "Sign In" link
    Then Click My Account link
    Then Enter email "<email>"
    And Enter valid password "<password>"
    And Tap "Sign In" button
    Then Verify user on "My Account" page
    Examples:
      | email                 | password  |
      | t.d.etundra@gmail.com | Zxc123zxc |

  Scenario Outline: My account details verification
    And Verify user on "Home page" page
    Then Click on "Account" icon
    Then Click My Account link
    Then Enter email "<email>"
    And Enter valid password "<password>"
    And Tap "Sign In" button
    Then Tap "<section_name>" plus button
    Examples:
      | email                 | password  | section_name            |
      | t.d.etundra@gmail.com | Zxc123zxc | My Accounts Detail      |

#