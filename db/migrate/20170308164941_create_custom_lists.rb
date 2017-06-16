class CreateCustomLists < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
