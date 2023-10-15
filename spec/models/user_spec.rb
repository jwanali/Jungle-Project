require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
  before (:each) do
    @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      email: "jwan.ali@test.com",
      password:"abcd123333",
      password_confirmation: "abcd123333"
      
    )
    @user.save!
  end
  
 
  it "hould user has password matchig password_confirmation " do
    @user.password ="123333333333"
    expect(@user).not_to be_valid
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it "should user be not  valid when password  missing " do
    @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      email: "jwan.ali@test.com",
     
      password_confirmation: "abcd123333"
      
    )
    
    expect(@user).not_to be_valid
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it "should user be not  valid when password_confirmation  missing " do
    @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      email: "jwan.ali@test.com",
      
      password: "abcd123333"
      
    )
    
    expect(@user).not_to be_valid
    expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
  end
  it "should  user be not valid when first name is misssing" do
    @user = User.new(
     
      last_name: "Ali",
      email: "jwan.ali@test.com",
      password:"abcd123333",
      password_confirmation: "abcd123333"
      
    )
    expect(@user).not_to be_valid
    expect(@user.errors.full_messages).to include("First name can't be blank")
   

  end
  it "should  user be not valid when last name is misssing" do
    @user = User.new(
      first_name: "Jwan",
  
      email: "jwan.ali@test.com",
      password:"abcd123333",
      password_confirmation: "abcd123333"
      
    )
    expect(@user).not_to be_valid
    expect(@user.errors.full_messages).to include("Last name can't be blank")

  end
  it "should  user be not valid when email is misssing" do
    @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      
      password:"abcd123333",
      password_confirmation: "abcd123333"
      
    )
    expect(@user).not_to be_valid
    expect(@user.errors.full_messages).to include("Email can't be blank")

  end
  
  it "should  user beEmails must be unique not case sensitive" do
    @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      email: "jwan.ali@TEST.com",
      password:"abcd123333",
      password_confirmation: "abcd123333"
      
    )
    expect(@user).not_to be_valid
    expect(@user.errors.full_messages).to include("Email has already been taken")

  end
  
  it "The password must have a minimum length when a user account is being created" do
    @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      email: "jwan111.ali@TEST.com",
      password:"abcd123",
      password_confirmation: "abcd123"
      
    )
    expect(@user).not_to be_valid
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")

  end
  end


  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "should return instance of the user if successfully authenticated loged in" do
      @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      email: "jwan.ali@test.com",
      password:"abcd123333",
      password_confirmation: "abcd123333"
    )
      @user.save!
      expect(@user).to eq(User.authenticate_with_credentials(" Jwan.ali@test.com", "abcd123333"))
    end
    it "should return nil if fail to log in with wrong email" do
      @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      email: "jwan.ali@test.com",
      password:"abcd123333",
      password_confirmation: "abcd123333"
    )
      @user.save!
      expect(User.authenticate_with_credentials("jwan.123ali@test.com", "abcd123333")).to be_nil
    end
    it "should return nil if fail to log in with wrong password" do
      @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      email: "jwan.ali@test.com",
      password:"abcd123333",
      password_confirmation: "abcd123333"
    )
      @user.save!
      expect(User.authenticate_with_credentials("jwan.ali@test.com", "abcd1233313")).to be_nil
    end
    it "should user login successfully withe spaces before or after their email" do
      @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      email: "jwan.ali@test.com",
      password:"abcd123333",
      password_confirmation: "abcd123333"
    )
      @user.save!
      expect(@user).to eq(User.authenticate_with_credentials(" jwan.ali@test.com ", "abcd123333"))
    end
    it "should user login successfully with wrong case for their email" do
      @user = User.new(
      first_name: "Jwan",
      last_name: "Ali",
      email: "jwan.ali@test.com",
      password:"abcd123333",
      password_confirmation: "abcd123333"
    )
      @user.save!
      expect(@user).to eq(User.authenticate_with_credentials("Jwan.ali@test.com", "abcd123333"))
    end
  end
  
 
end
