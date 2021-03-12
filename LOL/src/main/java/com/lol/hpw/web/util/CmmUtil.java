package com.lol.hpw.web.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;

public class CmmUtil {

	public static Map<String,Object> requestApi(String pathUrl, String code) {
		Map<String,Object> resultMap = new HashMap<String, Object>();
		try {
			URL url = new URL(pathUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setDoOutput(true);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			if (con.getResponseCode() != 200) {
                System.out.println("Failed: HTTP error code : " + con.getResponseCode());
            	throw new RuntimeException("Failed: HTTP error code : " + con.getResponseCode());
            } else {
                System.out.println("발송 성공");
            }
			String result = new String();
			String line = null;
            while((line = br.readLine()) != null){
            	result = result + line;
            	System.out.println(line);
            }
            JSONParser parser = new JSONParser(result);
            if(code.equals("S")) {
            	Map<String,Object> map = parser.object();
            	resultMap.put("USER_NM", map.get("name"));
            	resultMap.put("USER_LEVEL", map.get("summonerLevel"));
            	resultMap.put("USER_ICON", map.get("profileIconId"));
            	resultMap.put("USER_ID", map.get("id"));
            	resultMap.put("USER_ACCOUNT_ID", map.get("accountId"));
            } else if(code.equals("L")) {
            	List<Object> list = parser.list();
            	resultMap.put("leagueList", list);
            } else if(code.equals("M")) {
            	Map<String,Object> map = parser.object();
            	resultMap.put("matchList", map);
            } 
            br.close();
            con.disconnect();
            Thread.sleep(500);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("error", "error");
		}
		return resultMap;
	}
}
