class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new( book_params )
    @book.user_id = current_user.id
    
    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book Entered' }
      else
        format.html { render :new, notice: 'Not saved!' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
    def book_params
      params.require( :book ).permit( :title, :user_id )
    end
end
