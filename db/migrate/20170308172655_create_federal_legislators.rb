class CreateFederalLegislators < ActiveRecord::Migration[5.0]
  def change
    create_table :federal_legislators do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
