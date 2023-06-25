Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 669B573CF32
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 10:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbjFYIFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 04:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbjFYIF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 04:05:29 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2111E75;
        Sun, 25 Jun 2023 01:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIbcdoqy8fY67vl1Fh2tDWdEX/tvYEylUXBNhYgBsV6b1qvnMj4AXe6vLecv1iN89IDCP3PMmMvfNgun2BjfJehd23UX4O4hAS6ZMoy6D3BXDFLP1BBuOPqlDR9ZzoV6hzDnEj+jB9XcdEmD7Vn1cn3tLqUbRHLKcDf6tqaSbwD8YGYchaUHlNqyAJDA7qLqJn+O5kz95r9c7vP0gUlNf7gKinlv1UPDbEQIWn2Y1pCmQthM48h5n8QfdNEHEB7iJzNS3QX6e3gFb+5WO5HlXzDtSM9rEQVN4h8yAPTZt5GO9LBajOdk/pIObRVftgi9VsDiAfurCSUuU4eEItpjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPSTbUaYEqv+wMQXDxOJB34wd+ZBrnmZYuWFvOTlnWk=;
 b=BS4hGNUZyt+YRniZ47/G8vhtr5hpgGoRkbZvPW0FhBhJ5boMEWYdACXQqyWTvAF8R9t0JFtOnDVMbNgoimevg+Qid0IyHgR/fJVuqmdi59wcZimu2ykRov3pnnldEKrTqc2mv3X+AWvJJ9FkliKMGloPM5izVgErj31JuAgvMDymMWR2024gBprZyd/zHFCIYA5QU3o7kCbnQVWSFM2Gd/jqGqorrkxEr2Diz90zyOEuTa3kveP/XwIKTfxFTGqu27Rhr149SlbrxID1UpxSOQNOLUMjJBn80xcK5PBR/BNAo5ySgEkOD8+XjUK625MuTmckMp5C0zGZXMsjNOnWIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPSTbUaYEqv+wMQXDxOJB34wd+ZBrnmZYuWFvOTlnWk=;
 b=IYwvAXhUuilWEe7IGgN0/tQV6yGIj7CoCDe9jeozjegbrc6ug1kwOljnFMDK940vAJuLkteVOlLvR4zbNwGRbxCv19D6WIWle2pLavHnPpcteLfYA4MMPc6Gx/vgbR1aDX5t+HGgcMyYEwFrV5++fz4UBoPgMKkk7LkgYqOY33c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB9279.eurprd04.prod.outlook.com (2603:10a6:102:2b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 08:05:25 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Sun, 25 Jun 2023
 08:05:25 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH 4/4] media: nxp: imx-isi: add ISI support for i.MX93
