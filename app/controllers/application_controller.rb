class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  #NEW
  get '/recipes/new' do
    erb :new
  end

  #INDEX
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #SHOW
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end


  #EDIT
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  #UPDATE
  # get 'recipes/:id' do
  #   @recipe = Recipe.find(params[:id])
  #   @recipe.update(params[:recipe])
  #   @recipe.save
  #   redirect :"recipes/#{@recipe.id}"
  # end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  #CREATE

  post '/recipes' do  #creates a recipe
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end


  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    erb :delete
  end

end
