class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def show
    @venue_id = params.fetch("an_id")
    matching_venues = Venue.where({ :id => @venue_id })
    @the_venue = matching_venues.at(0)
    puts "getting all user ids:"
    @user_ids = User.all_user_ids
    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    @venue = Venue.new
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("name")
    venue.neighborhood = params.fetch("neighborhood")
    venue.save

    redirect_to("/venues/#{venue.name}")
  end
  
  def update
    the_id = params.fetch("the_id")

    @venue = Venue.where({ :id => the_id }).at(0)
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    @venue.save
    
    redirect_to("/venues/#{@venue.id}")
  end

  def delete
    the_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues
    Venue.destroy(the_id)

    redirect_to("/venues")
  end

end
