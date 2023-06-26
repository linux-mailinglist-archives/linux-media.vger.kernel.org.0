Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D6B73D648
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 05:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbjFZDXI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 23:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjFZDXF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 23:23:05 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2049.outbound.protection.outlook.com [40.107.8.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8C111C;
        Sun, 25 Jun 2023 20:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvgqhveWgxVhRbqAKbg0mwSmKXzc1RAbtNSEXm78ipCDHJLHurjYB5jxmmCvXLk/46VgAIohMwlR8Tz14D66Hzo0+I4VttidQRVdmG+k+KeugI8js1FRE4yg29f/El366STC2zIiA9jj3MWv5kW9IaLanVSjHBjF3+exAuR5c65IL6hTcqMz8lQUujCDdSSs31q8Dp+fbgMy/yZ4IbXZZSIworRV2IT8vf6I3VCiOsJpaVV+f1P6mSs9PseF65Ky096GYGbrVJ0Z4oE0vFkb7GXnhHiNsyrxmo0LhhezKNqfzK9EXZyMVpJvHqByme/A0FFoqjU6Hby6ZWVsFD/NOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=micHhjmDC75HB8PMRqUMgXVdZH1/EEGAlGh0nOM5jHE=;
 b=FapT020St3pIokdz/drME5ehH3SQbika83sMlI6QQSkfXHTKdLzS6XLMnipZVU4cnTuTAMvcuuIbybsWT0Z+ijwDs73WLKYv1fhyFLYDhlv2Ajro63zGUQ42DguS7Un4IDU2bX2Z9/iYf+3djfeC77jAOma3oUma2kMsEVzMGhY1SoNPxxVhvSehVvo2i9RK8IrfFbkoHwPbDLAAm/tQ3odNpGh6hRO7b+rz4EM2rggyw0vvu8PFnozXvFdNYlLt0eQqQaWmdSgdtrtR3Jyo3B+4CL2BeNAHnhTIdFQZ5K+Hf8tUyYE+uJJwTXRTtnjjk1Wb+2nU/plrGFJN1flKWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=micHhjmDC75HB8PMRqUMgXVdZH1/EEGAlGh0nOM5jHE=;
 b=NnxlKg0B0Z+nmuVFxPhHVZ9Ax0TRS5MbLWPUNdcPQL82sRX7XGPsF2+dnaZmzpcGdhPePyruxk2Mge43NEG/4/SXAJgWaSeTEy1yBd/h4IOOf/SFGTkTF84qBc/DE9FuS3rV86Ao4/QA02Gm+XfJUFr6Q0A6vqCgeZ6/tWETfgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 03:22:59 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 03:22:58 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v2 2/2] media: nxp: imx-isi: add ISI support for i.MX93
