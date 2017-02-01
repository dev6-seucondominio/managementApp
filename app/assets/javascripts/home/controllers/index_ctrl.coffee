angular.module 'PersonalManagementCtr'

.controller 'Home::IndexCtrl', [
  '$scope'
  ($s)->
    $s.hello = 'Hello Word'
]
