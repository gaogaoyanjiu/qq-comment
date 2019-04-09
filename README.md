#评论功能

### 评论主题表、评论表、用户表
```
 评论主题表 和 评论表是 1 对 多关系 ：一个主题可以有多个评论
 
 用户表 和 评论主题表 是 多 对 多关系 ：一个用户可以评论多个主题，一个主题可以被多个用户评论
   
 评论表 通过 递归调用 查询评论的所有回复
 
 
 
新增评论的SQL：
 
INSERT INTO t_comment(id,customer_id,parent_comment_id,	content_id,	type,content,comment_date,comment_time,state`)
VALUES('17',	'3','16','1','1','张飞愿前往,等待主公检阅','2018-12-18','23:16:00','0'	);


```
  
![img](./doc/topic.png)

