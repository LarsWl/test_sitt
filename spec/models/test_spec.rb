require 'rails_helper'

RSpec.describe Test, type: :model do
  before do
    0.upto 100 do
      attrs = attributes_for(:test)
      Test.create(attrs);
    end
  end

  describe 'cursor' do
    subject { Test.after(0)}
    it 'return page_limit records' do
      expect(subject.length).to eq(Test.page_limit)
    end

    it 'return right in desk order' do
      expect(subject).to eq(Test.order(:created_at).take(20))
    end
  end
end
