Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98803585B16
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 17:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234941AbiG3PtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 11:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235124AbiG3PtK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 11:49:10 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1F615A0C;
        Sat, 30 Jul 2022 08:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDczSK4cCAElRqHczeAtwq63OgzPoK01a1fmqu3hMkKp8waXwvZxpEtC4s0YZ6kKWfxjwtF4x2wsrlmYeiQ0ah1uVEFKUWKACUNhhUFoapT22/eDXpcwCZJA3RkH3WYL+bIL370uZsFlRmVa6GRp2HUl6oLJq3ViZKhdDYL9S4Qj1/iihmFuL3bfj0NNAGmwgrzvN08cW1DWYriNJL8l3kWH1Q1AbyoGgvn/VEy7HBxh+mbhCDPaojjW4q5lqozkHcORB4hVQ12bxF193xSvSHLKKSAmYlMN3eDF7/RFw5YCGL0BJU0/J38/Id33pG2MARZXeg6HqcpmEmZ/AdNV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGMq/W2/ac8V0jfSl0o8R/flkvjAyw1EZ8JJ38UbspQ=;
 b=kZrAAryoVZCySzRib5onu8pfCpHApts8EFM/LK2Dq6zyrceBB7mc4Y6vL6T7+2f1iZ2l/TxlbNFlYDRwPgWkvwD+EVJyRB/I89HJ712IoQ6G3Coyqk94eNdFigZnvfqA7pOIzBFg7QtYjoD1B+k35qK79s96md2/N/CUwBYd3NR6yyq2IAAivx4vcy/s0XqYH96OIrasXNfGTs1cidL3VMBS3bMk24d8F4XZboQb7Xnxs2oCiJbzko83nWu4hbvqG8khngEck6RA0TMoTzbcvak1CzzQsEDjqyjaKIfN9qkd4gIeCTKAFQnPUkvdoX2lqoT4OQTB947XapH4fTedkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGMq/W2/ac8V0jfSl0o8R/flkvjAyw1EZ8JJ38UbspQ=;
 b=jwH2Gl62/oYWQufDQ0dJX1M7/umtW4NunUgaU8NSGKVC9UL+0FpebZ7H6T5qve/wT/9VHKA7sZOgIpSjTn2WDlGOgCr4Y7Aa0VKyQhrttAn/EkC8G2EvTXsW8IRRtieFb2F15mnKUPcBwCXNlE336gK7GrXs/C2g7mUB5FxMS30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4875.eurprd04.prod.outlook.com (2603:10a6:10:1b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Sat, 30 Jul
 2022 15:49:03 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 15:49:03 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v10 1/8] v4l2-ctrls: optimize type_ops for arrays
