package com.ylwl.utils;



public class GetCityListByProvinceId {
	public static String cityList(String provinceId){
		String url="http://v.juhe.cn/historyWeather/citys?province_id="+provinceId+"&key=ca556483dcaa7ccc8647df71293d52f7";
        return HttpUtil.doGet(url);//通过工具类获取返回数据
	}
}
