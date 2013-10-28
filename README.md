prct07
======

Considere la clase Ruby para representar fracciones que ha implementado usando el Desarrollo dirigido
por pruebas (Test Driven Development - TDD) usando como herramienta Rspec. 

1.-) Realice las modificaciones oportunas para contemplar el uso del módulo Comparable.

2.-) La clase se ha de compilar con la herramienta Travis de integración continua. Con ella se comprueba
la portabilidad de los desarrollos entre distintas plataformas y versiones de Ruby.

Para ello realizar los siguientes pasos:

2.1.-) Darse de alta en 'https://travis-ci.org/' y permitir que se acceda desde Github (poniendo a ON el proyecto).

2.2.) Crear un fichero '.travis.yml' que contenga el listado de plataformas sobre las que se quiere comprobar
el correcto funcionamiento, por ejemplo:

language: ruby
rvm:
  - 1.9.3
  - jruby-18mode # JRuby in 1.8 mode
  - jruby-19mode # JRuby in 1.9 mode
  - rbx-18mode
  - rbx-19mode
  - 1.8.7

2.3.-) Crear un fichero 'Rakefile' que contenga, al menos:

$:.unshift File.dirname(__FILE__) + 'lib'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

2.4.-) Crear un fichero 'Gemfile' que contenga al menos:

source 'https://rubygems.org'

gem 'rake'
gem 'rspec'

3.-) Indique la URL (HTTP) del repositorio Github que ha desarrollado.
