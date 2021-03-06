require 'rails_helper'

RSpec.describe SeekersController, type: :controller do

#-------------------------------------------------------------------------------
	describe "GET #index" do
	    before :each do
	    	get :index
	    end
	    it "should render the correct page" do
	      expect(response).to render_template("index")
	    end
	    it "have status code of 200" do 
	      expect(response).to have_http_status(200)
	    end
	end
#-------------------------------------------------------------------------------
	describe "GET #show" do
	    before :each do
	    	@seeker1 = Seeker.create(first_name: "John", last_name: "Thomas", email: "John@example.com", phone:"555-555-5555", job_type: "painter",password: "password", password_confirmation: "password", zipcode: "90039", date_available: "05/15", skill_set: "roofer", work_exp: "10")
	    	get :show, id: @seeker1
	    end
	    it "should render the correct page" do
	      expect(response).to render_template("show")
	    end
	    it "have status code of 200" do 
	      expect(response).to have_http_status(200)
	    end
	    it "assigns @seeker to include seeker" do
	      expect(assigns(:seeker)).to eq(@seeker1)
	    end
	end
#-------------------------------------------------------------------------------
	describe "GET #new" do
    before do
    	get :new
    end
    it "renders the new template with status 200 " do
        expect(response).to render_template("new")
        expect(response).to have_http_status(200)
    end 
    it "is not persisted" do
       expect{Seeker.new}.to change(Seeker, :count).by(0)
    end 
  end
#-------------------------------------------------------------------------------
  describe "POST #create" do
    it "persists an item to the DB" do
      expect{Seeker.create(first_name: "John", last_name: "Thomas", email: "John@example.com", phone:"555-555-5555", job_type: "painter",password: "password", password_confirmation: "password", zipcode: "90039", date_available: "05/15", skill_set: "roofer", work_exp: "10")}.to change(Seeker, :count).by(1)
    end
  end
#-------------------------------------------------------------------------------



end  #end of RSpec
