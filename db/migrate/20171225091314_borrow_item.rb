class BorrowItem < ActiveRecord::Migration[5.0]
  def change
    create_table :borrow_items do |t|
      t.integer   :user_id
      t.integer   :book_id
      t.integer   :quantity, default: 1

      t.timestamps
    end
  end
end
