class Borrow < ActiveRecord::Migration[5.0]
  def change
    create_table :borrows do |t|
      
      t.timestamps
    end
  end
end
