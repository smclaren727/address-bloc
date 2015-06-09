# Include AddressBook using require_relative
require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    # Display the main menu options to the command line
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View entry number n"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "

    # Retrieve user input from the command line with gets
    selection = gets.to_i
    puts "You picked #{selection}"

    # Use a case statement operator to determine the proper response to the user's input
    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      view_entry_n
      main_menu
    when 3
      system "clear"
      create_entry
      main_menu
    when 4
      system "clear"
      search_entries
      main_menu
    when 5
      system "clear"
      read_csv
      main_menu
    when 6
      puts "Good-bye!"
      # Terminate the program using exit(0)
      exit(0)
      # Use an else to catch invalid user input and prompt the user to retry
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu-menu
    end
  end

  # Stub the rest of the methods called in main_menu
  def view_all_entries
    # Iterate through all entries in AddressBook using each
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      # Call entry_submenu to display a submenu for each entry
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def view_entry_n
    system "clear"
    puts "What entry do you want to see?"
    print "Entry number: "
    selection = gets.chomp

    @address_book.entries.each_with_index do |entry, index|
      if selection.to_i - 1 == index
        puts entry
      else
        puts "That's not a valid entry. Try again."
      end
    end
  end

  def create_entry
    # Clear the screen before displaying the create entry prompts
    system "clear"
    puts "New AddressBloc Entry"
    # Use print to prompt the user for each entry attribute
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    # Add a new entry to @address_book using add_entry
    @address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    # Display the submenu options
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    # Chomp removes any trailing whitespace from the string gets returns
    selection = gets.chomp

    case selection
      # When the user asks to see next entry, we can do nothing, so control is returned to view_all_entries
    when "n"
      # We will handle deleting and editing in another checkpoint
    when "d"
    when "e"
      # We return the user to the main menu
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entries_submenu(entry)
    end
  end
end