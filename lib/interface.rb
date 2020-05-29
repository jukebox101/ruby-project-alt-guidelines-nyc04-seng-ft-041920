class Interface
    @@prompt = TTY::Prompt.new

    def initialize
        Interface.intro
        self.login_or_register
    end

    def self.intro
        puts "Welcome To Leo's Dessert Shop!!"
        puts "
        '##:::::::'########::'#######::'####::'######::                         
        ##::::::: ##.....::'##.... ##: ####:'##... ##:                         
        ##::::::: ##::::::: ##:::: ##:. ##:: ##:::..::                         
        ##::::::: ######::: ##:::: ##:'##:::. ######::                         
        ##::::::: ##...:::: ##:::: ##:..:::::..... ##:                         
        ##::::::: ##::::::: ##:::: ##:::::::'##::: ##:                         
        ########: ########:. #######::::::::. ######::                         
       ........::........:::.......::::::::::......:::
        ".colorize(:magenta)
        sleep 0.5
        puts "
       '########::'########::'######:::'######::'########:'########::'########:
        ##.... ##: ##.....::'##... ##:'##... ##: ##.....:: ##.... ##:... ##..::
        ##:::: ##: ##::::::: ##:::..:: ##:::..:: ##::::::: ##:::: ##:::: ##::::
        ##:::: ##: ######:::. ######::. ######:: ######::: ########::::: ##::::
        ##:::: ##: ##...:::::..... ##::..... ##: ##...:::: ##.. ##:::::: ##::::
        ##:::: ##: ##:::::::'##::: ##:'##::: ##: ##::::::: ##::. ##::::: ##::::
        ########:: ########:. ######::. ######:: ########: ##:::. ##:::: ##::::
       ........:::........:::......::::......:::........::..:::::..:::::..:::::
        ".colorize(:yellow)
        sleep 0.5
        puts "
       :'######::'##::::'##::'#######::'########::                             
       '##... ##: ##:::: ##:'##.... ##: ##.... ##:                             
        ##:::..:: ##:::: ##: ##:::: ##: ##:::: ##:                             
       . ######:: #########: ##:::: ##: ########::                             
       :..... ##: ##.... ##: ##:::: ##: ##.....:::                             
       '##::: ##: ##:::: ##: ##:::: ##: ##::::::::                             
       . ######:: ##:::: ##:. #######:: ##::::::::                             
       :......:::..:::::..:::.......:::..:::::::::                             ".colorize(:magenta)

    puts "         
           (
            )
       __..---..__
   ,-='  /  |  \  `=-.
  :--..___________..--;
   \.,_____________,./".colorize(:yellow)

                             

    end

    def self.outro
        puts "Goodbye! Until next time!"
        sleep 1
        exit
    end

    def self.dessert_menu(customer_name)
        puts "Dessert Menu"
        puts "
        Cake: Triple Chocolate, Tres Leches, Tiramisu, Strawberry Shortcake, Carrot Cake, NY Cheesecake

        Pie: Lemon Mirengue, Local Apple, Brown Butter Honey Pecan, Sour Cherry, Pumpkin, Banana Cream 

        Ice Cream: Vanilla Bean, Matcha Green Tea, Rocky Road, Strawberry, Neapolitan, Pistachio, Salted Caramel

        Cookies: Snickerdoodles, Chunky Chocolate Chip, Oatmeal Raisin, White Chocolate Macadamia Nut

        Patries: Baklava, Gyeongju Bread, Cannoli, Eclair, Apple Turnover, Cheese Danish
        
        Macarons: Salted Caramel, Pistachio, Blueberry Lavender, Pecan Bourbon, Vanilla, Lemon, Coffee, Almond Raspberry
        "
        Customer.choose_action(customer_name)
    end

    def login_or_register
        @@prompt.select("Are you logging in, or creating a new account?") do |menu|
            menu.choice 'Login', -> { self.login }
            menu.choice 'Create A New Account', -> { self.create_new_account }
        end
    end

    def login
        customer_name = @@prompt.ask("Enter your username here: ", required: true)

        if Customer.find_by_name(customer_name)
            puts "Welcome Back, #{customer_name}!"
            Customer.choose_action(customer_name)
        else
            username_not_found(customer_name)
        end
    end

    def username_not_found(customer_name)
        puts "That username isn't registered in our system.".colorize(:red)
        @@prompt.select("Would you like to create a new account? Or you can try logging in again") do |menu|
            menu.choice 'Create New Account', -> {self.create_new_account}
            menu.choice 'Try Login Again', -> {self.login}
        end
    end

    def create_new_account
        customer_name = @@prompt.ask("Enter your new username:") do |q|
            q.required true
            q.modify :remove
        end

        if Customer.find_by_name(customer_name)
            puts "Sorry, that username has already been taken.".colorize(:yellow)
            self.create_new_account
        else
            Customer.create(name: customer_name)
            puts "Thank you for choosing Leo's Dessert Shop, #{customer_name}!".colorize(:light_magenta)
            Customer.choose_action(customer_name)
        end
    end

end