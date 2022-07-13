require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
  #GET /
  #Room path (homepage, index page)
    get '/' do
      # return "Hello World!"
      return erb(:index)
    end

    get '/hello' do
      @name = params[:name]
      return erb(:index)
    end

    # get '/names' do
    #   names = params[:names]
    #   return "#{names}"
    # end

    post '/submit' do
      name = params[:name]
      message = params[:message]
      return "Thanks #{name}, you sent this message: #{message}"
    end

   post '/sort-names' do
    names = params[:names]
    return names.split(",").sort.join(", ")
   end



end

#incoming request Get/todos/1
#when this comes in the only code that will be executed will be the second option below. 

# incoming request Get / posts 
# since this is not one of the options below it will send back an error instead of executing anyting. 

# Routes

#Get / -> execute some code
#Get /todos/1 -> execute some different piece of code

#POST / todos -> execute some different code. 
#We write tese as part of our application class and runs in the background ready to recieve a request. 