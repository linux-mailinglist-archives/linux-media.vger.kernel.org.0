Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49213369026
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 12:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242026AbhDWKPI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 06:15:08 -0400
Received: from mail-vi1eur05on2044.outbound.protection.outlook.com ([40.107.21.44]:5155
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230057AbhDWKPF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 06:15:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bohBDqC5o2AQ+sO4ahV7IILD82bvBfTcklJ71jw6bF82ymTk7I2q/wSOR+HmGig+25fURalFm4aV6v5mCsqH1cRTXvDzymj8x7GSJ9dsAfP837zTE740TEnq35B8yUdtijGPSFbh1m9BztU4ZqxhjAQ/OMrXPb3imXDILHA7HoImBOTjwmfswOPHihPZFEf/q0gI19Mt6LHSbC1c+wwT1Fd1Y2w1hgtFKy7IUimz9HbIMWg0y5G+7YsiEFCu3UZ9M3hNONaHikPDnMBHuYqsCgMikh+77Ycf98jso0LImpUzhFiA+WnzvVys+EUjiRtwZKH7ilb79BO76Izj09mDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7zVdU3S1l0rPZD0SuCFtJGIzUepuhxXwNQtLnqG2M8=;
 b=VXECO7gJ/sVS9zaLzQRfUf8ugJ7yeh+IdBcjOIl9k9TPaCrEyE35K1um9LPe9YGtXoOS1NICZ5t5Wbl+p4vcc7tfmssDcPdAhGUgQVOd2RCtEnE6cpQJsMHMVD9vaHd+Fq/3HG/EI1+5SxMCwPrxXRodqQ9bE0pmJfxAKg0wWXAUarTnUJf9FoD0qJfVkmTaZwMNKrXfiX6ulalpSNpDC7ctLx31rXJWwz685z6DZhbPnn/QqU3gQWTjR6A0DpQyPJ7/lK/eSyiekfYU7BfVHxNDYAFz9MpIHAaTOXZbFmuDhSiuyLxjp7Zozh5j8UhNa0ygQbdVGbEwy4V3YcFAnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7zVdU3S1l0rPZD0SuCFtJGIzUepuhxXwNQtLnqG2M8=;
 b=f8DSUbpj+pddiCrsrJHU4bu38heyuEWRKa3Ys4wo5w4forDCYGgUmXxtygAGCgKcXEUOWVYnKHGFxYE9JybLhgiQ0w5GpNhoaF2s0v+7YkLU9P4pnuv60FUkU1aCcxO1oZ19fy0SZF/5XXnU7ImK/awh1qBmPFLA0K8G10icKSU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7511.eurprd04.prod.outlook.com (2603:10a6:20b:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 10:14:26 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb%5]) with mapi id 15.20.4042.024; Fri, 23 Apr 2021
 10:14:26 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, aisheng.dong@nxp.com,
        guoniu.zhou@nxp.com, linux-arm-kernel@lists.infradead.org
Cc:     peng.fan@nxp.com, s.hauer@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, p.zabel@pengutronix.de,
        ezequiel@collabora.com, Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Date:   Fri, 23 Apr 2021 13:14:14 +0300
