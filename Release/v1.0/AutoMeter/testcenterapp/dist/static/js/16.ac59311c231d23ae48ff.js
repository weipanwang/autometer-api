webpackJsonp([16],{"T+/8":function(e,n,o){"use strict";Object.defineProperty(n,"__esModule",{value:!0});var t=o("E4LH"),a={name:"login",data:function(){return{loading:!1,loginForm:{nameOrEmail:"",password:""},loginRules:{nameOrEmail:[{required:!0,trigger:"blur",validator:function(e,n,o){n.length<3?o(new Error("账户名长度必须在3或以上")):o()}}],password:[{required:!0,trigger:"blur",validator:function(e,n,o){n.length<6?o(new Error("密码长度必须在6或以上")):o()}}]},passwordType:"password",btnLoading:!1}},methods:{showPwd:function(){var e=this;"password"===this.passwordType?this.passwordType="":this.passwordType="password",this.$nextTick(function(){e.$refs.password.focus()})},handleLogin:function(){var e=this;this.$refs.loginForm.validate(function(n){if(n){var o={};Object(t.a)(e.loginForm.nameOrEmail)?o.email=e.loginForm.nameOrEmail:o.name=e.loginForm.nameOrEmail,o.password=e.loginForm.password,e.loading=!0,e.$store.dispatch("Login",o).then(function(){e.loading=!1,e.$router.push({path:"/dashboard"})})}})}}},s={render:function(){var e=this,n=e.$createElement,o=e._self._c||n;return o("div",{staticClass:"login-container"},[o("el-form",{ref:"loginForm",staticClass:"card-box login-form",attrs:{autocomplete:"on",model:e.loginForm,rules:e.loginRules,"status-icon":"","label-position":"left","label-width":"0px"}},[o("h3",{staticClass:"title"},[e._v("AutoMeter")]),e._v(" "),o("el-form-item",{attrs:{prop:"nameOrEmail"}},[o("span",{staticClass:"svg-container svg-container_login"},[o("icon-svg",{attrs:{"icon-class":"name"}})],1),e._v(" "),o("el-input",{attrs:{type:"text",autocomplete:"on",placeholder:"请输入账户名或邮箱"},nativeOn:{keyup:function(n){return!n.type.indexOf("key")&&e._k(n.keyCode,"enter",13,n.key,"Enter")?null:e.handleLogin(n)}},model:{value:e.loginForm.nameOrEmail,callback:function(n){e.$set(e.loginForm,"nameOrEmail",n)},expression:"loginForm.nameOrEmail"}})],1),e._v(" "),o("el-form-item",{attrs:{prop:"password"}},[o("span",{staticClass:"svg-container"},[o("icon-svg",{attrs:{"icon-class":"password"}})],1),e._v(" "),o("el-input",{attrs:{type:e.passwordType,autocomplete:"on",placeholder:"请输入密码"},nativeOn:{keyup:function(n){return!n.type.indexOf("key")&&e._k(n.keyCode,"enter",13,n.key,"Enter")?null:e.handleLogin(n)}},model:{value:e.loginForm.password,callback:function(n){e.$set(e.loginForm,"password",n)},expression:"loginForm.password"}}),e._v(" "),o("span",{staticClass:"show-pwd",on:{click:e.showPwd}},[o("svg-icon",{attrs:{"icon-class":"password"===e.passwordType?"eye":"eye-open"}})],1)],1),e._v(" "),o("el-form-item",[o("el-button",{staticStyle:{width:"100%"},attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(n){return n.preventDefault(),e.handleLogin(n)}}},[e._v("登录")])],1)],1)],1)},staticRenderFns:[]};var r=o("VU/8")(a,s,!1,function(e){o("yc/p")},null,null);n.default=r.exports},"yc/p":function(e,n){}});
//# sourceMappingURL=16.ac59311c231d23ae48ff.js.map