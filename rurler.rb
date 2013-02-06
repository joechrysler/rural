#!/usr/bin/ruby
require 'rubygems'
require 'redis'
require 'sinatra'


before do
    @cache = Redis.new
end

get '/:quicklink' do
    a = @cache.get params[:quicklink]
    status 301
    headers 'Location' => a
    "I've moved to #{a}"
end

post '/:quicklink' do
    @cache.set params[:quicklink], params[:longlink]
end
