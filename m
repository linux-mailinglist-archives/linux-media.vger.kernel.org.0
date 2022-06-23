Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E659557DE4
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbiFWOcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbiFWOcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:42 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC74457AA;
        Thu, 23 Jun 2022 07:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSoOwPkWjZgiwo2Cu2nHa8NN9jMVwlsLKjE5umSzUNxPGGFG+51KrAEQRVXPCAo+Nq7zWiDmzqDa6dzUgSuOjey00wYW5nS+ZCbm2i5Sn8ejSWp39FjWsGKWTjtughmZEmd943UKiFDGEBYSZgZW3Rjvo1RLu2hZ8WTyG88oVssqt+s+1sERRZxL9lGyo+GItRa5bMdD/yjZ4eGljQaOikW6mObjC7zrikwov1pKk8W7OZX0Sw15g4JxxlxVsN+F4GZsLJg841OOYiZuLkCOXjETBrlqB3Ml1JF3+n9NBaX+41bfCi6G77/K45ePmCYv1nrfEBOLHddMW/GJQY8gtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSI8Zchlb7oA/SbVZyz06UYEGIKzGCEke9peESwjz38=;
 b=mOQG8lTFU+nW56rkkfvAOS1mEQo99OWmPPU3zhxX3cH/AYjXyvCQcVA+y2HsqFKwh1UhY3YimO7hYG6PsNwPexDYS0ZfVG8kFyP8kMB9gNsWmHMyW/melfNnecLNyeUrEN9PHmv7NPQ6ZW8xqJ1gNlWKBPBfKhOHa5o0Cd/JWjIUjNuxeAyjLpTM5fqL9VxTiGCPgxisFfQAxy6xenklqQYWcG8yp5MkIFwfOiqG6IOXpJRaX9JyuGrbgZbnJJErd2PK4lOK1qp7iC23YLbaPWXA2Lek3XsFNz34LI+8M7jlgCjlJF4s6bGBcgygx1tj1sEjkS2dshfh0MwX2P7uWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSI8Zchlb7oA/SbVZyz06UYEGIKzGCEke9peESwjz38=;
 b=k9twd1axdUgE3m515OaOWfwbdUVBNzcBtsbYNAXR5HePqoTcrMdUGHBAIXiIUXjeaNcDODgcgVC+WtxdCRR70FXpQpyvRgm6bw1P7+UEj7AXh8QZoKCjxZTLSpwNkYCzvuYdAyK8o+zQyrC9Xrecejm9FHanL5BUFCPJgaouY3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VI1PR0401MB2288.eurprd04.prod.outlook.com (2603:10a6:800:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 14:32:34 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:34 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 06/14] v4l2-ctrls: add v4l2_ctrl_modify_dimensions
