angular.module('Blog').controller 'ShowPostCtrl', [ '$scope', '$rootScope', 'Post', '$routeParams', 'Comment', ($scope, $rootScope, Post, $routeParams, Comment) ->

  Post.show(id: $routeParams.id).$promise.then (data) ->
    $scope.currentPost = data
    Comment.index(post_id: $routeParams.id).$promise.then (data) ->
      $scope.comments = data

  $scope.newComment = new Comment {
    text: ''
    post_id: $routeParams.id
  }

  $scope.resetNewComment = ->
    $scope.newComment = new Comment {
      text: ''
      post_id: $routeParams.id
    }

  $scope.addComment = ->
    $scope.newComment.$save ((data) ->
      $scope.resetNewComment()
      $scope.comments.push(data)
    ), (response) ->
      $scope.errors = response.data.errors

  $scope.deleteComment = (comment) ->
    if confirm "Are you sure?"
      currIndex = $scope.comments.indexOf(comment)
      comment.$delete (data) ->
        $scope.comments.splice(currIndex, 1)

]