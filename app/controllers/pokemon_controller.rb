class PokemonController < ApplicationController


    def show
        pokemon_response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
        pokemon_body = JSON.parse(pokemon_response.body)

        pokemon_name  = pokemon_body["name"]
        pokemon_id = pokemon_body["id"]
        pokemon_type = pokemon_body["types"].last["type"]["name"]




        giphy_response = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_API_K"]}&q=#{pokemon_name}")
        giphy_body = JSON.parse(giphy_response.body)
        giphy_url = giphy_body["data"][0]["url"]


        render json: {
            "name": pokemon_name,
            "id": pokemon_id,
            "type": pokemon_type,
            "giphy": "#{giphy_url}"
        }

    end
 #    def types(body)
 #   body["types"].map do |hash|
 #     hash["type"]["name"]
 #   end
 # end
 #
 # def random_gif(body)
 #   body["data"].map do |hash|
 #      hash["url"]
 #   end
 # end

end