Message-Id: <20210423101414.20068-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1PR0602CA0019.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::29) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1PR0602CA0019.eurprd06.prod.outlook.com (2603:10a6:800:bc::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 10:14:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6121e61c-185a-490c-4a23-08d906409317
X-MS-TrafficTypeDiagnostic: AS8PR04MB7511:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7511866F0D5D42C14F34E715CE459@AS8PR04MB7511.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tLFso8sgenS9zQ+UlSlSWqqVxGYPPXKg3s/ormWoN2cvGlkKz4jglwisQ1GSfF0XIpfr9EIZ/Ck4G1+7GGaGLYwt8wx2+wt9QsswjG/kv195Frk3h8rjQr4RpLCXOcbiq8WtfWxqq0/JRRPlTaU4Ojr6DW5rAWcFRPODneEivYT/DWBNt/zIG4j73ZmAiUiv1eLC5s/crvac5MZOtGrVcGC3geqPxUEoUtb+R9px/TViambbWfUD1stvBgMmYTlwwkQsrV2C9gsnp815LvyqyXUyo2OdiBDLPyX6nYPiX25ks/q9LwoWnC4CfdbrwrXlp4EuRGfCDkohwSJiHE8bPJ6E06lYlHLTC0wHAAUpMYqkpak7px0ub6W3J5R4MRsYq53Xnb1vvcV1vz2hNhK3DeidBPwTZqSwrqhtdh1Fa9dpOtD0iS3OdiF+Xxf4SIkqJbVkubJcEQcQL8oUYoJACVKtOzvuU8lv7HZke1eSSPGL1RIkL4PBN2OK/9jRlwstjZQtGGl74unhVriIWnequaZtcyVkZGoGO6xdxDJ6aQQSmy7aEJ6i3Gzh6ZX98oSSzNE6tQUZbWTkOMfVYG+pWxbK0pDjct1dh9olKWABxSpS5lymqoL0LdKMTTDZNGk2gwQ3ktwP9eAF5p5rRx8Lfa4L/nz7v5WwNEP//Vd+vGC5UTjA9iTUG3btPqQcWdMD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(6486002)(6666004)(186003)(5660300002)(86362001)(26005)(38100700002)(38350700002)(66556008)(2616005)(478600001)(956004)(6506007)(1076003)(52116002)(66476007)(66946007)(83380400001)(7416002)(8936002)(8676002)(16526019)(6512007)(2906002)(316002)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O2XFvuOQMbjbdrYS9hXHoYrVHRK5HOie0h4FaP02QGe3rk6fLS1Aa6Ewxdrp?=
 =?us-ascii?Q?OUxndKIsQZ8JBMNqISh5+64kGX9W617KMSeiik6eBP8uqP7rHDuejHQxAAGi?=
 =?us-ascii?Q?rFPCP1j2aHyYB/dWI+vQ+PUXDSageP+RtiMUX3TvCPUK5lDHZompQzH/oRs8?=
 =?us-ascii?Q?cyFLGNfcdBH15hxWjLMgZTpRFQzvIFEl8pIeodvjx3OOLhYxCvPcOov3pfPj?=
 =?us-ascii?Q?RByjz3oVLIMhxjZMfm1OhNhU5485J0cFKNsUJzIc/eAveiRMbi1AalAxAwEX?=
 =?us-ascii?Q?2S8G4rPYZ4PJwdVepzVqQ+TviLK9udBZ3l8UoP1ThtzUl8Qty8LJWczH4nP/?=
 =?us-ascii?Q?Z2dWnZpF9nD+I+GovztHdJxIrBs08kYhIJV7pvqUvMZthHGgceBVUZVZFbHa?=
 =?us-ascii?Q?jePam/zfcKn8tMa8Ydh7ReoxzhPCkMJB7XVgtNgotFj+rMLrB29LBMFr7YTd?=
 =?us-ascii?Q?+IIIOe9U40Ucdki9sks8fMLOmZg3tfDRVMnPBZyENp2C0AdgJevByZyCCC1K?=
 =?us-ascii?Q?kKBpJNzTKK3lNjhOl2DRd27ibHR2fZR4MPpIwsQJR2naOUR+gFxG9u4MExkT?=
 =?us-ascii?Q?mFbCx1wStAbT4GuzReO7FTX4PDLMF9n+zdXhq+p0qRxTkwFu5yfmk7UP+/jB?=
 =?us-ascii?Q?vz2o3C/UA1fBKY4RLXhuX29Go3sRE1VZgR0i5dull+tTbysE1kWNvjCBvxGR?=
 =?us-ascii?Q?dn5peMuVAQVCQ0bi9fP4Kmjzj9oNtgn3YeBy/TTACnfIRTL/AcEZveuVfRBr?=
 =?us-ascii?Q?5Etq/07iX0/BYYswH2rHF+t65dR2D/rElestfwpqegOHCt4V/MgZpBH9pZBf?=
 =?us-ascii?Q?oMiDEIuHr7l1OhXrkLCHWodkFVdtxF93C/He/mBndlpKnsCrGYwddxcRAbzD?=
 =?us-ascii?Q?Vsz4OcxJuiVekdm+QI0lssqK609ATBiqDtN8ieoyBlxcC/5x8K4k985zL3d3?=
 =?us-ascii?Q?9ScAzgq69JGXVla/cghHicBZquJ1f1CkL5Yzwau33gP+SWs2ksGPK8F0ZUPC?=
 =?us-ascii?Q?bxJHMUmmpbfIon+yIqk+nDLuho2X+zo0z0ypFXvDyQwcpgYX0cWcSUoJockt?=
 =?us-ascii?Q?ehI8puPAhGhZPOHe+cVxYST8bzAGIgMBGdx04wEe4B6Q3WcODmRq9JFLRZMV?=
 =?us-ascii?Q?ZRoNvsWXQaIfZY9OG8BruWjZJXYmaaQVob1pO4Gw4vlrp9ULvQPPj+vdMn6c?=
 =?us-ascii?Q?XsOA3eJNxkgO8X+vMWEhIWsbSXsttWgveZV9X4/G4NaNk4IWrzZh9iHJe97F?=
 =?us-ascii?Q?3vFbvpDWmm3VdBt/K1788v+1rswdjllTmiFn716F0Sx0hibmkmBn+/cHnvqu?=
 =?us-ascii?Q?R/Huw2EWqYAkNnwi/Z/XTXLR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6121e61c-185a-490c-4a23-08d906409317
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 10:14:26.7245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQwTfUL6wgBC+PD9IpfYqeJL3Rdl33Ls9dzMgveMrmggYSXH6IHcypYGFDmIPgl1U0LQNhrBGnQUaTupphHG/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7511
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add dts for imaging subsytem, include jpeg nodes here.
Tested on imx8qxp only, should work on imx8qm, but it was not tested.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v11:
  Adress feedback from Aisheng Dong:
  - Rename img_jpeg_dec_clk/img_jpeg_enc_clk to jpeg_dec_lpcg/jpeg_enc_lpcg to make it visible it's lpcg not other type of clk
  - Drop the cameradev node, not needed for jpeg
  - Match assigned-clocks & assigned-clock-rates

 .../arm64/boot/dts/freescale/imx8-ss-img.dtsi | 82 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
new file mode 100644
index 000000000000..c508e5d0c92b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2019-2021 NXP
+ * Zhou Guoniu <guoniu.zhou@nxp.com>
+ */
+img_subsys: bus@58000000 {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x58000000 0x0 0x58000000 0x1000000>;
+
+	img_ipg_clk: clock-img-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+		clock-output-names = "img_ipg_clk";
+	};
+
+	img_jpeg_dec_lpcg: clock-controller@585d0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x585d0000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&img_ipg_clk>, <&img_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>;
+		clock-output-names = "img_jpeg_dec_lpcg_clk",
+				     "img_jpeg_dec_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>;
+	};
+
+	img_jpeg_enc_lpcg: clock-controller@585f0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x585f0000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&img_ipg_clk>, <&img_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>;
+		clock-output-names = "img_jpeg_enc_lpcg_clk",
+				     "img_jpeg_enc_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>;
+	};
+
+	jpegdec: jpegdec@58400000 {
+		compatible = "nxp,imx8qxp-jpgdec";
+		reg = <0x58400000 0x00050000 >;
+		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_jpeg_dec_lpcg 0>,
+			 <&img_jpeg_dec_lpcg 1>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&img_jpeg_dec_lpcg 0>,
+				  <&img_jpeg_dec_lpcg 1>;
+		assigned-clock-rates = <200000000>, <200000000>;
+		power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
+				<&pd IMX_SC_R_MJPEG_DEC_S0>,
+				<&pd IMX_SC_R_MJPEG_DEC_S1>,
+				<&pd IMX_SC_R_MJPEG_DEC_S2>,
+				<&pd IMX_SC_R_MJPEG_DEC_S3>;
+	};
+
+	jpegenc: jpegenc@58450000 {
+		compatible = "nxp,imx8qxp-jpgenc";
+		reg = <0x58450000 0x00050000 >;
+		interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_jpeg_enc_lpcg 0>,
+			 <&img_jpeg_enc_lpcg 1>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&img_jpeg_enc_lpcg 0>,
+				  <&img_jpeg_enc_lpcg 1>;
+		assigned-clock-rates = <200000000>, <200000000>;
+		power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
+				<&pd IMX_SC_R_MJPEG_ENC_S0>,
+				<&pd IMX_SC_R_MJPEG_ENC_S1>,
+				<&pd IMX_SC_R_MJPEG_ENC_S2>,
+				<&pd IMX_SC_R_MJPEG_ENC_S3>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 1e6b4995091e..2d9589309bd0 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -258,6 +258,7 @@
 	};
 
 	/* sorted in register address */
+	#include "imx8-ss-img.dtsi"
 	#include "imx8-ss-adma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-ddr.dtsi"
-- 
2.17.1

