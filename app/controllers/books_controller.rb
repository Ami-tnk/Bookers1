class BooksController < ApplicationController

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/'
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end
