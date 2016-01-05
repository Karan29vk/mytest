class ClientsController < ApplicationController


def new
	@client=Client.new
end

def create
	@client=Client.new(user_param)
	if @client.save
		puts 'Hi this is TGK'
		redirect_to client_path(:id=>@client.id)
	else
		render 'new'
	end
end

def show
@client=Client.find(params[:id])
end

def result 	
	@result=Client.where("#{params["searchrd"]} like ?" ,params["searchtxt"])
end


	private
	def user_param
		params.require(:client).permit(:first_name,:last_name,:email,:password,:address,:gender,:hobby,:dob,:language)
	end
end
