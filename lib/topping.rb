class Topping < ActiveRecord::Base
    @@prompt = TTY::Prompt.new

    def self.add_toppings(customer_name)
        answer = Dessert.select_dessert(customer_name)
        toppings = @@prompt.multi_select("Choose your toppings:", max: 3, echo: true) do |menu|
            menu.choice "Hot Fudge Chocolate Sauce"
            menu.choice "Mixed Berry Compote"
            menu.choice "Sea Salt Caramel Sauce"
            menu.choice "Raspberry Vanilla Sauce"
            menu.choice "Nutella Sauce"
            menu.choice "Homemade Whipped Cream"
          end
        cust_id = Customer.id(customer_name)
        dess_id = answer

        if toppings.length == 1
            top = Topping.create(dessert_id_top: dess_id, topping_1: toppings[0])
        elsif toppings.length == 2
            top = Topping.create(dessert_id_top: dess_id, topping_1: toppings[0], topping_2: toppings[1])
        else
            top = Topping.create(dessert_id_top: dess_id, topping_1: toppings[0], topping_2: toppings[1], topping_3: toppings[2])
        end

        Dessert.all.select {|dessert| 
            if dessert.id == top.dessert_id_top  
                dessert.update(toppings: top.id)
            end
            }   
        Customer.choose_action(customer_name)
    end

    def self.find_toppings(topping_id)
        if Topping.all.find {|topping| topping.id == topping_id}
            top_instance = Topping.all.find {|topping| topping.id == topping_id}
            if top_instance.topping_3 == nil && top_instance.topping_2 == nil
                toppings_var = "with #{top_instance.topping_1}"
            elsif top_instance.topping_3 == nil
                toppings_var = "with #{top_instance.topping_1}, and #{top_instance.topping_2}"
            else
                toppings_var = "with #{top_instance.topping_1}, #{top_instance.topping_2}, and #{top_instance.topping_3}"
            end
        else
            toppings_var = " "
        end
        toppings_var
    end
end