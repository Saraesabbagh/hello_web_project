# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET to /" do
    it "contains a h1 title" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1> Hello World! </h1>')
    end

    it "contains a div" do
      response = get('/')
      expect(response.body).to include ('<div>')
    end

  end

    

  # context "Get to /names" do
  #   it "returns 200 OK with the right content" do
  #     response = get("/names")
  #     expect(response.status).to eq(200)
  #     expect(response.boy).to eq("Julia, Mary, Karim")
  #   end

  # context "POST to /submit" do
  #   it "returns 200 OK with the right content" do
  #     # Send a POST request to /submit
  #     # with some body parameters
  #     # and returns a response object we can test.
  #     response = post("/submit" name: "Leo", message: ("Hello World")

  #     # Assert the response status code and body.
  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq("Thanks Leo, you sent this message: "Hello World")
  #   end
  # end

  context "POST to /sort-names" do
    it "returns 200 OK with the correct list sorted alphabhetically" do
      response = post("/sort-names", names: "Joe, Alice, Zoe, Julia, Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq(" Alice,  Julia,  Kieran,  Zoe, Joe")

    end
  end

end

