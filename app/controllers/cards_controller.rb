class CardsController < ApplicationController

	def sort
		cards = params[:card]
		cards.each.with_index do |card, index|
			Card.find(card).update(position: (index + 1))
		end
		respond_to do |format|
			format.js {head :no_content}
		end
	end

	def create
		@project = Project.find(params[:project_id])
		@card = Card.create(title: "new card", body: "write something here:", project_id: @project.id)
		respond_to do |format|
		format.html { redirect_to @project, notice: "new card added" }
		format.js
		end
	end


	def update
		@card = Card.find(params[:id])
	    if @card.update(params.require(:card).permit(:title, :body))
	      respond_to do |format|
	        format.html { redirect_to @card.project, notice: 'Card was successfully updated!' }
	        format.json { respond_with_bip(@card) }
	      end
	    else
	      respond_to do |format|
	        format.html { redirect_to @card.project, notice: 'Something went wrong' }
	        format.json { respond_with_bip(@card) }
	    	end
	    end
	end


	def destroy
		@card = Card.find(params[:id])
		@project = Project.find(params[:project_id])
		@card.destroy
		respond_to do |format|
			format.html { redirect_to @project, notice: "Card deleted" }
			format.js { head :no_content }
		end
	end

end
