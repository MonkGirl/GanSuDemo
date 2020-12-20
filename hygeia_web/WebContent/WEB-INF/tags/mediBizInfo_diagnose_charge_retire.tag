<%@tag import="java.util.Date"%>
<%@tag import="com.powersi.hygeia.framework.util.DateFunc"%>
<%@tag import="com.powersi.ssm.biz.medicare.common.util.BizHelper"%>
<%@ tag pageEncoding="GBK" body-content="empty" small-icon=""
	display-name="ҽ��ҵ����Ϣ" description="ҽ��ҵ����Ϣ"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%
    String bka006Filter = " data_value in ('110')";
    String aaa027 = BizHelper.getAaa027();
%>
<style>
#imgdiv {
	height: 100px !important;
	width: 140px !important;
	border: 1px solid #d5e4f1;
	max-width: 100%; 
	max-height: 100%;
	background: url(${rootPath}/login/images/default.png) repeat 0px 0px;
	background-size:100% 100%;
}
</style>
<script type="text/javascript">
$(document).ready(
		function() {
			$("#aae030").val('<%=DateFunc.dateToString(new Date(), "yyyyMMdd")%>');
			$("#ake007").val('<%=DateFunc.dateToString(new Date(), "yyyyMMdd")%>');
			$("#bka006").val("110");
		});
/*
 * ���ز���
 */
function selectbka021(){
	var akf001 = $("#akf001").val();
	//����ǰ����ղ�����ҽ��ҽʦ
	$("#bka021").empty();
	$("#ake022").empty();
	$("#bka021").append("<option value='' >" + "��ѡ��..." + "</option>");
	$("#ake022").append("<option value='' >" + "��ѡ��..." + "</option>");
	$("#bka021").change();
	$("#ake022").change();
	if(powersi.isnull(akf001)){
		return;
	}
	$("#bka020").val($("#select2-chosen-2").text());
	postJSON("${rootPath}/diagnose/DiagnoseRegisterAction!loadBka021List.action",
			{"diagnoseInfoDTO.akf001":akf001},
			function(json){
				if(!checkJSONResult(json)){
					return;
				}
				if(json.data !='no'){
					var a = [];
					$.each(json.data, function(key, value) {
						a.push('<option value="');
						a.push(key);
						a.push('"');
						a.push(">");
						a.push(value);
						a.push("</option>");
					});
					$("#bka021").append(a.join(''));
				}
				if (!powersi.isnull(json.message)) {
					alert(json.message);
				}
			});
}
/*
 * ����ҽ��ҽʦ
 */
function selectbka503(){
	//����
	var akf001 = $("#akf001").val();
	//����
	var bka021 = $("#bka021").val();
	//
	var ake022 = $("#ake022").val();
	if(powersi.isnull(akf001) || powersi.isnull(bka021)){
		return;
	}
	$("#bka022").val($("#select2-chosen-3").text());
	$("#ake022").empty();
	$("#ake022").append("<option value='' >" + "��ѡ��..." + "</option>");
	postJSON("${rootPath}/diagnose/DiagnoseRegisterAction!loadBka503List.action",
				{"diagnoseInfoDTO.akf001":akf001},
				function(json){
					if(!checkJSONResult(json)){
						return;
					}
					if(json.data != "no"){
						var a = [];
						$.each(json.data, function(key, value) {
							a.push('<option value="');
							a.push(key);
							a.push('"');
							a.push(">");
							a.push(value);
							a.push("</option>");
						});
						$("#ake022").append(a.join(''));
					}
					if (!powersi.isnull(json.message)) {
						alert(json.message);
					}
				});
}

/*
 * �������
 */
function chooseDis(str) {
	popupDialog(
			{
				url : "${rootPath}/common/CommonManagerAction!chooseDisease.action",
				onClosed : function() {
					var retValue = this.returnValue;
					if (retValue) {
						$("#bkz101").val(retValue.aka121);
						$("#akc193").val(retValue.aka120);
						return $("#bka006").focus();
					} else {
						$("#bkz101").val("");
						$("#akc193").val("");
						return $("#bkz101").focus();
					}
				}
			}, 500, 600);
}

/*
 * �ı������س�ʱ�����¼�
 */
