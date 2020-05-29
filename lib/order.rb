class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :dessert

    # def self.customer_id(customer_name)
    #     Customer.all.map { |customer_instance| customer_instance.id if customer_instance.name == customer_name }
    # end


    # def self.dessert_ids(customer_id)
    #     Order.all.map { |order| order.dessert_id if order.customer_id == customer_id}
    # end

    
    # def self.print_order(customer_id)
    #     dessert_id = Order.dessert_ids(customer_id)
    #     if dessert_id.any?
    #         dessert_id.select {|dessert| puts "#{Dessert.find_by(id: dessert).flavor} #{Dessert.find_by(id: dessert).dessert_type}"}
    #     else
    #         puts "You haven't order anything yet"
    #     end
    # end

    def self.print_with_customer_name(customer_name)
        # customer_id = Customer.id(customer_name)
        # self.print_order(customer_id)

        # Customer.choose_action(customer_name)
        array = Customer.desserts(customer_name)

        if array.any?
            array.select {|array| if array.toppings == nil
                puts "#{array.flavor} #{array.dessert_type}"
            else
                toppings = Topping.find_toppings(array.toppings)
                puts "#{array.flavor} #{array.dessert_type} #{toppings}"
            end}
        else
            puts "You haven't order anything yet".colorize(:red)
        end
        Customer.choose_action(customer_name)
    end

    
end