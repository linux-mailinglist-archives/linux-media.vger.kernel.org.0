Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7363E4D2247
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 21:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349397AbiCHUMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 15:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348277AbiCHUMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 15:12:08 -0500
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4E947AE2;
        Tue,  8 Mar 2022 12:11:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXBljZVx61p7Q1Y+Iayl9gZ9+jPFmAgOscq20Pa7ck1PsFl0+hnkmNY5F/L6QYr4KvelDNUo0NP+3OJOn6h2pGtvNRwgmW0aBnhK3hpQUrDmWfwmNrng9RLpW7FX0eX424hvxIaR//eLmP4VjzDctmqGT4uN1Owxq2Fq6R8GRgIdNKZMXPUWgsGZbtDziDhZCJnhT+cv1kJMOBZokeCf6jkCqvHjDxDDr90ekU4p5dEi7iGDhoxzG+JifCvZdPN7P+1lurn4rEk3jrDjHoDiIQbubsI2BNchU1O5JzGaqEmFrh7WBhXaT0gWglCwtDp7f8xYlNM9FxVqmYqA7IhSug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QDdgCkenIpJPTuk6FcogltUIoi7U+GDFMTPw6uKmlI=;
 b=MVXe38c0yeLXxnoDF0S1/31eDGwUdmNeItoe2C7dz2X7wxyd9zjLjoZ1kQn9eeCygLJCiuDSJGB3vGReONkAE1h087abUkPpH9s1Vm3hYl5hO2/G44XTtBw9bVXzaW/7kRMbXUvPCEWbmGYzF61aHX156wliXzzG3GsXeHL+2bavl132GrtpOt0MlDP/SHlB971GbIs4V5eOFggR+Bld1KHYBtJ8ZzM9aGCB4qWC1zkWAQ3waqzjiuVG6/r/ELayel431FHcmNizaQvYc5E+HflW0Fey2vnAwlOXbP8gd2ublQuv+NgApLMK05G5XWntc/i/NiP2NtTCpI25qavvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QDdgCkenIpJPTuk6FcogltUIoi7U+GDFMTPw6uKmlI=;
 b=c1ainu8A9sIPEDATii3lmBp8jDfRkV//BsttLnkWwUr07tFbyqgEQwTZDe8Y1BkF7Kt8NPZnGUX4Exa7h4iCI8vVC5PXibxKQ2fXV7afEPFDia3koMEZ8RpWRUaAOysE+Co+VvjPhxhD0PRsAidrzBAHe7S4vflAv8KJ4gvwNFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4588.eurprd04.prod.outlook.com (2603:10a6:5:35::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 20:11:05 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:11:05 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/9] v4l2-ctrls: add support for dynamically allocated arrays.
