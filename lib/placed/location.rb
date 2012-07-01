module Placed
  class Location
    
    attr_reader :api_key, :address, :lat, :lng, :types, :name, :accuracy, :language, :public, :ref

    def initialize(options = {})
      raise "No address no fun!" if options[:address].nil?
      @api_key  = Placed.config['api_key']
      @address  = options[:address]
      @types    = options[:types] ||= Placed.config['default_types']
      @name     = options[:name] ||= Placed.config['default_name']
      @accuracy = options[:accuracy] ||= Placed.config['default_accuracy']
      @language = options[:language] ||= Placed.config['default_language']
      @lat      = get_coords[:lat] rescue "Unknown"
      @lng      = get_coords[:lng] rescue "Unknown"
      @ref      = placed['results'][0]['reference'] rescue nil
    end

    def get_coords
      data = HTTParty.get("http://maps.google.com/maps/api/geocode/json?address=#{ERB::Util.u(self.address)}&sensor=false")
      return { lat: data['results'][0]['geometry']['location']['lat'], lng: data['results'][0]['geometry']['location']['lng'] } if data['results']
    end
    
    def put
      url = "https://maps.googleapis.com/maps/api/place/add/json?sensor=false&key=#{self.api_key}"
      @result = HTTParty.post(url.to_str, :body => location, :headers => { 'Content-Type' => 'application/json' } )
    end
    
    def remove
      url = "https://maps.googleapis.com/maps/api/place/delete/json?sensor=false&key=#{self.api_key}"
      @result = HTTParty.post(url.to_str, :body => reference, :headers => { 'Content-Type' => 'application/json' } )
      @ref = nil if @result['status'] == "OK"
      return @result
    end
    
    def placed
      data =  HTTParty.get("https://maps.googleapis.com/maps/api/place/search/json?location=#{self.lat},#{self.lng}&radius=3&name=#{ERB::Util.u(self.name)}&sensor=false&key=#{self.api_key}")
      return data
    end

    def location
      { location: { lat: self.lat, lng: self.lng },
               accuracy: self.accuracy,
                   name: self.name,
                  types: [ self.types ],
               language: self.language
       }.to_json
    end
    
    def reference
      { reference: self.ref }.to_json
    end

  end
  
  def self.config
    @config ||= YAML.load_file("#{Rails.root}/config/placed.yml")[Rails.env] rescue nil
  end
  
end
