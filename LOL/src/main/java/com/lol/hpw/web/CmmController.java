package com.lol.hpw.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CmmController {

	@RequestMapping("/")
	public String goHome() {
		return "home";
	}
}
