# -*- coding: utf-8 -*-
class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price
  # 商品名がほかの商品と重複していないか
  validates_uniqueness_of :title
  # 画像のURLとして入力された値が有効か
  # i 正規表現はマッチ時に大文字小文字の区別を行わない
  validates_format_of :image_url,
  :with     => %r{\.(gif|jpg|png)$}i,
  :message => "は GIF、JPG、PNG画像のURLでなければなりません"
  validates_length_of :title,
  :minimum => 10,
  :message => "は 10文字以上の長さでなければなりません"

  protected
  def validate
    # なぜ0ではなく, 1セント(0.01)でテストするのでしょうか。その理由は、このフィールドに0.001などの数値が入力される可能性があるためです。
    # このような値を0と比較すると、検証にはパスしますが、このデータベースには小数点以下2桁までしか保存されないため、データベースには0として保存されてしまいます。
    # 入力された数値が少なくとも1セント以上であることを確認すれば、正しい値だけが保存されるようになります。
    # errors#add(フィールド名, メッセージ)
    errors.add(:price, "は最小でも 0.01 以上でなければなければなりません") if price.nil? || price < 0.01
  end
end
