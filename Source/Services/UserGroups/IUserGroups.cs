﻿using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.ServiceModel.Web;
using Insight.Utils.Entity;

namespace Insight.Base.Services
{
    [ServiceContract]
    public interface IUserGroups
    {
        /// <summary>
        /// 根据对象实体数据新增一个用户组
        /// </summary>
        /// <param name="group">用户组对象</param>
        /// <returns>Result</returns>
        [WebInvoke(Method = "POST", UriTemplate = "groups", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        [OperationContract]
        Result AddGroup(UserGroup group);

        /// <summary>
        /// 根据ID删除用户组
        /// </summary>
        /// <param name="id">用户组ID</param>
        /// <returns>Result</returns>
        [WebInvoke(Method = "DELETE", UriTemplate = "groups/{id}", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        [OperationContract]
        Result RemoveGroup(string id);

        /// <summary>
        /// 根据对象实体数据更新用户组信息
        /// </summary>
        /// <param name="id">用户组ID</param>
        /// <param name="group">用户组对象</param>
        /// <returns>Result</returns>
        [WebInvoke(Method = "PUT", UriTemplate = "groups/{id}", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        [OperationContract]
        Result UpdateGroup(string id, UserGroup @group);

        /// <summary>
        /// 根据ID获取用户组对象实体
        /// </summary>
        /// <param name="id">用户组ID</param>
        /// <returns>Result</returns>
        [WebGet(UriTemplate = "groups/{id}", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Result GetGroup(string id);

        /// <summary>
        /// 获取全部用户组
        /// </summary>
        /// <param name="rows">每页行数</param>
        /// <param name="page">当前页</param>
        /// <returns>Result</returns>
        [WebGet(UriTemplate = "groups?rows={rows}&page={page}", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Result GetGroups(string rows, string page);

        /// <summary>
        /// 根据参数组集合批量插入用户组成员关系
        /// </summary>
        /// <param name="id">用户组ID</param>
        /// <param name="group">UserGroup</param>
        /// <returns>Result</returns>
        [WebInvoke(Method = "POST", UriTemplate = "groups/{id}/members", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        [OperationContract]
        Result AddGroupMember(string id, UserGroup group);

        /// <summary>
        /// 根据ID集合删除用户组成员关系
        /// </summary>
        /// <param name="id"></param>
        /// <param name="ids">户组成员关系ID集合</param>
        /// <returns>Result</returns>
        [WebInvoke(Method = "DELETE", UriTemplate = "groups/{id}/members", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        [OperationContract]
        Result RemoveMember(string id, List<Guid> ids);

        /// <summary>
        /// 根据ID获取组成员之外的全部用户
        /// </summary>
        /// <param name="id">用户组ID</param>
        /// <returns>Result</returns>
        [WebGet(UriTemplate = "groups/{id}/other", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Result GetOtherUser(string id);
    }
}
