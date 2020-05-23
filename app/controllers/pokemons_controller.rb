# frozen_string_literal: true

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    render json: @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render json: @pokemon
    else
      render json: @pokemon.errors
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :main_type, :main_ability)
  end
end