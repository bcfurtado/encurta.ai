class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :key
      t.string :url

      t.timestamps
    end

    add_index :links, :key
    change_column_null :links, :key, false
    change_column_null :links, :url, false

  end
end
