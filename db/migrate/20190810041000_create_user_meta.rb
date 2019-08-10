class CreateUserMeta < ActiveRecord::Migration[5.2]
  def change
    create_table :user_meta do |t|
      t.references :user, foreign_key: true
      t.string :user_key
      t.string :user_value

      t.timestamps
    end
  end
end