Date:   Tue,  8 Mar 2022 21:10:31 +0100
Message-Id: <20220308201038.48386-3-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1f271fc-69e8-4f01-bf1a-08da013fc62d
X-MS-TrafficTypeDiagnostic: DB7PR04MB4588:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4588F92A0E66D04751EB4ECABA099@DB7PR04MB4588.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vmc6qpqZjn+gyb2PlvfU2C3eenMOnZMSgcKJB1xNGO9fgi3Snxn4+1L0nu7P9u1riXzZ/PZO/bCeS51e/+rttkUEEIwZRnBX+HK6oNcpyPfLGHPR+IRdcjGlxERvSuJ5IQ+pK/8Islw1xlWBKcSiY48/xpZ8iCtVOCSSYNvhXrt3JrBFqJWAhQqYVwq/NtQltOkHPo64a1m14EGq/LD1PbduKpDG31HCUmw/Yb8guDoSb8p9kt6lJM9hvl/d+ui/+lfOQ076WNEqsrXro2kTSUUescTMZSTsTym5cx7EBPYo7A00lQomylYmnbNK79snCVpshyGwWkkV6MyQOHrQwy1/M7SVEC+N9KWRbQjmGULo4sd+vyTvkL1GwiCu52BSYVp8vSPmI55l9tX2xNo2ZwQHago+Ojxgasl1HxKkp867bUaXMRtXCcR2WIBWsAYdlu0Kp6fX2GeKXzSyv1BDh65iRdkfgLa8QLgN0Ex24HPEdNOlWiDmTB1PNErvZHiyFUUdlnTIFu8hiZWC2rD8tqjzUaFaTfzN1Ur6odJ2bSjuap12e2j9c6KdoqtXM9WhcLUAtTV+vUff3JH6zQ8VdnUgX5hV8yYK4TZLEZ84ZMYupOivanFzFdVGowBr+xAVCbpYb7slOaJMxdTk92ghpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6666004)(4326008)(2906002)(6512007)(5660300002)(44832011)(30864003)(8936002)(1076003)(186003)(2616005)(86362001)(83380400001)(38100700002)(6486002)(8676002)(66946007)(498600001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tWWz816Yu4bmRjXaIhniQ0S74jYZ/kyCvinZFXig9YyoyLjq+0VGwNswSeJy?=
 =?us-ascii?Q?O8Xlt4g0+TDKmZcKB4L6xaV4WM5mtnEuCa9CXfS30QDaC1TDL4hNzEKShL3r?=
 =?us-ascii?Q?xakV1SNxTRpKSNmikNlajSdmVMBbU/9eYDK5wvMtl6k4srtSUer2nUC4A6CM?=
 =?us-ascii?Q?Pv6gXdhf9/fFhYad34zP8aldzJPrXq4+yGHQJXQe0Zn8Bgc0ZwZT9RljRPwD?=
 =?us-ascii?Q?hhbcXzfTOn0HwJPpmtEHFUe5XOvrdv5NsBYX3zFvWrDtURvCX/Rerz4MTAk+?=
 =?us-ascii?Q?Lq+NzKlZmmBS48U0xvXYiafNGg+K/RIfLsmdMJnfOdy54r4xXfsZ831spmC8?=
 =?us-ascii?Q?HaZVLBlmCl+pVhpH4GjbUhHHbu2Q9Ok5zfAG4WSobEYC+b25KWt38k+rr7JR?=
 =?us-ascii?Q?baauwm2fEojlSxgzTVfKy8kamxiOcgcrI46xPoYFRDMZjTtnd9T/PwnTvBGH?=
 =?us-ascii?Q?ZGyzAz96EfvGG9SgzpMcuVoszyXd0J4a2/KQzXQl9IRuN7Nvl4GmkiPVpE8M?=
 =?us-ascii?Q?IqUd3pypLQzcEeHTzd1CEX+NtT8rqsZpG6RyP83l/2QyFV5TCDTcYQspEzFL?=
 =?us-ascii?Q?EPVRiAzSsZt5arIIefoxp9svArIKU0KKQOmKYp4uTvpjwhihTxtQz5aaQK3s?=
 =?us-ascii?Q?qhIxp2gnJj1wJDktHRDIZ5JikzpRC914BfnrbCKf5U1FWTi5gJ4N0PM0iDPG?=
 =?us-ascii?Q?eM8TAdi/qIi/o1jS71mwzM4jRG86qQr2BajDxa9oe68el1ZjCSU7/MCxrMWy?=
 =?us-ascii?Q?KGT6eslRJWmmz4lD+EnHYGAxyzc/5JKZYndf7b730i/btdtBbXfFQNHR27jW?=
 =?us-ascii?Q?DBAMhwJk6V/70MNit+EEjPfjzPuWfscpp6Mw5uzoKGYFhaSWxkFv2wfmgjfD?=
 =?us-ascii?Q?EThTcKKevoqlEAiWY85bURZIQGLwJ0+c0gXnKW55D49ZeiMwE83KpNY2ySh6?=
 =?us-ascii?Q?L6I9Vb8Rnp9l4uW6/Mv+KHIgS51Brs1h+FiLku6bMbVanmrUJcc+OAClk8/l?=
 =?us-ascii?Q?Z/2Ta52JGi1hQkyt6+fZR0LIXHmwFtad7yIeRsoJrSlPeLwK0DgM7TTFA2Ff?=
 =?us-ascii?Q?hcuLfn3GD3goCDE91poP705pXdYD09PZCqDSCrVaC5HcP0ceK7THpIq2eCcl?=
 =?us-ascii?Q?EZkNlCJLUkTR/2l2GGbCjsTVuOnlSUZvU5ZkHSRaX3nh85jlRWdp5bxp1ync?=
 =?us-ascii?Q?PBujaEtvp7458Q5wzHnCUyw8yvzz0vPZ8OklKzPiVY0DRFBIG9mudjhhqWYF?=
 =?us-ascii?Q?0fGBkPREcKSgr/IXzTdvJEwadNV8Ea8f3BBan/yVeNJ3vr0M6XANrheevaIy?=
 =?us-ascii?Q?PYgDMA6baGPKi1Bf9ZDaOG5nsjnvAL7FdubRCqmQdrHYwUtkWlAfha2F2M2N?=
 =?us-ascii?Q?FfjJx84DOtLVdMc3v+kb3Yg4PBeZK8PPCuj0pt+Ws1w+CQu4ADjNCJ9aS/PD?=
 =?us-ascii?Q?baSxCqKnCqLzui7lTEmcbc5XXgMBnjrogzVKg0clduaBZVztzWPnX1Pd1et/?=
 =?us-ascii?Q?DUvP+/spq5jqVwXMsmqRwencsES+47emLdOfUObkwx+911VLxKl05rGUChdv?=
 =?us-ascii?Q?S70UlN5rkee0U9+qqyusbH78iTYOWssv35xFbShSTGgyqwObFbDuLzWv+m1m?=
 =?us-ascii?Q?TICvcpJ/iPq8P7plVpv3FOc3W31GXbCQGfz08PMY4s558NMPNVUFfUnL0xyM?=
 =?us-ascii?Q?nIC6piqgfCd4WrxXWO0wkUszcQo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f271fc-69e8-4f01-bf1a-08da013fc62d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:11:04.7206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dg1hihldBUzL2fXrPEMhGmizh/AHPq9c2vYZIzEAEtjrWoTC5hgWxy86kr6e1sMBxxCrBb39uXSywNXkw7Z7nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4588
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Implement support for dynamically allocated arrays.

Most of the changes concern keeping track of the number of elements
of the array and the number of elements allocated for the array and
reallocating memory if needed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c     | 103 ++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c    | 182 +++++++++++++++----
 drivers/media/v4l2-core/v4l2-ctrls-priv.h    |   3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c |  13 +-
 include/media/v4l2-ctrls.h                   |  42 ++++-
 5 files changed, 272 insertions(+), 71 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index db9baa0bd05f..50d012ba3c02 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -97,29 +97,47 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 	return ptr_to_user(c, ctrl, ctrl->p_new);
 }
 
