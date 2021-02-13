# Flickr Quickr

## Description

A no-fuss image search application that connects to Flickr API and fetches the first page of images by tag (I have a few
predefined ones for testing purposes) or username. Every image links back to the original Flickr photo.

## Requirements

Flickr Quickr is built using `Ruby v2.6.3` on `Rails 6.1.1`

## Gems

Database uses `pg` gem, styled with `bulma-rails` gem. Requires `figaro` and `flickraw` gems.

## Setup

After `git clone` run `bundle install` to install needed gems and dependencies.

Run `rails db:create`, `rails db:migrate`, `rails db:seed` to create database and seed with my pre-written data for
testing.

If you run into any trouble at the above step, you probably need to install `Postgresql` via `Homebrew` and start the
service on your machine.

Make sure you have a Flickr developer account and set your key and secret in `config/database.yml`,
as [figaro](https://github.com/laserlemon/figaro)
suggests.

## Deployed at

* https://flickrquickr.herokuapp.com/

---------------------------------------------------
All code is written from scratch by Kostas. Assignment for [The Odin Project](https://www.theodinproject.com/).

2021 - MIT License