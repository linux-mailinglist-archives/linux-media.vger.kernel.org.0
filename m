Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636E9355A5F
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 19:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240643AbhDFR2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 13:28:15 -0400
Received: from mail-eopbgr80051.outbound.protection.outlook.com ([40.107.8.51]:60610
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232752AbhDFR2P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 13:28:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD0ZUABS8A/oLpnx+1luL1CKEL1suJ2szQgEH+AQHnPdHfgK5BEKK0bylgO4mOG1j8OLdwnsecwaElwahtH52i16X1x4keJ4R2U0PE08EL3jTY4P3Q5GxBAkTTfeeYAoT5MW0MimGoTQJIo8zTHXx16mFi4c5oha1KtK6Cej3Jr5HeS6s85hYa7PHZIdaXaZ2CaB5jGdjAcBR11VCW7AAoue4xAXyY/e2UwPsQq4TR67bTGmch7ku9qNf5NXqQNFr3T6rYXebxdcOi8mflgvL9mnePmUYRsaLUqcw9j1FcubrBf19+iiRtn4SukeQiTOzLVAKRPBOAK3BhepWNMvwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpZvBb0i/WIaoFQGjVbmU6dg7FdT/ko4nKC+76nB89s=;
 b=Wz2a132TZMgwEknFavNE0IcU7t9DiuQ9cGErCeDnd1nxBv4XDeZzVVy2t9rzeTj3/D9YyS7f99cPRrP0vpHnTs5+zl2gPZu4QV2wv/Nikk/TqMW3KQZnTxgr3lzXqUd3tlKCaWIC1r8jeoP7dN9n+rxByG274WTKC/yfH7aRJpuif2kr428BUDu0A7TXaxGd0lwJwY19CTOsih5iojKi36TSllskEXefy3zNJV3clBZlhpeAgUBWJd0bHRGulH8V8KsagK634wCCVoyCbTp8+9eidCN8ne6Cqc7BaZHjmdHZA/DnFixCeR6eJ3G2ej+Sc7Dn0tVa5LRPbImxWdrzQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpZvBb0i/WIaoFQGjVbmU6dg7FdT/ko4nKC+76nB89s=;
 b=crUHsl30WGOb7hjlD1FOSKvONzxXHYnkKi0R4VyEQrfOaWNJqGGjbbUO1HJ71HCJ02/NIAklxpyUr6xkI5MkLNzhfbIUVebtF9ZrcB+HsdDKxzDSV691xpjkITOGGq4YH607j0NctKDkDRAkQQl6Lt2zJOBv3GR+hagEJufGpLk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4423.eurprd04.prod.outlook.com (2603:10a6:20b:20::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 17:28:02 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df%6]) with mapi id 15.20.3955.033; Tue, 6 Apr 2021
 17:28:02 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, aisheng.dong@nxp.com,
        guoniu.zhou@nxp.com
Cc:     peng.fan@nxp.com, s.hauer@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, p.zabel@pengutronix.de,
        ezequiel@collabora.com, Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v10] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Date:   Tue,  6 Apr 2021 20:27:40 +0300