-/* Helper function: copy the caller-provider value to the given control value */
-static int user_to_ptr(struct v4l2_ext_control *c,
-		       struct v4l2_ctrl *ctrl,
-		       union v4l2_ctrl_ptr ptr)
+/* Helper function: copy the caller-provider value as the new control value */
+static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 {
 	int ret;
 	u32 size;
 
-	ctrl->is_new = 1;
+	ctrl->is_new = 0;
+	if (ctrl->is_dyn_array &&
+	    c->size > ctrl->p_dyn_alloc_elems * ctrl->elem_size) {
+		void *old = ctrl->p_dyn;
+		void *tmp = kvzalloc(2 * c->size, GFP_KERNEL);
+
+		if (!tmp)
+			return -ENOMEM;
+		memcpy(tmp, ctrl->p_new.p, ctrl->elems * ctrl->elem_size);
+		memcpy(tmp + c->size, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
+		ctrl->p_new.p = tmp;
+		ctrl->p_cur.p = tmp + c->size;
+		ctrl->p_dyn = tmp;
+		ctrl->p_dyn_alloc_elems = c->size / ctrl->elem_size;
+		kvfree(old);
+	}
+
 	if (ctrl->is_ptr && !ctrl->is_string) {
+		unsigned int elems = c->size / ctrl->elem_size;
 		unsigned int idx;
 
-		ret = copy_from_user(ptr.p, c->ptr, c->size) ? -EFAULT : 0;
-		if (ret || !ctrl->is_array)
-			return ret;
-		for (idx = c->size / ctrl->elem_size; idx < ctrl->elems; idx++)
-			ctrl->type_ops->init(ctrl, idx, ptr);
+		if (copy_from_user(ctrl->p_new.p, c->ptr, c->size))
+			return -EFAULT;
+		ctrl->is_new = 1;
+		if (ctrl->is_dyn_array)
+			ctrl->new_elems = elems;
+		else if (ctrl->is_array)
+			for (idx = elems; idx < ctrl->elems; idx++)
+				ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
 		return 0;
 	}
 
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_INTEGER64:
-		*ptr.p_s64 = c->value64;
+		*ctrl->p_new.p_s64 = c->value64;
 		break;
 	case V4L2_CTRL_TYPE_STRING:
 		size = c->size;
@@ -127,32 +145,27 @@ static int user_to_ptr(struct v4l2_ext_control *c,
 			return -ERANGE;
 		if (size > ctrl->maximum + 1)
 			size = ctrl->maximum + 1;
-		ret = copy_from_user(ptr.p_char, c->string, size) ? -EFAULT : 0;
+		ret = copy_from_user(ctrl->p_new.p_char, c->string, size) ? -EFAULT : 0;
 		if (!ret) {
-			char last = ptr.p_char[size - 1];
+			char last = ctrl->p_new.p_char[size - 1];
 
-			ptr.p_char[size - 1] = 0;
+			ctrl->p_new.p_char[size - 1] = 0;
 			/*
 			 * If the string was longer than ctrl->maximum,
 			 * then return an error.
 			 */
-			if (strlen(ptr.p_char) == ctrl->maximum && last)
+			if (strlen(ctrl->p_new.p_char) == ctrl->maximum && last)
 				return -ERANGE;
 		}
 		return ret;
 	default:
-		*ptr.p_s32 = c->value;
+		*ctrl->p_new.p_s32 = c->value;
 		break;
 	}
+	ctrl->is_new = 1;
 	return 0;
 }
 
-/* Helper function: copy the caller-provider value as the new control value */
-static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
-{
-	return user_to_ptr(c, ctrl, ctrl->p_new);
-}
-
 /*
  * VIDIOC_G/TRY/S_EXT_CTRLS implementation
  */
@@ -254,7 +267,31 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 			have_clusters = true;
 		if (ctrl->cluster[0] != ctrl)
 			ref = find_ref_lock(hdl, ctrl->cluster[0]->id);
-		if (ctrl->is_ptr && !ctrl->is_string) {
+		if (ctrl->is_dyn_array) {
+			unsigned int max_size = ctrl->dims[0] * ctrl->elem_size;
+			unsigned int tot_size = ctrl->elem_size;
+
+			if (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL)
+				tot_size *= ref->p_req_elems;
+			else
+				tot_size *= ctrl->elems;
+
+			c->size = ctrl->elem_size * (c->size / ctrl->elem_size);
+			if (get) {
+				if (c->size < tot_size) {
+					c->size = tot_size;
+					return -ENOSPC;
+				}
+				c->size = tot_size;
+			} else {
+				if (c->size > max_size) {
+					c->size = max_size;
+					return -ENOSPC;
+				}
+				if (!c->size)
+					return -EFAULT;
+			}
+		} else if (ctrl->is_ptr && !ctrl->is_string) {
 			unsigned int tot_size = ctrl->elems * ctrl->elem_size;
 
 			if (c->size < tot_size) {
@@ -346,7 +383,7 @@ static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
  *
  * Note that v4l2_g_ext_ctrls_common() with 'which' set to
  * V4L2_CTRL_WHICH_REQUEST_VAL is only called if the request was
- * completed, and in that case valid_p_req is true for all controls.
+ * completed, and in that case p_req_valid is true for all controls.
  */
 int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 			    struct v4l2_ext_controls *cs,
@@ -430,7 +467,9 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 
 			if (is_default)
 				ret = def_to_user(cs->controls + idx, ref->ctrl);
-			else if (is_request && ref->valid_p_req)
+			else if (is_request && ref->p_req_dyn_enomem)
+				ret = -ENOMEM;
+			else if (is_request && ref->p_req_valid)
 				ret = req_to_user(cs->controls + idx, ref);
 			else if (is_volatile)
 				ret = new_to_user(cs->controls + idx, ref->ctrl);
@@ -457,6 +496,17 @@ int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct video_device *vdev,
 }
 EXPORT_SYMBOL(v4l2_g_ext_ctrls);
 
+/* Validate a new control */
+static int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
+{
+	unsigned int idx;
+	int err = 0;
+
+	for (idx = 0; !err && idx < ctrl->new_elems; idx++)
+		err = ctrl->type_ops->validate(ctrl, idx, p_new);
+	return err;
+}
+
 /* Validate controls. */
 static int validate_ctrls(struct v4l2_ext_controls *cs,
 			  struct v4l2_ctrl_helper *helpers,
@@ -872,6 +922,9 @@ int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
 	/* It's a driver bug if this happens. */
 	if (WARN_ON(ctrl->type != type))
 		return -EINVAL;
+	/* Setting dynamic arrays is not (yet?) supported. */
+	if (WARN_ON(ctrl->is_dyn_array))
+		return -EINVAL;
 	memcpy(ctrl->p_new.p, p, ctrl->elems * ctrl->elem_size);
 	return set_ctrl(NULL, ctrl, 0);
 }
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 8968cec8454e..cb709c74e01e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -991,11 +991,12 @@ EXPORT_SYMBOL(v4l2_ctrl_notify);
 
 /* Copy the one value to another. */
 static void ptr_to_ptr(struct v4l2_ctrl *ctrl,
-		       union v4l2_ctrl_ptr from, union v4l2_ctrl_ptr to)
+		       union v4l2_ctrl_ptr from, union v4l2_ctrl_ptr to,
+		       unsigned int elems)
 {
 	if (ctrl == NULL)
 		return;
-	memcpy(to.p, from.p_const, ctrl->elems * ctrl->elem_size);
+	memcpy(to.p, from.p_const, elems * ctrl->elem_size);
 }
 
 /* Copy the new value to the current value. */
@@ -1008,8 +1009,11 @@ void new_to_cur(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 ch_flags)
 
 	/* has_changed is set by cluster_changed */
 	changed = ctrl->has_changed;
-	if (changed)
-		ptr_to_ptr(ctrl, ctrl->p_new, ctrl->p_cur);
+	if (changed) {
+		if (ctrl->is_dyn_array)
+			ctrl->elems = ctrl->new_elems;
+		ptr_to_ptr(ctrl, ctrl->p_new, ctrl->p_cur, ctrl->elems);
+	}
 
 	if (ch_flags & V4L2_EVENT_CTRL_CH_FLAGS) {
 		/* Note: CH_FLAGS is only set for auto clusters. */
@@ -1039,36 +1043,122 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
 {
 	if (ctrl == NULL)
 		return;
-	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new);
+	if (ctrl->is_dyn_array)
+		ctrl->new_elems = ctrl->elems;
+	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
+}
+
+static bool req_alloc_dyn_array(struct v4l2_ctrl_ref *ref, u32 elems)
+{
+	void *tmp;
+
+	if (elems < ref->p_req_dyn_alloc_elems)
+		return true;
+
+	tmp = kvmalloc(elems * ref->ctrl->elem_size, GFP_KERNEL);
+
+	if (!tmp) {
+		ref->p_req_dyn_enomem = true;
+		return false;
+	}
+	ref->p_req_dyn_enomem = false;
+	kvfree(ref->p_req.p);
+	ref->p_req.p = tmp;
+	ref->p_req_dyn_alloc_elems = elems;
+	return true;
 }
 
 /* Copy the new value to the request value */
 void new_to_req(struct v4l2_ctrl_ref *ref)
 {
+	struct v4l2_ctrl *ctrl;
+
 	if (!ref)
 		return;
-	ptr_to_ptr(ref->ctrl, ref->ctrl->p_new, ref->p_req);
-	ref->valid_p_req = true;
+
+	ctrl = ref->ctrl;
+	if (ctrl->is_dyn_array && !req_alloc_dyn_array(ref, ctrl->new_elems))
+		return;
+
+	ref->p_req_elems = ctrl->new_elems;
+	ptr_to_ptr(ctrl, ctrl->p_new, ref->p_req, ref->p_req_elems);
+	ref->p_req_valid = true;
 }
 
 /* Copy the current value to the request value */
 void cur_to_req(struct v4l2_ctrl_ref *ref)
 {
+	struct v4l2_ctrl *ctrl;
+
 	if (!ref)
 		return;
-	ptr_to_ptr(ref->ctrl, ref->ctrl->p_cur, ref->p_req);
-	ref->valid_p_req = true;
+
+	ctrl = ref->ctrl;
+	if (ctrl->is_dyn_array && !req_alloc_dyn_array(ref, ctrl->elems))
+		return;
+
+	ref->p_req_elems = ctrl->elems;
+	ptr_to_ptr(ctrl, ctrl->p_cur, ref->p_req, ctrl->elems);
+	ref->p_req_valid = true;
 }
 
 /* Copy the request value to the new value */
-void req_to_new(struct v4l2_ctrl_ref *ref)
+int req_to_new(struct v4l2_ctrl_ref *ref)
 {
+	struct v4l2_ctrl *ctrl;
+
 	if (!ref)
-		return;
-	if (ref->valid_p_req)
-		ptr_to_ptr(ref->ctrl, ref->p_req, ref->ctrl->p_new);
-	else
-		ptr_to_ptr(ref->ctrl, ref->ctrl->p_cur, ref->ctrl->p_new);
+		return 0;
+
+	ctrl = ref->ctrl;
+
+	/*
+	 * This control was never set in the request, so just use the current
+	 * value.
+	 */
+	if (!ref->p_req_valid) {
+		if (ctrl->is_dyn_array)
+			ctrl->new_elems = ctrl->elems;
+		ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
+		return 0;
+	}
+
+	/* Not a dynamic array, so just copy the request value */
+	if (!ctrl->is_dyn_array) {
+		ptr_to_ptr(ctrl, ref->p_req, ctrl->p_new, ctrl->new_elems);
+		return 0;
+	}
+
+	/* Sanity check, should never happen */
+	if (WARN_ON(!ref->p_req_dyn_alloc_elems))
+		return -ENOMEM;
+
+	/*
+	 * Check if the number of elements in the request is more than the
+	 * elements in ctrl->p_dyn. If so, attempt to realloc ctrl->p_dyn.
+	 * Note that p_dyn is allocated with twice the number of elements
+	 * in the dynamic array since it has to store both the current and
+	 * new value of such a control.
+	 */
+	if (ref->p_req_elems > ctrl->p_dyn_alloc_elems) {
+		unsigned int sz = ref->p_req_elems * ctrl->elem_size;
+		void *old = ctrl->p_dyn;
+		void *tmp = kvzalloc(2 * sz, GFP_KERNEL);
+
+		if (!tmp)
+			return -ENOMEM;
+		memcpy(tmp, ctrl->p_new.p, ctrl->elems * ctrl->elem_size);
+		memcpy(tmp + sz, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
+		ctrl->p_new.p = tmp;
+		ctrl->p_cur.p = tmp + sz;
+		ctrl->p_dyn = tmp;
+		ctrl->p_dyn_alloc_elems = ref->p_req_elems;
+		kvfree(old);
+	}
+
+	ctrl->new_elems = ref->p_req_elems;
+	ptr_to_ptr(ctrl, ref->p_req, ctrl->p_new, ctrl->new_elems);
+	return 0;
 }
 
 /* Control range checking */
@@ -1110,17 +1200,6 @@ int check_range(enum v4l2_ctrl_type type,
 	}
 }
 
-/* Validate a new control */
-int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
-{
-	unsigned idx;
-	int err = 0;
-
-	for (idx = 0; !err && idx < ctrl->elems; idx++)
-		err = ctrl->type_ops->validate(ctrl, idx, p_new);
-	return err;
-}
-
 /* Set the handler's error code if it wasn't set earlier already */
 static inline int handler_set_err(struct v4l2_ctrl_handler *hdl, int err)
 {
@@ -1165,6 +1244,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 	/* Free all nodes */
 	list_for_each_entry_safe(ref, next_ref, &hdl->ctrl_refs, node) {
 		list_del(&ref->node);
+		if (ref->p_req_dyn_alloc_elems)
+			kvfree(ref->p_req.p);
 		kfree(ref);
 	}
 	/* Free all controls owned by the handler */
@@ -1172,6 +1253,7 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 		list_del(&ctrl->node);
 		list_for_each_entry_safe(sev, next_sev, &ctrl->ev_subs, node)
 			list_del(&sev->node);
+		kvfree(ctrl->p_dyn);
 		kvfree(ctrl);
 	}
 	kvfree(hdl->buckets);
@@ -1287,7 +1369,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 	if (hdl->error)
 		return hdl->error;
 
-	if (allocate_req)
+	if (allocate_req && !ctrl->is_dyn_array)
 		size_extra_req = ctrl->elems * ctrl->elem_size;
 	new_ref = kzalloc(sizeof(*new_ref) + size_extra_req, GFP_KERNEL);
 	if (!new_ref)
@@ -1461,7 +1543,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			elem_size = sizeof(s32);
 		break;
 	}
-	tot_ctrl_size = elem_size * elems;
 
 	/* Sanity checks */
 	if (id == 0 || name == NULL || !elem_size ||
@@ -1482,17 +1563,33 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		handler_set_err(hdl, -EINVAL);
 		return NULL;
 	}
+	if (flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY) {
+		/*
+		 * For now only support this for one-dimensional arrays only.
+		 *
+		 * This can be relaxed in the future, but this will
+		 * require more effort.
+		 */
+		if (nr_of_dims != 1) {
+			handler_set_err(hdl, -EINVAL);
+			return NULL;
+		}
+		/* Start with just 1 element */
+		elems = 1;
+	}
 
+	tot_ctrl_size = elem_size * elems;
 	sz_extra = 0;
 	if (type == V4L2_CTRL_TYPE_BUTTON)
 		flags |= V4L2_CTRL_FLAG_WRITE_ONLY |
 			V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
 	else if (type == V4L2_CTRL_TYPE_CTRL_CLASS)
 		flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	else if (type == V4L2_CTRL_TYPE_INTEGER64 ||
-		 type == V4L2_CTRL_TYPE_STRING ||
-		 type >= V4L2_CTRL_COMPOUND_TYPES ||
-		 is_array)
+	else if (!(flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY) &&
+		 (type == V4L2_CTRL_TYPE_INTEGER64 ||
+		  type == V4L2_CTRL_TYPE_STRING ||
+		  type >= V4L2_CTRL_COMPOUND_TYPES ||
+		  is_array))
 		sz_extra += 2 * tot_ctrl_size;
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
@@ -1521,7 +1618,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	ctrl->is_ptr = is_array || type >= V4L2_CTRL_COMPOUND_TYPES || ctrl->is_string;
 	ctrl->is_int = !ctrl->is_ptr && type != V4L2_CTRL_TYPE_INTEGER64;
 	ctrl->is_array = is_array;
+	ctrl->is_dyn_array = !!(flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY);
 	ctrl->elems = elems;
+	ctrl->new_elems = elems;
 	ctrl->nr_of_dims = nr_of_dims;
 	if (nr_of_dims)
 		memcpy(ctrl->dims, dims, nr_of_dims * sizeof(dims[0]));
@@ -1534,6 +1633,16 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	ctrl->cur.val = ctrl->val = def;
 	data = &ctrl[1];
 
+	if (ctrl->is_dyn_array) {
+		ctrl->p_dyn_alloc_elems = elems;
+		ctrl->p_dyn = kvzalloc(2 * elems * elem_size, GFP_KERNEL);
+		if (!ctrl->p_dyn) {
+			kvfree(ctrl);
+			return NULL;
+		}
+		data = ctrl->p_dyn;
+	}
+
 	if (!ctrl->is_int) {
 		ctrl->p_new.p = data;
 		ctrl->p_cur.p = data + tot_ctrl_size;
@@ -1543,7 +1652,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const) {
-		ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
+		if (ctrl->is_dyn_array)
+			ctrl->p_def.p = &ctrl[1];
+		else
+			ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
 		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}
 
@@ -1553,6 +1665,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	if (handler_new_ref(hdl, ctrl, NULL, false, false)) {
+		kvfree(ctrl->p_dyn);
 		kvfree(ctrl);
 		return NULL;
 	}
@@ -1890,6 +2003,9 @@ static int cluster_changed(struct v4l2_ctrl *master)
 			continue;
 		}
 
