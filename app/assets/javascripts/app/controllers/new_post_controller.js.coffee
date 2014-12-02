angular.module('Blog').controller 'NewPostCtrl', [ '$scope', '$rootScope', '$modalInstance', 'Post', ($scope, $rootScope, $modalInstance, Post ) ->

  $scope.errors = []

  $scope.newPost = new Post(
    {
      title: ''
      text: ''
    }
  )

  $scope.close = ->
    $modalInstance.dismiss('cancel')

  $scope.save = ->
    $scope.newPost.$save ((data) ->
      $rootScope.posts.push(data)
      $modalInstance.close()
    ), (responce) ->
      $scope.errors = responce.data.errors

]