Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D342557DD2
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbiFWOcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbiFWOcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:41 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9B1457AA;
        Thu, 23 Jun 2022 07:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDNHBCvQ4Nc2LN3asI1BU3fRuPOZkukPeAQMy0BrUi8YgvLaRRmVbJxBHvUsyWcB0Y9F9wITqd94POjQmGDPSTZrVsSXsLKwakMgO3EJKJjSrhCpJ015a2D30lymgNUPfHO/vHBvwLzXdDr7BN7lQ/+LpiiFkDA3tyLiFX7JPme3WHVGze4PaklqpM4/ODcL/pQURjvzt8WYmitcnfVGt4Oa05SGy5nH6J7o+ozKdnimoIW97nkd5FjEg3kfQ1oGZ7v9nXBC43QySF/x+U/YVgnFv0GjQYzZjOv2EOTj/4e9CBHQRq81z5j1oFSHjwyo3UZZr50jqHokbxDDAPHQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In39yv0Hk3bYJziAmxDHDUxCdetp9/Gqgw3rkdnn+Jo=;
 b=kQnUYGeZ6Ssg1/L0rkFgCawJEWFajUJ0MO01kNbC/XnU5c9PpEBD7/V2+bDEzdqQN9ORM2Q1VnE0DMeGRl7UbHDbB0IgelJggWxTT20hAnKPlcGa9UPT2MJc/adTBbQNQA2mr1cLQqvOGYgvYMrAB093LL5vmSYGdON/jCE+IRpytIEKAQmRmohd3O9JMhETwX+/WfDhPRQXGuYAiE3+UKJpptiqqSIUkVp5Qh2HgE8jhqHraBRxgkrp17ZTCbwsWQgT9WSYiLuxRU4v2JklaSgvf1LP1bEhadGRiUI5pdS2/CTZjejF3jyDhsEU0IbvTZTHtEGxMTQx48/LZ8zLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In39yv0Hk3bYJziAmxDHDUxCdetp9/Gqgw3rkdnn+Jo=;
 b=CnGHDc+9gy0S0y0pLpCzg6V4RQOADzHfNL7TwuVQydtD2f1xzfcdtzoSfnkmtZrUTGQsHBhRqsmjr/7F3G1oCvuiMDFQFGUXFkMLCFlvTcmes4ebr3Ux3KLmCckHeLCc9M9QzWjdA+A3Szeq1FjeXY3djy7bjHZmzk2mzZTH++U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VI1PR0401MB2288.eurprd04.prod.outlook.com (2603:10a6:800:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 14:32:33 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:33 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 04/14] v4l2-ctrls: allocate space for arrays
