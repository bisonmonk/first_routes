class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :owner_id, null: false
      t.string  :name,     null: false

      t.timestamps
    end

    add_index :groups, :owner_id
    add_index :groups, :name, unique: true
  end
end