Date:   Sat, 30 Jul 2022 17:48:36 +0200
Message-Id: <20220730154843.791378-2-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
References: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0082.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::27) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa7afdf9-c9bf-45f0-439f-08da724306c9
X-MS-TrafficTypeDiagnostic: DB7PR04MB4875:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b42EopFU6yuvHEQttBufMJy1OtWd8OeASHDirEzoZZh/C9KvCXQxR+4DP+qxg+TNuhMGAUa3+MeJYUcrUyFGNyPFZEALkQEdPw/JhSzo1Xow2zWfxDOcqPB0eBFY3swQ81BVFkuYZqIunuqBsp4aHt9qy6JslaGMFvtl52I7ljv+0kMTg2WQArfKvwjjx2AUxDFRy53XQaddqjvTlZk3LVUjfZLu2TCCFH+9RouuYHgCMGWixtTcM57f/YSaXP8LqR4Dbrkj/2geLqcDGzZSTpl//pTmpLPRTSzc2tLxC+z8fONhQTeJPiqEH17JU8e17g4U3w84vLkDVUuMxXm7mkSkk6ShpwsKdh+crPCrVpPT6J8dwKDrHjNdHsYTlq/+sBEUB0grJLLea3yi+N73TOXfEvdFCeZdKNFIWoRkmAS1bh00otIVLEm7a5qJHsR6PXHsRK83HaJOZvk9JoEyC6czMYu4XdHJyX/4N6Qdr4dooYlz/W/Ap/5fPA4ggSrxzCEc0qMnbypbta5ddWeWTei80eYJuilC9MX0wau+PcLWUZlAS1VETwmZLcgCtjeYUwYMlRRkeEdqQk/ycro/K0dm3kG3LKssVt5z4ygpjoyVTkz9zlr1cpf5BRl7I26Lq2XeZniNaKt6Ojjk2z+JrJ2wsT1s8hzzP3mbEbXj7rwIg2U/tun6KeInMPoYhMzaY/Hp2FoSPqK4gsw9iC07eztA0yn0tavf+P+NAbttAg/cljJRcz60lFVnxrJseLxM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(41300700001)(6666004)(478600001)(52116002)(66556008)(316002)(66476007)(66946007)(6486002)(6512007)(6506007)(83380400001)(38100700002)(186003)(2616005)(8936002)(1076003)(5660300002)(2906002)(8676002)(7416002)(44832011)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gd9ginvMg1jbf5j/1gPwwMnQsiks22Orosd1BM1Ga/GAoxDDISn++Ih/xk11?=
 =?us-ascii?Q?RcGMxwngXxmUjJlngdGOJoG7KlcKOGkPguo9pXTwl0rsNDXEZWgTTqD1sGb2?=
 =?us-ascii?Q?xYvh809cCiWWqGMSnRmH7oVZig5pzpTEyB579S+R80QDhZ9+fn+bFTdDBPnR?=
 =?us-ascii?Q?Q1R9bEcNZa7YKz3KjLPeqK/c/9QkvqXVJNkdrJNU+Q1H8hJfrJiSm/TQUBnf?=
 =?us-ascii?Q?Mlp79UDqP8Qm+0pixWV3noDoPwYlKWKAAQZvZKvNqJ2llawyD5eovik9Z2SD?=
 =?us-ascii?Q?13LDlzHb6nsbb5FUr5Yvll6aZjs8RRtlqWTpi5k3BtHTNE1j9TD2kMINsoNV?=
 =?us-ascii?Q?MyZ3Vzm+SIFb5CsjOcz2qN+XwbQeqy4xvElzvzmCWzsve5XAFMw8zfbW8GN7?=
 =?us-ascii?Q?hnmuZkrhKFeZoObFksGegp4/6HD9QssL/I02GXPo9Tv3y2AKjKLIZG75zPFz?=
 =?us-ascii?Q?Zg94EHXwIBs03i/wEEW09C7FJF80ZWYQVe1AtWc+pw6wUWrsoMUKltqQAJ59?=
 =?us-ascii?Q?ZgGTgwPmJEtYG9bH+siNJPUy7HHgo0AgFu/uujGJgwWMsCQLrOUfsLMefKE7?=
 =?us-ascii?Q?WUl3NOOCOLPOpcFN4MY4zU2BLsGivUKIuLPLtSY6MFnOwpiAT9pRz+C/st9x?=
 =?us-ascii?Q?vgwyqIOivX1G6N3hS3S3Oe+PM4PyVbI9naLff3CmEpLNpCYjOF4MhV8EinEq?=
 =?us-ascii?Q?40YvE+FZroYh0nlqd1F2HqoCCeZcswzByBki1mAyJMWS9MFRycqxn5Sf1NCX?=
 =?us-ascii?Q?z1dNNGl2iBEq6zl0HrXRXKyS1hKyeZk2fL1Z39k0JCqKMtQIl47+oIVUtWxx?=
 =?us-ascii?Q?/xUaO/55c/nD+IHxSoBgCd7NWvozvI7l9zyRLC+XK6barv7GjOvEaQu3MURS?=
 =?us-ascii?Q?tNBVMVr80nZk6Bv5hj3d6Ng/cvs9wd8Q1MmTceFKF+UszYjc2mWW234CvyUg?=
 =?us-ascii?Q?CbxG/86WASux8Nva51ZtWY6zQc9xKXBvP+zSdcg4ieuFKWfq7ZL33iOgtJcx?=
 =?us-ascii?Q?mkdE9b/GdlrN+cR9Xsgo/5ZPmd76Y4WGJbKFsoxy3SUsugK8AI8661Bf66MI?=
 =?us-ascii?Q?GOKz/WLCSGsm42cmCM3KQKTiMKcyN6IO47NSrOUjXjLle088KxXfKSGseFf0?=
 =?us-ascii?Q?0mbWPLerLNNGMr0NwR+OtInX/Bu6/ORIQt2jHHE5FVuO9iTq9vVFu55JDj4X?=
 =?us-ascii?Q?qtm83whSTmY7oDQrCgt4JY6VT6R3d8AqAVJ9uXdAFtz2aS/RXVQd4kazIKys?=
 =?us-ascii?Q?2vJNY/5tvzDS8r2T4FB8rHZDt+lNaW7wKyN4pHYB4O8c+Xf8eTSsC5T4k8aD?=
 =?us-ascii?Q?VuXZTVtPm2LzqWLoru12mnvcBBtJHRykoEdjaZiIB0Bz/oArIQdZzss7uz6r?=
 =?us-ascii?Q?MgJp1EzGGD1xANZjljOEKHCkztQWnKbZXrZPP+/yarVuAGLdEYA4nTlXaJgv?=
 =?us-ascii?Q?qTCLN3yc2biuSuz+e+JiqT7NjvXRLa51jVran36oRxv8txmTnmKOz1rdLNvX?=
 =?us-ascii?Q?PrW5jKHj6TfX9OjX93CpUfvCf9W5oRIZAoE51qicHFoJ+e88gaTre1J2wjkv?=
 =?us-ascii?Q?1iHCYS6G09CC7fPIoRtGvrnpRUBxOwEyJnIVkoPLb+terhPWRwchhk6nH/+C?=
 =?us-ascii?Q?uorVUWuxEiVvRUewyY87KpmgEINK4UDSjdA4AZPnghJ5CrTtRmoPIqdMIbhd?=
 =?us-ascii?Q?29s/sA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7afdf9-c9bf-45f0-439f-08da724306c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 15:49:03.0137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBzdsaQndGTfhXyHC21kZVKv0ns5Ec4RvM1EQE/mDAxcvQIr481rVB1D0SPXJYdRFz5ARLbiNgySG5WtXbV7KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4875
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil@xs4all.nl>

