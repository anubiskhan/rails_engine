class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.bigint :item_id
      t.bigint :invoice_id
      t.integer :quantity
      t.integer :unit_price
      t.timestamps
    end
  end
end
