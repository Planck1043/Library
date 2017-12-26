class ChangeColumnToBorrowItem < ActiveRecord::Migration[5.0]
  def change
    rename_column :borrow_items, :user_id, :borrow_id
  end
end
