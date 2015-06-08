#1 - Standard first line - Says file is a spec file that tests Entry
RSpec.describe Entry do
  #2 - Use the context method to give test structure. Communicates that specs in context will test Entry
  context "attributes" do
    #3 - Seperate individual tests using the it method. Each it is a unique test.
    it "should respond to name" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      #4 - Each RSpec test ends with one or more expect methods. These methods determine whether tests pass or fail.
      expect(entry).to respond_to(:name)
    end

    it "should respond to phone number" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(entry).to respond_to(:phone_number)
    end

    it "should respond to email" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(entry).to respond_to(:email)
    end
  end

  #5 - Create a new context to separate to_s from initializer test.
  context ".to_s" do
    it "prints an entry as a string" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
      #6 - Use eq to check that to_s returns a string equal to expected_string.
      expect(entry.to_s).to eq(expected_string)
    end
  end
end