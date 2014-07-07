require_relative '../lib/dictionary'
require 'json'

raw_data = File.read("./data/dictionary.json")

json_data = JSON.parse(raw_data)

p Dictionary.new(json_data).define("word")