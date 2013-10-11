require 'faker'
require_relative 'main'

Comment.delete_all
Newslink.delete_all

5.times do |i|
  newslink = Newslink.create(:title => Faker::Lorem.sentence(1), :link => Faker::Internet.url, :body => Faker::Lorem.paragraphs(i).join("\n"))

  i.times do |comment_count|
    newslink.comments << Comment.new(:author => Faker::Name.name, :body => Faker::Lorem.paragraphs(comment_count).join("\n"))
  end
end

