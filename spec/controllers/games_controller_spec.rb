require 'rails_helper'

describe GamesController, type: :controller do

  describe 'GET #index' do
    let!(:game1) { create :game }
    let!(:game2) { create :game }

    context 'without keywords' do
      it 'returns all games' do
        get :index
        expect(response.body).to eq(Game.all.to_json)
      end
    end
  end

end
