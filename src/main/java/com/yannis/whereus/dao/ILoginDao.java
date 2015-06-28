package com.yannis.whereus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository; 

@Repository("loginDao") 
public interface ILoginDao {
	
	@Select(value = "${sql}")  
	List userIsExist(@Param(value = "sql") String sql);
}
