require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

# INGREDIENTS = [
#   {
#     name: "Lemon",
#   },

#   {
#     name: "Whiskey",
#   },

#   {
#     name: "Gin",
#   },

#   {
#     name: "Champagne",
#   }
# ]

# Ingredient.create!(INGREDIENTS)

# COCKTAILS = [
#   {
#     name: "Mojito",
#   },

#   {
#     name: "Martini",
#   },

#   {
#     name: "Whiskey Sour",
#   }
# ]

# Cocktail.create!(COCKTAILS)

# DOSES = [
#   {
#     description: "6oz of Lemon",
#     cocktail: Cocktail.find(1),
#     ingredient: Ingredient.find(1)
#   },

#   {
#     description: "4oz of Champagne",
#     cocktail: Cocktail.find(2),
#     ingredient: Ingredient.find(4)
#   },

#   {
#     description: "10oz of Whiskey",
#     cocktail: Cocktail.find(3),
#     ingredient: Ingredient.find(2)
#   },

#   {
#     description: "100oz of Gin",
#     cocktail: Cocktail.find(2),
#     ingredient: Ingredient.find(3)
#   }
# ]

# Dose.create!(DOSES)


ingredients_url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_file = open(ingredients_url).read
ingredients = JSON.parse(ingredient_file)['drinks']
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

cocktails_url = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
cocktail_file = open(cocktails_url).read
cocktails = JSON.parse(cocktail_file)['drinks']
cocktails.each do |cocktail|
  unless cocktail['strDrinkThumb'].nil?
    Cocktail.create(name: cocktail['strDrink'], image_url: cocktail['strDrinkThumb'])
  end
end

QUANTITY = (1...50).to_a

Cocktail.all.each do |cocktail|
  t = (1...7).to_a.sample
  t.times do
    rand_ingredient = Ingredient.all.sample
    @dose = Dose.new(cocktail: cocktail, ingredient: rand_ingredient, description: "#{QUANTITY.sample} oz of #{rand_ingredient.name}")
    if @dose.save
    else
      puts "#{@dose.cocktail.name} already has #{@dose.ingredient.name}"
    end
  end
end



