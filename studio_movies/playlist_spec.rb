require_relative 'playlist'
require_relative 'waldorf_and_statler'


# Tried to make this original and push to master
describe Playlist do

  before do
    @playlist = Playlist.new('Kermit')

  end

  context 'being played with one movie' do
    before do
      @initial_rank = 10
      @movie = Movie.new('goonies', @initial_rank)
      @playlist.add_movie(@movie)

    end

    it 'gives the movie a thumbs up if a high number is rolled' do
      # @playlist.stub(:roll_die).and_return(5)
      allow(WaldorfAndStatler).to receive(:roll_die) { 5 }
      @playlist.play

      # @movie.rank.should == @initial_rank + 1
      expect(@movie.rank).to eq(@initial_rank + 1)
    end

    it 'gives the movie a thumbs up if a high number is rolled' do
      # @playlist.stub(:roll_die).and_return(5)
      allow(WaldorfAndStatler).to receive(:roll_die) { 5 }
      @playlist.play

      # @movie.rank.should == @initial_rank + 1
      expect(@movie.rank).to eq(@initial_rank + 1)
    end

    it 'skips the movie if a medium number is rolled' do
      # @playlist.stub(:roll_die).and_return(3)
      allow(WaldorfAndStatler).to receive(:roll_die) { 3 }
      @playlist.play

      # @movie.rank.should == @initial_rank
      expect(@movie.rank).to eq(@initial_rank)
    end

    it 'gives the movie a thumbs down if a low number is rolled' do
      # @playlist.stub(:roll_die).and_return(1)
      allow(WaldorfAndStatler).to receive(:roll_die) { 1 }
      @playlist.play

      # @movie.rank.should == @initial_rank - 1
      expect(@movie.rank).to eq(@initial_rank - 1)
    end
  end
end

