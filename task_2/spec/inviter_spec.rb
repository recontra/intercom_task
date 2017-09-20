require_relative "../inviter"

describe Inviter do
  describe "#invite" do
    it "invites user in default radius from provided file" do
      inviter = Inviter.new("spec/test1.txt")
      expect(inviter.invite.size).to be(2)
      expect(inviter.invite).to eq([[1, "User in Dublin Airport"], [10, "User in Dublin"]])
    end

    it "invites no user if file empty" do
      inviter = Inviter.new("spec/test2.txt")
      expect(inviter.invite.size).to be(0)
    end

    it "invites user within provided radius" do
      inviter = Inviter.new("spec/test1.txt")
      expect(inviter.invite(300).size).to be(4)
      expect(inviter.invite(300)).to eq([
        [1, "User in Dublin Airport"],
        [2, "User in Cork"],
        [4, "User in Galway"],
        [10, "User in Dublin"]
      ])
    end
  end
end