Date:   Thu, 23 Jun 2022 16:31:07 +0200
Message-Id: <20220623143115.3185297-7-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e79a9518-5877-46ea-fe0a-08da55253660
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2288:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB228832CC767C04D46650B0FDBAB59@VI1PR0401MB2288.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HHo8VZR+VOpFcxRjaSrTXNCt65fedAOWM+vopoy7qpDVbnOTMIRP6iP2FOXPETQQRRiT2LPKdgna9S2u/Lszy4N9jfdATguqmP/D1Ws3WSjExiazLsb5CzjQktu/2wW2i/up3SELmb8rYKUd5qvfATIXTSfqJZigLLEI5kRuWun6f9ySfJvUI65o1JSO4RxHTYv4ZTeGrtXVM50bigrp7UWrgNrIkZx14d93nateXT6hCFV3GGPhqWmLK0AP2qjAJhJUIkhfbe0ejVJjfyjowoyZJnmHI6kP61q8na9GWxhzf/IBSJNYa7lHBVUIyIRy5lpihCHc82SvD7R2lxDtz/iCnql6wYqQC82o0+S2HGWX8sRAbEv8RUSTNlMSg9QCHtALa4PEEKzgpGnssQdDAvcDZPTwvG5XZi6LzsNf+LZQ+y0MrAvM4IvygekP7UMeToKlDZbCJJUKlOdheQ2aVgqzaaHryD5+LFrNsYiyI84VXMT7nURaLumenaEQO7PDKkNNkbXNUnziBE/TSLSKtXVfGUmA0bpO7oM2fUCTIo+3ZVed6P65B5VdLJR9ak3dRM6SSuq0vvTzau8xU/wqXci9nrV+m15Qt9jJ9lY/q11iZtwQAHmq0DlFxh15PjZzCTh85+JMwV/XzYn0Z8oj7PHIKXrcXKAUUSk+73tTIyVEASSwUcPRaq9ui2wgf0eyUVPo0fxVOe7WX7A+hDkhmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(52116002)(66476007)(4326008)(6506007)(86362001)(2616005)(38100700002)(6666004)(41300700001)(66556008)(8676002)(66946007)(2906002)(316002)(1076003)(44832011)(478600001)(8936002)(83380400001)(7416002)(6512007)(5660300002)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7OSdUO8UygMiAQScN32pmpQcHe6fhpOVCh9XGuBlTnpC6G3GK5C4Ma79sJXs?=
 =?us-ascii?Q?tPlcjRZZkD/+aMm7DDx0deg5/aZQqxm/SmPchgtpfK2u4ZzUxuIHEVlBU/Wj?=
 =?us-ascii?Q?wpOu7VVFOshhoayZgA4odtTcVrjBiodUMNmM7XoIM3lwcRi1xMucitUKypoS?=
 =?us-ascii?Q?nKlq0tG8JfdTU/q0X2TBZJc6qePItuCxOBkQBooX45i2qdGGXWdosMlVbjKv?=
 =?us-ascii?Q?58ah9yL+/5lgAw9kzOlyMNJ08Z56V1Gm0qr51Vy+GzO1lNWHpgU1LG/b2kHd?=
 =?us-ascii?Q?Qxbcf4nOxOinROiICF/lfAYhttlbnIz3XkbkBeuiYHuwDBiiuiRyLeBhJVAs?=
 =?us-ascii?Q?BU640cXfuFWXIdttLS1xXd3hiVlO7Llx9JxLfj8+1GYVS8uacb6/lhKyYbQZ?=
 =?us-ascii?Q?9L6LhQKQEI9oqbG5hlF70voc0HWEhCZV0R9pktdp781N7+AK4TSwDtyNqLJq?=
 =?us-ascii?Q?2ToAxmI7iRoOY5aHDzLaLwoA8YJNVh6iqmjbiQzbAy/2Tn7gKTIfRfOVlgKI?=
 =?us-ascii?Q?YANM74fm939rtohFbo2w7WaciB67O0mXUQWpAbLEJ7/xF/vYN0ihBDSaagwy?=
 =?us-ascii?Q?i9D7/05gt86nriJwVYsSQTkhcsIG2peKEyrvfYlb74UaeP7EdQZv5+QiDlcz?=
 =?us-ascii?Q?95MGI6AwwKFe4UtduIBmuI+kNC6nxTuGyJtRxeIJQUAO+5XxLt4wJycyWeNb?=
 =?us-ascii?Q?ppH0AQo+IfOwHw06WB3Ah/sFua+9hVf48OXOrDwQOBJw8kMgYbiN9pfjIuuz?=
 =?us-ascii?Q?WzDNxqeDNbx/EswWCBEdQjHpcBJasbzZqZBq5ZU3QuU1/rwnYQlvXIRqtlxh?=
 =?us-ascii?Q?4ECDpv70yruksN2w+SmR0up7RBo2CE8JbTaQAZNKjsAJT3Y5ffQIhbzvtsQf?=
 =?us-ascii?Q?PgLtLn9LjlUfpOyoGZuu1KZrv3FBKOUD6lobmvyEpNjF7pQ2xitBAWawjuNT?=
 =?us-ascii?Q?9SAwBg5RB4/N8jisW7+EIrx9VhPpLohMo5BsFOpGluZWsIm3+R+7+KYczzt0?=
 =?us-ascii?Q?Mwrd5aSxmnkYo4i4//hEVlbpbcpxaP+pie4FwluixZtKfRdJ5TTzOSomMRez?=
 =?us-ascii?Q?nGgAfmpN0k9cYUKgCg9Vgn/LCOwGA/fc7z5MtWkKmbCl8I9rZpfMNcBXA2fu?=
 =?us-ascii?Q?JmTt/8sIitEY9CirGZ1ahUlvlMl8VqJToB30jhG19ZuDh4lQu/GY/OhNHM5t?=
 =?us-ascii?Q?Yd4434JHtY7eA0v/nDemr9Wp5q67WN1X07In0AWGjoiTzBIJUVtf8Lka6ekX?=
 =?us-ascii?Q?tNnHwiOkOxq+BQWynCAZmhGX7dr2YP9tKCsOzArRTsi+zQdLKMakvxwdPpHC?=
 =?us-ascii?Q?USf69dn/l8UHrSfXtGhQf8dh0uH05xi7XnB4vhoeHezFnbSjxuRcZtitDPtQ?=
 =?us-ascii?Q?mCVbRVzX23lRDOrm0YDG24wmRWrreXh5Qg7Ji4CinXLwYOcevhcyRBCmQt3T?=
 =?us-ascii?Q?34g2XOluSO4bjegXGwxqLY9BdjggYgyPCaor+0ADo1AtCiXCupTCf1L/KQL4?=
 =?us-ascii?Q?1DIVWOyk0iEBlFBsqybDL6DHKLeVPbybyNbnVvcPFymx3bAU4eO2Vh9qHekn?=
 =?us-ascii?Q?OmG0g1YN4XTPIBr+DMbEeOhe+GMUoZn2DB2frM4QWeiI439h6j4dsaV7xksG?=
 =?us-ascii?Q?2bL86yd1ywtzV30rktoJry9Sea73JxIFHFXc2/5WPpeh0tju0OQuKiMyWwC7?=
 =?us-ascii?Q?UaTywpgzJBH9buD/LpaUsGkY2dYwMYxYmm70t3n2pvlkICr3H2lcmCiUAfdH?=
 =?us-ascii?Q?3rIHm8bDRGvVQ1hPFHWk7k9KXz/+rPMbfVvSlE10gCx5Q1U2YRtYs6uM6fIK?=
