Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E217741DAA
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 03:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjF2BcL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 21:32:11 -0400
Received: from mail-db5eur01on2043.outbound.protection.outlook.com ([40.107.15.43]:56337
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231522AbjF2BcK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 21:32:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTiE2IciZu7NxH7UW/x+vtNqLD3GJseR+ftZD7jk8abhQVOvbPnafjtS/qOlDZjO8SQzNYRmeDJFH1cNTJpacWDq6gaUAOghcTkjwM6shvpsZF12hmD9RAS9jO8n5DwS85BF3CTejvJfBDCTGAHxItF/aH0eqRAc7B8IBRDkdaZ6DOeg+jmZLFMEVYzPyFKIfYuvEAx1Lchv1nQjDAzvdQ0PcWOZ+kB8M0tSaLzWys/lgUwIaph9WusnWmaUqnEgvuiNVBi5FWumbdCPPtUsu0F5PDAK/01f9dK4z/bvsPcH1nzxfbGthDXpDnZ7xzbJU7YIOahSeI6BxAaJJt/69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxZ4M46YMxmifmxbgAGK+JusjyNcRHhmW9e/FxgEmnA=;
 b=DnHtJe6U+sacxiby2UT0X7cq2hFblnbpd2pBii6MA6cZPctdjbrmmvK16QknR6hBpCrfWl0fpHRiSSPnoBkvMNqnIeNudkwWEIyN+/tpQiMi4yfBlWDdj3Gll9XVlH5kL2yuY/gGyZQ8JUHLIOzGTd3bc9V+v944KY5l5yuaIFeqyub4mpjOvvM65XF+28xZBt/i6PpqVezfGy5wVM7I/bpHgaQ178jRiPMDs7TjPk8PVRmMOdxrKHsRdB3y8Q3fQU5odiar3aRFYhwFSZzSaKKcaRu+bM/5fU1xotWeto5fqB808GSndxI8ZSK9xx2eK/trWXoSHfn49JVSF28KUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxZ4M46YMxmifmxbgAGK+JusjyNcRHhmW9e/FxgEmnA=;
 b=Of/2c75yFh89iNdftl/Ac9kede4YOpy3AWUCq7Wxu2zMu3CY5q2ASVwSQP8k7gQbKtEmbwRpu2AdPiAoDQ+X5Nikz6DYeF8K996Sw7sKpD+ziTE9AmWJ6wZYacQGkEI15nzMeejeglmc1orHO4v4AUmldpYDQ3hOPOxqE8qoTmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 01:32:07 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6544.019; Thu, 29 Jun 2023
 01:32:07 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v5 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Date:   Thu, 29 Jun 2023 09:36:21 +0800
Message-Id: <20230629013621.2388121-4-guoniu.zhou@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c38ea6cc-2c89-42f3-ae2f-08db7840a6c2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NqnjBWU14ogmOwy6wUblodX+R6IY1fNLgehSRU3i2s/fFBmOH3OrcMmb2PAbq6HFW61JGUgilz4dk1fKLiokkZFKB0zwxG3XO+tgdzBaknenWku/A4q9o0X0jn65AUDLvFzS/Iyw+8o8YawN12jSvUaa8WC/WSkICAymHAAX4Z3KR/PnSJ47P4R/liNM3asxPlxflpDMA46R+ElCuwE4C6hK+Z67S+5Hk2hH8DxTpbsj2UvBwb+d18YOHXIGwkrYiy8gwqRbndAzKM1OU0DoIS3Yv8TipXKC2dgfy6ODwsmoeswPUcmXd/rDdFEoHu7yvIH1hQhNL1FKq4dDLUZ0UmLBIlgkD1EK3OiqfIyONK3+epb1n4J4eS1IB4wWimZq5bpdVWwHjPdL30do3RDO0lc3OP/7SzI3T2NTnF2nmObdxfapVAvmVgQpzi+A5XOVD+S+G2iWky+BuamdEZb7jIRrSJ2qjdKJCeVHeaJp4Qy/VXSLgDqA+h+DdkS6YJvF9HQJgL+Gr9gqudxXONtpiHe1lovBiPQ3wuEJnkgzbjAtBER7NhkaV1EH/VZ4qPTZcV+Qvynttwtj7ebLem8rhPTTRaOXgnBFXk1mqm4Nd6xVksBQ+aCDYuoT8XBGW1sR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199021)(6512007)(1076003)(5660300002)(7416002)(66556008)(8936002)(4326008)(66946007)(316002)(66476007)(8676002)(478600001)(6506007)(86362001)(2906002)(41300700001)(26005)(52116002)(6486002)(186003)(9686003)(2616005)(6666004)(38100700002)(38350700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fmIzfNCH0XKsje43I8/Ji3RmmT61KgKZaX0reWeJ0yBQy3cEeSSNwk9qzF/j?=
 =?us-ascii?Q?Fa7VHqw0dwRPZWZYBxWnraqQ1nvRPk70qy2egr4TaZHuF7wsk/FM0qyPyWuJ?=
 =?us-ascii?Q?YhtDuF4/aCAIUvqMgpNIY24CUbIQViATvR6P7BaIyQA+AKSTo4Wf0XgPl3fc?=
 =?us-ascii?Q?7D7N6FbUzOs7SWRaQDhGhau+whwdQe3IwSjRhB+Rf7xrj6p2xp6MFzEEWlkA?=
 =?us-ascii?Q?SIP5L6Ry4YXrAb90Js1Vhc8fakktQTr4N7km2VeXyKkj7R5/eOjUVrojYaOY?=
 =?us-ascii?Q?AGezIGiezO1c3RI6AMhey91I3V6FXT1Roy/MlJfF5PlMUeU/jE4HD1DRmo0m?=
 =?us-ascii?Q?aJ5+mW2XUQnTBgoOTXkwY1yPNTMyn4Tt+qc/MbmAIK67YuUVxikwKsQhEcSv?=
 =?us-ascii?Q?SlX4+qCK9LtqjdDb3iLgQXFwhI42EzQeWbWnJbKw1yKbZg0PHGdRDo8cglfB?=
 =?us-ascii?Q?X39esAnr2dnMKJX8x7z4vn+c0T2KchX22Ve9mzJu+RpMDynYieeN58CrydhS?=
 =?us-ascii?Q?EcBAmybi0tIluEDvOc0lEj20JCrigMPXNZkLD/lxQu9TEjzbqakOYaHFhN17?=
 =?us-ascii?Q?elmYWSvIBWAvt0M0UfXR+hH1MNX+r038HaUcmeEZt1lbSlPJF2+hUtD6PXt1?=
 =?us-ascii?Q?06PWJpGpic54VPpGv+08XvcWgryHBHI2e9TjKB5lPyjkp6OWolh+fzW2l4M6?=
 =?us-ascii?Q?os8lYGwfsN6mc5ee0CHghZw60dLDFtZqQkasDpSnkZPdpNja9VsSULrgWeew?=
 =?us-ascii?Q?xKXFrpQVMrgkBTNefzIyNbNxP+RHq2My/hqYkbXXMFTg4gN04XgCbVWxBbEs?=
 =?us-ascii?Q?j2vcPJMK3yK2IDG4TeHJm5orskY7VzaLxfUyDdnnQvYlzmNwO0e/5xw6sfOE?=
 =?us-ascii?Q?1nfYP5J2s644cDr6E/Jok2rkl0vFpuY66q09mFvRzh166ljQoneQ1H9Ax7nW?=
 =?us-ascii?Q?On3SHhNnhGMxqVpv5cy6GT9M0prya2qFavMWqDBMBLaZQH5ku88a0MeE4rFR?=
 =?us-ascii?Q?86zZtcO+VIMsXtyjK8bz7cJ88gzVbMszC2YXqAjI9FVF5m3l1fTVGrsiibBT?=
 =?us-ascii?Q?OpqDN+XveplK24O8O1m+PtKjgJ3VycRN/RFCOF1MT/6OE3n8FF8ewCoD+GiE?=
 =?us-ascii?Q?Qm9VXGwOio2bwM/1vDMyztbYoLKRejq8OKP2ZH5ZHCCmflNifru2tbwdDHtC?=
 =?us-ascii?Q?FPzei5geSyZt+nlXnQ2OtueBcrB6UL0rdYlChUG17Uc9ix9DevOCigxg0nQk?=
 =?us-ascii?Q?9IEwzcrzk0gA6YkKhuaFWWYLKpjVDmY/u7Cg3BohKjmidU15Suz0C1P3Fggz?=
 =?us-ascii?Q?as20za9oAiKTAFLrFsJxmypEZ6kepq8ZS6JBIrtxBnZAEx3zP9949oCtKKO0?=
 =?us-ascii?Q?Yj2vfeLFlVsDZfqzCgDrFVKIXQ6Nee4TWMguycEavYBHHOKv3cidfibjp+T3?=
 =?us-ascii?Q?HVfW+PD/Iy6zpabiQ3hMQXMY+lAIbcfJ4NWsAfC7pCkwpwFhtgdHWsDEaWM6?=
 =?us-ascii?Q?7lxx7cgnZaZ3DOsDuxrNyOmf5MG8WLa6HTnCLf13ghSEFHt6zwNhgrTrZqPA?=
 =?us-ascii?Q?ZK0w9TVYW+W+gP9RIhVESr7H1zK/GghTaMoKmQr4hzeNrX+YnGyjPA9g4gD4?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38ea6cc-2c89-42f3-ae2f-08db7840a6c2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 01:32:07.6455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: na8xfV/gdvPo5PmvLLjtJbeKeMwHDxGuv51MtT03ZtOed6zAwQjPA1dMFfJR7ehcZ3C2qtEP+ZHw4CYbb4x0ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

i.MX93 use a different gasket which has different register definition
compared with i.MX8. Hence implement the gasket callbacks in order to
add ISI support for i.MX93.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 15 ++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     |  2 ++
 .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 30 +++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 5165f8960c2c..27bd18b7ee65 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -307,6 +307,20 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
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
+	.gasket_ops		= &mxc_imx93_gasket_ops,
+	.has_36bit_dma		= false,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -518,6 +532,7 @@ static int mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 78ca047d93d1..2810ebe9b5f7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -158,6 +158,7 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX93,
 };
 
 struct mxc_isi_plat_data {
@@ -295,6 +296,7 @@ struct mxc_isi_dev {
 };
 
 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
+extern const struct mxc_gasket_ops mxc_imx93_gasket_ops;
 
 int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
 void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
index 1d632dc60699..50ac1d3a2b6f 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -53,3 +53,33 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
 	.enable = mxc_imx8_gasket_enable,
 	.disable = mxc_imx8_gasket_disable,
 };
+
+/* -----------------------------------------------------------------------------
+ * i.MX93 gasket
+ **/
+
+#define DISP_MIX_CAMERA_MUX                     0x30
+#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
+#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
+static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
+				    const struct v4l2_mbus_frame_desc *fd,
+				    const struct v4l2_mbus_framefmt *fmt,
+				    const unsigned int port)
+{
+	u32 val;
+
+	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
+	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
+	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
+}
+
+static void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi,
+				     unsigned int port)
+{
+	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, 0);
+}
+
+const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
+	.enable = mxc_imx93_gasket_enable,
+	.disable = mxc_imx93_gasket_disable,
+};
-- 
2.37.1

