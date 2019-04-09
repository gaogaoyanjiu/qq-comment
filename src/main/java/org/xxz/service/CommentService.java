package org.xxz.service;

import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.xxz.domain.Comment;
import org.xxz.domain.Customer;
import org.xxz.mapper.CommentMapper;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class CommentService {

    @Resource
    private CommentMapper commentDao;

    @Resource
    private CustomerService customerService;
    
    /**
     * 根据评论对象的Id查询所有评论
     * @param itemId
     * @param offset
     * @param limit
     * @return
     */
    public List<Comment> findCommentByItemId(String itemId, int offset, int limit) {
        PageHelper.startPage(offset, limit);
        
        //查询出父级评论
        List<Comment> comments = commentDao.findParentCommentByItemId(itemId);
        
        
        for (Comment comment : comments) {
            List<Comment> replys = new ArrayList<>();   // 实例化回复的集合
            comment.setReplyComment(replys);                   // 设置评论的回复集合
            String customerId = comment.getCustomerId();       // 获取评论的人的Id
            Customer customer = customerService.getCustomerByCustomerId(customerId); // 通过评论人的Id获取评论人的信息
            comment.setCustomer(customer);                     // 设置评论的人的信息
            
            buildReplyComment(comment, replys, offset, limit); // 构建评论与回复信息
        }
        return comments;
    }

    /**
     * 构建评论与回复评论的关系
     * 
     * @param comment
     * @param offset
     * @param limit
     */
    private void buildReplyComment(Comment comment, List<Comment> replys, int offset, int limit) {
        PageHelper.startPage(offset, limit);
        List<Comment> replyComments = commentDao.findReplyCommentByCommentId(comment.getId()); // 获取评论的所有回复
        // 递归的结束条件是集合长度小于0
        if(replyComments.size()<0){
            return;
        }
        
        replys.addAll(replyComments); // 把所有的回复添加到评论实例化的回复集合中
       
        for (Comment c : replyComments) { // 遍历回复中的回复
            String customerId = c.getCustomerId(); // 获取回复人的id
            Customer replyCustomer = customerService.getCustomerByCustomerId(customerId); // 获取回复人信息
            Customer customer = customerService.getCustomerByCustomerId(comment.getCustomerId()); // 获取评论人的信息
            c.setCustomer(customer); // 设置评论人的信息
            c.setReplyCustomer(replyCustomer); // 设置回复人的信息
            buildReplyComment(c, replys, offset, limit); // 递归调用
        }
    }

}
