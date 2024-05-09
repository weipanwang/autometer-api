webpackJsonp([39],{"3vCV":function(e,t,i){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var s=i("Dd8w"),n=i.n(s),o=i("STSY"),l=i("0xDb"),a=i("NYxO"),r={created:function(){this.hasPermission("role:update")&&this.getPermissionList(),this.hasPermission("role:list")&&this.getRoleList()},data:function(){return{roleList:[],permissionList:[],listLoading:!1,total:0,listQuery:{page:1,size:10},dialogStatus:"add",dialogFormVisible:!1,textMap:{update:"修改角色",add:"添加角色"},btnLoading:!1,tempRole:{id:"",name:"",permissionIdList:[]},createRules:{name:[{required:!0,trigger:"blur",validator:function(e,t,i){""===t?i(new Error("角色名不能为空")):i()}}]}}},computed:n()({},Object(a.b)(["roleName"])),methods:{unix2CurrentTime:l.b,getPermissionList:function(){var e=this;Object(o.c)().then(function(t){e.permissionList=t.data.list}).catch(function(t){e.$message.error("加载权限列表失败")})},getRoleList:function(){var e=this;this.listLoading=!0,Object(o.d)(this.listQuery).then(function(t){e.roleList=t.data.list,e.total=t.data.total,e.listLoading=!1}).catch(function(t){e.$message.error("加载角色列表失败")})},handleSizeChange:function(e){this.listQuery.page=1,this.listQuery.size=e,this.getRoleList()},handleCurrentChange:function(e){this.listQuery.page=e,this.getRoleList()},getTableIndex:function(e){return(this.listQuery.page-1)*this.listQuery.size+e+1},showAddRoleDialog:function(){this.dialogFormVisible=!0,this.dialogStatus="add",this.tempRole.name="",this.tempRole.id="",this.tempRole.permissionIdList=[]},showUpdateRoleDialog:function(e){this.dialogFormVisible=!0,this.dialogStatus="update";var t=this.roleList[e];this.tempRole.name=t.name,this.tempRole.id=t.id,this.tempRole.permissionIdList=[];for(var i=0;i<t.resourceList.length;i++)for(var s=t.resourceList[i].handleList,n=0;n<s.length;n++){var o=s[n];this.tempRole.permissionIdList.push(o.id)}},showRoleDialog:function(e){this.dialogFormVisible=!0,this.dialogStatus="show";var t=this.roleList[e];this.tempRole.name=t.name,this.tempRole.id=t.id,this.tempRole.permissionIdList=[];var i=[];i="超级管理员"===t.name?this.permissionList:t.resourceList;for(var s=0;s<i.length;s++)for(var n=i[s].handleList,o=0;o<n.length;o++){var l=n[o];this.tempRole.permissionIdList.push(l.id)}},addRole:function(){var e=this;this.$refs.tempRole.validate(function(t){t&&e.isRoleNameUnique(e.tempRole.id,e.tempRole.name)?(e.btnLoading=!0,Object(o.a)(e.tempRole).then(function(){e.$message.success("添加成功"),e.getRoleList()}).catch(function(t){e.$message.error("添加角色失败")}),e.dialogFormVisible=!1,e.btnLoading=!1):console.log("表单无效")})},updateRole:function(){var e=this;this.$refs.tempRole.validate(function(t){t&&e.isRoleNameUnique(e.tempRole.id,e.tempRole.name)?(e.btnLoading=!0,Object(o.f)(e.tempRole).then(function(){e.$message.success("更新成功"),e.getRoleList()}).catch(function(t){e.$message.error("更新角色失败")}),e.dialogFormVisible=!1,e.btnLoading=!1):console.log("表单无效")})},isRoleNameUnique:function(e,t){for(var i=0;i<this.roleList.length;i++)if(this.roleList[i].id!==e&&this.roleList[i].name===t)return this.$message.error("角色名已存在"),!1;return!0},removeRole:function(e){var t=this;this.$confirm("删除该角色？","警告",{confirmButtonText:"是",cancelButtonText:"否",type:"warning"}).then(function(){var i=t.roleList[e].id;Object(o.e)(i).then(function(){t.$message.success("删除成功"),t.getRoleList()}).catch(function(){t.$message.error("删除失败")})}).catch(function(){t.$message.info("已取消删除")})},isMenuNone:function(e){for(var t=this.permissionList[e].handleList,i=0;i<t.length;i++)if(this.tempRole.permissionIdList.indexOf(t[i].id)>-1)return!1;return!0},isMenuAll:function(e){for(var t=this.permissionList[e].handleList,i=0;i<t.length;i++)if(this.tempRole.permissionIdList.indexOf(t[i].id)<0)return!1;return!0},checkAll:function(e){this.isMenuAll(e)?this.cancelAll(e):this.selectAll(e)},selectAll:function(e){for(var t=this.permissionList[e].handleList,i=0;i<t.length;i++)this.addUnique(t[i].id,this.tempRole.permissionIdList)},cancelAll:function(e){for(var t=this.permissionList[e].handleList,i=0;i<t.length;i++){var s=this.tempRole.permissionIdList.indexOf(t[i].id);s>-1&&this.tempRole.permissionIdList.splice(s,1)}},handleChecked:function(e,t){this.tempRole.permissionIdList.indexOf(e.id)>-1?this.makePermissionChecked(t):this.cancelAll(t)},makePermissionChecked:function(e){for(var t=this.permissionList[e].handleList,i=0;i<t.length;i++)this.addUnique(t[i].id,this.tempRole.permissionIdList)},addUnique:function(e,t){t.indexOf(e)<0&&t.push(e)}}},d={render:function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"app-container"},[i("div",{staticClass:"filter-container"},[i("el-form",{attrs:{inline:!0}},[i("el-form-item",[e.hasPermission("role:list")?i("el-button",{attrs:{type:"success",size:"mini",icon:"el-icon-refresh"},nativeOn:{click:function(t){return t.preventDefault(),e.getRoleList(t)}}},[e._v("刷新")]):e._e(),e._v(" "),e.hasPermission("role:add")?i("el-button",{attrs:{type:"primary",size:"mini",icon:"el-icon-plus"},nativeOn:{click:function(t){return t.preventDefault(),e.showAddRoleDialog(t)}}},[e._v("添加角色")]):e._e()],1)],1)],1),e._v(" "),i("el-table",{directives:[{name:"loading",rawName:"v-loading.body",value:e.listLoading,expression:"listLoading",modifiers:{body:!0}}],attrs:{data:e.roleList,"element-loading-text":"loading",border:"",fit:"","highlight-current-row":""}},[i("el-table-column",{attrs:{label:"#",align:"center",width:"80"},scopedSlots:e._u([{key:"default",fn:function(t){return[i("span",{domProps:{textContent:e._s(e.getTableIndex(t.$index))}})]}}])}),e._v(" "),i("el-table-column",{attrs:{label:"角色名",align:"center",prop:"name"}}),e._v(" "),e.hasPermission("role:detail")||e.hasPermission("role:update")||e.hasPermission("role:delete")?i("el-table-column",{attrs:{label:"管理",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[e.hasPermission("role:detail")?i("el-button",{attrs:{type:"info",size:"mini"},nativeOn:{click:function(i){return i.preventDefault(),e.showRoleDialog(t.$index)}}},[e._v("查看")]):e._e(),e._v(" "),e.hasPermission("role:update")&&"超级管理员"!==t.row.name?i("el-button",{attrs:{type:"warning",size:"mini"},nativeOn:{click:function(i){return i.preventDefault(),e.showUpdateRoleDialog(t.$index)}}},[e._v("修改")]):e._e(),e._v(" "),e.hasPermission("role:delete")&&"超级管理员"!==t.row.name?i("el-button",{attrs:{type:"danger",size:"mini"},nativeOn:{click:function(i){return i.preventDefault(),e.removeRole(t.$index)}}},[e._v("删除")]):e._e()]}}],null,!1,1195019917)}):e._e()],1),e._v(" "),i("el-pagination",{attrs:{"current-page":e.listQuery.page,"page-size":e.listQuery.size,total:e.total,"page-sizes":[9,18,36,72],layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":e.handleSizeChange,"current-change":e.handleCurrentChange}}),e._v(" "),i("el-dialog",{attrs:{title:e.textMap[e.dialogStatus],visible:e.dialogFormVisible},on:{"update:visible":function(t){e.dialogFormVisible=t}}},[i("el-form",{ref:"tempRole",staticClass:"small-space",staticStyle:{width:"500px","margin-left":"50px"},attrs:{"status-icon":"","label-position":"left","label-width":"100px",model:e.tempRole,rules:e.createRules}},[i("el-form-item",{attrs:{label:"角色名",prop:"name",required:""}},[i("el-input",{attrs:{disabled:"show"===e.dialogStatus,type:"text","prefix-icon":"el-icon-edit","auto-complete":"off"},model:{value:e.tempRole.name,callback:function(t){e.$set(e.tempRole,"name",t)},expression:"tempRole.name"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"权限",required:""}},e._l(e.permissionList,function(t,s){return i("div",{key:s},[i("el-button",{attrs:{disabled:"show"===e.dialogStatus,size:"mini",type:e.isMenuNone(s)?"":e.isMenuAll(s)?"success":"primary"},nativeOn:{click:function(t){return t.preventDefault(),e.checkAll(s)}}},[e._v(e._s(t.resource))]),e._v(" "),i("el-checkbox-group",{model:{value:e.tempRole.permissionIdList,callback:function(t){e.$set(e.tempRole,"permissionIdList",t)},expression:"tempRole.permissionIdList"}},e._l(t.handleList,function(t){return i("el-checkbox",{key:t.id,attrs:{disabled:"show"===e.dialogStatus,label:t.id},on:{change:function(i){return e.handleChecked(t,e._index)}}},[i("span",[e._v(e._s(t.handle))])])}),1)],1)}),0)],1),e._v(" "),i("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{nativeOn:{click:function(t){t.preventDefault(),e.dialogFormVisible=!1}}},[e._v("取消")]),e._v(" "),"add"===e.dialogStatus?i("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(t){return t.preventDefault(),e.addRole(t)}}},[e._v("添加")]):e._e(),e._v(" "),"update"===e.dialogStatus?i("el-button",{attrs:{type:"primary",loading:e.btnLoading},nativeOn:{click:function(t){return t.preventDefault(),e.updateRole(t)}}},[e._v("更新")]):e._e()],1)],1)],1)},staticRenderFns:[]},u=i("VU/8")(r,d,!1,null,null,null);t.default=u.exports}});
//# sourceMappingURL=39.542a1ecc0e7146aff699.js.map