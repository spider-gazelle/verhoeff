require "./spec_helper"

describe Verhoeff do
  it "works" do
    Verhoeff.generate_checksum("1234").should eq 0
    Verhoeff.validate_verhoeff("12340").should be_true

    Verhoeff.generate_checksum("75872").should eq 2
    Verhoeff.validate_verhoeff("758722").should be_true

    Verhoeff.generate_checksum("12345").should eq 1
    Verhoeff.validate_verhoeff("123451").should be_true

    Verhoeff.generate_checksum("142857").should eq 0
    Verhoeff.validate_verhoeff("1428570").should be_true

    Verhoeff.generate_checksum("123456789012").should eq 0
    Verhoeff.validate_verhoeff("1234567890120").should be_true

    Verhoeff.generate_checksum("8473643095483728456789").should eq 2
    Verhoeff.validate_verhoeff("84736430954837284567892").should be_true

    Verhoeff.validate_verhoeff("122451").should be_false
    Verhoeff.validate_verhoeff("128451").should be_false
  end
end