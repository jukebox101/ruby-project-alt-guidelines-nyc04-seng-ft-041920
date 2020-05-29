class Dessert < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    @@prompt = TTY::Prompt.new


    def self.dessert_selection(customer_name)
        @@prompt.select("What type of dessert would you like?") do |menu|
            menu.choice "Cake", -> {self.cakes(customer_name)}
            menu.choice "Pie", -> {self.pies(customer_name)}
            menu.choice "Cookies", -> {self.cookies(customer_name)}
            menu.choice "Pastries", -> {self.pastries(customer_name)}
            menu.choice "Macarons", -> {self.macarons(customer_name)}
            menu.choice "Ice Cream", -> {self.ice_cream(customer_name)}
            menu.choice "Back to Main Menu", -> {Customer.choose_action(customer_name)}
        end
    end

    def self.cakes(customer_name)
        new_dessert = nil
        @@prompt.select("What kind of cake would you like?") do |menu|
            menu.choice "Triple Chocolate", -> {
                new_dessert = Dessert.create(dessert_type: "Cake", flavor: "Triple Chocolate")}
            menu.choice "Tres Leches", -> {
                new_dessert = Dessert.create(dessert_type: "Cake", flavor: "Tres Leches")}
            menu.choice "Tiramisu", -> {
                new_dessert = Dessert.create(dessert_type: "Cake", flavor: "Tiramisu")}
            menu.choice "Strawberry Shortcake", -> {
                new_dessert = Dessert.create(dessert_type: "Cake", flavor: "Strawberry Shortcake")}
            menu.choice "Carrot Cake", -> {
                new_dessert = Dessert.create(dessert_type: "Cake", flavor: "Carrot Cake")}
            menu.choice "NY Cheesecake", -> {
                new_dessert = Dessert.create(dessert_type: "Cake", flavor: "NY Cheesecake")}
            menu.choice "Go Back To Dessert Categories", -> {Dessert.dessert_selection(customer_name)}
            menu.choice "Back to Main Menu", -> {Customer.choose_action(customer_name)}
        end
        
        puts "You just ordered a #{new_dessert.dessert_type}, #{new_dessert.flavor} to be exact! Great choice #{customer_name}!"
        Order.create(customer_id: Customer.id(customer_name), dessert_id: new_dessert.id)
        Customer.choose_action(customer_name)
    end

    def self.pies(customer_name)
        new_dessert = nil
        @@prompt.select("What kind of pie would you like?") do |menu|
            menu.choice "Local Apple", -> {
                new_dessert = Dessert.create(dessert_type: "Pie", flavor: "Local Apple")}
            menu.choice "Banana Cream", -> {
                new_dessert = Dessert.create(dessert_type: "Pie", flavor: "Banana Cream")}
            menu.choice "Brown Butter Honey Pecan", -> {
                new_dessert = Dessert.create(dessert_type: "Pie", flavor: "Brown Butter Honey Pecan")}
            menu.choice "Lemon Mirengue", -> {
                new_dessert = Dessert.create(dessert_type: "Pie", flavor: "Lemon Mirengue")}
            menu.choice "Pumpkin", -> {
                new_dessert = Dessert.create(dessert_type: "Pie", flavor: "Pumpkin")}
            menu.choice "Sour Cherry", -> {
                new_dessert = Dessert.create(dessert_type: "Pie", flavor: "Sour Cherry")}
            menu.choice "Go Back To Dessert Categories", -> {Dessert.dessert_selection(customer_name)}
            menu.choice "Back to Main Menu", -> {Customer.choose_action(customer_name)}
        end
        
        puts "You just ordered a #{new_dessert.dessert_type}, #{new_dessert.flavor} to be exact! Great choice #{customer_name}!"
        Order.create(customer_id: Customer.id(customer_name), dessert_id: new_dessert.id)
        Customer.choose_action(customer_name)

    end

    def self.cookies(customer_name)
        new_dessert = nil
        @@prompt.select("What kind of cookie would you like?") do |menu|
            menu.choice "Chunky Chocolate Chip", -> {
                new_dessert = Dessert.create(dessert_type: "Cookie", flavor: "Chunky Chocolate Chip")}
            menu.choice "Oatmeal Raisin", -> {
                new_dessert = Dessert.create(dessert_type: "Cookie", flavor: "Oatmeal Raisin")}
            menu.choice "Snickerdoodles", -> {
                new_dessert = Dessert.create(dessert_type: "Cookie", flavor: "Snickerdoodles")}
            menu.choice "White Chocolate Macadamia Nut", -> {
                new_dessert = Dessert.create(dessert_type: "Cookie", flavor: "White Chocolate Macadamia Nut")}
            menu.choice "Gingersnap", -> {
                new_dessert = Dessert.create(dessert_type: "Cookie", flavor: "Gingersnap")}
            menu.choice "Peanut Butter", -> {
                new_dessert = Dessert.create(dessert_type: "Cookie", flavor: "Peanut Butter")}
            menu.choice "Go Back To Dessert Categories", -> {Dessert.dessert_selection(customer_name)}
            menu.choice "Back to Main Menu", -> {Customer.choose_action(customer_name)}
        end
        
        puts "You just ordered a #{new_dessert.flavor} #{new_dessert.dessert_type}! Great choice #{customer_name}!"
        Order.create(customer_id: Customer.id(customer_name), dessert_id: new_dessert.id)
        Customer.choose_action(customer_name)
    end

    def self.pastries(customer_name)
        new_dessert = nil
        @@prompt.select("What kind of pastries would you like?") do |menu|
            menu.choice "Apple Turnover", -> {
                new_dessert = Dessert.create(dessert_type: "Pastry", flavor: "Apple Turnover")}
            menu.choice "Baklava", -> {
                new_dessert = Dessert.create(dessert_type: "Pastry", flavor: "Baklava")}
            menu.choice "Cannoli", -> {
                new_dessert = Dessert.create(dessert_type: "Pastry", flavor: "Cannoli")}
            menu.choice "Cheese Danish", -> {
                new_dessert = Dessert.create(dessert_type: "Pastry", flavor: "Cheese Danish")}
            menu.choice "Eclair", -> {
                new_dessert = Dessert.create(dessert_type: "Pastry", flavor: "Eclair")}
            menu.choice "Gyeongju Bread", -> {
                new_dessert = Dessert.create(dessert_type: "Pastry", flavor: "Gyeongju Bread")}
            menu.choice "Go Back To Dessert Categories", -> {Dessert.dessert_selection(customer_name)}
            menu.choice "Back to Main Menu", -> {Customer.choose_action(customer_name)}
        end
        
        puts "You just ordered a #{new_dessert.dessert_type}, #{new_dessert.flavor} to be exact! Great choice #{customer_name}!"
        Order.create(customer_id: Customer.id(customer_name), dessert_id: new_dessert.id)
        Customer.choose_action(customer_name)
    end

    def self.macarons(customer_name)
        new_dessert = nil
        @@prompt.select("What kind of macaron would you like?") do |menu|
            menu.choice "Almond Raspberry", -> {
                new_dessert = Dessert.create(dessert_type: "Macaron", flavor: "Almond Raspberry")}
            menu.choice "Blueberry Lavender", -> {
                new_dessert = Dessert.create(dessert_type: "Macaron", flavor: "Blueberry Lavender")}
            menu.choice "Coffee", -> {
                new_dessert = Dessert.create(dessert_type: "Macaron", flavor: "Coffee")}
            menu.choice "Lemon", -> {
                new_dessert = Dessert.create(dessert_type: "Macaron", flavor: "Lemon")}
            menu.choice "Pecan Bourbon", -> {
                new_dessert = Dessert.create(dessert_type: "Macaron", flavor: "Pecan Bourbon")}
            menu.choice "Pistachio", -> {
                new_dessert = Dessert.create(dessert_type: "Macaron", flavor: "Pistachio")}
            menu.choice "Salted Caramel", -> {
                new_dessert = Dessert.create(dessert_type: "Macaron", flavor: "Salted Caramel")}
            menu.choice "Vanilla", -> {
                new_dessert = Dessert.create(dessert_type: "Macaron", flavor: "Vanilla")}
            menu.choice "Go Back To Dessert Categories", -> {Dessert.dessert_selection(customer_name)}
            menu.choice "Back to Main Menu", -> {Customer.choose_action(customer_name)}
        end
        
        puts "You just ordered a #{new_dessert.flavor} #{new_dessert.dessert_type}! Great choice #{customer_name}!"
        Order.create(customer_id: Customer.id(customer_name), dessert_id: new_dessert.id)
        Customer.choose_action(customer_name)
    end

    def self.ice_cream(customer_name)
        new_dessert = nil
        @@prompt.select("What kind of ice cream would you like?") do |menu|
            menu.choice "Vanilla Bean", -> {
                new_dessert = Dessert.create(dessert_type: "Ice Cream", flavor: "Vanilla Bean")}
            menu.choice "Neapolitan", -> {
                new_dessert = Dessert.create(dessert_type: "Ice Cream", flavor: "Neapolitan")}
            menu.choice "Rocky Road", -> {
                new_dessert = Dessert.create(dessert_type: "Ice Cream", flavor: "Rocky Road")}
            menu.choice "Strawberry", -> {
                new_dessert = Dessert.create(dessert_type: "Ice Cream", flavor: "Strawberry")}
            menu.choice "Matcha Green Tea", -> {
                new_dessert = Dessert.create(dessert_type: "Ice Cream", flavor: "Matcha Green Tea")}
            menu.choice "Pistachio", -> {
                new_dessert = Dessert.create(dessert_type: "Ice Cream", flavor: "Pistachio")}
            menu.choice "Salted Caramel", -> {
                new_dessert = Dessert.create(dessert_type: "Ice Cream", flavor: "Salted Caramel")}
            menu.choice "Go Back To Dessert Categories", -> {Dessert.dessert_selection(customer_name)}
            menu.choice "Back to Main Menu", -> {Customer.choose_action(customer_name)}
        end
        
        puts "You just ordered a #{new_dessert.flavor} #{new_dessert.dessert_type}! Great choice #{customer_name}!"
        Order.create(customer_id: Customer.id(customer_name), dessert_id: new_dessert.id)
        Customer.choose_action(customer_name)
    end

    def self.select_dessert(customer_name)
        array = Customer.desserts(customer_name)
        dessert_names = array.map {|dessert| "Order ##{dessert.id}: #{dessert.flavor} #{dessert.dessert_type} #{Topping.find_toppings(dessert.toppings)}"}
        puts dessert_names
        answer = @@prompt.ask("Which dessert would you like to customize? Type in the order number:") do |q|
            q.required true
        end
        answer
    end

    def self.delete_an_item(customer_name)
        array = Customer.desserts(customer_name)
        dessert_names = array.map {|dessert| "Order ##{dessert.id}: #{dessert.flavor} #{dessert.dessert_type} #{Topping.find_toppings(dessert.toppings)}"}
        puts dessert_names
        
        dess_id = @@prompt.ask("Which item would you like to delete? Type in the order number:") do |q|
            q.required true
        end
            
        dess_id = dess_id.to_i
            
        if  Dessert.all.find {|d| d.id == dess_id}
            order_id = Order.all.select {|order| order.id if order.dessert_id == dess_id}                
            top_id = Topping.all.select {|topping| topping.id if topping.dessert_id_top == dess_id}
            
            answer = @@prompt.select("Are you sure you want to delete Order ##{dess_id}?") do |menu|
                menu.choice "Yes, I'm sure", 1
                menu.choice "Nope, I changed my mind", 2
              end
  
            if answer == 1
                puts "#{dessert_names[dess_id-1]} has been deleted!"

                Dessert.delete(dess_id)
                Order.delete(order_id)
                Topping.delete(top_id)
            else
                Customer.choose_action(customer_name)
            end

        else 
            puts "Sorry, that's not a valid order number. Try again!"
            self.delete_an_item(customer_name)
        end
            Customer.choose_action(customer_name)

        
    end
end