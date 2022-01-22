<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<div class="panel-body">
				<form action="register" method="post" role="form">
					<div class="form-group">
						<label for="">Title</label><input type="text" class="form-control" name="title">
					</div>
					<div class="form-group">
						<label for="">Text Area</label>
						<textarea name="content" rows="3" class="form-control"></textarea>
					</div>
					<div class="form-group">
						<label for="">Writer</label><input type="text" class="form-control" name="writer">
					</div>
					<button type='submit' class='btn btn-default'>Submit</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>