Date:   Thu, 23 Jun 2022 16:31:05 +0200
Message-Id: <20220623143115.3185297-5-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
References: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 338cb676-81d6-4425-80d5-08da552535b7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2288:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2288F162E22DB84F5B74EF7ABAB59@VI1PR0401MB2288.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lDol/QYQ+Yi8e+ej+lWclb16zGHalq2il0B4T7D5zZA7ecFzCdPPWQBxVbMVlM72JNv4b7eEIiwzcgoWwyV/4l5O/Kp9X1Rrm8UQZzjtUzJwljbW7F+MUkJh0GfHJp0VB7MIqmAxU/qK05iOC5nQJgXPSGGwwgKhBSoTjmlpF8eCM9GONA6rWnor1lC+PZXsm8CsVnJ1zgUFaa7PZ5FTZQURP8G+ehzVCVHP1FP3hb1pBt8E+4GLi7862pU26Vg0BJulkuE8IFZmkUQqD0DR7PsuuDmJbxrYFGpI1ayvxZ3bAf8vUlMeZopdw8eYImPrjfPlpMi8UAcKdZXvLbqtgRHURu4QpAlxaPURnzI5Pe+D8C1Rct6Plu2R3TW4WxTwwOF+fif6cCA//Vpmfd6XqLRDnKsFzCncYAwL2881ppqcxrCWoksowYWmwhjN6v4WtDUwiAEOz4rrHMpa9wU0/I3tVaQQdz3Vcz0ngbAevK/JrEmnfGK+uVWTnzq//yAN4n1j3croMbHLOgBLXcZKWe/1HrzeNTqUjIt4xBlVRejBvFmZ6row2VeoraOjJRzC8pTJQWS2U0gTlBniE0q9DcOkdwbReSH8bcvB3rDVCNLlO6Af+f2CN3yum/XDmERKzFq/rT2vGvNbLe4793ctxPPcsLdOydv/s/jdlngrRClznnvVO6noIcbDcgJw3DTjvPD7AhRVHKZ4aYCvPJMu0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(52116002)(66476007)(4326008)(6506007)(86362001)(2616005)(38100700002)(6666004)(41300700001)(66556008)(8676002)(66946007)(2906002)(316002)(1076003)(44832011)(478600001)(8936002)(83380400001)(7416002)(6512007)(5660300002)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+rAiW2pfWgwFchX9PXAJXo+0BP55CFkZH0cGuv6eOk9dk3ymmKu/WXdVYhgt?=
 =?us-ascii?Q?A6w4a9CkcANsmvVNAHzyQG5LPHajVaTzrYQyq+nUznBXSsk7ZDjqs929eoxI?=
 =?us-ascii?Q?D/FToKg2wW5lUoyIovZM8s3lbDIZL6WEXHyffYihXZvqmAy+EKKm3rlkXx7G?=
 =?us-ascii?Q?6MBJv/IlaqMYX5RXih7jK49FQB2lYKWKARuXomNyDb90YJdq7RGNdALGTIGI?=
 =?us-ascii?Q?uoa1ynnWwZ2qY/iSJWemNopb1QGxxvTuYLZr5MFE61sqLvr8pd4nuI7U4Pnc?=
 =?us-ascii?Q?6xlCXHg59mPk6S1jmoZkwWGzEXXtLoKhjdaYNIFGcyj+AsypVhkl2eW6r0pJ?=
 =?us-ascii?Q?VudBIegQG0Ll/mWifRYorRdea5v1+H6/uvowQfvFofIGb54l6BnBRpc1fCmg?=
 =?us-ascii?Q?c5buQ9fbaIc2mxQT/OliFEd7Ik3tgt1XGlYT5FBFqawm+9lz56FjIYsd6Gey?=
 =?us-ascii?Q?Tof9PjR2Pnr+Z4UY1spbqHVervYzWRV9udsgqtAEgR+rY1FbgoWPWBx9plrP?=
 =?us-ascii?Q?9Qiy0yYxKIhTIY1Y5IqVoaqkMfMbPB1G3KWNBf0WUrlVJUyE3Dw0OTdFGjdu?=
 =?us-ascii?Q?dDOfhiE7ixQl0FVXhtF79QB7NbXI8qWVxCn6tH7MQTFx1tje5BEtdRugl/S2?=
 =?us-ascii?Q?+FOFBvkl7MpGlcrRGPR/4a+Fizm0vx2Nn9+CaNGnNNW0FKHsm9Mdid7BIa7A?=
 =?us-ascii?Q?Tz2YNfmKJbGmJG+k4YfyTDHfEHFNNRrB4gSarqRaTFOQ9tCWtXTFV2T3b/9V?=
 =?us-ascii?Q?J+4JxtN2L2yxdYkrPQ9yER5+q76nb+odUsowdt9k2quaHw4slVbZES4k8GBf?=
 =?us-ascii?Q?GM4BHhpUgmxsAoZxRp8X8JsE84AyNrvmouAACjj8PeNR6ameEfpOMzcyWRhm?=
 =?us-ascii?Q?idUckYTQnm21y5yLZvZ6Gnqo7T4T4SyXx8+uSKhXSdJ2iKkth5sqdKEt2Iyi?=
 =?us-ascii?Q?KqiA0ale5saJzDvPldUYd3vO4JMG8Y7ZMy3El7B/BcXqeS0SKiAoFaCvrnAb?=
 =?us-ascii?Q?X32HJqtxLddxlFaxaE5iicqVoge+F78m6EqwKKpsDEn6XUOcGXK5rNXRGaJQ?=
 =?us-ascii?Q?VmNwrLEadsYeVN/rmkK5Ue6NEWIvpgLH8ojlTi2tMpW0OiKtOzsBO4y0xJYd?=
 =?us-ascii?Q?7RC1IIfBDQtcX/ufiAiQOx6KgVezuhDkkpg+ZqE3phAsLszUDKkj7Ajn8KvV?=
 =?us-ascii?Q?H5j/uYJ1wLm5A3761kN99mism4FVhGTR32X2C+LmOUBTyQ33pQpDXyz9RyW3?=
 =?us-ascii?Q?PHG62c4mIyFiLq83+m/+HAZ82whRLs5v/pz8bGb2dnNB7HP/LCXvMqERFWRQ?=
 =?us-ascii?Q?Ts5nLWTILO2HhFCwvf4sJoIOiABO3zyYuAO5rgzJNaOxXFGKZJRAh4E1Ae0k?=
 =?us-ascii?Q?xYy92HP92Rj1BndXCaNHJ6lu3cZ86y61B26/gzBFdJlWd1MNpdnkbvZjFJlk?=
 =?us-ascii?Q?a9flzdnrEwubGTJwsriKeG0b4MhEo4Qk4oqosenmDsfn7FvtLWyFAHIJlAKA?=
 =?us-ascii?Q?0OtnKFng7iZlJmFkOhIr1fdKduFqxOvAlHyiLiRsEjhXjIAOXQC/83hvQS8I?=
 =?us-ascii?Q?6gTNRnVkzICl4hCUEYR4iH3qUDVepXvaNoHeKgkfLEoUa8ON3nLYKtkxUaCK?=
 =?us-ascii?Q?nPhaK5w8QT/RGF7Yiz5IDy4oRdWaLoWTPHBDsa+rd3Ul0FY0FQvk88kzsxyU?=
 =?us-ascii?Q?EtSwiKGf9HxR5HkiceFib9R6qkYzwfwjfou/tqnvyORNTo+JFHcsVRHMadyS?=
 =?us-ascii?Q?WGff+84wgESqAOPzUwnPV+7/jVYbvVFZvLzymj3QMDqc7UUYvWud+QAUoOmr?=
