require 'rails_helper'

RSpec.describe Errand, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :category }
    it { should validate_presence_of :urgency }
    it { should validate_presence_of :notes }
    it { should validate_presence_of(:helper_id).allow_nil }
    it { should_not allow_value(nil).for(:completed?) }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :addresses }
  end

  describe 'category' do
    it 'can be created as a grocery errand' do
      errand = create(:errand)

      expect(errand.category).to eq('grocery')
      expect(errand.grocery?).to eq(true)
    end

    it 'can be created as a pharmacy errand' do
      errand = create(:errand, category: 1)

      expect(errand.category).to eq('pharmacy')
      expect(errand.pharmacy?).to eq(true)
    end

    it 'can be created as an other errand' do
      errand = create(:errand, category: 2)

      expect(errand.category).to eq('other')
      expect(errand.other?).to eq(true)
    end
  end

  describe 'urgency' do
    it 'can be created as a low urgency errand' do
      errand = create(:errand)

      expect(errand.urgency).to eq('low')
      expect(errand.low?).to eq(true)
    end

    it 'can be created as a medium urgency errand' do
      errand = create(:errand, urgency: 1)

      expect(errand.urgency).to eq('medium')
      expect(errand.medium?).to eq(true)
    end

    it 'can be created as a high urgency errand' do
      errand = create(:errand, urgency: 2)

      expect(errand.urgency).to eq('high')
      expect(errand.high?).to eq(true)
    end

    it 'can be created a critical urgency errand' do
      errand = create(:errand, urgency: 3)

      expect(errand.urgency).to eq('critical')
      expect(errand.critical?).to eq(true)
    end
  end
end
