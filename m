Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8D7585A0C
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 12:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbiG3KZG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 06:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbiG3KZE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 06:25:04 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9FA2BB2F;
        Sat, 30 Jul 2022 03:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmEUo1uX28V9/8kRvbg45gb1q12o0/j3rv2kejSWthx4u4k7MTW/QYldMF3g7KqM8dNzZayguX/oiSPpDHaUnKD7UUJn0wnQ2S6Ms/TrDNlUC5gHJ+bPbamiGm+VC3motnFQ8EnMA5n+paAXGKWBkafIOPCYIP7nESPJzeTlN+xOv0LsCrS0htDQYy2ESbpYHUNnDLI1TN4kAYQ5B3/x9wP1Szp1bRC5LU8ani0JObye4dycDsbU1/A2iGND5QYGNvDw+d1DxL3e/ITdPgVdnlV5LOP+xRsFD7ueJyM7I2jYunQbUoO82RmpgPuxoqOdwrqVSd/jSx0J+JLmDmF8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGMq/W2/ac8V0jfSl0o8R/flkvjAyw1EZ8JJ38UbspQ=;
 b=lqAZXUq8h+yhjzXs7+3A19iINbLTsT7sfntwguB5DpYZe/WVTQjUWBOtk841TGVF+tn35sebtOkNNedqeaP/LarTPjv9NlA15NjQIMb2ddZp5GNMqH5X9sXqRIioAN0gQMgQ5c6WzJniUz5hgPBhwMwasrBU4S+Uf/0v5SjOM3IZfIUFVNJXGp0JonVhgIYE6OP7X0CLj+wGpojCHUzEafGB7CT4zsTnkG2/oOiQZ6buMxMvn6GC+s3REyefwoNTUtryq/k3R0QLTIMftCpaIzUKbx0fkNuE7MtU1Bxh9u/dxzxChQaxzWXMzlrl/vj+FtO5r8C9ClStIAVt601zQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGMq/W2/ac8V0jfSl0o8R/flkvjAyw1EZ8JJ38UbspQ=;
 b=UT/7JlUNaxN1t+quHxDkhq+L8aYfZRDcrMjYNpSDG8aj8dQokf5IhyoRzvD9kYs98NtBfVrmni5XOL/BaC+2X6Urp7sOj+IsKRoV9SCa7Zhh9Lk15jIedU/ldUfAUA3rt0Lgiz5wZxgoizCpyeSLwjfikfW8BLMkeByj4GXJKIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 10:25:00 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 10:25:00 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v9 1/8] v4l2-ctrls: optimize type_ops for arrays
