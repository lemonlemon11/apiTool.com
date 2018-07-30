package com.ylwl.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ylwl.service.weather.HistoryWeatherReportByCity;
import com.ylwl.service.weather.WeatherReportByCity;

public class WeatherServlet extends HttpServlet{
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		System.out.println(path);
		if("/WeatherReprotByCity".equals(path)){
			String cityname = request.getParameter("cityname");
			String temp=WeatherReportByCity.GetTodayTemperatureByCity(cityname);
			System.out.println(temp);
			out.print(temp);
		}
		if("/HistoryWeatherReportByCity".equals(path)){
			String province=request.getParameter("province");
			String date=request.getParameter("date");
			String city=request.getParameter("city");
			System.out.println(province+date+	city);
			out.print(HistoryWeatherReportByCity.extractInfo(city, date));
		}
	}
}
