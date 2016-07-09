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

			expect{ viking.pick_up_weapon( "rock" ) }.to raise_error

		end



		it 'replaces existing weapon when called' do

			viking.pick_up_weapon( Axe.new )

			# is this the proper call? why does @weapon.name or weapon not work?
			expect( viking.weapon.class ).to eq( Axe )

		end

	end



	describe '#drop_weapon' do

		it 'should leave the viking weaponless when called' do

			viking.pick_up_weapon( Axe.new )
			viking.drop_weapon

			expect( @weapon ).to be_nil

		end


	end



	describe '#receive_attack' do



		it 'should reduce the viking health by the spec amount' do

			allow( viking.receive_attack( damage )).to receive( :take_damage ).with(damage)

			expect( viking.health ).to eq( 140 )

		end

		it 'should call #take_damage' do

			expect( viking ).to receive( :take_damage )

			viking.receive_attack( damage )

		end


	end


	describe '#attack' do


		it 'should reduce victims health when attacked' do

			sven.attack( viking )

			expect( viking.health ).to eq( 147.5 )



		end




		it 'should call #take_damage' do

			expect( sven ).to receive( :take_damage )

			viking.attack( sven )


		end


		it 'should call #damage_fists when no weapons' do

			sven.attack( viking )

			expect( viking.damage_dealt ).to eq( 2.5 )


		end

		it 'should deal Fists multiplier times strength damage when attacking with no weapons' do


			oleg = Viking.new( "Oleg", 150, 100 )
			# strength( 100 ) * fists (.25 ) = 25

			oleg.attack( viking )

			expect( viking.health ).to eq( 125 )



		end



		it 'should run #damage_with_weapon when attacking with weapon' do


			viking.pick_up_weapon( Bow.new( 2 ) )

			viking.attack( sven )

			expect( viking.damage_dealt ).to eq( 20 )




		end



		it 'deals damage equal to Vikings strength times that weapons multiplier' do

			bob = Viking.new("Bob", 100, 10, Axe.new )

			bob.attack( viking )

			expect( viking.health ).to eq( 140 )



		end



		it 'should use fists when bow is out of arrows' do

			lance = Viking.new("Lance", 100, 10, Bow.new(1) )

			lance.drop_weapon

			expect( viking.damage_dealt ).to eq( 2.5 )


		end

		it 'raises an error when Viking is killed' do

			bob = Viking.new( "Bob", 1, 10 )

			expect{ viking.attack( bob ) }.to raise_error("#{bob.name} has Died...")



		end


	end


end #/.Viking