Initializing arrays and validating or checking for equality of arrays
is suboptimal since it does this per element.

Change the ops to operate on the whole payload to speed up array
operations.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  19 +---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 129 +++++++++++++++-------
 include/media/v4l2-ctrls.h                |   6 +-
 3 files changed, 96 insertions(+), 58 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 67fbdccda2d83..a8c354ad3d234 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -89,10 +89,7 @@ static int req_to_user(struct v4l2_ext_control *c,
 /* Helper function: copy the initial control value back to the caller */
 static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 {
-	int idx;
-
-	for (idx = 0; idx < ctrl->elems; idx++)
-		ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
+	ctrl->type_ops->init(ctrl, 0, ctrl->elems, ctrl->p_new);
 
 	return ptr_to_user(c, ctrl, ctrl->p_new);
 }
@@ -122,7 +119,6 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 
 	if (ctrl->is_ptr && !ctrl->is_string) {
 		unsigned int elems = c->size / ctrl->elem_size;
-		unsigned int idx;
 
 		if (copy_from_user(ctrl->p_new.p, c->ptr, c->size))
 			return -EFAULT;
@@ -130,8 +126,7 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 		if (ctrl->is_dyn_array)
 			ctrl->new_elems = elems;
 		else if (ctrl->is_array)
-			for (idx = elems; idx < ctrl->elems; idx++)
-				ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
+			ctrl->type_ops->init(ctrl, elems, ctrl->elems, ctrl->p_new);
 		return 0;
 	}
 
@@ -499,12 +494,7 @@ EXPORT_SYMBOL(v4l2_g_ext_ctrls);
 /* Validate a new control */
 static int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
 {
-	unsigned int idx;
-	int err = 0;
-
-	for (idx = 0; !err && idx < ctrl->new_elems; idx++)
-		err = ctrl->type_ops->validate(ctrl, idx, p_new);
-	return err;
+	return ctrl->type_ops->validate(ctrl, ctrl->new_elems, p_new);
 }
 
 /* Validate controls. */
@@ -1017,8 +1007,7 @@ int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
 	ctrl->p_cur.p = p_array + elems * ctrl->elem_size;
 	for (i = 0; i < ctrl->nr_of_dims; i++)
 		ctrl->dims[i] = dims[i];
-	for (i = 0; i < elems; i++)
-		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
+	ctrl->type_ops->init(ctrl, 0, elems, ctrl->p_cur);
 	cur_to_new(ctrl);
 	send_event(NULL, ctrl, V4L2_EVENT_CTRL_CH_VALUE |
 			       V4L2_EVENT_CTRL_CH_DIMENSIONS);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 38030a7cb2338..4faba8ffe426a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -65,31 +65,27 @@ void send_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 changes)
 			v4l2_event_queue_fh(sev->fh, &ev);
 }
 
