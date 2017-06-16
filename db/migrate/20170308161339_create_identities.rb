class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :identities do |t|
      t.references :user, foreign_key: true
      t.string :social_uid
      t.string :username
      t.string :social_site

      t.timestamps
    end
    add_index :identities, :social_site
  end
end
