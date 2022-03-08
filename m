Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 217874D2088
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 19:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243715AbiCHSuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 13:50:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349672AbiCHSuO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 13:50:14 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50071.outbound.protection.outlook.com [40.107.5.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09428532F6;
        Tue,  8 Mar 2022 10:49:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQV3YIIGDBecRQOAiMAJbb2GOoabLnMpuOPVznNwAEuoNOpn2axMK+4Ljck0MqDpZIbumM7zdPShPyBbT0twehUmBEPCY5I79Fp2IDGo4PQtD5ewKX7vRAmNIA6bFd9dp92zt46fEGiRt5PzHklhN7wrgsdG/SH3R788mJ8SfB+Oyese3j5hZvZasLhGeOS0RZP0EJQUrDLO08CPtDKeSt5waGSFEZxk98QSVZInYomzRdTAcLxU/MElEsBZ7G1LaLVZrhkX+ghnkQKdr70CYklHq2WWayi2FNolVoXGmi4FfyWqKATFu4jYJ+OQ/llbGSrDUeWaZ6xYlX44aBGXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQ8iGHg8m84imwvvDMuZxq9H1ElWrxf2d9Dg/kxKURw=;
 b=hLzQMxhhIBXmCE5gW4VwcjTWls7ccumvspbgTSbD/pvl4tAZk7/KjPwz1ihA5sxRC7ZR3hYVAbXUaFu7ltYxIO+9wXKxjquvFPSTZup2xOfxQRAM2+ygcpEHfGrcVr0Y/FtCf2TTG75EedfA7cwqY9OvBlFHNUiRwVEINpBx9m7fJ78nszHeQnRRTpyE2Y7Z1SkM4TyvnL5IhMhH2QAuYSRqBuRpZsToiD6EobQ4jmhj1+HYFMb4YFJHbjtiC5OQ1CS7p5u2lACM4lK45aRmoloHZHsg3Zh2k86pPXRw7Yk1W84aQDHPlqOaZfJwYC17vO4k2veZwqXoqS+drR/u8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQ8iGHg8m84imwvvDMuZxq9H1ElWrxf2d9Dg/kxKURw=;
 b=StUPWRncEycB5iVbHk+p84WKmgSAzhxA1e5D5XvC7yrhBBl78XlpkqdVFXh/aUieAb8fZq9sYhM6gDWsH3w1RyNb3pNatxi7dL2l44VdYczt9tqAmmuJB9XT2s3SZ2i9+iU35dzLlfZnxnamNNtW0mzgmIKnFtt2ZgMINTORxW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB4311.eurprd04.prod.outlook.com (2603:10a6:209:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 18:49:06 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:49:06 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 8/9] media: dw100: Add i.MX8MP dw100 dewarper driver
Date:   Tue,  8 Mar 2022 19:48:28 +0100
Message-Id: <20220308184829.38242-9-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::23) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45205f87-d769-423e-e68b-08da013452a2
X-MS-TrafficTypeDiagnostic: AM6PR04MB4311:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB43118D55FFCBDF50FE3171D3BA099@AM6PR04MB4311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0irR5S8WNY4PQDRWyuoBRa147Nz2RPBHoCOV8mbPIVD3khbTrm+oLLnHMAgCMZHHyQ+JUhDdiZDDywqXWf/Zv0C+hUqTlw32FHGj2ritXkx4EfUerDuXlXYYz5dviAOGvpBaKNP9L7cY6NNK6KkzzsRjv9DC2bbmsodyZPGSgymLFUiOeskiUcWuWt8hauS181yya2W5WrsaJ0+zquoNy2pYBrkImFktSKPl9f2zEbmNWzXz9za2jo+melw/z4n4FeOy8uiWfhHVNixi4EVpxDp2vKuHoOirYrdhH7ZzVilVhywlL3T6/U+HvOXewZrx1sXmgc7AEn96pdbULUUCUdGOK5654gDeUSAg4l0K0M8Eussj7+WVdSwd3J1FZlFIDKt08jHqXrRnXWkdY0u5ifIcSus2JNkRKzeLXWO2bij4d+HCMkL/qu4BYXKN3A7fopUQMAr6TeVnHoo+8C/KH09GDi6uVQqVqqnh+m+G1XhZ200JKZaRupIvbf6Lm+AkJsgU5ZHoEfsP5MylRQRDIPCQaRGkzpc2QszEIS/JMh1R1UjkSuCI2NaTnLg+iil1kgWVQE+2Gg6Xt0n/DknTLQQqKAR/NfLE4/gyIlivbmBsUjPYPCniAo48Coh0qASgRovTNVLxHjLK9ChcIcCjFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(4326008)(186003)(1076003)(83380400001)(6486002)(86362001)(5660300002)(8676002)(66556008)(38100700002)(2906002)(30864003)(44832011)(498600001)(8936002)(6512007)(52116002)(6666004)(6506007)(2616005)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?22nEgd4yV9BNm/i05ECyP3ZTIOaunD2A8YOyyjec75HNk3ytn9JTV3z+h7Qk?=
 =?us-ascii?Q?Ink1f1t6nKR6yD547Btq0bM4Xyo7yVGBoQj6KLGV4gBV6MxNFJ3Uc2W0tCIO?=
 =?us-ascii?Q?gQS9ZdTviW1enqIwmI5OFZ43jYhyiqOCRKXuAS9+XX4kaQCwF3H1qL9pP73n?=
 =?us-ascii?Q?iLIpXt3t8qLWtpvArL03G1csl59HEE9QDQHXoWzJL/sE2hKRgdhQJ8OkzAgT?=
 =?us-ascii?Q?y2WZm6K50wFyV5rx4i5vsWUhZ357Hsx02H4XpEMmRPIluJff2t/l/ijCVUY/?=
 =?us-ascii?Q?1VxyHAYsbhKxALbGlBN/onl6sw7BcoDCc+9sLvPgMkH8FNQXfk/NmTKAvG6s?=
 =?us-ascii?Q?bf6UG0PTwUAwRSCQcd3ryLk3IhYB4XZ7o1BzQvXHxYi3+efjydyRwVKCyHCS?=
 =?us-ascii?Q?Van17MY44ZE6RRpEHzVfxXcrPqD0MXA5SCbmYhkL2NsXmszrcADlhyGkiCds?=
 =?us-ascii?Q?CGYO2LFDe9eIQ9lbkqijjc75WpL90VSFtTEnJ3r8rKbmoq6iT3cimw7iVWGJ?=
 =?us-ascii?Q?nRP5jKBi8Exj74+tY4WDJjnaCEQJJOUhDs948mAs89U1+gNk8RwHHPmwh9Af?=
 =?us-ascii?Q?HrLqfDjQZmrfvXwKqXcPGPVvqd3YavpYBX7upNH2Cn8o9RqAwCriAZNwKIp5?=
 =?us-ascii?Q?u32HU6jbPwzSGd7XatUOtePZAOECN2PlGFxhJ9WiYlQ3EaUtYK+JXMY6YRFn?=
 =?us-ascii?Q?ex3mD3tMf26e2FRtE51oEj7BbWM4uw2RBN1ozEXBd93aBrDOJtPSWb7Mxjhi?=
 =?us-ascii?Q?yPbJ2MRavLSS4kMV2yjKELJY8AYu+FOGm+ZoRzjRy+2mxVM73F+qItHptLFr?=
 =?us-ascii?Q?sG2pAKwXJHfQ30QrJrAL5ZzNswGdRoyUHnvLyTfLhCToymKOH4JgT2RW9NhI?=
 =?us-ascii?Q?l/eOWYjCtJzaccjO+qUv818xNAfNaF+4MRGLiNDNc1X+Pffv8s315OQ4yqq1?=
 =?us-ascii?Q?A1LH3QgUwZPNn7PMrAhuaCxB1/tjgsTK2oQBbrQVUb/axDs3z0b7wUgGaE4R?=
 =?us-ascii?Q?yTREUSwQw9Lp48QVaGOBbq1AQNSpHmh6AUtihs87RgL5ahYJL3u4JQYv7p+N?=
 =?us-ascii?Q?3aNCgs74EU5dwyh+wdM2uO+ulP2gnSYMV9gFbo5m0G+dRmUpDGkubOZQ2Umk?=
 =?us-ascii?Q?Oi0HGYutFkfI8jctaSpcqNzPz8aW8jlTTVPEPwgtxL9PIdeNy1+Drvt2XWU1?=
 =?us-ascii?Q?VhvqdQdi6F2VDpfAjp4oI3o+ju0jAmfR4rKTuLELCyvHdQKYKjGHx5d883rS?=
 =?us-ascii?Q?csKjIH0t5c7KSWMS46zNfIN3N/3aFcbVHnVD8nu/R/xTqlX/lLUotewMu2pa?=
 =?us-ascii?Q?fiPsRY3jeWDIEFzo06A8vlX8laAU6BOJzBiU0D2L7oFixp+srMIi5xm0tcxj?=
 =?us-ascii?Q?8N9OPStNzcig05oqggN77CmMZpiTSVwT0J2tnPcKg5Bup4U6P0hNNzpoZaXt?=
 =?us-ascii?Q?RF7fs4BVEF0Yx4/D1gdvz/YEBiwFgqGrjZWPyGwr4oACGfKZh6Cw3Ki5VjJX?=
 =?us-ascii?Q?cDl48W9Sim2OeFBHMq/uPdQk94COGGrOSzfrmga+C+Kckcq9NmGUFmlS7959?=
 =?us-ascii?Q?rpVUw0+baDTYvCaWZU6a1xQe6ZQ7Pko2871nNriPRdbGOjmEkZ46Ru8U47mP?=
 =?us-ascii?Q?rLdWi/0GvWvt3VwVyzFat1TSdTHV2unUpQIOVeaHpmx8ZpTis8AZHP1+rxhH?=
 =?us-ascii?Q?aSupNL+6eB18H2NOG/IoaxCTiuc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45205f87-d769-423e-e68b-08da013452a2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:49:06.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZa7DR4hbF4LHGpHgMmARbo8RVHCURurQEQcztk8uyE5C+PeJkVbuRiv7iWf+59sLoNoCnSj+R9tnycTme5lTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4311
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2 mem-to-mem driver for the Vivante DW100 Dewarp Processor IP
core found on i.MX8MP SoC.

