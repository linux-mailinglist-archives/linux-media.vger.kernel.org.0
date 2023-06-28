Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4D2740A45
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 10:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbjF1IA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 04:00:56 -0400
Received: from mail-vi1eur03on2076.outbound.protection.outlook.com ([40.107.103.76]:51873
        "EHLO EUR03-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232392AbjF1H63 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 03:58:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKD3GzF6JblSEzbqoWJ4pKBTuar618TaMBRbHY9SZoLappKpdvo7uXRCl5prh6le0vahS6L6ffUeU9yOqWrlJkQqepXkjOof3bgLRexQhtDlmEnsb8d8uewssbe7BtuJ7ZiiPx0wVWr0PgaO/EhRLqGkW+tt1AJb8GqFG3+U0MZ6/6tdFTTyMwYE2Kjg+5yHaY/CET8gwOrC3v5xJGDNTvxx5Da8eYfdysyZNzE1ZL425JFWOu0V7wxXyvc8tEIb8pV6Xzf+JlQUhuDPa+n/F4/eJMEX+Ar1GR1y6WqRfpMFgaqVs/EWdHPVw5BY3MQL+DuEUnZmaHeo3iSF2hqtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t8jO6kDNmUetXDQvamiLru+DXxoeUk2pYsb7FJOWTI=;
 b=O9dk7Uazqajj57KMY72MJ41tusn9JpHOV/FSh3ZETTgCjLDwu8qhANk6uRUzQsaascN6E8QD/bD11/QXCnDnZwTiNhHL/QvQUA4Phhi1/otoveVVh9fxOkHMgG1GsWy0P8dxP84TOB62oN1We4ZmYs0iuApHKz9hyMMFmOSzOxBw/qXiPGgv+DAg2uaNEvtbwyMV8mm7S4wbTurMgmHZHsdYtC2S827h9m5Kv6CrAz03YYa9PnrfAMOGBiVx+SnhtuiebVCKqthHL4UuGTGB6H35uzro3TOfSVy2kCik42i2xIgJqq/OUphxQBmWt9Xywbb3vQrpMtB26/riRodGtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t8jO6kDNmUetXDQvamiLru+DXxoeUk2pYsb7FJOWTI=;
 b=Fk/9Wd4xGAZ1+6jD8EnFwwOZcFwGpB6qIni5VYAiCOdmz+3703QHNTzMhXpqVVoAj1xOjewfXB5J68L9ZIzSRRC9MpRqls7xxULzJNcSY/1SAmXwKuLZS84HA4emgXpTU1eLIhVLd5mc6oZ+4oBztdIQDLArotb1Arivt1AE6oc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 06:38:14 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 06:38:14 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v4 2/3] media: nxp: imx8-isi: move i.MX8 gasket configuration to an ops structure
