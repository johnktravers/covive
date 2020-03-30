require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :email }
    it { should validate_presence_of :role }

    it { should validate_uniqueness_of :email }
    it { should validate_numericality_of(:phone).only_integer }
    it { should validate_length_of(:phone).is_equal_to(10) }
  end

  describe 'relationships' do
    it { should have_many :addresses }
    it { should have_many :errands }
  end

  describe 'roles' do
    it 'can be created as a quarantined user' do
      user = create(:user)

      expect(user.role).to eq('quarantined')
      expect(user.quarantined?).to eq(true)
    end

    it 'can be created as a helper user' do
      user = create(:user, role: 1)

      expect(user.role).to eq('helper')
      expect(user.helper?).to eq(true)
    end
  end
end
