require_relative "controllers/menu_controller"

# Create a new MenuController when AddressBloc starts
menu = MenuController.new

# Use system clear to clear the command line
system "clear"
puts "Welcome to AddressBloc!"

# Call main_menu to display the menu
menu.main_menu