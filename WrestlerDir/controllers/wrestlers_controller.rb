class WrestlersController < Sinatra::Base

	set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
	set :views, Proc.new { File.join(root, "views") }

  # Turn on Sinatra Reloader
  	configure :development do
      	register Sinatra::Reloader
  	end

  	get '/' do

  		@title = "Wrestlers Alumni"

  		@wrestlers = Wrestler.all

  		erb :'wrestlers/index'

  	end

    # get '/wrestlers/new' do


    #   @wrestler = Wrestler.new 

    #   erb :'wrestlers/new'

    # end

  	get '/new' do

  		@wrestler = Wrestler.new 

  		erb :'wrestlers/new'

  	end

  	get '/:id' do

  		id = params[:id].to_i

  		@wrestler = Wrestler.find id

  		erb :'wrestlers/show'

  	end

  	post '/' do

  		wrestler = Wrestler.new

  		wrestler.name = params[:name]
  		wrestler.height = params[:height]
  		wrestler.weight = params[:weight]
  		wrestler.origin = params[:origin]
  		wrestler.finisher = params[:finisher]

  		wrestler.save

  		redirect "/"

  	end

  	put '/:id' do

  		id = params[:id].to_i

  		wrestler = Wrestler.find id

  		wrestler.name = params[:name]
  		wrestler.height = params[:height]
  		wrestler.weight = params[:weight]
  		wrestler.origin = params[:origin]
  		wrestler.finisher = params[:finisher]

  		wrestler.save

  		redirect "/"

  	end

  	delete '/:id' do

  		id = params[:id].to_i

  		Wrestler.destroy id

  		redirect "/"

  	end

  	get '/:id/edit' do

  		id = params[:id].to_i

  		@wrestler = Wrestler.find id

  		erb :'wrestlers/edit'

  	end

  end

