package com.yannis.whereus.service.login.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yannis.whereus.dao.ILoginDao;
import com.yannis.whereus.entity.LoginUser;
import com.yannis.whereus.service.login.ILoginService;

@Service("loginService")
@Transactional
public class LoginService implements ILoginService {
	
	@Resource(name = "loginDao")  
    private ILoginDao loginDao;
	
	public String loginVerify(LoginUser user) {
		String sql = "SELECT 1 FROM user WHERE username = '"+user.getUsername()+"' and password = '"+user.getPassword()+"'";
		List list = loginDao.userIsExist(sql);
		if(list.isEmpty() ){
			return "Error";
		}
		String str = list.get(0).toString();
		if("1".equals(str)){
			return "OK";
		}
		return "Error";
	}

}
