Leo's Dessert Shop 🍰
========================

Leo's Dessert Shop is a Ruby CLI Application that simulates the ordering process of your typical pastry shop.
User's can brows through, and order from a selection of delicious dessert. The user can even customize
their dessert orders!

![CLI App Image](../desktop/CLI_app_intro_screen.png)

---
## How To Run Application

1. Clone this repository onto your local machine using git clone.
2. Run `bundle install` in your terminal to download all the necessary gems.
3. Run `rake db:migrate` to create the database.
4. Last, but definitely not least, run `ruby bin/run.rb` to start the app. Enjoy!

Quick Note *If having trouble running 'rake' commands, use bundle exec rake*

## Main Menu

- View Dessert Menu
  - Displays full dessert menu
- Order Dessert
  - Select dessert you would like to order
- View Your Order
  - Displays all dessert items you've selected
- Customize An Order
  - Customize your dessert with up to 3 different toppings
- Delete An Item
  - Deletes an item from your entire order
- Exit
  - exits the application

## Built With

Much of this application was created with the help of these resources:

- [TTY::Prompt](https://github.com/piotrmurach/tty-prompt#21-ask): interactive command line prompt
- [Colorize](https://github.com/fazibear/colorize): adds color to text and backgrounds
- [Text to ASCII Art Generator](http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20): generates ASCII art from inputted text
- [ASCII Art Archive](https://www.asciiart.eu/): collection of ASCII art

🍨🥧🍰 **Thanks for visting Leo's Dessert Shop!** 🍨🥧🍰