+		if (ctrl->elems != ctrl->new_elems)
+			ctrl_changed = true;
+
 		for (idx = 0; !ctrl_changed && idx < ctrl->elems; idx++)
 			ctrl_changed = !ctrl->type_ops->equal(ctrl, idx,
 				ctrl->p_cur, ctrl->p_new);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-priv.h b/drivers/media/v4l2-core/v4l2-ctrls-priv.h
index d4bf2c716f97..aba6176fab6c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-priv.h
+++ b/drivers/media/v4l2-core/v4l2-ctrls-priv.h
@@ -57,10 +57,9 @@ void cur_to_new(struct v4l2_ctrl *ctrl);
 void cur_to_req(struct v4l2_ctrl_ref *ref);
 void new_to_cur(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 ch_flags);
 void new_to_req(struct v4l2_ctrl_ref *ref);
-void req_to_new(struct v4l2_ctrl_ref *ref);
+int req_to_new(struct v4l2_ctrl_ref *ref);
 void send_initial_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl);
 void send_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 changes);
-int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new);
 int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 		    struct v4l2_ctrl *ctrl,
 		    struct v4l2_ctrl_ref **ctrl_ref,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-request.c b/drivers/media/v4l2-core/v4l2-ctrls-request.c
index 7d098f287fd9..c637049d7a2b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-request.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-request.c
@@ -143,7 +143,7 @@ v4l2_ctrl_request_hdl_ctrl_find(struct v4l2_ctrl_handler *hdl, u32 id)
 {
 	struct v4l2_ctrl_ref *ref = find_ref_lock(hdl, id);
 
-	return (ref && ref->valid_p_req) ? ref->ctrl : NULL;
+	return (ref && ref->p_req_valid) ? ref->ctrl : NULL;
 }
 EXPORT_SYMBOL_GPL(v4l2_ctrl_request_hdl_ctrl_find);
 
