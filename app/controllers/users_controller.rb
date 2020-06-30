class UsersController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    # 1.urlを解析する
    uri = URI.parse("http://18.176.193.22/users/")
    # 2.httpの通信を設定する
    # 通信先のホストやポートを設定
    https = Net::HTTP.new(uri.host, uri.port)
    # 3.リクエストを作成する
    req = Net::HTTP::Get.new(uri.path)
    # 4.リクエストを投げる/レスポンスを受け取る
    res = https.request(req)
    # 5.データを変換する
    hash = JSON.parse(res.body)
    # 結果を出力
    @users = hash["data"]
  end
end