The processor core applies a programmable geometrical transformation on
input image to correct distorsion introduced by lenses.
The transformation function is exposed as a grid map with 16x16 pixel
macroblocks indexed using X, Y vertex coordinates.

The dewarping map can be set from application through dedicated a v4l2
control. If not set or invalid, the driver computes an identity map
prior to start the processing engine.

The driver supports scaling, cropping and pixel format conversion.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 drivers/media/platform/Kconfig            |   12 +
 drivers/media/platform/Makefile           |    1 +
 drivers/media/platform/dw100/Makefile     |    2 +
 drivers/media/platform/dw100/dw100.c      | 1744 +++++++++++++++++++++
 drivers/media/platform/dw100/dw100_regs.h |  118 ++
 5 files changed, 1877 insertions(+)
 create mode 100644 drivers/media/platform/dw100/Makefile
 create mode 100644 drivers/media/platform/dw100/dw100.c
 create mode 100644 drivers/media/platform/dw100/dw100_regs.h

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 4843fabb8bb2..e88e8569226f 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -258,6 +258,18 @@ config VIDEO_CODA
 	   Coda is a range of video codec IPs that supports
 	   H.264, MPEG-4, and other video formats.
 
+config VIDEO_DW100
+	tristate "DW100 dewarper"
+	depends on VIDEO_DEV && VIDEO_V4L2 && (ARCH_MXC || COMPILE_TEST)
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	help
+	  DW100 is a memory-to-memory engine performing geometrical
+	  transformation on source image through a programmable dewarping map.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called dw100.
+
 config VIDEO_IMX_VDOA
 	def_tristate VIDEO_CODA if SOC_IMX6Q || COMPILE_TEST
 
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 4032816f8e8a..4f3d7ada4eac 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -19,6 +19,7 @@ obj-y	+= ti-vpe/
 
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
 obj-$(CONFIG_VIDEO_CODA)		+= coda/
+obj-$(CONFIG_VIDEO_DW100)		+= dw100/
 
 obj-$(CONFIG_VIDEO_IMX)			+= imx/
 obj-$(CONFIG_VIDEO_IMX_PXP)		+= imx-pxp.o
