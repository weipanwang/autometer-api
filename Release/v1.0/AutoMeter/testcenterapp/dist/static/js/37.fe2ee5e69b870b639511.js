webpackJsonp([37],{"14CG":function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var o=a("Dd8w"),n=a.n(o),s=a("IcnI"),r=a("nv77"),i=a("0xDb"),l=a("E4LH"),d=a("q2Iq"),c=a("NYxO"),u={created:function(){this.setDetail()},data:function(){var t=this;return{loading:!1,btnLoading:!1,dialogFormVisible:!1,toUpdate:!1,tmpPassword:{oldPassword:"",newPassword:"",newPassword2:""},updatePasswordRules:{oldPassword:[{required:!0,trigger:"blur",validator:function(e,a,o){a.length<6&&o(new Error("密码长度必须在6或以上")),t.validateOldPassword(a).then(function(t){t?o():o(new Error("旧密码不正确"))})}}],newPassword:[{required:!0,trigger:"blur",validator:function(e,a,o){a.length<6?o(new Error("密码长度必须在6或以上")):t.isOldNewPasswordSame()?o(new Error("新旧密码不能一样")):o()}}],newPassword2:[{required:!0,trigger:"blur",validator:function(e,a,o){a.length<6?o(new Error("密码长度必须在6或以上")):t.isNewPasswordSame()?o():o(new Error("两次输入的密码不一致"))}}]},tmpAccount:{id:"",name:"",email:""},updateDetailRules:{name:[{required:!0,trigger:"blur",validator:function(t,e,a){e.length<3?a(new Error("账户名长度必须在3或以上")):a()}}],email:[{required:!0,trigger:"blur",validator:function(t,e,a){Object(l.a)(e)?a():a(new Error("邮箱格式错误"))}}]}}},computed:n()({},Object(c.c)({account:function(t){return t.account}})),methods:{unix2CurrentTime:i.b,setDetail:function(){this.tmpAccount.name=this.account.name,this.tmpAccount.email=this.account.email},validateOldPassword:function(t){var e={id:this.account.accountId,password:t};return Object(r.k)(e).then(function(t){return t.data})},isOldNewPasswordSame:function(){return this.tmpPassword.oldPassword===this.tmpPassword.newPassword},isNewPasswordSame:function(){return this.tmpPassword.newPassword===this.tmpPassword.newPassword2},resetToken:function(t){Object(d.c)(t),this.account.token=t},regainAccountDetail:function(){var t=this;this.loading=!0,this.btnLoading=!0,s.a.dispatch("Detail").then(function(){t.loading=!1,t.btnLoading=!1})},updateAccount:function(t){var e=this;this.btnLoading=!0,Object(r.j)(t).then(function(t){e.$message.success("更新成功"),e.resetToken(t.data),e.regainAccountDetail(),e.btnLoading=!1}).catch(function(t){e.$message.error("更新失败")})},updateDetail:function(){var t=this;this.$refs.tmpAccount.validate(function(e){e&&(t.tmpAccount.id=t.account.accountId,t.updateAccount(t.tmpAccount))})},showUpdatePasswordDialog:function(){this.dialogFormVisible=!0,this.tmpPassword.oldPassword="",this.tmpPassword.newPassword="",this.tmpPassword.newPassword2=""},updatePassword:function(){var t=this;this.$refs.tmpPassword.validate(function(e){if(e){var a={};a.id=t.account.accountId,a.password=t.tmpPassword.newPassword,t.updateAccount(a),t.dialogFormVisible=!1}})}}},p={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"app-container"},[a("el-form",{directives:[{name:"loading",rawName:"v-loading.body",value:t.loading,expression:"loading",modifiers:{body:!0}}],ref:"tmpAccount",attrs:{model:t.tmpAccount,rules:t.updateDetailRules,"label-width":"115px"}},[a("el-row",{attrs:{gutter:18}},[a("el-col",{attrs:{span:9}},[a("el-form-item",{attrs:{label:"账户名",prop:"name"}},[t.toUpdate?a("el-input",{model:{value:t.tmpAccount.name,callback:function(e){t.$set(t.tmpAccount,"name",e)},expression:"tmpAccount.name"}}):a("span",[t._v(t._s(t.tmpAccount.name))])],1)],1),t._v(" "),a("el-col",{attrs:{span:9}},[a("el-form-item",{attrs:{label:"邮箱",prop:"email"}},[t.toUpdate?a("el-input",{model:{value:t.tmpAccount.email,callback:function(e){t.$set(t.tmpAccount,"email",e)},expression:"tmpAccount.email"}}):a("span",[t._v(t._s(t.tmpAccount.email))])],1)],1)],1),t._v(" "),a("el-row",{attrs:{gutter:18}},[a("el-col",{attrs:{span:9}},[a("el-form-item",{attrs:{label:"注册时间"}},[a("span",[t._v(t._s(t.unix2CurrentTime(t.account.registerTime)))])])],1),t._v(" "),a("el-col",{attrs:{span:9}},[a("el-form-item",{attrs:{label:"最后登录时间"}},[a("span",[t._v(t._s(t.unix2CurrentTime(t.account.loginTime)))])])],1)],1),t._v(" "),a("el-form-item",[a("el-row",{attrs:{gutter:18}},[a("el-col",{attrs:{span:6}},[a("el-button",{attrs:{type:"success",loading:t.btnLoading},nativeOn:{click:function(e){return e.preventDefault(),t.regainAccountDetail(e)}}},[t._v("重新获取信息")])],1),t._v(" "),t.toUpdate?a("el-col",{attrs:{span:6}},[a("el-button",{attrs:{type:"primary",loading:t.btnLoading},nativeOn:{click:function(e){return e.preventDefault(),t.updateDetail(e)}}},[t._v("确认修改")]),t._v(" "),a("el-button",{attrs:{type:"warning"},nativeOn:{click:function(e){e.preventDefault(),t.toUpdate=!t.toUpdate}}},[t._v("取消修改")])],1):a("el-col",{attrs:{span:6}},[a("el-button",{attrs:{type:"primary",loading:t.btnLoading},nativeOn:{click:function(e){e.preventDefault(),t.toUpdate=!t.toUpdate}}},[t._v("修改信息")])],1),t._v(" "),a("el-col",{attrs:{span:6}},[a("el-button",{attrs:{type:"danger"},nativeOn:{click:function(e){return e.preventDefault(),t.showUpdatePasswordDialog(e)}}},[t._v("修改密码")])],1)],1)],1)],1),t._v(" "),a("el-dialog",{attrs:{title:"修改密码",visible:t.dialogFormVisible},on:{"update:visible":function(e){t.dialogFormVisible=e}}},[a("el-form",{ref:"tmpPassword",staticClass:"small-space",staticStyle:{width:"400px","margin-left":"50px"},attrs:{"status-icon":"","label-position":"left","label-width":"115px",model:t.tmpPassword,rules:t.updatePasswordRules}},[a("el-form-item",{attrs:{label:"旧密码",prop:"oldPassword",required:""}},[a("el-input",{attrs:{type:"password","prefix-icon":"el-icon-edit","auto-complete":"off",placeholder:"请输入旧密码"},model:{value:t.tmpPassword.oldPassword,callback:function(e){t.$set(t.tmpPassword,"oldPassword",e)},expression:"tmpPassword.oldPassword"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"新密码",prop:"newPassword",required:""}},[a("el-input",{attrs:{type:"password","prefix-icon":"el-icon-edit","auto-complete":"off",placeholder:"请输入新密码"},model:{value:t.tmpPassword.newPassword,callback:function(e){t.$set(t.tmpPassword,"newPassword",e)},expression:"tmpPassword.newPassword"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"新密码",prop:"newPassword2",required:""}},[a("el-input",{attrs:{type:"password","prefix-icon":"el-icon-edit","auto-complete":"off",placeholder:"请再次输入新密码"},model:{value:t.tmpPassword.newPassword2,callback:function(e){t.$set(t.tmpPassword,"newPassword2",e)},expression:"tmpPassword.newPassword2"}})],1)],1),t._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{nativeOn:{click:function(e){e.preventDefault(),t.dialogFormVisible=!1}}},[t._v("取消")]),t._v(" "),a("el-button",{attrs:{type:"danger"},nativeOn:{click:function(e){return e.preventDefault(),t.$refs.tmpPassword.resetFields()}}},[t._v("重置")]),t._v(" "),a("el-button",{attrs:{type:"primary",loading:t.btnLoading},nativeOn:{click:function(e){return e.preventDefault(),t.updatePassword(e)}}},[t._v("更新")])],1)],1)],1)},staticRenderFns:[]},m=a("VU/8")(u,p,!1,null,null,null);e.default=m.exports}});
//# sourceMappingURL=37.fe2ee5e69b870b639511.js.map