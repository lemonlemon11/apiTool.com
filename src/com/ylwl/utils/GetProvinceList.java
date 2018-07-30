package com.ylwl.utils;

import com.sun.org.apache.regexp.internal.recompile;
import com.ylwl.pojo.Province;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class GetProvinceList {
	public static String provinceList(){
		String url="http://v.juhe.cn/historyWeather/province?key=ca556483dcaa7ccc8647df71293d52f7";
        return HttpUtil.doGet(url);//通过工具类获取返回数据
	}
//	public static void main(String[] args) {
//		JSONObject jsonObject=JSONObject.fromObject(GetProvinceList.provinceList());
//        Province province=(Province)JSONArray..toBean(jsonObject, Province.class);
//		System.out.println(province);
//	}
	public static String formateProvinceList(String[] args) {
		String jsonString=GetProvinceList.provinceList();
		String json=GetProvinceList.provinceList().substring(jsonString.lastIndexOf("["),jsonString.lastIndexOf("]")+1);
		return json;
	}
}