-static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
+static bool std_equal(const struct v4l2_ctrl *ctrl, u32 elems,
 		      union v4l2_ctrl_ptr ptr1,
 		      union v4l2_ctrl_ptr ptr2)
 {
+	unsigned int i;
+
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_BUTTON:
 		return false;
 	case V4L2_CTRL_TYPE_STRING:
-		idx *= ctrl->elem_size;
-		/* strings are always 0-terminated */
-		return !strcmp(ptr1.p_char + idx, ptr2.p_char + idx);
-	case V4L2_CTRL_TYPE_INTEGER64:
-		return ptr1.p_s64[idx] == ptr2.p_s64[idx];
-	case V4L2_CTRL_TYPE_U8:
-		return ptr1.p_u8[idx] == ptr2.p_u8[idx];
-	case V4L2_CTRL_TYPE_U16:
-		return ptr1.p_u16[idx] == ptr2.p_u16[idx];
-	case V4L2_CTRL_TYPE_U32:
-		return ptr1.p_u32[idx] == ptr2.p_u32[idx];
+		for (i = 0; i < elems; i++) {
+			unsigned int idx = i * ctrl->elem_size;
+
+			/* strings are always 0-terminated */
+			if (strcmp(ptr1.p_char + idx, ptr2.p_char + idx))
+				return false;
+		}
+		return true;
 	default:
-		if (ctrl->is_int)
-			return ptr1.p_s32[idx] == ptr2.p_s32[idx];
-		idx *= ctrl->elem_size;
-		return !memcmp(ptr1.p_const + idx, ptr2.p_const + idx,
-			       ctrl->elem_size);
+		return !memcmp(ptr1.p_const, ptr2.p_const,
+			       elems * ctrl->elem_size);
 	}
 }
 
@@ -181,40 +177,66 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
-static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
+static void std_init(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 elems,
 		     union v4l2_ctrl_ptr ptr)
 {
+	unsigned int i;
+
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_STRING:
-		idx *= ctrl->elem_size;
-		memset(ptr.p_char + idx, ' ', ctrl->minimum);
-		ptr.p_char[idx + ctrl->minimum] = '\0';
+		for (i = from_idx; i < elems; i++) {
+			unsigned int offset = i * ctrl->elem_size;
+
+			memset(ptr.p_char + offset, ' ', ctrl->minimum);
+			ptr.p_char[offset + ctrl->minimum] = '\0';
+		}
 		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
-		ptr.p_s64[idx] = ctrl->default_value;
+		if (ctrl->default_value) {
+			for (i = from_idx; i < elems; i++)
+				ptr.p_s64[i] = ctrl->default_value;
+		} else {
+			memset(ptr.p_s64 + from_idx, 0, elems * sizeof(s64));
+		}
 		break;
 	case V4L2_CTRL_TYPE_INTEGER:
 	case V4L2_CTRL_TYPE_INTEGER_MENU:
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_BITMASK:
 	case V4L2_CTRL_TYPE_BOOLEAN:
-		ptr.p_s32[idx] = ctrl->default_value;
+		if (ctrl->default_value) {
+			for (i = from_idx; i < elems; i++)
+				ptr.p_s32[i] = ctrl->default_value;
+		} else {
+			memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
+		}
 		break;
 	case V4L2_CTRL_TYPE_BUTTON:
 	case V4L2_CTRL_TYPE_CTRL_CLASS:
-		ptr.p_s32[idx] = 0;
+		memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
 		break;
 	case V4L2_CTRL_TYPE_U8:
-		ptr.p_u8[idx] = ctrl->default_value;
+		memset(ptr.p_u8 + from_idx, ctrl->default_value, elems);
 		break;
 	case V4L2_CTRL_TYPE_U16:
-		ptr.p_u16[idx] = ctrl->default_value;
+		if (ctrl->default_value) {
+			for (i = from_idx; i < elems; i++)
+				ptr.p_u16[i] = ctrl->default_value;
+		} else {
+			memset(ptr.p_u16 + from_idx, 0, elems * sizeof(u16));
+		}
 		break;
 	case V4L2_CTRL_TYPE_U32:
-		ptr.p_u32[idx] = ctrl->default_value;
+		if (ctrl->default_value) {
+			for (i = from_idx; i < elems; i++)
+				ptr.p_u32[i] = ctrl->default_value;
+		} else {
+			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
+		}
 		break;
 	default:
-		std_init_compound(ctrl, idx, ptr);
+		for (i = from_idx; i < elems; i++)
+			std_init_compound(ctrl, i, ptr);
 		break;
 	}
 }
