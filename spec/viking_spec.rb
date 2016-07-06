require 'spec_helper'
require 'viking'
require 'weapons/weapon'


describe '.Viking' do

	let(:viking){ Viking.new("Joe", 150) }
	let(:sven){ Viking.new }
	let(:damage){ 10 }

	describe '#initialize' do

		it 'sets the viking name when passed in' do

			expect( viking.name ).to eq( "Joe" )

		end

		it 'sets the health attribute when passed in' do

			expect( viking.health ).to eq( 150 )

		end

		it 'health attr cannot be overwritten once set' do

			expect{ viking.health = 1000 }.to raise_error( NoMethodError )

		end

		it 'Vikings weapon is nil when initialized' do

			expect( viking.weapon ).to be_nil

		end



	end


	describe '#pick_up_weapon' do

		it 'should set the weapon to viking when picked up' do

			sven =  Viking.new

			sven.pick_up_weapon( Bow.new(2) )

			expect( sven.weapon.name ).to eq( "Bow" )


		end



		it 'should raise exception when not a weapon' do
			#calling with error("can't...") raises RunTimeError
			expect{ viking.pick_up_weapon( "rock" ) }.to raise_error

		end



		it 'replaces existing weapon when called' do

			viking.pick_up_weapon( Axe.new )

			# is this the proper call? why does @weapon.name or weapon not work?
			expect( viking.weapon.name ).to eq( "Axe" )

		end

	end



	describe '#drop_weapon' do

		it 'should leave the viking weaponless when called' do

			viking.pick_up_weapon( Axe.new )
			viking.drop_weapon

			# weapon already nil - is this called correctly?
			expect( @weapon ).to be_nil

		end


	end



	describe '#receive_attack' do



		it 'should reduce the viking health by the spec amount' do

			allow( viking.receive_attack( damage )).to receive( :take_damage ).with(damage)

			expect( viking.health ).to eq( 140 )

# why does allow not raise an error but expect does?
		end

		it 'should call #take_damage' do


			expect( viking ).to receive( :take_damage ).with( damage )

			viking.receive_attack( damage )

		end


	end


	describe '#attack' do


		it 'should reduce victims health when attacked' do

			sven.attack( viking )

			expect( viking.health ).to eq( 147.5 )



		end


# stubbing methods on a double, what does that mean exactly, what methods are stubbed (already in the code as replacements?), how are those stubbed if they call other methods as well?

		it 'should call #take_damage when called' do

			allow( sven ).to receive(:puts).and_return("")
			expect( sven ).to receive( :take_damage )

			viking.attack( sven )


		end



		# use a double here?
		it 'should call #damage_fists when no weapons' do

			allow( sven ).to receive( :take_damage )
			expect( sven ).to receive( :damage_with_fists )

			sven.attack( viking )

		end

		it 'should deal Fists multiplier times strength damage when attacking with no weapons' do


			oleg = Viking.new( "Oleg", 150, 100 )
			# strength( 100 ) * fists (.25 ) = 25


			expect( viking.health ).to eq( 125 )

			oleg.attack( viking )


		end



		it 'should run #damage_with_weapon when attacking with weapon'

			#bob = Viking.new("Bob", 100, 10, Axe.new )
			#bob.attack( viking )

			#expect( viking ).to receive( :attack ).with( :damage_with_weapon )




		it 'deals damage equal to Vikings strength times that weapons multiplier' do

			bob = Viking.new("Bob", 100, 10, Axe.new )

			bob.attack( viking )

			expect( viking.health ).to eq( 140 )


		end



		it 'should use fists when bow is out of arrows' do

			lance = Viking.new("Lance", 100, 10, Bow.new(1) )
			lance.attack( viking )
			lance.attack( viking )
# expected 1 times received 0 times with any args
			expect( lance ).to receive( :damage_with_fists )

		end

		it 'raises an error when Viking is killed' do

			bob = Viking.new( "Bob", 1, 10 )
			viking.attack( bob )

			expect{ bob }.to raise_error

		end


	end

end #/.Viking