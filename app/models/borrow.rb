class Borrow < ApplicationRecord
  has_many :borrow_items
  has_many :books, through: :borrow_items, source: :book

  def add_book_to_borrow(book)
    bi = borrow_items.build
    bi.book = book
    bi.quantity = 1
    bi.save
  end
end
