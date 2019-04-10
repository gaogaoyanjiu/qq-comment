package org.xxz.domain;

import lombok.Data;

@Data
public class Customer {
    
    private String id;

    private String username;  //用户名
    private String password;  //密码
    private String nickName;  // 昵称
    private String faceImage; // 回复评论的人的头像
    
    /*********** 点赞相关 **********/
    private Integer fansCounts; // 我的粉丝数量
    private Integer followCounts; // 我关注的人总数
    private Integer receiveLikeCounts; // 我接受到的赞美/收藏 的数量

}
