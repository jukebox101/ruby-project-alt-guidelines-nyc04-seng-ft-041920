class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :dessert

    def self.print_with_customer_name(customer_name)
        array = Customer.desserts(customer_name)

        if array.any?
            array.select {|array| if array.toppings == nil
                puts "#{array.flavor} #{array.dessert_type}"
                puts "----------------------------------"

            else
                toppings = Topping.find_toppings(array.toppings)
                puts "#{array.flavor} #{array.dessert_type} #{toppings}"
                puts "----------------------------------"
            end}
        else
            puts "You haven't order anything yet".colorize(:red)
        end
        Customer.choose_action(customer_name)
    end

    
end