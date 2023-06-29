Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12192741DB0
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 03:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjF2BcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 21:32:08 -0400
Received: from mail-vi1eur03on2060.outbound.protection.outlook.com ([40.107.103.60]:17889
        "EHLO EUR03-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229533AbjF2BcG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 21:32:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeU5j++4cS7pTUzhPVrJlL6r4GKvSnCq4Ls+G8GkUkkpcsS5gxsDmLJA4j0o2bKi1VV+DQLCvMDd5Hz6lje31h5AlRLOiFIZLx+VYLTQbAsu2KQgZWSDCvjELeTmf/OBFUzljofq8Vw+s55stLmjMj363kY3NFhhgYZgsBxU6nvH9sQcu1Ra2scgmDObhZ19hMRIlo6onCes4ftUcfc/6TPzuTUQp6UCtU4wqBqmQH8r4JfEllPv82mahecBMC72OSWPuOzKz+olENze3RO+76IDphne6nabkycClGijmVrjnMlvC/Wn8ELZwLpCgbz8HlJrUFxeO5M+UDufXz3GHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCKqOUsbfyzykJnAeAzCyOOtH2RbqVYINxQSW2M12XE=;
 b=f0owbJSafEwyyw9Q2jFfJ1r0GMxDcFll1Irt3+Qs0drVJolxhNTpr1YPrzsnXRT0xF/WvQv3XmvQ6SN6dGAqt6C+Bn50Y46T1TqqrsMjKa43+WNBcVS78O1p8gOn5/idlQq0AnXLZ2UhfCXhdt5o5w8LfZj1/XxQy/q5GUlwBpPqLvH8uT3idzPsRhMHeBDAfTxZyiGamEvCNI7B814JR10dRDNPE7d1gw0fgJ9MtAbQquagT0fFZG8wPBHutT7kM5DNebtQsBLyGWyOFm1z08scRmClA0AcqwC4Y7K2LkQ87WyivlD6OKakp2oV8Bo4qH4Oc+X+2v9IgOsy6WeoEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCKqOUsbfyzykJnAeAzCyOOtH2RbqVYINxQSW2M12XE=;
 b=VCiD32Fx7gVyYYL2W6HVT0kCQ8pwmcBw1INsikHfp1tflG1oIwfpnj/ZV5ZV9Ut+dYWPr1eY2u4mVet1tbEQ1kQ/Em8cy9E1omsuchQMu+XObuLk7UwoclgiDIrCxMWER14swYsU/ODq7U+YrX3czDYvSxBDIARxY48iLqWDcyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 01:32:04 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6544.019; Thu, 29 Jun 2023
 01:32:03 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v5 2/3] media: nxp: imx8-isi: move i.MX8 gasket configuration to an ops structure
