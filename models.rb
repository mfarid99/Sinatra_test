class Superhero 
    def initialize (name, power)
        @name = name
        @power = power
    end
    def to_json
        {name: @name, power: @power}.to_json
    end
end