@@ -373,7 +373,7 @@ void v4l2_ctrl_request_complete(struct media_request *req,
 			v4l2_ctrl_unlock(master);
 			continue;
 		}
-		if (ref->valid_p_req)
+		if (ref->p_req_valid)
 			continue;
 
 		/* Copy the current control value into the request */
@@ -442,7 +442,7 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 				struct v4l2_ctrl_ref *r =
 					find_ref(hdl, master->cluster[i]->id);
 
-				if (r->valid_p_req) {
+				if (r->p_req_valid) {
 					have_new_data = true;
 					break;
 				}
@@ -458,7 +458,11 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 				struct v4l2_ctrl_ref *r =
 					find_ref(hdl, master->cluster[i]->id);
 
-				req_to_new(r);
+				ret = req_to_new(r);
+				if (ret) {
+					v4l2_ctrl_unlock(master);
+					goto error;
+				}
 				master->cluster[i]->is_new = 1;
 				r->req_done = true;
 			}
@@ -490,6 +494,7 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 			break;
 	}
 
+error:
 	media_request_object_put(obj);
 	return ret;
 }
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b3ce438f1329..f4105de8a8d2 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -185,6 +185,8 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		and/or has type %V4L2_CTRL_TYPE_STRING. In other words, &struct
  *		v4l2_ext_control uses field p to point to the data.
  * @is_array: If set, then this control contains an N-dimensional array.
