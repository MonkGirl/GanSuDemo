<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%@ page import="com.powersi.ssm.biz.medicare.common.util.BizHelper"%>

<%
	String path = request.getContextPath();

	String hospital_id = BizHelper.getAkb020();
	String hospital_name = BizHelper.getAkb021();
	String loginUser = BizHelper.getLoginUser();
	String userName = BizHelper.getUserName();
	String aaa027 = BizHelper.getAaa027();
	request.setAttribute("aaa027", aaa027);
%>

<powersi:html>
<head>
<powersi:head title="体检结论修改" target="_self" />
</head>
<body>
	<powersi:form id="mainform" disabled="true">
		<powersi:editorlayout cols="6">
			<powersi:editorlayout-row>
				<powersi:editorlayout-button colspan="6">
					<powersi:button cssClass="button" label="保 存" onclick="save()"></powersi:button>
					<powersi:button cssClass="button" label="取 消"
						onclick="javascript:closeDialog();"></powersi:button>
				</powersi:editorlayout-button>
			</powersi:editorlayout-row>
			<powersi:editorlayout-row>

				<powersi:textfield id="bkh049" name="healthDTO.bkh049"
					label="结论项目编码" required="true" validate="maxSize[50]" readonly="true"/>
				<powersi:textfield id="bkh050" name="healthDTO.bkh050"
					label="结论项目名称" required="true" validate="maxSize[100]" />
			 	<powersi:textfield id="bkh054" name="healthDTO.bkh054" 
			 	    label="所属指标"  required="true" validate="maxSize[1]" /> 
			</powersi:editorlayout-row>
			<powersi:editorlayout-row>
				<powersi:codeselect id="bka035" name="healthDTO.bka035" label="人员类型"
					required="true" codeType="bka035"/>
				<powersi:textfield id="bkh051" name="healthDTO.bkh051" label="参考范围上限"
					validate="maxSize[30]" />
				<powersi:textfield id="bkh052" name="healthDTO.bkh052" label="参考范围下限"
					 required="true" readonly="false" validate="maxSize[30]"/>
			</powersi:editorlayout-row>
			<powersi:editorlayout-row>
				<powersi:textfield id="bkh057" name="healthDTO.bkh057" label="单位控制指标"
					 required="true" readonly="false" validate="maxSize[1]"/>
				<powersi:textfield id="bkh058" name="healthDTO.bkh058" key="bkh048"
					label="疾病控制指标"  headerKey="0"  validate="maxSize[1]"
					required="true" />
						<powersi:textfield id="bkh056" name="healthDTO.bkh056" label="参考范围指标"
					 required="true" readonly="false" validate="maxSize[1]"/>
			
			</powersi:editorlayout-row>
			<powersi:editorlayout-row>
				<powersi:textfield id="bkh103" name="healthDTO.bkh103" label="生效时间"
					validate="maxSize[300]" mask="date"/>
				<powersi:textfield id="bkh104" name="healthDTO.bkh104" label="失效时间"
					required="true" mask="date"/>
				<powersi:textfield id="aae013" name="healthDTO.aae013" label="备注"
					validate="maxSize[120]" />
			</powersi:editorlayout-row>


			<powersi:editorlayout-row>
				<powersi:hidden id="aaa027" name="healthDTO.aaa027" label="统筹区编码"/>
				<powersi:hidden id="aka021" name="healthDTO.aka021" label="五笔码"/>
				<powersi:hidden id="aka020" name="healthDTO.aka020" label="首拼码" />
				<powersi:hidden id="bkh037" name="healthDTO.bkh037" label="数值类型" />
				<powersi:hidden id="bkh053" name="healthDTO.bkh053" label="叶子标识" />
				<powersi:hidden id="bkh046" name="healthDTO.bkh046" label="统计类别" />				
				<powersi:hidden id="bkh068" name="healthDTO.bkh068" label="序号" />
				<powersi:hidden id="bkh055" name="healthDTO.bkh055" label="排序" />
				<powersi:hidden id="bkh047" name="healthDTO.bkh047" label="版本号" />
				<powersi:hidden id="akb020" name="healthDTO.akb020" label="医疗机构编码 " />
				<powersi:hidden id="aae016" name="healthDTO.aae016" label="审核状态" code="aae016"/>
				<powersi:hidden id="aae100" name="healthDTO.aae100" label="有效标志" />
			</powersi:editorlayout-row>

		</powersi:editorlayout>

	</powersi:form>

	<powersi:errors />
	<script type="text/javascript">
       		
	window.onload = function(){
		$('#akb020').val("<%=hospital_id%>");
		if ($("#akb020").val() == '' || $("#akb020").val() == null) {
			popupAlert("医院编码不能为空，请检查登陆信息！");
			return;
		}

	}

	function save() {
		if(!checkFormValidtion())
     	{
	  		return;
		}
		
		var data =[{
			"bkh049": $("#bkh049").val(),//结论编码
			"bkh050": $("#bkh050").val(),//结论名称
			"aaa027": "${aaa027}",//统筹区编码
			"aka021": $("#aka021").val(),//五笔码
			"aka020": $("#aka020").val(),//首拼码
			"bkh037": $("#bkh037").val(),//数值类型 ：00，数值；11，码表
			"bkh053": $("#bkh053").val(),//叶子标识 ：0，叶子；1，目录
			"bkh046": $("#bkh046").val(),//统计类别
			"bkh054": $("#bkh054").val(),//所属指标
			"bka035": $("#bka035").val(),//人员类型
			"bkh051": $("#bkh051").val(),//参考范围上限
			"bkh052": $("#bkh052").val(),//参考范围下限
			"bkh056": $("#bkh056").val(),//参考范围指标
			"bkh057": $("#bkh057").val(),//单位控制指标
			"bkh058": $("#bkh058").val(),//疾病控制指标
			"bkh103": $("#bkh103").val(),//生效时间
			"bkh104": $("#bkh104").val(),//失效时间
			"bkh055": $("#bkh055").val(),//排序
			"bkh047": $("#bkh047").val(),//版本号
			"aae013": $("#aae013").val(),//备注
			"akb020": $("#akb020").val(),//医疗机构编码
			"aae100": $("#aae100").val()//有效标志
		}];
		var datas = powersi.tostring(data);
		postJSON("${rootPath}/medicare/HealthAction!saveConclusions.action",{
			"data":datas
		}, function(json) {
			if (!checkJSONResult(json)) {
				return;
			}
			alert(json.data);
			if (json.data == '保存成功！') {
				closeDialog();
			}
		});
		
		}

	
	</script>
</body>
</powersi:html>
