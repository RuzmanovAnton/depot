class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :product, index: true
      t.belongs :cart
      t.string :to

      t.timestamps
    end
  end
end
