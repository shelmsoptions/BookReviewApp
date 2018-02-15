class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def create
  end

  def edit
    @book = Book.find( params[:id] )
    @reviews = Review.where( :book_id => @book.id )
    @review = Review.new
  end

  def update
    @review = Review.new( review_params )
    # @book = Book.find( params[:id] )
    
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
    
    def review_params
      params.require( :review ).permit( :review_text, :user_id, :book_id )
    end
end
