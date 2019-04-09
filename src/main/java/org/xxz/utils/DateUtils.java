package org.xxz.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class DateUtils {
    
    public static String YYYYMMDDhhmmss = "YYYY-MM-DD hh:mm:ss";
    public static void main(String args[]) {
    
        List<String> list = new ArrayList<>();
    
        list.add("2018-12-18 23:09:00");
        list.add("2018-12-18 23:10:00");
        list.add("2018-12-18 23:11:00");
        list.add("2018-12-18 23:13:00");
        list.add("2018-12-18 23:12:00");
    
        Collections.sort(list, new Comparator<String>(){
            @Override
            public int compare(String c1, String c2) {
                DateFormat df = new SimpleDateFormat(YYYYMMDDhhmmss);
                try {
                    Date date1 = df.parse(c1);
                    Date date2 = df.parse(c2);
                    if (date1.getTime()>date2.getTime()){
                        return 1;
                    }else if (date1.getTime()==date2.getTime()){
                        return 0;
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                return -1;
            }
        });

        System.out.println(list);
    }

}
