/*========================================================================
 * - COPYRIGHT NOTICE -  
 *                                                *
 * Project Name:WhereUs 
 * File Name:WeatherQueryController.java 
 * Package Name:com.yannis.whereus.controller.weather 
 * Date:Jun 18, 20154:03:33 PM 
 * Copyright (c) 2015, piggachen@163.com All Rights Reserved.                                     
 *
 *                                                                       *
 ========================================================================*/

package com.yannis.whereus.controller.login;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yannis.whereus.entity.LoginUser;
import com.yannis.whereus.service.login.ILoginService;

@Controller
public class LoginController {
	
	@Resource(name = "loginService")
	private ILoginService loginService; 
	
	@RequestMapping(value="login")    
    public @ResponseBody String loginVerify(HttpServletRequest request){
		
		String usrNameVal = request.getParameter("usrNameVal");
		String psdVal = request.getParameter("psdVal");
		LoginUser user = new LoginUser();
		user.setUsername(usrNameVal);
		user.setPassword(psdVal);
		
	    return loginService.loginVerify(user);
    }
	
}
