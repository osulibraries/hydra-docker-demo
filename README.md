Hydra Docker Demo
=================

A simple demo of a Hydra Curation Concerns application using Docker development
tools.

Be sure [Docker][1] is installed on your system.

Build the application images with:

    $ docker-compose build

Then fetch additional images and start the application:

    $ dpcker-compose up

Once all services are running, update the database schema:

    $ docker-compose run app bundle exec rake db:migrate

And visit your app on [http://localhost:3000](http://localhost:3000)! You can
access the rails console using:

    $ docker-compose run app bundle exec rails c


[1]: https://www.docker.com
