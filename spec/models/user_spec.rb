require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordは6文字以上であれば登録できる" do
        @user.password = 'aaaa1a'
        @user.password_confirmation = 'aaaa1a'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    
      it "first_name1が空では登録できない" do
        @user.first_name1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name1 can't be blank")
      end

      it "first_name1がひらがな、カタカナ、漢字以外では登録できない" do
        @user.first_name1 = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name1 is invalid")
      end

      it "last_name1が空では登録できない" do
        @user.last_name1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name1 can't be blank")
      end

      it "last_name1がひらがな、カタカナ、漢字以外では登録できない" do
        @user.last_name1 = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name1 is invalid")
      end

      it "first_name2が空では登録できない" do
        @user.first_name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name2 can't be blank")
      end

      it "first_name2がカタカナ以外では登録できない" do
        @user.first_name2 = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name2 is invalid")
      end

      it "last_name2が空では登録できない" do
        @user.last_name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name2 can't be blank")
      end

      it "last_name2がカタカナ以外では登録できない" do
        @user.last_name2 = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name2 is invalid")
      end

      it "emailに@が含まれていないと登録できない" do 
        @user.email = 'aaa.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordは5文字以下であれば登録できない" do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordは半角英数字混合での入力がないと登録できない" do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordは全角では登録できない" do
        @user.password = "ｒｒｒｒ１ｒ"
        @user.password_confirmation = "ｒｒｒｒ１ｒ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
end
