<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>comment</title>
</head>
<body>
<%-- 商品信息 --%>
<div>
	<table>
		<tr>
			<td>
				<img src="static/img/sgyy.jpg" alt="" width="420px" height="420px">
			</td>
			<td>
				<h1> 书名 ：三国演义 </h1>
				<h2 style="font: red"> 价格 ：188 元 </h2>
				<h4>描述 ：
					  <div>
						  《三国演义》是中国古典四大名著之一，是中国第一部长篇章回体历史演义小说。
					  </div>
					   <div>
						   学习经典名著可以培养一个人的素养，让你心中有一种正确而优雅的为人处世观。
					   </div>
				</h4>
			</td>
		</tr>
	</table>
</div>
<hr>
<%-- 商品评论  --%>
   <h1>商品评论</h1>
		<span class="sp"  id="stars">
			与描述相符4
			<%--<span star="1">★</span>--%>
			<%--<span star="2">★</span>--%>
			<%--<span star="3">★</span>--%>
			<%--<span star="4">★</span>--%>
			<%--<span star="5">★</span>--%>
			<span star="1" style="color: red">★</span>
			<span star="2" style="color: red">★</span>
			<span star="3" style="color: red">★</span>
			<span star="4" style="color: red">★</span>
			<span star="5" >★</span>
        </span>
         &nbsp;&nbsp;&nbsp;&nbsp;<span id="ret"></span>

        <br/><br/>
		<span class="sp">质量很好(215)</span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="sp">内容很好(162)</span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="sp">价格实惠(360)</span>

       <br/><br/>
		<span class="sp">包装很精美(343)</span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="sp">很划算(420)</span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="sp">做工较差(26)</span>
        <br/><br/>

        <hr>

    <%-- 商品回复 --%>
	<c:forEach var="comment" items="${itemComments}">
		<br/>

		<table  class="tab1">
			<tr>
				<td style="width:100px;height: 120px">
					<%--<span class="ellipsis"><img src="static/img/png/liubei.png" width=64px" height="64px"></span>--%>
					<span class="ellipsis"><img class="faceImg" src="${comment.customer.faceImage}" width=64px" height="64px"></span>
					<br/>【<c:out value="${comment.customer.nickName}" />】
				</td>

				<td style="width:60px;">
					<b>评论: &nbsp;&nbsp;</b>
				</td>
				<td>
					<div>
						评论时间：
						<span class="ellipsis">(<c:out value="${comment.commentDate} ${comment.commentTime}" />)</span>
					</div>
					<div>
						评论内容：
						<span class="ellipsis">${comment.content}</span>
					</div>
				</td>

				<td class="fansTd">
					<div class="fansDiv">
						&nbsp;&nbsp;&nbsp;&nbsp;
						 <span>
								<button onclick="like()">点赞</button>
							    <button onclick="rmveLike()">取消点赞</button>
							    <button onclick="follow()">收藏</button>
						</span>

						<br><br>
						&nbsp;
						<span>
						粉丝数：<c:out value="${comment.customer.fansCounts}" />
						关注数：<c:out value="${comment.customer.followCounts}" />
						点赞数：<c:out value="${comment.customer.receiveLikeCounts}" />
						</span>
					</div>
				</td>
			</tr>
	    </table >

		<%-- 回复 --%>
		<c:if test="${!empty comment.replyComment}">

			<c:forEach var="reply" items="${comment.replyComment}">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<table class="tab2">
					<tr >
						<td style="width:80px;height: 120px">
								<%--<span class="ellipsis"><img src="static/img/png/guanyu.png" width=64px" height="64px"></span>--%>
							<span class="ellipsis">
                                <c:if test="${!empty reply.faceImage}">
								  <img class="faceImg" src="${reply.faceImage}" width=64px" height="64px"></span>
								</c:if>
								<c:if test="${empty reply.faceImage}">
									<img class="faceImg" src="static/img/jpg/moren.jpg" width=64px" height="64px"></span>
								</c:if>
                                <br/>【${reply.replyCustomer.nickName}】
						</td>

						<td style="width:80px;">
							<b>回复了</b>
						</td>
						<td style="width:80px;height: 120px">
							<span class="ellipsis">
								 <c:if test="${!empty reply.customer.faceImage}">
								   <img class="faceImg" src="${reply.customer.faceImage}" width=64px" height="64px"></span>
						         </c:if>
								<c:if test="${empty reply.customer.faceImage}">
									<img class="faceImg" src="static/img/jpg/moren.jpg" width=64px" height="64px"></span>
								</c:if>
							<br/>【${reply.customer.nickName}】
						</td>
						<td style="width: 600px">
							<div>
								回复时间：
								<span class="ellipsis">(<c:out value="${reply.commentDate} ${reply.commentTime}" />)</span>
							</div>
							<div>
								回复内容：
								<span class="ellipsis">${reply.content}</span>
							</div>
						</td>

						<td class="fansTd" >
							<div class="fansDiv">
								&nbsp;&nbsp;&nbsp;&nbsp;
								 <span>
								   <button onclick="like()">点赞</button>
							       <button onclick="rmveLike()">取消点赞</button>
							       <button onclick="follow()">收藏</button>
						       </span>
								<br><br>
								&nbsp;
								<span>
									粉丝数：<c:out value="${reply.customer.fansCounts}" />
									关注数：<c:out value="${reply.customer.followCounts}" />
									点赞数：<c:out value="${reply.customer.receiveLikeCounts}" />
								</span>
							</div>

						</td>
					</tr>
				</table>

			</c:forEach>
		</c:if>
		<br />
		<hr/>
	</c:forEach>
