// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
var kitApp = angular.module('starter', ['ionic','ui.unique','checklist-model','ngCordova','ngTable','ngCordova.plugins.sqlite','ionic.ion.autoListDivider','angular.filter','ui.mask','ion-autocomplete', 'ab-base64','angular-md5','ionicLazyLoad','jrCrop'])/*,'angular-jwt'*/

/*.constant('ApiEndpoint', {
  url: 'http://localhost:8100/api'
  url: 'http://localhost:8888'
})*/
//.constant('ApiEndpoint','http://localhost:8888/kitaki')
//.constant('ApiEndpoint','http://192.168.57.1:8888/kitaki')
.constant('ApiEndpoint','http://117.218.228.220:8080/kitaki')
//.constant('ApiEndpoint','http://117.218.228.220:8080/kitaki')
//.constant('ApiEndpoint','http://192.168.1.110:80/kitaki')
//.constant('ApiEndpoint','http://192.168.1.110/kitaki')
//.constant('ApiEndpoint','http://192.168.1.122:8888/kitaki')
//.constant('ApiEndpoint','http://192.168.1.130:8888/kitaki')
//.constant('ApiEndpoint','http://192.168.1.2:8083')
//.constant('ApiEndpoint','http://117.218.228.220:8020/kitaki')
//.constant('ApiEndpoint','http://117.218.228.220:8020/kitaki')