X-MS-Exchange-AntiSpam-MessageData-1: iwBxJLbptK0esKqjVX8Cf4ns6ubz3ED6y2c=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338cb676-81d6-4425-80d5-08da552535b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:33.0809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKOHd2FBTsMNfxwatGItdeUx+2F4afOMnu9Eyefd3ipldc9XJXUAZKoMb1lQhMy4Dflctt+8VWUvnSU+pe8oOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2288
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Just like dynamic arrays, also allocate space for regular arrays.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  8 +++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 33 +++++++++++------------
 include/media/v4l2-ctrls.h                | 17 ++++++------
 3 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 50d012ba3c02..1b90bd7c4010 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -105,8 +105,8 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 
 	ctrl->is_new = 0;
 	if (ctrl->is_dyn_array &&
-	    c->size > ctrl->p_dyn_alloc_elems * ctrl->elem_size) {
-		void *old = ctrl->p_dyn;
+	    c->size > ctrl->p_array_alloc_elems * ctrl->elem_size) {
+		void *old = ctrl->p_array;
 		void *tmp = kvzalloc(2 * c->size, GFP_KERNEL);
 
 		if (!tmp)
@@ -115,8 +115,8 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 		memcpy(tmp + c->size, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
 		ctrl->p_new.p = tmp;
 		ctrl->p_cur.p = tmp + c->size;
-		ctrl->p_dyn = tmp;
-		ctrl->p_dyn_alloc_elems = c->size / ctrl->elem_size;
+		ctrl->p_array = tmp;
+		ctrl->p_array_alloc_elems = c->size / ctrl->elem_size;
 		kvfree(old);
 	}
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index ff8a61f24d0a..1372b7b45681 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1135,14 +1135,14 @@ int req_to_new(struct v4l2_ctrl_ref *ref)
 
 	/*
 	 * Check if the number of elements in the request is more than the
-	 * elements in ctrl->p_dyn. If so, attempt to realloc ctrl->p_dyn.
-	 * Note that p_dyn is allocated with twice the number of elements
+	 * elements in ctrl->p_array. If so, attempt to realloc ctrl->p_array.
+	 * Note that p_array is allocated with twice the number of elements
 	 * in the dynamic array since it has to store both the current and
 	 * new value of such a control.
 	 */
-	if (ref->p_req_elems > ctrl->p_dyn_alloc_elems) {
+	if (ref->p_req_elems > ctrl->p_array_alloc_elems) {
 		unsigned int sz = ref->p_req_elems * ctrl->elem_size;
-		void *old = ctrl->p_dyn;
+		void *old = ctrl->p_array;
 		void *tmp = kvzalloc(2 * sz, GFP_KERNEL);
 
 		if (!tmp)
@@ -1151,8 +1151,8 @@ int req_to_new(struct v4l2_ctrl_ref *ref)
 		memcpy(tmp + sz, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
 		ctrl->p_new.p = tmp;
 		ctrl->p_cur.p = tmp + sz;
-		ctrl->p_dyn = tmp;
-		ctrl->p_dyn_alloc_elems = ref->p_req_elems;
+		ctrl->p_array = tmp;
+		ctrl->p_array_alloc_elems = ref->p_req_elems;
 		kvfree(old);
 	}
 
@@ -1252,7 +1252,7 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 		list_del(&ctrl->node);
 		list_for_each_entry_safe(sev, next_sev, &ctrl->ev_subs, node)
 			list_del(&sev->node);
-		kvfree(ctrl->p_dyn);
+		kvfree(ctrl->p_array);
 		kvfree(ctrl);
 	}
 	kvfree(hdl->buckets);
@@ -1584,11 +1584,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
 	else if (type == V4L2_CTRL_TYPE_CTRL_CLASS)
 		flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	else if (!(flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY) &&
+	else if (!is_array &&
 		 (type == V4L2_CTRL_TYPE_INTEGER64 ||
 		  type == V4L2_CTRL_TYPE_STRING ||
-		  type >= V4L2_CTRL_COMPOUND_TYPES ||
-		  is_array))
+		  type >= V4L2_CTRL_COMPOUND_TYPES))
 		sz_extra += 2 * tot_ctrl_size;
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
@@ -1632,14 +1631,14 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	ctrl->cur.val = ctrl->val = def;
 	data = &ctrl[1];
 
-	if (ctrl->is_dyn_array) {
-		ctrl->p_dyn_alloc_elems = elems;
-		ctrl->p_dyn = kvzalloc(2 * elems * elem_size, GFP_KERNEL);
-		if (!ctrl->p_dyn) {
+	if (ctrl->is_array) {
+		ctrl->p_array_alloc_elems = elems;
+		ctrl->p_array = kvzalloc(2 * elems * elem_size, GFP_KERNEL);
+		if (!ctrl->p_array) {
 			kvfree(ctrl);
 			return NULL;
 		}
-		data = ctrl->p_dyn;
+		data = ctrl->p_array;
 	}
 
 	if (!ctrl->is_int) {
@@ -1651,7 +1650,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const) {
-		if (ctrl->is_dyn_array)
+		if (ctrl->is_array)
 			ctrl->p_def.p = &ctrl[1];
 		else
 			ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
@@ -1664,7 +1663,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	if (handler_new_ref(hdl, ctrl, NULL, false, false)) {
-		kvfree(ctrl->p_dyn);
+		kvfree(ctrl->p_array);
 		kvfree(ctrl);
 		return NULL;
 	}
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index f4105de8a8d2..a2f147873265 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -209,7 +209,7 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  * @elem_size:	The size in bytes of the control.
  * @new_elems:	The number of elements in p_new. This is the same as @elems,
  *		except for dynamic arrays. In that case it is in the range of
- *		1 to @p_dyn_alloc_elems.
+ *		1 to @p_array_alloc_elems.
  * @dims:	The size of each dimension.
  * @nr_of_dims:The number of dimensions in @dims.
  * @menu_skip_mask: The control's skip mask for menu controls. This makes it
@@ -233,12 +233,11 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		not freed when the control is deleted. Should this be needed
  *		then a new internal bitfield can be added to tell the framework
  *		to free this pointer.
- * @p_dyn:	Pointer to the dynamically allocated array. Only valid if
- *		@is_dyn_array is true.
- * @p_dyn_alloc_elems: The number of elements in the dynamically allocated
- *		array for both the cur and new values. So @p_dyn is actually
- *		sized for 2 * @p_dyn_alloc_elems * @elem_size. Only valid if
- *		@is_dyn_array is true.
+ * @p_array:	Pointer to the allocated array. Only valid if @is_array is true.
+ * @p_array_alloc_elems: The number of elements in the allocated
+ *		array for both the cur and new values. So @p_array is actually
+ *		sized for 2 * @p_array_alloc_elems * @elem_size. Only valid if
+ *		@is_array is true.
  * @cur:	Structure to store the current value.
  * @cur.val:	The control's current value, if the @type is represented via
  *		a u32 integer (see &enum v4l2_ctrl_type).
@@ -297,8 +296,8 @@ struct v4l2_ctrl {
 	};
 	unsigned long flags;
 	void *priv;
-	void *p_dyn;
-	u32 p_dyn_alloc_elems;
+	void *p_array;
+	u32 p_array_alloc_elems;
 	s32 val;
 	struct {
 		s32 val;
-- 
2.36.1