Date:   Wed, 28 Jun 2023 14:42:50 +0800
Message-Id: <20230628064251.1774296-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230628064251.1774296-1-guoniu.zhou@oss.nxp.com>
References: <20230628064251.1774296-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f94b07-27b3-4ea9-6279-08db77a23fd8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ENzD2S0WYoIzsqXDzyiEZrRqJWrLZQ7V10xhFGm9hpduq6HM0Q+9ywn9Z3mUneTmYrJdF4plvNFUMZrZtUWuM7F9hUXO3qrYyLkU0Xs+KYCe5Ppr7Sj1MAReVLmbMS2kB7ltPpcB6y6frRMpi4NjWkUGa85CY5HjpX6ez5QvLm+pJN3ZWzQgLsA+Vj4XIIwPex5aL2uuGxCxduq6G7Cx6PxA/W//fNbXf3G/E3BWFZetNakCcSBF64ryUSn4WodJuzjSt1n5XHNoDOM4LT8VSNkM2bUA/jTgo2XJDYGdaL3oVI/dHm3bkDl9wzRVTrLEPb3iCe8jJR+d3c6Iie8ahM322mj0sXA7xT5gtX6Ygo1WzdtuJodsnP92M1bYFlYxdUMMiIMaKNoypJ8L2MnPElz9/rQI6QBiFePYTXifrqKMZ3655m0r6ktNh5Heqk2AQ51dHOGOnqA3waEAraNXgKhiAHIES2lVOk8IJXM3n8Mz3eBQfq4K5BLvZdrjw+lTBpgE4p4UoykbsQ+6fzCZSldipWLHatYR/mfbqwEyj5PsaFHGm0olNCod6AXJtwKV7cEI31OKQEVPpZXEP4/x5LYmJ9XTqB6Z3Q4+pYY/o2CgbM2u0vHiKRQVhllwSy6f
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(38350700002)(38100700002)(83380400001)(86362001)(2616005)(6486002)(52116002)(6666004)(41300700001)(66556008)(66946007)(316002)(66476007)(8676002)(1076003)(26005)(9686003)(4326008)(6512007)(186003)(6506007)(8936002)(2906002)(478600001)(5660300002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BXO3v7m1slr6oPp5/5sCyYVxSg95C2Lgjg9ZHy/1JFQjWxFBmrpBAsytT7Dd?=
 =?us-ascii?Q?HqgpPDbFuMLKuWdGCeOQQa9tafBijJTU5w7HAipvPeGBwXWfIlf+W6KACijQ?=
 =?us-ascii?Q?hEQbcwD+fp5VF6HxxUwikPwMAtxnUuLZMKu8lUcLQPth3GARTPeGUrBj0Tb+?=
 =?us-ascii?Q?DmxkNcs9XcavafC34MjlqLJnQtzagLzT7t9fDToEcx3a57Pal6uFiRjhAp4f?=
 =?us-ascii?Q?JJd+zmMxzAJAtentUSSnCxtzY7f3vsTryDKdQLKnM53/fet2LE6XVj1WvUl4?=
 =?us-ascii?Q?y+t2ZCKX9CylzFphzr4dR5GHfAloCW+vp5ZhPQ2S5VUzxh06oSjo+hxfJLCt?=
 =?us-ascii?Q?A3MCax4qtFYTTvmXFBUIwtSYcGpJ1gpPa7I9TMbrcU74yhEnt1e0a/eAavSq?=
 =?us-ascii?Q?TFTiQIIk4xlD/vdQpiuLL95LAB+GRmfVh50t/dLOoigXM+2roqSGO5FW1lA4?=
 =?us-ascii?Q?fOAXDfVUHCUCDnESOUdzevfto2AXDWFPI+XKjmkyfK9G/rtEQYkBfqod0+cP?=
 =?us-ascii?Q?uEcZ9AcMlNBVuj41gPXZ3kCFWN80mkfMWs3sXPl4tDuo5fV+/OPTCw2Wlw/F?=
 =?us-ascii?Q?TOrQrs0lwCukbboO46inXuLtJtzF3K4h/2SggZT7UP3Ojsx/sJHG1s/zwq1H?=
 =?us-ascii?Q?68cuz4CsJfqWQdVmGO2vv9G2hV8Wb9lQehwBpG77c1kAjIel47er5UY469KW?=
 =?us-ascii?Q?4OgJ8C1cPFsdkZ/t/VCLQnsdC5ry5+UGKhAI8V5zy9rFIZ7q9WqItKvd5KPm?=
 =?us-ascii?Q?ZWw5gYBGkmh+zToPU7XSnbyepJ3mTsbHQCErDs6iEFh6/YgQVS+d7fWf1H81?=
 =?us-ascii?Q?ksC2dYHmAGUZwsUJzAKzJTIxLJQhbARO27vAcFcx/dYs1riFpAadw5GU7fHy?=
 =?us-ascii?Q?dhzkQD/fPmrJ7Urma8cMlU2s96XvapjCtCeC0cfi4Wq+2XIPeOw+KZZRdwrr?=
 =?us-ascii?Q?wTZgsHQC5wMAqKcFJEpMNrbvgtMX3FkIxng2twpm1Yl6BaF4b+7T9CzTHDC3?=
 =?us-ascii?Q?cIU4fQ9MxOWU+O1gkTBledaMSUkcmdS6E1uOsS2Y5CRv5UoI5Pm3XUnAP3yO?=
 =?us-ascii?Q?S3ZL1hAFO1hj7KQfGux/2LV2lLnp3vzPZ1CUxgGQLOVM5ZG3+VK1Z4D0PnY7?=
 =?us-ascii?Q?NU3ei6Fw1uwfPN4CUHWQ3AuPVdUxyfi1/61tuD5+6q/MVopYomd+hKySWpMW?=
 =?us-ascii?Q?63nPRIonkktt87ZhVPs5apEforiGcF5fDPwTZqRxtnCkJW7nmRMeA/Q9Ds0b?=
 =?us-ascii?Q?aWVGtLTkWCIRf0yUR9+dEaM2PbDcoQlAMX3FpS0bbyCXRpxdV87U+bO9Igt+?=
 =?us-ascii?Q?PuMMG6AEu8lonUdD7GjK/gmHPp14qNroR+YiHjzQUMF1waJE6cTelpyrB2ef?=
 =?us-ascii?Q?T3cz46jsAhsdz57EIx1akit0ZmxjVhKwWF2i0p3mjepoI3WljQGg6c5GAyb/?=
 =?us-ascii?Q?XnT7ROL8GjRBGh8lM/cxbkMqrDbHMzhWXuz50UuXg4kNR423KiGHDJvqL3xH?=
 =?us-ascii?Q?6PjLsc6CZ1p94+yE9vp9eg+M66xBu55c2EeAFlKPkCtnYdUS4IVRKljT9tA4?=
 =?us-ascii?Q?AeMt5/ZGAdXDwjRvh7AR6/7Gocx4Ou5k1dEKcJOd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f94b07-27b3-4ea9-6279-08db77a23fd8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 06:38:14.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJA05IH+8VQc6QZn1/iBhCgGHazuGQyTZIa2I4DjSarDd91wO3ttbL68//ACQBWNG9WS0GZTMtEiI3lEG9+RQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
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
 .../platform/nxp/imx8-isi/imx8-isi-core.c     |  9 ++--
 .../platform/nxp/imx8-isi/imx8-isi-core.h     | 20 +++----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 40 +++-----------
 .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 52 +++++++++++++++++++
 5 files changed, 74 insertions(+), 51 deletions(-)

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
index 253e77189b69..f2774325dd61 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -18,9 +18,6 @@
 #include <linux/string.h>
 #include <linux/types.h>
 
-#include <media/media-device.h>
-#include <media/v4l2-async.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-mc.h>
 
 #include "imx8-isi-core.h"
@@ -289,7 +286,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.clks			= mxc_imx8mn_clks,
 	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= false,
-	.has_gasket		= true,
+	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= false,
 };
 
