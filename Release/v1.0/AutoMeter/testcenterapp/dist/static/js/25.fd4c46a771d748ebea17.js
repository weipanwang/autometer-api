webpackJsonp([25],{WOQ5:function(e,i,t){"use strict";Object.defineProperty(i,"__esModule",{value:!0});var a=t("Dd8w"),s=t.n(a),n=t("JGZL"),l=t("Y48K"),o=t("XcM5"),r=t("2d0t"),d=t("0xDb"),b=t("NYxO"),c=t("5kbS"),m={name:"数据库变量",filters:{statusFilter:function(e){return{published:"success",draft:"gray",deleted:"danger"}[e]}},data:function(){return{id:null,itemKey:null,tmpdbvariablesname:"",apiList:[],caseList:[],deployunitList:[],dbvariablesList:[],DbconditionList:[],DbconditionVariablesList:[],listLoading:!1,total:0,dialogStatus:"add",BinddialogStatus:"add",dialogFormVisible:!1,BindVariablesDialogVisible:!1,BindFormVisible:!1,textMap:{updateRole:"修改数据库变量",update:"修改数据库变量",add:"添加数据库变量"},BindtextMap:{updateRole:"修改绑定数据库条件",update:"修改绑定数据库条件",add:"添加绑定数据库条件"},apiquery:{casedeployunitname:"",caseapiname:""},deployunitQuery:{deployunitname:""},VariablescaseQuery:{variablesid:""},btnLoading:!1,tmpdbvariables:{id:"",dbvariablesname:"",variablesdes:"",valuetype:"",memo:"",creator:"",projectid:""},tmpDbConditionVariables:{id:"",dbconditionname:"",dbconditionid:"",variablesid:"",variablesname:"",fieldname:"",roworder:"",memo:""},search:{page:1,size:10,dbvariablesname:null,projectid:""}}},created:function(){this.search.projectid=window.localStorage.getItem("pid"),this.getdbvariablesList(),this.getdepunitLists()},computed:s()({},Object(b.b)(["name","sidebar","projectlist","projectid"])),methods:{unix2CurrentTime:d.b,getdbvariablesList:function(){var e=this;this.listLoading=!0,this.search.dbvariablesname=this.tmpdbvariablesname,Object(n.c)(this.search).then(function(i){e.dbvariablesList=i.data.list,e.total=i.data.total,e.listLoading=!1}).catch(function(i){e.$message.error("加载变量列表失败")})},getbyvariablesid:function(){var e=this;Object(l.b)(this.VariablescaseQuery).then(function(i){e.DbconditionVariablesList=i.data}).catch(function(i){e.$message.error("加载变量列表失败")})},listalldbcondition:function(){var e=this;Object(c.b)(this.search).then(function(i){e.DbconditionList=i.data}).catch(function(i){e.$message.error("加载数据库条件失败")})},getdepunitLists:function(){var e=this;this.listLoading=!0,Object(o.e)(this.search).then(function(i){e.deployunitList=i.data.list,e.listLoading=!1}).catch(function(i){e.$message.error("加载微服务列表失败")})},dbconditionselectChanged:function(e){for(var i=0;i<this.DbconditionList.length;i++)this.DbconditionList[i].subconditionname===e&&(this.tmpDbConditionVariables.dbconditionid=this.DbconditionList[i].id,console.log(this.tmpDbConditionVariables.dbconditionid))},apiselectChanged:function(e){for(var i=this,t=0;t<this.apiList.length;t++)this.apiList[t].apiname===e&&(this.tmpApicasesVariables.apiid=this.apiList[t].id);this.tmpApicasesVariables.casename="",this.apiquery.caseapiname=e,this.apiquery.casedeployunitname=this.tmpApicasesVariables.deployunitname,Object(r.d)(this.apiquery).then(function(e){i.caseList=e.data}).catch(function(e){i.$message.error("加载apicase列表失败")})},testcaseselectChanged:function(e){for(var i=0;i<this.caseList.length;i++)this.caseList[i].casename===e&&(this.tmpApicasesVariables.caseid=this.caseList[i].id)},searchBy:function(){var e=this;this.search.page=1,this.listLoading=!0,Object(n.c)(this.search).then(function(i){e.itemKey=Math.random(),e.dbvariablesList=i.data.list,e.total=i.data.total}).catch(function(i){e.$message.error("搜索失败")}),this.tmpdbvariablesname=this.search.dbvariablesname,this.listLoading=!1,this.btnLoading=!1},handleSizeChange:function(e){this.search.page=1,this.search.size=e,this.getdbvariablesList()},handleCurrentChange:function(e){this.search.page=e,this.getdbvariablesList()},getIndex:function(e){return(this.search.page-1)*this.search.size+e+1},showDbconditionVariablesDialog:function(e){this.listalldbcondition(),this.BindVariablesDialogVisible=!0,this.VariablescaseQuery.variablesid=this.dbvariablesList[e].id,this.tmpDbConditionVariables.variablesid=this.dbvariablesList[e].id,this.tmpDbConditionVariables.variablesname=this.dbvariablesList[e].dbvariablesname,this.getbyvariablesid()},showAddConditionVariablesDialog:function(e){this.BindFormVisible=!0,this.BinddialogStatus="add",this.tmpDbConditionVariables.id="",this.tmpDbConditionVariables.dbconditionname="",this.tmpDbConditionVariables.fieldname="",this.tmpDbConditionVariables.roworder="",this.tmpDbConditionVariables.memo="",this.tmpDbConditionVariables.creator=this.name},showAdddbvariablesDialog:function(){this.dialogFormVisible=!0,this.dialogStatus="add",this.tmpdbvariables.id="",this.tmpdbvariables.dbvariablesname="",this.tmpdbvariables.variablesdes="",this.tmpdbvariables.dbvariablestype="",this.tmpdbvariables.variablesexpress="",this.tmpdbvariables.memo="",this.tmpdbvariables.valuetype="",this.tmpdbvariables.tmpdbvariables="",this.tmpdbvariables.creator=this.name,this.tmpdbvariables.projectid=window.localStorage.getItem("pid")},adddbvariables:function(){var e=this;this.$refs.tmpdbvariables.validate(function(i){i&&(e.btnLoading=!0,Object(n.a)(e.tmpdbvariables).then(function(){e.$message.success("添加成功"),e.getdbvariablesList(),e.dialogFormVisible=!1,e.btnLoading=!1}).catch(function(i){e.$message.error("添加失败"),e.btnLoading=!1}))})},addDBConditionVariables:function(){var e=this;this.$refs.tmpDbConditionVariables.validate(function(i){i&&Object(l.a)(e.tmpDbConditionVariables).then(function(){e.$message.success("添加成功"),e.BindFormVisible=!1,e.getbyvariablesid()}).catch(function(i){e.$message.error("添加失败"),e.btnLoading=!1})})},showUpdateDBCconditionVariablesDialog:function(e){this.BindFormVisible=!0,this.BinddialogStatus="update",this.tmpDbConditionVariables.id=this.DbconditionVariablesList[e].id,this.tmpDbConditionVariables.fieldname=this.DbconditionVariablesList[e].fieldname,this.tmpDbConditionVariables.roworder=this.DbconditionVariablesList[e].roworder,this.tmpDbConditionVariables.dbconditionname=this.DbconditionVariablesList[e].dbconditionname;for(var i=0;i<this.DbconditionList.length;i++)this.DbconditionList[i].subconditionname===this.tmpDbConditionVariables.dbconditionname&&(this.tmpDbConditionVariables.dbconditionid=this.DbconditionList[i].id,console.log(this.tmpDbConditionVariables.dbconditionid));this.tmpDbConditionVariables.memo=this.DbconditionVariablesList[e].memo},updateDBConditionVariables:function(){var e=this;this.$refs.tmpDbConditionVariables.validate(function(i){i&&Object(l.d)(e.tmpDbConditionVariables).then(function(){e.$message.success("更新成功"),e.getbyvariablesid(),e.BindFormVisible=!1}).catch(function(i){e.$message.error("更新失败")})})},showUpdatedbvariablesDialog:function(e){this.dialogFormVisible=!0,this.dialogStatus="update",this.tmpdbvariables.id=this.dbvariablesList[e].id,this.tmpdbvariables.dbvariablesname=this.dbvariablesList[e].dbvariablesname,this.tmpdbvariables.variablesdes=this.dbvariablesList[e].variablesdes,this.tmpdbvariables.dbvariablestype=this.dbvariablesList[e].dbvariablestype,this.tmpdbvariables.variablesexpress=this.dbvariablesList[e].variablesexpress,this.tmpdbvariables.tmpdbvariables=this.dbvariablesList[e].tmpdbvariables,this.tmpdbvariables.valuetype=this.dbvariablesList[e].valuetype,this.tmpdbvariables.memo=this.dbvariablesList[e].memo,this.tmpdbvariables.creator=this.name},updatedbvariables:function(){var e=this;this.$refs.tmpdbvariables.validate(function(i){i&&Object(n.d)(e.tmpdbvariables).then(function(){e.$message.success("更新成功"),e.getdbvariablesList(),e.dialogFormVisible=!1}).catch(function(i){e.$message.error("更新失败")})})},removedbconditionvariables:function(e){var i=this;this.$confirm("删除该数据库绑定？","警告",{confirmButtonText:"是",cancelButtonText:"否",type:"warning"}).then(function(){var t=i.DbconditionVariablesList[e].id;Object(l.c)(t).then(function(){i.$message.success("删除成功"),i.getbyvariablesid()})}).catch(function(){i.$message.info("已取消删除")})},removedbvariables:function(e){var i=this;this.$confirm("删除该变量？","警告",{confirmButtonText:"是",cancelButtonText:"否",type:"warning"}).then(function(){var t=i.dbvariablesList[e].id;Object(n.b)(t).then(function(){i.$message.success("删除成功"),i.getdbvariablesList()})}).catch(function(){i.$message.info("已取消删除")})},isUniqueDetail:function(e){for(var i=0;i<this.dbvariablesList.length;i++)if(this.dbvariablesList[i].id!==e.id&&this.dbvariablesList[i].dbvariablesname===e.dbvariablesname)return this.$message.error("变量名已存在"),!1;return!0}}},u={render:function(){var e=this,i=e.$createElement,t=e._self._c||i;return t("div",{staticClass:"app-container"},[t("div",{staticClass:"filter-container"},[t("el-form",{attrs:{inline:!0}},[t("el-form-item",[e.hasPermission("dbvariables:list")?t("el-button",{attrs:{type:"success",size:"mini",icon:"el-icon-refresh"},nativeOn:{click:function(i){return i.preventDefault(),e.getdbvariablesList(i)}}},[e._v("刷新")]):e._e(),e._v(" "),e.hasPermission("dbvariables:add")?t("el-button",{attrs:{type:"primary",size:"mini",icon:"el-icon-plus"},nativeOn:{click:function(i){return i.preventDefault(),e.showAdddbvariablesDialog(i)}}},[e._v("添加数据库变量")]):e._e()],1),e._v(" "),e.hasPermission("dbvariables:search")?t("span",[t("el-form-item",[t("el-input",{attrs:{clearable:"",maxlength:"40",placeholder:"变量名"},nativeOn:{keyup:function(i){return!i.type.indexOf("key")&&e._k(i.keyCode,"enter",13,i.key,"Enter")?null:e.searchBy(i)}},model:{value:e.search.dbvariablesname,callback:function(i){e.$set(e.search,"dbvariablesname",i)},expression:"search.dbvariablesname"}})],1),e._v(" "),t("el-form-item",[t("el-button",{attrs:{type:"primary",loading:e.btnLoading},on:{click:e.searchBy}},[e._v("查询")])],1)],1):e._e()],1)],1),e._v(" "),t("el-table",{directives:[{name:"loading",rawName:"v-loading.body",value:e.listLoading,expression:"listLoading",modifiers:{body:!0}}],key:e.itemKey,attrs:{data:e.dbvariablesList,"element-loading-text":"loading",border:"",fit:"","highlight-current-row":""}},[t("el-table-column",{attrs:{label:"编号",align:"center",width:"60"},scopedSlots:e._u([{key:"default",fn:function(i){return[t("span",{domProps:{textContent:e._s(e.getIndex(i.$index))}})]}}])}),e._v(" "),t("el-table-column",{attrs:{label:"数据库变量名",align:"center",prop:"dbvariablesname",width:"180"}}),e._v(" "),t("el-table-column",{attrs:{"show-overflow-tooltip":!0,label:"变量描述",align:"center",prop:"variablesdes",width:"100"}}),e._v(" "),t("el-table-column",{attrs:{label:"变量值类型",align:"center",prop:"valuetype",width:"85"}}),e._v(" "),t("el-table-column",{attrs:{"show-overflow-tooltip":!0,label:"备注",align:"center",prop:"memo",width:"100"}}),e._v(" "),t("el-table-column",{attrs:{label:"操作人",align:"center",prop:"creator",width:"70"}}),e._v(" "),t("el-table-column",{attrs:{label:"创建时间",align:"center",prop:"createTime",width:"150"},scopedSlots:e._u([{key:"default",fn:function(i){return[e._v(e._s(e.unix2CurrentTime(i.row.createTime)))]}}])}),e._v(" "),t("el-table-column",{attrs:{label:"最后修改时间",align:"center",prop:"lastmodifyTime",width:"150"},scopedSlots:e._u([{key:"default",fn:function(i){return[e._v(e._s(e.unix2CurrentTime(i.row.lastmodifyTime))+"\n      ")]}}])}),e._v(" "),e.hasPermission("dbvariables:update")||e.hasPermission("dbvariables:delete")?t("el-table-column",{attrs:{label:"管理",align:"center"},scopedSlots:e._u([{key:"default",fn:function(i){return[e.hasPermission("dbvariables:update")&&i.row.id!==e.id?t("el-button",{attrs:{type:"warning",size:"mini"},nativeOn:{click:function(t){return t.preventDefault(),e.showUpdatedbvariablesDialog(i.$index)}}},[e._v("修改")]):e._e(),e._v(" "),e.hasPermission("dbvariables:delete")&&i.row.id!==e.id?t("el-button",{attrs:{type:"danger",size:"mini"},nativeOn:{click:function(t){return t.preventDefault(),e.removedbvariables(i.$index)}}},[e._v("删除")]):e._e(),e._v(" "),e.hasPermission("dbvariables:update")&&i.row.id!==e.id?t("el-button",{attrs:{type:"primary",size:"mini"},nativeOn:{click:function(t){return t.preventDefault(),e.showDbconditionVariablesDialog(i.$index)}}},[e._v("绑定数据库操作")]):e._e()]}}],null,!1,1857662756)}):e._e()],1),e._v(" "),t("el-pagination",{attrs:{"current-page":e.search.page,"page-size":e.search.size,total:e.total,"page-sizes":[10,20,30,40],layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":e.handleSizeChange,"current-change":e.handleCurrentChange}}),e._v(" "),t("el-dialog",{attrs:{title:e.textMap[e.dialogStatus],visible:e.dialogFormVisible},on:{"update:visible":function(i){e.dialogFormVisible=i}}},[t("el-form",{ref:"tmpdbvariables",staticClass:"small-space",staticStyle:{width:"500px","margin-left":"50px"},attrs:{"status-icon":"","label-position":"left","label-width":"120px",model:e.tmpdbvariables}},[t("el-form-item",{attrs:{label:"变量名",prop:"dbvariablesname",required:""}},[t("el-input",{attrs:{maxlength:"50",type:"text","prefix-icon":"el-icon-edit","auto-complete":"off"},model:{value:e.tmpdbvariables.dbvariablesname,callback:function(i){e.$set(e.tmpdbvariables,"dbvariablesname",i)},expression:"tmpdbvariables.dbvariablesname"}})],1),e._v(" "),t("el-form-item",{attrs:{label:"变量描述",prop:"variablesdes",required:""}},[t("el-input",{attrs:{maxlength:"20",type:"text","prefix-icon":"el-icon-edit","auto-complete":"off"},model:{value:e.tmpdbvariables.variablesdes,callback:function(i){e.$set(e.tmpdbvariables,"variablesdes",i)},expression:"tmpdbvariables.variablesdes"}})],1),e._v(" "),t("el-form-item",{attrs:{label:"变量值类型",prop:"valuetype",required:""}},[t("el-select",{staticStyle:{width:"100%"},attrs:{placeholder:"变量值类型"},model:{value:e.tmpdbvariables.valuetype,callback:function(i){e.$set(e.tmpdbvariables,"valuetype",i)},expression:"tmpdbvariables.valuetype"}},[t("el-option",{attrs:{label:"Number",value:"Number"}}),e._v(" "),t("el-option",{attrs:{label:"String",value:"String"}}),e._v(" "),t("el-option",{attrs:{label:"Array",value:"Array"}}),e._v(" "),t("el-option",{attrs:{label:"Bool",value:"Bool"}})],1)],1),e._v(" "),t("el-form-item",{attrs:{label:"备注",prop:"memo"}},[t("el-input",{attrs:{maxlength:"60",type:"text","prefix-icon":"el-icon-message","auto-complete":"off"},model:{value:e.tmpdbvariables.memo,callback:function(i){e.$set(e.tmpdbvariables,"memo",i)},expression:"tmpdbvariables.memo"}})],1)],1),e._v(" "),t("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[t("el-button",{nativeOn:{click:function(i){i.preventDefault(),e.dialogFormVisible=!1}}},[e._v("取消")]),e._v(" "),"add"===e.dialogStatus?t("el-button",{attrs:{type:"danger"},nativeOn:{click:function(i){return i.preventDefault(),e.$refs.tmpdbvariables.resetFields()}}},[e._v("重置")]):e._e(),e._v(" "),"add"===e.dialogStatus?t("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(i){return i.preventDefault(),e.adddbvariables(i)}}},[e._v("添加")]):e._e(),e._v(" "),"update"===e.dialogStatus?t("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(i){return i.preventDefault(),e.updatedbvariables(i)}}},[e._v("修改")]):e._e()],1)],1),e._v(" "),t("el-dialog",{attrs:{title:e.BindtextMap[e.BinddialogStatus],visible:e.BindFormVisible},on:{"update:visible":function(i){e.BindFormVisible=i}}},[t("el-form",{ref:"tmpDbConditionVariables",staticClass:"small-space",staticStyle:{width:"450px","margin-left":"50px"},attrs:{"status-icon":"","label-position":"left","label-width":"140px",model:e.tmpDbConditionVariables}},[t("el-form-item",{attrs:{label:"数据库子条件",prop:"dbconditionname",required:""}},[t("el-select",{staticStyle:{width:"100%"},attrs:{filterable:"",placeholder:"数据库子条件"},on:{change:function(i){return e.dbconditionselectChanged(i)}},model:{value:e.tmpDbConditionVariables.dbconditionname,callback:function(i){e.$set(e.tmpDbConditionVariables,"dbconditionname",i)},expression:"tmpDbConditionVariables.dbconditionname"}},[t("el-option",{staticStyle:{display:"none"},attrs:{label:"请选择",value:"''"}}),e._v(" "),e._l(e.DbconditionList,function(e,i){return t("div",{key:i},[t("el-option",{attrs:{label:e.subconditionname,value:e.subconditionname,required:""}})],1)})],2)],1),e._v(" "),t("el-form-item",{attrs:{label:"绑定Sql列名",prop:"fieldname",required:""}},[t("el-input",{attrs:{placeholder:"数据库子条件查询Sql结果列名",maxLength:"50",type:"text","prefix-icon":"el-icon-message","auto-complete":"off"},model:{value:e.tmpDbConditionVariables.fieldname,callback:function(i){e.$set(e.tmpDbConditionVariables,"fieldname",i)},expression:"tmpDbConditionVariables.fieldname"}})],1),e._v(" "),t("el-form-item",{attrs:{label:"绑定结果行号",prop:"roworder",required:""}},[t("el-input",{attrs:{placeholder:"数据库子条件查询Sql结果行号",oninput:"value=value.replace(/[^\\d]/g,'')",maxLength:"10",type:"number","prefix-icon":"el-icon-message","auto-complete":"off"},model:{value:e.tmpDbConditionVariables.roworder,callback:function(i){e.$set(e.tmpDbConditionVariables,"roworder",i)},expression:"tmpDbConditionVariables.roworder"}})],1),e._v(" "),t("el-form-item",{attrs:{label:"备注",prop:"memo"}},[t("el-input",{attrs:{type:"text","prefix-icon":"el-icon-message","auto-complete":"off"},model:{value:e.tmpDbConditionVariables.memo,callback:function(i){e.$set(e.tmpDbConditionVariables,"memo",i)},expression:"tmpDbConditionVariables.memo"}})],1)],1),e._v(" "),t("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[t("el-button",{nativeOn:{click:function(i){i.preventDefault(),e.BindFormVisible=!1}}},[e._v("取消")]),e._v(" "),"add"===e.BinddialogStatus?t("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(i){return i.preventDefault(),e.addDBConditionVariables(i)}}},[e._v("保存")]):e._e(),e._v(" "),"update"===e.BinddialogStatus?t("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(i){return i.preventDefault(),e.updateDBConditionVariables(i)}}},[e._v("修改")]):e._e()],1)],1),e._v(" "),t("el-dialog",{attrs:{title:"绑定数据库子条件",visible:e.BindVariablesDialogVisible},on:{"update:visible":function(i){e.BindVariablesDialogVisible=i}}},[t("div",{staticClass:"filter-container"},[t("el-form",{attrs:{inline:!0}},[t("el-form-item",[e.hasPermission("ApicasesVariables:add")?t("el-button",{attrs:{type:"primary",size:"mini",icon:"el-icon-plus"},nativeOn:{click:function(i){return i.preventDefault(),e.showAddConditionVariablesDialog(i)}}},[e._v("绑定数据库条件")]):e._e()],1)],1)],1),e._v(" "),t("el-table",{directives:[{name:"loading",rawName:"v-loading.body",value:e.listLoading,expression:"listLoading",modifiers:{body:!0}}],key:e.itemKey,attrs:{data:e.DbconditionVariablesList,"element-loading-text":"loading",border:"",fit:"","highlight-current-row":""}},[t("el-table-column",{attrs:{label:"编号",align:"center",width:"60"},scopedSlots:e._u([{key:"default",fn:function(i){return[t("span",{domProps:{textContent:e._s(e.getIndex(i.$index))}})]}}])}),e._v(" "),t("el-table-column",{attrs:{label:"数据库子条件",align:"center",prop:"dbconditionname",width:"150"}}),e._v(" "),t("el-table-column",{attrs:{label:"绑定查询Sql列名",align:"center",prop:"fieldname",width:"150"}}),e._v(" "),t("el-table-column",{attrs:{label:"绑定查询结果行号",align:"center",prop:"roworder",width:"140"}}),e._v(" "),e.hasPermission("ApicasesVariables:update")||e.hasPermission("ApicasesVariables:delete")?t("el-table-column",{attrs:{label:"管理",align:"center"},scopedSlots:e._u([{key:"default",fn:function(i){return[e.hasPermission("ApicasesVariables:update")&&i.row.id!==e.id?t("el-button",{attrs:{type:"warning",size:"mini"},nativeOn:{click:function(t){return t.preventDefault(),e.showUpdateDBCconditionVariablesDialog(i.$index)}}},[e._v("修改")]):e._e(),e._v(" "),e.hasPermission("ApicasesVariables:delete")&&i.row.id!==e.id?t("el-button",{attrs:{type:"danger",size:"mini"},nativeOn:{click:function(t){return t.preventDefault(),e.removedbconditionvariables(i.$index)}}},[e._v("删除")]):e._e()]}}],null,!1,2156773669)}):e._e()],1)],1)],1)},staticRenderFns:[]},p=t("VU/8")(m,u,!1,null,null,null);i.default=p.exports},Y48K:function(e,i,t){"use strict";i.a=function(e){return Object(a.a)({url:"/dbcondition/variables",method:"post",data:e})},i.d=function(e){return Object(a.a)({url:"/dbcondition/variables/detail",method:"put",data:e})},i.b=function(e){return Object(a.a)({url:"/dbcondition/variables/getbyvariablesid",method:"post",data:e})},i.c=function(e){return Object(a.a)({url:"/dbcondition/variables/"+e,method:"delete"})};var a=t("vLgD")}});
//# sourceMappingURL=25.fd4c46a771d748ebea17.js.map