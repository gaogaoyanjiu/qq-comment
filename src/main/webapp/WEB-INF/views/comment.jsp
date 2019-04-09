<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>comment</title>
</head>

<body>

	<c:forEach var="comment" items="${itemComments}">
		<span class="ellipsis">【<c:out value="${comment.customer.nickName}" />】:</span>
		<span class="ellipsis">${comment.content}</span>
		<span class="ellipsis">(<c:out value="${comment.commentDate} ${comment.commentTime}" />)</span>
		<br />

		<%-- 回复 --%>
		<c:if test="${!empty comment.replyComment}">

			<c:forEach var="reply" items="${comment.replyComment}">
              【${reply.replyCustomer.nickName}】回复了【${reply.customer.nickName}】
	            <span class="ellipsis">${reply.content}</span>
				<span class="ellipsis">(<c:out value="${reply.commentDate} ${reply.commentTime}" />)</span>
				<br />
			</c:forEach>

		</c:if>


	</c:forEach>

</body>
</html>

