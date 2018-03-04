class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.float :price
      t.datetime :date
      t.float :taxe

      t.timestamps
    end
  end
end
