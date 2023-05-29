class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a
    @random_letters = @letters.sample(10).join(' ')
  end

  def score
    @answer = params[:answer].downcase.split
    @random_letters = params[:random_letters].split
    if check_presence(@answer, @random_letters)
      @result = 'Word in grid, congrats!'
    else
      @result = 'Not in grid'
    end
  end

  def check_presence(answer, letters)
    @answer.all? do |letter|
      @answer.count(letter) <= @random_letters.count(letter)
    end
  end
end