@@ -303,7 +300,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.clks			= mxc_imx8mn_clks,
 	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= true,
-	.has_gasket		= true,
+	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= true,
 };
 
@@ -443,7 +440,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return PTR_ERR(isi->regs);
 	}
 
-	if (isi->pdata->has_gasket) {
+	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
 		if (IS_ERR(isi->gasket)) {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index e469788a9e6c..87182ebb99f0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -10,14 +10,6 @@
 #ifndef __MXC_ISI_CORE_H__
 #define __MXC_ISI_CORE_H__
 
-#include <linux/list.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/types.h>
-#include <linux/videodev2.h>
-
-#include <media/media-device.h>
-#include <media/media-entity.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
@@ -147,6 +139,14 @@ struct mxc_isi_set_thd {
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
@@ -159,10 +159,10 @@ struct mxc_isi_plat_data {
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
 
@@ -286,6 +286,8 @@ struct mxc_isi_dev {
 	struct dentry			*debugfs_root;
 };
 
+extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
+
 int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
 void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
 int mxc_isi_crossbar_register(struct mxc_isi_crossbar *xbar);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index f7447b2f4d77..55637b6ffccf 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -8,15 +8,10 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
-#include <linux/minmax.h>
-#include <linux/regmap.h>
-#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
 #include <media/media-entity.h>
-#include <media/mipi-csi2.h>
-#include <media/v4l2-subdev.h>
 
 #include "imx8-isi-core.h"
 
@@ -25,32 +20,18 @@ static inline struct mxc_isi_crossbar *to_isi_crossbar(struct v4l2_subdev *sd)
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
@@ -77,17 +58,7 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
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
 
@@ -95,11 +66,12 @@ static void mxc_isi_crossbar_gasket_disable(struct mxc_isi_crossbar *xbar,
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
index 000000000000..f3758af59db1
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019-2023 NXP
+ */
+#include <linux/regmap.h>
+#include <media/mipi-csi2.h>
+
+#include "imx8-isi-core.h"
+
+/* GASKET (i.MX8MN and i.MX8MP only) */
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
+/* Configure and enable gasket for i.MX8MN and i.MX8P */
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
+/* Disable gasket for i.MX8MN and i.MX8P */
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

