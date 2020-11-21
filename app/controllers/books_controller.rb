class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book.id), notice:"Book was successfully created." #データ更新/削除が必要な場合(controllerの処理が必要)に使用
    else
      @books = Book.order("id")
      render :index  #ログインや入力形式に失敗した場合など(ただエラーを表示させるだけ)に使用
    end
  end

  def index
    @book = Book.new           #同ページに新規投稿フォームを置くためrender使用しているのでメソッドが必要
    @books = Book.order("id")  #デフォルトでASCに指定済みでIDが若い順に表示
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
      redirect_to book_path(@book.id), notice:"Book was successfully updated."
    else
      render 'edit'
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