+ * @is_dyn_array: If set, then this control contains a dynamically sized 1-dimensional array.
+ *		If this is set, then @is_array is also set.
  * @has_volatiles: If set, then one or more members of the cluster are volatile.
  *		Drivers should never touch this flag.
  * @call_notify: If set, then call the handler's notify function whenever the
@@ -205,6 +207,9 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  * @step:	The control's step value for non-menu controls.
  * @elems:	The number of elements in the N-dimensional array.
  * @elem_size:	The size in bytes of the control.
+ * @new_elems:	The number of elements in p_new. This is the same as @elems,
+ *		except for dynamic arrays. In that case it is in the range of
+ *		1 to @p_dyn_alloc_elems.
  * @dims:	The size of each dimension.
  * @nr_of_dims:The number of dimensions in @dims.
  * @menu_skip_mask: The control's skip mask for menu controls. This makes it
@@ -223,15 +228,21 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		:math:`ceil(\frac{maximum - minimum}{step}) + 1`.
  *		Used only if the @type is %V4L2_CTRL_TYPE_INTEGER_MENU.
  * @flags:	The control's flags.
- * @cur:	Structure to store the current value.
- * @cur.val:	The control's current value, if the @type is represented via
- *		a u32 integer (see &enum v4l2_ctrl_type).
- * @val:	The control's new s32 value.
  * @priv:	The control's private pointer. For use by the driver. It is
  *		untouched by the control framework. Note that this pointer is
  *		not freed when the control is deleted. Should this be needed
  *		then a new internal bitfield can be added to tell the framework
  *		to free this pointer.
