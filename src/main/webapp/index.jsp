<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
<html>    
    <head>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <title>WhereUs</title>    
    </head>
    <link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>favicon.ico" media="screen" />
    <link href="<%=basePath%>resources/js/plugins/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/js/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath%>resources/js/plugins/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugins/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugins/jquery.validate.min.js"></script>
        
    <body>
        <nav class="navbar navbar-default">
          <!-- head begin -->
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <a class="navbar-brand" href="javascript:void(0);">WhereUs</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="javascript:checkHome();" id="homePage">首页<span class="sr-only">(current)</span></a></li>
		        <li><a href="javascript:checkWeather();" id="queryWeather">天气查询 </a></li>
		        <li><a href="#myModal" id="modal-497033" data-toggle="modal">Login</a>
		        </li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		    <div class="hero-unit " id="innerPage">
			</div>
		  </div><!-- /.container-fluid -->
		 
		 
		</nav>  
		  <!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
		   aria-labelledby="myModalLabel" aria-hidden="true">
		   <div class="modal-dialog">
		      <div class="modal-content">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="myModalLabel">
		              	 Login
		            </h4>
		         </div>
		         <div class="modal-body">
					   <div class="form-group">
					      <label for="username">用户名</label>
					      <input type="text" class="form-control" id="username" placeholder="请输入用户名">
					   </div>
					   <div class="form-group">
					      <label for="password">密码</label>
					      <input type="text" class="form-control" id="password" placeholder="请输入密码">
					   </div>
		         </div>
		         <div class="modal-footer">
		            <button type="button" class="btn btn-default" 
		               data-dismiss="modal">关闭
		            </button>
		            <button type="button" id="loginBtn" class="btn btn-primary">
		              	 Login
		            </button>
		         </div>
		      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
		</div>
    </body>
    <script>
    	$(document).ready( 
    		function() { 
    			$("#innerPage").load("<%=basePath %>web/home");
    			
    			$("#loginBtn").click(function(){
    				var usrNameVal = $("#username").val().trim();
    				var psdVal = $("#password").val().trim();
    				$.ajax( {
    	    			url:'<%= basePath %>web/login',// 跳转到 action    
    	    		    data:{    
    	    		    	usrNameVal : usrNameVal,
    	    		    	psdVal : psdVal
    	    		    },
    	    		    type:'get',    
    	    		    cache:false,    
    	    		    dataType:'',    
    	    		    success:function(data) {
							if("OK" == data){
								
							}
    	    		    },    
    	    		    error : function() {
    	    		    	return false;
    	    		    }
    	    		});
   	    	    });
    		}
    	);
    	
    	function checkWeather(){
    		var obj = $("#queryWeather");
    		removeClass(obj);
    		obj.parent().attr("class", "active") 
    		$("#innerPage").load("<%=basePath %>web/weatherQuery");
    	}
    	
    	function checkHome(){
    		var obj = $("#homePage");
    		removeClass(obj);
    		
    		obj.parent().attr("class", "active")
    		$("#innerPage").load("<%=basePath %>web/home");
    	}
    	
    	function removeClass(obj){
    		var lichilds = obj.parent().parent().children("li");
    		$.each(lichilds,function() {
    			$(this).removeClass();
            });
    	}
    </script>
</html>