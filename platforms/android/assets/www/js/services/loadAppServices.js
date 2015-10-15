(function(){
    var funcLoadAppInfo = function($cordovaSQLite,DBA,$http,ApiEndpoint) {
        var self = this;
        //console.log("In services for loadApp  ");
        console.log("In services for loadApp 1"+ApiEndpoint);
        
        self.getSellersForBuyer = function(buyerId) {
            //var parameters= [201,"Seller"];
            var parameters= [buyerId];
            return $http.get(ApiEndpoint + '/user/fetchSellerListForLoggedInUser/buyerId/'+buyerId)
              .then(function(abc){
                console.log("sellers for buyer are-"+JSON.stringify(abc));
                return DBA.processResultSethttp(abc);
                //return data.data;
              },function(error) {
                    console.log("Error in Service(LoadAppInfo); function(funcLoadAppInfo); "+JSON.stringify(error));
            });
          }
        return self;
    };
    
    
    kitApp.factory('LoadAppInfo',funcLoadAppInfo);
    
    var funcConnectivityMonitor = function($rootScope, $cordovaNetwork,$http,ApiEndpoint){

        return {
            isOnline: function(){
                if(ionic.Platform.isWebView()){
                    return $cordovaNetwork.isOnline();    
                } else {
                    return navigator.onLine;
                }
            },
            ifOffline: function(){
                if(ionic.Platform.isWebView()){
                    return !$cordovaNetwork.isOnline();    
                } else {
                    return !navigator.onLine;
                }
            },
            startWatching: function(){
                if(ionic.Platform.isWebView()){

                    $rootScope.$on('$cordovaNetwork:online', function(event, networkState){
                        console.log("went online");
                    });

                    $rootScope.$on('$cordovaNetwork:offline', function(event, networkState){
                        console.log("went offline");
                    });

                }
                else {
                    window.addEventListener("online", function(e) {
                        console.log("went online");
                    }, false);    

                    window.addEventListener("offline", function(e) {
                        console.log("went offline");
                    }, false);  
                }       
            },
            isMainServerReachable: function(){
                return $http.get(ApiEndpoint);
            }
        }
    };
    kitApp.factory('ConnectivityMonitor', funcConnectivityMonitor);
}());