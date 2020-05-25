require 'rails_helper'

RSpec.describe Test, type: :model do
  before do
    0.upto 100 do
      attrs = attributes_for(:test)
      Test.create(attrs);
    end
  end

  describe 'cursor after' do
    subject { Test.after(Test.first.id-1)}
    it 'return page_limit records' do
      expect(subject.length).to eq(Test.page_limit)
    end

    it 'return right in desk order' do
      expect(subject).to eq(Test.order(:created_at).take(Test.page_limit))
    end

    it 'return chosen number' do
      expect(Test.after(Test.first.id-1, 10).length).to eq(10)
    end

    it 'return record right with chosen number' do
      expect(Test.after(Test.first.id-1, 10)).to eq(Test.order(:created_at).take(10))
    end
  end

  describe  'cursor before' do
    subject { Test.before(Test.last.id+1)}
    puts  Test.before(21).length
    it 'return page_limit records' do
      expect(subject.length).to eq(Test.page_limit)
    end

    it 'return right in desk order' do
      expect(subject).to eq(Test.order(:created_at).last(Test.page_limit))
    end

    it 'return chosen number' do
      expect(Test.before(Test.last.id, 10).length).to eq(10)
    end

    it 'return record right with chosen number' do
      expect(Test.before(Test.last.id+1, 10)).to eq(Test.order(:created_at).last(10))
    end
  end
end
