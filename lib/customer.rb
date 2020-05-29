class Customer < ActiveRecord::Base
    has_many :orders
    has_many :desserts, through: :orders

    @@prompt = TTY::Prompt.new

    def self.choose_action(customer_name)
        answer = @@prompt.select("What you would like to do:".colorize(:yellow).colorize( :background => :magenta)) do |menu|
            menu.choice 'View Dessert Menu', -> {Interface.dessert_menu(customer_name)}
            menu.choice 'Order Dessert', -> {Dessert.dessert_selection(customer_name)}
            menu.choice 'View Your Order', -> {Order.print_with_customer_name(customer_name)}
            menu.choice 'Customize An Order', -> {Topping.add_toppings(customer_name)}
            menu.choice 'Delete An Item', -> {Dessert.delete_an_item(customer_name)}
            menu.choice 'Exit', -> {Interface.outro}
            
        end
    end

    def self.find_by_name(customer_name)
        Customer.find_by(name: customer_name)
    end

    def self.id(customer_name)
        Customer.find_by(name: customer_name).id
    end

    def self.orders(customer_name)
        Customer.find_by_name(customer_name).orders
    end

    def self.desserts(customer_name)
        array = Customer.find_by_name(customer_name).desserts
    end

    def self.all_customers
        @customer_intstances = Customer.all.map
    end
end