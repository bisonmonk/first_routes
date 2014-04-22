class CreateGroupContacts < ActiveRecord::Migration
  def change
    create_table :group_contacts do |t|
      t.integer :group_id
      t.integer :contact_id

      t.timestamps
    end

    add_index :group_contacts, [:group_id, :contact_id], unique: true
  end
end
