require 'rspec'
require './lib/shelter'
require 'pry'

RSpec.describe Shelter do

  # Iteration 1
  describe '#initialize' do
    it 'is a Shelter' do
      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter).to be_a(Shelter)
    end

    it 'can read the name' do
      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter.name).to eq('Denver Animal Shelter')
    end

    it 'can read the capacity' do
      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter.capacity).to eq(5)
    end

    it 'has no pets by default' do
      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter.pets).to eq []
    end
  end

  # Iteration 2
  describe '#add_pet' do
    it 'returns a list of pets' do
      shelter = Shelter.new('Denver Animal Shelter', 5)
      shelter.add_pet('Salem')
      shelter.add_pet('Beethoven')
      shelter.add_pet('Spot')
      shelter.add_pet('Jonesy')

      expect(shelter.pets).to eq(['Salem', 'Beethoven', 'Spot', 'Jonesy'])
    end
  end

  describe '#call_pets' do
      it 'returns a list of names with exclamation points appended' do
        shelter = Shelter.new('Denver Animal Shelter', 5)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')
        shelter.add_pet('Spot')
        shelter.add_pet('Jonesy')

        expect(shelter.patrons).to eq(['Salem', 'Beethoven', 'Spot', 'Jonesy'])
        expect(shelter.call_pets).to eq(['Salem!', 'Beethoven!', 'Spot!', 'Jonesy!'])
      end
    end

    # Iteration 3
    describe '#over_capacity' do
      it 'can show if the shelter is over capacity' do
        shelter = Shelter.new('Denver Animal Shelter', 3)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')

        expect(shelter.over_capacity?).to be false

        shelter.add_pet('Spot')
        shelter.add_pet('Jonesy')

        expect(shelter.over_capacity?).to be true
      end

      it 'can show if multiple shelters are over capacity' do
        shelter = Shelter.new('Denver Animal Shelter', 6)
        shelter_2 = Shelter.new('Chaffee Animal Shelter', 3)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')
        shelter.add_pet('River')
        shelter.add_pet('Bodi')
        shelter_2.add_pet('Sam')
        shelter_2.add_pet('Buddy')
        shelter_2.add_pet('Dean')
        shelter_2.add_pet('Wicklow')

        expect(shelter.over_capacity?).to be false
        expect(shelter_2.over_capacity?).to be true
      end
    end

    # Iteration 4
    describe '#adopt' do
      it 'removes a pet from the shelter with each adoption' do
        shelter = Shelter.new("Denver Animal Shelter", 3)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')
        shelter.add_pet('Spot')
        shelter.add_pet('Jonesy')

        shelter.adopt

        expect(shelter.over_capacity?).to be false
      end
    end

end
