# Acme Widget 

Overview

This is a Ruby implementation of a proof-of-concept sales system for Acme Widget Co. The system is created to manage a shopping basket/cart containing a product catalog, delivery rules, and any special offers. Currently, the only offer considered is a "buy one red widget, get one red widget at half price".

Features

Product Catalog: Supports 3 Products initiliazed with their names, product_codes and prices.

Delivery Rules:

Orders under $50: $4.95 delivery
Orders $50-$89.99: $2.95 delivery
Orders $90+: Free delivery

Special Offer: Buy one Red Widget (R01), get the second at half price.

Basket Functionality:

I created a method to add products by product code.

I created a method to Cxalculate total cost including delivery and discounts.

Implementation Details

I structured the solution into four main classes:

Product: Represents a product with a name, code and price.

DeliveryCalculator: Computes delivery costs based on the basket subtotal after discounts.

Offer: Handles special offers/discounts, currently implementing the "buy one, get one half price" for R01.

Basket: Manages the shopping basket, integrating the catalog, delivery rules, and offers.

Key Design Choices

Modularity: Each component (Product, DeliveryCalculator, Offer, Basket) is encapsulated to allow easy extension.

Flexibility: Offers are configurable, supporting future modifications.

Precision: Prices are handled as floats and rounded to 2 decimal places in the final total to ensure accuracy.

Simplicity: The code is written to be clear and maintainable, with minimal dependencies.

Assumptions

Only valid products i.e products present in the catalogue can be added to the basket.

Raises an error when an array of products are added to the basket

Delivery costs are calculated based on the subtotal after applying discounts.

The "buy one, get one half price" offer applies to pairs of R01 widgets.

Prices and discounts are in USD and include two decimal places.

How to Run

Please ensure Ruby is installed (version 3.0 or higher recommended).

Please run the following commands:

``` git clone https://github.com/mckent05/Acme_widget.git```

``` cd Acme_widget ```

Lastly run the file using:

```ruby acme_widget.rb```

I included the test cases as shown in the document provided:
B01, G01 => $37.85
R01, R01 => $54.37
R01, G01 => $60.85
B01, B01, R01, R01, R01 => $98.27

Future Improvements

Add input validation for product codes.

Make the offer class extensible