+ * @p_dyn:	Pointer to the dynamically allocated array. Only valid if
+ *		@is_dyn_array is true.
+ * @p_dyn_alloc_elems: The number of elements in the dynamically allocated
+ *		array for both the cur and new values. So @p_dyn is actually
+ *		sized for 2 * @p_dyn_alloc_elems * @elem_size. Only valid if
+ *		@is_dyn_array is true.
+ * @cur:	Structure to store the current value.
+ * @cur.val:	The control's current value, if the @type is represented via
+ *		a u32 integer (see &enum v4l2_ctrl_type).
+ * @val:	The control's new s32 value.
  * @p_def:	The control's default value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer (for compound controls only).
@@ -260,6 +271,7 @@ struct v4l2_ctrl {
 	unsigned int is_string:1;
 	unsigned int is_ptr:1;
 	unsigned int is_array:1;
+	unsigned int is_dyn_array:1;
 	unsigned int has_volatiles:1;
 	unsigned int call_notify:1;
 	unsigned int manual_mode_value:8;
@@ -272,6 +284,7 @@ struct v4l2_ctrl {
 	s64 minimum, maximum, default_value;
 	u32 elems;
 	u32 elem_size;
+	u32 new_elems;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 nr_of_dims;
 	union {
@@ -284,6 +297,8 @@ struct v4l2_ctrl {
 	};
 	unsigned long flags;
 	void *priv;
+	void *p_dyn;
+	u32 p_dyn_alloc_elems;
 	s32 val;
 	struct {
 		s32 val;
@@ -309,12 +324,22 @@ struct v4l2_ctrl {
  *		the control has been applied. This prevents applying controls
  *		from a cluster with multiple controls twice (when the first
  *		control of a cluster is applied, they all are).
- * @valid_p_req: If set, then p_req contains the control value for the request.
+ * @p_req_valid: If set, then p_req contains the control value for the request.
+ * @p_req_dyn_enomem: If set, then p_req is invalid since allocating space for
+ *		a dynamic array failed. Attempting to read this value shall
+ *		result in ENOMEM. Only valid if ctrl->is_dyn_array is true.
+ * @p_req_dyn_alloc_elems: The number of elements allocated for the dynamic
+ *		array. Only valid if @p_req_valid and ctrl->is_dyn_array are
+ *		true.
+ * @p_req_elems: The number of elements in @p_req. This is the same as
+ *		ctrl->elems, except for dynamic arrays. In that case it is in
+ *		the range of 1 to @p_req_dyn_alloc_elems. Only valid if
+ *		@p_req_valid is true.
  * @p_req:	If the control handler containing this control reference
  *		is bound to a media request, then this points to the
  *		value of the control that must be applied when the request
  *		is executed, or to the value of the control at the time
- *		that the request was completed. If @valid_p_req is false,
+ *		that the request was completed. If @p_req_valid is false,
  *		then this control was never set for this request and the
  *		control will not be updated when this request is applied.
  *
@@ -329,7 +354,10 @@ struct v4l2_ctrl_ref {
 	struct v4l2_ctrl_helper *helper;
 	bool from_other_dev;
 	bool req_done;
-	bool valid_p_req;
+	bool p_req_valid;
+	bool p_req_dyn_enomem;
+	u32 p_req_dyn_alloc_elems;
+	u32 p_req_elems;
 	union v4l2_ctrl_ptr p_req;
 };
 
-- 
2.35.1