Date:   Mon, 26 Jun 2023 11:27:35 +0800
Message-Id: <20230626032735.49500-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230626032735.49500-1-guoniu.zhou@oss.nxp.com>
References: <20230626032735.49500-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 103e4a18-d9a7-4271-590d-08db75f4a3e8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V5aWHCE2Qy34Gee6yzsMsFR+Vdl4xqyo2eSSZPJIpsygCwW53VMdw9SUw+uaqj2G7NKdSnmeRo3oQ7lfHvP05LuDddojLGeystaOFsE7Ms9Nr0+4sU5w5wBOtotRBOLBRmKskFWyequ9XRwaWsOT40Ffc/viajl/FajSM0kawaZ5elf5rUfG+vwkSRQ9+x8wm/zOZA9YMBPA3zelELbX5Ur7Xw0FLn9LLXJssgigAD3U+EIgucQ2/Lttnw17xykr5GAXy+XZp4ojYHyVk11U+paN5UoCt6DIgWfW2iqKDd8o+Ij/07gqq04Qz5iGgUnFS+s6zq25xwL0O2gGkVBVUA/anXXUS787+icEK1UTdKRHP07x90HqdGHtfPQUnHWumElpYwkXmOyvcGA+v07ljnbd+y9wqMlPiYOTEB9CJWTmTf2VMAWcHT4wT4+1m+bFHmwupXMiVgQcA03RLNL9PFvP1EuR1dbIIgoXbUtvhri3MBhGd5bvusrMrCWozzbwQf8WZY5Hgpfkm2SdRsAMiMXqOMJwWc2S6jz6HhKEk8iEXroWRCCiSv6/kqc3t14Wng0tAlwmgf5BRS00yJ8dTTq5KuwYz8dG1ed1UgKwD0sthoGh5YxMdSKC/7/Zs4J2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(7416002)(5660300002)(66556008)(4326008)(66476007)(66946007)(478600001)(316002)(8676002)(8936002)(6506007)(2906002)(86362001)(41300700001)(6486002)(52116002)(186003)(9686003)(6512007)(1076003)(26005)(38350700002)(38100700002)(6666004)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sEjFU8TkqIcsgFmGEdeOP+1OmUrwP+5PNVn65jwPiD0PaOez//sKL0LPBf1T?=
 =?us-ascii?Q?HR+ivt99GHcq6HQWBfCTRtwC2xOmMH8F3sfGjJB7RHqIen1sOUtGTGI4PceI?=
 =?us-ascii?Q?3uWZmGoG8iZo8ZB8PIQzKBHEznSKJmrhXdKLMhQXebwPCXf0JKg5iLXbJoxG?=
 =?us-ascii?Q?ET9DbsL+pHf4nU+6TVVp+gBgDtZXl9a8apGiRd0Gwc99SNX8tr9/Cy809a0v?=
 =?us-ascii?Q?LmGp5qwSzKVxLlt4YaINNjMJYJd6LPRKKuB3fhkys9LvHDaRR9/Bggm7Tq6f?=
 =?us-ascii?Q?N9HDURbX74MBxrrG4rGR1WdkqyBP/eu242lFmhVsF00qtc0sRnVsIrDiuv8I?=
 =?us-ascii?Q?v7ySBMkobuYw2PoTZbBmW6HbjXnTHUtUT/Ug06xpxyAkCDD8abDeIj/wVk57?=
 =?us-ascii?Q?Pz1w4y+R2QXgEHhjuNyEKwQTGi/iQToqQUHzm/CJcFMuxCEtEeY+GGzkIaRN?=
 =?us-ascii?Q?4mqe8Jbr4DGsNpCdE4iieE+0Dh822chtWpvTFMUqqN+IXZrUMSg4z6utENxQ?=
 =?us-ascii?Q?u1TTixBWrvU8wZhavMNqQVlNgSwz7xiRCuj8wxgcyfatqAGjzPXEARQrHZj+?=
 =?us-ascii?Q?FysRgVMuO1YV3a/JIQV4jp7kMC+lNYrlqbBR4vzX1x1yKfYuREteNDSsLUDU?=
 =?us-ascii?Q?WrgV2KyavD0NQh00LBncXVzHTWzZ3Unqb+WOF4jsVgMUa5q4x4dFd1bQZGLg?=
 =?us-ascii?Q?uQzqHUa7a2xhjSEFWfBCWhGGmbuJ7kQX2KDxmVWd8c65nqLbO0YOvYeKNR3h?=
 =?us-ascii?Q?iHqo9Nz4BdgFlBgiSdze5sLKVLVk4/I5uBGCWdVkqXYRANEOAgW5wqhN8XP2?=
 =?us-ascii?Q?CLn+HcgE3AjYZa9eb0/g+I5iY/TRJC9Pl2XW8KTJV2hFDgLm12LtYdiisgSQ?=
 =?us-ascii?Q?3dJ9uCtkguNx2IiwZ8cZprG2ybkFmGzuvnyjZCwb8mUD6/oTVy2K78ANcwTt?=
 =?us-ascii?Q?oaR88eFKlqy2UGXN3DRhGMooubuoJ9JAk5E62W8zwNNIO9LIKfL/b5u2d/2O?=
 =?us-ascii?Q?/5BrP/8ZgLg5to4akvNj7jMSVZNDE8UQYaVaDKqpeTUcQp1IhvTtP4vcQuA+?=
 =?us-ascii?Q?+fV7c6PuEpLoA1ddZf1BoJNhHQQ1UNP1aTn3C6Y+73cKziXvLgLGLt/XcePo?=
 =?us-ascii?Q?r3ISBCF2Y1iNGhXXU9QSqrnKg7flcZ6tyTUKmJwbGKqS6ujHam+RFJxp0f28?=
 =?us-ascii?Q?0XIsDd1AgzYfDvWvegC6AtsOx07ngcRziPYwQFEImvqltzJpwpaceFwA4Ynl?=
 =?us-ascii?Q?X5He/CbGiGm7y7dATAuuQ5o+jzckim6T51rHI2fVUa0U9wJ8RpqHhKoIOhI/?=
 =?us-ascii?Q?aQThQ/oqJNbxRnUYc2BeRih3yhawleHwXS7KZ+ERR+s98RMd7gIv1Je5u94V?=
 =?us-ascii?Q?CpvhKFHiJzsaJLKRMVSp4CEh4EepfMHG09m7zNipcBPI32bOa72FIcq501TI?=
 =?us-ascii?Q?J8oEieOUBcNuVNcsXKzsS9AeAlZtEHqJmWt0tv1VsxWfgGHwqjxsa7kthDUn?=
 =?us-ascii?Q?NcL89RWsO2lnEzaMNXS8OzXtjXCYhK5wPMRyrD7FyTIoDkb1B7h1S3SvbVAO?=
 =?us-ascii?Q?1daO091uNcSASHBTuJUfDTvrA6NBvbyydtBhhX0cXfrJ8sAysfSubCTenfu3?=
 =?us-ascii?Q?JQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103e4a18-d9a7-4271-590d-08db75f4a3e8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 03:22:58.7939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbclUOinPyubmU0RKmHeAzCCuVJmE9TQW7X7OwIFRfn/U2zdH9VT6nNuM6yIIRSn36Cr1+GTiGMAa9eKWCEetw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658
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
add ISI support for i.MX93.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 110 ++++++++++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     |  33 ++++++
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  51 ++++----
 3 files changed, 169 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 253e77189b69..d37145fb7f14 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
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
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index e469788a9e6c..c425edb6fbea 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
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
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index f7447b2f4d77..855b31e3dade 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
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