Message-Id: <20210406172740.13904-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1PR0501CA0031.eurprd05.prod.outlook.com
 (2603:10a6:800:60::17) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1PR0501CA0031.eurprd05.prod.outlook.com (2603:10a6:800:60::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Tue, 6 Apr 2021 17:28:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32a565b8-345a-4de5-4874-08d8f9215463
X-MS-TrafficTypeDiagnostic: AM6PR04MB4423:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4423E3EAB18FAFD9568BE1A7CE769@AM6PR04MB4423.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3yAO3Vn8g60uILHOCg2n7Cp8XFUpcmW0fiH5yR8eXdkzxL/zbp5RXr0AT1E8VS9TTUwBpCRdnd7CBtOpwfW/DlcNrzJB8PUm2VZnPogqEQSeWA5nFeIAr2SrppCRJwHDsWKYbCS/45x6t94OI4OLqhM1VR4PdB9a7QX5/JjiGXhARugjYgQ+t/P6frwYbHRie3mi4vccTkxOwRIVd4Q77lLpDDVMykSRYsBdCddBPE7P29NEsO6+6Ss8zc/LMT2IPoBYgjX1dF3jy1oLGcXHRYCfJd+hyCtULlfmxHyYM+Ov6eJ7TP/S3VyQtkbaDV2awqHo8ZVlScncpKwo6QzySbSYzQPyyrvaGpM2k/CVgRab1UBeT1rVZGCGo/3ofsVaZd/nJaIY1IQvXFOqInpk2fLDsxlUP+MzROv2X53r/KV5JFQBtutcFClP0zhNLNdx10ZjxjEP9V5uFxbMokxqhgVFHCTZS08f3QTkoD4Yxu2bheHLbsCEHXXNvL66aJ463VqNqTFmOnwxKHVDQMbNtK5Ha+yjMrS/TSL5a+swBIG69yvtbdeKRLZ6xkU9DdXyxr3nYHADyk2IVLKbZzWeBYNT400Kzvqq6QHQqqzUrNaXAlizKiz/wRmClt71nW+2+NylghDrZ9iEUwkP6meNQDvbSuHV1fmGBYNUNTzBunStwIi+sw6190bwgMe18mLWt0I8ayET3yOET3RTSes9SQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(136003)(346002)(366004)(66476007)(66946007)(66556008)(7416002)(38100700001)(38350700001)(956004)(26005)(2616005)(186003)(16526019)(316002)(6486002)(83380400001)(52116002)(2906002)(1076003)(86362001)(8936002)(6512007)(8676002)(5660300002)(478600001)(4326008)(6506007)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qHvPYxMO9sESf86M26z+IlbZch9YpIpckLzSufDf4jnOAS8nEA3udjGVzdLf?=
 =?us-ascii?Q?jmb4uvyiq0kwuRBeMI9tSncyc0lwjDBKcYdMAp8Nkx/LiW9FYLAOGEfPJQ1i?=
 =?us-ascii?Q?0u1V6qwTtdPs//npC+aOCH2tnlfGHMwXTy6djKYFyWBa28oukx4eXloCoNMk?=
 =?us-ascii?Q?ggiXxx5NJ7DIz8QK0vJzDQ7Qc2/Yk8Y5MaHejIGA96p2wHLJY4H69o4TzS0y?=
 =?us-ascii?Q?WhA53BEPz/6ufevZavLWXdvw69LetzzTBqeRxGZUqHhsanyclu59VApHJvB+?=
 =?us-ascii?Q?xvH9loK/COGFHJDUKtaL4noFrcOTlRRD9tdRTysSJcJ8DytvSOBCkRVtWgWM?=
 =?us-ascii?Q?Pizth1D0w3ZrumvJIFH+oyzXfNNt+e0zwwBtpQCMlWcnGdeWXA25TN0i3eJ5?=
 =?us-ascii?Q?UyErYM34Rv4NQtEi7+7p1QWdo50nSShpStlIjhYIdYdlFUZWgYY0v37qBl3o?=
 =?us-ascii?Q?w6OcXGciLO6b4a6xcWyNiGJk0QSeH3oql+sxnZHWue9FkHLuOKnjooXhCZAm?=
 =?us-ascii?Q?ih68wRxSKbdAn7YwROmkEK8aybGwoiUOmhujIr1WnHvDrjGqJTiyq2rG4rM4?=
 =?us-ascii?Q?YDBSZseJv6T1MWSr8/Gif8Hk4tigF2hJauB2Sn79F0JummKILmyH54dBHFSe?=
 =?us-ascii?Q?CFhh3NNibkdCMWSQMCpeTS1wPx3r88dFeIVycfHt0U4B+C38vmFAlI7yCRry?=
 =?us-ascii?Q?VLHbEjqpB5u/sN27YQOmzHnkjR3n30UemMthrUCw53+C5aho3mGx/7dMqoQM?=
 =?us-ascii?Q?0QfWHrJPhwCigW34i03libryU2oAdfsCiCrj8eX6E+e/ax3NnvNo3bqoJXSn?=
 =?us-ascii?Q?Lsj5oKZYLF2WPyIFzReaeLXvEm6dzmMctJsIb3kOY2naQSY858jzpThg3s+E?=
 =?us-ascii?Q?BwLCBxxbwBSOt9eN3TAEk3ncDhFcItXNWgmNn2L/pRnEmSs2NO5/2U1rIwr3?=
 =?us-ascii?Q?Io1XVx0vBfQE5/wlKdQ/W3q4Zi8MyQDM7EYjjmP/hUpbHkpSzB1CwgrgZRQl?=
 =?us-ascii?Q?+owgpTUZ1z9AlElqPx0G48cOTMIzHSLEJM0E1S+BFjGlqQ8ID3AdGgudd7G+?=
 =?us-ascii?Q?kLun/7LGhO8pllTcvT8Xz9okdB8rrbh7EN8ehBihvVas7v0gqVUKeyevsFSO?=
 =?us-ascii?Q?oefRojU4bg5NLySAcGKp07uo3YDlt5aLFxRRczXIcY9jHUhjAN8XDntU0N/0?=
 =?us-ascii?Q?LWO2b2/rXbUJ2oGQKlhWTj1+4Pn4dGQwqD5rySLbzpuHA9pbfg1hjgN6J152?=
 =?us-ascii?Q?j/2kXY3igIhLTOe8EeecBjtO6HG/r+eQPX3ggM5We17HGaQw3jWfdx22SIuR?=
 =?us-ascii?Q?jjewK4CXszhAD+BhwImONG+g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a565b8-345a-4de5-4874-08d8f9215463
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 17:28:02.1003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eb6Yo+H/ord0ReCF/Z0HZ9ZaAClhMAPqROjPPOK1QPTIAprM/pV/jzI2K8STPY+uzgipy6kbQB2Xb6H52+98IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4423
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add dts for imaging subsytem, include jpeg nodes here.
Tested on imx8qxp only, should work on imx8qm, but it was not tested.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
This was patch #7 in the initial patch set that added mxc-jpeg driver

Changes in v10:
  Addressed feedback from Aisheng Dong:
    -Add jpeg clocks in the jpeg dts nodes.
    -Adapt to the recent split of the dts into subsystems:
     add the imaging subsystem, and place jpeg nodes there.

 .../arm64/boot/dts/freescale/imx8-ss-img.dtsi | 89 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
new file mode 100644
index 000000000000..1457d219a658
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -0,0 +1,89 @@
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
+	img_jpeg_dec_clk: clock-controller@585d0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x585d0000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&img_ipg_clk>, <&img_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>;
+		clock-output-names = "img_jpeg_dec_clk",
+				     "img_jpeg_dec_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>;
+	};
+
+	img_jpeg_enc_clk: clock-controller@585f0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x585f0000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&img_ipg_clk>, <&img_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>;
+		clock-output-names = "img_jpeg_enc_clk",
+				     "img_jpeg_enc_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>;
+	};
+
+	cameradev: camera {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		jpegdec: jpegdec@58400000 {
+			compatible = "nxp,imx8qxp-jpgdec";
+			reg = <0x58400000 0x00050000 >;
+			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&img_jpeg_dec_clk 0>,
+				 <&img_jpeg_dec_clk 1>;
+			clock-names = "per", "ipg";
+			assigned-clocks = <&img_jpeg_dec_clk 0>,
+					  <&img_jpeg_dec_clk 1>;
+			assigned-clock-rates = <200000000>;
+			power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
+					<&pd IMX_SC_R_MJPEG_DEC_S0>,
+					<&pd IMX_SC_R_MJPEG_DEC_S1>,
+					<&pd IMX_SC_R_MJPEG_DEC_S2>,
+					<&pd IMX_SC_R_MJPEG_DEC_S3>;
+		};
+
+		jpegenc: jpegenc@58450000 {
+			compatible = "nxp,imx8qxp-jpgenc";
+			reg = <0x58450000 0x00050000 >;
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&img_jpeg_enc_clk 0>,
+				 <&img_jpeg_enc_clk 1>;
+			clock-names = "per", "ipg";
+			assigned-clocks = <&img_jpeg_enc_clk 0>,
+					  <&img_jpeg_enc_clk 1>;
+			assigned-clock-rates = <200000000>;
+			power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
+					<&pd IMX_SC_R_MJPEG_ENC_S0>,
+					<&pd IMX_SC_R_MJPEG_ENC_S1>,
+					<&pd IMX_SC_R_MJPEG_ENC_S2>,
+					<&pd IMX_SC_R_MJPEG_ENC_S3>;
+		};
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