@@ -895,8 +917,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	return 0;
 }
 
-static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
-			union v4l2_ctrl_ptr ptr)
+static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
+			     union v4l2_ctrl_ptr ptr)
 {
 	size_t len;
 	u64 offset;
@@ -964,6 +986,38 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
 	default:
 		return std_validate_compound(ctrl, idx, ptr);
 	}
+
+}
+
+static int std_validate(const struct v4l2_ctrl *ctrl, u32 elems,
+			union v4l2_ctrl_ptr ptr)
+{
+	unsigned int i;
+	int ret = 0;
+
+	switch ((u32)ctrl->type) {
+	case V4L2_CTRL_TYPE_U8:
+		if (ctrl->maximum == 0xff && ctrl->minimum == 0 && ctrl->step == 1)
+			return 0;
+		break;
+	case V4L2_CTRL_TYPE_U16:
+		if (ctrl->maximum == 0xffff && ctrl->minimum == 0 && ctrl->step == 1)
+			return 0;
+		break;
+	case V4L2_CTRL_TYPE_U32:
+		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
+			return 0;
+		break;
+
+	case V4L2_CTRL_TYPE_BUTTON:
+	case V4L2_CTRL_TYPE_CTRL_CLASS:
+		memset(ptr.p_s32, 0, elems * sizeof(s32));
+		return 0;
+	}
+
+	for (i = 0; !ret && i < elems; i++)
+		ret = std_validate_elem(ctrl, i, ptr);
+	return ret;
 }
 
 static const struct v4l2_ctrl_type_ops std_type_ops = {
@@ -1449,7 +1503,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	unsigned elems = 1;
 	bool is_array;
 	unsigned tot_ctrl_size;
-	unsigned idx;
 	void *data;
 	int err;
 
@@ -1664,10 +1717,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}
 
-	for (idx = 0; idx < elems; idx++) {
-		ctrl->type_ops->init(ctrl, idx, ctrl->p_cur);
-		ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
-	}
+	ctrl->type_ops->init(ctrl, 0, elems, ctrl->p_cur);
+	cur_to_new(ctrl);
 
 	if (handler_new_ref(hdl, ctrl, NULL, false, false)) {
 		kvfree(ctrl->p_array);
@@ -1984,7 +2035,6 @@ void update_from_auto_cluster(struct v4l2_ctrl *master)
 static int cluster_changed(struct v4l2_ctrl *master)
 {
 	bool changed = false;
-	unsigned int idx;
 	int i;
 
 	for (i = 0; i < master->ncontrols; i++) {
@@ -2010,10 +2060,9 @@ static int cluster_changed(struct v4l2_ctrl *master)
 
 		if (ctrl->elems != ctrl->new_elems)
 			ctrl_changed = true;
-
-		for (idx = 0; !ctrl_changed && idx < ctrl->elems; idx++)
-			ctrl_changed = !ctrl->type_ops->equal(ctrl, idx,
-				ctrl->p_cur, ctrl->p_new);
+		if (!ctrl_changed)
+			ctrl_changed = !ctrl->type_ops->equal(ctrl,
+				ctrl->elems, ctrl->p_cur, ctrl->p_new);
 		ctrl->has_changed = ctrl_changed;
 		changed |= ctrl->has_changed;
 	}
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 683e9903a6ea6..62052e1874bdf 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -134,13 +134,13 @@ struct v4l2_ctrl_ops {
  *	otherwise.
  */
 struct v4l2_ctrl_type_ops {
-	bool (*equal)(const struct v4l2_ctrl *ctrl, u32 idx,
+	bool (*equal)(const struct v4l2_ctrl *ctrl, u32 elems,
 		      union v4l2_ctrl_ptr ptr1,
 		      union v4l2_ctrl_ptr ptr2);
-	void (*init)(const struct v4l2_ctrl *ctrl, u32 idx,
+	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 elems,
 		     union v4l2_ctrl_ptr ptr);
 	void (*log)(const struct v4l2_ctrl *ctrl);
-	int (*validate)(const struct v4l2_ctrl *ctrl, u32 idx,
+	int (*validate)(const struct v4l2_ctrl *ctrl, u32 elems,
 			union v4l2_ctrl_ptr ptr);
 };
 
-- 
2.37.1