Date:   Sun, 25 Jun 2023 16:09:16 +0800
Message-Id: <20230625080916.3553621-5-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ecf06e-e054-4166-8e81-08db7552ee49
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U1sZOYg+V9O5KTy/Txfy0EW66NWJWFr4g4dMmpNg9X1WTIlgxKReqMRp16b5WDGH9CGOQL2+PhxA9JrpKY+c6emvPMAlphYcfn/jZ1BzQ9DwtAiE692tDtaj4iWWeY5+N3xSWcJEPIqWVIXkFhnW1l4WXv49l+LU7LHvDf7CgjzUJtSeO1Ee1LzwatGpuROicA2FVNY1MFElXdhlOgdlX5hle3H8IFE6QEcRQlbQGYPTWcVKENCr0N30n4Hqns17d9VWcHBta0OgcjYGIlAnq89G9z7seCeIEBvVKTt5kE1ID1E07iNBl+36MkGImAYEw5zXK8/ZJa2GlhNSHFeQ8/RL9/JBpOfXImUs3lgFYOgZl/bPBn03l4Js/5jAVBuQylYqB9MB1o0zNsTgdejwJ1KQGVpD/HPC4gMkcA2KwSVldjR1bIXrec8ZhYZijsTSozFTh6M+PdLyjFB4egicpWvEAGeS2uIpr0JesqGcFB95Vcgm98wTeSnzeqR0GYzFrQIQC0dDZwUHtz0+DDY4qMprXpP0zHB/60TNMRyxIt4/0tsdK2E1rWywm5vPmUu/SO048p/NEgMVfiTNP4JaZisOk7YQCjEI17t1amfscf5vsol8c1mlWXp8kQSpwYLg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199021)(8676002)(8936002)(66946007)(66556008)(41300700001)(66476007)(316002)(4326008)(6506007)(1076003)(26005)(6512007)(9686003)(186003)(2616005)(478600001)(6666004)(52116002)(6486002)(2906002)(5660300002)(7416002)(38100700002)(38350700002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zTPgCjdUxnFUEZ9OBcOrAnhFwYVqetb9KN8gCUo+r4oZkf6sN/so4yLP4Oyq?=
 =?us-ascii?Q?WyMchmBsFxPr+CsZ8muk2Nylk5FA24X0ryeog3gJ2z98ZkjHMttuXhxHEmOt?=
 =?us-ascii?Q?QCjST+nfyU/A1ovM74By9Ml5f6yvQtGIXZVO/PpzOJl53DUqau3lYZhbb4Ln?=
 =?us-ascii?Q?Wbhzc5Yygx1K8HmNBIk5oj3zihlW4xK5GlwR6OJkE6GhDOU+PoT58FnuYC0L?=
 =?us-ascii?Q?BA7FcN14mWqPcUeiBgzNLUf3y5nJ4NjRGorziGvFT2d1B2KnQzHsguTUdrqp?=
 =?us-ascii?Q?8yDRBiK/4wvVfCekJbyhDsW4zpiTBnywNl6B7VVce2Dn7jYraNTGYWj59nqS?=
 =?us-ascii?Q?czwHv/y5E934aND5xNfAt42jsmR8lIQ9RNfly055Zrw6vtYUoHWMFlzon8Pq?=
 =?us-ascii?Q?Nl5qSmlizgPWgUTJ7uskni5aycx32+BN6BvqhAYP0K3cITad5+spX6DVXQR5?=
 =?us-ascii?Q?5/0ryipd/buGF3K5YTpTZp2lLU9OTYvlJTHhXjmRkMgWrRlcTs3lpAZOGT+T?=
 =?us-ascii?Q?AGbIN0/K1y/W2CFNdRPpG5YuMYmcp0WOApuisuTynGWov26ifzYHz77YlEFg?=
 =?us-ascii?Q?KnXrx1a9CAavbfblhjWnHdu4tw1fbEkY5wHTI8WZk4PIBPjXfSAAAjROI5HE?=
 =?us-ascii?Q?eADoocw2qnexov82Ql8atQPfwLK795OwEV4jKVTiMALZE8JuT0zkYsxFf5ls?=
 =?us-ascii?Q?iPRIPiQ68PY/hc7Ea/8qBi6F53fLwC5iAP0Igb1F01bIMYVsZqUL4iyaNq1g?=
 =?us-ascii?Q?wIF0BCas38inzFDDgIqdc/zOXIH/lINokf0FcqmA3UeZ91qEA2ENF49a1Oup?=
 =?us-ascii?Q?JdCXMwbVv2hJwsbaRKjBQ2aVzp5U1fO6atCnWoCXct0UYH/TdI6WSjTxyn8H?=
 =?us-ascii?Q?zH9NJiq+pvv8xTorBlGga9C+kUcrdh8gHMH8yJMCmoWKPSpyprCNkSmGjwfb?=
 =?us-ascii?Q?K/MpexYWtLF1YzR3fk/fE3chEE4rpi9aEaXvmoeIBrAJ3sfBcvQrB3W4NTSB?=
 =?us-ascii?Q?QSxExMt+NX2hTy+E4vYvdDUGqLVK6vOtIPzL2IRc0Bii0Ae14Opn62xX9T0b?=
 =?us-ascii?Q?dfZjLgn1f6uqgZ5a4VKQ5+zgI7Q8tDCZZLlEzah6v2orn2t/qQIXFEarOJ3v?=
 =?us-ascii?Q?uQrYL05oVN4wclTx52/dk5x1lBBRcI4j1gxzD3bzI1f0Zw8m/WOj+2emXO8h?=
 =?us-ascii?Q?GnpDaD4PZjXlzEEdFOxMYr2er8O4zpOSMSJv3D4VXW7WnJMBC0smpPsrssxm?=
 =?us-ascii?Q?e5VEgZWMShsPqSCy9ibSicMhmyl5uU8b76trF8GnrXYFJjJl1S6JV8kzMfd0?=
 =?us-ascii?Q?l4WLp9MLOlSascLX5ofIYMwHwkTOFEvTgFbgnvufjq+ymLjp11n1V4NwrQRW?=
 =?us-ascii?Q?3b/EVsmznB7tKLvIRDAO2qHx1mpCzT+GVuA60qjWfz2UjN2LR6ZHDJULu8kK?=
 =?us-ascii?Q?fjdIope3PW2uMQks8FiUyoiayOS27qyYmfMzj6XiNbLAc08TMD7xvO7DXfzC?=
 =?us-ascii?Q?uqPfRbTD5QLA2hBtQAclhirX3Oj3yJyjMuGx1xjlKLodkoANnDm5Q0D9ZUOz?=
 =?us-ascii?Q?3/vzuQPRZ5n7wHK0idREhFtF/ykrltl2KyApjjep?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ecf06e-e054-4166-8e81-08db7552ee49
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 08:05:25.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0Qn4cM/fNOjqn85sBzGt1RyuiM9GtMJhz7eaA+lZEROwEosuUU9ukQSTXGDdKebt6KwCa8MRXAKrUtH4f6D6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9279
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Abstract gasket operation and driver should implement them for SoC
which support gasket.

i.MX93 use a different gasket which has different register definition
compared with i.MX8. Hence implement the gasket callbacks in order to
add ISI support for i.MX93 SoC.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 .../media/platform/nxp/imx-isi/imx-isi-core.c | 110 ++++++++++++++++++
 .../media/platform/nxp/imx-isi/imx-isi-core.h |  33 ++++++
 .../platform/nxp/imx-isi/imx-isi-crossbar.c   |  51 ++++----
 3 files changed, 169 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-isi/imx-isi-core.c b/drivers/media/platform/nxp/imx-isi/imx-isi-core.c
index cd5678139ddf..1fc0d2a67042 100644
--- a/drivers/media/platform/nxp/imx-isi/imx-isi-core.c
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-core.c
@@ -14,6 +14,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -279,6 +280,54 @@ static const struct clk_bulk_data mxc_imx8mn_clks[] = {
 	{ .id = "apb" },
 };
 
+static int mxc_imx8_gasket_config(struct mxc_isi_dev *isi,
+				  const struct v4l2_mbus_frame_desc *fd,
+				  const struct v4l2_mbus_framefmt *fmt,
+				  const unsigned int port)
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
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
+
+	dev_dbg(isi->dev, "w/h=(%d, %d), data type=0x%x\n",
+			  fmt->width, fmt->height,
+			  fd->entry[0].bus.csi2.dt);
+
+	return 0;
+}
+
+static int mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
+				  const unsigned int port)
+{
+	u32 val;
+
+	regmap_read(isi->gasket, GASKET_BASE(port), &val);
+	val |= GASKET_CTRL_ENABLE;
+
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
+
+	return 0;
+}
+
+static void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi,
+				    const unsigned int port)
+{
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
+}
+
+static const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
+	.config = mxc_imx8_gasket_config,
+	.enable = mxc_imx8_gasket_enable,
+	.disable = mxc_imx8_gasket_disable,
+};
+
 static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.model			= MXC_ISI_IMX8MN,
 	.num_ports		= 1,
