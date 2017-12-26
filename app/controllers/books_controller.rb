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

  def book_update
    @book = Book.find(params[:id])
    if @book.book_state == "上架"
      @book.update(book_state: "下架")
      flash[:error] = "下架成功"
    else
      @book.update(book_state: "上架")
      flash[:error] = "上架成功"
    end
    redirect_to :back
  end

  def add_to_borrow
    @book = Book.find(params[:id])
    current_borrow.add_book_to_borrow(@book)
    flash[:notice] = "成功加入借书单"
    redirect_to :back
  end

  def borrow
    @book = Book.find(params[:id])
    @book.book_stock = @book.book_stock - 1
    if @book.save
      redirect_to :back
      flash[:error] = "借阅成功"
    else
      flash[:error] = "借阅失败"
    end
  end

  def return_book
    @book = Book.find(params[:id])
    @book.book_stock = @book.book_stock + 1
    if @book.save
      redirect_to :back
      flash[:error] = "还书成功"
    else
      flash[:error] = "还书失败"
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :text, :book_state, :book_stock)
  end
end
