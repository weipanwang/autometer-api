webpackJsonp([28],{"5Vty":function(e,t,a){"use strict";t.d=function(e){return Object(i.a)({url:"/apicases/variables/search",method:"post",data:e})},t.b=function(e){return Object(i.a)({url:"/apicases/variables/getbyvariablesid",method:"post",data:e})},t.a=function(e){return Object(i.a)({url:"/apicases/variables",method:"post",data:e})},t.e=function(e){return Object(i.a)({url:"/apicases/variables/detail",method:"put",data:e})},t.c=function(e){return Object(i.a)({url:"/apicases/variables/"+e,method:"delete"})};var i=a("vLgD")},pid6:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i=a("Dd8w"),s=a.n(i),l=a("Xw19"),r=a("5Vty"),n=a("XcM5"),o=a("W+bg"),p=a("2d0t"),c=a("0xDb"),d=a("NYxO"),u={name:"接口变量",filters:{statusFilter:function(e){return{published:"success",draft:"gray",deleted:"danger"}[e]}},data:function(){return{expressname:"变量值提取表达",id:null,itemKey:null,tmptestvariablesname:"",apiList:[],caseList:[],deployunitList:[],testvariablesList:[],ApicasesVariablesList:[],listLoading:!1,total:0,dialogStatus:"add",BinddialogStatus:"add",dialogFormVisible:!1,BindVariablesDialogVisible:!1,BindFormVisible:!1,textMap:{updateRole:"修改接口变量",update:"修改接口变量",add:"添加接口变量"},BindtextMap:{updateRole:"修改绑定接口",update:"修改绑定接口",add:"添加绑定接口"},apiquery:{casedeployunitname:"",caseapiname:"",apiid:"",deployunitid:""},deployunitQuery:{deployunitid:"",modelid:0,deployunitname:""},VariablescaseQuery:{variablesid:""},btnLoading:!1,tmptestvariables:{id:"",testvariablesname:"",variablesdes:"",valuetype:"",testvariablestype:"",variablesexpress:"",memo:"",creator:"",projectid:""},tmpApicasesVariables:{id:"",apiid:"",caseid:"",deployunitid:"",deployunitname:"",apiname:"",casename:"",variablesid:"",variablesname:"",memo:"",creator:""},search:{page:1,size:10,testvariablesname:null,projectid:""}}},created:function(){this.search.projectid=window.localStorage.getItem("pid"),this.gettestvariablesList(),this.getdepunitLists()},computed:s()({},Object(d.b)(["name","sidebar","projectlist","projectid"])),methods:{unix2CurrentTime:c.b,testvariablestypeselectChanged:function(e){this.expressname="Body"===e?"变量值提取表达":"Key名"},gettestvariablesList:function(){var e=this;this.listLoading=!0,this.search.testvariablesname=this.tmptestvariablesname,Object(l.e)(this.search).then(function(t){e.testvariablesList=t.data.list,e.total=t.data.total,e.listLoading=!1}).catch(function(t){e.$message.error("加载变量列表失败")})},getbyvariablesid:function(){var e=this;Object(r.b)(this.VariablescaseQuery).then(function(t){e.ApicasesVariablesList=t.data}).catch(function(t){e.$message.error("加载变量列表失败")})},getdepunitLists:function(){var e=this;this.listLoading=!0,Object(n.e)(this.search).then(function(t){e.deployunitList=t.data,e.listLoading=!1}).catch(function(t){e.$message.error("加载微服务列表失败")})},deployunitselectChanged:function(e){for(var t=this,a=0;a<this.deployunitList.length;a++)this.deployunitList[a].deployunitname===e&&(this.tmpApicasesVariables.deployunitid=this.deployunitList[a].id,this.deployunitQuery.deployunitid=this.deployunitList[a].id,this.apiquery.deployunitid=this.deployunitList[a].id);this.tmpApicasesVariables.apiname="",this.tmpApicasesVariables.casename="",this.deployunitQuery.deployunitname=e,Object(o.d)(this.deployunitQuery).then(function(e){t.apiList=e.data}).catch(function(e){t.$message.error("加载api列表失败")})},apiselectChanged:function(e){for(var t=this,a=0;a<this.apiList.length;a++)this.apiList[a].apiname===e&&(this.tmpApicasesVariables.apiid=this.apiList[a].id,this.apiquery.apiid=this.apiList[a].id);this.tmpApicasesVariables.casename="",this.apiquery.caseapiname=e,this.apiquery.casedeployunitname=this.tmpApicasesVariables.deployunitname,Object(p.d)(this.apiquery).then(function(e){t.caseList=e.data}).catch(function(e){t.$message.error("加载apicase列表失败")})},testcaseselectChanged:function(e){for(var t=0;t<this.caseList.length;t++)this.caseList[t].casename===e&&(this.tmpApicasesVariables.caseid=this.caseList[t].id)},searchBy:function(){var e=this;this.search.page=1,this.listLoading=!0,Object(l.e)(this.search).then(function(t){e.itemKey=Math.random(),e.testvariablesList=t.data.list,e.total=t.data.total}).catch(function(t){e.$message.error("搜索失败")}),this.tmptestvariablesname=this.search.testvariablesname,this.listLoading=!1,this.btnLoading=!1},handleSizeChange:function(e){this.search.page=1,this.search.size=e,this.gettestvariablesList()},handleCurrentChange:function(e){this.search.page=e,this.gettestvariablesList()},getIndex:function(e){return(this.search.page-1)*this.search.size+e+1},showApicasesVariablesDialog:function(e){this.BindVariablesDialogVisible=!0,this.VariablescaseQuery.variablesid=this.testvariablesList[e].id,this.tmpApicasesVariables.variablesid=this.testvariablesList[e].id,this.tmpApicasesVariables.variablesname=this.testvariablesList[e].testvariablesname,this.getbyvariablesid()},showAddApicasesVariablesDialog:function(e){this.BindFormVisible=!0,this.BinddialogStatus="add",this.tmpApicasesVariables.id="",this.tmpApicasesVariables.caseid="",this.tmpApicasesVariables.deployunitname="",this.tmpApicasesVariables.apiname="",this.tmpApicasesVariables.casename="",this.tmpApicasesVariables.memo="",this.tmpApicasesVariables.creator=this.name},showAddtestvariablesDialog:function(){this.dialogFormVisible=!0,this.dialogStatus="add",this.tmptestvariables.id="",this.tmptestvariables.testvariablesname="",this.tmptestvariables.variablesdes="",this.tmptestvariables.testvariablestype="",this.tmptestvariables.variablesexpress="",this.tmptestvariables.memo="",this.tmptestvariables.valuetype="",this.tmptestvariables.tmptestvariables="",this.tmptestvariables.creator=this.name,this.tmptestvariables.projectid=window.localStorage.getItem("pid")},addtestvariables:function(){var e=this;this.$refs.tmptestvariables.validate(function(t){t&&(e.btnLoading=!0,Object(l.a)(e.tmptestvariables).then(function(){e.$message.success("添加成功"),e.gettestvariablesList(),e.dialogFormVisible=!1,e.btnLoading=!1}).catch(function(t){e.$message.error("添加失败"),e.btnLoading=!1}))})},addApicasesVariables:function(){var e=this;this.$refs.tmpApicasesVariables.validate(function(t){t&&Object(r.a)(e.tmpApicasesVariables).then(function(){e.$message.success("添加成功"),e.BindFormVisible=!1,e.getbyvariablesid()}).catch(function(t){e.$message.error("添加失败"),e.btnLoading=!1})})},showUpdateApicasesVariablesDialog:function(e){var t=this;this.BindFormVisible=!0,this.BinddialogStatus="update",this.tmpApicasesVariables.id=this.ApicasesVariablesList[e].id,this.tmpApicasesVariables.caseid=this.ApicasesVariablesList[e].caseid,this.tmpApicasesVariables.variablesid=this.VariablescaseQuery.variablesid,this.tmpApicasesVariables.deployunitname=this.ApicasesVariablesList[e].deployunitname,this.tmpApicasesVariables.deployunitid=this.ApicasesVariablesList[e].deployunitid,this.tmpApicasesVariables.apiid=this.ApicasesVariablesList[e].apiid,this.deployunitQuery.deployunitname=this.tmpApicasesVariables.deployunitname,this.deployunitQuery.deployunitid=this.ApicasesVariablesList[e].deployunitid,Object(o.d)(this.deployunitQuery).then(function(e){t.apiList=e.data}).catch(function(e){t.$message.error("加载api列表失败")}),this.tmpApicasesVariables.apiname=this.ApicasesVariablesList[e].apiname,this.apiquery.caseapiname=this.tmpApicasesVariables.apiname,this.apiquery.casedeployunitname=this.tmpApicasesVariables.deployunitname,this.apiquery.deployunitid=this.deployunitQuery.deployunitid,this.apiquery.apiid=this.ApicasesVariablesList[e].apiid,Object(p.d)(this.apiquery).then(function(e){t.caseList=e.data}).catch(function(e){t.$message.error("加载apicase列表失败")}),this.tmpApicasesVariables.casename=this.ApicasesVariablesList[e].casename,this.tmpApicasesVariables.variablesname=this.ApicasesVariablesList[e].variablesname,this.tmpApicasesVariables.memo=this.ApicasesVariablesList[e].memo,this.tmpApicasesVariables.creator=this.name},updateApicasesVariables:function(){var e=this;this.$refs.tmpApicasesVariables.validate(function(t){t&&Object(r.e)(e.tmpApicasesVariables).then(function(){e.$message.success("更新成功"),e.getbyvariablesid(),e.BindFormVisible=!1}).catch(function(t){e.$message.error("更新失败")})})},showUpdatetestvariablesDialog:function(e){this.dialogFormVisible=!0,this.dialogStatus="update",this.tmptestvariables.id=this.testvariablesList[e].id,this.tmptestvariables.testvariablesname=this.testvariablesList[e].testvariablesname,this.tmptestvariables.variablesdes=this.testvariablesList[e].variablesdes,this.tmptestvariables.testvariablestype=this.testvariablesList[e].testvariablestype,this.tmptestvariables.variablesexpress=this.testvariablesList[e].variablesexpress,this.tmptestvariables.tmptestvariables=this.testvariablesList[e].tmptestvariables,this.tmptestvariables.valuetype=this.testvariablesList[e].valuetype,this.tmptestvariables.memo=this.testvariablesList[e].memo,this.tmptestvariables.creator=this.name},updatetestvariables:function(){var e=this;this.$refs.tmptestvariables.validate(function(t){t&&Object(l.f)(e.tmptestvariables).then(function(){e.$message.success("更新成功"),e.gettestvariablesList(),e.dialogFormVisible=!1}).catch(function(t){e.$message.error("更新失败")})})},removeApicasesVariables:function(e){var t=this;this.$confirm("删除该接口绑定？","警告",{confirmButtonText:"是",cancelButtonText:"否",type:"warning"}).then(function(){var a=t.ApicasesVariablesList[e].id;Object(r.c)(a).then(function(){t.$message.success("删除成功"),t.getbyvariablesid()})}).catch(function(){t.$message.info("已取消删除")})},removetestvariables:function(e){var t=this;this.$confirm("删除该变量？","警告",{confirmButtonText:"是",cancelButtonText:"否",type:"warning"}).then(function(){var a=t.testvariablesList[e].id;Object(l.d)(a).then(function(){t.$message.success("删除成功"),t.gettestvariablesList()})}).catch(function(){t.$message.info("已取消删除")})},isUniqueDetail:function(e){for(var t=0;t<this.testvariablesList.length;t++)if(this.testvariablesList[t].id!==e.id&&this.testvariablesList[t].testvariablesname===e.testvariablesname)return this.$message.error("变量名已存在"),!1;return!0}}},b={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"app-container"},[a("div",{staticClass:"filter-container"},[a("el-form",{attrs:{inline:!0}},[a("el-form-item",[e.hasPermission("testvariables:list")?a("el-button",{attrs:{type:"success",size:"mini",icon:"el-icon-refresh"},nativeOn:{click:function(t){return t.preventDefault(),e.gettestvariablesList(t)}}},[e._v("刷新")]):e._e(),e._v(" "),e.hasPermission("testvariables:add")?a("el-button",{attrs:{type:"primary",size:"mini",icon:"el-icon-plus"},nativeOn:{click:function(t){return t.preventDefault(),e.showAddtestvariablesDialog(t)}}},[e._v("添加接口变量")]):e._e()],1),e._v(" "),e.hasPermission("testvariables:search")?a("span",[a("el-form-item",[a("el-input",{attrs:{clearable:"",maxlength:"40",placeholder:"变量名"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.searchBy(t)}},model:{value:e.search.testvariablesname,callback:function(t){e.$set(e.search,"testvariablesname",t)},expression:"search.testvariablesname"}})],1),e._v(" "),a("el-form-item",[a("el-button",{attrs:{type:"primary",loading:e.btnLoading},on:{click:e.searchBy}},[e._v("查询")])],1)],1):e._e()],1)],1),e._v(" "),a("el-table",{directives:[{name:"loading",rawName:"v-loading.body",value:e.listLoading,expression:"listLoading",modifiers:{body:!0}}],key:e.itemKey,attrs:{data:e.testvariablesList,"element-loading-text":"loading",border:"",fit:"","highlight-current-row":""}},[a("el-table-column",{attrs:{label:"编号",align:"center",width:"60"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("span",{domProps:{textContent:e._s(e.getIndex(t.$index))}})]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"变量名",align:"center",prop:"testvariablesname",width:"80"}}),e._v(" "),a("el-table-column",{attrs:{"show-overflow-tooltip":!0,label:"变量描述",align:"center",prop:"variablesdes",width:"150"}}),e._v(" "),a("el-table-column",{attrs:{label:"变量来源",align:"center",prop:"testvariablestype",width:"80"}}),e._v(" "),a("el-table-column",{attrs:{label:"变量值类型",align:"center",prop:"valuetype",width:"90"}}),e._v(" "),a("el-table-column",{attrs:{label:"变量值提取表达",align:"center",prop:"variablesexpress",width:"120"}}),e._v(" "),a("el-table-column",{attrs:{"show-overflow-tooltip":!0,label:"备注",align:"center",prop:"memo",width:"100"}}),e._v(" "),a("el-table-column",{attrs:{label:"操作人",align:"center",prop:"creator",width:"80"}}),e._v(" "),a("el-table-column",{attrs:{label:"创建时间",align:"center",prop:"createTime",width:"140"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e.unix2CurrentTime(t.row.createTime)))]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"最后修改时间",align:"center",prop:"lastmodifyTime",width:"140"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e.unix2CurrentTime(t.row.lastmodifyTime))+"\n      ")]}}])}),e._v(" "),e.hasPermission("testvariables:update")||e.hasPermission("testvariables:delete")?a("el-table-column",{attrs:{label:"管理",align:"center",width:"240"},scopedSlots:e._u([{key:"default",fn:function(t){return[e.hasPermission("testvariables:update")&&t.row.id!==e.id?a("el-button",{attrs:{type:"warning",size:"mini"},nativeOn:{click:function(a){return a.preventDefault(),e.showUpdatetestvariablesDialog(t.$index)}}},[e._v("修改")]):e._e(),e._v(" "),e.hasPermission("testvariables:delete")&&t.row.id!==e.id?a("el-button",{attrs:{type:"danger",size:"mini"},nativeOn:{click:function(a){return a.preventDefault(),e.removetestvariables(t.$index)}}},[e._v("删除")]):e._e(),e._v(" "),e.hasPermission("testvariables:update")&&t.row.id!==e.id?a("el-button",{attrs:{type:"primary",size:"mini"},nativeOn:{click:function(a){return a.preventDefault(),e.showApicasesVariablesDialog(t.$index)}}},[e._v("绑定接口")]):e._e()]}}],null,!1,1969092356)}):e._e()],1),e._v(" "),a("el-pagination",{attrs:{"current-page":e.search.page,"page-size":e.search.size,total:e.total,"page-sizes":[10,20,30,40],layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":e.handleSizeChange,"current-change":e.handleCurrentChange}}),e._v(" "),a("el-dialog",{attrs:{title:e.textMap[e.dialogStatus],visible:e.dialogFormVisible},on:{"update:visible":function(t){e.dialogFormVisible=t}}},[a("el-form",{ref:"tmptestvariables",staticClass:"small-space",staticStyle:{width:"500px","margin-left":"50px"},attrs:{"status-icon":"","label-position":"left","label-width":"120px",model:e.tmptestvariables}},[a("el-form-item",{attrs:{label:"变量名",prop:"testvariablesname",required:""}},[a("el-input",{attrs:{maxlength:"50",type:"text","prefix-icon":"el-icon-edit","auto-complete":"off"},model:{value:e.tmptestvariables.testvariablesname,callback:function(t){e.$set(e.tmptestvariables,"testvariablesname",t)},expression:"tmptestvariables.testvariablesname"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"变量描述",prop:"variablesdes",required:""}},[a("el-input",{attrs:{maxlength:"20",type:"text","prefix-icon":"el-icon-edit","auto-complete":"off"},model:{value:e.tmptestvariables.variablesdes,callback:function(t){e.$set(e.tmptestvariables,"variablesdes",t)},expression:"tmptestvariables.variablesdes"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"变量来源",prop:"testvariablestype",required:""}},[a("el-select",{staticStyle:{width:"100%"},attrs:{placeholder:"变量来源"},on:{change:function(t){return e.testvariablestypeselectChanged(t)}},model:{value:e.tmptestvariables.testvariablestype,callback:function(t){e.$set(e.tmptestvariables,"testvariablestype",t)},expression:"tmptestvariables.testvariablestype"}},[a("el-option",{attrs:{label:"Header",value:"Header"}}),e._v(" "),a("el-option",{attrs:{label:"Cookies",value:"Cookies"}}),e._v(" "),a("el-option",{attrs:{label:"Body",value:"Body"}})],1)],1),e._v(" "),a("el-form-item",{attrs:{label:"变量值类型",prop:"valuetype",required:""}},[a("el-select",{staticStyle:{width:"100%"},attrs:{placeholder:"变量值类型"},model:{value:e.tmptestvariables.valuetype,callback:function(t){e.$set(e.tmptestvariables,"valuetype",t)},expression:"tmptestvariables.valuetype"}},[a("el-option",{attrs:{label:"Number",value:"Number"}}),e._v(" "),a("el-option",{attrs:{label:"String",value:"String"}}),e._v(" "),a("el-option",{attrs:{label:"Array",value:"Array"}}),e._v(" "),a("el-option",{attrs:{label:"Bool",value:"Bool"}})],1)],1),e._v(" "),a("el-form-item",{attrs:{label:e.expressname,prop:"variablesexpress",required:""}},[a("el-input",{attrs:{type:"textarea",rows:"3",cols:"10",maxlength:"200",placeholder:"例如 $.store.book[0].title","prefix-icon":"el-icon-edit","auto-complete":"off"},model:{value:e.tmptestvariables.variablesexpress,callback:function(t){e.$set(e.tmptestvariables,"variablesexpress",t)},expression:"tmptestvariables.variablesexpress"}}),e._v(" "),a("div",{staticClass:"right"},[a("el-tooltip",{attrs:{placement:"right-start"}},[a("div",{attrs:{slot:"content"},slot:"content"},[e._v("1.如果获取变量值的接口返回数据类型是Json则使用JsonPath表达式提取变量值，例如：$.store.book[0].title   在线解析网站：http://www.e123456.com/aaaphp/online/jsonpath/"),a("br"),e._v("2.如果获取变量值接口返回是html，xml则使用XPath表达式提取变量值， 例如：//div/h3//text()   在线解析网站： http://www.ab173.com/other/xpath.php")]),e._v(" "),a("el-button",[e._v("变量值提取表达语法规则")])],1)],1)],1),e._v(" "),a("el-form-item",{attrs:{label:"备注",prop:"memo"}},[a("el-input",{attrs:{type:"text",maxlength:"60","prefix-icon":"el-icon-message","auto-complete":"off"},model:{value:e.tmptestvariables.memo,callback:function(t){e.$set(e.tmptestvariables,"memo",t)},expression:"tmptestvariables.memo"}})],1)],1),e._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{nativeOn:{click:function(t){t.preventDefault(),e.dialogFormVisible=!1}}},[e._v("取消")]),e._v(" "),"add"===e.dialogStatus?a("el-button",{attrs:{type:"danger"},nativeOn:{click:function(t){return t.preventDefault(),e.$refs.tmptestvariables.resetFields()}}},[e._v("重置")]):e._e(),e._v(" "),"add"===e.dialogStatus?a("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(t){return t.preventDefault(),e.addtestvariables(t)}}},[e._v("添加")]):e._e(),e._v(" "),"update"===e.dialogStatus?a("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(t){return t.preventDefault(),e.updatetestvariables(t)}}},[e._v("修改")]):e._e()],1)],1),e._v(" "),a("el-dialog",{attrs:{title:e.BindtextMap[e.BinddialogStatus],visible:e.BindFormVisible},on:{"update:visible":function(t){e.BindFormVisible=t}}},[a("el-form",{ref:"tmpApicasesVariables",staticClass:"small-space",staticStyle:{width:"450px","margin-left":"50px"},attrs:{"status-icon":"","label-position":"left","label-width":"120px",model:e.tmpApicasesVariables}},[a("el-form-item",{attrs:{label:"微服务",prop:"deployunitname",required:""}},[a("el-select",{staticStyle:{width:"100%"},attrs:{filterable:"",placeholder:"微服务"},on:{change:function(t){return e.deployunitselectChanged(t)}},model:{value:e.tmpApicasesVariables.deployunitname,callback:function(t){e.$set(e.tmpApicasesVariables,"deployunitname",t)},expression:"tmpApicasesVariables.deployunitname"}},[a("el-option",{staticStyle:{display:"none"},attrs:{label:"请选择",value:"''"}}),e._v(" "),e._l(e.deployunitList,function(e,t){return a("div",{key:t},[a("el-option",{attrs:{label:e.deployunitname,value:e.deployunitname,required:""}})],1)})],2)],1),e._v(" "),a("el-form-item",{attrs:{label:"API",prop:"apiname",required:""}},[a("el-select",{staticStyle:{width:"100%"},attrs:{filterable:"",placeholder:"API"},on:{change:function(t){return e.apiselectChanged(t)}},model:{value:e.tmpApicasesVariables.apiname,callback:function(t){e.$set(e.tmpApicasesVariables,"apiname",t)},expression:"tmpApicasesVariables.apiname"}},[a("el-option",{staticStyle:{display:"none"},attrs:{label:"请选择",value:"''"}}),e._v(" "),e._l(e.apiList,function(e,t){return a("div",{key:t},[a("el-option",{attrs:{label:e.apiname,value:e.apiname}})],1)})],2)],1),e._v(" "),a("el-form-item",{attrs:{label:"绑定接口",prop:"casename",required:""}},[a("el-select",{staticStyle:{width:"100%"},attrs:{filterable:"",placeholder:"绑定接口"},on:{change:function(t){return e.testcaseselectChanged(t)}},model:{value:e.tmpApicasesVariables.casename,callback:function(t){e.$set(e.tmpApicasesVariables,"casename",t)},expression:"tmpApicasesVariables.casename"}},[a("el-option",{staticStyle:{display:"none"},attrs:{label:"请选择",value:"''"}}),e._v(" "),e._l(e.caseList,function(e,t){return a("div",{key:t},[a("el-option",{attrs:{label:e.casename,value:e.casename,required:""}})],1)})],2)],1),e._v(" "),a("el-form-item",{attrs:{label:"备注",prop:"memo"}},[a("el-input",{attrs:{type:"text","prefix-icon":"el-icon-message","auto-complete":"off"},model:{value:e.tmpApicasesVariables.memo,callback:function(t){e.$set(e.tmpApicasesVariables,"memo",t)},expression:"tmpApicasesVariables.memo"}})],1)],1),e._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{nativeOn:{click:function(t){t.preventDefault(),e.BindFormVisible=!1}}},[e._v("取消")]),e._v(" "),"add"===e.BinddialogStatus?a("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(t){return t.preventDefault(),e.addApicasesVariables(t)}}},[e._v("保存")]):e._e(),e._v(" "),"update"===e.BinddialogStatus?a("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(t){return t.preventDefault(),e.updateApicasesVariables(t)}}},[e._v("修改")]):e._e()],1)],1),e._v(" "),a("el-dialog",{attrs:{title:"绑定接口",visible:e.BindVariablesDialogVisible},on:{"update:visible":function(t){e.BindVariablesDialogVisible=t}}},[a("div",{staticClass:"filter-container"},[a("el-form",{attrs:{inline:!0}},[a("el-form-item",[e.hasPermission("ApicasesVariables:add")?a("el-button",{attrs:{type:"primary",size:"mini",icon:"el-icon-plus"},nativeOn:{click:function(t){return t.preventDefault(),e.showAddApicasesVariablesDialog(t)}}},[e._v("绑定接口")]):e._e()],1)],1)],1),e._v(" "),a("el-table",{directives:[{name:"loading",rawName:"v-loading.body",value:e.listLoading,expression:"listLoading",modifiers:{body:!0}}],key:e.itemKey,attrs:{data:e.ApicasesVariablesList,"element-loading-text":"loading",border:"",fit:"","highlight-current-row":""}},[a("el-table-column",{attrs:{label:"编号",align:"center",width:"60"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("span",{domProps:{textContent:e._s(e.getIndex(t.$index))}})]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"绑定接口名",align:"center",prop:"casename",width:"180"}}),e._v(" "),a("el-table-column",{attrs:{label:"创建时间",align:"center",prop:"createTime",width:"140"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e.unix2CurrentTime(t.row.createTime)))]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"最后修改时间",align:"center",prop:"lastmodifyTime",width:"140"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e.unix2CurrentTime(t.row.lastmodifyTime))+"\n        ")]}}])}),e._v(" "),e.hasPermission("ApicasesVariables:update")||e.hasPermission("ApicasesVariables:delete")?a("el-table-column",{attrs:{label:"管理",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[e.hasPermission("ApicasesVariables:update")&&t.row.id!==e.id?a("el-button",{attrs:{type:"warning",size:"mini"},nativeOn:{click:function(a){return a.preventDefault(),e.showUpdateApicasesVariablesDialog(t.$index)}}},[e._v("修改")]):e._e(),e._v(" "),e.hasPermission("ApicasesVariables:delete")&&t.row.id!==e.id?a("el-button",{attrs:{type:"danger",size:"mini"},nativeOn:{click:function(a){return a.preventDefault(),e.removeApicasesVariables(t.$index)}}},[e._v("删除")]):e._e()]}}],null,!1,591169350)}):e._e()],1)],1)],1)},staticRenderFns:[]},m=a("VU/8")(u,b,!1,null,null,null);t.default=m.exports}});
//# sourceMappingURL=28.449b9b620ddf2f0438bb.js.map