@@ -290,6 +339,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= false,
 	.has_gasket		= true,
+	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= false,
 };
 
@@ -304,6 +354,65 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= true,
 	.has_gasket		= true,
+	.gasket_ops		= &mxc_imx8_gasket_ops,
+	.has_36bit_dma		= true,
+};
+
+static int mxc_imx93_gasket_config(struct mxc_isi_dev *isi,
+				   const struct v4l2_mbus_frame_desc *fd,
+				   const struct v4l2_mbus_framefmt *fmt,
+				   const unsigned int port)
+{
+	u32 val;
+
+	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
+	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
+
+	dev_dbg(isi->dev, "data type=0x%x\n", fd->entry[0].bus.csi2.dt);
+
+	return 0;
+}
+
+static int mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
+				   const unsigned int port)
+{
+	u32 val;
+
+	regmap_read(isi->gasket, DISP_MIX_CAMERA_MUX, &val);
+	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
+	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
+
+	return 0;
+}
+
+static void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi,
+				     unsigned int port)
+{
+	u32 val;
+
+	regmap_read(isi->gasket, DISP_MIX_CAMERA_MUX, &val);
+	val &= ~DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
+	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
+}
+
+static const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
+	.config = mxc_imx93_gasket_config,
+	.enable = mxc_imx93_gasket_enable,
+	.disable = mxc_imx93_gasket_disable,
+};
+
+static const struct mxc_isi_plat_data mxc_imx93_data = {
+	.model			= MXC_ISI_IMX93,
+	.num_ports		= 1,
+	.num_channels		= 1,
+	.reg_offset		= 0,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8mn_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
+	.buf_active_reverse	= true,
+	.has_gasket		= true,
+	.gasket_ops		= &mxc_imx93_gasket_ops,
 	.has_36bit_dma		= true,
 };
 