function keyDown(para) {
	if (event.keyCode == '13') {
		var filed_name = para.id;
		if ('aae030' == filed_name) {
			return $("#bka025").focus();
		}
		if ('bka025' == filed_name) {
			return $("#bka043").focus();
		}
		if ('bka043' == filed_name) {
			return $("#bka026_name").focus();
		}
		if ('bka026_name' == filed_name) {
			return chooseDis('bka026');
		}
	}
}
</script>
<powersi:editorlayout cols="15%,9%,13%,9%,15%,9%,15%,10%,15%">
	<tr>
		<td rowspan="4" colspan="1" align="center" style="border: 1px solid #d5e4f1;" >
			<div id="imgdiv" >
				<img id="dlrimg" height="100px" width="140px" style="max-height : 100%; max-width: 100%;">
				<powersi:hidden id="kc90id" name="diagnoseInfoDTO.kc90id" />
			</div>
		</td>
		<%-- <powersi:textfield id="bacu18" name="diagnoseInfoDTO.bacu18" key="�����˻����"
			readonly="true" cssStyle="color:red;" /> --%>
		<td id="td1" align="right" class="tdLabel">�����˻����</td>
		<td id="td2"> 
			<input id="bacu18" name="diagnoseInfoDTO.bacu18" type="text" value="" 
				readonly="readonly"  class="text textReadonly" style="color:red;" spellcheck="false">
		</td>
		<powersi:codeselect id="bka035" name="diagnoseInfoDTO.bka035_name" key="��Ա���"
			headerKey="0" headerValue="" codeType="bka035" disabled="true"/>
	    <powersi:hidden id="bka035" name="diagnoseInfoDTO.bka035" />
		<powersi:codeselect id="aac004" name="diagnoseInfoDTO.aac004_name" key="�Ա�"
			headerKey="0" headerValue="" codeType="aac004" disabled="true" />
		<powersi:hidden id="aac004" name="diagnoseInfoDTO.aac004" />
		<powersi:textfield id="aac006" name="diagnoseInfoDTO.aac006" key="��������"
			readonly="true" />
	</tr>
	<tr>
		<powersi:textfield id="baa027_name" name="diagnoseInfoDTO.baa027_name" key="��������"
			readonly="true"/>
		<powersi:hidden id="baa027" name="diagnoseInfoDTO.baa027" />
		<powersi:codeselect id="bac001" name="diagnoseInfoDTO.bac001" key="����Ա����"
			headerKey="0" headerValue="" codeType="bac001" disabled="true" />
		<powersi:hidden id="bac001" name="diagnoseInfoDTO.bac001" />
		<powersi:textfield id="bka888" key="���𶳽����" name="diagnoseInfoDTO.bka888"
			readonly="true"/>
		<powersi:textfield id="aac001" name="diagnoseInfoDTO.aac001" key="���Ժ�" 
			readonly="true" value=""/>	
	</tr>
	<tr>
		<powersi:codeselect id="bka006" name="diagnoseInfoDTO.bka006" key="��������" 
			codeType="bka006" codeFilter="<%=bka006Filter%>" codeLocal="<%=aaa027%>" 
			disabled="true" />
		
		<powersi:textfield id="aae030" name="diagnoseInfoDTO.aae030" key="��������" 
			mask="date" onKeyDown="keyDown(this)" readonly="true" />
		<powersi:textfield id="aaz217" name="diagnoseInfoDTO.aaz217" key="��ҽ�ǼǺ�"
			readonly="true" />
		<powersi:textfield id="aae005" name="diagnoseInfoDTO.aae005" key="��ϵ�绰"
			readonly="true" />
	</tr>
	<tr>
		<powersi:textfield id="bkz101" name="diagnoseInfoDTO.bkz101" key="�������" 
			buttonText="..." buttonId="disinse" onKeyDown="keyDown(this)" value="��ͨ����" 
			required="true" readonly="true" onbuttonclick="chooseDis('bka026')" />
	    <powersi:codeselect id="akf001" name="diagnoseInfoDTO.akf001" key="����" 
			cssClass="select2" list="#request.bka019List"
			headerKey="" headerValue="��ѡ��..." showValue="true"
			onchange="selectbka021()" />
		<powersi:codeselect id="bka021" name="diagnoseInfoDTO.bka021" key="����" 
			cssClass="select2" list="#request.bka021List"
			headerKey="" headerValue="��ѡ��..." showValue="true" 
			onchange="selectbka503()" />
		<powersi:codeselect id="ake022" name="diagnoseInfoDTO.ake022" key="ҽ��ҽʦ" 
			cssClass="select2" list="#request.bka503List" showValue="true" 
			headerKey="" headerValue="��ѡ��..." /> 
	</tr>
	<powersi:hidden id="aab019" name="diagnoseInfoDTO.aab019" />
	<powersi:hidden id="aab001" name="diagnoseInfoDTO.aab001" key="��λ���Ժ�" />
	<powersi:hidden id="aaz267" name="diagnoseInfoDTO.aaz267" key="ѡ�����к�" />
	<powersi:hidden id="aka130" name="diagnoseInfoDTO.aka130" value="11" />
	<powersi:hidden id="bka006" name="diagnoseInfoDTO.bka006" value="110" />
	<powersi:hidden id="aae140" name="diagnoseInfoDTO.aae140" key="����" />
	<powersi:hidden id="bka001" name="diagnoseInfoDTO.bka001" key="��������" />
	<powersi:hidden id="bka039" name="diagnoseInfoDTO.bka039" key="������" />
	<powersi:hidden id="akc193" name="diagnoseInfoDTO.akc193" value="00000"/>
	<powersi:hidden id="bka022" name="diagnoseInfoDTO.bka022" key="��������" />
	<powersi:hidden id="bka020" name="diagnoseInfoDTO.bka020" key="��������" />
	<powersi:hidden id="bka016" name="diagnoseInfoDTO.bka016" />
	<powersi:hidden id="bka011" name="diagnoseInfoDTO.bka011" />
	<powersi:hidden id="bka012" name="diagnoseInfoDTO.bka012" />
	<powersi:hidden id="kc21id" name="diagnoseInfoDTO.kc21id" key="����" />
</powersi:editorlayout>