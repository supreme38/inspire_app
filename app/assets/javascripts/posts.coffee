# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.imgr').hover \
    (-> $(this).addClass 'animated pulse'), \
    (-> $(this).removeClass 'animated pulse')

$ ->
  $('.navbar-link').hover \
    (-> $(this).addClass 'animated fadeIn'), \
    (-> $(this).removeClass 'animated fadeIn')
