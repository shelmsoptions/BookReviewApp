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
    @review.book.user_id = current_user.id
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to reviews_path, notice: 'Review and Book Entered' }
      else
        format.html { render :new, notice: 'Not saved!' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  
  private
  
  def review_params
    params.require( :review ).permit( :review_text, :user_id, :book_id, 
      book_attributes: [ :title , user_attributes: [ :user_id ], author_attributes: [ :full_name ] ] )
  end
end