Date:   Sat, 30 Jul 2022 12:24:06 +0200
Message-Id: <20220730102413.547698-2-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
References: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::9) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10870c48-ecfa-41a8-611d-08da7215c085
X-MS-TrafficTypeDiagnostic: PAXPR04MB8621:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wOxhLqx9bxaxpJREIizxTOjwlD7q/rEMO2pApQxAd9ArzMK4AyUlgNN6jOfGUOqfkMoWFwSS0WZtAe5dI0rMzneyyk/clcdtp6OGsu9PRO14rZhTIZHuIq2ujAcFaNBez7IuHq70TTjdqwQK9TYXvxMS/+nD1wGSz/xIV15+GV+3FENlXq8KE+7y+zb1z1AbUxtlXfD1B1UgVIwep8wjUbwaNPmFyB8d4GaRNwYhukLRYjdJeT8nn2Yyfwjx8bFaac/YgBpmzUWzP7r0SgpUwobzq16mfNSgG0opTeJ6RwEajxbpZEoE/4ZV1Jfxbp3VwMG48mM1SlcoQJK9SrfN4/2VskBL9eN6DeSoXv1hsS/chaIoctJcAPBkDjLNrEY1uHfBykYMyem+Ih/yKNENB0aeDkEBEnYnFgPM+alR1Z5QnYQQZ+8/3J1SeZK9rQC+eX42dD5zf9re1wH7ulLRgVVgf+lmBLF8CVfVKdg70QGcos5gnuXiJJtQ/8AUfh8FtusM9tOJtCRk+1EZeJm3sL9vKVtrQxnWjKP96bNC4he2LVd369Q1PvARXvgRkg4Oc3s005XgYqZSEihocl2A0eRlXgMGo4w2ALewY7ZP4IkGHTTBl82aSfbHY9BbUsn7IVcJln8aj3+ztohPcEj4B357sXG3+i2Ut7nI29+y7J09ZUouPAIg5sE7mgPemftqv5EeBy79OK/RRAz1cKoEOwjbRUsul7kl1ECAOvMLem3OhuYHUgQH3dFPMzKE60Xg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(7416002)(6512007)(4326008)(8676002)(44832011)(186003)(83380400001)(52116002)(66556008)(6506007)(38100700002)(66476007)(66946007)(2906002)(86362001)(8936002)(41300700001)(5660300002)(478600001)(1076003)(6486002)(2616005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uzzsqMrOaze2x8qf8cDtaC3uI20sdqAYhi+ktRT7c8S5RWX89OCWqyMavuzS?=
 =?us-ascii?Q?S4w5ofpLD8haa8/p262/uOdBu6HkqTnNBXsLBC0OxvQZteSp355sdKTRo4Ti?=
 =?us-ascii?Q?e/GXdoBYLlALk0y18mBXoPkdUAcOIAqKfWoAqLt6oKEaKGBeD8yW3l2ykwfl?=
 =?us-ascii?Q?SRTqSGQve5CmZytTgXbPLEX4XaVr0cvw+cv0pwISUQEHZkTc4lyn87sU7xaZ?=
 =?us-ascii?Q?2TB48+ZnI0EXkUHQqVKLl/e9VV2X/+YmMbjeOKw9xPwNQYFc2C7SmRO/Ym5y?=
 =?us-ascii?Q?kvgI06yyjjed1N34fAFh5P0lTljMgO+QkGUnO1SYmt2DdPr1VygBFGhdMZkb?=
 =?us-ascii?Q?NKaTTfC7uQIhY3FCKWRGXdzUVpbHmGCgi0eRlKPtxBWTRTec/82uGw1BXnei?=
 =?us-ascii?Q?JZWfasCOT7x+CSopJ+YDTDq0qwbDLotAV/wN/DE326lXX5newEcUo0M1NqYC?=
 =?us-ascii?Q?7jAhkTTRmvBpQjsptibmypA95ucsIAYe9XhJIQ8AWRVDk+mB4ZrqWeGgtZMu?=
 =?us-ascii?Q?jWnMKPusctCjPrU/UnCPIAqdoTlo+MVSWf2oj/hli/z/hyCDHr8RjPC6nntm?=
 =?us-ascii?Q?VxdH+NyeCmnezEY+NkfCZ07raiv61ae+A4YC07K1jbl/a3Gk8rfngVCZ5cgb?=
 =?us-ascii?Q?53Vk4unZA88X3V+slMunHJC5ecUsONnJNlvdxW0hitNF/FQwxqUZEl/HJwiE?=
 =?us-ascii?Q?p3fCu4Pj+DGzASm0R0USomGSsf0pN7UDu785vvvzCGjJwjnwfdCpI6/9BVQW?=
 =?us-ascii?Q?75LVLzD2FD+zcE+B2KEwtyvIzmLRudpC4KE+HoHbI6k6qMjy3mxQk921iluf?=
 =?us-ascii?Q?Keuli/UMxQ7iiapPQIpQC4es9XDPUEwYayOFILju+emokZ6NAj9yj2FVwfaL?=
 =?us-ascii?Q?a4sKL5MxwceHqlvwWMre1qBjeemmikp6P76m8d1FcbN+6sV8Ff/dVD+PDCqh?=
 =?us-ascii?Q?iD4erdU9UFjG6Mp76yYPWbJrpaZ8aOItFALtnyCpjwH9eioev3yqJDV/xVmp?=
 =?us-ascii?Q?rjNBSK1L1RJJppygMDObE48ocO+u9IhABPugHdhtI4NWOSWPm4veqa5Z02wc?=
 =?us-ascii?Q?KG8k9OrAaD8WA23m3iZUeS3z5rYflXrlGeZelJZJzxG6J8JmMXfqiZecqg9d?=
 =?us-ascii?Q?ZGm3e4zfXo1Bi8FvofMqf7nO3qvA0OunSsVUHLhQap4AulihYl4iBzlvMCNf?=
 =?us-ascii?Q?lbRpQ7tu8dOFEqamBXA7N/aatLQG0S2ZMXSvX+9JTc1r8pDTktz3FtSiQSvV?=
 =?us-ascii?Q?GVlJK5iflU+bFpkzZt11TdJWE7ZSDI+AkTOw7tUHQ4uICVwmBhrxDhFMJgsN?=
 =?us-ascii?Q?L4ZXPQenPeMLQu1rsfQekgiM3fO18T8qPSbnEZ+NK+l2ZOtLxCXuDIR+R0hd?=
 =?us-ascii?Q?ChrilLdsEP7A3Gq5MtbCzTgBQOTyhBXGnu5g1Uxe7MqR0iWsUIhQ/vdmLTUj?=
 =?us-ascii?Q?bkJOURzOiRdsJIyiT+oGH9CDCUQs+9vv/npK/i8bzbPkzT4RrusHBcqIwPuW?=
 =?us-ascii?Q?bgHjTh3EAhL/D3syjAcWVSbYyr+WzwoSW83uHEkmwqNJrl2WXOqZLMdAGILn?=
 =?us-ascii?Q?XP66FQbpx+W/XGV6eFhHdJDidBlxNQf5tWvjsT7IhmdpTjnIJjakz/E4USff?=
 =?us-ascii?Q?cYtBAiVGx/CoMgeQAQO8LNnSAGTPd8nGoPG7XsPu34IQ+uLDAzedVFEROmZD?=
 =?us-ascii?Q?A8GDzg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10870c48-ecfa-41a8-611d-08da7215c085
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 10:25:00.0118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SM32HLp7ewgZqweKLEtFSbCOCljOAC01u0U6+J1av03OVr17P2AVCXDYG7T871vUEt+QZIZujGxsQUoQGwciQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621
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

