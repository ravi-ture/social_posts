class CreateListUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :list_users do |t|
      t.references :user, foreign_key: true
      t.references :custom_list, foreign_key: true

      t.timestamps
    end
  end
end
