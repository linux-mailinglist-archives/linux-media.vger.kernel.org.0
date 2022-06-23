Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9822A557DD3
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbiFWOcl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbiFWOcj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:39 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC5C457B2;
        Thu, 23 Jun 2022 07:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpJD/RWAdkRJGuCApKIX8MWfJfHcpfLLOrbVHsbY6SyNpcly8Ut55bd5zDwnhSuMpEPq3ZvrT+W9mNLfJnMEXHLCwXfV3IDIetFbqsAgdglPZb6MLaIxg/cOmPG9tS9D7iM2Vil9/LsJ0SEhYhXBIBbXz+4lPqj56wlYCurRHl2/2XUitOGWvi43EznHLbZLmssCG0HqinuSQGnjp8PRTJgL2xwum55pK2gK9saWz2dJ8JunWy9Bb/FDPu0GWUZXex6Ar44vI3Z4JwaMMqi6OrYrvPGd30+oQdYPVYLz1Zo8Vgjle+EyKBrv2SjEk+99jn0JzLYrdT5IceF9n7W2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ub4+JZBGltLoOx1xK+8vwkxZwHiJdknEo54z47mSJs=;
 b=VeWYtx3H7ArE++4QuYIJAQMFAfBLY2F9SfhY86HU/8RBXR+29pc7xXJ3DiNESgcWqC6w3pnmZO3u8hBvWIB1RRuzlGxTn65+84JrHDtyq6y9htooDNRpeo/HJ3+G9XsuS4YCD4fs1fV3ma4CEv+0BE0ZvmzELY8Dehi1/6tg5X0v5uZEteUMuqd86f5BXrQE5UHKiu3SOJplMERBx07WUyXlE7mYfPCQpNaI/OdjuSLBJCZPGqNMtM2rpbxyueBmsSedf2a8xgzPTNNCPZ0WnBScSj5ypXR7ujekl9H6WXu79ovYu+XXbPpIBGpYOh5AcEbZTLb9GvnzYS1shGe/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ub4+JZBGltLoOx1xK+8vwkxZwHiJdknEo54z47mSJs=;
 b=LJcWJGVxXMR4LVts+drunMxwDMaMZUzK9gz089NGGq/PXabkfU7H0ssJI4HXDHwgpU6BEXx+lj9c4379uVcSCVAuX09uvORt/xLysaDZnZF4zHntHk45VnIOpmNKfOi0khdJB78oUO67FgFRLyrMPSLrVkU1ssQPfHMNNQoiPUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB8PR04MB6505.eurprd04.prod.outlook.com (2603:10a6:10:10d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 14:32:35 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:35 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 08/14] vivid: add pixel_array test control
