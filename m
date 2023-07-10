Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B3D74CC83
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 07:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjGJF7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 01:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjGJF7g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 01:59:36 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C57100;
        Sun,  9 Jul 2023 22:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrKSt8zb2H7YUhqiaAePsDwkWFdTHoHX1oEUc1gHvPftQP3Vt1gtxVI5Gihqw/ze+D6UXPeHp4VTRlapY2mZ79nBPtlZmgkZxW/tTGmXcdP9Sz3YHbAvQ2719Lpjb5C09Jg8UVqH0cxO6btHz3GsT2WpwvCrddQ1unvnYl7bwBAu8lQo61nNrMkocl6jGBsgqdt2nvno21YeHLmZpI53VD0lpf1IuTpcg2kGNp1cnegjl2VwPpwt/4rXm9hFXWHKD4rngbremScrmdNi+k8XeezjHfhD7cW2QfGMz+GI6Tf2/k6Efey/e8szCW7puCl/PHzsLOHdxH4jcaflKSsI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dOyGbxYpal3wmcsTqTmlEcMm88cjDuN+Ke+vuhYReM=;
 b=lhv09kOkvfG4e00kx98gi+U57hgxLA3u6RSG9M6hpWYvUCdUGsw4WHxURJzACoUBLxHoMisYaH0n44zqVtb+/s60K2hOQMCZC108nejInU/h/6qngRgNpgzI87YrBLju+aRvJMUO96CWCG5fo4TIfID2jydvG8b42FR1x8gkJunVYOAfuZR69s5oNXvkmvXqjwGoApawoCRyXAxX/Oc4ByKkvMp5XNNhJWG6BgZkpCdr/QWsnph4r1bljJ7ixNrodCnxfeWXaduaqgYGWIl94V09DAZ3yDa3xJF4kEthVvS7OOC1QpYiCskOn51Dui5Vs4B7xj4zzew0wuSXb2uslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dOyGbxYpal3wmcsTqTmlEcMm88cjDuN+Ke+vuhYReM=;
 b=V6PSP+gSxD2hDa+B7Hwev0Zy7iiNuB2qOy42cWdTplrZHJjUJ2GQmqyylp6V/RUchcURS9iUmVE3dFUkMMJ0j5M9XFXTdI/t9XyNKWoU+t1WH0Jqd7RTSSVN0KFw+O9ezTIOlCb0IX9dm9T691RL7vbVvZ0k3BLrew8ZqLPF9tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 05:59:27 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::6811:d7ba:d425:1d70]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::6811:d7ba:d425:1d70%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 05:59:27 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        alexander.stein@ew.tq-group.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, conor+dt@kernel.org,
        jacopo.mondi@ideasonboard.com
Subject: [PATCH v2 2/2] media: nxp: add driver for i.MX93 MIPI CSI-2 controller and D-PHY
Date:   Mon, 10 Jul 2023 14:03:52 +0800
Message-Id: <20230710060352.584286-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230710060352.584286-1-guoniu.zhou@oss.nxp.com>
References: <20230710060352.584286-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc3cb19-ef1a-4e87-34f5-08db810ad1bc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IkI77rG2fEARGoovZTEe7+Yt0RNS0GHzrI+HgrPepq+dgb245o7C41PJ6AGbGPBk85qmWYHzaUG75JxAZDzXThQRmKjBx+HCu4fvxuTsVkF4so3gR84YVMjZRaNxSkwygM736Q4iyDk3sH/rcoBrEXSHIck3MDYbh6N8ex3YlwXIbAzs5J1dIIJ+mAO8ddIoI5zo8SgY3/76sceuGfxQwaDcswkVGCHi+J/kiL473CgJj6BucapypE4RYF1iHh0Eqvk/k+QhjsyKHcOgq9qe3rSg+82lEQq4IqMFvNrBq1wrTdba0sL0bqm7tnuZjweBHkwDZUg9zgONSHgIe2VBV7Rn9CFL1/Fe0g09RenrbKaORN6+IrHOoJWvcT9624WermnMOMCwLF+MtUUMCLuJOfuJ4phreWCV4TMz7vFkdiYhySih1fPPAkqPN2S3+7i5Dp5indNb41ckle4VYWPgO0VyHpJg6BdKHGKazcxE0QS3ucHC3HkHfoOMUDwertYB5qtHzPgtrKzfeJIo+yJGHYpPMDON4yFEVoD7r2vxKGaOC9AhwzhH3mRJSDwYXyDSAlwB4jnNvS28m7NAoNVSgUN/K9Z+IwasKlaUySOfQdp+ddT+lIaRVvA6GjHYJcp4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(26005)(186003)(9686003)(6506007)(1076003)(2616005)(6512007)(83380400001)(41300700001)(30864003)(4326008)(2906002)(66556008)(316002)(66476007)(5660300002)(8676002)(8936002)(478600001)(66946007)(6486002)(52116002)(6666004)(86362001)(38350700002)(38100700002)(66899021)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VqlbRuBiawEtzFgTGJsMhshAWenjyZzlgDSzYpPUTxDF4z0aolxpwf5jvrEJ?=
 =?us-ascii?Q?aIWBJnJ1pdUdGhnDQ9CR55pmR3Hx/eaUzuBS8o/XcfwjwfR0gxItdszs2e9f?=
 =?us-ascii?Q?KYHiBXgJfhYFx0BaQ9GrpCZcJjI0E4KBKDYCjuIfK/CfIazB/EgIcb6Ih6TW?=
 =?us-ascii?Q?1QQtOXb5veU5jrC8X9GnvzmPFMnywRs/8YHvEMexwh2AuL59+PZhRVOo2VYh?=
 =?us-ascii?Q?/IPZfeg3xb73GqDKy7HZtLbX3oEq48MQvrYOx459JnUwdmkdgDTsGgrTwpGc?=
 =?us-ascii?Q?ph35aLAIDEdo22pZY+70JEnTeJTQpoXPQ+HImhcgBjjYyYyiZ18MrUwMaAY4?=
 =?us-ascii?Q?dc572co+JUrqar8bh9Vxbk0UkNVndyFinMG288m7dAjLDUSKduDqhguTAUlX?=
 =?us-ascii?Q?GhCQNi/PybcbsSAPSsO2Xv4xkGiQVw3DQ8nywD4yKY14SEyodVmUQdEoQjOn?=
 =?us-ascii?Q?RXwyJHmlP+Gjbkdjp5Fv7iGec7+Ltm7478Tvfar/DL+wPgFYB4GEQrr70T2O?=
 =?us-ascii?Q?nNlAxSb3dxp2lWhT7ShI2DybLMEyP1Fzp1L0qPJrZh8pbAZNGZMyc3uDHvg+?=
 =?us-ascii?Q?ozV+Ojux0/VmYazynYz4RgZNZLEUfYXY+CMqf6JKcc2RWBi8j3iMlVgC1wI7?=
 =?us-ascii?Q?sl39iZxae8m61N2hnrK50GkSY75Y+4mqHuz3MDa+EiullJXd2LfXVMxBOS+h?=
 =?us-ascii?Q?faXH4oOE47Wnq+9NdplRrcNQoKQOY8bwhx8rV0kAGXHVuXyq6kDfJjnm6WrE?=
 =?us-ascii?Q?IsqX1tLJ1x976+5DADApvVcqp0/jlZQbuW48o9e9owMh/WZQNs75BSyW8NnS?=
 =?us-ascii?Q?4L+IYIh/bnCFYSeO2ncsSkbChMEHkGlzHaAIk+/G3C+MQgux60tognO7hA7Q?=
 =?us-ascii?Q?hmEpMwEaOwDbKEIMoElVb+UPCypEuUXaKs989QkhHKMJIK4FoPWmG/FRHoFu?=
 =?us-ascii?Q?aj4hhZQp2/ovjBV+mieZQUmz9Bu/GOenSM16M6n/hn7xA9vVrSN4A2aCMZ+u?=
 =?us-ascii?Q?yJuEYysCslF7eQVBZ5F1hwQE7o89eAPUkKS1KngewxXBDX2mEFgrLXBr1wrX?=
 =?us-ascii?Q?lTKOa5k0TK4us+31YVyHsr5fVEMEmU4h1B0rnD7w0/DnqZD5Uw51Q04hY4Fb?=
 =?us-ascii?Q?87Yk/4iY8Csp0HC2sUZassG0O2lvyqJtdAn7okZ4LQky9cW4LI/Msx0VCin+?=
 =?us-ascii?Q?FdMTRaSQ2LHd5e8R7SUj6F8t3q4UBMgadZOn8n+B+7ttip15VJLuJrM+EEQW?=
 =?us-ascii?Q?QosbTUfCTQMZUm+rB+2Z4KHsCwFoqpueSAhGrZv9HazNSNdUEqqMMoUSpOgn?=
 =?us-ascii?Q?yVnRZZNEHgoIMDe5Be1ST3mPdm8OglEuF5QLPDBEUAN0t6aKlKqdXL6CEdo6?=
 =?us-ascii?Q?f6qE4gUDb3gqEApq4MWhokX5HHLC7yQvfgTy3o6dUx6cSgmO1zlZ/HTuUCBC?=
 =?us-ascii?Q?PUKbJA3OA7fC/119hzbKlohVKK0gMBmIvGCSfMlsRP4k5I3KlqofQPJrx5pQ?=
 =?us-ascii?Q?vpVIS+/LWiTDodTrp8VWNo2YsVA/b7o4WZN1TX8fw2CIsv45CBm61rzQxQoT?=
 =?us-ascii?Q?hW9w57TcX8YYWrEa4kv6sdK21oKgDx9iv9GQg8Cp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc3cb19-ef1a-4e87-34f5-08db810ad1bc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 05:59:27.5642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+CqTL0MQJmpr5K568oOz02zZh6otcmTy+DjXdI5JAAYC5ypvkvxQpGwXXK3FDmJ2GqKSzcCcE4+zkJ2BY7SdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9192
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

