class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @review.book = Book.new
    @review.book.author = Author.new
  end

  def create
    @review = Review.new( review_params )
    @review.user_id = current_user.id
    
    if @review.book.user_id
    else
      @review.book.user_id = current_user.id
    end
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to edit_book_path(@review.book_id), notice: 'Review and Book Entered' }
      else
        format.html { render :new, notice: 'Not saved!' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @review = Review.find( params[:id] )
    @book = Book.find( @review.book_id )
  end

  def update
    @review = Review.find( params[:id] )
    if @review.update( review_params )
      redirect_to edit_book_path(@review.book_id)
    end
  end

  def show
  end

  def destroy
    review = Review.find( params[:id] )
    book_id = review.book_id
    Review.find( params[:id] ).destroy
    redirect_to edit_book_path( book_id )
  end
  
  private
  
  def review_params
    params.require( :review ).permit( :review_text, :user_id, :book_id, 
      book_attributes: [ :title , user_attributes: [ :user_id ], author_attributes: [ :full_name ] ] )
  end
end
