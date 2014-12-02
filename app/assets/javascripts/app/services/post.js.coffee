angular.module('Blog').factory 'Post', [ '$resource', '$http',  ($resource, $http) ->
  $resource '/posts/:id.json', id: '@id',
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