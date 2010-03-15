class CreateFileTypes < ActiveRecord::Migration
  def self.up
    create_table :file_types do |t|
      t.string :extension, :null => false
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :file_types
  end
end