The MIPI CSI-2 controller and MIPI Rx D-PHY found on i.MX93 originate
from Synopsys. MIPI CSI-2 controller implements the CSI-2 protocol on
host side. MIPI 2-lane Rx D-PHY module implement the physical layer
for the MIPI D-PHY interface. Lane operation ranging from 80 Mbps to
1.5Gbps in forward direction.

Add V4L2 subdev driver support both for CSI-2 controller and D-PHY
since the PHY is wrapped by the CSI-2 controller and only expose a
control interface to the CSI-2 controller.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 MAINTAINERS                                |   10 +
 drivers/media/platform/nxp/Kconfig         |   11 +
 drivers/media/platform/nxp/Makefile        |    3 +
 drivers/media/platform/nxp/dwc-mipi-csi2.c | 1354 ++++++++++++++++++++
 drivers/media/platform/nxp/dwc-mipi-csi2.h |  299 +++++
 drivers/media/platform/nxp/dwc-mipi-dphy.c |  295 +++++
 6 files changed, 1972 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c83475103a25..349d981f9c24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15189,6 +15189,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
 F:	sound/soc/codecs/tfa989x.c
 
+NXP i.MX93 MIPI CSI-2 V4L2 DRIVER
+M:	G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
+R:	NXP Linux Team <linux-imx@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
+F:	drivers/media/platform/nxp/dwc-mipi-csi2.c
+F:	drivers/media/platform/nxp/dwc-mipi-csi2.h
+F:	drivers/media/platform/nxp/dwc-mipi-dphy.c
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index a0ca6b297fb8..4b8b713022d4 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -30,6 +30,17 @@ config VIDEO_IMX_MIPI_CSIS
 
 source "drivers/media/platform/nxp/imx8-isi/Kconfig"
 
+config VIDEO_DWC_MIPI_CSIS
+	tristate "DesignWare Cores MIPI CSI-2 receiver found on i.MX93"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  Video4Linux2 sub-device driver for the DesignWare Cores MIPI
+	  CSI-2 receiver used on i.MX93.
+
 # mem2mem drivers
 
 config VIDEO_IMX_PXP
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index b8e672b75fed..07f43795dc16 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -4,6 +4,9 @@ obj-y += dw100/
 obj-y += imx-jpeg/
 obj-y += imx8-isi/
 
