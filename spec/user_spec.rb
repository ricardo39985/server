require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with a username and email" do
    user = User.new(username: "testuser", email: "test@example.com")
    expect(user).to be_valid
  end

  it "generates a UUID primary key" do
    user = User.create(username: "uuiduser", email: "uuid@example.com")
    expect(user.id).to match(/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/)
  end

  it "is invalid without a unique email" do
    User.create(username: "user1", email: "same@example.com")
    user2 = User.new(username: "user2", email: "same@example.com")
    expect(user2).not_to be_valid
  end
end
