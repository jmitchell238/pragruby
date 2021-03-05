require_relative '../../lib/flicks/movie'

module Flicks
  describe Movie do

    before do
      @initial_rank = 10
      @movie = Movie.new('goonies', @initial_rank)
    end

    it 'has a capitalized title' do
      expect(@movie.title).to match('Goonies')
    end

    it 'has an initial rank' do
      # @movie.rank.should == 10
      expect(@movie.rank).to be(10)
    end

    it 'has a string representation' do
      # @movie.to_s.should == 'Goonies has a rank of 10.'
      expect(@movie.to_s).to match('Goonies has a rank of 10.(Hit)')
    end

    it 'increased rank by 1 when given a thumbs up' do
      @movie.thumbs_up

      # @movie.rank.should == @initial_rank + 1
      expect(@movie.rank).to match(@initial_rank + 1)
    end

    it 'decreased rank by 1 when given a thumbs down' do
      @movie.thumbs_down

      # @movie.rank.should == @initial_rank - 1
      expect(@movie.rank).to match(@initial_rank - 1)
    end


    context 'created with a default rank' do
      before do
        @movie = Movie.new('goonies')
      end

      it 'has a rank of 0' do
        # @movie.rank.should == 0
        expect(@movie.rank).to match(0)
      end
    end

    context 'with a rank of at least 10' do
      before do
        @movie = Movie.new('goonies', 10)
      end

      it 'is a hit' do
        # @movie.hit?.should == true
        # @movie.hit?.should be_true
        # @movie.should be_hit
        expect(@movie.hit?).to be(true)
      end

      it 'has a hit status' do
        # @movie.status.should == 'Hit'
        expect(@movie.status).to eq('Hit')
      end

    end

    context 'with a rank of less than 10' do
      before do
        @movie = Movie.new('goonies', 9)
      end

      it 'is not a hit' do
        # @movie.hit?.should == false
        # @movie.hit?.should be_false
        # @movie.should_not be_hit
        expect(@movie.hit?).to be(false)
      end

      it 'has a flop status' do
        # @movie.status.should == 'Flop'
        expect(@movie.status).to eq('Flop')
      end
    end





  end
end
