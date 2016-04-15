class PagesController < ApplicationController
  #has_many :topics
  def home
    @greeting = "Hello World! From the Wiki side ..."
    #retreive all topics
    #@topics = Topic.all
  end
 #This action allows users to select a topic from a menu
  #def select
  #end
# This action allows used to login
  #def login
  #end

  #def create_topic
    #create a new topic
    #@topics = Topic.new
  #end 
end
