class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :admin_required, only: [:index, :new, :create, :update, :edit, :destroy]

  def index
    @books = Book.all
  end

  def indexa
    @books = Book.where(:book_state => '上架')
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

  def showa
    @book = Book.find(params[:format])
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

  def book_up
    @book = Book.find(params[:id])
    @book.book_state = "上架"
    @book.save

    redirect_to :back
  end

  def book_down

    @book = Book.find(params[:id])
    @book.update(book_state: "下架")

    redirect_to :back
  end

  private

  def book_params
    params.require(:book).permit(:title, :text, :book_state, :book_stock)
  end
end
