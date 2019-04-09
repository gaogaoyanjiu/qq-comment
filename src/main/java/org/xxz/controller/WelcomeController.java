package org.xxz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xxz.domain.Comment;
import org.xxz.service.CommentService;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;


/**
 *  借鉴：https://blog.csdn.net/xxzblog/article/details/42013397
 */
@Controller
public class WelcomeController {
    
    @Resource
    private CommentService commentService;
    
    /**
     * 测试返回json
     * @return
     */
    @RequestMapping("/hello")
    @ResponseBody
    public String hello() {
        return "hello";
    }
    
    
    /**
     * 测试返回model到模板的数据
     * @param model
     * @return
     */
    @RequestMapping("/test")
    public String test(ModelMap model) {
        model.put("key", "评论功能");
        return "test";
    }
    
    
    
//    http://localhost:8080//comment?itemId=1
    @RequestMapping("/comment")
    public String comment(String itemId, ModelMap model) {
        List<Comment> itemComments = commentService.findCommentByItemId(itemId, 1, 10);
    
    
        /**
         * 对返回的评论结果根据日期 重新排序
         *
         * 【曹操】: 魏国大业全仰仗各位将军啦 (2018-12-18 23:09:00)
         * 【郭嘉】回复了【曹操】 主公，华佗说你这病需要进行开颅手术 (2018-12-18 23:10:00)
         * 【华佗】回复了【曹操】 是啊，主公您要保重身体啊。。。 (2018-12-18 23:11:00)
         * 【华佗】回复了【曹操】 主公，我好心救你，你不能这样对我啊，主公！！！ (2018-12-18 23:13:00)
         * 【曹操】回复了【华佗】 混账东西，你是想谋害老夫么，拖出去砍了 (2018-12-18 23:12:00)
         *     ||
         *     ||
         *     ||
         * 【曹操】: 魏国大业全仰仗各位将军啦 (2018-12-18 23:09:00)
         * 【郭嘉】回复了【曹操】 主公，华佗说你这病需要进行开颅手术 (2018-12-18 23:10:00)
         * 【华佗】回复了【曹操】 是啊，主公您要保重身体啊。。。 (2018-12-18 23:11:00)
         * 【曹操】回复了【华佗】 混账东西，你是想谋害老夫么，拖出去砍了 (2018-12-18 23:12:00)
         * 【华佗】回复了【曹操】 主公，我好心救你，你不能这样对我啊，主公！！！ (2018-12-18 23:13:00)
         *
         */
        for (Comment c:itemComments){
            List<Comment> replyComment = c.getReplyComment();
            Collections.sort(replyComment, new Comparator<Comment>(){
                @Override
                public int compare(Comment c1, Comment c2) {
                    DateFormat df = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");
                    try {
                        Date date1 = df.parse(c1.getCommentDate()+ " " +c1.getCommentTime());
                        Date date2 = df.parse(c2.getCommentDate()+ " " +c2.getCommentTime());
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
            //测试检查排序后的结果
            for (Comment  c2:replyComment) {
                System.out.println(c2.getCommentTime());
            }
        }
        model.put("itemComments", itemComments);
        return "comment";
    }

}
