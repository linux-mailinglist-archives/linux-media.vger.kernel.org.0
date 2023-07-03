Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D466745B31
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 13:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjGCLdi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 07:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjGCLdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 07:33:35 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2077.outbound.protection.outlook.com [40.107.6.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4AB210D1;
        Mon,  3 Jul 2023 04:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVq6HgDKNsOQG8uehiF03puGker3cfdG8Iw1ZeNv5XkymIz4tap2ZPNuiORH+47ZV36IQOSspm31eLS9lH51lYzBy/17POOUsmxwEhmU6E3dwKPPp8J53+kv0CxLiCrwobWrOISVOlugV/Ff2b8fp4oScJ0GwQpMxlT8gF2m68C4iEowpz4tf+Fy696pSt4SDrktA7kf5V+fYlsrGIMwmqQ7DDtbMjZY/k7ThW2Juds7rYfX4W+lwBuKP/syu44a2p7FA38LDeLaWVX4oui7bZPrnDqgiTOYZTxAokPX0cXHGcrURFHgoWMBjYs1NesCtw+UMzfh7F8WNywjf+WUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QTKkVIIXQBo758vObEfEVFSLz7y4wt3tf7Q9rtzurs=;
 b=NJwJDtPm5NrAmE2uxzrkMjakPQ8Tybw2LXrAvDcNDWY8xvMSkQhhhWwQdW1onkRBq9sSoWttNaduhNPk8irTBlp9TbQjeI0iSOsPaldJ7Jg3MhapzPSVTSpB9f5AZUpW27bx+im/kk+O2hp287lgftLXPXsnHvSmJ9y12hPuFarzcJoxHNjI4AonoZXmrcyJp2S4xu7wqQFsVeTCKQ2YZGKa6go0WkSx0JKmQVjIsxpFzM1OK+3WCkRvlVvPDtBpsbh2B+1nqkAyLu7CihVlSs3gvuNnWTX3Sx5bdNpg6QI80y6EC2Hr12pyGtfjb+Vzcg0hSWlesGMdDDJq71LcVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QTKkVIIXQBo758vObEfEVFSLz7y4wt3tf7Q9rtzurs=;
 b=erLMF6adklC0ZWgiUW9ngqh0Qwa9x46uSw5vJHAsGWWtHwgEj8ZsgKipp7a+y+GRflu2MnygsoUAHznURMstEDVvdoY2m8bhWNr4v4iucA9Vp7HOSnTYKigpfi2reDfFcwXDJEThMvjOA2Hv98I2l6QG6vX+RP5RSiPw7oODnoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8502.eurprd04.prod.outlook.com (2603:10a6:10:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 11:33:07 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 11:33:07 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jacopo.mondi@ideasonboard.com
Subject: [PATCH 2/2] media: nxp: add driver for i.MX93 MIPI CSI-2 controller and D-PHY
Date:   Mon,  3 Jul 2023 19:37:34 +0800
Message-Id: <20230703113734.762307-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c59bdfa-710e-4582-38ef-08db7bb9457a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nKeW17XWspA550PgyH7Zht+rwspKqgWe5Pv1GMADyRCg3JVc64ypYgadvzbSyuwYXDTcp3NgMkp+Vq2UeaTmXZ6u2t6GB8Jge/x1I4/Nl8Hxcc4k18NfNZoEXvGtS++Dwv42ICHk42sdCDnX/0Y2+f6fBrx0adkB/6nyCpzlx6OYaKqyaNWw3uHndKVt9vOVUmyYKty9J6xHNV3Y7Ag/SRUV2MRwQphyo+/+VaUr3+sm868tadJXLYFVmxfFK51taSexxlOQUgEP0nf9bGZMuhhDqjdMsozGp8o3B+W+xTlhNRNo/fkME3QSQSZT0In9y50vmi3GB0LAtbDjtCTTShaI46aUqkMcMWxm1XaQggIYDlDs1Ae+80J0/LXRwoCnlImtynpoxB0kxoxWvLiIYw5JP7wadqGLVzMh2sLpWLP88kxBmwUFy8R61khxS6ibIgTaRdTl7zsejvJTFEtfScDYZdhLNHAmiK/XT0Wlr7SIiA3QDGpjyifZU+XqjpM6KDbhWdoo/dYXln6OjUC8vEmw7xxu8G8YtT3b3sfyRm91XI/SuN4A/s9lFvZrP90tAZg8wrKjNOxBOi1hshIxLZRQMSwc4+gLsLPx8i8DBTwlrHbNuHJY14cFxQqbtW38
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(26005)(478600001)(1076003)(9686003)(6666004)(6512007)(6506007)(86362001)(2616005)(186003)(38350700002)(38100700002)(66556008)(66946007)(66476007)(4326008)(83380400001)(52116002)(6486002)(316002)(5660300002)(8676002)(8936002)(30864003)(41300700001)(2906002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gOYjZyi3vvsKEIQuawHtGZXcSJfJvK7WfTbaJYZVG4B/J93BqyXChC75pwoj?=
 =?us-ascii?Q?tH1F3aPHf/cGRsl6MQe3Iq7NMEZ64tSdIGk8KMab0JPtf6kkp+98XUki7B0H?=
 =?us-ascii?Q?eUA/ltSC5alM5Rfccf/tlcf2CnAfwiMwhAKmQ02KRmWbgi7O1tB61XU+oufO?=
 =?us-ascii?Q?1eASMotdzVikiG/fRhAEa7wtBLM3GuSqyO2WCmS1q5pZeowqbdb3/+LEol8i?=
 =?us-ascii?Q?NH4idWyi1gDMSqYk2cHu/XFjImZq9lolS0jofs5jyL5nejs0AA3LPBTob+47?=
 =?us-ascii?Q?wIV7zWJq7y1K13fCPpFbWNlUUwOEetWPaSNpe3A34sS5aOkaFczb3a0gOLI8?=
 =?us-ascii?Q?cUe9JqVjIeWYuo+5de3P3Sr19FGNirMSsCUsGHO2hTCjnzuxj8DBa9ljXlTe?=
 =?us-ascii?Q?OvDP9FbkumZsaFrF1Q1R/is/AAFHGcW+3L7d4FhCKFkWMfInrY1rYG/RezXU?=
 =?us-ascii?Q?Hu9oI1czN6uKkaNe8/rT8zjBt1QpWGPcCMOvn448OijYM1ki0m4A/HMDYf2w?=
 =?us-ascii?Q?thUPQqwecSdorUEnDzyeNSR+5Y1VoebIcU4K3hA1oofW5VuRRmVeMwLom3V/?=
 =?us-ascii?Q?+JxigKB9r+un8ef7XRQLj9/ngjNdJefW+nG3CGIPv07TaduOO+byF1LH2fvx?=
 =?us-ascii?Q?THV/kJ82GiJU8b7spjxMhJV2wpSwAiLcq4/OgHU5myv4w3ZYaGZneFHr0NfP?=
 =?us-ascii?Q?2fEhfNGs4BfLipy2z3FbBrAxGIB0Xe9qVgRvasM/VaMDNZ9Y8G8Jgo+et+2h?=
 =?us-ascii?Q?LDePC2BsEdQ8JU/AeEUumlNkx09uNGaojVNXLA9o2ajbTUnRu9cuNHk7c2dE?=
 =?us-ascii?Q?bpGCwsad2y9m1Czc6zb8od+iNT8kk05fk9VQqTHAzOW9WuDDA2q3QdfKTqLS?=
 =?us-ascii?Q?aauxFISsZsSHLBuEZ1nBtvVCQSB8ysF+tLcFVqa7iF6oXuj4KPZpmj04C+LY?=
 =?us-ascii?Q?boDSaIsNX40epa2Kl9sz3UZjIeH1rOTJgfj4UV0/4L1E6mUO/oAaL0g3X/4R?=
 =?us-ascii?Q?VvGDXYCMvFbBCDdKpqYHYAJ+x4UIraD1iwla9ITHqRuZy9MGSqlU0cKmn9jv?=
 =?us-ascii?Q?GVKWWvOe8n6gK/HGyuPXUK88JPDM1uBtQZqJ5P8JOp4MmJs/XyLT32MQtSMY?=
 =?us-ascii?Q?wptVnzUzMeQhPrJNJfgIiGlclJy0gTLrjnS59vTT3VULJdyETc3HdaDW3kvH?=
 =?us-ascii?Q?6z8U8hbZ5tgMF1G3OMt+6FonoeWn+6vKhyndCeaq3pyroV2342sLHfZ15Ip/?=
 =?us-ascii?Q?r8auDdvP95tIc+BobcoC7ZqhSWgSuVygpiZustOG/xXKEPxYCCo3yTrcVRrV?=
 =?us-ascii?Q?y1x0orn5AXppqjmk4Pol+nQgbtswA8ILeYDHx9Sa7JXIQDj7bQV9CRfcHnMO?=
 =?us-ascii?Q?h4XfSo6ZuBvL/wmIhjuWykxqX3qMJ23S18bK5nWUvzPtlIWE9EUB9055asDP?=
 =?us-ascii?Q?Sl0vzp+aDvTApcHocYbgk+Swk+kTezyLlG0Oy/ZiHKoB9v0Djxj18Ih54dyv?=
 =?us-ascii?Q?DoFLTXGCJ0WnwjH5SJdR2G+WcyPbxlUdbvp/5X/bzXsAiSNkRTXizgrXCmSw?=
 =?us-ascii?Q?8iw5JwWpFZk6ta/O8e3+Ngzr7t/hspoZ1sVWyy7/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c59bdfa-710e-4582-38ef-08db7bb9457a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 11:33:07.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PO0ffHhTGW9AGnmd8SjGBd7rjye1AiK5PId2Ja7eVWDhKsN5n/LwdghMtZp70FmvTmU9kHpJLWbMehVgdnrdDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8502
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/media/platform/nxp/dwc-mipi-csi2.c | 1384 ++++++++++++++++++++
 drivers/media/platform/nxp/dwc-mipi-csi2.h |  289 ++++
 drivers/media/platform/nxp/dwc-mipi-dphy.c |  195 +++
 6 files changed, 1892 insertions(+)

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
index 000000000000..f03a23d9ef71
--- /dev/null
+++ b/drivers/media/platform/nxp/dwc-mipi-csi2.c
@@ -0,0 +1,1384 @@
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
+/* Set default high speed frequency range to 1.5Gbps  */
+#define DPHY_DEFAULT_FREQRANGE		0x2c
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
+struct dwc_csi_pix_format {
+	u32 code;
+	u32 output;
+	u32 data_type;
+	u8 width;
+};
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
+	csidev->pg_enable = false;
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
+	if (fwnode_property_read_u32(ep, "fsl,hsfreqrange",
+				     &csidev->hsfreqrange))
+		csidev->hsfreqrange = DPHY_DEFAULT_FREQRANGE;
+
+	dev_dbg(csidev->dev, "data lanes: %d\n", csidev->bus.num_data_lanes);
+	dev_dbg(csidev->dev, "flags: 0x%08x\n", csidev->bus.flags);
+	dev_dbg(csidev->dev, "high speed frequency range: 0x%X\n", csidev->hsfreqrange);
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
+ * Pattern Generator operations
+ */
+
+static ssize_t pg_enable_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+
+	return sprintf(buf, "%d\n", csidev->pg_enable);
+}
+
+static ssize_t pg_enable_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t len)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	int ret;
+	u8 val;
+
+	ret = kstrtou8(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	csidev->pg_enable = val;
+	return len;
+}
+static DEVICE_ATTR_RW(pg_enable);
+
+static ssize_t pg_active_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	u32 val;
+
+	if (!pm_runtime_get_if_in_use(dev)) {
+		csidev->pg_active = false;
+		goto out;
+	}
+
+	val = dwc_csi_read(csidev, CSI2RX_PPI_PG_STATUS);
+	csidev->pg_active = val & BIT(0);
+
+out:
+	return sprintf(buf, "%d\n", csidev->pg_active);
+}
+static DEVICE_ATTR_RO(pg_active);
+
+static ssize_t pg_pattern_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	char temp[16] = "vertical";
+
+	if (csidev->pg_pattern == PATTERN_HORIZONTAL)
+		strcpy(temp, "horizontal");
+
+	return sprintf(buf, "%s\n", temp);
+}
+
+static ssize_t pg_pattern_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t len)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dwc_csi_device *csidev = sd_to_dwc_csi_device(sd);
+	char temp[16];
+	int ret = -EINVAL;
+
+	if (sscanf(buf, "%s", temp) > 0) {
+		ret = len;
+		if (!strcmp(temp, "horizontal"))
+			csidev->pg_pattern = PATTERN_HORIZONTAL;
+		else if (!strcmp(temp, "vertical"))
+			csidev->pg_pattern = PATTERN_VERTICAL;
+		else
+			ret = -EINVAL;
+	}
+
+	return ret;
+}
+static DEVICE_ATTR_RW(pg_pattern);
+
+static void dwc_csi_pattern_generator_init(struct dwc_csi_device *csidev)
+{
+	csidev->pg_enable = false;
+	csidev->pg_active = false;
+	csidev->pg_pattern = PATTERN_VERTICAL;
+
+	device_create_file(csidev->dev, &dev_attr_pg_enable);
+	device_create_file(csidev->dev, &dev_attr_pg_active);
+	device_create_file(csidev->dev, &dev_attr_pg_pattern);
+}
+
+static void dwc_csi_pattern_generator_deinit(struct dwc_csi_device *csidev)
+{
+	device_remove_file(csidev->dev, &dev_attr_pg_pattern);
+	device_remove_file(csidev->dev, &dev_attr_pg_active);
+	device_remove_file(csidev->dev, &dev_attr_pg_enable);
+}
+
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
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
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
+	dwc_csi_pattern_generator_init(csidev);
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
+	/* Remove pattern generator device attribute */
+	dwc_csi_pattern_generator_deinit(csidev);
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
index 000000000000..cdb85d867f22
--- /dev/null
+++ b/drivers/media/platform/nxp/dwc-mipi-csi2.h
@@ -0,0 +1,289 @@
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
+struct dwc_csi_device {
+	struct device *dev;
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	const struct dwc_csi_plat_data *pdata;
+
+	struct v4l2_subdev sd;
+	struct v4l2_async_notifier notifier;
+	struct v4l2_subdev *sensor_sd;
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
+	bool pg_active;
+	enum {
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
+
+#endif /* __DWC_MIPI_CSI2_H__ */
diff --git a/drivers/media/platform/nxp/dwc-mipi-dphy.c b/drivers/media/platform/nxp/dwc-mipi-dphy.c
new file mode 100644
index 000000000000..cc443f282bb7
--- /dev/null
+++ b/drivers/media/platform/nxp/dwc-mipi-dphy.c
@@ -0,0 +1,195 @@
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
-- 
2.37.1

