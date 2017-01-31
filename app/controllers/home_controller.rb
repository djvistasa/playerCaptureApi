class HomeController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def index

  end

  def create_player
    @data = { success: 0, message: "Invalid request!" }

    player = Player.create(
        name: params['name'],
        surname: params['surname'],
        age: params['age'],
        sport: ['sport'],
        team: ['team'],
        position: ['position'],
        nationality: ['nationality'],
        height: ['height'],
        weight: ['weight'],
        avatar: params['avatar']
    )

    @players = Player.all

    if player.save
      @data = {
          message: "player created succesfully",
          success: 1,
          players: @players
      }

    else
      @data[:message] = client.errors.full_messages

    end



    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end
end