Date:   Thu, 23 Jun 2022 16:31:09 +0200
Message-Id: <20220623143115.3185297-9-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 389a6efd-83e4-4187-dfcc-08da5525372b
X-MS-TrafficTypeDiagnostic: DB8PR04MB6505:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6505D58985133A42A2E015A5BAB59@DB8PR04MB6505.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9SgzBox73qyQdfSv6vDZmSgNN3VypiSeHi1pYPIPT8NEHFwomHVxU7QSnqKjaTrqaYEfdOUA+UKCJX9ChZRNdpYUoxPkkia5x1Cbn2VP3ANC2oBXDbG3LGeWF8LPYTzPKdK6Oz639qqf32MTm9dXTz0kbAM1nhWcU2ojw2b5fiZhfSwyHZgGunSnuStWANVScLAX+G9mHSRZirFtRDYBPmuBtgamEZN38cBlVLyr9v4j6AD3jvriPIiFoh6PdEayoaM8DBn11WtYjZ5na3ngbLvNtth/QXq22QntpB6rs5YdXCQTzI42tE2m3WG03QrK8EQiELTIW0WHLhFjR4lq//JD4zS0qEpNKzcxJbHx1ZTaWFHyTyeQy+DPDd5LzMH4y+DNGhDUt36YL5e0UJtp0ITVqv7VGykl8/+L/O5YWAVPpDI+V824xuTsv9HCwoyGBSfkqvsHzqYqJLtKu9R2vtCUnTPiO34UNV/1ZbVeWDHIVbmqQrZ/FZSuw7VnlGewZUkFxAZ87GM/gIN6fdzkiHsC95m9zXX049jmq3xj/Go2Yu62t3zVOjVrn2daFXvjjhkO3tOORRz8lbWLNlNb/+LSqTTfAQMM3G/PgV7HQCHojozMfz+w91xp4VgbumiT7hrgnyj8xrSoxyPe2dQtsLYHJI1CkKLj1xFU0EjpNnG7oxJ9X8qEl5SLZXEyhPtcAG0Viq9OkO2U/1E9FhH3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(2906002)(38100700002)(6666004)(66946007)(86362001)(1076003)(66556008)(44832011)(8676002)(66476007)(6486002)(316002)(4326008)(478600001)(6512007)(5660300002)(7416002)(186003)(83380400001)(2616005)(52116002)(6506007)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W7CvrQdjhaYxCrqRx3sc+bz99y/YskuMLYzmjK+3eKtb7fj7IS7klpDUI91d?=
 =?us-ascii?Q?zH++eWEAj1TVd14HujSJuZdoBsuaNwmkNxuG6GkP70wiKq9Cyan1Dx6RYOsF?=
 =?us-ascii?Q?of00Z+2jk5mu1spL8DykJixqc6zAWPGruQvgTPZaSt+93guXXwlJO1x+otB3?=
 =?us-ascii?Q?9o8ghulljQuApYUnMlWfkwVI0R/D21T0XDFR2IaPx9SWtjvDDTONw1gd80ue?=
 =?us-ascii?Q?tPyHljhSOVbtiTBNh1K+FY6agosXiyx1yqsaTu8twAz95WYLp8ToxE0dcX0f?=
 =?us-ascii?Q?q22mQ/6UO/prU7Dpjc3v0gc5+S2SuJXQDUF8DZ6suaSpQd9kZzVp1BQShLsO?=
 =?us-ascii?Q?+ArHsJ3dSxrX/gPcYYHBmxxJ27f5S22TzF8uv8fZianBY2eKcEFoCVV6PtFL?=
 =?us-ascii?Q?HGmE9ke1OHMObyOrEFxXXsMYq+gAH1TLvJBeimxH4coToIMc/9dcLdet6bik?=
 =?us-ascii?Q?mnZfInZhifp6fI5luuGdnXApvocEYhMxzMcF3pkt4RF24m5xchZEbT9Btbzv?=
 =?us-ascii?Q?B16m5N2i9TE0NB2yKTdvNAfDNGREyAvS+yZBodLXAwe4kLo9IZMv1wOdrOI1?=
 =?us-ascii?Q?eQIrZCF13zGLxBCvPWIq92tTn7W7K44ObVUcqz7JHx0pM+NxxbFK2zM+rnuB?=
 =?us-ascii?Q?kWReRvC/Fo7fOONNtwPuB5b7nePzJ8+NwHUVjO7jR5OfzRvZP9ISDgp5Orku?=
 =?us-ascii?Q?ZMSqNn6zgeCKvyPkaHsGKC9CumjTrA0U4L9VTHoMKFLgKBPxwHQJ2264rBp2?=
 =?us-ascii?Q?NB8gZBhFiEekyvmaX5wtSMVFnMJbGOhUNAn29fBMZI8LQmJTzoaPjFXf+PoH?=
 =?us-ascii?Q?/U/VHocB+gkSF9ShFdGiz0xcnHj6Q6Enoe140XQ+sk/jMUF0S2XiGfaIGv3w?=
 =?us-ascii?Q?7yEjNt/KaPdjtkaaiChmWWvviP6QpCGSNbQYWHtbmehRehyEJt62QN1ycKxb?=
 =?us-ascii?Q?Flp9WmlKA2KEmcp68rxGIz3gswfDgujMA4EVdjfQWiLMqxl8c6unnZ5bJX0J?=
 =?us-ascii?Q?7CiZZYwkAtPfLr1oMFjztb06ErdGuE0wngwLvoouh8X0gfvWWp7oIzOyj1ga?=
 =?us-ascii?Q?a2bhNu6zqmJGpwuoG6x48YtjbBCdGTVXPxV20b0mpLYD8CSIbu91DoM+QCTG?=
 =?us-ascii?Q?cGpnBva/N/Jp+pnRPrEJHCXZIJQh6NydMNBsi32LWRSLytjTMvwMGFnjfrou?=
 =?us-ascii?Q?s44MM4PQC19XBxBl/E5LIBEFBasXjpODekyfOxFaoAl4EEpMOkpaSLJpWIMG?=
 =?us-ascii?Q?vZO0k53vQKUZsWdQXitH/gHjSJLGIJTmRuSpNHNuZAYCbQgTQQH/RjIueFZm?=
 =?us-ascii?Q?FnuGgFmXbQOmmUR1wBYGPFpWsF/8YZQ2fXrFYAuKX/Hsi54CQe7X6vN/TQBI?=
 =?us-ascii?Q?x4DwLYGvSu/vsUKtN+KfoGkY+l+/2Mp/4Y3xqtyfNoYmk39V+/4UdWLpj8a3?=
 =?us-ascii?Q?SPApW04O8xf8amdJ6h2nOrbPKwAzlJ2WKJEQpLnoxHPjDE0xmrlv8WI3xWBN?=
 =?us-ascii?Q?Ig3umxegj3MvDlZqq7xg4HPrsj3VdHk2oHsHdjm8RwAiJr4WBLZUOUXz42c+?=
 =?us-ascii?Q?uaKlF+Ayq8vBPqYgpHVcdVVYtZw+C676v1lzYOLcMv04/WVNkP283mZcpgmX?=
 =?us-ascii?Q?XZzEW1IoE7bFUL0RANQTitLU4EMebiyEIinIkKZi6orOk900rYVZnaQqBjyK?=
 =?us-ascii?Q?h5Nnr0KMt/ZQL61Ixd2dNo/gcnrL4JwIZG1KjSExbDJDwURjb6ch0cYJ0OE0?=
 =?us-ascii?Q?6ENEgl1Go9hoAGGzuSuYY5at+qcCgmeYXClEprwVvOX1aCmKG4TssC4IFQpz?=
