class BooksController < ApplicationController
  # before_action :edit_book_params, only: [ :update_book_details ]
  
  def index
    @books = Book.all
  end

  def new
  end

  def create
  end

  def edit_book_details
    @book = Book.find( params[:id] )
  end
  
  def update_book_details
    @book = Book.find( params[:id] )
    if @book.update_attributes( update_book_params )
      flash[:notice] = 'Updated!'
      redirect_to books_path
    else
      @book.errors
    end
  end

  def edit
    @book = Book.find( params[:id] )
    @reviews = Review.where( :book_id => @book.id )
    @review = Review.new
  end

  def update
    @review = Review.new( review_params )
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
    
    def update_book_params
      params.require(:book).permit( :title )
    end
    
    def review_params
      params.require( :review ).permit( :review_text, :user_id, :book_id )
    end
end
