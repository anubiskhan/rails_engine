require 'rails_helper'

describe 'customers API' do
  it 'sends all customers' do
    create_list(:customer, 5)

    get '/api/v1/customers'

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(5)
  end
  it 'sends one customer by id' do
    customer = create(:customer)

    get "/api/v1/customers/#{customer.id}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['id']).to eq(customer.id)
    expect(json['invoice_id']).to eq(customer.invoice_id)
  end
  it 'finds one customer by id' do
    customer = create(:customer)

    get "/api/v1/customers/find?id=#{customer.id}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(customer.id)
  end
  it 'finds one customer by first name' do
    customer = create(:customer)

    get "/api/v1/customers/find?first_name=#{customer.first_name}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(customer.id)
  end
  it 'finds one customer by last name' do
    customer = create(:customer)

    get "/api/v1/customers/find?last_name=#{customer.last_name}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(customer.id)
  end
  it 'finds one customer by created at' do
    customer = create(:customer)

    get "/api/v1/customers/find?created_at=#{customer.created_at}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(customer.id)
  end
  it 'finds one customer by updated at' do
    customer = create(:customer)

    get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(customer.id)
  end
  it 'finds all customers by id' do
    customer = create(:customer)

    get "/api/v1/customers/find_all?id=#{customer.id}"

    json = JSON.parse(response.body)

    expect(json[0]["id"]).to eq(customer.id)
  end
  it 'finds all customers by first name' do
    customers = create_list(:customer, 10)

    get "/api/v1/customers/find_all?first_name=#{customers.first.first_name}"

    json = JSON.parse(response.body)

    customers.each_with_index do |customer, index|
      expect(json[index]["id"]).to eq(customer.id)
    end
  end
  it 'sends a random customer' do
    customer = create(:customer)

    get '/api/v1/customers/random'

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(customer.id)
  end
end