webpackJsonp([63],{OfNB:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var c=a("Dd8w"),n=a.n(c),o=a("TqBD"),i=a("0xDb"),r=a("NYxO"),s=a("vLgD");var l=a("nv77"),u={filters:{statusFilter:function(t){return{published:"success",draft:"gray",deleted:"danger"}[t]}},data:function(){return{itemKey:null,projectaccountitemKey:null,itemaccountKey:null,tmpprojectname:"",accountmultipleSelection:[],projectList:[],projectaccountList:[],projectaccountsList:[],accountList:[],listLoading:!1,total:0,projectaccounttotal:0,accounttotal:0,dialogStatus:"add",dialogFormVisible:!1,ProjectAccountdialogFormVisible:!1,accountdialogFormVisible:!1,textMap:{updateRole:"修改项目迭代",update:"修改项目迭代",add:"添加项目迭代"},btnLoading:!1,tmpproject:{id:"",projectname:"",status:"",startTime:"",endTime:"",memo:"",creator:""},search:{page:1,size:10,projectname:null,accountId:null,status:null},searchprojectaccount:{page:1,size:10,projectid:null,projectname:null,status:null},searchaccount:{page:1,size:10,nickname:null}}},created:function(){this.search.accountId=this.accountId,this.getprojectList()},computed:n()({},Object(r.b)(["name","sidebar","avatar","accountId"])),methods:{unix2CurrentTime:i.b,getprojectList:function(){var t=this;this.listLoading=!0,this.search.projectname=this.tmpprojectname,Object(o.d)(this.search).then(function(e){t.projectList=e.data.list,t.total=e.data.total,t.listLoading=!1}).catch(function(e){t.$message.error("加载项目迭代列表失败")})},getprojectaccountList:function(){var t,e=this;(t=this.searchprojectaccount,Object(s.a)({url:"/project/account/findaccountbyprojectid",method:"post",data:t})).then(function(t){e.projectaccountList=t.data.list,e.projectaccounttotal=t.data.total}).catch(function(t){e.$message.error("加载项目成员迭代列表失败")})},getaccountList:function(){var t=this;Object(l.h)(this.searchaccount).then(function(e){t.accountList=e.data.list,t.accounttotal=e.data.total}).catch(function(e){t.$message.error("加载成员迭代列表失败")})},searchBy:function(){var t=this;this.search.page=1,this.listLoading=!0,Object(o.d)(this.search).then(function(e){t.itemKey=Math.random(),t.projectList=e.data.list,t.total=e.data.total}).catch(function(e){t.$message.error("搜索失败")}),this.tmpprojectname=this.search.projectname,this.listLoading=!1,this.btnLoading=!1},searchaccountBy:function(){var t=this;this.searchaccount.page=1,Object(l.h)(this.searchaccount).then(function(e){t.accountList=e.data.list,t.accounttotal=e.data.total}).catch(function(e){t.$message.error("搜索失败")})},handleSizeChange:function(t){this.search.page=1,this.search.size=t,this.getprojectList()},handleCurrentChange:function(t){this.search.page=t,this.getprojectList()},getIndex:function(t){return(this.search.page-1)*this.search.size+t+1},projectaccounthandleSizeChange:function(t){this.searchprojectaccount.page=1,this.searchprojectaccount.size=t,this.getprojectaccountList()},projectaccounthandleCurrentChange:function(t){this.searchprojectaccount.page=t,this.getprojectaccountList()},projectaccountgetIndex:function(t){return(this.searchprojectaccount.page-1)*this.searchprojectaccount.size+t+1},accounthandleSizeChange:function(t){this.searchaccount.page=1,this.searchaccount.size=t,this.getaccountList()},accounthandleCurrentChange:function(t){this.searchaccount.page=t,this.getaccountList()},accountgetIndex:function(t){return(this.searchaccount.page-1)*this.searchaccount.size+t+1},accounthandleSelectionChange:function(t){this.accountmultipleSelection=t},showAddprojectDialog:function(){this.dialogFormVisible=!0,this.dialogStatus="add",this.tmpproject.id="",this.tmpproject.projectname="",this.tmpproject.memo="",this.tmpproject.status="",this.tmpproject.startTime="",this.tmpproject.endTime="",this.tmpproject.creator=this.name},showAddprojectAccountDialog:function(){this.accountdialogFormVisible=!0,this.getaccountList()},showprojectaccount:function(t){this.ProjectAccountdialogFormVisible=!0,this.searchprojectaccount.projectid=this.projectList[t].id,this.searchprojectaccount.projectname=this.projectList[t].projectname,this.getprojectaccountList()},addproject:function(){var t=this;this.$refs.tmpproject.validate(function(e){e&&(t.btnLoading=!0,Object(o.a)(t.tmpproject).then(function(){t.$message.success("添加成功"),t.getprojectList(),t.dialogFormVisible=!1,t.btnLoading=!1}).catch(function(e){t.$message.error("添加失败"),t.btnLoading=!1}))})},addprojectaccount:function(){var t,e=this;if(this.projectaccountsList=[],0===this.accountmultipleSelection.length)this.$message.error("请选择用户");else{for(var a=0;a<this.accountmultipleSelection.length;a++)this.projectaccountsList.push({projectid:this.searchprojectaccount.projectid,accountid:this.accountmultipleSelection[a].id,projectname:this.searchprojectaccount.projectname,nickname:this.accountmultipleSelection[a].nickname,creator:this.name});(t=this.projectaccountsList,Object(s.a)({url:"/project/account/addprojectaccounts",method:"post",data:t})).then(function(){e.accountdialogFormVisible=!1,e.getprojectaccountList(),e.$message.success("添加成功")}).catch(function(t){e.$message.error("添加失败")})}},showUpdateprojectDialog:function(t){this.dialogFormVisible=!0,this.dialogStatus="update",this.tmpproject.id=this.projectList[t].id,this.tmpproject.projectname=this.projectList[t].projectname,this.tmpproject.status=this.projectList[t].status,this.tmpproject.startTime=this.projectList[t].startTime,this.tmpproject.endTime=this.projectList[t].endTime,this.tmpproject.memo=this.projectList[t].memo,this.tmpproject.creator=this.name},updateproject:function(){var t=this;this.$refs.tmpproject.validate(function(e){e&&Object(o.e)(t.tmpproject).then(function(){t.$message.success("更新成功"),t.getprojectList(),t.dialogFormVisible=!1}).catch(function(e){t.$message.error("更新失败")})})},removeproject:function(t){var e=this;this.$confirm("删除该项目迭代？","警告",{confirmButtonText:"是",cancelButtonText:"否",type:"warning"}).then(function(){var a=e.projectList[t].id;Object(o.c)(a).then(function(){e.$message.success("删除成功"),e.getprojectList()})}).catch(function(){e.$message.info("已取消删除")})},removeprojectaccount:function(t){var e=this;this.$confirm("删除该用户？","警告",{confirmButtonText:"是",cancelButtonText:"否",type:"warning"}).then(function(){var a,c=e.projectaccountList[t].id;(a=c,Object(s.a)({url:"/project/account/"+a,method:"delete"})).then(function(){e.$message.success("删除成功"),e.getprojectaccountList()})}).catch(function(){e.$message.info("已取消删除")})},isUniqueDetail:function(t){for(var e=0;e<this.projectList.length;e++)if(this.projectList[e].id!==t.id&&this.projectList[e].projectname===t.projectname)return this.$message.error("项目名已存在"),!1;return!0}}},p={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"app-container"},[a("div",{staticClass:"filter-container"},[a("el-form",{attrs:{inline:!0}},[a("el-form-item",[t.hasPermission("project:list")?a("el-button",{attrs:{type:"success",size:"mini",icon:"el-icon-refresh"},nativeOn:{click:function(e){return e.preventDefault(),t.getprojectList(e)}}},[t._v("刷新")]):t._e(),t._v(" "),t.hasPermission("project:add")?a("el-button",{attrs:{type:"primary",size:"mini",icon:"el-icon-plus"},nativeOn:{click:function(e){return e.preventDefault(),t.showAddprojectDialog(e)}}},[t._v("创建项目")]):t._e()],1),t._v(" "),t.hasPermission("project:search")?a("span",[a("el-form-item",[a("el-input",{attrs:{clearable:"",maxlength:"40",placeholder:"项目名"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.searchBy(e)}},model:{value:t.search.projectname,callback:function(e){t.$set(t.search,"projectname",e)},expression:"search.projectname"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"状态",prop:"status"}},[a("el-select",{staticStyle:{width:"100%"},attrs:{clearable:"",placeholder:"状态"},model:{value:t.search.status,callback:function(e){t.$set(t.search,"status",e)},expression:"search.status"}},[a("el-option",{attrs:{label:"开始",value:"开始"}}),t._v(" "),a("el-option",{attrs:{label:"暂停",value:"暂停"}}),t._v(" "),a("el-option",{attrs:{label:"关闭",value:"关闭"}})],1)],1),t._v(" "),a("el-form-item",[a("el-button",{attrs:{type:"primary",loading:t.btnLoading},on:{click:t.searchBy}},[t._v("查询")])],1)],1):t._e()],1)],1),t._v(" "),a("el-table",{directives:[{name:"loading",rawName:"v-loading.body",value:t.listLoading,expression:"listLoading",modifiers:{body:!0}}],key:t.itemKey,attrs:{data:t.projectList,"element-loading-text":"loading",border:"",fit:"","highlight-current-row":""}},[a("el-table-column",{attrs:{label:"编号",align:"center",width:"60"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",{domProps:{textContent:t._s(t.getIndex(e.$index))}})]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"项目名称",align:"center",prop:"projectname",width:"150"}}),t._v(" "),a("el-table-column",{attrs:{label:"状态",align:"center",prop:"status",width:"80"}}),t._v(" "),a("el-table-column",{attrs:{"show-overflow-tooltip":!0,label:"项目简介",align:"center",prop:"memo",width:"250"}}),t._v(" "),a("el-table-column",{attrs:{label:"创建人",align:"center",prop:"creator",width:"80"}}),t._v(" "),a("el-table-column",{attrs:{label:"创建时间",align:"center",prop:"createTime",width:"140"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v(t._s(t.unix2CurrentTime(e.row.createTime)))]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"最后修改时间",align:"center",prop:"lastmodifyTime",width:"140"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v(t._s(t.unix2CurrentTime(e.row.lastmodifyTime))+"\n        ")]}}])}),t._v(" "),t.hasPermission("project:update")||t.hasPermission("project:delete")?a("el-table-column",{attrs:{label:"管理",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[t.hasPermission("project:update")&&e.row.id!==t.id?a("el-button",{attrs:{type:"warning",size:"mini"},nativeOn:{click:function(a){return a.preventDefault(),t.showUpdateprojectDialog(e.$index)}}},[t._v("修改")]):t._e(),t._v(" "),t.hasPermission("project:update")&&e.row.id!==t.id?a("el-button",{attrs:{type:"primary",size:"mini"},nativeOn:{click:function(a){return a.preventDefault(),t.showprojectaccount(e.$index)}}},[t._v("成员")]):t._e()]}}],null,!1,315912401)}):t._e()],1),t._v(" "),a("el-pagination",{attrs:{"current-page":t.search.page,"page-size":t.search.size,total:t.total,"page-sizes":[10,20,30,40],layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":t.handleSizeChange,"current-change":t.handleCurrentChange}}),t._v(" "),a("el-dialog",{attrs:{title:t.textMap[t.dialogStatus],visible:t.dialogFormVisible},on:{"update:visible":function(e){t.dialogFormVisible=e}}},[a("el-form",{ref:"tmpproject",staticClass:"small-space",staticStyle:{width:"400px","margin-left":"50px"},attrs:{"status-icon":"","label-position":"left","label-width":"120px",model:t.tmpproject}},[a("el-form-item",{attrs:{label:"项目名",prop:"projectname",required:""}},[a("el-input",{attrs:{maxlength:"50",type:"text","prefix-icon":"el-icon-edit","auto-complete":"off"},model:{value:t.tmpproject.projectname,callback:function(e){t.$set(t.tmpproject,"projectname",e)},expression:"tmpproject.projectname"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"状态",prop:"status",required:""}},[a("el-select",{staticStyle:{width:"100%"},attrs:{placeholder:"状态"},model:{value:t.tmpproject.status,callback:function(e){t.$set(t.tmpproject,"status",e)},expression:"tmpproject.status"}},[a("el-option",{attrs:{label:"开始",value:"开始"}}),t._v(" "),a("el-option",{attrs:{label:"暂停",value:"暂停"}}),t._v(" "),a("el-option",{attrs:{label:"关闭",value:"关闭"}})],1)],1),t._v(" "),a("el-form-item",{attrs:{label:"项目描述",prop:"memo",required:""}},[a("el-input",{attrs:{type:"textarea",rows:"10",cols:"50","prefix-icon":"el-icon-message","auto-complete":"off"},model:{value:t.tmpproject.memo,callback:function(e){t.$set(t.tmpproject,"memo",e)},expression:"tmpproject.memo"}})],1)],1),t._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{nativeOn:{click:function(e){e.preventDefault(),t.dialogFormVisible=!1}}},[t._v("取消")]),t._v(" "),"add"===t.dialogStatus?a("el-button",{attrs:{type:"danger"},nativeOn:{click:function(e){return e.preventDefault(),t.$refs.tmpproject.resetFields()}}},[t._v("重置")]):t._e(),t._v(" "),"add"===t.dialogStatus?a("el-button",{attrs:{type:"success",loading:t.btnLoading},nativeOn:{click:function(e){return e.preventDefault(),t.addproject(e)}}},[t._v("添加")]):t._e(),t._v(" "),"update"===t.dialogStatus?a("el-button",{attrs:{type:"success",loading:t.btnLoading},nativeOn:{click:function(e){return e.preventDefault(),t.updateproject(e)}}},[t._v("修改")]):t._e()],1)],1),t._v(" "),a("el-dialog",{attrs:{title:"项目成员",visible:t.ProjectAccountdialogFormVisible},on:{"update:visible":function(e){t.ProjectAccountdialogFormVisible=e}}},[a("div",{staticClass:"filter-container"},[a("el-form",{attrs:{inline:!0}},[a("el-form-item",[t.hasPermission("project:add")?a("el-button",{attrs:{type:"primary",size:"mini",icon:"el-icon-plus"},nativeOn:{click:function(e){return e.preventDefault(),t.showAddprojectAccountDialog(e)}}},[t._v("增加成员")]):t._e()],1)],1)],1),t._v(" "),a("el-table",{key:t.projectaccountitemKey,ref:"projectaccountTable",attrs:{data:t.projectaccountList,"element-loading-text":"loading",border:"",fit:"","highlight-current-row":""}},[a("el-table-column",{attrs:{label:"编号",align:"center",width:"60"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",{domProps:{textContent:t._s(t.projectaccountgetIndex(e.$index))}})]}}])}),t._v(" "),a("el-table-column",{attrs:{label:"项目名",align:"center",prop:"projectname",width:"180"}}),t._v(" "),a("el-table-column",{attrs:{label:"用户",align:"center",prop:"nickname",width:"190"}}),t._v(" "),a("el-table-column",{attrs:{label:"管理",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{type:"danger",size:"mini"},nativeOn:{click:function(a){return a.preventDefault(),t.removeprojectaccount(e.$index)}}},[t._v("删除\n            ")])]}}])})],1),t._v(" "),a("el-pagination",{attrs:{"current-page":t.searchprojectaccount.page,"page-size":t.searchprojectaccount.size,total:t.projectaccounttotal,"page-sizes":[10,20,30,40],layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":t.projectaccounthandleSizeChange,"current-change":t.projectaccounthandleCurrentChange}})],1),t._v(" "),a("el-dialog",{attrs:{title:"选择成员",visible:t.accountdialogFormVisible},on:{"update:visible":function(e){t.accountdialogFormVisible=e}}},[a("div",{staticClass:"filter-container"},[a("el-form",{ref:"searchaccount",attrs:{inline:!0,model:t.searchaccount}},[a("el-form-item",{attrs:{label:"成员名:",prop:"nickname"}},[a("el-input",{attrs:{clearable:"",maxlength:"40",placeholder:"成员名"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.searchBy(e)}},model:{value:t.searchaccount.nickname,callback:function(e){t.$set(t.searchaccount,"nickname",e)},expression:"searchaccount.nickname"}})],1),t._v(" "),a("el-form-item",[a("el-button",{attrs:{type:"primary",loading:t.btnLoading},on:{click:t.searchaccountBy}},[t._v("查询")])],1)],1)],1),t._v(" "),a("el-table",{key:t.itemaccountKey,ref:"caseTable",attrs:{data:t.accountList,"element-loading-text":"loading",border:"",fit:"","highlight-current-row":""},on:{"selection-change":t.accounthandleSelectionChange}},[a("el-table-column",{attrs:{label:"编号",align:"center",width:"60"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("span",{domProps:{textContent:t._s(t.accountgetIndex(e.$index))}})]}}])}),t._v(" "),a("el-table-column",{attrs:{type:"selection",prop:"status",width:"50"}}),t._v(" "),a("el-table-column",{attrs:{label:"用户名",align:"center",prop:"nickname",width:"520"}})],1),t._v(" "),a("el-pagination",{attrs:{"current-page":t.searchaccount.page,"page-size":t.searchaccount.size,total:t.accounttotal,"page-sizes":[10,20,30,40],layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":t.accounthandleSizeChange,"current-change":t.accounthandleCurrentChange}}),t._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{nativeOn:{click:function(e){e.preventDefault(),t.accountdialogFormVisible=!1}}},[t._v("取消")]),t._v(" "),a("el-button",{attrs:{type:"success",loading:t.btnLoading},nativeOn:{click:function(e){return e.preventDefault(),t.addprojectaccount(e)}}},[t._v("新增")])],1)],1)],1)},staticRenderFns:[]},h=a("VU/8")(u,p,!1,null,null,null);e.default=h.exports}});
//# sourceMappingURL=63.3231733e2c4c1d8c65ae.js.map