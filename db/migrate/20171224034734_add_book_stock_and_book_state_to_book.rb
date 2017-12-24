class AddBookStockAndBookStateToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :book_stock, :integer
    add_column :books, :book_state, :string
  end
end
