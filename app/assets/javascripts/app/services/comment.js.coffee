angular.module('Blog').factory 'Comment', [ '$resource', '$http',  ($resource, $http) ->
  $resource '/posts/:post_id/comments/:id.json', id: '@id', post_id: '@post_id',
    update:
      method: 'PUT'

    index:
      method: 'GET'
      isArray: true

    get:
      method: 'GET'
      isArray: true

    show:
      method: 'GET'
      isArray: false
]