# MODELS

## CART
X belongs to a user
X has many line_items
X has many items through line_items
X #total: total price of items in cart
X #add_item(item.id): updates existing line_item instead of making new when adding same item, or creates a new unsaved line_item 

## CATEGORY
X has many items

## ITEM
X title, inventory, price, category_id
X belongs to a category
X has many line_items consolidated by line_item quantity
X #available_items: only returns items with inventory > 0

## LineItem
X belongs to a cart
X belongs to an item
X has a quantity, default 1

## USER
X has many carts
X has #current_cart

#CRUD

CATEGORY: index
X displays all of the categories as links

ITEMS: index
X displays all items that have inventory

# USERS
X Have just an email and password
Should be able to log in and log out
Also sign up
Note: You must use the Devise gem to set up user for tests to pass.
You may find that you're missing some seed data. Look at the error messages you get carefully and don't be surprised if you have to add some seed data

# ITEMS 
List of available items whether you are logged in or not
If logged in, each item should have an "Add to Cart" button
When the user adds an item to the cart it should show them their current cart

# CART/CHECKOUT
Creates a current_cart when adding first item
Users should be able to checkout from their cart
This shows them their cart afterwards, and deducts inventory from each item
Prices should be in the $XX.XX format
The Checkout process should set that current cart to a status of "submitted"

# HEADERS/NAV
Users should know who they are logged in as ("Signed in as #{@user.email}")
Users should be able to sign in/out from the navigation bar
Users should always be able to go to "Store Home"
If the user has a current cart, there should be a "Cart" link to their current cart
- if not logged in, does not display "Add To Cart" button
- if logged in: ,  has "Sign out"