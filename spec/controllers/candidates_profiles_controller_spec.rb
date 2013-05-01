require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CandidatesProfilesController do

  # This should return the minimal set of attributes required to create a valid
  # CandidatesProfile. As you add validations to CandidatesProfile, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "tag_name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CandidatesProfilesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all candidates_profiles as @candidates_profiles" do
      candidates_profile = CandidatesProfile.create! valid_attributes
      get :index, {}, valid_session
      assigns(:candidates_profiles).should eq([candidates_profile])
    end
  end

  describe "GET show" do
    it "assigns the requested candidates_profile as @candidates_profile" do
      candidates_profile = CandidatesProfile.create! valid_attributes
      get :show, {:id => candidates_profile.to_param}, valid_session
      assigns(:candidates_profile).should eq(candidates_profile)
    end
  end

  describe "GET new" do
    it "assigns a new candidates_profile as @candidates_profile" do
      get :new, {}, valid_session
      assigns(:candidates_profile).should be_a_new(CandidatesProfile)
    end
  end

  describe "GET edit" do
    it "assigns the requested candidates_profile as @candidates_profile" do
      candidates_profile = CandidatesProfile.create! valid_attributes
      get :edit, {:id => candidates_profile.to_param}, valid_session
      assigns(:candidates_profile).should eq(candidates_profile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CandidatesProfile" do
        expect {
          post :create, {:candidates_profile => valid_attributes}, valid_session
        }.to change(CandidatesProfile, :count).by(1)
      end

      it "assigns a newly created candidates_profile as @candidates_profile" do
        post :create, {:candidates_profile => valid_attributes}, valid_session
        assigns(:candidates_profile).should be_a(CandidatesProfile)
        assigns(:candidates_profile).should be_persisted
      end

      it "redirects to the created candidates_profile" do
        post :create, {:candidates_profile => valid_attributes}, valid_session
        response.should redirect_to(CandidatesProfile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved candidates_profile as @candidates_profile" do
        # Trigger the behavior that occurs when invalid params are submitted
        CandidatesProfile.any_instance.stub(:save).and_return(false)
        post :create, {:candidates_profile => { "tag_name" => "invalid value" }}, valid_session
        assigns(:candidates_profile).should be_a_new(CandidatesProfile)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CandidatesProfile.any_instance.stub(:save).and_return(false)
        post :create, {:candidates_profile => { "tag_name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested candidates_profile" do
        candidates_profile = CandidatesProfile.create! valid_attributes
        # Assuming there are no other candidates_profiles in the database, this
        # specifies that the CandidatesProfile created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CandidatesProfile.any_instance.should_receive(:update_attributes).with({ "tag_name" => "MyString" })
        put :update, {:id => candidates_profile.to_param, :candidates_profile => { "tag_name" => "MyString" }}, valid_session
      end

      it "assigns the requested candidates_profile as @candidates_profile" do
        candidates_profile = CandidatesProfile.create! valid_attributes
        put :update, {:id => candidates_profile.to_param, :candidates_profile => valid_attributes}, valid_session
        assigns(:candidates_profile).should eq(candidates_profile)
      end

      it "redirects to the candidates_profile" do
        candidates_profile = CandidatesProfile.create! valid_attributes
        put :update, {:id => candidates_profile.to_param, :candidates_profile => valid_attributes}, valid_session
        response.should redirect_to(candidates_profile)
      end
    end

    describe "with invalid params" do
      it "assigns the candidates_profile as @candidates_profile" do
        candidates_profile = CandidatesProfile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CandidatesProfile.any_instance.stub(:save).and_return(false)
        put :update, {:id => candidates_profile.to_param, :candidates_profile => { "tag_name" => "invalid value" }}, valid_session
        assigns(:candidates_profile).should eq(candidates_profile)
      end

      it "re-renders the 'edit' template" do
        candidates_profile = CandidatesProfile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CandidatesProfile.any_instance.stub(:save).and_return(false)
        put :update, {:id => candidates_profile.to_param, :candidates_profile => { "tag_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested candidates_profile" do
      candidates_profile = CandidatesProfile.create! valid_attributes
      expect {
        delete :destroy, {:id => candidates_profile.to_param}, valid_session
      }.to change(CandidatesProfile, :count).by(-1)
    end

    it "redirects to the candidates_profiles list" do
      candidates_profile = CandidatesProfile.create! valid_attributes
      delete :destroy, {:id => candidates_profile.to_param}, valid_session
      response.should redirect_to(candidates_profiles_url)
    end
  end

end