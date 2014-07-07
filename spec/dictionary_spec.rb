require_relative '../lib/dictionary'
require 'rspec'

describe Dictionary do

  it 'takes a given word and returns the definition along with any referenced words urls' do
    input_hash =
      {
        "word" => {
          "definition" => "a {collection} of {letters}",
          "url" => "//example.com/word"
        },
        "letter" => {
          "definition" => "a character representing one or more of the sounds used in speech; any of the symbols of an alphabet",
          "url" => "//example.com/letter"
        },
        "collection" => {
          "definition" => "a group of things or people",
          "url" => "//example.us/collection"
        }
      }
    expected = {
      definition: "a collection of letters",
      see_also: [
        "//example.us/collection",
        "//example.com/letter"
      ]
    }
    expect(Dictionary.new(input_hash).define("word")).to eq expected
  end
end