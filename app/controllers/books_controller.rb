class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.order("id")#デフォルトでASCに指定されておりIDが若い順に表示
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book.id), notice:"Book was successfully created."
    else
      redirect_to books_path, alert:"Error! Please fill in all."
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path, notice:"Book was successfully updated."
    else
      redirect_to edit_book_path(book.id), alert:"Error! Please fill in all."
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice:"Book was successfully destroyed."
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end
