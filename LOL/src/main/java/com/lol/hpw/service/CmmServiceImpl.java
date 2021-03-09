package com.lol.hpw.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lol.hpw.properties.LolProperties;
import com.lol.hpw.web.util.CmmUtil;


@Service("cService")
public class CmmServiceImpl implements CmmService {
	
	@Autowired
	LolProperties prop;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CmmServiceImpl.class);

	@Override
	public Map<String, Object> searchUser(String userName) {
		String END_POINT = prop.END_POINT;
		String KEY = prop.PKEY;
		String pathUrl = END_POINT + "summoner/v4/summoners/by-name/"+userName+"?api_key="+KEY;
		Map<String, Object> resultMap = CmmUtil.requestApi(pathUrl);
		
		return resultMap;
	}

}
