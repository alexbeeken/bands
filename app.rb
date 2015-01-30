require("bundler/setup")
Bundler.require(:default)
also_reload("/lib/**/*.rb")
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get '/bands/:id' do
  @band = Band.find(params.fetch("id"))
  @venues = Venue.all()
  erb(:bands)
end

post '/update_venues' do
  band = Band.find(params.fetch("band_id").to_i)
  venues = []
  venue_ids = params.fetch("venue_ids")
  venue_ids.each() do |id|
      venues.push(Venue.find(id.to_i))
    end
  band.update_venues(venues)
  redirect '/'
end

post '/bands' do
  Band.create({:name => params.fetch('name')})
  redirect '/'
end

post '/venues' do
  Venue.create({:name => params.fetch("name")})
  redirect '/'
end