@@ -518,6 +627,7 @@ static int mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
diff --git a/drivers/media/platform/nxp/imx-isi/imx-isi-core.h b/drivers/media/platform/nxp/imx-isi/imx-isi-core.h
index 2cb0caf44c42..bbe939e91850 100644
--- a/drivers/media/platform/nxp/imx-isi/imx-isi-core.h
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-core.h
@@ -18,6 +18,7 @@
 
 #include <media/media-device.h>
 #include <media/media-entity.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
@@ -59,6 +60,27 @@ struct v4l2_m2m_dev;
 #define MXC_ISI_M2M			"mxc-isi-m2m"
 #define MXC_MAX_PLANES			3
 
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
+/* dispmix_GPR register (i.MX93 only) */
+#define DISP_MIX_CAMERA_MUX                     0x30
+#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
+#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
+
+#define DISP_MIX_CSI_REG                        0x48
+#define DISP_MIX_CSI_REG_CFGFREQRANGE(x)        ((x)  & 0x3f)
+#define DISP_MIX_CSI_REG_HSFREQRANGE(x)         (((x) & 0x7f) << 8)
+
 struct mxc_isi_dev;
 struct mxc_isi_m2m_ctx;
 
@@ -147,9 +169,19 @@ struct mxc_isi_set_thd {
 	struct mxc_isi_panic_thd panic_set_thd_v;
 };
 
+struct mxc_gasket_ops {
+	int (*enable)(struct mxc_isi_dev *isi, const unsigned int port);
+	int (*config)(struct mxc_isi_dev *isi,
+		      const struct v4l2_mbus_frame_desc *fd,
+		      const struct v4l2_mbus_framefmt *fmt,
+		      const unsigned int port);
+	void (*disable)(struct mxc_isi_dev *isi, const unsigned int port);
+};
+
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX93,
 };
 
 struct mxc_isi_plat_data {
@@ -160,6 +192,7 @@ struct mxc_isi_plat_data {
 	const struct mxc_isi_ier_reg  *ier_reg;
 	const struct mxc_isi_set_thd *set_thd;
 	const struct clk_bulk_data *clks;
+	const struct mxc_gasket_ops *gasket_ops;
 	unsigned int num_clks;
 	bool buf_active_reverse;
 	bool has_gasket;
diff --git a/drivers/media/platform/nxp/imx-isi/imx-isi-crossbar.c b/drivers/media/platform/nxp/imx-isi/imx-isi-crossbar.c
index f3e3ed080b07..f3b49ff132d4 100644
--- a/drivers/media/platform/nxp/imx-isi/imx-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-crossbar.c
@@ -25,20 +25,6 @@ static inline struct mxc_isi_crossbar *to_isi_crossbar(struct v4l2_subdev *sd)
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
@@ -46,13 +32,16 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 {
 	struct mxc_isi_dev *isi = xbar->isi;
 	const struct v4l2_mbus_framefmt *fmt;
+	const struct mxc_gasket_ops *gasket_ops = NULL;
 	struct v4l2_mbus_frame_desc fd;
-	u32 val;
 	int ret;
 
 	if (!isi->pdata->has_gasket)
 		return 0;
 
+	if (isi->pdata->gasket_ops)
+		gasket_ops = isi->pdata->gasket_ops;
+
 	/*
 	 * Configure and enable the gasket with the frame size and CSI-2 data
 	 * type. For YUV422 8-bit, enable dual component mode unconditionally,
@@ -77,16 +66,23 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
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
+	if (gasket_ops && gasket_ops->config) {
+		ret = gasket_ops->config(isi, &fd, fmt, port);
+		if (ret) {
+			dev_err(isi->dev,
+				"failed to configure gasket%d\n", port);
+			return ret;
+		}
+	}
 
-	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
+	if (gasket_ops && gasket_ops->enable) {
+		ret = gasket_ops->enable(isi, port);
+		if (ret) {
+			dev_err(isi->dev,
+				"failed to enable gasket%d\n", port);
+			return ret;
+		}
+	}
 
 	return 0;
 }
@@ -95,11 +91,16 @@ static void mxc_isi_crossbar_gasket_disable(struct mxc_isi_crossbar *xbar,
 					    unsigned int port)
 {
 	struct mxc_isi_dev *isi = xbar->isi;
+	const struct mxc_gasket_ops *gasket_ops = NULL;
 
 	if (!isi->pdata->has_gasket)
 		return;
 
-	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
+	if (isi->pdata->gasket_ops)
+		gasket_ops = isi->pdata->gasket_ops;
+
+	if (gasket_ops && gasket_ops->disable)
+		gasket_ops->disable(isi, port);
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.37.1

