Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD95544413
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 08:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239344AbiFIGsl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 02:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239311AbiFIGsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 02:48:37 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2052.outbound.protection.outlook.com [40.107.104.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656384BFEF;
        Wed,  8 Jun 2022 23:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlWLXqcw82cxvwf54BWaEg4mf751A8ugNq7jr/Fqd9pVsYqw0iTGmkvdROPv2OTo7xSax6WnalIXcfU/M5QvCC0iuXnJUUYNVBEzGKeRVImfGTkWqKAvogPzDHFoGKgB1+B18LXmo5hR/r/CZojXrFdpq0ZUXRlrFY+jGCOq+e9TGmd1FBK1k4CYgQKLDIXPzv0gHNaFyU8RuoUodipZHcEXbusCwdd6ml9wErb8DCaGL0MH8Xe1Qj9h3D35voeT9NdPizuHkvc1WvtiVHEMGYBDgTp9zJh33LbCmrAlyh+F5BsR+2g/RCWhMQRl9DZUo56FDqmPHcFuQuWK507fKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sST6rOtMof2ywClcZRbZ7JZQUKw7w+aYBtRRGn3IC/k=;
 b=N5E6wDq/9ULzdVvXaLHShv0hkU6ScAvpI26wfWMxbqCAGWTmLMDVHJ8AVaNy6YPuMSwbzvRa7gMTG7yMxU/nvRXFkwMiTg60Qt9l4ob6XhpiVrUAYUn6sPmm6ObsJeLb4wLezDZU1KI2UUBbw2vnW9stue1b0Whb1j3gg1vC08deV+5jQvJKX9NGPZ1ZvfGFb7IDR+LqvZSp6wz3/3uKJHBCEHr2B4Pw45Zs13sXt4PPfBMqFbbmDiaKu2/LpfLkrP507njGvRrXJxtLXbSIeS8377+s6hOS7RcQbjjSxnvvTg9j9m3wYdjV1yFHBdzZ/sG8sO/pGAChvr0PvScFRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sST6rOtMof2ywClcZRbZ7JZQUKw7w+aYBtRRGn3IC/k=;
 b=lzoH4gh2ERTUzFSJ0oz591sFz0pgd5cHcfM1exvFPR7i4xvwjisNWGUxSg3aG68DOjn3JPBSGebDAWthONLrF4ULNZUqD6wUPxkNZyTxo2K5G2GNQqhqGzqDCmdqvlgM8Upu22j6LSfjFiylYbx+kQy2Z5f570uaUhpFOspEHg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR0402MB3518.eurprd04.prod.outlook.com (2603:10a6:803:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:48:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:48:31 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     andrzej.hajda@intel.com, narmstrong@baylibre.com,
        robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, lee.jones@linaro.org, mchehab@kernel.org,
        marcel.ziswiler@toradex.com
Subject: [PATCH v8 04/14] drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support
Date:   Thu,  9 Jun 2022 14:49:21 +0800
Message-Id: <20220609064931.3068601-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e81bfd99-e8a1-4195-a311-08da49e410f1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3518:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR0402MB35184BA4F3B59AC7BC3FB26C98A79@VI1PR0402MB3518.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nOSGK+QEC8Z+F4j1JZVXuQhMLHFo14GEi7Yah92NEVV1o750ulZ8Jawd52fMn1AGcuDCbngJZ32UmJ1RLvql9UtROn4k2NcnDMb34XhBFQRkWE6SGSTgWM78/RFdgjik+5oKmsLi+r/HrqxilQvpf7WLNjq6qsLKUUBrc/fhCtjxGEYvflM5k5Mc0ZGBNmZORo8HjE2I/Ih8RMrhmZZKalr2oPt5tvIeSp1LQmIIPYuMJc25fhcxUOezsgaevJEt7qJctLvGr7EpfE7pzyJMMczgP0KvNcuBhiEGw1qjPCZcDEdqLK4oMtovWGgG6IekEMeo8fshXeQp310xZnnU/nZyRFjko6StL65LpUM8a+fbRmtXVLqlBuUmFf/eNFS2QcKwW1WwiQkDvygkybu+7EKBAbvp52zNfCOIxGDs0TkS8z9b+N9cWWhB2bKRLo8iJc2E0Ep0OxADt/Uveq0xtAS8FRnPJDLD8hTtf56SiA3zetzbVRiWhXmXDtEJnEr0ZwgpFdZnod9dBO0f8QcH3NUn4tjU2n39ptA5p/LxotXrPhXSjEhGkRrCRjDQsiMJ96ZnnBzhX6KUIxrgk9JfMTclMLxiu0KcsqSHFSDzJcNJVawQp+JKJN2zPLfjrvSsOS958/pGCD/9dRwVyr788XvCqhYdwKNOn+hEIDYjO0i8kStS3LQITaGWIeo/LZG9z3844iO2JHMNIlXwy3eyzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(66476007)(508600001)(86362001)(5660300002)(30864003)(8936002)(66946007)(7416002)(8676002)(52116002)(6506007)(66556008)(2906002)(6666004)(186003)(26005)(38100700002)(38350700002)(2616005)(316002)(36756003)(1076003)(6512007)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3d7I1a5opNLFmQmWCbp216ZuRVtkct5oWHax9h5FxQgz9p+CbxvjsOWawC2i?=
 =?us-ascii?Q?pPDjjP+vQNmUpY7KnFbG0n3LZ1VVb9guvnaiwkDyW6UwmtBs0TjEm24PrPwI?=
 =?us-ascii?Q?fKOZlEDM35qkKRZ2PlHbiSnHuQjv1MaLX3zU4AZal4069BcHgDBCao7MSZWb?=
 =?us-ascii?Q?+3TkqGHztH+sHZ8GGX94WLaMMk/8Xpk/mr0A/jbcykgjhsJScPt2sxedzVZD?=
 =?us-ascii?Q?R/xsxarPWTqfrQshy1XocZGD0aIiDTHPu0hoe82uj87qq1dmfB5X0BwiLaYc?=
 =?us-ascii?Q?63XWUCa3PcL5r/TBoR8uOXUmAgFcpAGmnZ+RCZAphLmUWl/sih3kntHew6DD?=
 =?us-ascii?Q?enBzvu3za/kaSNY1bToZ0QTlDDTeeygKbMu1r/unqSOcZnCSRjP54QmDOOx8?=
 =?us-ascii?Q?QHgyC8s8J29lZbb6fHG3YbUQNpweMan7Vs+LxYUqq5bimqHQr1rv+n/OXiC6?=
 =?us-ascii?Q?kZ9nzmw1VepTT+fV1puHSR0zCtdecZcPFFr50ZOiMfWYEJo1xLrOaPDul1dt?=
 =?us-ascii?Q?13TZVajhutIHi2izWkdpSU6PP3Z42XTmkKno8w7J9gkXg1XX760O+FyeZ5bJ?=
 =?us-ascii?Q?vblcRTK30HEF+lAK4k0bmYeqHkyR1dW966QgkVJrRKgCIY7KzvyvGbRHbNz+?=
 =?us-ascii?Q?B9EOz5bpBLZJkW4V+NCusVOOjBPCBv/HKy+64ircznXERWHz3iaRDVWwBEPV?=
 =?us-ascii?Q?kgmJDUugUXd1WiFtU00O5uOxZaGE9TMxLZTvKXIh1xJWiCK1YgY7Eqpfqrw9?=
 =?us-ascii?Q?pQtuyYEkRdSsoWI58cXYXTcnM6UwHY4vBh//V7mPPITCCF+2ZoXMAfTym85a?=
 =?us-ascii?Q?/pVPIbSboBsM5pG9qEWgF6+Qnao8Y8iJRURsAZTIC1zCRrB7EFLCLDKXKm33?=
 =?us-ascii?Q?LBzZsGbcm5dR3BxPK3grrdWZ7PpfPLvnubfX/s5fHrPqowE3ZhCx4usw9h2e?=
 =?us-ascii?Q?RmZdd2LVJ4PA6cEgnYBlxMsZBCP0HBCqJpV5MAPXVMQ32RnAE406fwlglyV+?=
 =?us-ascii?Q?ik0WKBIs4nWv5Gvwt3pre3a0dx8fVffVbK8x+ZoOTtkwfUxnk1B3gwhPm6+D?=
 =?us-ascii?Q?LRytfoqHGp0OYU6Y4Qlv0z5JR217Al/ouxZSWDuhjUJSrsdSp6hUwGpHynvt?=
 =?us-ascii?Q?cRPMRBNVGvX8HohQR99yuHd7y1ujTbeGnRMOB+0Edu9x5AqA4GEAPDYehTEx?=
 =?us-ascii?Q?9j+aubFU1XMA/g17w8Jt8NUAQWOEKHzbuoAqYiX1FLus9sYYrIBc5XWBD46m?=
 =?us-ascii?Q?TT97AXLJkxmb8K+EPhyo88J+9qI1mwgfcf7xSK3h5/RWzrD470ClKrIVok3s?=
 =?us-ascii?Q?ZLowKvrDwEekuH3xDYGze977hg1yvYhXkR1MyTV99Qct0A1MbpRtoOeyYLo/?=
 =?us-ascii?Q?FdV2VvswBNTpgoLgT7QYvAydGr71Fj33VagotABUWrz7YQq2b+tdBEJmUIkF?=
 =?us-ascii?Q?PAM9LEf5vpWMzdGx4sCUDrkJO/r9k/JHkulTRUYapRH3C+B2NvlXRhqgeY6H?=
 =?us-ascii?Q?d7KTQ93ckagLa55lYHdYJzH8uuOqHBiaDSwySuGdB/oOQ5QVkqc/FZVSKOZS?=
 =?us-ascii?Q?ecQiHwGc2s+Rf5syeEPXnoRktEFDFXA2liwO2CPZPbw4Q2RB7Y0rbRLKlKko?=
 =?us-ascii?Q?nGdYGfiYI3+BVPKOfDzVI/rEzdWZktLCd+vIWe8Hg+WQghKtnH1JOkn7dtBk?=
 =?us-ascii?Q?UbKU8W+ODdbDuvXBv+0nfQ5Hcw+z/IovClaZBoutgvYR7Y5pvZT8NgiNP5TS?=
 =?us-ascii?Q?WbG1yftx5w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81bfd99-e8a1-4195-a311-08da49e410f1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:48:31.7156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoLBwK8qN/9UVV15sycoDcjYl1otWMQY/NJ2RGjKDc7HzS7K7Xvn9y+aacU+Dr6fV3yWQIxCbxtYGkA85qPP2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3518
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds a drm bridge driver for i.MX8qm/qxp pixel combiner.
The pixel combiner takes two output streams from a single display
controller and manipulates the two streams to support a number
of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured
as either one screen, two screens, or virtual screens.  The pixel
combiner is also responsible for generating some of the control signals
for the pixel link output channel.  For now, the driver only supports
the bypass mode.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri iMX8X, LT170410-2WHC, LP156WF1
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Robert, I keep your R-b tag from v5. Let me know if you want me to drop it, as
v7 contains a fix for checkpatch complaints.
Marcel, as the fix is trivial, I add your T-b tag. Let me know if you want me
to drop it.

v7->v8:
* No change.

v6->v7:
* Fix 'Alignment should match open parenthesis' complaints from
  'checkpatch.pl --strict'.
* Add Marcel's T-b tag.

v5->v6:
* No change.

v4->v5:
* Drop the 'PC_BUF_PARA_REG' register definition. (Robert)
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 drivers/gpu/drm/bridge/Kconfig                |   2 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 .../drm/bridge/imx/imx8qxp-pixel-combiner.c   | 448 ++++++++++++++++++
 5 files changed, 460 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 307b135da2f6..236a1342a390 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -366,6 +366,8 @@ source "drivers/gpu/drm/bridge/adv7511/Kconfig"
 
 source "drivers/gpu/drm/bridge/cadence/Kconfig"
 
+source "drivers/gpu/drm/bridge/imx/Kconfig"
+
 source "drivers/gpu/drm/bridge/synopsys/Kconfig"
 
 endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index f6c0a95de549..d15c86e14243 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -35,4 +35,5 @@ obj-$(CONFIG_DRM_ITE_IT66121) += ite-it66121.o
 
 obj-y += analogix/
 obj-y += cadence/
+obj-y += imx/
 obj-y += synopsys/
diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
new file mode 100644
index 000000000000..f1c91b6814a5
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -0,0 +1,8 @@
+config DRM_IMX8QXP_PIXEL_COMBINER
+	tristate "Freescale i.MX8QM/QXP pixel combiner"
+	depends on OF
+	depends on COMMON_CLK
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable pixel combiner found in
+	  Freescale i.MX8qm/qxp processors.
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
new file mode 100644
index 000000000000..7d7c8d674bf0
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
new file mode 100644
index 000000000000..86ae98a211b4
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+
+#define PC_CTRL_REG			0x0
+#define  PC_COMBINE_ENABLE		BIT(0)
+#define  PC_DISP_BYPASS(n)		BIT(1 + 21 * (n))
+#define  PC_DISP_HSYNC_POLARITY(n)	BIT(2 + 11 * (n))
+#define  PC_DISP_HSYNC_POLARITY_POS(n)	DISP_HSYNC_POLARITY(n)
+#define  PC_DISP_VSYNC_POLARITY(n)	BIT(3 + 11 * (n))
+#define  PC_DISP_VSYNC_POLARITY_POS(n)	DISP_VSYNC_POLARITY(n)
+#define  PC_DISP_DVALID_POLARITY(n)	BIT(4 + 11 * (n))
+#define  PC_DISP_DVALID_POLARITY_POS(n)	DISP_DVALID_POLARITY(n)
+#define  PC_VSYNC_MASK_ENABLE		BIT(5)
+#define  PC_SKIP_MODE			BIT(6)
+#define  PC_SKIP_NUMBER_MASK		GENMASK(12, 7)
+#define  PC_SKIP_NUMBER(n)		FIELD_PREP(PC_SKIP_NUMBER_MASK, (n))
+#define  PC_DISP0_PIX_DATA_FORMAT_MASK	GENMASK(18, 16)
+#define  PC_DISP0_PIX_DATA_FORMAT(fmt)	\
+				FIELD_PREP(PC_DISP0_PIX_DATA_FORMAT_MASK, (fmt))
+#define  PC_DISP1_PIX_DATA_FORMAT_MASK	GENMASK(21, 19)
+#define  PC_DISP1_PIX_DATA_FORMAT(fmt)	\
+				FIELD_PREP(PC_DISP1_PIX_DATA_FORMAT_MASK, (fmt))
+
+#define PC_SW_RESET_REG			0x20
+#define  PC_SW_RESET_N			BIT(0)
+#define  PC_DISP_SW_RESET_N(n)		BIT(1 + (n))
+#define  PC_FULL_RESET_N		(PC_SW_RESET_N |		\
+					 PC_DISP_SW_RESET_N(0) |	\
+					 PC_DISP_SW_RESET_N(1))
+
+#define PC_REG_SET			0x4
+#define PC_REG_CLR			0x8
+
+#define DRIVER_NAME			"imx8qxp-pixel-combiner"
+
+enum imx8qxp_pc_pix_data_format {
+	RGB,
+	YUV444,
+	YUV422,
+	SPLIT_RGB,
+};
+
+struct imx8qxp_pc_channel {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct imx8qxp_pc *pc;
+	unsigned int stream_id;
+	bool is_available;
+};
+
+struct imx8qxp_pc {
+	struct device *dev;
+	struct imx8qxp_pc_channel ch[2];
+	struct clk *clk_apb;
+	void __iomem *base;
+};
+
+static inline u32 imx8qxp_pc_read(struct imx8qxp_pc *pc, unsigned int offset)
+{
+	return readl(pc->base + offset);
+}
+
+static inline void
+imx8qxp_pc_write(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
+{
+	writel(value, pc->base + offset);
+}
+
+static inline void
+imx8qxp_pc_write_set(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
+{
+	imx8qxp_pc_write(pc, offset + PC_REG_SET, value);
+}
+
+static inline void
+imx8qxp_pc_write_clr(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
+{
+	imx8qxp_pc_write(pc, offset + PC_REG_CLR, value);
+}
+
+static enum drm_mode_status
+imx8qxp_pc_bridge_mode_valid(struct drm_bridge *bridge,
+			     const struct drm_display_info *info,
+			     const struct drm_display_mode *mode)
+{
+	if (mode->hdisplay > 2560)
+		return MODE_BAD_HVALUE;
+
+	return MODE_OK;
+}
+
+static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct imx8qxp_pc_channel *ch = bridge->driver_private;
+	struct imx8qxp_pc *pc = ch->pc;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(pc->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(pc->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				 ch->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static void
+imx8qxp_pc_bridge_mode_set(struct drm_bridge *bridge,
+			   const struct drm_display_mode *mode,
+			   const struct drm_display_mode *adjusted_mode)
+{
+	struct imx8qxp_pc_channel *ch = bridge->driver_private;
+	struct imx8qxp_pc *pc = ch->pc;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_get_sync(pc->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(pc->dev,
+			      "failed to get runtime PM sync: %d\n", ret);
+
+	ret = clk_prepare_enable(pc->clk_apb);
+	if (ret)
+		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
+			      __func__,  ret);
+
+	/* HSYNC to pixel link is active low. */
+	imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
+			     PC_DISP_HSYNC_POLARITY(ch->stream_id));
+
+	/* VSYNC to pixel link is active low. */
+	imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
+			     PC_DISP_VSYNC_POLARITY(ch->stream_id));
+
+	/* Data enable to pixel link is active high. */
+	imx8qxp_pc_write_set(pc, PC_CTRL_REG,
+			     PC_DISP_DVALID_POLARITY(ch->stream_id));
+
+	/* Mask the first frame output which may be incomplete. */
+	imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_VSYNC_MASK_ENABLE);
+
+	/* Only support RGB currently. */
+	val = imx8qxp_pc_read(pc, PC_CTRL_REG);
+	if (ch->stream_id == 0) {
+		val &= ~PC_DISP0_PIX_DATA_FORMAT_MASK;
+		val |= PC_DISP0_PIX_DATA_FORMAT(RGB);
+	} else {
+		val &= ~PC_DISP1_PIX_DATA_FORMAT_MASK;
+		val |= PC_DISP1_PIX_DATA_FORMAT(RGB);
+	}
+	imx8qxp_pc_write(pc, PC_CTRL_REG, val);
+
+	/* Only support bypass mode currently. */
+	imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_DISP_BYPASS(ch->stream_id));
+
+	clk_disable_unprepare(pc->clk_apb);
+}
+
+static void
+imx8qxp_pc_bridge_atomic_disable(struct drm_bridge *bridge,
+				 struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pc_channel *ch = bridge->driver_private;
+	struct imx8qxp_pc *pc = ch->pc;
+	int ret;
+
+	ret = pm_runtime_put(pc->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(pc->dev, "failed to put runtime PM: %d\n", ret);
+}
+
+static const u32 imx8qxp_pc_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
+	MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
+};
+
+static bool imx8qxp_pc_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qxp_pc_bus_output_fmts); i++) {
+		if (imx8qxp_pc_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qxp_pc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    u32 output_fmt,
+					    unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (!imx8qxp_pc_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X36_CPADLO:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X30_CPADLO;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X36_CPADLO:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X30_CPADLO;
+		break;
+	default:
+		kfree(input_fmts);
+		input_fmts = NULL;
+		break;
+	}
+
+	return input_fmts;
+}
+
+static u32 *
+imx8qxp_pc_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state,
+					     unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qxp_pc_bus_output_fmts);
+	return kmemdup(imx8qxp_pc_bus_output_fmts,
+			sizeof(imx8qxp_pc_bus_output_fmts), GFP_KERNEL);
+}
+
+static const struct drm_bridge_funcs imx8qxp_pc_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.mode_valid		= imx8qxp_pc_bridge_mode_valid,
+	.attach			= imx8qxp_pc_bridge_attach,
+	.mode_set		= imx8qxp_pc_bridge_mode_set,
+	.atomic_disable		= imx8qxp_pc_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+				imx8qxp_pc_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+				imx8qxp_pc_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
+{
+	struct imx8qxp_pc *pc;
+	struct imx8qxp_pc_channel *ch;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *child, *remote;
+	u32 i;
+	int ret;
+
+	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
+	if (!pc)
+		return -ENOMEM;
+
+	pc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pc->base))
+		return PTR_ERR(pc->base);
+
+	pc->dev = dev;
+
+	pc->clk_apb = devm_clk_get(dev, "apb");
+	if (IS_ERR(pc->clk_apb)) {
+		ret = PTR_ERR(pc->clk_apb);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get apb clock: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, pc);
+	pm_runtime_enable(dev);
+
+	for_each_available_child_of_node(np, child) {
+		ret = of_property_read_u32(child, "reg", &i);
+		if (ret || i > 1) {
+			ret = -EINVAL;
+			DRM_DEV_ERROR(dev,
+				      "invalid channel(%u) node address\n", i);
+			goto free_child;
+		}
+
+		ch = &pc->ch[i];
+		ch->pc = pc;
+		ch->stream_id = i;
+
+		remote = of_graph_get_remote_node(child, 1, 0);
+		if (!remote) {
+			ret = -ENODEV;
+			DRM_DEV_ERROR(dev,
+				      "channel%u failed to get port1's remote node: %d\n",
+				      i, ret);
+			goto free_child;
+		}
+
+		ch->next_bridge = of_drm_find_bridge(remote);
+		if (!ch->next_bridge) {
+			of_node_put(remote);
+			ret = -EPROBE_DEFER;
+			DRM_DEV_DEBUG_DRIVER(dev,
+					     "channel%u failed to find next bridge: %d\n",
+					     i, ret);
+			goto free_child;
+		}
+
+		of_node_put(remote);
+
+		ch->bridge.driver_private = ch;
+		ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
+		ch->bridge.of_node = child;
+		ch->is_available = true;
+
+		drm_bridge_add(&ch->bridge);
+	}
+
+	return 0;
+
+free_child:
+	of_node_put(child);
+
+	if (i == 1 && pc->ch[0].next_bridge)
+		drm_bridge_remove(&pc->ch[0].bridge);
+
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
+{
+	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
+	struct imx8qxp_pc_channel *ch;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		ch = &pc->ch[i];
+
+		if (!ch->is_available)
+			continue;
+
+		drm_bridge_remove(&ch->bridge);
+		ch->is_available = false;
+	}
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(pc->clk_apb);
+	if (ret)
+		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
+			      __func__,  ret);
+
+	/* Disable pixel combiner by full reset. */
+	imx8qxp_pc_write_clr(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);
+
+	clk_disable_unprepare(pc->clk_apb);
+
+	/* Ensure the reset takes effect. */
+	usleep_range(10, 20);
+
+	return ret;
+}
+
+static int __maybe_unused imx8qxp_pc_runtime_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(pc->clk_apb);
+	if (ret) {
+		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
+			      __func__, ret);
+		return ret;
+	}
+
+	/* out of reset */
+	imx8qxp_pc_write_set(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);
+
+	clk_disable_unprepare(pc->clk_apb);
+
+	return ret;
+}
+
+static const struct dev_pm_ops imx8qxp_pc_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx8qxp_pc_runtime_suspend,
+			   imx8qxp_pc_runtime_resume, NULL)
+};
+
+static const struct of_device_id imx8qxp_pc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-pixel-combiner", },
+	{ .compatible = "fsl,imx8qxp-pixel-combiner", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qxp_pc_dt_ids);
+
+static struct platform_driver imx8qxp_pc_bridge_driver = {
+	.probe	= imx8qxp_pc_bridge_probe,
+	.remove = imx8qxp_pc_bridge_remove,
+	.driver	= {
+		.pm = &imx8qxp_pc_pm_ops,
+		.name = DRIVER_NAME,
+		.of_match_table = imx8qxp_pc_dt_ids,
+	},
+};
+module_platform_driver(imx8qxp_pc_bridge_driver);
+
+MODULE_DESCRIPTION("i.MX8QM/QXP pixel combiner bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.25.1