</body>

<style>

	/* 头像  */
	.faceImg {
		border-style: solid;
		border-width: 2px;
		border-color: blue rgb(25%,35%,45%) #909090 red;
		border-radius: 32px;
	}

	/* 评论 table */
	.tab1{
		width: 1400px;
		height: 120px;
		border-style: solid;
		border-width: 2px;
		border-color: blue rgb(25%,35%,45%) #909090 red;
		/*border-radius: 32px;*/
	}

	/* 回复 table */
	.tab2{
		width: 1400px;
		height: 120px;
		border-style: solid;
		border-width: 2px;
		border-color: blue rgb(25%,35%,45%) #909090 red;
		/*border-radius: 32px;*/
	}

	.sp{
		width: 100px;
		height: 10px;
		border-style: solid;
		border-width: 2px;
		border-color: blue rgb(25%,35%,45%) #909090 red;
		border-radius: 3px;
	}

	/* 粉丝 评论 点赞 */
	.fansTd{
		float: right;
		width: 240px !important;
		height: 120px;

		border-style: solid;
		border-width: 2px;
		border-color: blue rgb(25%,35%,45%) #909090 red;
	}

	.fansDiv {
		margin-top: 35px;

	}

	button{
		color:blue;
	}
	span {
		cursor: pointer;
	}
</style>

<script type="text/javascript">
    window.onload = function () {
        // 获取元素
        var stars = document.getElementById('stars').getElementsByTagName('span');
        var ret = document.getElementById('ret');

        //定义getStar函数
        function getStar(n) {
            n = parseInt(n);
            for (var i = 0, len = stars.length; i < len; i++) {
                if (i <= n - 1) {
                    stars[i].style.color = 'red';
                }
                else {
                    stars[i].style.color = '';
                }
            }
            ret.innerHTML = n + '星';
        }

        // 每个星星节点的点击事件
        for (var i = 0, len = stars.length; i < len; i++) {
            stars[i].onclick = function () {
                getStar(this.getAttribute('star'));
            }
        }

    }

    function like() {
        alert("点赞")
    }

    function rmveLike() {
        alert("取消点赞")
    }

    function follow() {
        alert("收藏")
    }

</script>

</html>

