<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

<script>
    $(document).ready(function () {
        var result = '<c:out value="${result }" />';
        checkModal(result);
        history.replaceState({}, null, null);

        function checkModal(result) {
            if (result === '') {
                return;
            }
            if (parseInt(result) > 0) {
                $('.modal-body').html('게시글: ' + parseInt(result) + "번이 등록되었습니다!");
            }
            $('#myModal').modal('show');
        } // end of checkModal

        $('#regBtn').on('click', function () {
            self.location = 'registerForm';
        })
    });
</script>
<div class="panel-heading">Board List page
    <button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
</div>
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
                                <a href='get?bno=<c:out value="${board.bno }" />'><c:out value="${board.bno }"></c:out></a>
                            </td>
                            <td>
                                <a href='get?bno=<c:out value="${board.bno }" />'><c:out value="${board.title }"></c:out></a>
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
            <!-- Modal window -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            처리가 완료되었습니다!!
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>

                    </div>
                </div>
            </div>
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
            <li class="pagenate_button page-item"><a class='page-link' href="#">${num }</a></li>
        </c:forEach>
        <c:if test="${pageMaker.next }">
            <li class="paginate_button next"><a href="#">Next</a></li>
        </c:if>
    </ul>
</div>

<%@include file="../includes/footer.jsp" %>
