class HomeController < ApplicationController
  def index
  end
  def mail
  @title1= params[:title]
  @email1= params[:email]
  @content1= params[:content]
  
  mg_client = Mailgun::Client.new("key-8bb10cc50b27e9363ad9b4268e1a7df4")

message_params =  {
                   from: 'nidnot2know@naver.com',
                   to:   @email1,
                   subject: @title1,
                   text:    @content1
                  }

result = mg_client.send_message('sandboxecfa2edc08dc4b2c834b267209d2f787.mailgun.org', message_params).to_h!

message_id = result['id']
message = result['message']
  new_post= Post.new
  new_post.title =@title1
  new_post.email =@email1
  new_post.content =@content1
  new_post.save
end

def storage
@kafa =Post.all
end
end
