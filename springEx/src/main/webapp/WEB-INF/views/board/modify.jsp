<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Board Modify Page</div>
            <div class="panel-body">
                <form role="form" action="modify" method="post">
                    <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }" />'>
                    <input type='hidden' name='amount' value='<c:out value="${cri.amount }" />'>
                    <div class="form-group">
                        <label for="">Bno</label>
                        <input type="text" class="form-control" name='bno' value='<c:out value="${board.bno}" />'
                            readonly='readonly'>
                    </div>
                    <div class="form-group">
                        <label for="">Title</label>
                        <input type="text" class="form-control" name='title' value='<c:out value="${board.title}" />'>
                    </div>
                    <div class="form-group">
                        <label for="">Text area</label>
                        <textarea name="content" class="form-control"><c:out value="${board.content }" /></textarea>
                    </div>
                    <div class="form-group">
                        <label for="">Writer</label>
                        <input type="text" class="form-group" name='writer' value='<c:out value="${board.writer}" />'
                            readonly='readonly'>
                    </div>
                    <div class="form-group">
                        <label for="">RegDate</label>
                        <input type="text" class="form-control" name='regDate'
                            value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }" />'
                            readonly='readonly'>
                    </div>
                    <div class="form-group">
                        <label for="">Update Date</label>
                        <input type="text" class="form-control" name='updateDate'
                            value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}" />'
                            readonly='readonly'>
                    </div>
                    <button type='submit' data-oper='modify' class='btn btn-default'>Modify</button>
                    <button type='submit' data-oper='remove' class='btn btn-danger'>Remove</button>
                    <button type='submit' data-oper='list' class='btn btn-info'>List</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    var formObj = $('form');
    $('button').on('click', function (e) {
        e.preventDefault();
        var operation = $(this).data('oper');

        if (operation == 'remove') {
            formObj.attr('action', 'remove');

        } else if (operation == 'list') {
            //self.location = 'list';
            formObj.attr('action', 'list').attr('method', 'get');
            var pageNumTag = $('input[name="pageNum"]').clone();
            var amountTag = $('input[name="amount"]').clone();

            formObj.empty();
            formObj.append(pageNumTag);
            formObj.append(amountTag);
        }
        formObj.submit();
    })
</script>

<%@include file="../includes/footer.jsp" %>