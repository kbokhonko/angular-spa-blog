angular.module('Blog').controller 'EditPostCtrl', [ '$scope', '$rootScope', '$modalInstance', 'Post', ($scope, $rootScope, $modalInstance, Post ) ->

  $scope.errors = []
  $scope.newPost = {}

  $scope.newPost = angular.copy($scope.post)

  $scope.close = ->
    $modalInstance.dismiss('cancel')
    $scope.newPost = {}

  $scope.save = ->
    angular.copy($scope.newPost, $scope.post);
    $scope.post.$update ((data) ->
      Post.index().$promise.then (data) ->
        $rootScope.posts = data
        $modalInstance.close()
    ), (responce) ->
      $scope.errors = responce.data.errors

]