class CreateYelpBusinesses < ActiveRecord::Migration
  def change
    create_table :yelp_businesses do |t|
      t.references :train_option, index: true
      t.string :rating
      t.string :phone
      t.string :address
      t.string :category

      t.timestamps
    end
  end
end
