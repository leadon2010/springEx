<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>
<a href="registerForm">등록화면</a>
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">Tables</h1>
<p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
    For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official
        DataTables documentation</a>.</p>

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>수정일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="board" items="${list }">
                        <tr>
                            <td>
                                <c:out value="${board.bno }"></c:out>
                            </td>
                            <td>
                                <c:out value="${board.title }"></c:out>
                            </td>
                            <td>
                                <c:out value="${board.writer }"></c:out>
                            </td>
                            <td>
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" />
                            </td>
                            <td>
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- added. -->
<div class="pull-right">
    <ul class="pagination">
        <c:if test="${pageMaker.prev }">
            <li class="paginate_button previous"><a href="#">Previous</a></li>
        </c:if>
        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
            <li class="pagenate_button"><a href="#">${num }</a></li>
        </c:forEach>
        <c:if test="${pageMaker.next }">
            <li class="paginate_button next"><a href="#">Next</a></li>
        </c:if>
    </ul>
</div>

<%@include file="../includes/footer.jsp" %>