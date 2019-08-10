class CreateListOfRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :list_of_roles do |t|
      t.string :role
      t.boolean :is_hide

      t.timestamps
    end
  end
end
