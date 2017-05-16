class ReviewsController < ApplicationController
	before_filter :find_model

	def create
		@review = current_user.reviews.create(reviews_params)
		redirect_to @reviews.room
	end

	def destroy
		@review = Review.find(params[:id])
		room = @review.room_id
		@review.destroy
		redirect_to room
	end

	private
	def reviews_params
		params.require(:review).permit(:comment, :star, :room_id)
	end
end