X-MS-Exchange-AntiSpam-MessageData-1: yJ1RvoGQbPELFgtnya/V9nc9i7gp3/h8kLc=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 389a6efd-83e4-4187-dfcc-08da5525372b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:35.5525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtPKbf2oDA950qIeY34tyAGWjw30a647LT6i6v6+3MvVre2pkfpJ31hE+dkOkCI1r/fU/hHgiMAWAJ1zDYJPtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6505
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This control will change dimensions according to the source resolution.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.h    |  1 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c   | 14 ++++++++++++++
 drivers/media/test-drivers/vivid/vivid-vid-cap.c |  4 ++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index 176b72cb143b..e7b23ebc705e 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -227,6 +227,7 @@ struct vivid_dev {
 	struct v4l2_ctrl		*bitmask;
 	struct v4l2_ctrl		*int_menu;
 	struct v4l2_ctrl		*ro_int32;
+	struct v4l2_ctrl		*pixel_array;
 	struct v4l2_ctrl		*test_pattern;
 	struct v4l2_ctrl		*colorspace;
 	struct v4l2_ctrl		*rgb_range_cap;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 7267892dc18a..c46986519bee 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -35,6 +35,7 @@
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
 #define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
+#define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -227,6 +228,18 @@ static const struct v4l2_ctrl_config vivid_ctrl_u8_4d_array = {
 	.dims = { 2, 3, 4, 5 },
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_u8_pixel_array = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_U8_PIXEL_ARRAY,
+	.name = "U8 Pixel Array",
+	.type = V4L2_CTRL_TYPE_U8,
+	.def = 0x80,
+	.min = 0x00,
+	.max = 0xff,
+	.step = 1,
+	.dims = { 640, 360 },
+};
+
 static const char * const vivid_ctrl_menu_strings[] = {
 	"Menu Item 0 (Skipped)",
 	"Menu Item 1",
@@ -1629,6 +1642,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
+	dev->pixel_array = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_pixel_array, NULL);
 
 	if (dev->has_vid_cap) {
 		/* Image Processing Controls */
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index b9caa4b26209..6dc4091fcabb 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -381,6 +381,7 @@ static enum tpg_pixel_aspect vivid_get_pixel_aspect(const struct vivid_dev *dev)
 void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 {
 	struct v4l2_bt_timings *bt = &dev->dv_timings_cap[dev->input].bt;
+	u32 dims[V4L2_CTRL_MAX_DIMS] = {};
 	unsigned size;
 	u64 pixelclock;
 
@@ -459,6 +460,9 @@ void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 	tpg_s_video_aspect(&dev->tpg, vivid_get_video_aspect(dev));
 	tpg_s_pixel_aspect(&dev->tpg, vivid_get_pixel_aspect(dev));
 	tpg_update_mv_step(&dev->tpg);
+	dims[0] = dev->src_rect.width;
+	dims[1] = dev->src_rect.height;
+	v4l2_ctrl_modify_dimensions(dev->pixel_array, dims);
 }
 
 /* Map the field to something that is valid for the current input */
-- 
2.36.1