diff --git a/drivers/media/platform/dw100/Makefile b/drivers/media/platform/dw100/Makefile
new file mode 100644
index 000000000000..102c5d1c70f5
--- /dev/null
+++ b/drivers/media/platform/dw100/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0+
+obj-$(CONFIG_VIDEO_DW100)	+= dw100.o
diff --git a/drivers/media/platform/dw100/dw100.c b/drivers/media/platform/dw100/dw100.c
new file mode 100644
index 000000000000..7e1fcdfe5b91
--- /dev/null
+++ b/drivers/media/platform/dw100/dw100.c
@@ -0,0 +1,1744 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DW100 Hardware dewarper
+ *
+ * Copyright 2022 NXP
+ * Author: Xavier Roumegue (xavier.roumegue@oss.nxp.com)
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include <uapi/linux/dw100.h>
+
+#include "dw100_regs.h"
+
+#define DRV_NAME "dw100"
+
+#define MIN_W 176
+#define MIN_H 144
+#define MAX_W 4096
+#define MAX_H 3072
+#define ALIGN_W 3
+#define ALIGN_H 3
+
+#define DW100_BLOCK_SIZE 16
+
+#define DW100_MIN_LUT_NELEMS		(((MIN_W / DW100_BLOCK_SIZE) + 1) \
+					 * ((MIN_H / DW100_BLOCK_SIZE) + 1))
+
+#define DW100_MAX_LUT_NELEMS		(((MAX_W / DW100_BLOCK_SIZE) + 1) \
+					 * ((MAX_H / DW100_BLOCK_SIZE) + 1))
+
+static unsigned int debug;
+module_param(debug, uint, 0644);
+MODULE_PARM_DESC(debug, "Activate debug info");
+
+#define dprintk(lvl, dev, fmt, arg...) \
+	v4l2_dbg(lvl, debug, &dev->v4l2_dev, "%s: " fmt, __func__, ## arg)
+
+enum {
+	V4L2_M2M_SRC = 0,
+	V4L2_M2M_DST = 1,
+};
+
+enum {
+	V4L2_M2M_CAPTURE = 1,
+	V4L2_M2M_OUTPUT = 2,
+};
+
+static struct dw100_fmt {
+	u32 fourcc;
+	int depth;
+	u32 types;
+	u32 reg_format;
+	bool reg_swap_uv;
+} formats[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.depth = 16,
+		.types = V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE,
+		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV422_SP,
+		.reg_swap_uv = false,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.depth = 16,
+		.types = V4L2_M2M_CAPTURE,
+		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV422_SP,
+		.reg_swap_uv = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.depth = 16,
+		.types = V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE,
+		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED,
+		.reg_swap_uv = false,
+	}, {
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.depth = 16,
+		.types = V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE,
+		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED,
+		.reg_swap_uv = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.depth = 12,
+		.types = V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE,
+		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV420_SP,
+		.reg_swap_uv = false,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV21,
+		.depth = 12,
+		.types = V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE,
+		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV420_SP,
+		.reg_swap_uv = true,
+	},
+};
+
+static inline int to_dw100_fmt_type(enum v4l2_buf_type type)
+{
+	if (V4L2_TYPE_IS_OUTPUT(type))
+		return V4L2_M2M_OUTPUT;
+	else
+		return V4L2_M2M_CAPTURE;
+}
+
+#define NUM_FORMATS ARRAY_SIZE(formats)
+
+static struct dw100_fmt *find_format(struct v4l2_format *f)
+{
+	struct dw100_fmt *fmt;
+	unsigned int k;
+
+	for (k = 0; k < NUM_FORMATS; k++) {
+		fmt = &formats[k];
+		if ((fmt->fourcc == f->fmt.pix.pixelformat)
+		    && (fmt->types & to_dw100_fmt_type(f->type)))
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static inline u32 dw100_bytesperline(struct dw100_fmt *fmt, u32 width)
+{
+
+	switch (fmt->reg_format) {
+	case DW100_DEWARP_CTRL_FORMAT_YUV422_SP:
+	case DW100_DEWARP_CTRL_FORMAT_YUV420_SP:
+		return width;
+	case DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED:
+	default:
+		return (fmt->depth * width) >> 3;
+	}
+}
+
+static inline u32 dw100_sizeimage(struct dw100_fmt *fmt, u32 width, u32 height)
+{
+	return (fmt->depth * width * height) >> 3;
+}
+
+struct dw100_device {
+	struct platform_device *pdev;
+	struct v4l2_m2m_dev	*m2m_dev;
+	struct v4l2_device	v4l2_dev;
+	struct video_device	vfd;
+#ifdef CONFIG_MEDIA_CONTROLLER
+	struct media_device	mdev;
+#endif
+	struct mutex		vfd_mutex;
+	spinlock_t		irqlock;
+	void __iomem		*mmio;
+	struct clk_bulk_data	*clks;
+	int			num_clks;
+	struct dentry		*debugfs_root;
+};
+
+static int dw100_dump_regs(struct dw100_device *dw_dev)
+{
+#define __DECLARE_REG(x) { #x, x }
+	int i;
+	struct reg_desc {
+		const char * const name;
+		unsigned int addr;
+	} dw100_regs[] = {
+		__DECLARE_REG(DW100_DEWARP_ID),
+		__DECLARE_REG(DW100_DEWARP_CTRL),
+		__DECLARE_REG(DW100_MAP_LUT_ADDR),
+		__DECLARE_REG(DW100_MAP_LUT_SIZE),
+		__DECLARE_REG(DW100_MAP_LUT_ADDR2),
+		__DECLARE_REG(DW100_MAP_LUT_SIZE2),
+		__DECLARE_REG(DW100_SRC_IMG_Y_BASE),
+		__DECLARE_REG(DW100_SRC_IMG_UV_BASE),
+		__DECLARE_REG(DW100_SRC_IMG_SIZE),
+		__DECLARE_REG(DW100_SRC_IMG_STRIDE),
+		__DECLARE_REG(DW100_DST_IMG_Y_BASE),
+		__DECLARE_REG(DW100_DST_IMG_UV_BASE),
+		__DECLARE_REG(DW100_DST_IMG_SIZE),
+		__DECLARE_REG(DW100_DST_IMG_STRIDE),
+		__DECLARE_REG(DW100_DST_IMG_Y_SIZE1),
+		__DECLARE_REG(DW100_DST_IMG_UV_SIZE1),
+		__DECLARE_REG(DW100_SRC_IMG_Y_BASE2),
+		__DECLARE_REG(DW100_SRC_IMG_UV_BASE2),
+		__DECLARE_REG(DW100_SRC_IMG_SIZE2),
+		__DECLARE_REG(DW100_SRC_IMG_STRIDE2),
+		__DECLARE_REG(DW100_DST_IMG_Y_BASE2),
+		__DECLARE_REG(DW100_DST_IMG_UV_BASE2),
+		__DECLARE_REG(DW100_DST_IMG_SIZE2),
+		__DECLARE_REG(DW100_DST_IMG_STRIDE2),
+		__DECLARE_REG(DW100_DST_IMG_Y_SIZE2),
+		__DECLARE_REG(DW100_DST_IMG_UV_SIZE2),
+		__DECLARE_REG(DW100_SWAP_CONTROL),
+		__DECLARE_REG(DW100_VERTICAL_SPLIT_LINE),
+		__DECLARE_REG(DW100_HORIZON_SPLIT_LINE),
+		__DECLARE_REG(DW100_SCALE_FACTOR),
+		__DECLARE_REG(DW100_ROI_START),
+		__DECLARE_REG(DW100_BOUNDARY_PIXEL),
+		__DECLARE_REG(DW100_INTERRUPT_STATUS),
+		__DECLARE_REG(DW100_BUS_CTRL),
+		__DECLARE_REG(DW100_BUS_CTRL1),
+		__DECLARE_REG(DW100_BUS_TIME_OUT_CYCLE),
+	};
+
+	for (i = 0; i < ARRAY_SIZE(dw100_regs); i++) {
+		dev_info(&dw_dev->pdev->dev, "%s: %#x\n",
+			dw100_regs[i].name,
+			readl(dw_dev->mmio + dw100_regs[i].addr));
+	}
+
+	return 0;
+}
+
+struct dw100_q_data {
+	unsigned int		width;
+	unsigned int		height;
+	unsigned int		bytesperline;
+	unsigned int		sizeimage;
+	unsigned int		sequence;
+	struct dw100_fmt	*fmt;
+	struct v4l2_rect	crop;
+};
+
+struct dw100_ctx {
+	struct v4l2_fh			fh;
+	struct dw100_device		*dw_dev;
+	struct v4l2_ctrl_handler	hdl;
+
+	/* Look Up Table for pixel remapping */
+	unsigned int			*map;
+	dma_addr_t			map_dma;
+	size_t				map_size;
+	unsigned int			map_width;
+	unsigned int			map_height;
+
+	/* Related colorspace properties propagated from input to output */
+	enum v4l2_colorspace	colorspace;
+	enum v4l2_xfer_func	xfer_func;
+	enum v4l2_ycbcr_encoding ycbcr_enc;
+	enum v4l2_quantization	quant;
+
+	/* Source and destination queue data */
+	struct dw100_q_data   q_data[2];
+};
+
+static inline struct dw100_ctx *file2ctx(struct file *file)
+{
+	return container_of(file->private_data, struct dw100_ctx, fh);
+}
+
+static struct dw100_q_data *get_q_data(struct dw100_ctx *ctx,
+					 enum v4l2_buf_type type)
+{
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return &ctx->q_data[V4L2_M2M_SRC];
+	else
+		return &ctx->q_data[V4L2_M2M_DST];
+}
+
+static u32 dw100_get_n_vertices_from_length(u32 length)
+{
+	u32 n;
+
+	n = length / DW100_BLOCK_SIZE + 1;
+	if (length % DW100_BLOCK_SIZE)
+		n += 1;
+
+	return n;
+}
+
+static u16 dw_map_convert_to_UQ12_4(u32 a)
+{
+	return (u16)((a & 0xFFF) << 4);
+}
+
+static u32 dw_map_format_coordinates(u16 xq, u16 yq)
+{
+	return (u32)((yq << 16) | xq);
+}
+
+
+static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
+{
+	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&ctx->hdl, V4L2_CID_DW100_MAPPING);
+	size_t user_map_size;
+
+	if (ctrl == NULL) {
+		v4l2_err(&ctx->dw_dev->v4l2_dev, "Mapping control not found !");
+		return NULL;
+	}
+
+	if ((ctrl->elems < DW100_MIN_LUT_NELEMS)
+		|| (ctrl->elems > DW100_MAX_LUT_NELEMS))
+		return NULL;
+
+	user_map_size = ctrl->elems * ctrl->elem_size;
+
+	if ((ctrl->elems * ctrl->elem_size) == ctx->map_size)
+		return ctrl->p_cur.p_u32;
+
+	v4l2_warn(&ctx->dw_dev->v4l2_dev,
+		"Skipping invalid user map (%zu != %zu)\n",
+		user_map_size,
+		ctx->map_size);
+
+	return NULL;
+}
+
+/*
+ * Create an identity map if not set by the application
+ *
+ * A 16 pixels cell size grid is mapped on the destination image.
+ * The last cells width/height might be lesser than 16 if the destination image
+ * width/height is not divisible by 16. This dewarping grid map specifies the
+ * source image pixel location (x, y) on each grid intersection point.
+ * Bilinear interpolation is used to compute inner cell points locations.
+ *
+ * The coordinates are saved in UQ12.4 fixed point format.
+ *
+ */
+static int dw100_create_mapping(struct dw100_ctx *ctx)
+{
+	u32 sw, sh, dw, dh, mw, mh, i, j;
+	u16 qx, qy, qdx, qdy, qsh, qsw;
+	bool is_user_map = false;
+	u32 *user_map;
+
+	sw = ctx->q_data[V4L2_M2M_SRC].width;
+	dw = ctx->q_data[V4L2_M2M_DST].width;
+	sh = ctx->q_data[V4L2_M2M_SRC].height;
+	dh = ctx->q_data[V4L2_M2M_DST].height;
+
+	mw = dw100_get_n_vertices_from_length(dw);
+	mh = dw100_get_n_vertices_from_length(dh);
+
+	qdx = dw_map_convert_to_UQ12_4(sw) / (mw - 1);
+	qdy = dw_map_convert_to_UQ12_4(sh) / (mh - 1);
+	qsh = dw_map_convert_to_UQ12_4(sh);
+	qsw = dw_map_convert_to_UQ12_4(sw);
+
+	if (ctx->map)
+		dma_free_coherent(&ctx->dw_dev->pdev->dev,
+				ctx->map_size,
+				ctx->map,
+				ctx->map_dma);
+
+	ctx->map_width = mw;
+	ctx->map_height = mh;
+	ctx->map_size = mh * mw * sizeof(u32);
+
+	ctx->map = dma_alloc_coherent(&ctx->dw_dev->pdev->dev,
+				ctx->map_size,
+				&ctx->map_dma,
+				GFP_KERNEL);
+
+	if (!ctx->map)
+		return -ENOMEM;
+
+	user_map = dw100_get_user_map(ctx);
+	if (user_map) {
+		is_user_map = true;
+		memcpy(ctx->map, user_map, ctx->map_size);
+		goto out;
+	}
+
+	for (i = 0, qy = 0, qx = 0; i < mh; i++, qy += qdy, qx = 0) {
+		if (qy > qsh)
+			qy = qsh;
+		for (j = 0; j < mw; j++, qx += qdx) {
+			if (qx > qsw)
+				qx = qsw;
+			ctx->map[i * mw + j] = dw_map_format_coordinates(qx, qy);
+		}
+	}
+out:
+	dprintk(1, ctx->dw_dev,
+		"%dx%d %s mapping created (d:%pa-c:%p) for stream %dx%d->%dx%d\n",
+			mw, mh, is_user_map ? "user" : "identity",
+			&ctx->map_dma, ctx->map, sw, sh, dw, dh);
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_config ctrl_custom_lut = {
+	.id = V4L2_CID_DW100_MAPPING,
+	.name = "Look-Up Table",
+	.type = V4L2_CTRL_TYPE_U32,
+	.min = 0x00000000,
+	.max = 0xFFFFFFFF,
+	.step = 1,
+	.def = 0,
+	.dims = { DW100_MAX_LUT_NELEMS },
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+};
+
+static int dw100_queue_setup(struct vb2_queue *vq,
+			   unsigned int *nbuffers, unsigned int *nplanes,
+			   unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct dw100_ctx *ctx = vb2_get_drv_priv(vq);
+	struct dw100_q_data *q_data;
+	unsigned int size, count = *nbuffers;
+
+	q_data = get_q_data(ctx, vq->type);
+
+	size = q_data->sizeimage;
+
+	*nbuffers = count;
+
+	if (*nplanes)
+		return sizes[0] < size ? -EINVAL : 0;
+
+	*nplanes = 1;
+	sizes[0] = size;
+
+	dprintk(1, ctx->dw_dev, "Queue %p: get %d buffer(s) of size %d each.\n",
+							vq, count, size);
+
+	return 0;
+}
+
+static int dw100_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct dw100_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct dw100_device *dw_dev = ctx->dw_dev;
+	struct dw100_q_data *q_data;
+
+	dprintk(1, dw_dev, "Queue %p: Preparing buffer %p, type: %d\n",
+			vb->vb2_queue, vb, vb->vb2_queue->type);
+
+	q_data = get_q_data(ctx, vb->vb2_queue->type);
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+		if (vbuf->field == V4L2_FIELD_ANY)
+			vbuf->field = V4L2_FIELD_NONE;
+		if (vbuf->field != V4L2_FIELD_NONE) {
+			v4l2_err(&dw_dev->v4l2_dev, "%x field isn't supported\n",
+				vbuf->field);
+			return -EINVAL;
+		}
+	}
+
+	if (vb2_plane_size(vb, 0) < q_data->sizeimage) {
+		v4l2_err(&dw_dev->v4l2_dev,
+			"%s data will not fit into plane (%lu < %lu)\n",
+			__func__, vb2_plane_size(vb, 0),
+			(long)q_data->sizeimage);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, 0, q_data->sizeimage);
+
+	return 0;
+}
+
+static void dw100_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct dw100_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	dprintk(2, ctx->dw_dev, "Queue %p: Queuing buffer %p.\n",
+			vb->vb2_queue, vb);
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+
+static int dw100_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct dw100_ctx *ctx = vb2_get_drv_priv(q);
+	struct dw100_q_data *q_data = get_q_data(ctx, q->type);
+
+	dprintk(1, ctx->dw_dev, "Queue %p: Start Streaming.\n", q);
+
+	q_data->sequence = 0;
+
+	return pm_runtime_resume_and_get(&ctx->dw_dev->pdev->dev);
+}
+
+static void dw100_stop_streaming(struct vb2_queue *q)
+{
+	struct dw100_ctx *ctx = vb2_get_drv_priv(q);
+	struct vb2_v4l2_buffer *vbuf;
+	unsigned long flags;
+
+	dprintk(1, ctx->dw_dev, "Queue %p: Stop Streaming.\n", q);
+	for (;;) {
+		if (V4L2_TYPE_IS_OUTPUT(q->type))
+			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		else
+			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		if (vbuf == NULL)
+			break;
+		spin_lock_irqsave(&ctx->dw_dev->irqlock, flags);
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+		spin_unlock_irqrestore(&ctx->dw_dev->irqlock, flags);
+	}
+
+	pm_runtime_put_sync(&ctx->dw_dev->pdev->dev);
+
+	if (ctx->map) {
+		dma_free_coherent(&ctx->dw_dev->pdev->dev,
+				ctx->map_size,
+				ctx->map,
+				ctx->map_dma);
+		ctx->map = NULL;
+	}
+}
+
+static const struct vb2_ops dw100_qops = {
+	.queue_setup	 = dw100_queue_setup,
+	.buf_prepare	 = dw100_buf_prepare,
+	.buf_queue	 = dw100_buf_queue,
+	.start_streaming = dw100_start_streaming,
+	.stop_streaming  = dw100_stop_streaming,
+	.wait_prepare	 = vb2_ops_wait_prepare,
+	.wait_finish	 = vb2_ops_wait_finish,
+};
+
+static int dw100_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
+		      struct vb2_queue *dst_vq)
+{
+	struct dw100_ctx *ctx = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = ctx;
+	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->ops = &dw100_qops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &ctx->dw_dev->vfd_mutex;
+	src_vq->dev = ctx->dw_dev->v4l2_dev.dev;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = ctx;
+	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->ops = &dw100_qops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &ctx->dw_dev->vfd_mutex;
+	dst_vq->dev = ctx->dw_dev->v4l2_dev.dev;
+
+	return vb2_queue_init(dst_vq);
+}
+
+static int dw100_open(struct file *file)
+{
+	struct dw100_device *dw_dev = video_drvdata(file);
+	struct dw100_ctx *ctx;
+	struct v4l2_ctrl_handler *hdl;
+	int ret = 0;
+
+	if (mutex_lock_interruptible(&dw_dev->vfd_mutex))
+		return -ERESTARTSYS;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx) {
+		ret = -ENOMEM;
+		goto open_unlock;
+	}
+
+	v4l2_fh_init(&ctx->fh, video_devdata(file));
+	file->private_data = &ctx->fh;
+	ctx->dw_dev = dw_dev;
+
+	hdl = &ctx->hdl;
+	v4l2_ctrl_handler_init(hdl, 1);
+	v4l2_ctrl_new_custom(hdl, &ctrl_custom_lut, NULL);
+	ctx->fh.ctrl_handler = hdl;
+
+	ctx->q_data[V4L2_M2M_SRC].fmt = &formats[0];
+	ctx->q_data[V4L2_M2M_SRC].width = 640;
+	ctx->q_data[V4L2_M2M_SRC].height = 480;
+	ctx->q_data[V4L2_M2M_SRC].bytesperline =
+		dw100_bytesperline(&formats[0], 640);
+	ctx->q_data[V4L2_M2M_SRC].sizeimage =
+		dw100_sizeimage(&formats[0], 640, 480);
+
+	ctx->q_data[V4L2_M2M_SRC].crop.top = 0;
+	ctx->q_data[V4L2_M2M_SRC].crop.left = 0;
+	ctx->q_data[V4L2_M2M_SRC].crop.width = 640;
+	ctx->q_data[V4L2_M2M_SRC].crop.height = 480;
+
+	ctx->q_data[V4L2_M2M_DST] = ctx->q_data[V4L2_M2M_SRC];
+
+	ctx->colorspace = V4L2_COLORSPACE_REC709;
+	ctx->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(ctx->colorspace);
+	ctx->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(ctx->colorspace);
+	ctx->quant = V4L2_MAP_QUANTIZATION_DEFAULT(false,
+					ctx->colorspace, ctx->ycbcr_enc);
+
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dw_dev->m2m_dev,
+					    ctx, &dw100_m2m_queue_init);
+
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret = PTR_ERR(ctx->fh.m2m_ctx);
+
+		v4l2_ctrl_handler_free(hdl);
+		v4l2_fh_exit(&ctx->fh);
+		kfree(ctx);
+		goto open_unlock;
+	}
+
+	v4l2_fh_add(&ctx->fh);
+
+	dprintk(1, dw_dev, "M2M instance created: %p", ctx->fh.m2m_ctx);
+
+open_unlock:
+	mutex_unlock(&dw_dev->vfd_mutex);
+	return ret;
+}
+
+static int dw100_release(struct file *file)
+{
+	struct dw100_device *dw_dev = video_drvdata(file);
+	struct dw100_ctx *ctx = file2ctx(file);
+
+	dprintk(1, dw_dev, "Releasing M2M instance: %p", ctx->fh.m2m_ctx);
+
+	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_exit(&ctx->fh);
+	v4l2_ctrl_handler_free(&ctx->hdl);
+
+	mutex_lock(&dw_dev->vfd_mutex);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	mutex_unlock(&dw_dev->vfd_mutex);
+
+	if (ctx->map)
+		dma_free_coherent(&ctx->dw_dev->pdev->dev,
+				ctx->map_size,
+				ctx->map,
+				ctx->map_dma);
+
+	kfree(ctx);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations dw100_fops = {
+	.owner		= THIS_MODULE,
+	.open		= dw100_open,
+	.release	= dw100_release,
+	.poll		= v4l2_m2m_fop_poll,
+	.unlocked_ioctl	= video_ioctl2,
+	.mmap		= v4l2_m2m_fop_mmap,
+};
+
+static int dw100_querycap(struct file *file, void *priv,
+			   struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "DW100 dewarper", sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s", DRV_NAME);
+
+	return 0;
+}
+
+static int dw100_enum_fmt(struct v4l2_fmtdesc *f)
+{
+	int i, num = 0;
+
+	for (i = 0; i < NUM_FORMATS; i++) {
+		if (formats[i].types & to_dw100_fmt_type(f->type)) {
+			if (num == f->index) {
+				f->pixelformat = formats[i].fourcc;
+				return 0;
+			}
+			++num;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int dw100_enum_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_fmtdesc *f)
+{
+	return dw100_enum_fmt(f);
+}
+
+static int dw100_enum_fmt_vid_out(struct file *file, void *priv,
+				struct v4l2_fmtdesc *f)
+{
+	return dw100_enum_fmt(f);
+}
+
+static int dw100_g_fmt(struct dw100_ctx *ctx, struct v4l2_format *f)
+{
+	struct vb2_queue *vq;
+	struct dw100_q_data *q_data;
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (!vq)
+		return -EINVAL;
+
+	q_data = get_q_data(ctx, f->type);
+
+	f->fmt.pix.width	= q_data->width;
+	f->fmt.pix.height	= q_data->height;
+	f->fmt.pix.field	= V4L2_FIELD_NONE;
+	f->fmt.pix.pixelformat	= q_data->fmt->fourcc;
+	f->fmt.pix.bytesperline	= q_data->bytesperline;
+	f->fmt.pix.sizeimage	= q_data->sizeimage;
+	f->fmt.pix.colorspace	= ctx->colorspace;
+	f->fmt.pix.xfer_func	= ctx->xfer_func;
+	f->fmt.pix.ycbcr_enc	= ctx->ycbcr_enc;
+	f->fmt.pix.quantization	= ctx->quant;
+
+	return 0;
+}
+
+static int dw100_g_fmt_vid_out(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	return dw100_g_fmt(file2ctx(file), f);
+}
+
+static int dw100_g_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	return dw100_g_fmt(file2ctx(file), f);
+}
+
+static int dw100_try_fmt(struct v4l2_format *f, struct dw100_fmt *fmt)
+{
+
+	v4l_bound_align_image(&f->fmt.pix.width, MIN_W, MAX_W, ALIGN_W,
+			      &f->fmt.pix.height, MIN_H, MAX_H, ALIGN_H, 0);
+
+	f->fmt.pix.bytesperline = dw100_bytesperline(fmt, f->fmt.pix.width);
+	f->fmt.pix.sizeimage = dw100_sizeimage(fmt, f->fmt.pix.width,
+					     f->fmt.pix.height);
+	f->fmt.pix.field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static int dw100_s_fmt(struct dw100_ctx *ctx, struct v4l2_format *f)
+{
+	struct dw100_q_data *q_data;
+	struct vb2_queue *vq;
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (!vq)
+		return -EINVAL;
+
+	q_data = get_q_data(ctx, f->type);
+	if (!q_data)
+		return -EINVAL;
+
+	if (vb2_is_busy(vq)) {
+		v4l2_err(&ctx->dw_dev->v4l2_dev, "%s queue busy\n", __func__);
+		return -EBUSY;
+	}
+
+	q_data->fmt		= find_format(f);
+	q_data->width		= f->fmt.pix.width;
+	q_data->height		= f->fmt.pix.height;
+	q_data->bytesperline	= f->fmt.pix.bytesperline;
+	q_data->sizeimage	= f->fmt.pix.sizeimage;
+
+	q_data->crop.top = 0;
+	q_data->crop.left = 0;
+	q_data->crop.width = f->fmt.pix.width;
+	q_data->crop.height = f->fmt.pix.height;
+
+	dprintk(1, ctx->dw_dev,
+		"Setting format for type %d, wxh: %dx%d, fmt: %d\n",
+		f->type, q_data->width, q_data->height, q_data->fmt->fourcc);
+
+	return 0;
+}
+
+static int dw100_try_fmt_vid_cap(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct dw100_fmt *fmt;
+	struct dw100_ctx *ctx = file2ctx(file);
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	fmt = find_format(f);
+	if (!fmt) {
+		f->fmt.pix.pixelformat = formats[0].fourcc;
+		fmt = find_format(f);
+	}
+
+	f->fmt.pix.colorspace = ctx->colorspace;
+	f->fmt.pix.xfer_func = ctx->xfer_func;
+	f->fmt.pix.ycbcr_enc = ctx->ycbcr_enc;
+	f->fmt.pix.quantization = ctx->quant;
+
+	return dw100_try_fmt(f, fmt);
+}
+
+static int dw100_s_fmt_vid_cap(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct dw100_ctx *ctx = file2ctx(file);
+	int ret;
+
+	ret = dw100_try_fmt_vid_cap(file, priv, f);
+	if (ret)
+		return ret;
+
+	ret = dw100_s_fmt(ctx, f);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int dw100_try_fmt_vid_out(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct dw100_fmt *fmt;
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	fmt = find_format(f);
+	if (!fmt) {
+		f->fmt.pix.pixelformat = formats[0].fourcc;
+		fmt = find_format(f);
+	}
+
+	if (!f->fmt.pix.colorspace)
+		f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
+
+	return dw100_try_fmt(f, fmt);
+}
+
+static int dw100_s_fmt_vid_out(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct dw100_ctx *ctx = file2ctx(file);
+	int ret;
+
+	ret = dw100_try_fmt_vid_out(file, priv, f);
+	if (ret)
+		return ret;
+
+	ret = dw100_s_fmt(ctx, f);
+	if (ret)
+		return ret;
+
+	ctx->colorspace = f->fmt.pix.colorspace;
+	ctx->xfer_func = f->fmt.pix.xfer_func;
+	ctx->ycbcr_enc = f->fmt.pix.ycbcr_enc;
+	ctx->quant = f->fmt.pix.quantization;
+
+	return 0;
+}
+
+static	int dw100_g_selection(struct file *file, void *fh,
+				  struct v4l2_selection *sel)
+{
+	struct dw100_ctx *ctx = file2ctx(file);
+	struct dw100_q_data *src_q_data, *dst_q_data;
+
+	if ((sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) &&
+		(sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE))
+		return -EINVAL;
+
+	src_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+	dst_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = src_q_data->width;
+		sel->r.height = src_q_data->height;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		sel->r.top = src_q_data->crop.top;
+		sel->r.left = src_q_data->crop.left;
+		sel->r.width = src_q_data->crop.width;
+		sel->r.height = src_q_data->crop.height;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = dst_q_data->width;
+		sel->r.height = dst_q_data->height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dprintk(1, ctx->dw_dev,
+		"<<< Buffer Type: %d Target: %d Rect: %dx%d@%d.%d\n",
+		sel->type, sel->target,
+		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
+
+	return 0;
+}
+
+#define MIN(a, b) ((a) < (b) ? (a):(b))
+#define MAX(a, b) ((a) > (b) ? (a):(b))
+static	int dw100_s_selection(struct file *file, void *fh,
+				  struct v4l2_selection *sel)
+{
+	struct dw100_ctx *ctx = file2ctx(file);
+	struct dw100_q_data *src_q_data, *dst_q_data;
+	u32 qscalex, qscaley, qscale;
+	int x, y, w, h;
+
+	if ((sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) &&
+		(sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE))
+		return -EINVAL;
+
+	src_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+	dst_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+
+	dprintk(1, ctx->dw_dev,
+		">>> Buffer Type: %d Target: %d Rect: %dx%d@%d.%d\n",
+		sel->type, sel->target,
+		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
+
+	if ((sel->r.top < 0) || (sel->r.left < 0))
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		/* UQ16.16 for float operations */
+		if ((sel->r.left + sel->r.width > src_q_data->width) ||
+		    (sel->r.top + sel->r.height > src_q_data->height))
+			return -EINVAL;
+		qscalex = (sel->r.width << 16) / src_q_data->width;
+		qscaley = (sel->r.height << 16) / src_q_data->height;
+		y = sel->r.top;
+		x = sel->r.left;
+		if (qscalex == qscaley) {
+			qscale = qscalex;
+		} else {
+			switch (sel->flags) {
+			case 0:
+				qscale = (qscalex + qscaley) / 2;
+				break;
+			case V4L2_SEL_FLAG_GE:
+				qscale = MAX(qscaley, qscalex);
+				break;
+			case V4L2_SEL_FLAG_LE:
+				qscale = MIN(qscaley, qscalex);
+				break;
+			case V4L2_SEL_FLAG_LE | V4L2_SEL_FLAG_GE:
+				return -ERANGE;
+			default:
+				return -EINVAL;
+			}
+		}
+
+		w = (u32)((((u64)src_q_data->width << 16) * qscale) >> 32);
+		h = (u32)((((u64)src_q_data->height << 16) * qscale) >> 32);
+		x = x + (sel->r.width  - w) / 2;
+		y = y + (sel->r.height  - h) / 2;
+		x = MIN(src_q_data->width - w, MAX(0, x));
+		y = MIN(src_q_data->height - h, MAX(0, y));
+
+		src_q_data->crop.top = sel->r.top = y;
+		src_q_data->crop.left = sel->r.left = x;
+		src_q_data->crop.width = sel->r.width = w;
+		src_q_data->crop.height = sel->r.height = h;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		if ((sel->r.left + sel->r.width > dst_q_data->width) ||
+		    (sel->r.top + sel->r.height > dst_q_data->height))
+			return -EINVAL;
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = dst_q_data->width;
+		sel->r.height = dst_q_data->height;
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	default:
+		return -EINVAL;
+	}
+
+	dprintk(1, ctx->dw_dev,
+		"<<< Buffer Type: %d Target: %d Rect: %dx%d@%d.%d\n",
+		sel->type, sel->target,
+		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops dw100_ioctl_ops = {
+	.vidioc_querycap	= dw100_querycap,
+
+	.vidioc_enum_fmt_vid_cap = dw100_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap	= dw100_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap	= dw100_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap	= dw100_s_fmt_vid_cap,
+
+	.vidioc_enum_fmt_vid_out = dw100_enum_fmt_vid_out,
+	.vidioc_g_fmt_vid_out	= dw100_g_fmt_vid_out,
+	.vidioc_try_fmt_vid_out	= dw100_try_fmt_vid_out,
+	.vidioc_s_fmt_vid_out	= dw100_s_fmt_vid_out,
+
+	.vidioc_g_selection	= dw100_g_selection,
+	.vidioc_s_selection	= dw100_s_selection,
+	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static void dw100_job_finish(struct dw100_device *dw_dev, bool with_error)
+{
+	struct dw100_ctx *curr_ctx;
+	struct vb2_v4l2_buffer *src_vb, *dst_vb;
+	unsigned long flags;
+	enum vb2_buffer_state buf_state;
+
+	curr_ctx = v4l2_m2m_get_curr_priv(dw_dev->m2m_dev);
+
+	if (curr_ctx == NULL) {
+		v4l2_err(&dw_dev->v4l2_dev,
+			"Instance released before the end of transaction\n");
+		return;
+	}
+
+	src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
+	dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
+
+	if (likely(!with_error))
+		buf_state = VB2_BUF_STATE_DONE;
+	else
+		buf_state = VB2_BUF_STATE_ERROR;
+
+	spin_lock_irqsave(&dw_dev->irqlock, flags);
+	v4l2_m2m_buf_done(src_vb, buf_state);
+	v4l2_m2m_buf_done(dst_vb, buf_state);
+	spin_unlock_irqrestore(&dw_dev->irqlock, flags);
+
+	dprintk(2, dw_dev, "Finishing transaction with%s error(s)\n",
+			with_error ? "" : "out");
+
+	v4l2_m2m_job_finish(dw_dev->m2m_dev, curr_ctx->fh.m2m_ctx);
+}
+
+static void dw100_hw_reset(struct dw100_device *dw_dev)
+{
+	u32 val;
+
+	val = readl(dw_dev->mmio + DW100_DEWARP_CTRL);
+	val |= DW100_DEWARP_CTRL_ENABLE;
+	val |= DW100_DEWARP_CTRL_SOFT_RESET;
+	writel(val, dw_dev->mmio + DW100_DEWARP_CTRL);
+	val &= ~DW100_DEWARP_CTRL_SOFT_RESET;
+	writel(val, dw_dev->mmio + DW100_DEWARP_CTRL);
+}
+
+static void _dw100_hw_set_master_bus_enable(
+				struct dw100_device *dw_dev, unsigned int enable)
+{
+	u32 val;
+	void __iomem *addr = dw_dev->mmio + DW100_BUS_CTRL;
+
+	dprintk(3, dw_dev, "%sable master bus\n", enable ? "En" : "Dis");
+
+	val = readl(addr);
+
+	if (enable)
+		val |= DW100_BUS_CTRL_AXI_MASTER_ENABLE;
+	else
+		val &= ~DW100_BUS_CTRL_AXI_MASTER_ENABLE;
+
+	writel(val, addr);
+}
+
+static void dw100_hw_master_bus_enable(struct dw100_device *dw_dev)
+{
+	_dw100_hw_set_master_bus_enable(dw_dev, 1);
+}
+
+static void dw100_hw_master_bus_disable(struct dw100_device *dw_dev)
+{
+
+	_dw100_hw_set_master_bus_enable(dw_dev, 0);
+}
+
+static void dw100_hw_dewarp_start(struct dw100_device *dw_dev)
+{
+	u32 val;
+	void __iomem *addr = dw_dev->mmio + DW100_DEWARP_CTRL;
+
+	val = readl(addr);
+
+	dprintk(3, dw_dev, "Starting Hardware CTRL:%x\n", val);
+	writel(val | DW100_DEWARP_CTRL_START, addr);
+	writel(val, addr);
+}
+
+static void dw100_hw_init_ctrl(struct dw100_device *dw_dev)
+{
+	u32 val;
+	void __iomem *addr = dw_dev->mmio + DW100_DEWARP_CTRL;
+	/*
+	 * Input format YUV422_SP
+	 * Output format YUV422_SP
+	 * No hardware handshake (SW)
+	 * No automatic double src buffering (Single)
+	 * No automatic double dst buffering (Single)
+	 * No Black Line
+	 * Prefetch image pixel traversal
+	 */
+
+	val = DW100_DEWARP_CTRL_ENABLE
+		/* Valid only for auto prefetch mode*/
+		| DW100_DEWARP_CTRL_PREFETCH_THRESHOLD(32);
+
+	/*
+	 * Calculation mode required to support any scaling factor,
+	 * but x4 slower than traversal mode.
+	 *
+	 * DW100_DEWARP_CTRL_PREFETCH_MODE_TRAVERSAL
+	 * DW100_DEWARP_CTRL_PREFETCH_MODE_CALCULATION
+	 * DW100_DEWARP_CTRL_PREFETCH_MODE_AUTO
+	 *
+	 * TODO: Find heuristics requiring calculation mode
+	 *
+	 */
+	val |= DW100_DEWARP_CTRL_PREFETCH_MODE_CALCULATION;
+
+	writel(val, addr);
+}
+
+static void dw100_hw_set_pixel_boundary(struct dw100_device *dw_dev)
+{
+	u32 val;
+	void __iomem *addr = dw_dev->mmio + DW100_BOUNDARY_PIXEL;
+
+	val = DW100_BOUNDARY_PIXEL_V(128)
+		| DW100_BOUNDARY_PIXEL_U(128)
+		| DW100_BOUNDARY_PIXEL_Y(0);
+
+	writel(val, addr);
+}
+
+static void dw100_hw_set_scale(struct dw100_device *dw_dev, u8 scale)
+{
+	void __iomem *addr = dw_dev->mmio + DW100_SCALE_FACTOR;
+
+	dprintk(1, dw_dev, "Setting scale factor to %d\n", scale);
+
+	writel(scale, addr);
+}
+
+static void dw100_hw_set_roi(struct dw100_device *dw_dev, u32 x, u32 y)
+{
+	u32 val;
+	void __iomem *addr = dw_dev->mmio + DW100_ROI_START;
+
+	dprintk(1, dw_dev, "Setting ROI region to %d.%d\n", x, y);
+
+	val = DW100_ROI_START_X(x) | DW100_ROI_START_Y(y);
+
+	writel(val, addr);
+}
+
+static void dw100_hw_set_src_crop(struct dw100_device *dw_dev,
+			     struct dw100_q_data *src_q_data,
+			     struct dw100_q_data *dst_q_data)
+{
+	struct v4l2_rect *rect = &src_q_data->crop;
+	u32 src_scale, qscale, left_scale, top_scale;
+
+	/* HW Scale is UQ1.7 encoded */
+	src_scale = (rect->width << 7) / src_q_data->width;
+	dw100_hw_set_scale(dw_dev, src_scale);
+
+	qscale = (dst_q_data->width << 7)  / src_q_data->width;
+
+	left_scale = (((rect->left << 7) * qscale) >> 14);
+	top_scale = (((rect->top << 7) * qscale) >> 14);
+
+	dw100_hw_set_roi(dw_dev, left_scale, top_scale);
+}
+
+static void dw100_hw_set_source(struct dw100_device *dw_dev,
+				struct dw100_q_data *q_data,
+				dma_addr_t addr)
+{
+	u32 width, height, stride, fourcc, val;
+	struct dw100_fmt *fmt = q_data->fmt;
+
+	width =  q_data->width;
+	height = q_data->height;
+	stride = q_data->bytesperline;
+	fourcc = q_data->fmt->fourcc;
+
+	dprintk(3, dw_dev, "Set HW source registers for %dx%d - stride %d, pixfmt: %x, dma:%pa\n",
+		width, height, stride, fourcc, &addr);
+
+	/* Pixel Format */
+	val = readl(dw_dev->mmio + DW100_DEWARP_CTRL);
+
+	val &= ~DW100_DEWARP_CTRL_INPUT_FORMAT_MASK;
+	val |= DW100_DEWARP_CTRL_INPUT_FORMAT(fmt->reg_format);
+
+	writel(val, dw_dev->mmio + DW100_DEWARP_CTRL);
+
+	/* Swap */
+	val = readl(dw_dev->mmio + DW100_SWAP_CONTROL);
+
+	val &= ~DW100_SWAP_CONTROL_SRC_MASK;
+	/*
+	 * Data swapping is performed only on Y plane for source image.
+	 */
+	if (fmt->reg_swap_uv
+	    && (fmt->reg_format == DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED))
+		val |= DW100_SWAP_CONTROL_SRC(
+				DW100_SWAP_CONTROL_Y(
+					DW100_SWAP_CONTROL_BYTE
+				)
+			);
+
+	writel(val, dw_dev->mmio + DW100_SWAP_CONTROL);
+
+	/* Image resolution */
+	writel(DW100_IMG_SIZE_WIDTH(width) | DW100_IMG_SIZE_HEIGHT(height),
+					dw_dev->mmio + DW100_SRC_IMG_SIZE);
+
+	writel(stride, dw_dev->mmio + DW100_SRC_IMG_STRIDE);
+
+	/* Buffers */
+	writel(DW100_IMG_Y_BASE(addr), dw_dev->mmio + DW100_SRC_IMG_Y_BASE);
+	writel(DW100_IMG_UV_BASE((addr + (stride * height))),
+					dw_dev->mmio + DW100_SRC_IMG_UV_BASE);
+}
+
+static void dw100_hw_set_destination(struct dw100_device *dw_dev,
+				struct dw100_q_data *q_data,
+				struct dw100_fmt *ifmt,
+				dma_addr_t addr)
+{
+	u32 width, height, stride, fourcc, val;
+	struct dw100_fmt *fmt = q_data->fmt;
+
+	width =  q_data->width;
+	height = q_data->height;
+	stride = q_data->bytesperline;
+	fourcc = q_data->fmt->fourcc;
+
+	dprintk(3, dw_dev, "Set HW source registers for %dx%d - stride %d, pixfmt: %x, dma:%pa\n",
+		width, height, stride, fourcc, &addr);
+
+	/* Pixel Format */
+	val = readl(dw_dev->mmio + DW100_DEWARP_CTRL);
+
+	val &= ~DW100_DEWARP_CTRL_OUTPUT_FORMAT_MASK;
+	val |= DW100_DEWARP_CTRL_OUTPUT_FORMAT(fmt->reg_format);
+
+	writel(val, dw_dev->mmio + DW100_DEWARP_CTRL);
+
+	/* Swap */
+	val = readl(dw_dev->mmio + DW100_SWAP_CONTROL);
+
+	val &= ~DW100_SWAP_CONTROL_DST_MASK;
+
+	/*
+	 * Avoid to swap twice
+	 */
+	if (fmt->reg_swap_uv
+	    ^ (ifmt->reg_swap_uv
+	      && (ifmt->reg_format != DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED)
+	      )
+	    ) {
+		if (fmt->reg_format == DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED)
+			val |= DW100_SWAP_CONTROL_DST(
+				DW100_SWAP_CONTROL_Y(
+					DW100_SWAP_CONTROL_BYTE
+					)
+				);
+		else
+			val |= DW100_SWAP_CONTROL_DST(
+				DW100_SWAP_CONTROL_UV(
+					DW100_SWAP_CONTROL_BYTE)
+				);
+	}
+
+	writel(val, dw_dev->mmio + DW100_SWAP_CONTROL);
+
+	/* Image resolution */
+	writel(DW100_IMG_SIZE_WIDTH(width) | DW100_IMG_SIZE_HEIGHT(height),
+					dw_dev->mmio + DW100_DST_IMG_SIZE);
+	writel(stride, dw_dev->mmio + DW100_DST_IMG_STRIDE);
+
+	val = ALIGN(stride * height, 16);
+	writel(DW100_IMG_Y_BASE(addr), dw_dev->mmio + DW100_DST_IMG_Y_BASE);
+	writel(DW100_IMG_UV_BASE(addr + val),
+					dw_dev->mmio + DW100_DST_IMG_UV_BASE);
+	writel(DW100_DST_IMG_Y_SIZE(val),
+					dw_dev->mmio + DW100_DST_IMG_Y_SIZE1);
+
+	if (fmt->reg_format == DW100_DEWARP_CTRL_FORMAT_YUV420_SP)
+		val /= 2;
+
+	writel(DW100_DST_IMG_UV_SIZE(val),
+					dw_dev->mmio + DW100_DST_IMG_UV_SIZE1);
+}
+
+static void dw100_hw_set_mapping(struct dw100_device *dw_dev,
+						dma_addr_t addr,
+						u32 width,
+						u32 height)
+{
+	dprintk(1, dw_dev, "Set HW mapping registers for %dx%d addr:%pa",
+					width, height, &addr);
+
+	writel(DW100_MAP_LUT_ADDR_ADDR(addr), dw_dev->mmio + DW100_MAP_LUT_ADDR);
+	writel(DW100_MAP_LUT_SIZE_WIDTH(width)
+		| DW100_MAP_LUT_SIZE_HEIGHT(height),
+			dw_dev->mmio + DW100_MAP_LUT_SIZE);
+}
+
+static void dw100_hw_clear_irq(struct dw100_device *dw_dev, unsigned int irq)
+{
+	writel(DW100_INTERRUPT_STATUS_INT_CLEAR(irq),
+			dw_dev->mmio + DW100_INTERRUPT_STATUS);
+}
+
+static void dw100_hw_enable_irq(struct dw100_device *dw_dev)
+{
+	writel(DW100_INTERRUPT_STATUS_INT_ENABLE_MASK,
+			dw_dev->mmio + DW100_INTERRUPT_STATUS);
+}
+
+static void dw100_hw_disable_irq(struct dw100_device *dw_dev)
+{
+	writel(0, dw_dev->mmio + DW100_INTERRUPT_STATUS);
+}
+
+static bool dw100_hw_is_frame_running(struct dw100_device *dw_dev)
+{
+	bool is_running = readl(dw_dev->mmio + DW100_INTERRUPT_STATUS)
+				& DW100_INTERRUPT_STATUS_FRAME_BUSY;
+
+	return is_running;
+}
+
+static u32 dw_hw_get_pending_irqs(struct dw100_device *dw_dev)
+{
+	u32 val;
+
+	val = readl(dw_dev->mmio + DW100_INTERRUPT_STATUS);
+
+	return DW100_INTERRUPT_STATUS_INT_STATUS(val);
+}
+
+static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
+{
+	struct dw100_device *dw_dev = dev_id;
+	u32 pending_irqs, err_irqs, frame_done_irq;
+	bool with_error = true;
+
+	pending_irqs = dw_hw_get_pending_irqs(dw_dev);
+	frame_done_irq = pending_irqs & DW100_INTERRUPT_STATUS_INT_FRAME_DONE;
+	err_irqs = DW100_INTERRUPT_STATUS_INT_ERR_STATUS(pending_irqs);
+
+	if (frame_done_irq) {
+		dprintk(3, dw_dev, "Frame done interrupt\n");
+		with_error = false;
+		err_irqs &= ~DW100_INTERRUPT_STATUS_INT_ERR_STATUS(
+				DW100_INTERRUPT_STATUS_INT_ERR_FRAME_DONE);
+	}
+
+	if (err_irqs)
+		v4l2_err(&dw_dev->v4l2_dev, "Interrupt error: %#x\n", err_irqs);
+
+	dw100_hw_disable_irq(dw_dev);
+	dw100_hw_master_bus_disable(dw_dev);
+	dw100_hw_clear_irq(dw_dev, pending_irqs
+			   | DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT);
+
+	dw100_job_finish(dw_dev, with_error);
+
+	return IRQ_HANDLED;
+}
+
+static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
+		     struct vb2_v4l2_buffer *out_vb)
+{
+	struct dw100_device *dw_dev = ctx->dw_dev;
+	dma_addr_t p_in, p_out;
+
+	p_in = vb2_dma_contig_plane_dma_addr(&in_vb->vb2_buf, 0);
+	p_out = vb2_dma_contig_plane_dma_addr(&out_vb->vb2_buf, 0);
+	if (!p_in || !p_out) {
+		v4l2_err(&dw_dev->v4l2_dev,
+			 "Acquiring DMA addresses of buffers failed\n");
+		return;
+	}
+
+	out_vb->sequence =
+		get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE)->sequence++;
+	in_vb->sequence =
+		get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT)->sequence++;
+
+	dprintk(1, ctx->dw_dev,
+		"Starting queues %p->%p buffers d:%pa->d:%pa, sequence %d->%d\n",
+		v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT),
+		v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE),
+		&p_in, &p_out, in_vb->sequence, out_vb->sequence);
+
+	out_vb->vb2_buf.timestamp = in_vb->vb2_buf.timestamp;
+	out_vb->field = in_vb->field;
+	if (in_vb->flags & V4L2_BUF_FLAG_TIMECODE)
+		out_vb->timecode = in_vb->timecode;
+	out_vb->flags = in_vb->flags &
+		(V4L2_BUF_FLAG_TIMECODE |
+		 V4L2_BUF_FLAG_KEYFRAME |
+		 V4L2_BUF_FLAG_PFRAME |
+		 V4L2_BUF_FLAG_BFRAME |
+		 V4L2_BUF_FLAG_TIMESTAMP_MASK |
+		 V4L2_BUF_FLAG_TSTAMP_SRC_MASK);
+
+	/* Now, let's deal with hardware ... */
+	dw100_hw_master_bus_disable(dw_dev);
+	if (!ctx->map)
+		dw100_create_mapping(ctx);
+
+	dw100_hw_init_ctrl(dw_dev);
+	dw100_hw_set_pixel_boundary(dw_dev);
+	dw100_hw_set_src_crop(dw_dev, &ctx->q_data[V4L2_M2M_SRC],
+			      &ctx->q_data[V4L2_M2M_DST]);
+	dw100_hw_set_source(dw_dev, &ctx->q_data[V4L2_M2M_SRC], p_in);
+	dw100_hw_set_destination(dw_dev, &ctx->q_data[V4L2_M2M_DST],
+				 ctx->q_data[V4L2_M2M_SRC].fmt, p_out);
+	dw100_hw_set_mapping(dw_dev, ctx->map_dma,
+				ctx->map_width, ctx->map_height);
+	dw100_hw_enable_irq(dw_dev);
+	dw100_hw_dewarp_start(dw_dev);
+
+	/* Enable Bus */
+	dw100_hw_master_bus_enable(dw_dev);
+}
+
+static void dw100_device_run(void *priv)
+{
+	struct dw100_ctx *ctx = priv;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	dw100_start(ctx, src_buf, dst_buf);
+}
+
+static int dw100_job_ready(void *priv)
+{
+	struct dw100_ctx *ctx = priv;
+
+	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) < 1 ||
+	    v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx) < 1) {
+		dprintk(1, ctx->dw_dev, "Not enough buffers available\n");
+		return 0;
+	}
+
+	if (dw100_hw_is_frame_running(ctx->dw_dev)) {
+		dprintk(1, ctx->dw_dev, "HW still running a frame\n");
+		return 0;
+	}
+
+	return 1;
+}
+
+static const struct v4l2_m2m_ops dw100_m2m_ops = {
+	.device_run	= dw100_device_run,
+	.job_ready	= dw100_job_ready,
+};
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+static const struct media_device_ops dw100_media_ops = {
+	.req_validate = vb2_request_validate,
+	.req_queue = v4l2_m2m_request_queue,
+};
+#endif
+
+static struct video_device *dw100_init_video_device(struct dw100_device *dw_dev)
+{
+	struct video_device *vfd = &dw_dev->vfd;
+
+	vfd->vfl_dir = VFL_DIR_M2M;
+	vfd->fops = &dw100_fops;
+	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
+	vfd->ioctl_ops = &dw100_ioctl_ops;
+	vfd->minor = -1;
+	vfd->release = video_device_release_empty;
+	vfd->v4l2_dev = &dw_dev->v4l2_dev;
+	vfd->lock = &dw_dev->vfd_mutex;
+
+	strncpy(vfd->name, DRV_NAME, sizeof(vfd->name));
+	mutex_init(vfd->lock);
+	video_set_drvdata(vfd, dw_dev);
+
+	return vfd;
+}
+
+static int dw100_dump_regs_show(struct seq_file *m, void *private)
+{
+	struct dw100_device *dw_dev = m->private;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(&dw_dev->pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = dw100_dump_regs(dw_dev);
+
+	pm_runtime_put_sync(&dw_dev->pdev->dev);
+
+	return ret;
+}
+DEFINE_SHOW_ATTRIBUTE(dw100_dump_regs);
+
+static void dw100_debugfs_init(struct dw100_device *dw_dev)
+{
+	dw_dev->debugfs_root =
+		debugfs_create_dir(dev_name(&dw_dev->pdev->dev), NULL);
+
+	debugfs_create_file("dump_regs", 0600, dw_dev->debugfs_root, dw_dev,
+			    &dw100_dump_regs_fops);
+}
+
+static void dw100_debugfs_exit(struct dw100_device *dw_dev)
+{
+	debugfs_remove_recursive(dw_dev->debugfs_root);
+}
+
+static int dw100_probe(struct platform_device *pdev)
+{
+	struct dw100_device *dw_dev;
+	struct video_device *vfd;
+	struct resource *res;
+	int ret = 0;
+	int irq;
+
+	dw_dev = devm_kzalloc(&pdev->dev, sizeof(*dw_dev), GFP_KERNEL);
+	if (!dw_dev)
+		return -ENOMEM;
+	dw_dev->pdev = pdev;
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dw_dev->clks);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Unable to get clocks: %d\n", ret);
+		return ret;
+	}
+	dw_dev->num_clks = ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	dw_dev->mmio = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(dw_dev->mmio))
+		return PTR_ERR(dw_dev->mmio);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, dw100_irq_handler,
+			IRQF_ONESHOT, dev_name(&pdev->dev), dw_dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, dw_dev);
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Unable to enable clks: %d\n", ret);
+		goto err_clk;
+	}
+
+	dw100_hw_reset(dw_dev);
+
+	pm_runtime_put_sync(&pdev->dev);
+
+	spin_lock_init(&dw_dev->irqlock);
+
+	ret = v4l2_device_register(&pdev->dev, &dw_dev->v4l2_dev);
+	if (ret)
+		goto err_clk;
+
+	vfd = dw100_init_video_device(dw_dev);
+
+	dw_dev->m2m_dev = v4l2_m2m_init(&dw100_m2m_ops);
+	if (IS_ERR(dw_dev->m2m_dev)) {
+		v4l2_err(&dw_dev->v4l2_dev, "Failed to init mem2mem device\n");
+		ret = PTR_ERR(dw_dev->m2m_dev);
+		goto err_v4l2;
+	}
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	dw_dev->mdev.dev = &pdev->dev;
+	strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.model));
+	strscpy(dw_dev->mdev.bus_info, "platform:dw100",
+		sizeof(dw_dev->mdev.bus_info));
+	media_device_init(&dw_dev->mdev);
+	dw_dev->mdev.ops = &dw100_media_ops;
+	dw_dev->v4l2_dev.mdev = &dw_dev->mdev;
+#endif
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		v4l2_err(&dw_dev->v4l2_dev, "Failed to register video device\n");
+		goto err_m2m;
+	}
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	ret = v4l2_m2m_register_media_controller(dw_dev->m2m_dev, vfd,
+						 MEDIA_ENT_F_PROC_VIDEO_SCALER);
+	if (ret) {
+		v4l2_err(&dw_dev->v4l2_dev, "Failed to init mem2mem media controller\n");
+		goto error_v4l2;
+	}
+
+	ret = media_device_register(&dw_dev->mdev);
+	if (ret) {
+		v4l2_err(&dw_dev->v4l2_dev, "Failed to register mem2mem media device\n");
+		goto error_m2m_mc;
+	}
+#endif
+
+	dw100_debugfs_init(dw_dev);
+
+	v4l2_info(&dw_dev->v4l2_dev,
+		  "dw100 v4l2 m2m registered as /dev/video%d\n", vfd->num);
+
+	return 0;
+#ifdef CONFIG_MEDIA_CONTROLLER
+error_m2m_mc:
+	v4l2_m2m_unregister_media_controller(dw_dev->m2m_dev);
+error_v4l2:
+	video_unregister_device(vfd);
+#endif
+err_m2m:
+	v4l2_m2m_release(dw_dev->m2m_dev);
+err_v4l2:
+	v4l2_device_unregister(&dw_dev->v4l2_dev);
+err_clk:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static int dw100_remove(struct platform_device *pdev)
+{
+	struct dw100_device *dw_dev = platform_get_drvdata(pdev);
+
+	dw100_debugfs_exit(dw_dev);
+
+	pm_runtime_disable(&pdev->dev);
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	media_device_unregister(&dw_dev->mdev);
+	v4l2_m2m_unregister_media_controller(dw_dev->m2m_dev);
+	media_device_cleanup(&dw_dev->mdev);
+#endif
+
+	video_unregister_device(&dw_dev->vfd);
+	v4l2_m2m_release(dw_dev->m2m_dev);
+	v4l2_device_unregister(&dw_dev->v4l2_dev);
+
+	return 0;
+}
+
+static int __maybe_unused dw100_runtime_suspend(struct device *dev)
+{
+	struct dw100_device *dw_dev = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(dw_dev->num_clks, dw_dev->clks);
+
+	return 0;
+}
+
+static int __maybe_unused dw100_runtime_resume(struct device *dev)
+{
+	struct dw100_device *dw_dev = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(dw_dev->num_clks, dw_dev->clks);
+}
+
+static const struct dev_pm_ops dw100_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(dw100_runtime_suspend,
+			   dw100_runtime_resume, NULL)
+};
+
+static const struct of_device_id dw100_dt_ids[] = {
+	{ .compatible = "nxp,dw100", .data = NULL },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, dw100_dt_ids);
+
+static struct platform_driver dw100_driver = {
+	.probe		= dw100_probe,
+	.remove		= dw100_remove,
+	.driver		= {
+		.name	= DRV_NAME,
+		.pm = &dw100_pm,
+		.of_match_table = dw100_dt_ids,
+	},
+};
+
+module_platform_driver(dw100_driver);
+
+MODULE_DESCRIPTION("DW100 Hardware dewarper");
+MODULE_AUTHOR("Xavier Roumegue <Xavier.Roumegue@oss.nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/dw100/dw100_regs.h b/drivers/media/platform/dw100/dw100_regs.h
new file mode 100644
index 000000000000..fe16dbaa5f06
--- /dev/null
+++ b/drivers/media/platform/dw100/dw100_regs.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * DW100 Hardware dewarper
+ *
+ * Copyright 2022 NXP
+ * Author: Xavier Roumegue (xavier.roumegue@oss.nxp.com)
+ *
+ */
+
+#ifndef _DW100_REGS_H_
+#define _DW100_REGS_H_
+
+/* AHB register offset */
+#define DW100_DEWARP_ID			0x00
+#define DW100_DEWARP_CTRL		0x04
+#define DW100_DEWARP_CTRL_ENABLE			BIT(0)
+#define DW100_DEWARP_CTRL_START				BIT(1)
+#define DW100_DEWARP_CTRL_SOFT_RESET			BIT(2)
+#define DW100_DEWARP_CTRL_FORMAT_YUV422_SP		(0UL)
+#define DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED		(1UL)
+#define DW100_DEWARP_CTRL_FORMAT_YUV420_SP		(2UL)
+#define DW100_DEWARP_CTRL_INPUT_FORMAT_MASK		GENMASK(5, 4)
+#define DW100_DEWARP_CTRL_INPUT_FORMAT(x)		((x) << 4)
+#define DW100_DEWARP_CTRL_OUTPUT_FORMAT(x)		((x) << 6)
+#define DW100_DEWARP_CTRL_OUTPUT_FORMAT_MASK		GENMASK(7, 6)
+#define DW100_DEWARP_CTRL_SRC_AUTO_SHADOW		BIT(8)
+#define DW100_DEWARP_CTRL_HW_HANDSHAKE			BIT(9)
+#define DW100_DEWARP_CTRL_DST_AUTO_SHADOW		BIT(10)
+#define DW100_DEWARP_CTRL_SPLIT_LINE			BIT(11)
+#define DW100_DEWARP_CTRL_PREFETCH_MODE_MASK		GENMASK(17, 16)
+#define DW100_DEWARP_CTRL_PREFETCH_MODE_TRAVERSAL	(0UL << 16)
+#define DW100_DEWARP_CTRL_PREFETCH_MODE_CALCULATION	(1UL << 16)
+#define DW100_DEWARP_CTRL_PREFETCH_MODE_AUTO		(2UL << 16)
+#define DW100_DEWARP_CTRL_PREFETCH_THRESHOLD_MASK	GENMASK(24, 18)
+#define DW100_DEWARP_CTRL_PREFETCH_THRESHOLD(x)		((x) << 18)
+
+#define DW100_MAP_LUT_ADDR		0x08
+#define DW100_MAP_LUT_ADDR_ADDR(addr)	(((addr) >> 4) & GENMASK(29, 0))
+#define DW100_MAP_LUT_SIZE		0x0C
+#define DW100_MAP_LUT_SIZE_WIDTH(w)	(((w) & GENMASK(10, 0)) << 0)
+#define DW100_MAP_LUT_SIZE_HEIGHT(h)	(((h) & GENMASK(10, 0)) << 16)
+#define DW100_SRC_IMG_Y_BASE		0x10
+#define DW100_IMG_Y_BASE(base)		(((base) >> 4) & GENMASK(29, 0))
+#define DW100_SRC_IMG_UV_BASE		0x14
+#define DW100_IMG_UV_BASE(base)		(((base) >> 4) & GENMASK(29, 0))
+#define DW100_SRC_IMG_SIZE		0x18
+#define DW100_IMG_SIZE_WIDTH(w)		(((w) & GENMASK(12, 0)) << 0)
+#define DW100_IMG_SIZE_HEIGHT(h)	(((h) & GENMASK(12, 0)) << 16)
+
+#define DW100_SRC_IMG_STRIDE		0x1C
+#define DW100_MAP_LUT_ADDR2		0x20
+#define DW100_MAP_LUT_SIZE2		0x24
+#define DW100_SRC_IMG_Y_BASE2		0x28
+#define DW100_SRC_IMG_UV_BASE2		0x2C
+#define DW100_SRC_IMG_SIZE2		0x30
+#define DW100_SRC_IMG_STRIDE2		0x34
+#define DW100_DST_IMG_Y_BASE		0x38
+#define DW100_DST_IMG_UV_BASE		0x3C
+#define DW100_DST_IMG_SIZE		0x40
+#define DW100_DST_IMG_STRIDE		0x44
+#define DW100_DST_IMG_Y_BASE2		0x48
+#define DW100_DST_IMG_UV_BASE2		0x4C
+#define DW100_DST_IMG_SIZE2		0x50
+#define DW100_DST_IMG_STRIDE2		0x54
+#define DW100_SWAP_CONTROL		0x58
+#define DW100_SWAP_CONTROL_BYTE		BIT(0)
+#define DW100_SWAP_CONTROL_SHORT	BIT(1)
+#define DW100_SWAP_CONTROL_WORD		BIT(2)
+#define DW100_SWAP_CONTROL_LONG		BIT(3)
+#define DW100_SWAP_CONTROL_Y(x)		(((x) & GENMASK(3, 0)) << 0)
+#define DW100_SWAP_CONTROL_UV(x)	(((x) & GENMASK(3, 0)) << 4)
+#define DW100_SWAP_CONTROL_SRC(x)	(((x) & GENMASK(7, 0)) << 0)
+#define DW100_SWAP_CONTROL_DST(x)	(((x) & GENMASK(7, 0)) << 8)
+#define DW100_SWAP_CONTROL_SRC2(x)	(((x) & GENMASK(7, 0)) << 16)
+#define DW100_SWAP_CONTROL_DST2(x)	(((x) & GENMASK(7, 0)) << 24)
+#define DW100_SWAP_CONTROL_SRC_MASK	GENMASK(7, 0)
+#define DW100_SWAP_CONTROL_DST_MASK	GENMASK(15, 8)
+#define DW100_SWAP_CONTROL_SRC2_MASK	GENMASK(23, 16)
+#define DW100_SWAP_CONTROL_DST2_MASK	GENMASK(31, 24)
+#define DW100_VERTICAL_SPLIT_LINE	0x5C
+#define DW100_HORIZON_SPLIT_LINE	0x60
+#define DW100_SCALE_FACTOR		0x64
+#define DW100_ROI_START			0x68
+#define DW100_ROI_START_X(x)		(((x) & GENMASK(12, 0)) << 0)
+#define DW100_ROI_START_Y(y)		(((y) & GENMASK(12, 0)) << 16)
+#define DW100_BOUNDARY_PIXEL		0x6C
+#define DW100_BOUNDARY_PIXEL_V(v)	(((v) & GENMASK(7, 0)) << 0)
+#define DW100_BOUNDARY_PIXEL_U(u)	(((u) & GENMASK(7, 0)) << 8)
+#define DW100_BOUNDARY_PIXEL_Y(y)	(((y) & GENMASK(7, 0)) << 16)
+
+#define DW100_INTERRUPT_STATUS		0x70
+#define DW100_INTERRUPT_STATUS_INT_FRAME_DONE		BIT(0)
+#define DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT		BIT(1)
+#define DW100_INTERRUPT_STATUS_INT_ERR_AXI_RESP		BIT(2)
+#define DW100_INTERRUPT_STATUS_INT_ERR_X		BIT(3)
+#define DW100_INTERRUPT_STATUS_INT_ERR_MB_FETCH		BIT(4)
+#define DW100_INTERRUPT_STATUS_INT_ERR_FRAME2		BIT(5)
+#define DW100_INTERRUPT_STATUS_INT_ERR_FRAME3		BIT(6)
+#define DW100_INTERRUPT_STATUS_INT_ERR_FRAME_DONE	BIT(7)
+#define DW100_INTERRUPT_STATUS_INT_ERR_STATUS(x)	(((x) >> 1) & 0x7F)
+#define DW100_INTERRUPT_STATUS_INT_STATUS(x)		((x) & 0xFF)
+
+#define DW100_INTERRUPT_STATUS_INT_ENABLE_MASK		GENMASK(15, 8)
+#define DW100_INTERRUPT_STATUS_INT_ENABLE(x)		(((x) & GENMASK(7, 0)) << 8)
+#define DW100_INTERRUPT_STATUS_FRAME_BUSY		BIT(16)
+#define DW100_INTERRUPT_STATUS_INT_CLEAR(x)		(((x) & GENMASK(7, 0)) << 24)
+#define DW100_BUS_CTRL			0x74
+#define DW100_BUS_CTRL_AXI_MASTER_ENABLE	BIT(31)
+#define DW100_BUS_CTRL1			0x78
+#define DW100_BUS_TIME_OUT_CYCLE	0x7C
+#define DW100_DST_IMG_Y_SIZE1		0x80
+#define DW100_DST_IMG_Y_SIZE(sz)	(((sz) >> 4) & GENMASK(29, 0))
+#define DW100_DST_IMG_UV_SIZE(sz)	(((sz) >> 4) & GENMASK(29, 0))
+#define DW100_DST_IMG_UV_SIZE1		0x84
+#define DW100_DST_IMG_Y_SIZE2		0x88
+#define DW100_DST_IMG_UV_SIZE2		0x8C
+
+#endif /* _DW100_REGS_H_ */
-- 
2.35.1

