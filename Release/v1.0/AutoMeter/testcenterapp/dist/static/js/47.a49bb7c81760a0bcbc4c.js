webpackJsonp([47],{"7hMP":function(e,t,i){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var n=i("Dd8w"),a=i.n(n),s=i("ggxm"),l=i("4I8B"),m=i("W/rB"),o=i("XcM5"),d=i("0xDb"),c=i("mKAx"),r=i("NYxO"),p={name:"环境部署",filters:{statusFilter:function(e){return{published:"success",draft:"gray",deleted:"danger"}[e]}},data:function(){return{id:null,itemKey:null,tmpenviromentid:"",tmpdeployunitid:"",tmpenviromentname:"",tmpdeployunitname:"",assembleList:[],macdepunitList:[],enviromentnameList:[],machinenameList:[],deployUnitList:[],listLoading:!1,total:0,dialogStatus:"add",deployunitVisible:!1,assembleVisible:!1,domianVisible:!1,dialogFormVisible:!1,textMap:{updateRole:"修改部署微服务,组件",update:"修改部署微服务,组件",add:"部署微服务,组件"},btnLoading:!1,tmpmacdepunit:{id:"",envid:"",machineid:"",depunitid:"",assembleid:"",assembletype:"",enviromentname:"",machinename:"",deployunitname:"",domain:"",visittype:"",creator:"",projectid:""},search:{page:1,size:10,enviromentname:null,depunitid:null,envid:null,deployunitname:null,projectid:""},searchproject:{projectid:""}}},computed:a()({},Object(r.b)(["name","sidebar","projectlist","projectid","projectname"])),created:function(){this.search.projectid=window.localStorage.getItem("pid"),this.searchproject.projectid=window.localStorage.getItem("pid"),this.getmacdepunitList(),this.getenviromentallList(),this.getmachineLists(),this.getdepunitLists(),this.getassembleLists()},activated:function(){this.getenviromentallList(),this.getmachineLists(),this.getdepunitLists(),this.getassembleLists()},methods:{unix2CurrentTime:d.b,selectChangedAandD:function(e){"组件"===e&&(this.deployunitVisible=!1,this.assembleVisible=!0),"微服务"===e&&(this.assembleVisible=!1,this.deployunitVisible=!0,this.domianVisible=!1),this.tmpmacdepunit.deployunitname="",this.tmpmacdepunit.assembleid="",this.tmpmacdepunit.depunitid="",this.tmpmacdepunit.visittype="",this.tmpmacdepunit.domain=""},selectChangedVisittype:function(e){"域名"===e&&(this.domianVisible=!0,this.tmpmacdepunit.domain=""),"ip"===e&&(this.domianVisible=!1,this.tmpmacdepunit.domain="/")},selectChangedEN:function(e){for(var t=0;t<this.enviromentnameList.length;t++)this.enviromentnameList[t].enviromentname===e&&(this.tmpmacdepunit.envid=this.enviromentnameList[t].id,this.search.envid=this.enviromentnameList[t].id)},selectChangedMN:function(e){for(var t=0;t<this.machinenameList.length;t++)this.machinenameList[t].machinename===e&&(this.tmpmacdepunit.machineid=this.machinenameList[t].id),console.log(this.machinenameList[t].id)},selectChangedDU:function(e){for(var t=0;t<this.deployUnitList.length;t++)this.deployUnitList[t].deployunitname===e&&(this.tmpmacdepunit.depunitid=this.deployUnitList[t].id,this.search.depunitid=this.deployUnitList[t].id);this.tmpmacdepunit.assembleid=""},selectChangedAS:function(e){for(var t=0;t<this.assembleList.length;t++)this.assembleList[t].assemblename===e&&(this.tmpmacdepunit.assembleid=this.assembleList[t].id);this.tmpmacdepunit.depunitid=""},resetquery:function(){var e=this;this.search.envid="",this.search.depunitid="",this.search.deployunitname="",this.search.enviromentname="",this.tmpenviromentid="",this.tmpdeployunitid="",Object(s.g)(this.search).then(function(t){e.macdepunitList=t.data.list,e.total=t.data.total,e.listLoading=!1}).catch(function(t){e.$message.error("加载环境部署列表失败")})},getmacdepunitList:function(){var e=this;this.listLoading=!0,this.search.enviromentname=this.tmpenviromentname,this.search.deployunitname=this.tmpdeployunitname,this.search.envid=this.tmpenviromentid,this.search.depunitid=this.tmpdeployunitid,Object(s.g)(this.search).then(function(t){e.macdepunitList=t.data.list,e.total=t.data.total,e.listLoading=!1}).catch(function(t){e.$message.error("加载环境部署列表失败")})},getenviromentallList:function(){var e=this;Object(m.c)(this.searchproject).then(function(t){e.enviromentnameList=t.data}).catch(function(t){e.$message.error("加载测试环境列表失败")})},getmachineLists:function(){var e=this;Object(l.b)(this.searchproject).then(function(t){e.machinenameList=t.data}).catch(function(t){e.$message.error("加载服务器列表失败")})},getdepunitLists:function(){var e=this;Object(o.e)(this.searchproject).then(function(t){e.deployUnitList=t.data,console.log(e.deployunitList)}).catch(function(t){e.$message.error("加载微服务列表失败")})},getassembleLists:function(){var e=this;Object(c.b)(this.searchproject).then(function(t){e.assembleList=t.data}).catch(function(t){e.$message.error("加载组件名列表失败")})},searchBy:function(){var e=this;this.search.page=1,this.listLoading=!0,Object(s.g)(this.search).then(function(t){e.itemKey=Math.random(),e.macdepunitList=t.data.list,e.total=t.data.total}).catch(function(t){e.$message.error("搜索失败")}),this.tmpenviromentname=this.search.enviromentname,this.tmpdeployunitname=this.search.deployunitname,this.tmpenviromentid=this.search.envid,this.tmpdeployunitid=this.search.depunitid,this.listLoading=!1,this.btnLoading=!1},handleSizeChange:function(e){this.search.page=1,this.search.size=e,this.getmacdepunitList()},handleCurrentChange:function(e){this.search.page=e,this.getmacdepunitList()},getIndex:function(e){return(this.search.page-1)*this.search.size+e+1},showAddmacdepunitDialog:function(){this.dialogFormVisible=!0,this.dialogStatus="add",this.tmpmacdepunit.id="",this.tmpmacdepunit.envid="",this.tmpmacdepunit.machineid="",this.tmpmacdepunit.assembleid="",this.tmpmacdepunit.depunitid="",this.tmpmacdepunit.machinename="",this.tmpmacdepunit.enviromentname="",this.tmpmacdepunit.deployunitname="",this.tmpmacdepunit.assembletype="",this.tmpmacdepunit.domain="",this.tmpmacdepunit.visittype="",this.tmpmacdepunit.creator=this.name,this.deployunitVisible=!1,this.assembleVisible=!1,this.domianVisible=!1},addmacdepunit:function(){var e=this;this.$refs.tmpmacdepunit.validate(function(t){t&&(e.btnLoading=!0,Object(s.b)(e.tmpmacdepunit).then(function(){e.$message.success("添加成功"),e.getmacdepunitList(),e.dialogFormVisible=!1,e.btnLoading=!1}).catch(function(t){e.$message.error("添加失败"),e.btnLoading=!1}))})},showUpdatemacdepunitDialog:function(e){this.dialogFormVisible=!0,this.dialogStatus="update",this.tmpmacdepunit.id=this.macdepunitList[e].id,this.tmpmacdepunit.envid=this.macdepunitList[e].envid,this.tmpmacdepunit.machineid=this.macdepunitList[e].machineid,this.tmpmacdepunit.depunitid=this.macdepunitList[e].depunitid,this.tmpmacdepunit.machinename=this.macdepunitList[e].machinename,this.tmpmacdepunit.enviromentname=this.macdepunitList[e].enviromentname,this.tmpmacdepunit.deployunitname=this.macdepunitList[e].deployunitname,this.tmpmacdepunit.assembletype=this.macdepunitList[e].assembletype,this.tmpmacdepunit.domain=this.macdepunitList[e].domain,this.tmpmacdepunit.assembleid=this.macdepunitList[e].assembleid,this.tmpmacdepunit.visittype=this.macdepunitList[e].visittype,this.tmpmacdepunit.creator=this.name,"组件"===this.tmpmacdepunit.assembletype&&(this.deployunitVisible=!1,this.assembleVisible=!0),"微服务"===this.tmpmacdepunit.assembletype&&(this.assembleVisible=!1,this.deployunitVisible=!0),"ip"===this.tmpmacdepunit.visittype&&(this.domianVisible=!1,this.tmpmacdepunit.domain="/"),"域名"===this.tmpmacdepunit.visittype&&(this.domianVisible=!0)},updatemacdepunit:function(){var e=this;this.$refs.tmpmacdepunit.validate(function(t){t&&("ip"===e.tmpmacdepunit.visittype&&(e.tmpmacdepunit.domain=""),"组件"===e.tmpmacdepunit.assembletype&&(e.tmpmacdepunit.depunitid=""),"微服务"===e.tmpmacdepunit.assembletype&&(e.tmpmacdepunit.assembleid=""),Object(s.i)(e.tmpmacdepunit).then(function(){e.$message.success("更新成功"),e.getmacdepunitList(),e.dialogFormVisible=!1}).catch(function(t){e.$message.error("更新失败")}))})},removemacdepunit:function(e){var t=this;this.$confirm("删除该测试环境？","警告",{confirmButtonText:"是",cancelButtonText:"否",type:"warning"}).then(function(){var i=t.macdepunitList[e].id;Object(s.f)(i).then(function(){t.$message.success("删除成功"),t.getmacdepunitList()})}).catch(function(){t.$message.info("已取消删除")})},isUniqueDetail:function(e){for(var t=0;t<this.macdepunitList.length;t++)if(this.macdepunitList[t].id!==e.id&&this.macdepunitList[t].enviromentname===e.enviromentname&&this.macdepunitList[t].machinename===e.machinename&&this.macdepunitList[t].deployunitname===e.deployunitname)return this.$message.error("服务器微服务已存在"),!1;return!0}}},u={render:function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"app-container"},[i("div",{staticClass:"filter-container"},[i("el-form",{attrs:{inline:!0}},[i("el-form-item",[e.hasPermission("macdepunit:list")?i("el-button",{attrs:{type:"success",size:"mini",icon:"el-icon-refresh"},nativeOn:{click:function(t){return t.preventDefault(),e.getmacdepunitList(t)}}},[e._v("刷新")]):e._e(),e._v(" "),e.hasPermission("macdepunit:list")?i("el-button",{attrs:{type:"primary",size:"mini",icon:"el-icon-refresh"},nativeOn:{click:function(t){return t.preventDefault(),e.resetquery(t)}}},[e._v("重置")]):e._e(),e._v(" "),e.hasPermission("macdepunit:add")?i("el-button",{attrs:{type:"primary",size:"mini",icon:"el-icon-plus"},nativeOn:{click:function(t){return t.preventDefault(),e.showAddmacdepunitDialog(t)}}},[e._v("添加环境部署")]):e._e()],1),e._v(" "),e.hasPermission("macdepunit:search")?i("span",[i("el-form-item",{attrs:{label:"测试环境",prop:"enviromentname"}},[i("el-select",{staticStyle:{width:"100%"},attrs:{clearable:"",filterable:"",placeholder:"测试环境名"},on:{change:function(t){return e.selectChangedEN(t)}},model:{value:e.search.enviromentname,callback:function(t){e.$set(e.search,"enviromentname",t)},expression:"search.enviromentname"}},e._l(e.enviromentnameList,function(e,t){return i("div",{key:t},[i("el-option",{attrs:{label:e.enviromentname,value:e.enviromentname,required:""}})],1)}),0)],1),e._v(" "),i("el-form-item",{attrs:{label:"微服务",prop:"deployunitname"}},[i("el-select",{staticStyle:{width:"100%"},attrs:{clearable:"",filterable:"",placeholder:"微服务"},on:{change:function(t){return e.selectChangedDU(t)}},model:{value:e.search.deployunitname,callback:function(t){e.$set(e.search,"deployunitname",t)},expression:"search.deployunitname"}},e._l(e.deployUnitList,function(e,t){return i("div",{key:t},[i("el-option",{attrs:{label:e.deployunitname,value:e.deployunitname,required:""}})],1)}),0)],1),e._v(" "),i("el-form-item",[i("el-button",{attrs:{type:"primary",loading:e.btnLoading},on:{click:e.searchBy}},[e._v("查询")])],1)],1):e._e()],1)],1),e._v(" "),i("el-table",{directives:[{name:"loading",rawName:"v-loading.body",value:e.listLoading,expression:"listLoading",modifiers:{body:!0}}],key:e.itemKey,attrs:{data:e.macdepunitList,"element-loading-text":"loading",border:"",fit:"","highlight-current-row":""}},[i("el-table-column",{attrs:{label:"编号",align:"center",width:"60"},scopedSlots:e._u([{key:"default",fn:function(t){return[i("span",{domProps:{textContent:e._s(e.getIndex(t.$index))}})]}}])}),e._v(" "),i("el-table-column",{attrs:{label:"测试环境",align:"center",prop:"enviromentname",width:"120"}}),e._v(" "),i("el-table-column",{attrs:{label:"服务器",align:"center",prop:"machinename",width:"100"}}),e._v(" "),i("el-table-column",{attrs:{label:"微服务,组件名",align:"center",prop:"deployunitname",width:"120"}}),e._v(" "),i("el-table-column",{attrs:{label:"组件类型",align:"center",prop:"assembletype",width:"70"}}),e._v(" "),i("el-table-column",{attrs:{label:"访问方式",align:"center",prop:"visittype",width:"70"}}),e._v(" "),i("el-table-column",{attrs:{label:"访问域名",align:"center",prop:"domain",width:"150"}}),e._v(" "),i("el-table-column",{attrs:{label:"操作人",align:"center",prop:"creator",width:"60"}}),e._v(" "),i("el-table-column",{attrs:{label:"创建时间",align:"center",prop:"createTime",width:"140"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e.unix2CurrentTime(t.row.createTime)))]}}])}),e._v(" "),i("el-table-column",{attrs:{label:"最后修改时间",align:"center",prop:"lastmodifyTime",width:"140"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e.unix2CurrentTime(t.row.lastmodifyTime))+"\n      ")]}}])}),e._v(" "),e.hasPermission("macdepunit:update")||e.hasPermission("macdepunit:delete")?i("el-table-column",{attrs:{label:"管理",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[e.hasPermission("macdepunit:update")&&t.row.id!==e.id?i("el-button",{attrs:{type:"warning",size:"mini"},nativeOn:{click:function(i){return i.preventDefault(),e.showUpdatemacdepunitDialog(t.$index)}}},[e._v("修改")]):e._e(),e._v(" "),e.hasPermission("macdepunit:delete")&&t.row.id!==e.id?i("el-button",{attrs:{type:"danger",size:"mini"},nativeOn:{click:function(i){return i.preventDefault(),e.removemacdepunit(t.$index)}}},[e._v("删除")]):e._e()]}}],null,!1,380402086)}):e._e()],1),e._v(" "),i("el-pagination",{attrs:{"current-page":e.search.page,"page-size":e.search.size,total:e.total,"page-sizes":[10,20,30,40],layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":e.handleSizeChange,"current-change":e.handleCurrentChange}}),e._v(" "),i("el-dialog",{attrs:{title:e.textMap[e.dialogStatus],visible:e.dialogFormVisible},on:{"update:visible":function(t){e.dialogFormVisible=t}}},[i("el-form",{ref:"tmpmacdepunit",staticClass:"small-space",staticStyle:{width:"400px","margin-left":"50px"},attrs:{"status-icon":"","label-position":"left","label-width":"120px",model:e.tmpmacdepunit}},[i("el-form-item",{attrs:{label:"测试环境",prop:"enviromentname",required:""}},[i("el-select",{staticStyle:{width:"100%"},attrs:{filterable:"",placeholder:"测试环境名"},on:{change:function(t){return e.selectChangedEN(t)}},model:{value:e.tmpmacdepunit.enviromentname,callback:function(t){e.$set(e.tmpmacdepunit,"enviromentname",t)},expression:"tmpmacdepunit.enviromentname"}},[i("el-option",{staticStyle:{display:"none"},attrs:{label:"请选择",value:"''"}}),e._v(" "),e._l(e.enviromentnameList,function(e,t){return i("div",{key:t},[i("el-option",{attrs:{label:e.enviromentname,value:e.enviromentname,required:""}})],1)})],2)],1),e._v(" "),i("el-form-item",{attrs:{label:"服务器",prop:"machinename",required:""}},[i("el-select",{staticStyle:{width:"100%"},attrs:{filterable:"",placeholder:"服务器"},on:{change:function(t){return e.selectChangedMN(t)}},model:{value:e.tmpmacdepunit.machinename,callback:function(t){e.$set(e.tmpmacdepunit,"machinename",t)},expression:"tmpmacdepunit.machinename"}},[i("el-option",{staticStyle:{display:"none"},attrs:{label:"请选择",value:"''"}}),e._v(" "),e._l(e.machinenameList,function(e,t){return i("div",{key:t},[i("el-option",{attrs:{label:e.machinename+" ："+e.ip,value:e.machinename,required:""}})],1)})],2)],1),e._v(" "),i("el-form-item",{attrs:{label:"组件类型",prop:"assembletype",required:""}},[i("el-select",{staticStyle:{width:"100%"},attrs:{placeholder:"组件类型"},on:{change:function(t){return e.selectChangedAandD(t)}},model:{value:e.tmpmacdepunit.assembletype,callback:function(t){e.$set(e.tmpmacdepunit,"assembletype",t)},expression:"tmpmacdepunit.assembletype"}},[i("el-option",{attrs:{label:"组件",value:"组件"}}),e._v(" "),i("el-option",{attrs:{label:"微服务",value:"微服务"}})],1)],1),e._v(" "),e.deployunitVisible?i("div",[i("el-form-item",{attrs:{label:"微服务",prop:"deployunitname",required:""}},[i("el-select",{staticStyle:{width:"100%"},attrs:{filterable:"",placeholder:"微服务"},on:{change:function(t){return e.selectChangedDU(t)}},model:{value:e.tmpmacdepunit.deployunitname,callback:function(t){e.$set(e.tmpmacdepunit,"deployunitname",t)},expression:"tmpmacdepunit.deployunitname"}},[i("el-option",{staticStyle:{display:"none"},attrs:{label:"请选择",value:"''"}}),e._v(" "),e._l(e.deployUnitList,function(e,t){return i("div",{key:t},[i("el-option",{attrs:{label:e.deployunitname,value:e.deployunitname,required:""}})],1)})],2)],1),e._v(" "),i("el-form-item",{attrs:{label:"访问方式",prop:"visittype",required:""}},[i("el-select",{staticStyle:{width:"100%"},attrs:{placeholder:"访问方式"},on:{change:function(t){return e.selectChangedVisittype(t)}},model:{value:e.tmpmacdepunit.visittype,callback:function(t){e.$set(e.tmpmacdepunit,"visittype",t)},expression:"tmpmacdepunit.visittype"}},[i("el-option",{attrs:{label:"ip",value:"ip"}}),e._v(" "),i("el-option",{attrs:{label:"域名",value:"域名"}})],1)],1),e._v(" "),e.domianVisible?i("div",[i("el-form-item",{attrs:{label:"访问域名",prop:"domain",required:""}},[i("el-input",{attrs:{placeholder:"访问域名",required:""},model:{value:e.tmpmacdepunit.domain,callback:function(t){e.$set(e.tmpmacdepunit,"domain",t)},expression:"tmpmacdepunit.domain"}})],1)],1):e._e()],1):e._e(),e._v(" "),e.assembleVisible?i("div",[i("el-form-item",{attrs:{label:"组件",prop:"deployunitname",required:""}},[i("el-select",{staticStyle:{width:"100%"},attrs:{filterable:"",placeholder:"组件"},on:{change:function(t){return e.selectChangedAS(t)}},model:{value:e.tmpmacdepunit.deployunitname,callback:function(t){e.$set(e.tmpmacdepunit,"deployunitname",t)},expression:"tmpmacdepunit.deployunitname"}},[i("el-option",{staticStyle:{display:"none"},attrs:{label:"请选择",value:"''"}}),e._v(" "),e._l(e.assembleList,function(e,t){return i("div",{key:t},[i("el-option",{attrs:{label:e.assemblename,value:e.assemblename,required:""}})],1)})],2)],1),e._v(" "),i("el-form-item",{attrs:{label:"访问方式",prop:"visittype",required:""}},[i("el-select",{staticStyle:{width:"100%"},attrs:{placeholder:"访问方式"},on:{change:function(t){return e.selectChangedVisittype(t)}},model:{value:e.tmpmacdepunit.visittype,callback:function(t){e.$set(e.tmpmacdepunit,"visittype",t)},expression:"tmpmacdepunit.visittype"}},[i("el-option",{attrs:{label:"ip",value:"ip"}}),e._v(" "),i("el-option",{attrs:{label:"域名",value:"域名"}})],1)],1),e._v(" "),e.domianVisible?i("div",[i("el-form-item",{attrs:{label:"访问域名",prop:"domain",required:""}},[i("el-input",{attrs:{maxlength:"110",placeholder:"访问域名",required:""},model:{value:e.tmpmacdepunit.domain,callback:function(t){e.$set(e.tmpmacdepunit,"domain",t)},expression:"tmpmacdepunit.domain"}})],1)],1):e._e()],1):e._e()],1),e._v(" "),i("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{nativeOn:{click:function(t){t.preventDefault(),e.dialogFormVisible=!1}}},[e._v("取消")]),e._v(" "),"add"===e.dialogStatus?i("el-button",{attrs:{type:"danger"},nativeOn:{click:function(t){return t.preventDefault(),e.$refs.tmpmacdepunit.resetFields()}}},[e._v("重置")]):e._e(),e._v(" "),"add"===e.dialogStatus?i("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(t){return t.preventDefault(),e.addmacdepunit(t)}}},[e._v("添加")]):e._e(),e._v(" "),"update"===e.dialogStatus?i("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(t){return t.preventDefault(),e.updatemacdepunit(t)}}},[e._v("修改")]):e._e()],1)],1)],1)},staticRenderFns:[]},h=i("VU/8")(p,u,!1,null,null,null);t.default=h.exports}});
//# sourceMappingURL=47.a49bb7c81760a0bcbc4c.js.map