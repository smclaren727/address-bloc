#7 - Load the library named entry.rb
require_relative "entry.rb"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone, email)
    #8 - Create a variable to store the insertion index
    index = 0
    @entries.each do |entry|
      #9 - Compare name with name of current entry. Increments index until it finds where to insert.
      if name < entry.name
        break
      end
      index += 1
    end
    #10 - Insert a new entry into entries using the calculated index from steps 8 & 9.
    @entries.insert(index, Entry.new(name, phone, email))
  end

  def remove_entry(name)
    @entries.delete_if {|entry| name = entry.name } 
  end
end