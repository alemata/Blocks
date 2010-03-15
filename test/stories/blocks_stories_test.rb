require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class BlocksStoriesTest < ActionController::IntegrationTest
  
  story "Create a new block" do
    scenario "Try to create a new block with invalid data" do
      visit "/"
      click_button :submit
      assert_contain "Code can't be empty"
      assert_contain "New Block"
    end

    scenario "Create a new public block with valid data" do
      visit "/"
      fill_in :block_revision_attr_snippet, :with => "Testing public block"
      click_button :submit
      assert_contain "Block was successfully created."
      assert_contain "Revisions"
      assert_contain "Testing public block"
    end

    scenario "Create a new private block with valid data" do
      visit "/"
      fill_in :block_revision_attr_snippet, :with => "Testing private block"
      uncheck "block_shared"
      click_button :submit
      assert_contain "Block was successfully created."
      assert_contain "Testing private block"
      click_link "Blocks"
      assert_not_contain "Testing private block"
    end

    def teardown
      Block.delete_all
    end      
  end
  
  story "Edit a block" do
    def setup
      @block = create_block(:revision_attr => { :snippet => "Just testing"})
    end

    scenario "Given a block that I own, I want to change code of block" do
      visit "/blocks/#{@block.id}/edit"
      assert_contain "Just testing"
      fill_in :block_revision_attr_snippet, :with => "changing the code"
      click_button :submit
      assert_contain "Successfully updated block."
      assert_contain "changing the code" 
      assert_contain "Revisions"
      assert_contain "Last"
      assert_contain "Revision 1"
      click_link "Revision 1"
      assert_have_no_selector "actions"
    end

    scenario "Given a block that I own, I want to change privacity of block" do
      visit "/blocks/#{@block.id}/edit"
      uncheck :block_shared
      click_button :submit
      assert_contain "Successfully updated block."
      visit "/blocks"
      assert_not_contain "prueba" 
    end
    
    scenario "Given a block wich I not own, I cant edit it" do
      visit "/blocks/#{@block.id}"
      assert_contain "Just testing"
      assert_have_no_selector "edit_#{@block.id}"
    end

    def teardown
      Block.delete_all
    end      
  end
  
  story "Delete a block" do
    scenario "Given a block wich I own, I want to delete it" do
      visit "/"
      fill_in :block_revision_attr_snippet, :with => "Just testing delete"
      click_button :submit
      assert_contain "Block was successfully created."
      @block = Block.last
      visit "/blocks"
      assert_contain "Just testing delete"
      click_link "delete_#{@block.id}"
      assert_contain "Successfully destroyed block."
      assert_not_contain "Just testing delete" 
    end
    
    scenario "Given a block wich I not own, I cant delete it" do
      @block = create_block(:revision_attr => { :snippet => "Just testing delete"})
      visit "/blocks"
      assert_contain "Just testing delete"
      assert_have_no_selector "delete_#{@block.id}"
    end

    def teardown
      Block.delete_all
    end      
  end
  
  private
  def create_block(attributes={})
    default = { :revision_attr => { :revision_number => 1, :snippet => "Test", :file_type_id => 1}, :shared => 1, :owner => 1, :last_revision => 1 }.merge(attributes)
    Block.create(default)
  end
end