Date:   Thu, 29 Jun 2023 09:36:20 +0800
Message-Id: <20230629013621.2388121-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
References: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4525ed-78a7-4e33-81dd-08db7840a492
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4vzQVXkSQAoecrWhusZheZiktkWcmFFx1unS5GYBIL+UO7K4pdY416n/UkVo6A7g88R5DqIV2KAy7/3N+TeFmEE6NQjful1nYOB9f7VoACL2biYy1appud0tZ8H8ahRmAGncCvl+uWg8i8HRCyPGAXRScVBbqOr6m0auu4BJ6WbWKLDjcDupP8EG2xdnifE6ZjnxlsdKzL4yZPphAl9dpHmYXGMLSlAiVwnqq0Cz/+3xF6IFwyaGZ9/iLKwty3cBkBfrHd7+B2v94i+jXUQn21mK9oT5Si6TIOAhbdZTgo7zRwjejzFfT8HIK82DHa0a5IkDLs9WSbjD4m776P7qcOIsAAAO/9qyiNc0hBhRkx2I0tmsXb3GZFsOwr2cYk06eeSzP0q4hFhbW/xwuuPKZq4Y3377LCP4lB9EMulFH2vNCCIy/p8nWdZeYCauulkRsGNwMcgMPqEvi/VzBlzePPWjg+Wm5BjI4+3fGMz8YHeqOwmUfYooCh/RFA19TxbJVO1BSIS/sQJY7fTRTJjRnLgorTunb49AXHrI3MuipaJlUz/+ezg4o0EzkYiw8A0Z39PN1adSs6jeLzBrFYeYSCrB7QQo3LQBSZvQIj1p9/ZZjuIiwXtA3W7lSlAFdFX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199021)(6512007)(1076003)(5660300002)(7416002)(66556008)(8936002)(4326008)(66946007)(316002)(66476007)(8676002)(478600001)(6506007)(86362001)(2906002)(41300700001)(26005)(52116002)(6486002)(186003)(9686003)(2616005)(6666004)(38100700002)(38350700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cgCWl9MpGqSUAsnhWjFJQIO54sg5j0feVvPLBNZVFd2HJFvnGt3qJXrO8uCK?=
 =?us-ascii?Q?lscINaVKDQAi+wD0iHURGXnRn8Y/k1tjUAmrE2knt4GJvyAU9aWP8/BhqAE6?=
 =?us-ascii?Q?BmDmZR/A+0vnv+v/XDnElbGeWvfepAKUlJlNDoGIyXq6D/XADviQ2MtBoJyK?=
 =?us-ascii?Q?0ksy1YtPwSGuIonj6dbvwd+l1hLkNnqISzco4LYB2Mox99UCF5rivSK9G5ve?=
 =?us-ascii?Q?+5YQnnpfSTntrWHwmgHOEYCSUJVnlRJ6Vmzjm5N2/9oqXBaNRFeDGBEMDYfP?=
 =?us-ascii?Q?pzY6n+Xl8spZxS4RDSlsE7u1ptQ9Psy9fyc6lnJ8qayNPM2n4XFGhiHdx1Rr?=
 =?us-ascii?Q?lDVAwckBP0hRKU4FSrhz7pHu+AYR68agnxasbTDrmL3P7/JTP22LZ+DV9aOa?=
 =?us-ascii?Q?tSN0vYi09TmaNO7rifnx0IoS6xeTbchUHO2Mg4sASjpPYBoN+A7qRFWZeRbx?=
 =?us-ascii?Q?xXKffG42OVd1P/Uz7BKidtKXsr8Lviys4xuvuXhmR1cbwWgbSC2yErO/Uh7p?=
 =?us-ascii?Q?QLKEditZ6Z5k2p7lA1VxxAG0331RYz9IbV4OVHkOb1r34Vhht2CnZUuVnnv/?=
 =?us-ascii?Q?2eLC3elyx5Q60rDgMhmPAeba2mVJJV3F0uHnHcANc64ICAXKtQsKkHdwbmqM?=
 =?us-ascii?Q?9TTXw+161kwSNx1fhdnOhbFRUSQUPVTJYEopo8ik4omqV/wyF6Wc/lLI1XkZ?=
 =?us-ascii?Q?GRGd1jArgjXX8sdl1r9GWwHbusRa8TgfsqJqC8kW398e2m76gkwPezT2W9lj?=
 =?us-ascii?Q?ndHF8pcGwBgql2e8RQCTKPlfe0PqrxPyqIOsldh7BTbF/WrwZNsPlWIM3vBb?=
 =?us-ascii?Q?PgtUG9PQ+H3lL6vGcGeS0OJJiCBTKyljvnv5mPtI+Atf0fKcC9KDxgCH3skI?=
 =?us-ascii?Q?MlpQkIZuDorpqk+8PTT+H+MLt+XJAZIGKmEyzvi+IkJay+KYDTd2dm6W6Xhr?=
 =?us-ascii?Q?nwRbfoNQo79KJuIDdcVoD7gi9pK6LTdXUh2Yi55xWjROya9T09W+uETC41kp?=
 =?us-ascii?Q?TKoAZQet/SKweqKNnp3cdDCP3A3B1eA/bVlU/ThjBd6btFIWduDjk6aDOiMn?=
 =?us-ascii?Q?sC+6HMvvnilb7aM139amv9lDs43U2OP5hVtMGgYkkr74UNuUen9deF6NgKQj?=
 =?us-ascii?Q?9DyZFOdN970j1lou+Ve2IBZKxbF/Cs+3FTcDTaHW4GFMhPM/B6fr0tFuy8Wu?=
 =?us-ascii?Q?ASYb0NsMFlJvoyPh5LBPxZ3k9ORIog8kSc9XsPteZFFTZ/QhkZyalwsYIFUj?=
 =?us-ascii?Q?v8v/xqvhH6Nlg2aEYjjUn2qR/VW3vStO3gPpXipWdLj+/t4Heh0YvWGOU55i?=
 =?us-ascii?Q?bIrhWq6uNwKb7bo+wSfem/AN3x+Jsp2fe1WRv2a/mQu3v92Ipmj+Kdi8x4pn?=
 =?us-ascii?Q?8zb0KDPs3ToQ+MiDWJnH4epB9uW6E9DBtFQemkqxm/IEDYraT5Ojf+4p07vl?=
 =?us-ascii?Q?cyjWT1Zo4tdSfZowKIRmxYg3VhF2VZ7EIAW2tSMMuQ9XfO8hurxuKRHX5VAH?=
 =?us-ascii?Q?IlkigokXCrWCZLYgCJ9VPA9zY9hfNhtYt36aXN/SIZrpMltk+Y7mErU/Lp5b?=
 =?us-ascii?Q?twbhMXwUhzvM1VoZqnd269u/G9T2A9Ix9VlH35G3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4525ed-78a7-4e33-81dd-08db7840a492
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 01:32:03.9032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFfYBunVwUmSxy2bXX6NF1BhvN29McBdsUvRPtUp6sfh8yb1MIEZ81zIrWlW7tnlFZvGOEBvM13ZoIUuOsHVfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

The i.MX93 includes an ISI instance compatible with the imx8-isi
driver, but with a different gasket. To prepare for this, make the
gasket configuration modular by moving the code to an ops structure.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/Makefile  |  4 +-
 .../platform/nxp/imx8-isi/imx8-isi-core.c     |  6 +-
 .../platform/nxp/imx8-isi/imx8-isi-core.h     | 12 +++-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 36 ++----------
 .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 55 +++++++++++++++++++
 5 files changed, 77 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/Makefile b/drivers/media/platform/nxp/imx8-isi/Makefile
index 9bff9297686d..4713c4e8b64b 100644
--- a/drivers/media/platform/nxp/imx8-isi/Makefile
+++ b/drivers/media/platform/nxp/imx8-isi/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-imx8-isi-y := imx8-isi-core.o imx8-isi-crossbar.o imx8-isi-hw.o \
-	imx8-isi-pipe.o imx8-isi-video.o
+imx8-isi-y := imx8-isi-core.o imx8-isi-crossbar.o imx8-isi-gasket.o \
+	imx8-isi-hw.o imx8-isi-pipe.o imx8-isi-video.o
 imx8-isi-$(CONFIG_DEBUG_FS) += imx8-isi-debug.o
 imx8-isi-$(CONFIG_VIDEO_IMX8_ISI_M2M) += imx8-isi-m2m.o
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 253e77189b69..5165f8960c2c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -289,7 +289,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.clks			= mxc_imx8mn_clks,
 	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= false,
-	.has_gasket		= true,
+	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= false,
 };
 
