# class IngredientsController < ApplicationController
#   def autocomplete
#     query = params[:query]
#     render json: {results: Ingredient.where("name ILIKE ?", "%#{query}%").all.map{|i| {text: i.name, id: i.id}} }
#   end
# end
