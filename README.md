# Placed

Placed is a gem created to raw interact with google api places.

It is in a completely embryonic state, and (for now) is not recommended for use in production projects.

But ... you could use it at your own risk!

## Installation

Add this line to your application's Gemfile:

	gem 'placed'

And then execute:

    $ bundle

Then...

	$ rails g placed:config 

It creates Placed gem configuration file at config/placed.yml, feed it with your base config + a valid Google Places API KEY


## Usage

Instantiate a place

	@somewhat = Placed::Location.new(address: "Calle Mallorca 401 08013 Barcelona", name: "Sagrada Familia")
	
Play a bit.. (all results are in json, directly from the Places API)

	@somewhat.location

Returns a json object, which is to be used to send to the API

	@somewhat.put

Perform a post, sending the object and loading it into the API

	@somewhat.remove

Perform a post, deleting object from the API

	@somewhat.reference

Returns the API unique identifier

    @somewhat.get_coords

Just query the api, and transforms the address in coordinates

    @somewhat.place

Returns information about whether or not it is loaded in the api

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
