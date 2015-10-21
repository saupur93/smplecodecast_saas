class ContractsController < ApplicationController
	def new
		@contract = Contract.new
	end

	def create
		@contract = Contract.new(contract_params)
		if @contract.save
			flash[:success] = "Message sent."
			redirect_to new_contract_path
		else
			flash[:danger] = "Error occured, message has not been sent."
			redirect_to new_contract_path
		end
	end
	private
	  def contract_params
	  	params.require(:contract).permit(:name, :email, :comments)
	  end
  
end
