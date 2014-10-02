ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../twitter.rb'

include Rack::Test::Methods
	
	def app
		Sinatra::Application
	end
	
describe "SYTW Práctica2-Heroku" do
  
  before :all do
                @usuario_twitter = Amigos_Twitter.new
                @client = my_twitter_client()
                @name1 = "rushilito"
                @name2 = "fsdkhfsd"
        end
  

  it "Debe cargar el index " do
	get '/'
	assert last_response.ok?
  end  	
  

  it "Debe mostrar el titulo de la pagina" do
	get '/'
	assert_match "<title>Popularidad en Twitter</title>", last_response.body
  end



  it "Debe existir formulario donde preguntar nombre y cantidad de amigos a contar?" do
	get '/'
	assert_match "<p ><b>Introduzca su nombre en Twitter: </b></p>", last_response.body
	assert_match "<p ><b>¿Cuántos seguidores desea ver? </b></p>", last_response.body
  end
 

  it "Debe cargar la imagen del pajarito" do
		get '/'
		assert_match '<img src="/bird_icon.png" WIDTH=150 HEIGHT=150 />', last_response.body
  end
  
   it "Debe mostrar el pie de la pagina" do
	get '/'
	assert_match " <p1> <b>© SYTW  </b> Práctica 2 © Realizado por: <b>Rushil Lakhani Lakhani y Adan Rafael Lopez Lecuona.</b></p1>", last_response.body
  end
  
   it "Debe existir el usuario " do
	assert @usuario_twitter.t_usuario(@client,@name1)
  end
  
  it " No Debe existir el usuario " do
	refute @usuario_twitter.t_usuario(@client, @name2)
  end
  
  
  
end  
	
