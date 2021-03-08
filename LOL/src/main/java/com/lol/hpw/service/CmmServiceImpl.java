package com.lol.hpw.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service("cService")
public class CmmServiceImpl implements CmmService {

	@Override
	public Map<String, Object> searchUser(Map<String, Object> param) {
		System.out.println(String.valueOf(param.get("userName")));
		return null;
	}

}
