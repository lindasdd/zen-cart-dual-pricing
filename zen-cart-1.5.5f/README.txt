Dual Pricing 2.1.8
ZenCart 1.5.5f

This module replaces group pricing and adds an additional price field to the product as well as allows you to assign "Wholesale" Status to users. Users with Wholesale Status will see the wholesale pricing. You can add multiple levels of wholesale pricing, for example: 20.00-10.00-5.00

THIS REPLACES GROUP PRICING. IF YOU USE GROUP PRICING THEN DON'T USE THIS.

If you're using Zen Cart *other than* 1.5.5f, please use the appropriate version of this plugin.  This is *only for* Zen Cart 1.5.5f

====================================================================
Installation
====================================================================

1. BACKUP your files and database!

2. Change \YOUR_ADMIN\ to match the name of your admin folder.

3. Change to match the name of your template:
	\includes\languages\english\YOUR_TEMPLATE
	\includes\modules\YOUR_TEMPLATE\
	\includes\templates\YOUR_TEMPLATE\

4. If you have changed any of the "Affected Files" listed below, MERGE your changes.

5. Upload all files directly into your Zen Cart root directory.

6. Run install.sql in Tools > Install SQL Patches

====================================================================
FAQ's
====================================================================

---------------------------------
How do I use it?
---------------------------------

1. To set 4 levels of wholesale pricing, edit the product and change the wholesale price to be a dash separated list, eg. 50.00-30.00-0.00-25.00

2. Attributes can be set in the same way, but you need to enter the prices in the "Wholesale Price" field and use comma separation, eg. 50.00-30.00-0.00-25,00

3. Pick a customer and click "edit". You will see a new text box under the email address box. The number should be 0, If you change it to a number above 0 then the customer gets wholesale pricing at that level. 

---------------------------------
How do pricing levels work?
---------------------------------

If you set a customer to 1 they'll see level 1 wholesale price instead of the retail price.
If you set it to 2 they will get the second wholesale price.
If they are set to 2 and there is only one wholesale price they will get the level 1 price.
If there is no wholesale price they get retail pricing.

---------------------------------
What about products on sale/special?
---------------------------------

If you put products on sale, your Wholesale level pricing will override that price. So sales only apply to Retail customers.

If you'd like to disable this feature, edit /includes/functions/functions_prices.php

Find these sets of code and comment them out (there should be 4 of them):

//Dual Pricing start - hide specials
//Dual Pricing end - hide specials

---------------------------------
What about taxes?
---------------------------------

By default, your Retail customers (level 0) will be charged sales tax, and wholesale customers (level 1+) will not be charged any sales tax.

If you would like to charge taxes to EVERYONE, then do not include the following file in your installation (or, revert this file back to the original that comes with Zen Cart):
includes\classes\order.php

---------------------------------
Can I add wholesale pricing to my Easy Populate spreadsheet?
---------------------------------

NOTE: if you'd like to add your wholesale prices to Easy Populate, add the following line to
admin\includes\languages\english.php

define('EASYPOPULATE_CONFIG_CUSTOM_FIELDS', 'products_price_w'); //Easy Populate

If you have already added this line for previous fields, then simply add products_price_w with a comma:

define('EASYPOPULATE_CONFIG_CUSTOM_FIELDS', 'products_price_w,WHATEVER_FIELD'); //Easy Populate

---------------------------------
How do I change wording/display style?
---------------------------------

If you want your wholesale customers to see BOTH retail and wholesale pricing (instead of only Wholesale pricing), then uncomment line #71 in this file:
\includes\templates\YOUR_TEMPLATE\templates\tpl_product_info_display.php

If you want to change wording in front of the prices, edit this file:
\includes\languages\english\YOUR_TEMPLATE\product_info.php

You can easily add the following three IDs to your CSS file and control the styles of your text:
#retail
#retailwhole
#whole

====================================================================
Support
====================================================================

If you have any problems using this add-on module, visit the support thread below.

http://www.zen-cart.com/forum/showthread.php?t=35450

====================================================================
Affected Files
====================================================================

admin\includes\functions\functions_prices.php
admin\includes\languages\english\attributes_controller.php
admin\includes\languages\english\customers.php
admin\includes\modules\product\collect_info.php
admin\includes\modules\products\preview_info.php
admin\includes\modules\category_product_listing.php
admin\includes\modules\copy_to_confirm.php
admin\includes\modules\update_product.php
admin\attibutes_controller.php
admin\customers.php
admin\products_price_manager.php
includes\classes\shopping_cart.php
includes\classes\order.php
includes\functions\functions_prices.php
includes\languages\english\YOUR_TEMPLATE\product_info.php
includes\modules\pages\login\header_php.php
includes\templates\YOUR_TEMPLATE\tpl_product_info_display.php
includes\modules\YOUR_TEMPLATE\products_quantity_discounts.php

