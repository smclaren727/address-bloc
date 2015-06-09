#7 - Load the library named entry.rb
require_relative "entry.rb"
require "csv"

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

  # Defined the method. Starts by reading the file using File.read and uses the CSV
  # class to parse the file
  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true)
    # Iterate over the table object's rows
    csv.each do |row|
      # Create a hash for each row
      row_hash = row.to_hash
      # Convert each row_hash to an Entry by using add_entry method
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end

    # Get the number of items parsed by calling the count method
    return csv.count
  end
end