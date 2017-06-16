class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :site
      t.text :link
      t.text :content
      t.timestamp :posting_time

      t.timestamps
    end
    add_index :posts, :site
    add_index :posts, :posting_time
  end
end
