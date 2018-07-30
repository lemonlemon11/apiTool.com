package com.ylwl.service.weather;

import net.sf.json.JSONObject;

import com.ylwl.utils.HttpUtil;

/**
 * @author Administrator
 * 历史上的天气信息
 */
public class HistoryWeatherReportByCity {
	/**
     * 根据城市名获取
     * @param cityName
     * @return
     */
    public static String excute(String cityId,String date){
        String url="http://v.juhe.cn/historyWeather/weather?" +
        		"city_id="+cityId+"&weather_date="+date+"&key=ca556483dcaa7ccc8647df71293d52f7";
        return HttpUtil.doGet(url);//通过工具类获取返回数据
    }
    
    public static String extractInfo(String cityId,String date){
    	JSONObject obj = JSONObject.fromObject(HistoryWeatherReportByCity.excute(cityId, date));
    	String result=obj.getString("error_code");
//        /*如果状态码是200说明返回数据成功*/
        if(result!=null&&result.equals("0")){
        	return obj.getString("result");
        }
		return "{'result':''error}";
    	
    }
}