@@ -303,7 +303,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.clks			= mxc_imx8mn_clks,
 	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= true,
-	.has_gasket		= true,
+	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= true,
 };
 
@@ -443,7 +443,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return PTR_ERR(isi->regs);
 	}
 
-	if (isi->pdata->has_gasket) {
+	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
 		if (IS_ERR(isi->gasket)) {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index e469788a9e6c..78ca047d93d1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -147,6 +147,14 @@ struct mxc_isi_set_thd {
 	struct mxc_isi_panic_thd panic_set_thd_v;
 };
 
+struct mxc_gasket_ops {
+	void (*enable)(struct mxc_isi_dev *isi,
+		       const struct v4l2_mbus_frame_desc *fd,
+		       const struct v4l2_mbus_framefmt *fmt,
+		       const unsigned int port);
+	void (*disable)(struct mxc_isi_dev *isi, const unsigned int port);
+};
+
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
@@ -159,10 +167,10 @@ struct mxc_isi_plat_data {
 	unsigned int reg_offset;
 	const struct mxc_isi_ier_reg  *ier_reg;
 	const struct mxc_isi_set_thd *set_thd;
+	const struct mxc_gasket_ops *gasket_ops;
 	const struct clk_bulk_data *clks;
 	unsigned int num_clks;
 	bool buf_active_reverse;
-	bool has_gasket;
 	bool has_36bit_dma;
 };
 
@@ -286,6 +294,8 @@ struct mxc_isi_dev {
 	struct dentry			*debugfs_root;
 };
 
+extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
+
 int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
 void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
 int mxc_isi_crossbar_register(struct mxc_isi_crossbar *xbar);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index f7447b2f4d77..c6a658ef0c62 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -15,7 +15,6 @@
 #include <linux/types.h>
 
 #include <media/media-entity.h>
-#include <media/mipi-csi2.h>
 #include <media/v4l2-subdev.h>
 
 #include "imx8-isi-core.h"
@@ -25,32 +24,18 @@ static inline struct mxc_isi_crossbar *to_isi_crossbar(struct v4l2_subdev *sd)
 	return container_of(sd, struct mxc_isi_crossbar, sd);
 }
 
-/* -----------------------------------------------------------------------------
- * Media block control (i.MX8MN and i.MX8MP only)
- */
-#define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
-
-#define GASKET_CTRL				0x0000
-#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
-#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
-#define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
-#define GASKET_CTRL_ENABLE			BIT(0)
-
-#define GASKET_HSIZE				0x0004
-#define GASKET_VSIZE				0x0008
-
 static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 					  struct v4l2_subdev_state *state,
 					  struct v4l2_subdev *remote_sd,
 					  u32 remote_pad, unsigned int port)
 {
 	struct mxc_isi_dev *isi = xbar->isi;
+	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
 	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_mbus_frame_desc fd;
-	u32 val;
 	int ret;
 
-	if (!isi->pdata->has_gasket)
+	if (!gasket_ops)
 		return 0;
 
 	/*
@@ -77,17 +62,7 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	if (!fmt)
 		return -EINVAL;
 
-	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE, fmt->width);
-	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE, fmt->height);
-
-	val = GASKET_CTRL_DATA_TYPE(fd.entry[0].bus.csi2.dt)
-	    | GASKET_CTRL_ENABLE;
-
-	if (fd.entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
-		val |= GASKET_CTRL_DUAL_COMP_ENABLE;
-
-	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
-
+	gasket_ops->enable(isi, &fd, fmt, port);
 	return 0;
 }
 
@@ -95,11 +70,12 @@ static void mxc_isi_crossbar_gasket_disable(struct mxc_isi_crossbar *xbar,
 					    unsigned int port)
 {
 	struct mxc_isi_dev *isi = xbar->isi;
+	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
 
-	if (!isi->pdata->has_gasket)
+	if (!gasket_ops)
 		return;
 
-	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
+	gasket_ops->disable(isi, port);
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
new file mode 100644
index 000000000000..1d632dc60699
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019-2023 NXP
+ */
+
+#include <linux/regmap.h>
+
+#include <media/mipi-csi2.h>
+
+#include "imx8-isi-core.h"
+
+/* -----------------------------------------------------------------------------
+ * i.MX8MN and i.MX8MP gasket
+ **/
+
+#define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
+
+#define GASKET_CTRL				0x0000
+#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
+#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
+#define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
+#define GASKET_CTRL_ENABLE			BIT(0)
+
+#define GASKET_HSIZE				0x0004
+#define GASKET_VSIZE				0x0008
+
+static void mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
+				   const struct v4l2_mbus_frame_desc *fd,
+				   const struct v4l2_mbus_framefmt *fmt,
+				   const unsigned int port)
+{
+	u32 val;
+
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE, fmt->width);
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE, fmt->height);
+
+	val = GASKET_CTRL_DATA_TYPE(fd->entry[0].bus.csi2.dt);
+	if (fd->entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
+		val |= GASKET_CTRL_DUAL_COMP_ENABLE;
+
+	val |= GASKET_CTRL_ENABLE;
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
+}
+
+static void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi,
+				    const unsigned int port)
+{
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
+}
+
+/* Gasket operations for i.MX8MN and i.MX8MP */
+const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
+	.enable = mxc_imx8_gasket_enable,
+	.disable = mxc_imx8_gasket_disable,
+};
-- 
2.37.1

