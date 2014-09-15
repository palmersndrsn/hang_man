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

	clickedArr = []

	$scope.clicked = (letter) ->
		this.button = false
		clickedArr.push(letter)
		if letter in $scope.secretWord
			$scope.letterFound(letter, $scope.secretWord.indexOf(letter))
		else
			$scope.guesses++
			$scope.hanging()
		if $scope.letterCount == $scope.secretWord.length
			$scope.winner = true
			$scope.keyboard = false
		if $scope.guesses == 6
			$scope.loser = true
			$scope.keyboard = false

	$scope.hanging = ->
		if $scope.guesses == 1
			$scope.head = true
		else if $scope.guesses == 2
			$scope.body = true
		else if $scope.guesses == 3
			$scope.leftArm = true
		else if $scope.guesses == 4
			$scope.rightArm = true
		else if $scope.guesses == 5
			$scope.rightLeg = true
		else if $scope.guesses == 6
			$scope.leftLeg = true

	$scope.letterFound = (letter, index) ->
		$scope.letterCount++

	$scope.reset = ->
		$scope.enteredWord = ""
		$scope.button.all = true
		$scope.init()

	$scope.getWord = ->
		word = $scope.enteredWord.toUpperCase()
		$scope.secretWord = word.split("")
		$scope.entry = false
		$scope.keyboard = true



	$scope.init = ->
		$scope.count = 0
		$scope.guesses = 0
		$scope.letterCount = 0
		$scope.winner = false
		$scope.loser = false
		$scope.entry = true
		$scope.wordPopup = true
		$scope.button = true
		$scope.keyboard = false
		# this isn't working, why is that?
		$scope.button = true

		$scope.alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

	$scope.init()
]