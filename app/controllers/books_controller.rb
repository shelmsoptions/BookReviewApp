class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @book.author = Author.new
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
    @book = Book.find( params[:id] )
    @reviews = Review.where( :book_id => @book.id )
  end

  def update
  end

  def destroy
    Book.find( params[:id] ).destroy
    redirect_to books_path
  end
  
  private
    def book_params
      params.require(:book).permit( :title, :user_id, :author_id,
        author_attributes: [ :full_name ] )
    end
end
