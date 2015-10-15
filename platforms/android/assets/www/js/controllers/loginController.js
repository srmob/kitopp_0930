(function(){
   var funcUserLogin = function($scope,$state, $stateParams,$timeout,LoginInfo,$ionicPopup,commonAppService,$ionicLoading,base64,$http,ApiEndpoint,ConnectivityMonitor,md5,$rootScope){
        
       // $scope.bothRegistered = false;
       console.log("Login Controller Loaded--"+$scope.bothRegistered);
        var pushNotification;
       
       //
       
           
           console.log("login controller loaded");
           ionic.Platform.ready(function(){
               /*var connectionStatus = ConnectivityMonitor.isOnline();
               console.log("Connection check in login controller is "+connectionStatus);
               if(connectionStatus) {*/
                   $http.get(ApiEndpoint + '/user/checkDevice/deviceId/'+commonAppService.getDeviceId(),{skipAuthorization: true},{timeout: 3000 }).then(function(result){
                    //http://117.218.228.220:8080/kitaki/user/checkDevice/deviceId/8ef01a374e602841
                        console.log("Device Check Status login app controller is "+JSON.stringify(result));
                        if(result.data.result ){
                            $rootScope.bothRegistered = true;
                        }
                    /*if(result.data.role_id == 3 ){
                        $scope.bothRegistered = true;
                    }*//*else if(result.data.role_id == 1 ){
                         $scope.bothRegistered = false;
                    }*/

                });
               /*commonAppService.getDeviceRegdStatus(commonAppService.getDeviceId).then(function(res){
                        console.log("Device Check Status is "+JSON.stringify(result));
                        if(res.data.result ){
                            $scope.bothRegistered = true;
                        }
                    })*/
               /*}else{

               }*/

           });
        
      
        /*ionic.Platform.ready(function(){
           pushNotification = window.plugins.pushNotification;
            if ( device.platform == 'android' || device.platform == 'Android' ){
                pushNotification.register(
                    successHandler,
                    errorHandler,
                    {
                        //"senderID":"981302519609",  // https://console.developers.google.com/project/to-prove-evolve
                        "senderID":"878657411822",  //Yogesh
                        "ecb":"onNotification"     
                    });
            }
            function successHandler (result) {
                //alert('result = ' + result);
            }
            function errorHandler (error) {
                //alert('error = ' + error);
            }
            function onNotification(e) {
                $("#app-status-ul").append('<li>EVENT -> RECEIVED:' + e.event + '</li>');

                switch( e.event )
                {
                case 'registered':
                    if ( e.regid.length > 0 )
                    {
                        $("#app-status-ul").append('<li>REGISTERED -> REGID:' + e.regid + "</li>");
                        // Your GCM push server needs to know the regID before it can push to this device
                        // here is where you might want to send it the regID for later use.
                        console.log("regID = " + e.regid);
                       // alert(e.regid)
                    }
                break;

                case 'message':
                    // if this flag is set, this notification happened while we were in the foreground.
                    // you might want to play a sound to get the user's attention, throw up a dialog, etc.
                    if ( e.foreground )
                    {
                        $("#app-status-ul").append('<li>--INLINE NOTIFICATION--' + '</li>');

                        // on Android soundname is outside the payload.
                        // On Amazon FireOS all custom attributes are contained within payload
                        var soundfile = e.soundname || e.payload.sound;
                        // if the notification contains a soundname, play it.
                        var my_media = new Media("/android_asset/www/"+ soundfile);
                        my_media.play();
                    }
                    else
                    {  // otherwise we were launched because the user touched a notification in the notification tray.
                        if ( e.coldstart )
                        {
                            $("#app-status-ul").append('<li>--COLDSTART NOTIFICATION--' + '</li>');
                        }
                        else
                        {
                            $("#app-status-ul").append('<li>--BACKGROUND NOTIFICATION--' + '</li>');
                        }
                    }

                   $("#app-status-ul").append('<li>MESSAGE -> MSG: ' + e.payload.message + '</li>');
                       //Only works for GCM
                   $("#app-status-ul").append('<li>MESSAGE -> MSGCNT: ' + e.payload.msgcnt + '</li>');
                   //Only works on Amazon Fire OS
                   $status.append('<li>MESSAGE -> TIME: ' + e.payload.timeStamp + '</li>');
                break;

                case 'error':
                    $("#app-status-ul").append('<li>ERROR -> MSG:' + e.msg + '</li>');
                break;

                default:
                    $("#app-status-ul").append('<li>EVENT -> Unknown, an event was received and we do not know what it is</li>');
                break;
              }
            }
            
        });*/
        
       
       //$scope.phoneNum = 8121314151;
       $scope.passcode = "";
        var retryCount = 0 ;
       $scope.loginUser = function() {
            $state.go('login');
            
        }
        $scope.doLogin = function() {
            $state.go('dologin');
            
        }
        $scope.loginUser1 = function() {
            $state.go('login1');
            
        }
        
        $scope.add = function(value){
            //console.log("pin value entered is "+value);
            var uid = 0 ;
           if($scope.passcode.length < 4) {
            $scope.passcode = $scope.passcode + value;
            if($scope.passcode.length == 4) {
                $timeout(function() {
                    var passwordEntered = base64.encode($scope.passcode);
                    var urlSafeBase64EncodedString = encodeURIComponent(passwordEntered);
                    /*console.log("logging in for  is :- "+urlSafeBase64EncodedString);*/
                    
                    /*var connectionStatus = ConnectivityMonitor.isOnline();
                    
                    console.log("connection status is "+connectionStatus);
                    if(connectionStatus){*/
                        LoginInfo.verifyLoggedInUser(commonAppService.getDeviceId(),urlSafeBase64EncodedString).then(function(loginResult){
                        console.log("loginResult is :- "+JSON.stringify(loginResult));
                        console.log("loginResult without is :- "+loginResult);
                       //Valid User
                            console.log("user type"+commonAppService.getloggedInUserRole());
                        /*if(loginResult == 0){
                            console.log("loginResult without1 is :- "+loginResult);
                            issueLoggingIn();
                        }*/
                        if(loginResult){
                             //console.log("loginResult 1 :- "+loginResult);
                            /*if (commonAppService.getloggedInUserType() == 'buyer') {
                                console.log("loginResult 2 :- "+loginResult+"-"+commonAppService.getloggedInUserType());
                                $timeout($state.go('app.buyer'),1000);
                            }if (commonAppService.getLoggedInUserRole() == 'seller' || commonAppService.getloggedInUserType() == 'both' ) { 
                                console.log("loginResult 3 :- "+loginResult+"-"+commonAppService.getloggedInUserType());
                                $timeout($state.go('app.seller'),1000);
                            }*/
                            if (commonAppService.getloggedInUserRole() == 2) {
                                console.log("loginResult 2 :- "+loginResult+"-"+commonAppService.getloggedInUserType());
                                $timeout($state.go('app.buyer'),1000);
                            }if (commonAppService.getloggedInUserRole() == 3 ) { 
                                console.log("loginResult 3 :- "+loginResult+"-"+commonAppService.getloggedInUserType());
                               // $timeout($state.go('app.seller'),1000);
                                $timeout($state.go('app.seller.myShop'),1000);
                            }
                        }
                        else  { 
                              //Invalid user
                            retryCount++;
                            console.log("Retry Count is:"+retryCount);
                            if (retryCount < 5 ) {
                                $scope.wrongPin();
                                $scope.passcode="";
                            }else {
                                $state.go('welcome');
                            }
                        }

                    });
                        
                    /*}else{
                        var md5Passwd = md5.createHash($scope.passcode || '');
                        
                        console.log("offline mode Password is "+md5Passwd);
                        LoginInfo.verifyUserOffline(commonAppService.getDeviceId(),md5Passwd).then(function(loginResult)                                {
                            console.log("offline verification count is "+JSON.stringify(loginResult));
                            console.log("offline verification count is "+JSON.stringify(loginResult[0].auth_f));
                            if(loginResult[0].auth_f == 1 ) {
                                commonAppService.setloggedInUserType(loginResult[0].user_type);
                                commonAppService.setloggedInUserRole(loginResult[0].user_role_id);
                                if (commonAppService.getloggedInUserRole() == 2) {
                                    console.log("Offline loginResult 2 -"+commonAppService.getloggedInUserType());
                                    $timeout($state.go('app.buyer'),1000);
                                }if (commonAppService.getloggedInUserRole() == 3 ) { 
                                    console.log("Offline loginResult 3 :-"+commonAppService.getloggedInUserType());
                                    $timeout($state.go('app.seller.manageProduct'),1000);
                                }
                            }else{
                                retryCount++;
                                console.log("Retry Count is:"+retryCount);
                                if (retryCount < 5 ) {
                                    $scope.wrongPin();
                                    $scope.passcode="";
                                }else {
                                    $state.go('welcome');
                                }
                            }
                            
                            
                         });
                    }*/
                    
                    
                }, 500); //timeout
            }
        }
       };
        
        $scope.delete = function(){
            if($scope.passcode.length > 0) {
                $scope.passcode = $scope.passcode.substring(0, $scope.passcode.length - 1);
            }
        }
        $scope.clear = function(){
            if($scope.passcode.length > 0) {
                $scope.passcode = "";
            }
        }
        
        $scope.wrongPin = function() {
           var alertPopup = $ionicPopup.alert({
             title: 'Invalid Pin',
             template: 'Invalid Pin - '+retryCount+'/5'
           });
           alertPopup.then(function(res) {
             $state.go('login1');
           });
         };
       
//       function issueLoggingIn() {
//           console.log("issue login");
//           var alertPopup = $ionicPopup.alert({
//             title: 'Issue Logging in',
//             template: 'Please try after sometime '
//           });
//           alertPopup.then(function(res) {
//             $state.go('login1');
//           });
//         };
       
       $scope.register = function(){
            $state.go('register');
       }
    
       $scope.logout = function(){
           console.log("Exit the app..");
           if (navigator.app) {
                LoginInfo.userLogout();
                ionic.Platform.exitApp();
            }else if (navigator.device) {
                navigator.device.exitApp();
            }
       }
            
    };
        
    kitApp.controller('loginCtrl',funcUserLogin ) ;
}());