====================================================================
Credits
====================================================================

Plugin Authors/Contributors:
jeking, JTwebsitedesign, Delia, That Software Guy, romanus, madfastride, Twitch

Special thanks to all those in the forums that have posted bugs/fixes for this module.
Everyone's support is greatly appreciated.


====================================================================
Changelog
====================================================================
v2.1.8 jeking
- updated for Zen Cart 1.5.5f compatibility

v2.1.7 jeking
- updated for Zen Cart 1.5.5/a/b compatibility

v2.1.6 jeking
- updated for Zen Cart 1.5.5 compatibility

v2.1.5b jeking
- fixes for incorrect comments types

v2.1.5 jeking
- cleaned up code
- improved comments
- updated readme

v2.1.3 jeking
- updated for Zen Cart 1.5.4 compatibility

v2.1.2b jeking
- updated includes\classes\order.php for Zen Cart 1.5.3 compatibility

v2.1.2 jeking
- updated for Zen Cart 1.5.3 compatibility

v2.1.1 jeking
- fixed bug where quantity discounts were not being honored for wholesale customers
- fixed missing language defines

v2.1 JTwebsitedesign
- Wholesale prices override special/sale prices
- Tax no longer applied to wholesale customers (level 1 and up)
- Fix attribute pricing during checkout
- Adjust language files for Product Price Manager, "Your Price", etc

v2.0 JTwebsitedesign
- upgrade for zc1.5 compatibility
- add comments to all files for easier upgrading: //Dual Pricing
- fix attribute pricing when adding to cart

v1.9 That Software Guy 
- removed unused customers_wholesale database field
  In the cases where this was used, it was used incorrectly; customers_whole
  is the field that contains the customer's pricing group.
- fixed sorting by customers_whole field in admin->customers->customers
- Updated the following files to 1.3.9h: 
  admin/includes/modules/product/collect_info.php
  admin/attributes_controller.php
  admin/products_price_manager.php  (trivial) 
  admin/includes/modules/product/preview_info.php
  admin/includes/modules/category_product_listing.php  (trivial) 

v1.8 JTwebsitedesign
- tested function in ZC 1.3.9 and compatibility with Hidden Wholesale. Fixed issue with displaying fields in admin. Adjusted to use Override system. Updates to ReadMe file for easier install.

v1.7c fixed error in install.sql and explicitly cast all wholesale values to float, because they were causing problems with zone table shipping rates based on price. This is a further revision of the Dual Pricing modification from (v138).  Issues that have been solved are;
-Attributes pricing not displaying / calculating right in the shopping cart page
-Displaying "Whole Sale:" on non Whole Sale items when "Retail:" should be displayed.
-The "1054 Unknown column 'c.COWOA account'" error. (http://www.zen-cart.com/forum/showthread.php?t=35450&page=20)
-In admin when Whole sale price is left blank item becomes free to whole salers... (the item now defaults back to a value of "0")
-Properly displays price labeling for customers and products of all varieties. 

v1.7b fixed shopping_cart.php, 1.3.9g version was used instead of 1.3.9h, updated to 1.3.9h version

v1.7 file changes, everything :D

V1.6 file changes
-\admin\includes\modules\copy_to_confirm.php - fixes so that the wholesale price copies when copying
-\dual_pricing_1.6\includes\classes\shopping_cart.php - fixes shopping cart so it doesnt break FREE shipping

This update is soley to increase the speed of a site.  DB queries are taken out of pages tpl_product_info_display.php, tpl_product_music_info_display.php, and functions_prices.php being replaced with $_SESSION variables defined in includes/modules/pages/login/header_php.php.  This saves 3-5 DB queries everytime a product is looked at by a logged in customer.  When looking at the shopping cart and calculating prices for checkout the DB is querried once again to verify that the customer is WS and that the prices are correct.  This is a security check.

V1.4.2 file changes
-includes/templates/YOUR_TEMPLATE/templates/tpl_product_info_display.php
-includes/templates/YOUR_TEMPLATE/templates/tpl_product_music_info_display.php
-includes/functions/functions_prices.php

New files for V 1.5 not included in V 1.4.2 that modify ZC 1.3.8a files
-includes/modules/pages/login/header_php.php