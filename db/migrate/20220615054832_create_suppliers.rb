class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :mobileno
      t.string :city

      t.timestamps
    end
  end
end
