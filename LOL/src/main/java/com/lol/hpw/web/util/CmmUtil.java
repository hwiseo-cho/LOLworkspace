package com.lol.hpw.web.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;

public class CmmUtil {

	public static Map<String,Object> requestApi(String pathUrl) {
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
            Map<String,Object> map = parser.object();
            resultMap.put("USER_NM", map.get("name"));
            resultMap.put("USER_LEVEL", map.get("summonerLevel"));
            resultMap.put("USER_ICON", map.get("profileIconId"));
            br.close();
            con.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}