.run(function($ionicPlatform,$cordovaSQLite,$rootScope,$ionicLoading,$ionicPopup,ApiEndpoint,ConnectivityMonitor,commonAppService,$state,DBA,$http) {
    $rootScope.$on('loading:show', function() {
        $ionicLoading.show({template: '<p>Loading...Please wait !!! </p><ion-spinner icon="lines" class="spinner-royal"></ion-spinner>'})
    });

    $rootScope.$on('loading:hide', function() {
        $ionicLoading.hide()
    }); 
    
    $rootScope.$on('$cordovaNetwork:online', function(event, networkState){
        console.log("went online");
        //alert("went online");
        
    });

    $rootScope.$on('$cordovaNetwork:offline', function(event, networkState){
        console.log("went offline");
        //alert("went offline1");
    });
    
    $ionicPlatform.onHardwareBackButton(function () {
      if(true) { // your check here
          if($state.current.name=='app.buyer' || $state.current.name=='app.seller.myShop') {
                $ionicPopup.confirm({
                    title: 'Warning!!',
                    template: 'are you sure you want to exit the app?'
                }).then(function(res){
                    if( res ){
                      navigator.app.exitApp();
                    }
                })
          }
          
      }
  })
    $ionicPlatform.ready(function() {
        // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
        // for form inputs)
        $rootScope.bothRegistered=false;
        if (window.cordova && window.cordova.plugins.Keyboard) {
          cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
        }
        if (window.StatusBar) {
          // org.apache.cordova.statusbar required
          StatusBar.styleDefault();
        }
        
       
        // Set the Device ID to Common App Service
       //var deviceID = device.uuid;
      // commonAppService.setDeviceId(device.uuid);
        //commonAppService.setDeviceId("123b1"); // seller-4268
        commonAppService.setDeviceId("1a998ca53dbe55b2"); //5517
        //commonAppService.setDeviceId("123s1"); //seller - 1091
        var deviceID =  commonAppService.getDeviceId(); 
        
        //commonAppService.setDeviceId("1a998ca53dbe55b2"); //- buyer - 4524
        console.log("Device ID....... "+commonAppService.getDeviceId());
        
        /*var connectionStatus = ConnectivityMonitor.isOnline();
        
         console.log("connection status in app.js is "+connectionStatus);*/
        
        //Fetch the phone number and set if available
        var telephoneNumber = cordova.require("cordova/plugin/telephonenumber");
        telephoneNumber.get(function(result) {
             console.log("Phone Number = " + result.line1Number);
             commonAppService.setloggedInUserPhoneNum(result.line1Number);
        }, function() {
            console.log("error");
        });

        
        //console.log("Window connection....... "+JSON.stringify(window));
        
        var connectionStatus = ConnectivityMonitor.isOnline() ;
        console.log("connection....Status... "+connectionStatus);
        
        //alert("connection status :"+connectionStatus);
        
        /*
            If connection exists, check if main server or failover server is reachable, 
            If servers are reachable, allow user to login, else throw a message
        */
        if (connectionStatus){
            console.log(" internet connection exists ..either data or wifi...");
            var serverConnectivity = ConnectivityMonitor.isMainServerReachable();
            console.log(" Server connectivity "+serverConnectivity);
            console.log(" Server connectivity 1"+JSON.stringify(serverConnectivity));
            
        }else {
            $ionicPopup.confirm({
                title: "No working internet found",
                content: "Please connect using wifi or data network."
            })
            .then(function(result) {
                if(result) {
                    console.log("Internet disconnected yes");
                }else if(!result){
                    console.log("Internet disconnected cancel")
                    ionic.Platform.exitApp();
                }
            });
        
        }
        /*console.log(" >>>>>>>>>>>>>>>>>>Starting contacts activity");
         $scope.getAllContacts = function() {
            $cordovaContacts.find().then(function(allContacts) {               
                $scope.contacts = allContacts;
                 console.log("Contacts are"+$scope.contacts);
            })
       
        };
         console.log(" >>>>>>>>>>>>>>>>>>Endsing contacts activity");*/
      
        /*function checkConnection(){
            var networkState = navigator.connection.type;
            var states = {};
            states[Connection.UNKNOWN]  = 'Unknown connection';
            states[Connection.ETHERNET] = 'Ethernet connection';
            states[Connection.WIFI]     = 'WiFi connection';
            states[Connection.CELL_2G]  = 'Cell 2G connection';
            states[Connection.CELL_3G]  = 'Cell 3G connection';
            states[Connection.CELL_4G]  = 'Cell 4G connection';
            states[Connection.CELL]     = 'Cell generic connection';
            states[Connection.NONE]     = 'No network connection';
            
        }
        $interval(function(){
          console.log(" connnection check being called  ");
		  checkConnection();
	   }, 5000)
        
        function networkOn(){
            console.log("&&&&&&& Network ON *&&&&&&& ");
        }
        function networkOff(){
            console.log(" ******* Network OFF *******  ");
        }*/
       /* var networkState = navigator.connection.type;
        var states = {};
        states[Connection.UNKNOWN]  = 'Unknown connection';
        states[Connection.ETHERNET] = 'Ethernet connection';
        states[Connection.WIFI]     = 'WiFi connection';
        states[Connection.CELL_2G]  = 'Cell 2G connection';
        states[Connection.CELL_3G]  = 'Cell 3G connection';
        states[Connection.CELL_4G]  = 'Cell 4G connection';
        states[Connection.CELL]     = 'Cell generic connection';
        states[Connection.NONE]     = 'No network connection';

        //alert('Connection type: ' + states[networkState]);
        /*if(window.Connection) { */
        //console.log("window connection exists   "+navigator.connection.type );
        /*if(navigator.connection.type == Connection.NONE) {
            console.log("window connection doesnot exists   "+navigator.connection.type );
            $ionicPopup.confirm({
                title: "No working internet found",
                content: "Please connect using wifi or data network."
            })
            .then(function(result) {
                if(result) {
                    console.log("Internet disconnected yes");
                }else if(!result){
                    console.log("Internet disconnected cancel")
                    ionic.Platform.exitApp();
                }
            });
        }*/

        /*if(navigator.connection.type !== Connection.none ) {
           // console.log("window connection  exists   "+navigator.connection.type );
            console.log("Check if server reachable   "+ApiEndpoint );
        }*/
        //}

        if (window.cordova){
            console.log("***** >>>  Data base copy start... <<<<< **** ");
            window.plugins.sqlDB.copy("kitakimobile.sqlite", function() {
                db = $cordovaSQLite.openDB("kitakimobile.sqlite");
                console.log("****>>> Data base opened <<<**** "+ JSON.stringify(db));
                
            }, function(error) {
                console.error("There was an error copying the database: " + JSON.stringify(error));
                db = $cordovaSQLite.openDB("kitakimobile.sqlite");
                db = window.sqlitePlugin.openDatabase({name: "kitakimobile.sqlite", location: 1});
                console.log("****>>> Data base opened from error<<<**** "+ JSON.stringify(db));
                var query="select device_id,email_id,pin,auth_f,user_type,user_role_id from user_auth where device_id=(?) and auth_f=1 ;"
                
                var parameters= parameters || [deviceID];
                console.log("parameters->"+parameters);
                //console.log("Query ->"+query);
                $cordovaSQLite.execute(db,query,parameters).then(function(result){
                    if(result.rows.length == 1 ){
                        console.log("result in app.js"+JSON.stringify(result));
                        output = DBA.processResultSet(result);
                        console.log("Result data "+JSON.stringify(output));
                        commonAppService.setloggedInUserRole(output[0].user_role_id);
                        commonAppService.setloggedInUserType(output[0].user_type);
                        $rootScope.bothRegistered=true;
                        //$rootScope.bothRegistered="true";
                    }
                    
                })
            });
        } else{
            db = window.sqlitePlugin.openDatabase({name: "kitakimobile.sqlite", location: 1}); // browser
           /* db = window.openDatabase("kitakimobile.sqlite", '1.0', 'my', -1); // browser*/
        }
      });
})

