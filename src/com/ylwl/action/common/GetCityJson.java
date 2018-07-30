package com.ylwl.action.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ylwl.utils.GetCityListByProvinceId;
import com.ylwl.utils.GetProvinceList;

public class GetCityJson extends HttpServlet{
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		System.out.println(path);
		
		if("/GetCityListByProvinceId".equals(path)){
			String provinceId = request.getParameter("provinceId");
			out.print(GetCityListByProvinceId.cityList(provinceId));
		}
	}
}
