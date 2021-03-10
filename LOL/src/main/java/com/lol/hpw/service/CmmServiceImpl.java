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
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String END_POINT = prop.END_POINT;
		String KEY = prop.PKEY;
		String summonerUrl = END_POINT + "summoner/v4/summoners/by-name/"+userName+"?api_key="+KEY;
		Map<String, Object> summonerMap = CmmUtil.requestApi(summonerUrl,"S");
		String leagueUrl = END_POINT + "league/v4/entries/by-summoner/"+String.valueOf(summonerMap.get("USER_ID"))+"?api_key="+KEY;
		Map<String, Object> rankMap = CmmUtil.requestApi(leagueUrl,"L");
		String matchUrl = END_POINT +"match/v4/matchlists/by-account/"+String.valueOf(summonerMap.get("USER_ACCOUNT_ID"))+"?api_key="+KEY;
		Map<String, Object> matchMap = CmmUtil.requestApi(matchUrl,"M");
		resultMap.put("summonerMap",summonerMap);
		resultMap.put("rankMap",rankMap);
		resultMap.put("matchMap",matchMap);
		
		return resultMap;
	}

}
