class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.integer :owner, :null => false
      t.integer :last_revision, :null => false
      t.boolean :shared
      t.timestamps
    end
  end
  
  def self.down
    drop_table :blocks
  end
end
