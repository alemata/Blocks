class CreateRevisions < ActiveRecord::Migration
  def self.up
    create_table :revisions do |t|
      t.integer :block_id, :null => false
      t.text :snippet, :null => false
      t.integer :file_type_id
      t.integer :revision_number, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :revisions
  end
end
