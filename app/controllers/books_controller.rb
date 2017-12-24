class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  # def createa
  #   @book = Book.new(
  #   :title => params[:book_title],
  #   :text => params[:book_text]
  #   )
  #
  #   if @book.save
  #     redirect_to books_path
  #   else
  #     render 'new'
  #   end
  # end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :text, :book_state, :book_stock)
  end
end