X-MS-Exchange-AntiSpam-MessageData-1: j2rJZCBs0vrIIan0W5TQQDVy6nHtlKEyBs0=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79a9518-5877-46ea-fe0a-08da55253660
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:34.2385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PI2XVTobSMzUHd9MzEN/XbF9gl9FLIYlQCY0Xm1kOqbirXb0+oeWmaKAv3RHmmPbK/nA71Ej198128bu6ufmyg==
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

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 32 ++++++++++++++++++
 include/media/v4l2-ctrls.h               | 41 ++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 6f1b72c59e8e..8c49961c47de 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -989,6 +989,38 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 }
 EXPORT_SYMBOL(__v4l2_ctrl_modify_range);
 
+int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
+				  u32 dims[V4L2_CTRL_MAX_DIMS])
+{
+	unsigned int elems = dims[0];
+	unsigned int i;
+	void *p_array;
+
+	if (!ctrl->is_array || ctrl->is_dyn_array)
+		return -EINVAL;
+
+	for (i = 1; i < ctrl->nr_of_dims; i++)
+		elems *= dims[i];
+	if (elems == 0)
+		return -EINVAL;
+	p_array = kvzalloc(2 * elems * ctrl->elem_size, GFP_KERNEL);
+	if (!p_array)
+		return -ENOMEM;
+	kvfree(ctrl->p_array);
+	ctrl->p_array_alloc_elems = ctrl->elems = ctrl->new_elems = elems;
+	ctrl->p_array = p_array;
+	ctrl->p_new.p = p_array;
+	ctrl->p_cur.p = p_array + elems * ctrl->elem_size;
+	for (i = 0; i < ctrl->nr_of_dims; i++)
+		ctrl->dims[i] = dims[i];
+	for (i = 0; i < elems; i++) {
+		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
+		ctrl->type_ops->init(ctrl, i, ctrl->p_new);
+	}
+	return 0;
+}
+EXPORT_SYMBOL(__v4l2_ctrl_modify_dimensions);
+
 /* Implement VIDIOC_QUERY_EXT_CTRL */
 int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_query_ext_ctrl *qc)
 {
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index e0f32e8b886a..e02ce11a5844 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -963,6 +963,47 @@ static inline int v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	return rval;
 }
 
+/**
+ *__v4l2_ctrl_modify_dimensions() - Unlocked variant of v4l2_ctrl_modify_dimensions()
+ *
+ * @ctrl:	The control to update.
+ * @dims:	The control's new dimensions.
+ *
+ * Update the dimensions of an array control on the fly.
+ *
+ * An error is returned if @dims is invalid for this control.
+ *
+ * The caller is responsible for acquiring the control handler mutex on behalf
+ * of __v4l2_ctrl_modify_dimensions().
+ */
+int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
+				  u32 dims[V4L2_CTRL_MAX_DIMS]);
+
+/**
+ * v4l2_ctrl_modify_dimensions() - Update the dimensions of an array control.
+ *
+ * @ctrl:	The control to update.
+ * @dims:	The control's new dimensions.
+ *
+ * Update the dimensions of a control on the fly.
+ *
+ * An error is returned if @dims is invalid for this control type.
+ *
+ * This function assumes that the control handler is not locked and will
+ * take the lock itself.
+ */
+static inline int v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
+					      u32 dims[V4L2_CTRL_MAX_DIMS])
+{
+	int rval;
+
+	v4l2_ctrl_lock(ctrl);
+	rval = __v4l2_ctrl_modify_dimensions(ctrl, dims);
+	v4l2_ctrl_unlock(ctrl);
+
+	return rval;
+}
+
 /**
  * v4l2_ctrl_notify() - Function to set a notify callback for a control.
  *
-- 
2.36.1

