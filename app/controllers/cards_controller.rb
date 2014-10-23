class CardsController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@card = Card.create(title: "new card", body: "write something here:", project_id: @project.id)
		respond_to do |format|
		format.html { redirect_to @project, notice: "new card added" }
		format.js
		end
	end


	def update

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