//.config(function($stateProvider, $urlRouterProvider,jwtInterceptorProvider,$httpProvider ) {
.config(function($stateProvider, $urlRouterProvider,$httpProvider ) {
  
    $stateProvider
    .state('welcome', {
        url: "/welcome",
        templateUrl: "templates/welcome.html",
        controller: 'loginCtrl'
    })
  
    /*.state('login',{
        url: "/login",
        templateUrl: "templates/userPin.html",
        controller: 'loginCtrl'
    })*/
    /*.state('dologin',{
        url: "/dologin",
        templateUrl: "templates/login.html",
        controller: 'loginCtrl'
    })*/
    .state('login1',{
        url: "/login1",
        templateUrl: "templates/userPin1.html",
        controller: 'loginCtrl'
    })
  
    .state('register',{
        url: "/register",
        templateUrl: "templates/registration.html",
        controller: 'UserRegCtrl'
    })
  
    .state('app', {
        url: "/app",
        abstract: true,
        templateUrl: "templates/menu.html",
        controller: 'AppCtrl'
    })

    .state('app.buyer', {
        url: "/showShops",
        views: {
          'menuContent': {
            templateUrl: "templates/showShops.html",
              controller:"AppCtrl"
          }
        }
    })
  
    .state('app.orders', {
      url: "/buyerOrders",
      views: {
        'menuContent': {
          templateUrl: "templates/buyerOrders.html",
          controller: 'AppCtrl'
        }
      }
    })
  
    .state('app.buyer.buyProducts', {
      url: "/buyProducts/:shopName/:uid_seller/:buyer_uid",
      views: {
        'menuContent@app': {
          templateUrl: "templates/buyProducts.html",
          controller: 'ProductslistsCtrl'
        }
      }
    })
  
    .state('app.buyer.buyProducts.summary', {
      url: "/buyOrderSummary",
      //url: "/buyOrderSummary/:Uid/:sellerName",
      views: {
        'menuContent@app': {
          templateUrl: "templates/buyOrderSummary.html",
          controller: 'OrderItemCtrl'
        }
      }
    })
    .state('app.browse', {
        url: "/browse",
        views: {
          'menuContent': {
            templateUrl: "templates/browse.html",
            controller: 'loginCtrl' 
          }
        }
    }) 
  /*Seller Portion States start here*/
  
    .state('app.seller', {
      url: "/sellerOrderSummary",
      views: {
        'menuContent': {
          templateUrl: "templates/sellerOrderSummary_1.html",
          controller: 'AppCtrl'
        }
      }
    })
  
    .state('app.seller.orderDetails', {
        url: "/sellerOrderDetails/:orderId/:buyerId",
        views: {
            'menuContent@app': {
              templateUrl: "templates/sellerOrderDetails.html",
              controller: 'SellerOrderCtrl'
            }
        }
    })  
    .state('app.seller.orderDetails.conf', {
      url: "/sellerOrderConfirmation/:orderId",
      //url: "/sellerOrderConfirmation/:orderDetails/:orderItemDetails",
      views: {
        'menuContent@app': {
          templateUrl: "templates/sellerOrderConfirmation.html",
          controller: 'SellerOrderConfCtrl'
        }
      }
    })
    
    /*.state('app.seller.manageOrders', {
        url: "/productManage",
        views: {
            'menuContent@app': {
              templateUrl: "templates/productmanagement.html",
              controller: 'sellerManageProductCtrl'
            }
        }
    }) */ 
    .state('app.seller.manageProduct', {
        url: "/productManage1",
        views: {
            'menuContent@app': {
              templateUrl: "templates/prdmgmt.html",
              controller: 'sellerManageProductCtrl'
            }
        }
    })
    .state('app.seller.manageProduct.add', {
        url: "/addProduct/:sellerId",
        views: {
            'menuContent@app': {
              templateUrl: "templates/addSellerProduct.html",
              controller: 'sellerManageProductCtrl'
            }
        }
    })
    .state('app.seller.manageProduct.edit', {
        url: "/productManageEdit/:productId/:sellerId",
        views: {
            'menuContent@app': {
              templateUrl: "templates/prdmgmt_edit.html",
              controller: 'editProductCtrl'
            }
        }
    })
    .state('app.seller.manageProduct.category', {
        url: "/manageCategory",
        views: {
            'menuContent@app': {
              templateUrl: "templates/addProductCategory.html",
              controller: 'sellerManageProductCtrl'
            }
        }
    })
    .state('app.seller.manageCustomer', {
        url: "/customerMgmt",
        views: {
            'menuContent@app': {
              templateUrl: "templates/buyerCategory.html",
              controller: 'sellerCustomerMgmtCtrl'
            }
        }
    })
    .state('app.seller.myShop', {
        url: "/myshop",
        cache: false,
        views: {
            'menuContent@app': {
              templateUrl: "templates/sellershop.html",
              controller: 'sellerShopCtrl'
            }
        }
    })
  
  //Seller Portion States ends here
    
    .state('app.about', {
        url: "/about",
        views: {
          'menuContent': {
            templateUrl: "templates/about.html",
              controller:"AppCtrl"
          }
        }
    }) 
    .state('app.faq', {
        url: "/faq",
        views: {
          'menuContent': {
            templateUrl: "templates/faq.html",
              controller:"AppCtrl"
          }
        }
    }) 
    
  // if none of the above states are matched, use this as the fallback
    $urlRouterProvider.otherwise('/welcome');
    /*jwtInterceptorProvider.tokenGetter = function(commonAppService) {
        return commonAppService.getToken("JWT");
    }
    $httpProvider.interceptors.push('jwtInterceptor');*/
    //$httpProvider.interceptors.push(function($rootScope,jwtInterceptor,commonAppService) {
    $httpProvider.interceptors.push(function($rootScope,commonAppService) {
        return {
          request: function(config) {
            $rootScope.$broadcast('loading:show');
            timeout  = 3000 ,
            //config.headers = config.headers || {};
           // if ($localStorage.token) {
            //config.headers.key = "jwt";
              //console.log("token header --> "+commonAppService.getToken("jwt"));
             config.headers.token = commonAppService.getToken("JWT");
              //config.headers['X-Access-Token'] = commonAppService.getToken("jwt");
              //config.headers.HTTP_TOKEN  = commonAppService.getToken("jwt");
              //console.log("token header/1 --> "+config.headers.token);
            //}
            return config
          },
          response: function(response) {
            $rootScope.$broadcast('loading:hide')
            //$rootScope.$broadcast('$cordovaNetwork:offline')
            
            return response
          }
        }
    });
    /*$httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];*/
    
});

kitApp.config(['$httpProvider', function($httpProvider) {

        $httpProvider.defaults.useXDomain = true;
        console.log("set XDomain "+$httpProvider.defaults.useXDomain);
        $httpProvider.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
        $httpProvider.defaults.timeout = 3000;
        //$compileProvider.imgSrcSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel):/);
        
        delete $httpProvider.defaults.headers.common['X-Requested-With'];
        //$http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
        console.log("set XDomain-1-"+$httpProvider.defaults.useXDomain);

    }
]);
kitApp.directive('errSrc', function() {
  return {
    link: function(scope, element, attrs) {
      var defaultSrc = attrs.src;
      element.bind('error', function() {
        if(attrs.errSrc) {
            element.attr('src', attrs.errSrc);
        }
        else if(attrs.src) {
            element.attr('src', defaultSrc);
        }
      });
    }
  }
});
/*kitApp.config(['$http', function($http) {
               $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    }]);*/

