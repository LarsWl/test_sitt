require 'rails_helper'

RSpec.describe TestsController, type: :controller do
  describe '#new' do
    it 'render new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#index' do
    before do
      0.upto 100 do
        attrs = attributes_for(:test)
        Test.create(attrs);
      end
    end

    it 'render html' do
      get :index, params: {page_id: 1}
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it 'render json' do
      get :index, params: {page_id: 1, format: :json}
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end

    it 'assigns @tests' do
      get :index, params: {page_id: 1}
      expect(assigns(:tests)).to eq(Test.after(0))
    end
  end

  describe '#create' do
    it 'redirect to index' do
      attrs = attributes_for(:test)
      post :create, params: { test: attrs }
      expect(response).to have_http_status(302)
    end
  end
end
