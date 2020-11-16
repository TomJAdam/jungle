require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Validates password and password_confirmation are the same' do 
      @user = User.create(first_name: 'Bob', last_name: 'Bobberson', email: 'bob@bobby.com', password: 'bigbob', password_confirmation: 'bigbob')
    
      expect(@user).to be_valid
    end
    it 'Validates password and password_confirmation are not the same' do 
      @user = User.create(first_name: 'Bob', last_name: 'Bobberson', email: 'bob@bobby.com', password: 'bigbob', password_confirmation: 'bigbob1')
    
      expect(@user).not_to be_valid
    end
    it 'Validates email must be unique' do 
      @user = User.create(first_name: 'Bob', last_name: 'Bobberson', email: 'bob@bobby.com', password: 'bigbob', password_confirmation: 'bigbob')
      @user_two = User.create(first_name: 'Bob', last_name: 'Bobberson', email: 'bob@bobby.com', password: 'bigbob', password_confirmation: 'bigbob')
      
      expect(@user_two).not_to be_valid
    end
    it 'Validates first_name is required' do 
      @user = User.create(first_name: nil, last_name: 'Bobberson', email: 'bob@bobby.com', password: 'bigbob', password_confirmation: 'bigbob')
    
      expect(@user).not_to be_valid
    end
    it 'Validates last_name is required' do 
      @user = User.create(first_name: 'Bob', last_name: nil, email: 'bob@bobby.com', password: 'bigbob', password_confirmation: 'bigbob')
    
      expect(@user).not_to be_valid
    end
    it 'Validates email is required' do 
      @user = User.create(first_name: 'Bob', last_name: 'Bobberson', email: nil, password: 'bigbob', password_confirmation: 'bigbob')
    
      expect(@user).not_to be_valid
    end
    it 'Validates password is minimum 6 characters long' do 
      @user = User.create(first_name: 'Bob', last_name: 'Bobberson', email: 'bob@bobby.com', password: 'bigbo', password_confirmation: 'bigbob')
    
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'Validates authenticate_with_credentials' do
      @user = User.create(first_name: 'Bob', last_name: 'Bobberson', email: 'bob@bobby.com', password: 'bigbob', password_confirmation: 'bigbob')
      
      @user_logged_in = User.authenticate_with_credentials('bob@bobby.com', 'bigbob')

      expect(@user_logged_in).not_to be(nil)
    end
    it 'Validates authenticate_with_credentials works with spaces at the start of email' do
      @user = User.create(first_name: 'Bob', last_name: 'Bobberson', email: 'bob@bobby.com', password: 'bigbob', password_confirmation: 'bigbob')
      
      @user_logged_in = User.authenticate_with_credentials('    bob@bobby.com', 'bigbob')

      expect(@user_logged_in).not_to be(nil)
    end
    it 'Validates authenticate_with_credentials works with case irregularities' do
      @user = User.create(first_name: 'Bob', last_name: 'Bobberson', email: 'bob@bobby.com', password: 'bigbob', password_confirmation: 'bigbob')
      
      @user_logged_in = User.authenticate_with_credentials('BOb@boBBy.com', 'bigbob')

      expect(@user_logged_in).not_to be(nil)
    end
  end
end
