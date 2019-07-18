require 'swagger_helper'

describe 'Colors API' do

  path '/colors' do

    post 'Creates a color' do
      tags 'Colors'
      consumes 'application/json', 'application/xml'
      parameter name: :color, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          hexCode: { type: :string },
          rgbCode: { type: :string }
        },
        required: [ 'name', 'hexCode', 'rgbCode' ]
      }

      response '201', 'color created' do
        let(:color) { { name: 'foo', hexCode: '#FFFFFF', rgbCode: 'rgb(255,255,255)' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:color) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/colors/{id}' do

    get 'Retrieves a color' do
      tags 'Colors'
      produces 'application/json', 'application/xml'
      parameter name: :id, :fin => :path, :type => :string

      response '200', 'color found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            hexCode: { type: :string },
            rgbCode: { type: :string }
          },
          required: [ 'id', 'name', 'hexCode', 'rgbCode' ]

        let(:id) { Color.create(name: 'foo', hexCode: '#FFFFFF', rgbCode: 'rgb(255,255,255)').id }
        run_test!
      end

      response '404', 'color not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end