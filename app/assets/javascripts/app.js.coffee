HangManApp = angular.module "HangManApp", ["ngRoute", "templates"]

HangManApp.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when '/',
			templateUrl: "index.html",
			controller: "SitesCtrl"
	.otherwise
		redirectTo: "/"

	$locationProvider.html5Mode(true)

]

HangManApp.controller "SitesCtrl", ["$scope", "$http", ($scope, $http) ->

	$scope.count = 0
	$scope.guesses = 0
	$scope.letterCount = 0

	$scope.clicked = (letter) ->
		this.button = false
		console.log(letter)
		if letter in $scope.secretWord
			$scope.letterFound(letter, $scope.secretWord.indexOf(letter))
		else
			$scope.guesses++

		if $scope.letterCount == $scope.secretWord.length
			console.log("you win!")
			# show the user they won
			$scope.restartGame()

		if $scope.guesses == 6
			alert "DOH!!"
			#  show the user they lost
			$scope.restartGame()

	$scope.letterFound = (letter, index) ->
		console.log "found it!"
		console.log(letter)
		console.log(index)
		$scope.letterCount++

	$scope.restartGame = ->
		# need to figure out how to reset the game



	$scope.getWord = ->
		# user inputs word and
		word = $scope.enteredWord.toUpperCase()
		$scope.secretWord = word.split("")


		$scope.wordPopup = false
	# add this to getWord



	$scope.wordPopup = true

	$scope.button = true

	$scope.alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
]