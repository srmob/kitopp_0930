(function(){
    function urlBase64Decode(str) {
            var output = str.replace('-', '+').replace('_', '/');
            switch (output.length % 4) {
                case 0:
                    break;
                case 2:
                    output += '==';
                    break;
                case 3:
                    output += '=';
                    break;
                default:
                    throw 'Illegal base64url string!';
            }
            return window.atob(output);
        }
    
    var funcLoginInfo = function($cordovaSQLite,DBA,$http,$q, ApiEndpoint,commonAppService,base64 ) {
        var self = this;
        self.verifyLoggedInUser = function(imeiId,pinNum) {
            var parameters= [imeiId,pinNum];
            if ( commonAppService.getToken("JWT") != null ){
                commonAppService.setToken("JWT","");
                //console.log("old token exists, set to null ->"+commonAppService.getToken("JWT"));
            }
            console.log(">>>>>>>>>>>>>>>>>>trying to hit server");
            return $http.get(ApiEndpoint + '/user/userLogin/deviceId/'+imeiId+"/pin/"+pinNum,{skipAuthorization: true})
            
              //.then(function(abc){
             .then(function(result){
                console.log("result from Login user is "+JSON.stringify(result));
                var serverValues = angular.fromJson(result.data);
                if (serverValues.result) {
                    commonAppService.setToken("JWT",serverValues.jwt);
                    
                    var jwtTokenUserData = commonAppService.getToken("JWT");
                    if (typeof jwtTokenUserData !== 'undefined') {
                        var encoded = jwtTokenUserData.split('.')[1];
                        data = JSON.parse(urlBase64Decode(encoded));
                        console.log("User details are "+JSON.stringify(data));
                        commonAppService.setloggedInUserId(data.data.uid);
                        commonAppService.setloggedInUserType(data.data.role);
                        commonAppService.setloggedInUserRole(data.data.role_id);
                        commonAppService.setloggedInUserName(data.data.user_name);
                    }
                }
                return serverValues.result;
                //return DBA.processResultSethttp(result);// for local db
              },function(error) {
                    console.log("Error in DBA-> Service(LoginInfo); function(getLoggedInUserInfo); "+JSON.stringify(error));
                    return error.status;
                });
          }
                
        /*self.getLoggedInUserInfo = function(uid) {
            var parameters= [uid];
            return DBA.query(" select uid,first_name,last_name,gender,email_id,user_type,st_num,cst_num,pan_num,tin_num,phone_num,shipping_address,shop_name,regd_status from user_details where uid=(?)" , parameters)
              .then(function(result){
                console.log(" Service(LoginInfo); function(getLoggedInUserInfo); "+ result.rows.length);
                return DBA.processResultSet(result);
              },function(error) {
                    console.log("Error in DBA-> Service(LoginInfo); function(getLoggedInUserInfo); "+error.message);
                });
          }*/
        self.userLogout = function(){
            return $http.get(ApiEndpoint + '/user/logout').then(function(result){
                console.log(" Service(LoginInfo); function(logout); "+ JSON.stringify(result));
            });
        }
        /*self.verifyUserOffline = function(deviceId,pin){
            var parameters= [deviceId,pin];
            console.log("pin and imei ID is "+deviceId+"-"+pin);
             return DBA.query("select auth_f,user_type,user_role_id from user_auth where device_id=(?) and pin = (?) ;" , parameters).then(function(result){
                console.log(" Service(LoginInfo); function(verifyUserOffline); "+ result.rows.length);
                    return DBA.processResultSet(result);
              },function(error) {
                    console.log("Error in DBA-> Service(LoginInfo); function(verifyUserOffline); "+error.message);
                });
        }*/
        return self;
    };
    
    
    kitApp.factory('LoginInfo',funcLoginInfo);    
}());