+dwc-mipi-csis-y := dwc-mipi-csi2.o dwc-mipi-dphy.o
+
+obj-$(CONFIG_VIDEO_DWC_MIPI_CSIS) += dwc-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
diff --git a/drivers/media/platform/nxp/dwc-mipi-csi2.c b/drivers/media/platform/nxp/dwc-mipi-csi2.c
new file mode 100644
index 000000000000..4a7154b471c5
--- /dev/null
+++ b/drivers/media/platform/nxp/dwc-mipi-csi2.c
@@ -0,0 +1,1354 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2023 NXP
+ *
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/errno.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-event.h>
+#include <media/mipi-csi2.h>
+
+#include "dwc-mipi-csi2.h"
+
+#define DWC_MIPI_CSIS_DRIVER_NAME	"dwc-mipi-csi2"
+
+#define DWC_CSI2RX_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
+#define DWC_CSI2RX_DEF_PIX_WIDTH	1920U
+#define DWC_CSI2RX_DEF_PIX_HEIGHT	1080U
+#define DWC_CSI2RX_MAX_PIX_WIDTH	0xffff
+#define DWC_CSI2RX_MAX_PIX_HEIGHT	0xffff
+
+enum imx93_csi_clks {
+	PER,
+	PIXEL,
+	PHY_CFG,
+};
+
+enum model {
+	DWC_CSI2RX_IMX93,
+};
+
+enum dwc_csi2rx_intf {
+	DWC_CSI2RX_INTF_IDI,
+	DWC_CSI2RX_INTF_IPI,
+};
+
+struct dwc_csi_plat_data {
+	enum model model;
+	enum dwc_csi2rx_intf intf;
+
+	const struct clk_bulk_data *clks;
+	u32 num_clks;
+
+	const struct dwc_csi_event *events;
+	u32 num_events;
+	u32 events_mask;
+};
+
+/* -----------------------------------------------------------------------------
+ * Events
+ */
+
+struct dwc_csi_event {
+	u32 mask;
+	const char * const name;
+	unsigned int counter;
+};
+
+static struct dwc_csi_event mxc_imx93_events[] = {
+	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_IPI, "IPI Interface Fatal Error" },
+	{ CSI2RX_INT_ST_MAIN_ERR_PHY, "PHY Error" },
+	{ CSI2RX_INT_ST_MAIN_ERR_ECC, "Header Single Bit Error" },
+	{ CSI2RX_INT_ST_MAIN_ERR_DID, "Data ID Error" },
+	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_PLD_CRC, "Payload CRC Fatal Error" },
+	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_CRC_FRAME, "Frame CRC Fatal Error" },
+	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_SEQ_FRAME, "Frame Sequence Fatal Error" },
+	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL, "Frame Boundaries Fatal Error" },
+	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_PKT, "Packet Construction Fatal Error" },
+	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_PHY, "PHY Fatal Error" },
+};
+
+/* -----------------------------------------------------------------------------
+ * Format helpers
+ */
+
+/* List of supported pixel formats for the subdev */
+static const struct dwc_csi_pix_format dwc_csi_formats[] = {
+	/* YUV formats */
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.output = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+		.width = 16,
+	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.output = MEDIA_BUS_FMT_RGB565_1X16,
+		.data_type = MIPI_CSI2_DT_RGB565,
+		.width = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.output = MEDIA_BUS_FMT_RGB888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+		.width = 24,
+	},
+	/* RAW (Bayer and greyscale) formats. */
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.output = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+		.width = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.output = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+		.width = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.output = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+		.width = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.output = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+		.width = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.output = MEDIA_BUS_FMT_Y8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+		.width = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.output = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+		.width = 10,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.output = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+		.width = 10,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.output = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+		.width = 10,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.output = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+		.width = 10,
+	}, {
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.output = MEDIA_BUS_FMT_Y10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+		.width = 10,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.output = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+		.width = 12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.output = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+		.width = 12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.output = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+		.width = 12,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.output = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+		.width = 12,
+	}, {
+		.code = MEDIA_BUS_FMT_Y12_1X12,
+		.output = MEDIA_BUS_FMT_Y12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+		.width = 12,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.output = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+		.width = 14,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.output = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+		.width = 14,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.output = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+		.width = 14,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+		.width = 14,
+	}
+};
+
+static const struct v4l2_mbus_framefmt dwc_csi_default_fmt = {
+	.code = DWC_CSI2RX_DEF_MBUS_CODE,
+	.width = DWC_CSI2RX_DEF_PIX_WIDTH,
+	.height = DWC_CSI2RX_DEF_PIX_HEIGHT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SMPTE170M,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+};
+
+static const struct dwc_csi_pix_format *find_csi_format(u32 code)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dwc_csi_formats); i++)
+		if (code == dwc_csi_formats[i].code)
+			return &dwc_csi_formats[i];
+	return NULL;
+}
+
+/* -----------------------------------------------------------------------------
+ * DWC MIPI CSI-2 Host Controller Hardware operation
+ */
+
+static int dwc_csi_device_pg_enable(struct dwc_csi_device *csidev)
+{
+	const struct dwc_csi_pix_format *csi_fmt = csidev->csi_fmt;
+	struct v4l2_mbus_framefmt *format;
+	u32 val;
+
+	if (!csidev->pg_enable)
+		return 0;
+
+	if (!csi_fmt) {
+		dev_err(csidev->dev, "CSI pixel format is NULL\n");
+		return -EINVAL;
+	}
+
+	format = &csidev->format_mbus[DWC_CSI2RX_PAD_SINK];
+
+	if (csi_fmt->data_type != MIPI_CSI2_DT_RGB888) {
+		dev_err(csidev->dev, "Pattern generator only support RGB888\n");
+		return -EINVAL;
+	}
+
+	val = CSI2RX_PPI_PG_PATTERN_HRES_HRES(format->width);
+	dwc_csi_write(csidev, CSI2RX_PPI_PG_PATTERN_HRES, val);
+
+	val = CSI2RX_PPI_PG_PATTERN_VRES_VRES(format->height);
+	dwc_csi_write(csidev, CSI2RX_PPI_PG_PATTERN_VRES, val);
+
+	val = CSI2RX_PPI_PG_CONFIG_DATA_TYPE(csi_fmt->data_type);
+	val |= CSI2RX_PPI_PG_CONFIG_VIR_CHAN(0);
+	val |= CSI2RX_PPI_PG_CONFIG_PG_MODE(csidev->pg_pattern);
+	dwc_csi_write(csidev, CSI2RX_PPI_PG_CONFIG, val);
+
+	/*
+	 * Select line start packets to construct vertical
+	 * timing information for IPI interface
+	 **/
+	val = CSI2RX_IPI_ADV_FEATURES_SYNC_EVENT_MODE;
+	val |= CSI2RX_IPI_ADV_FEATURES_SYNC_LS_PKT;
+	val |= CSI2RX_IPI_ADV_FEATURES_LINE_EVENT_SEL;
+	dwc_csi_write(csidev, CSI2RX_IPI_ADV_FEATURES, val);
+
+	val = CSI2RX_PPI_PG_ENABLE_EN;
+	dwc_csi_write(csidev, CSI2RX_PPI_PG_ENABLE, val);
+
+	return 0;
+}
+
+static void dwc_csi_device_pg_disable(struct dwc_csi_device *csidev)
+{
+	dwc_csi_write(csidev, CSI2RX_PPI_PG_ENABLE, 0);
+}
+
+static void dwc_csi_ipi_enable(struct dwc_csi_device *csidev)
+{
+	const struct dwc_csi_plat_data *pdata = csidev->pdata;
+	u32 val;
+
+	if (pdata->intf != DWC_CSI2RX_INTF_IPI)
+		return;
+
+	/* Memory is automatically flushed at each Frame Start */
+	val = CSI2RX_IPI_MEM_FLUSH_AUTO;
+	dwc_csi_write(csidev, CSI2RX_IPI_MEM_FLUSH, val);
+
+	/* Enable IPI */
+	val = dwc_csi_read(csidev, CSI2RX_IPI_MODE);
+	val |= CSI2RX_IPI_MODE_ENABLE;
+	dwc_csi_write(csidev, CSI2RX_IPI_MODE, val);
+}
+
+static void dwc_csi_ipi_disable(struct dwc_csi_device *csidev)
+{
+	const struct dwc_csi_plat_data *pdata = csidev->pdata;
+
+	if (pdata->intf != DWC_CSI2RX_INTF_IPI)
+		return;
+
+	dwc_csi_write(csidev, CSI2RX_IPI_MODE, 0);
+}
+
+static void dwc_csi_device_ipi_config(struct dwc_csi_device *csidev)
+{
+	const struct dwc_csi_pix_format *csi_fmt = csidev->csi_fmt;
+	const struct dwc_csi_plat_data *pdata = csidev->pdata;
+	u32 val;
+
+	if (pdata->intf != DWC_CSI2RX_INTF_IPI)
+		return;
+
+	/* Do IPI soft reset */
+	dwc_csi_write(csidev, CSI2RX_IPI_SOFTRSTN, 0x0);
+	dwc_csi_write(csidev, CSI2RX_IPI_SOFTRSTN, 0x1);
+
+	/* Select virtual channel and data type to be processed by IPI */
+	val = CSI2RX_IPI_DATA_TYPE_DT(csi_fmt->data_type);
+	dwc_csi_write(csidev, CSI2RX_IPI_DATA_TYPE, val);
+
+	/* Set virtual channel 0 as default */
+	val  = CSI2RX_IPI_VCID_VC(0);
+	dwc_csi_write(csidev, CSI2RX_IPI_VCID, val);
+
+	/*
+	 * Select IPI camera timing mode and allow the pixel stream
+	 * to be non-continuous when pixel interface FIFO is empty
+	 */
+	val = dwc_csi_read(csidev, CSI2RX_IPI_MODE);
+	val &= ~CSI2RX_IPI_MODE_CONTROLLER;
+	val &= ~CSI2RX_IPI_MODE_COLOR_MODE16;
+	val |= CSI2RX_IPI_MODE_CUT_THROUGH;
+	dwc_csi_write(csidev, CSI2RX_IPI_MODE, val);
+}
+
+static void dwc_csi_device_reset(struct dwc_csi_device *csidev)
+{
+	/* Reset mipi csi host, active low */
+	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 0);
+	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 1);
+}
+
+static void dwc_csi_device_startup(struct dwc_csi_device *csidev)
+{
+	/* Release DWC_mipi_csi2_host from reset */
+	dwc_csi_device_reset(csidev);
+
+	/* Apply PHY Reset */
+	dphy_rx_reset(csidev);
+
+	/* Release PHY test codes from reset */
+	dphy_rx_test_code_reset(csidev);
+}
+
+static int dwc_csi_device_init(struct dwc_csi_device *csidev)
+{
+	struct device *dev = csidev->dev;
+	u32 val;
+	int ret;
+
+	/* Release Synopsys DPHY test codes from reset */
+	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x0);
+	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x0);
+	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 0);
+
+	/* Set testclr=1'b1 */
+	val = dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
+	val |= CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
+	dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
+
+	/* Wait for at least 15ns */
+	ndelay(15);
+
+	/* Configure the PHY frequency range */
+	ret = dphy_rx_get_hsfreqrange(csidev);
+	if (ret < 0)
+		return ret;
+
+	dphy_rx_test_code_config(csidev);
+	dphy_rx_test_code_dump(csidev);
+
+	/* Config the number of active lanes */
+	val = CSI2RX_N_LANES_N_LANES(csidev->bus.num_data_lanes - 1);
+	dwc_csi_write(csidev, CSI2RX_N_LANES, val);
+
+	/* Release PHY from reset */
+	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x1);
+	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x1);
+	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 0x1);
+
+	/* Check if lanes are in stop state */
+	ret = readl_poll_timeout(csidev->regs + CSI2RX_DPHY_STOPSTATE,
+				 val, val != 0x10003, 10, 10000);
+	if (ret) {
+		dev_err(dev, "Lanes are not in stop state(%#x)\n", val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void dwc_csi_device_hs_rx_start(struct dwc_csi_device *csidev)
+{
+	dwc_csi_ipi_enable(csidev);
+}
+
+static int dwc_csi_device_hs_rx_stop(struct dwc_csi_device *csidev)
+{
+	struct device *dev = csidev->dev;
+	u32 val;
+
+	dwc_csi_ipi_disable(csidev);
+	dphy_rx_power_off(csidev);
+
+	/* Check clock lanes are not in High Speed Mode */
+	val = dwc_csi_read(csidev, CSI2RX_DPHY_RX_STATUS);
+	if (val & CSI2RX_DPHY_RX_STATUS_CLK_LANE_HS) {
+		dev_err(dev, "Clock lanes are still in HS mode\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void dwc_csi_device_enable_interrupts(struct dwc_csi_device *csidev, bool on)
+{
+	/* Define errors to be enabled */
+	dwc_csi_write(csidev, CSI2RX_INT_MSK_DPHY_FATAL, on ? 0x3 : 0);
+	dwc_csi_write(csidev, CSI2RX_INT_MSK_PKT_FATAL, on ? 0x3 : 0);
+	dwc_csi_write(csidev, CSI2RX_INT_MSK_DPHY, on ? 0x30003 : 0);
+	dwc_csi_write(csidev, CSI2RX_INT_MSK_IPI_FATAL, on ? 0x7f : 0);
+}
+
+static int dwc_csi_clk_enable(struct dwc_csi_device *csidev)
+{
+	const struct dwc_csi_plat_data *pdata = csidev->pdata;
+
+	return clk_bulk_prepare_enable(pdata->num_clks, csidev->clks);
+}
+
+static void dwc_csi_clk_disable(struct dwc_csi_device *csidev)
+{
+	const struct dwc_csi_plat_data *pdata = csidev->pdata;
+
+	clk_bulk_disable_unprepare(pdata->num_clks, csidev->clks);
+}
+
+static int dwc_csi_clk_get(struct dwc_csi_device *csidev)
+{
+	const struct dwc_csi_plat_data *pdata = csidev->pdata;
+	unsigned int size;
+	int ret;
+
+	size = pdata->num_clks * sizeof(*csidev->clks);
+
+	csidev->clks = devm_kmalloc(csidev->dev, size, GFP_KERNEL);
+	if (!csidev->clks)
+		return -ENOMEM;
+
+	memcpy(csidev->clks, pdata->clks, size);
+
+	ret = devm_clk_bulk_get(csidev->dev, pdata->num_clks, csidev->clks);
+	if (ret < 0) {
+		dev_err(csidev->dev, "Failed to acquire clocks: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Debug
+ */
+
+static void dwc_csi_clear_counters(struct dwc_csi_device *csidev)
+{
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&csidev->slock, flags);
+
+	for (i = 0; i < csidev->pdata->num_events; ++i)
+		csidev->events[i].counter = 0;
+
+	spin_unlock_irqrestore(&csidev->slock, flags);
+}
+
+static void dwc_csi_log_counters(struct dwc_csi_device *csidev)
+{
+	unsigned int num_events = csidev->pdata->num_events;
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&csidev->slock, flags);
+
+	for (i = 0; i < num_events; ++i) {
+		if (csidev->events[i].counter > 0)
+			dev_info(csidev->dev, "%s events: %d\n",
+				 csidev->events[i].name,
+				 csidev->events[i].counter);
+	}
+
+	spin_unlock_irqrestore(&csidev->slock, flags);
+}
+
+static void dwc_csi_dump_regs(struct dwc_csi_device *csidev)
+{
+#define DWC_MIPI_CSIS_DEBUG_REG(name)		{name, #name}
+	static const struct {
+		u32 offset;
+		const char * const name;
+	} registers[] = {
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_VERSION),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_N_LANES),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_HOST_RESETN),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_MAIN),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_SHUTDOWNZ),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_RSTZ),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_RX_STATUS),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_STOPSTATE),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_TEST_CTRL0),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_TEST_CTRL1),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_PATTERN_VRES),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_PATTERN_HRES),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_CONFIG),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_ENABLE),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_STATUS),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_MODE),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_VCID),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_DATA_TYPE),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_MEM_FLUSH),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_SOFTRSTN),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_ADV_FEATURES),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_DPHY_FATAL),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_PKT_FATAL),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_DPHY_FATAL),
+		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_IPI_FATAL),
+	};
+
+	unsigned int i;
+	u32 cfg;
+
+	dev_dbg(csidev->dev, "--- REGISTERS ---\n");
+
+	for (i = 0; i < ARRAY_SIZE(registers); i++) {
+		cfg = dwc_csi_read(csidev, registers[i].offset);
+		dev_dbg(csidev->dev, "%14s[0x%02x]: 0x%08x\n",
+			registers[i].name, registers[i].offset, cfg);
+	}
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 subdev operations
+ */
+
+static inline struct dwc_csi_device *
+sd_to_dwc_csi_device(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct dwc_csi_device, sd);
+}
+
+static struct v4l2_mbus_framefmt *
+dwc_csi_get_pad_format(struct dwc_csi_device *csidev,
+			struct v4l2_subdev_state *sd_state,
+			enum v4l2_subdev_format_whence which,
+			unsigned int pad)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_format(&csidev->sd, sd_state, pad);
+
+	return &csidev->format_mbus[pad];
+}
+
+static int dwc_csi_subdev_init_cfg(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state)
+{
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	struct v4l2_mbus_framefmt *fmt_sink;
+	struct v4l2_mbus_framefmt *fmt_source;
+
+	fmt_sink = dwc_csi_get_pad_format(csidev, sd_state,
+					   V4L2_SUBDEV_FORMAT_TRY,
+					   DWC_CSI2RX_PAD_SINK);
+	*fmt_sink = dwc_csi_default_fmt;
+
+	fmt_source = dwc_csi_get_pad_format(csidev, sd_state,
+					     V4L2_SUBDEV_FORMAT_TRY,
+					     DWC_CSI2RX_PAD_SOURCE);
+	*fmt_source = *fmt_sink;
+
+	return 0;
+}
+
+static int dwc_csi_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *sd_state,
+					  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+
+	/*
+	 * The CSIS can't transcode in any way, the source format is identical
+	 * to the sink format.
+	 */
+	if (code->pad == DWC_CSI2RX_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = dwc_csi_get_pad_format(csidev, sd_state, code->which,
+					      code->pad);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->pad != DWC_CSI2RX_PAD_SINK)
+		return -EINVAL;
+
+	if (code->index >= ARRAY_SIZE(dwc_csi_formats))
+		return -EINVAL;
+
+	code->code = dwc_csi_formats[code->index].code;
+
+	return 0;
+}
+
+static int dwc_csi_subdev_get_fmt(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_format *sdformat)
+{
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = dwc_csi_get_pad_format(csidev, sd_state, sdformat->which,
+				      sdformat->pad);
+
+	mutex_lock(&csidev->lock);
+	sdformat->format = *fmt;
+	mutex_unlock(&csidev->lock);
+
+	return 0;
+}
+
+static int dwc_csi_subdev_set_fmt(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_format *sdformat)
+{
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	struct dwc_csi_pix_format const *csi_fmt;
+	struct v4l2_mbus_framefmt *fmt;
+	unsigned int align;
+
+	/*
+	 * The CSIS can't transcode in any way, the source format can't be
+	 * modified.
+	 */
+	if (sdformat->pad == DWC_CSI2RX_PAD_SOURCE)
+		return dwc_csi_subdev_get_fmt(sd, sd_state, sdformat);
+
+	if (sdformat->pad != DWC_CSI2RX_PAD_SINK)
+		return -EINVAL;
+
+	/*
+	 * Validate the media bus code and clamp and align the size.
+	 *
+	 * The total number of bits per line must be a multiple of 8. We thus
+	 * need to align the width for formats that are not multiples of 8
+	 * bits.
+	 */
+	csi_fmt = find_csi_format(sdformat->format.code);
+	if (!csi_fmt)
+		csi_fmt = &dwc_csi_formats[0];
+
+	switch (csi_fmt->width % 8) {
+	case 0:
+		align = 0;
+		break;
+	case 4:
+		align = 1;
+		break;
+	case 2:
+	case 6:
+		align = 2;
+		break;
+	default:
+		/* 1, 3, 5, 7 */
+		align = 3;
+		break;
+	}
+
+	v4l_bound_align_image(&sdformat->format.width, 1,
+			      DWC_CSI2RX_MAX_PIX_WIDTH, align,
+			      &sdformat->format.height, 1,
+			      DWC_CSI2RX_MAX_PIX_HEIGHT, 0, 0);
+
+	fmt = dwc_csi_get_pad_format(csidev, sd_state, sdformat->which,
+				      sdformat->pad);
+
+	mutex_lock(&csidev->lock);
+
+	fmt->code = csi_fmt->code;
+	fmt->width = sdformat->format.width;
+	fmt->height = sdformat->format.height;
+	fmt->colorspace = sdformat->format.colorspace;
+	fmt->quantization = sdformat->format.quantization;
+	fmt->xfer_func = sdformat->format.xfer_func;
+	fmt->ycbcr_enc = sdformat->format.ycbcr_enc;
+
+	sdformat->format = *fmt;
+
+	/* Propagate the format from sink to source. */
+	fmt = dwc_csi_get_pad_format(csidev, sd_state, sdformat->which,
+				      DWC_CSI2RX_PAD_SOURCE);
+	*fmt = sdformat->format;
+
+	/* The format on the source pad might change due to unpacking. */
+	fmt->code = csi_fmt->output;
+
+	/* Store the CSIS format descriptor for active formats. */
+	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		csidev->csi_fmt = csi_fmt;
+
+	mutex_unlock(&csidev->lock);
+
+	return 0;
+}
+
+static int dwc_csi_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				   struct v4l2_mbus_frame_desc *fd)
+{
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+
+	if (pad != DWC_CSI2RX_PAD_SOURCE)
+		return -EINVAL;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
+	fd->num_entries = 1;
+
+	memset(entry, 0, sizeof(*entry));
+
+	mutex_lock(&csidev->lock);
+
+	entry->flags = 0;
+	entry->pixelcode = csidev->csi_fmt->code;
+	entry->bus.csi2.vc = 0;
+	entry->bus.csi2.dt = csidev->csi_fmt->data_type;
+
+	mutex_unlock(&csidev->lock);
+
+	return 0;
+}
+
+static int dwc_csi_start_stream(struct dwc_csi_device *csidev)
+{
+	int ret;
+
+	dwc_csi_device_startup(csidev);
+
+	ret = dwc_csi_device_init(csidev);
+	if (ret)
+		return ret;
+
+	dwc_csi_device_ipi_config(csidev);
+
+	ret = dwc_csi_device_pg_enable(csidev);
+	if (ret)
+		return ret;
+
+	dwc_csi_device_hs_rx_start(csidev);
+
+	dwc_csi_device_enable_interrupts(csidev, true);
+
+	return 0;
+}
+
+static void dwc_csi_stop_stream(struct dwc_csi_device *csidev)
+{
+	dwc_csi_device_enable_interrupts(csidev, false);
+	dwc_csi_device_hs_rx_stop(csidev);
+	dwc_csi_device_pg_disable(csidev);
+}
+
+static int dwc_csi_subdev_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	int ret;
+
+	if (!csidev->sensor_sd) {
+		dev_err(csidev->dev, "Sensor don't link with CSIS pad\n");
+		return -EPIPE;
+	}
+
+	mutex_lock(&csidev->lock);
+
+	if (!enable) {
+		dwc_csi_stop_stream(csidev);
+		dwc_csi_log_counters(csidev);
+		pm_runtime_put(csidev->dev);
+		goto sd_stream;
+	}
+
+	ret = pm_runtime_resume_and_get(csidev->dev);
+	if (ret < 0)
+		goto unlocked;
+
+	ret = __v4l2_ctrl_handler_setup(&csidev->ctrl_handler);
+	if (ret < 0) {
+		pm_runtime_put(csidev->dev);
+		goto unlocked;
+	}
+
+	dwc_csi_clear_counters(csidev);
+
+	/* CSIS HW configuration */
+	ret = dwc_csi_start_stream(csidev);
+	if (ret) {
+		pm_runtime_put(csidev->dev);
+		goto unlocked;
+	}
+
+	dwc_csi_dump_regs(csidev);
+
+sd_stream:
+	/*
+	 * when enable CSI pattern generator, the clock source of
+	 * pattern generator will be from external sensor, so it
+	 * also need to enable external sensor clock.
+	 */
+	v4l2_subdev_call(csidev->sensor_sd, video, s_stream, enable);
+	dwc_csi_log_counters(csidev);
+unlocked:
+	mutex_unlock(&csidev->lock);
+	return ret;
+}
+
+static int dwc_csi_subdev_log_status(struct v4l2_subdev *sd)
+{
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+
+	dwc_csi_log_counters(csidev);
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops dwc_csi_subdev_core_ops = {
+	.log_status = dwc_csi_subdev_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_pad_ops dwc_csi_subdev_pad_ops = {
+	.init_cfg = dwc_csi_subdev_init_cfg,
+	.enum_mbus_code	= dwc_csi_subdev_enum_mbus_code,
+	.get_fmt = dwc_csi_subdev_get_fmt,
+	.set_fmt = dwc_csi_subdev_set_fmt,
+	.get_frame_desc = dwc_csi_get_frame_desc,
+};
+
+static const struct v4l2_subdev_video_ops dwc_csi_subdev_video_ops = {
+	.s_stream = dwc_csi_subdev_s_stream,
+};
+
+static const struct v4l2_subdev_ops dwc_csi_subdev_ops = {
+	.core  = &dwc_csi_subdev_core_ops,
+	.pad   = &dwc_csi_subdev_pad_ops,
+	.video = &dwc_csi_subdev_video_ops,
+};
+
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static int dwc_csi_link_setup(struct media_entity *entity,
+			       const struct media_pad *local_pad,
+			       const struct media_pad *remote_pad, u32 flags)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	struct v4l2_subdev *remote_sd;
+
+	dev_dbg(csidev->dev, "link setup %s -> %s", remote_pad->entity->name,
+		local_pad->entity->name);
+
+	/* We only care about the link to the source. */
+	if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
+		return 0;
+
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	if (flags & MEDIA_LNK_FL_ENABLED) {
+		if (csidev->sensor_sd)
+			return -EBUSY;
+
+		csidev->sensor_sd = remote_sd;
+		csidev->remote_pad = remote_pad->index;
+	} else {
+		csidev->sensor_sd = NULL;
+	}
+
+	return 0;
+}
+
+static int dwc_csi_link_validate(struct media_link *link)
+{
+	struct media_pad *sink_pad = link->sink;
+	struct v4l2_subdev *sink_sd;
+	struct dwc_csi_device *csidev;
+
+	sink_sd = media_entity_to_v4l2_subdev(sink_pad->entity);
+	csidev = sd_to_dwc_csi_device(sink_sd);
+
+	dev_dbg(csidev->dev, "entity name:%s pad index=%d\n",
+			   sink_sd->name, sink_pad->index);
+
+	/*
+	 * Skip link validate when pattern enabled since the soruce
+	 * data will be from CSI pattern generator, not sensor.
+	 */
+	if (csidev->pg_enable && sink_pad->index == DWC_CSI2RX_PAD_SINK)
+		return 0;
+
+	return v4l2_subdev_link_validate(link);
+}
+
+static const struct media_entity_operations dwc_csi_entity_ops = {
+	.link_setup	= dwc_csi_link_setup,
+	.link_validate	= dwc_csi_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+/* -----------------------------------------------------------------------------
+ * Async subdev notifier
+ */
+
+static inline struct dwc_csi_device *
+notifier_to_dwc_csi_device(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct dwc_csi_device, notifier);
+}
+
+static int dwc_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	struct dwc_csi_device *csidev = notifier_to_dwc_csi_device(notifier);
+	struct media_pad *sink = &csidev->sd.entity.pads[DWC_CSI2RX_PAD_SINK];
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
+}
+
+static const struct v4l2_async_notifier_operations dwc_csi_notify_ops = {
+	.bound = dwc_csi_notify_bound,
+};
+
+static int dwc_csi_async_register(struct dwc_csi_device *csidev)
+{
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct v4l2_async_subdev *asd;
+	struct fwnode_handle *ep;
+	unsigned int i;
+	int ret;
+
+	v4l2_async_nf_init(&csidev->notifier);
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csidev->dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	if (ret)
+		goto err_parse;
+
+	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
+			dev_err(csidev->dev,
+				"data lanes reordering is not supported");
+			ret = -EINVAL;
+			goto err_parse;
+		}
+	}
+
+	csidev->bus = vep.bus.mipi_csi2;
+
+	dev_dbg(csidev->dev, "data lanes: %d\n", csidev->bus.num_data_lanes);
+	dev_dbg(csidev->dev, "flags: 0x%08x\n", csidev->bus.flags);
+
+	asd = v4l2_async_nf_add_fwnode_remote(&csidev->notifier, ep,
+					      struct v4l2_async_subdev);
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto err_parse;
+	}
+
+	fwnode_handle_put(ep);
+
+	csidev->notifier.ops = &dwc_csi_notify_ops;
+
+	ret = v4l2_async_subdev_nf_register(&csidev->sd, &csidev->notifier);
+	if (ret)
+		return ret;
+
+	return v4l2_async_register_subdev(&csidev->sd);
+
+err_parse:
+	fwnode_handle_put(ep);
+
+	return ret;
+}
+
+/* -----------------------------------------------------------------------------
+ * Pattern Generator Controller operations
+ */
+
+static const char * const test_pattern_menu[] = {
+	"Disabled",
+	"Vertical Color Bars",
+	"Horizontal Color Bars",
+};
+
+static inline struct dwc_csi_device *ctrl_to_csidev(struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct dwc_csi_device, ctrl_handler);
+}
+
+static int dwc_csi_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct dwc_csi_device *csidev  = ctrl_to_csidev(ctrl);
+	int ret = 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		/* Pattern index start from 0 */
+		csidev->pg_pattern = ctrl->val - 1;
+		csidev->pg_enable = (ctrl->val) ? true : false;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops dwc_csi_ctrl_ops = {
+	.s_ctrl = dwc_csi_s_ctrl,
+};
+
+static int dwc_csi_controls_init(struct dwc_csi_device *csidev)
+{
+	struct v4l2_ctrl_handler *handler = &csidev->ctrl_handler;
+	int ret;
+
+	v4l2_ctrl_handler_init(handler, 1);
+
+	/* Use driver mutex lock for the ctrl lock */
+	handler->lock = &csidev->lock;
+
+	v4l2_ctrl_new_std_menu_items(handler, &dwc_csi_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(test_pattern_menu) - 1,
+				     0, 0, test_pattern_menu);
+
+	if (handler->error) {
+		ret = handler->error;
+		v4l2_ctrl_handler_free(handler);
+		return ret;
+	}
+
+	csidev->sd.ctrl_handler = handler;
+	return 0;
+}
+/* -----------------------------------------------------------------------------
+ * Suspend/resume
+ */
+
+static int dwc_csi_system_suspend(struct device *dev)
+{
+	return pm_runtime_force_suspend(dev);
+}
+
+static int dwc_csi_system_resume(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0) {
+		dev_err(dev, "force resume %s failed!\n", dev_name(dev));
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dwc_csi_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+
+	dwc_csi_clk_disable(csidev);
+
+	return 0;
+}
+
+static int dwc_csi_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	int ret;
+
+	ret = dwc_csi_clk_enable(csidev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct dev_pm_ops dwc_csi_device_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc_csi_system_suspend, dwc_csi_system_resume)
+	SET_RUNTIME_PM_OPS(dwc_csi_runtime_suspend, dwc_csi_runtime_resume, NULL)
+};
+
+/* -----------------------------------------------------------------------------
+ * IRQ handling
+ */
+
+static irqreturn_t dwc_csi_irq_handler(int irq, void *priv)
+{
+	struct dwc_csi_device *csidev = priv;
+	unsigned long flags;
+	u32 status;
+	int i;
+
+	status = dwc_csi_read(csidev, CSI2RX_INT_ST_MAIN);
+
+	spin_lock_irqsave(&csidev->slock, flags);
+
+	if (status & csidev->pdata->events_mask) {
+		for (i = 0; i < csidev->pdata->num_events; ++i) {
+			struct dwc_csi_event *event = &csidev->events[i];
+
+			if (status & event->mask)
+				event->counter++;
+		}
+	}
+
+	spin_unlock_irqrestore(&csidev->slock, flags);
+
+	return IRQ_HANDLED;
+}
+
+/* -----------------------------------------------------------------------------
+ * Probe/remove & platform driver
+ */
+
+static int dwc_csi_param_init(struct dwc_csi_device *csidev)
+{
+	int i;
+
+	/* Initialize the same format for pads of CSIS entity */
+	for (i = 0; i < DWC_CSI2RX_PADS_NUM; ++i)
+		csidev->format_mbus[i] = dwc_csi_default_fmt;
+
+	csidev->csi_fmt = &dwc_csi_formats[0];
+
+	return 0;
+}
+
+static int dwc_csi_event_init(struct dwc_csi_device *csidev)
+{
+	unsigned int size = csidev->pdata->num_events
+			  * sizeof(*csidev->events);
+
+	csidev->events = devm_kzalloc(csidev->dev, size, GFP_KERNEL);
+	if (!csidev->events)
+		return -ENOMEM;
+
+	memcpy(csidev->events, csidev->pdata->events, size);
+
+	return 0;
+}
+
+static int dwc_csi_subdev_init(struct dwc_csi_device *csidev)
+{
+	struct v4l2_subdev *sd = &csidev->sd;
+
+	v4l2_subdev_init(sd, &dwc_csi_subdev_ops);
+	sd->owner = THIS_MODULE;
+	snprintf(sd->name, sizeof(sd->name), "csidev-%s", dev_name(csidev->dev));
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &dwc_csi_entity_ops;
+
+	sd->dev = csidev->dev;
+
+	csidev->pads[DWC_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	csidev->pads[DWC_CSI2RX_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	return media_entity_pads_init(&csidev->sd.entity, DWC_CSI2RX_PADS_NUM,
+				      csidev->pads);
+}
+
+static int dwc_csi_device_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dwc_csi_device *csidev;
+	unsigned long cfg_rate;
+	int irq;
+	int ret;
+
+	csidev = devm_kzalloc(dev, sizeof(*csidev), GFP_KERNEL);
+	if (!csidev)
+		return -ENOMEM;
+
+	mutex_init(&csidev->lock);
+	spin_lock_init(&csidev->slock);
+
+	csidev->dev = dev;
+	csidev->pdata = of_device_get_match_data(dev);
+
+	csidev->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csidev->regs)) {
+		dev_err(dev, "Failed to get DWC csi2 register map\n");
+		return PTR_ERR(csidev->regs);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "Failed to get IRQ (%d)\n", irq);
+		return irq;
+	}
+
+	ret = devm_request_irq(dev, irq, dwc_csi_irq_handler, 0,
+			       dev_name(dev), csidev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to request IRQ (%d)\n", ret);
+		return ret;
+	}
+
+	ret = dwc_csi_clk_get(csidev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get clocks\n");
+		return ret;
+	}
+
+	/* cfgclkfreqrange[5:0] = round[(cfg_clk(MHz) - 17) * 4] */
+	cfg_rate = clk_get_rate(csidev->clks[PHY_CFG].clk);
+	if (!cfg_rate) {
+		dev_err(dev, "Failed to get phy_cfg clock rate\n");
+		return -EINVAL;
+	}
+
+	csidev->cfgclkfreqrange = ((cfg_rate / 1000000) - 17) * 4;
+
+	ret = dwc_csi_param_init(csidev);
+	if (ret < 0)
+		return ret;
+
+	ret = dwc_csi_event_init(csidev);
+	if (ret < 0)
+		return ret;
+
+	ret = dwc_csi_subdev_init(csidev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize subdev\n");
+		return ret;
+	}
+
+	ret = dwc_csi_controls_init(csidev);
+	if (ret) {
+		dev_err(dev, "Failed to initialize controls\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, &csidev->sd);
+
+	ret = dwc_csi_async_register(csidev);
+	if (ret < 0) {
+		dev_err(dev, "Async register failed: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int dwc_csi_device_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+
+	v4l2_async_nf_unregister(&csidev->notifier);
+	v4l2_async_nf_cleanup(&csidev->notifier);
+	v4l2_async_unregister_subdev(&csidev->sd);
+
+	pm_runtime_disable(&pdev->dev);
+
+	media_entity_cleanup(&csidev->sd.entity);
+	fwnode_handle_put(csidev->sd.fwnode);
+	mutex_destroy(&csidev->lock);
+
+	pm_runtime_set_suspended(&pdev->dev);
+	return 0;
+}
+
+static const struct clk_bulk_data mxc_imx93_clks[] = {
+	{ .id = "per" },
+	{ .id = "pixel" },
+	{ .id = "phy_cfg" },
+};
+
+static const struct dwc_csi_plat_data mxc_imx93_data = {
+	.model		= DWC_CSI2RX_IMX93,
+	.intf		= DWC_CSI2RX_INTF_IPI,
+	.clks		= mxc_imx93_clks,
+	.num_clks	= ARRAY_SIZE(mxc_imx93_clks),
+	.events		= mxc_imx93_events,
+	.num_events	= ARRAY_SIZE(mxc_imx93_events),
+	.events_mask	= 0x500ff,
+};
+
+static const struct of_device_id dwc_csi_device_of_match[] = {
+	{ .compatible = "fsl,imx93-mipi-csi2", .data = &mxc_imx93_data },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, dwc_csi_device_of_match);
+
+static struct platform_driver dwc_csi_device_driver = {
+	.driver = {
+		.owner          = THIS_MODULE,
+		.name           = DWC_MIPI_CSIS_DRIVER_NAME,
+		.of_match_table = dwc_csi_device_of_match,
+		.pm             = &dwc_csi_device_pm_ops,
+	},
+	.probe  = dwc_csi_device_probe,
+	.remove = dwc_csi_device_remove,
+};
+
+module_platform_driver(dwc_csi_device_driver);
+
+MODULE_DESCRIPTION("DesignWare Core MIPI CSI2 driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DWC_MIPI_CSIS_DRIVER_NAME);
diff --git a/drivers/media/platform/nxp/dwc-mipi-csi2.h b/drivers/media/platform/nxp/dwc-mipi-csi2.h
new file mode 100644
index 000000000000..470023787c25
--- /dev/null
+++ b/drivers/media/platform/nxp/dwc-mipi-csi2.h
@@ -0,0 +1,299 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2023 NXP
+ */
+
+#ifndef __DWC_MIPI_CSI2_H__
+#define __DWC_MIPI_CSI2_H__
+
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+/* MIPI CSI-2 Host Controller Registers Define */
+
+/* Core Version */
+#define CSI2RX_VERSION					0x0
+
+/* Number of Lanes */
+#define CSI2RX_N_LANES					0x4
+#define CSI2RX_N_LANES_N_LANES(x)			((x) & 0x7)
+
+/* Logic Reset */
+#define CSI2RX_HOST_RESETN				0x8
+#define CSI2RX_HOST_RESETN_ENABLE			BIT(0)
+
+/* Main Interrupt Status */
+#define CSI2RX_INT_ST_MAIN				0xc
+#define CSI2RX_INT_ST_MAIN_FATAL_ERR_IPI		BIT(18)
+#define CSI2RX_INT_ST_MAIN_ERR_PHY			BIT(16)
+#define CSI2RX_INT_ST_MAIN_ERR_ECC			BIT(7)
+#define CSI2RX_INT_ST_MAIN_ERR_DID			BIT(6)
+#define CSI2RX_INT_ST_MAIN_FATAL_ERR_PLD_CRC		BIT(5)
+#define CSI2RX_INT_ST_MAIN_FATAL_ERR_CRC_FRAME		BIT(4)
+#define CSI2RX_INT_ST_MAIN_FATAL_ERR_SEQ_FRAME		BIT(3)
+#define CSI2RX_INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL	BIT(2)
+#define CSI2RX_INT_ST_MAIN_FATAL_ERR_PKT		BIT(1)
+#define CSI2RX_INT_ST_MAIN_FATAL_ERR_PHY		BIT(0)
+
+/* PHY Shutdown */
+#define CSI2RX_DPHY_SHUTDOWNZ				0x40
+#define CSI2RX_DPHY_SHUTDOWNZ_ENABLE			BIT(0)
+
+/* DPHY Reset */
+#define CSI2RX_DPHY_RSTZ				0x44
+#define CSI2RX_DPHY_RSTZ_ENABLE				BIT(0)
+
+/* RX PHY Status */
+#define CSI2RX_DPHY_RX_STATUS				0x48
+#define CSI2RX_DPHY_RX_STATUS_CLK_LANE_HS		BIT(17)
+#define CSI2RX_DPHY_RX_STATUS_CLK_LANE_ULP		BIT(16)
+#define CSI2RX_DPHY_RX_STATUS_DATA_LANE1_ULP		BIT(1)
+#define CSI2RX_DPHY_RX_STATUS_DATA_LANE0_ULP		BIT(0)
+
+/* STOP STATE PHY Status */
+#define CSI2RX_DPHY_STOPSTATE				0x4c
+#define CSI2RX_DPHY_STOPSTATE_CLK_LANE			BIT(16)
+#define CSI2RX_DPHY_STOPSTATE_DATA_LANE1		BIT(1)
+#define CSI2RX_DPHY_STOPSTATE_DATA_LANE0		BIT(0)
+
+/* DPHY Test and Control Interface 1 */
+#define CSI2RX_DPHY_TEST_CTRL0				0x50
+#define CSI2RX_DPHY_TEST_CTRL0_TEST_CLR			BIT(0)
+#define CSI2RX_DPHY_TEST_CTRL0_TEST_CLKEN		BIT(1)
+
+/* DPHY Test and Control Interface 2 */
+#define CSI2RX_DPHY_TEST_CTRL1				0x54
+#define CSI2RX_DPHY_TEST_CTRL1_TEST_DIN(x)		((x) & 0xff)
+#define CSI2RX_DPHY_TEST_CTRL1_TEST_DOUT(x)		(((x) & 0xff00) >> 8)
+#define CSI2RX_DPHY_TEST_CTRL1_TEST_EN			BIT(16)
+
+/* Pattern Generator vertical Resolution */
+#define CSI2RX_PPI_PG_PATTERN_VRES			0x60
+#define CSI2RX_PPI_PG_PATTERN_VRES_VRES(x)		((x) & 0xffff)
+
+/* Pattern Generator horizontal Resolution */
+#define CSI2RX_PPI_PG_PATTERN_HRES			0x64
+#define CSI2RX_PPI_PG_PATTERN_HRES_HRES(x)		((x) & 0xffff)
+
+/* Pattern Generator */
+#define CSI2RX_PPI_PG_CONFIG				0x68
+#define CSI2RX_PPI_PG_CONFIG_DATA_TYPE(x)		(((x) & 0x3f) << 8)
+#define CSI2RX_PPI_PG_CONFIG_VIR_CHAN(x)		(((x) & 0x3) << 14)
+#define CSI2RX_PPI_PG_CONFIG_VIR_CHAN_EX(x)		(((x) & 0x3) << 16)
+#define CSI2RX_PPI_PG_CONFIG_VIR_CHAN_EX_2_EN		BIT(18)
+#define CSI2RX_PPI_PG_CONFIG_PG_MODE(x)			(x)
+
+/* Pattern Generator Enable */
+#define CSI2RX_PPI_PG_ENABLE				0x6c
+#define CSI2RX_PPI_PG_ENABLE_EN				BIT(0)
+
+/* Pattern Generator Status */
+#define CSI2RX_PPI_PG_STATUS				0x70
+#define CSI2RX_PPI_PG_STATUS_ACTIVE			BIT(0)
+
+/* IPI Mode */
+#define CSI2RX_IPI_MODE					0x80
+#define CSI2RX_IPI_MODE_ENABLE				BIT(24)
+#define CSI2RX_IPI_MODE_CUT_THROUGH			BIT(16)
+#define CSI2RX_IPI_MODE_COLOR_MODE16			BIT(8)
+#define CSI2RX_IPI_MODE_CONTROLLER			BIT(1)
+
+/* IPI Virtual Channel */
+#define CSI2RX_IPI_VCID					0x84
+#define CSI2RX_IPI_VCID_VC(x)				((x)  & 0x3)
+#define CSI2RX_IPI_VCID_VC_0_1(x)			(((x) & 0x3) << 2)
+#define CSI2RX_IPI_VCID_VC_2				BIT(4)
+
+/* IPI Data Type */
+#define CSI2RX_IPI_DATA_TYPE				0x88
+#define CSI2RX_IPI_DATA_TYPE_DT(x)			((x) & 0x3f)
+#define CSI2RX_IPI_DATA_TYPE_EMB_DATA_EN		BIT(8)
+
+/* IPI Flush Memory */
+#define CSI2RX_IPI_MEM_FLUSH				0x8c
+#define CSI2RX_IPI_MEM_FLUSH_AUTO			BIT(8)
+
+/* IPI HSA */
+#define CSI2RX_IPI_HSA_TIME				0x90
+#define CSI2RX_IPI_HSA_TIME_VAL(x)			((x) & 0xfff)
+
+/* IPI HBP */
+#define CSI2RX_IPI_HBP_TIME				0x94
+#define CSI2RX_IPI_HBP_TIME_VAL(x)			((x) & 0xfff)
+
+/* IPI HSD */
+#define CSI2RX_IPI_HSD_TIME				0x98
+#define CSI2RX_IPI_HSD_TIME_VAL(x)			((x) & 0xfff)
+
+/* IPI HLINE */
+#define CSI2RX_IPI_HLINE_TIME				0x9C
+#define CSI2RX_IPI_HLINE_TIME_VAL(x)			((x) & 0x3fff)
+
+/* IPI Soft Reset */
+#define CSI2RX_IPI_SOFTRSTN				0xa0
+
+/* IPI Advanced Features */
+#define CSI2RX_IPI_ADV_FEATURES				0xac
+#define CSI2RX_IPI_ADV_FEATURES_SYNC_EVENT_MODE		BIT(24)
+#define CSI2RX_IPI_ADV_FEATURES_SYNC_EMBEDDED_PKT	BIT(21)
+#define CSI2RX_IPI_ADV_FEATURES_SYNC_BLANKING_PKT	BIT(20)
+#define CSI2RX_IPI_ADV_FEATURES_SYNC_NULL_PKT		BIT(19)
+#define CSI2RX_IPI_ADV_FEATURES_SYNC_LS_PKT		BIT(18)
+#define CSI2RX_IPI_ADV_FEATURES_SYNC_VIDEO_PKT		BIT(17)
+#define CSI2RX_IPI_ADV_FEATURES_LINE_EVENT_SEL		BIT(16)
+#define CSI2RX_IPI_ADV_FEATURES_DT_OVER_WRITE(x)	(((x) & 0x3f) << 8)
+#define CSI2RX_IPI_ADV_FEATURES_DT_OVER_WRITE_EN	BIT(0)
+
+/* IPI VSA */
+#define CSI2RX_IPI_VSA_LINES				0xb0
+#define CSI2RX_IPI_VSA_LINES_VAL(x)			((x) & 0x3ff)
+
+/* IPI VBP */
+#define CSI2RX_IPI_VBP_LINES				0xb4
+#define CSI2RX_IPI_VBP_LINES_VAL(x)			((x) & 0x3ff)
+
+/* IPI VFP */
+#define CSI2RX_IPI_VFP_LINES				0xb8
+#define CSI2RX_IPI_VFP_LINES_VAL(x)			((x) & 0x3ff)
+
+/* IPI VACTIVE */
+#define CSI2RX_IPI_VACTIVE_LINES			0xbc
+#define CSI2RX_IPI_VACTIVE_LINES_VAL(x)			((x) & 0x3fff)
+
+/* Fatal Interruption Caused by PHY */
+#define CSI2RX_INT_ST_DPHY_FATAL			0xe0
+#define CSI2RX_INT_ST_DPHY_FATAL_ERR_SOT_LANE1		BIT(1)
+#define CSI2RX_INT_ST_DPHY_FATAL_ERR_SOT_LANE0		BIT(0)
+
+/* Mask for Fatal Interruption Caused by PHY */
+#define CSI2RX_INT_MSK_DPHY_FATAL			0xe4
+#define CSI2RX_INT_MSK_DPHY_FATAL_ERR_SOT_LANE1		BIT(1)
+#define CSI2RX_INT_MSK_DPHY_FATAL_ERR_SOT_LANE0		BIT(0)
+
+/* Force for Fatal Interruption Caused by PHY */
+#define CSI2RX_INT_FORCE_DPHY_FATAL			0xe8
+
+/* Fatal Interruption Caused During Packet Construction */
+#define CSI2RX_INT_ST_PKT_FATAL			0xf0
+#define CSI2RX_INT_ST_PKT_FATAL_ERR_PAYLOAD		BIT(1)
+#define CSI2RX_INT_ST_PKT_FATAL_ERR_ECC		BIT(0)
+
+/* Mask for Fatal Interruption Caused During Packet Construction */
+#define CSI2RX_INT_MSK_PKT_FATAL			0xf4
+#define CSI2RX_INT_MSK_PKT_FATAL_ERR_PAYLOAD		BIT(1)
+#define CSI2RX_INT_MSK_PKT_FATAL_ERR_ECC		BIT(0)
+
+/* Force for Fatal Interruption Caused During Packet Construction */
+#define CSI2RX_INT_FORCE_PKT_FATAL			0xf8
+
+/* Interruption Caused by PHY */
+#define CSI2RX_INT_ST_DPHY				0x110
+#define CSI2RX_INT_ST_DPHY_ERR_ESC_LANE1		BIT(17)
+#define CSI2RX_INT_ST_DPHY_ERR_ESC_LANE0		BIT(16)
+#define CSI2RX_INT_ST_DPHY_ERR_SOT_LANE1		BIT(1)
+#define CSI2RX_INT_ST_DPHY_ERR_SOT_LANE0		BIT(0)
+
+/* Mask for Interruption Caused by PHY */
+#define CSI2RX_INT_MSK_DPHY				0x114
+#define CSI2RX_INT_MSK_DPHY_ESC_ERR_LANE1		BIT(17)
+#define CSI2RX_INT_MSK_DPHY_ESC_ERR_LANE0		BIT(16)
+#define CSI2RX_INT_MSK_DPHY_SOT_ERR_LANE1		BIT(1)
+#define CSI2RX_INT_MSK_DPHY_SOT_ERR_LANE0		BIT(0)
+
+/* Force for Interruption Caused by PHY */
+#define CSI2RX_INT_FORCE_DPHY				0x118
+
+/* Fatal Interruption Caused by IPI Interface */
+#define CSI2RX_INT_ST_IPI_FATAL			0x140
+#define CSI2RX_INT_ST_IPI_FATAL_ERR_PD_FIFO_OVERFLOW	BIT(6)
+#define CSI2RX_INT_ST_IPI_FATAL_ERR_FIFO_OVERFLOW	BIT(5)
+#define CSI2RX_INT_ST_IPI_FATAL_ERR_HLINE_TIME		BIT(4)
+#define CSI2RX_INT_ST_IPI_FATAL_ERR_FIFO_NOT_EMPTY	BIT(3)
+#define CSI2RX_INT_ST_IPI_FATAL_ERR_FRAME_SYNC		BIT(2)
+#define CSI2RX_INT_ST_IPI_FATAL_ERR_IF_FIFO_OVERFLOW	BIT(1)
+#define CSI2RX_INT_ST_IPI_FATAL_ERR_IF_FIFO_UNDERFLOW	BIT(0)
+
+/* Mask for Fatal Interruption Caused by IPI Interface */
+#define CSI2RX_INT_MSK_IPI_FATAL			0x144
+#define CSI2RX_INT_MSK_IPI_FATAL_ERR_PD_FIFO_OVERFLOW	BIT(6)
+#define CSI2RX_INT_MSK_IPI_FATAL_ERR_FIFO_OVERFLOW	BIT(5)
+#define CSI2RX_INT_MSK_IPI_FATAL_ERR_HLINE_TIME		BIT(4)
+#define CSI2RX_INT_MSK_IPI_FATAL_ERR_FIFO_NOT_EMPTY	BIT(3)
+#define CSI2RX_INT_MSK_IPI_FATAL_ERR_FRAME_SYNC		BIT(2)
+#define CSI2RX_INT_MSK_IPI_FATAL_ERR_IF_FIFO_OVERFLOW	BIT(1)
+#define CSI2RX_INT_MSK_IPI_FATAL_ERR_IF_FIFO_UNDERFLOW	BIT(0)
+
+/* Force for Fatal Interruption Caused by IPI Interface */
+#define CSI2RX_INT_FORCE_IPI_FATAL			0x148
+
+/* Data De-Scrambling */
+#define CSI2RX_SCRAMBLING				0x300
+
+/* De-scrambler Seed for Lane 1 */
+#define CSI2RX_SCRAMBLING_SEED1				0x304
+
+/* De-scrambler Seed for Lane 2 */
+#define CSI2RX_SCRAMBLING_SEED2				0x308
+
+#define dwc_csi_write(csidev, reg, val)	writel((val), csidev->regs + (reg))
+#define dwc_csi_read(csidev, reg)	readl(csidev->regs + (reg))
+
+#define DWC_CSI2RX_PAD_SINK		0
+#define DWC_CSI2RX_PAD_SOURCE		1
+#define DWC_CSI2RX_PADS_NUM		2
+
+struct dwc_csi_pix_format {
+	u32 code;
+	u32 output;
+	u32 data_type;
+	u8 width;
+};
+
+struct dwc_csi_device {
+	struct device *dev;
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	const struct dwc_csi_plat_data *pdata;
+
+	struct v4l2_subdev sd;
+	struct v4l2_async_notifier notifier;
+	struct v4l2_subdev *sensor_sd;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct media_pad pads[DWC_CSI2RX_PADS_NUM];
+	u16 remote_pad;
+
+	struct v4l2_mbus_config_mipi_csi2 bus;
+	u32 cfgclkfreqrange;
+	u32 hsfreqrange;
+
+	spinlock_t slock;	/* Protect events */
+	struct mutex lock;
+
+	struct dwc_csi_event *events;
+	const struct dwc_csi_pix_format *csi_fmt;
+	struct v4l2_mbus_framefmt format_mbus[DWC_CSI2RX_PADS_NUM];
+
+	/* Used for pattern generator */
+	bool pg_enable;
+	enum {
+		PATTERN_DISABLED,
+		PATTERN_VERTICAL,
+		PATTERN_HORIZONTAL,
+	} pg_pattern;
+};
+
+void dphy_rx_reset(struct dwc_csi_device *csidev);
+void dphy_rx_test_code_reset(struct dwc_csi_device *csidev);
+void dphy_rx_test_code_config(struct dwc_csi_device *csidev);
+void dphy_rx_power_off(struct dwc_csi_device *csidev);
+void dphy_rx_test_code_dump(struct dwc_csi_device *csidev);
+int dphy_rx_get_hsfreqrange(struct dwc_csi_device *csidev);
+
+#endif /* __DWC_MIPI_CSI2_H__ */
diff --git a/drivers/media/platform/nxp/dwc-mipi-dphy.c b/drivers/media/platform/nxp/dwc-mipi-dphy.c
new file mode 100644
index 000000000000..9b9f2f01a31c
--- /dev/null
+++ b/drivers/media/platform/nxp/dwc-mipi-dphy.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2023 NXP
+ */
+
+#include "dwc-mipi-csi2.h"
+
+/*
+ * DPHY testcode used to configure Rx DPHY
+ */
+
+/* System configuration 0 */
+#define DPHY_RX_SYS_0					0x01
+#define HSFREQRANGE_OVR_EN_RW				BIT(5)
+
+/* System configuration 1 */
+#define DPHY_RX_SYS_1					0x02
+#define HSFREQRANGE_OVR_RW(x)				((x) & 0x7F)
+#define TIMEBASE_OVR_EN_RW				BIT(7)
+
+/* System configuration 2 */
+#define DPHY_RX_SYS_2					0x03
+#define TIMEBASE_OVR_RW(x)				((x) & 0xFF)
+
+struct dwc_csi_mbps_reg {
+	u16 mbps;
+	u16 reg;
+};
+
+/*
+ * Bit rate to high speed frequency range map table
+ */
+static const struct dwc_csi_mbps_reg dwc_csi_mbps_table[] = {
+	{ .mbps = 80,  .reg = 0x00 },
+	{ .mbps = 90,  .reg = 0x10 },
+	{ .mbps = 100, .reg = 0x20 },
+	{ .mbps = 110, .reg = 0x30 },
+	{ .mbps = 120, .reg = 0x01 },
+	{ .mbps = 130, .reg = 0x11 },
+	{ .mbps = 140, .reg = 0x21 },
+	{ .mbps = 150, .reg = 0x31 },
+	{ .mbps = 160, .reg = 0x02 },
+	{ .mbps = 170, .reg = 0x12 },
+	{ .mbps = 180, .reg = 0x22 },
+	{ .mbps = 190, .reg = 0x32 },
+	{ .mbps = 205, .reg = 0x03 },
+	{ .mbps = 220, .reg = 0x13 },
+	{ .mbps = 235, .reg = 0x23 },
+	{ .mbps = 250, .reg = 0x33 },
+	{ .mbps = 275, .reg = 0x04 },
+	{ .mbps = 300, .reg = 0x14 },
+	{ .mbps = 325, .reg = 0x25 },
+	{ .mbps = 350, .reg = 0x35 },
+	{ .mbps = 400, .reg = 0x05 },
+	{ .mbps = 450, .reg = 0x16 },
+	{ .mbps = 500, .reg = 0x26 },
+	{ .mbps = 550, .reg = 0x37 },
+	{ .mbps = 600, .reg = 0x07 },
+	{ .mbps = 650, .reg = 0x18 },
+	{ .mbps = 700, .reg = 0x28 },
+	{ .mbps = 750, .reg = 0x39 },
+	{ .mbps = 800, .reg = 0x09 },
+	{ .mbps = 850, .reg = 0x19 },
+	{ .mbps = 900, .reg = 0x29 },
+	{ .mbps = 950, .reg = 0x3a },
+	{ .mbps = 1000, .reg = 0x0a },
+	{ .mbps = 1050, .reg = 0x1a },
+	{ .mbps = 1100, .reg = 0x2a },
+	{ .mbps = 1150, .reg = 0x3b },
+	{ .mbps = 1200, .reg = 0x0b },
+	{ .mbps = 1250, .reg = 0x1b },
+	{ .mbps = 1300, .reg = 0x2b },
+	{ .mbps = 1350, .reg = 0x3c },
+	{ .mbps = 1400, .reg = 0x0c },
+	{ .mbps = 1450, .reg = 0x1c },
+	{ .mbps = 1500, .reg = 0x2c },
+	{ /* sentinel */ },
+};
+
+static inline void dphy_rx_test_ctrl_set(struct dwc_csi_device *csidev,
+					 u32 offset, u32 mask, u32 code)
+{
+	u32 val;
+
+	val = dwc_csi_read(csidev, offset);
+	val &= ~(mask);
+	val |= code;
+	dwc_csi_write(csidev, offset, val);
+}
+
+static inline void dphy_rx_test_ctrl_clr(struct dwc_csi_device *csidev,
+					 u32 offset, u32 code)
+{
+	u32 val;
+
+	val = dwc_csi_read(csidev, offset);
+	val &= ~(code);
+	dwc_csi_write(csidev, offset, val);
+}
+
+static u8 dphy_rx_test_ctrl_get(struct dwc_csi_device *csidev, u32 offset)
+{
+	u32 val;
+
+	val = dwc_csi_read(csidev, offset);
+	val = CSI2RX_DPHY_TEST_CTRL1_TEST_DOUT(val);
+
+	return (u8)val;
+}
+
+static void dphy_rx_write(struct dwc_csi_device *csidev, u8 addr, u8 value)
+{
+	u32 val;
+
+	/*
+	 * Set PHY_TST_CTRL1, bit[16] and write PHY_TST_CTRL1,
+	 * bit[7:0] with test code address
+	 */
+	val = CSI2RX_DPHY_TEST_CTRL1_TEST_EN;
+	val |= CSI2RX_DPHY_TEST_CTRL1_TEST_DIN(addr);
+	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL1, 0x100ff, val);
+
+	/*
+	 * Set and clear PHY_TST_CTRL0, bit[1]
+	 */
+	val = CSI2RX_DPHY_TEST_CTRL0_TEST_CLKEN;
+	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL0, 0x2, val);
+	dphy_rx_test_ctrl_clr(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
+
+	/*
+	 * Write PHY_TST_CTRL1, bit[7:0] with test code content
+	 */
+	val = CSI2RX_DPHY_TEST_CTRL1_TEST_DIN(value);
+	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL1, 0xff, val);
+
+	/*
+	 * Clear PHY_TST_CTRL1, bit[16]
+	 */
+	val = CSI2RX_DPHY_TEST_CTRL1_TEST_EN;
+	dphy_rx_test_ctrl_clr(csidev, CSI2RX_DPHY_TEST_CTRL1, val);
+
+	/*
+	 * Set and clear PHY_TST_CTRL0, bit[1]
+	 */
+	val = CSI2RX_DPHY_TEST_CTRL0_TEST_CLKEN;
+	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL0, 0x2, val);
+	dphy_rx_test_ctrl_clr(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
+}
+
+static int dphy_rx_read(struct dwc_csi_device *csidev, u8 addr)
+{
+	u32 val;
+
+	/*
+	 * Set PHY_TST_CTRL1, bit[16] and write PHY_TST_CTRL1,
+	 * bit[7:0] with test code address
+	 */
+	val = CSI2RX_DPHY_TEST_CTRL1_TEST_EN;
+	val |= CSI2RX_DPHY_TEST_CTRL1_TEST_DIN(addr);
+	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL1, 0x100ff, val);
+
+	/* Set and clear PHY_TST_CTRL0, bit[1] */
+	val = CSI2RX_DPHY_TEST_CTRL0_TEST_CLKEN;
+	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL0, 0x2, val);
+	dphy_rx_test_ctrl_clr(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
+
+	/* Read PHY_TST_CTRL1, bit[15:8] with the test code content */
+	val = dphy_rx_test_ctrl_get(csidev, CSI2RX_DPHY_TEST_CTRL1);
+
+	/* Clear PHY_TST_CTRL1, bit[16] */
+	dphy_rx_test_ctrl_clr(csidev, CSI2RX_DPHY_TEST_CTRL1,
+				CSI2RX_DPHY_TEST_CTRL1_TEST_EN);
+
+	return val;
+}
+
+void dphy_rx_reset(struct dwc_csi_device *csidev)
+{
+	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x0);
+	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x0);
+	ndelay(15);
+
+	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x1);
+	ndelay(5);
+	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x1);
+}
+
+void dphy_rx_test_code_reset(struct dwc_csi_device *csidev)
+{
+	u32 val;
+
+	/* Set PHY_TST_CTRL0, bit[0] */
+	val = dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
+	val |= CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
+	dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
+
+	/* Clear PHY_TST_CTRL0, bit[0] */
+	val = dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
+	val &= ~CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
+	dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
+}
+
+void dphy_rx_test_code_config(struct dwc_csi_device *csidev)
+{
+	u32 val;
+	u8 dphy_val;
+
+	/* Set testclr=1'b0 */
+	val = dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
+	val &= ~CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
+	dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
+
+	/* Enable hsfreqrange_ovr_en and set hsfreqrange */
+	dphy_rx_write(csidev, DPHY_RX_SYS_0, HSFREQRANGE_OVR_EN_RW);
+	dphy_rx_write(csidev, DPHY_RX_SYS_1,
+		      HSFREQRANGE_OVR_RW(csidev->hsfreqrange));
+
+	/* Enable timebase_ovr_en */
+	dphy_val = dphy_rx_read(csidev, DPHY_RX_SYS_1);
+	dphy_val |= TIMEBASE_OVR_EN_RW;
+	dphy_rx_write(csidev, DPHY_RX_SYS_1, dphy_val);
+
+	/* Set cfgclkfreqrange */
+	dphy_rx_write(csidev, DPHY_RX_SYS_2,
+		      TIMEBASE_OVR_RW(csidev->cfgclkfreqrange + 0x44));
+}
+
+void dphy_rx_power_off(struct dwc_csi_device *csidev)
+{
+	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x0);
+	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x0);
+}
+
+void dphy_rx_test_code_dump(struct dwc_csi_device *csidev)
+{
+#define DPHY_DEBUG_REG(name)		{name, #name}
+	static const struct {
+		u32 offset;
+		const char * const name;
+	} test_codes[] = {
+		DPHY_DEBUG_REG(DPHY_RX_SYS_0),
+		DPHY_DEBUG_REG(DPHY_RX_SYS_1),
+		DPHY_DEBUG_REG(DPHY_RX_SYS_2),
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(test_codes); i++)
+		dev_dbg(csidev->dev, "%14s[0x%02x]: 0x%02x\n",
+			test_codes[i].name, test_codes[i].offset,
+			dphy_rx_read(csidev, test_codes[i].offset));
+}
+
+int dphy_rx_get_hsfreqrange(struct dwc_csi_device *csidev)
+{
+	struct v4l2_subdev *source = csidev->sensor_sd;
+	const struct dwc_csi_mbps_reg *value;
+	const struct dwc_csi_mbps_reg *prev_value = NULL;
+	s64 link_freq;
+	u32 mbsp;
+
+	link_freq = v4l2_get_link_freq(source->ctrl_handler,
+				       csidev->csi_fmt->width,
+				       csidev->bus.num_data_lanes * 2);
+	if (link_freq < 0) {
+		dev_err(csidev->dev, "Unable to obtain link frequency: %d\n",
+			(int)link_freq);
+		return link_freq;
+	}
+
+	mbsp = link_freq * 2 / 1000000;
+
+	if (mbsp < 80 || mbsp > 1500) {
+		dev_dbg(csidev->dev, "Out-of-bound lane rate %u\n", mbsp);
+		return -EINVAL;
+	}
+
+	for (value = dwc_csi_mbps_table; value->mbps; value++) {
+		if (value->mbps >= mbsp)
+			break;
+		prev_value = value;
+	}
+
+	if (prev_value &&
+	    ((mbsp - prev_value->mbps) <= (value->mbps - mbsp)))
+		value = prev_value;
+
+	if (!value->mbps) {
+		dev_err(csidev->dev, "Unsupported PHY speed (%u Mbps)", mbsp);
+		return -ERANGE;
+	}
+
+	csidev->hsfreqrange = value->reg;
+
+	return 0;
+}
-- 
2.37.1

