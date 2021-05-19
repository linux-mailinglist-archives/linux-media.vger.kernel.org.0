Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A723887D7
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 08:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbhESGz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 02:55:29 -0400
Received: from mail-vi1eur05on2066.outbound.protection.outlook.com ([40.107.21.66]:31936
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232539AbhESGz3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 02:55:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPtK+J+gRyLKMdUwmp2aBUIZlWTqldFq8fWzAoejsLVn7B/zJL2L85WhWkdwGKVwDzK+daOuSXzuOfr0O1RBY89lPhlWe0i0+RzS0bgzbbfAy2jrLqqt2u1VMSgi1gO/LUGhlX6AoHrlXlmKhBc8yedxZekxvIixDGyInrbOPG3wJIoBq0JWJbGt9WLgEZhDeu8UJQwKnd8iAKrp6SCIjd902dYWeuBrxEioKACO0tBRQmNo5mCuEie+C9gVgTo4jR77qnD4halYsXl5C4qGzGcDd+oU6pNonBnNr/lk5tX45lXVQv0c1oyioakLmE2Lo+EbymYnEWlyZb9Lj/CKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhqI4YjY51Ii8lbKKbBCqjAEASrLpnBliIPPCRKrHbs=;
 b=TOuQVMBBI33t1QliFdUGMhe3StktfSdgCOjxRL9HWNha4Dxm4MfritcJjVZ9tZDx+0BvSuyUTzDmD4sEvjrNRItITx+203Qf+v48TLhm0CiwOajnPSgk+jm9/ZTzwb1mOyZTWL2wf3yOhnXx6Kr5b55nA17ufeqCATpWmuUPc6lpPdJID3mJnvTjoYJeA+soWaO+gxfPyajIwcnTIprqAaWC29OjOCXgpP+VgYNtVCWG6EM26II2N6LTjNpPwULA+7TfazXLHXvPq13MMa8bAY3gOYGKEuGUn7WmvuCmdOkF5gf1r/Nilki5KDPpIG7Gjy5tUcRiHcFHOd3xaz/Q/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhqI4YjY51Ii8lbKKbBCqjAEASrLpnBliIPPCRKrHbs=;
 b=YaMrU18sZz+8dXMVInZLyKga0mk/hbk3y0a8D1d9vB5ffMMhZJoLE7mOeOBu/UeSBqQiPNCQBCDhgH1fhtq3nX2tbgCxkOAxHZMjIFCmLpA6geM8+0+Oy6JRG6vhkNX7kPsvwdFnPiU56x1doqtNtoYbAFJXJYZo9L/0FLdhpn0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 06:54:05 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 06:54:05 +0000
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
Subject: [PATCH v12] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Date:   Wed, 19 May 2021 09:53:55 +0300
Message-Id: <20210519065355.27615-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1PR06CA0134.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::27) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1PR06CA0134.eurprd06.prod.outlook.com (2603:10a6:803:a0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 06:54:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b5a0e07-110e-4161-769d-08d91a92e454
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69970802447CD04D9EE96D00CE2B9@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gsSZhnmhynl2oTjOaCxD4C4k9LYp/gFyv7iPnMU+XP5anGTKyKNS7bzv5nBMAcxQ7N8pUMP/LHoYZddK/56/JboXBYrIhgj89gY00O7JjLLO+zyhowOCPXM617eUqbb/UVb/FCZFCYpy1JM/HBldHivSjB2fuIcIbZvfsUvX+Y+bZ2CPcQP+UJYgt1NS3vakWZ9XYGTUyszYOzrMY0gv63ot1QaVRQvZdgU8Bj0gI2nysZWrd6LoHn+u82IWmLSEnPLSgC0qZYfJ6Xv/q+/X7Xw28rqPYSmlpYgi28zO1I0aNZaQKaxbIl27CHDxQiTKXX4F0J+B8V48XsFxPrDkF6VtDEuSzllKkgq27kHzYdwGVCYEh87HMCxi2c05Bfp1wOXlEJ1Ys/KXOMBHZ7o9saXnFI1x3v/Q4K67CqQvlzpFxCqcdDq1GGoez1zBhUSdknvqo6ISmSbK3mseF/YVskwJk2pRGdQOxi9fc9n8ao9VipQCqdkTnFVmCAdYvuOgS6wPLDQZvXU8f7g14WbD+jjfkUWoXW3PWhkJSyy4M1yUILP25dnndIbwX3+22tNNZr8WcMNB8aIAFPOOrdCS9/VZV0Eu0eD8nZrSnJWD00DCbL9gJV6R0WBtl/x8A3ZmA5ZFxnMNWMgHHfw4mg6+XEbaW7rH+GHueo2r+qzzIvO1ZS1PQCwCFkbP5M/I0i/A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(86362001)(52116002)(6486002)(66476007)(7416002)(83380400001)(38100700002)(2906002)(316002)(8936002)(66946007)(6506007)(66556008)(26005)(5660300002)(478600001)(16526019)(6512007)(6666004)(2616005)(186003)(4326008)(956004)(38350700002)(8676002)(1076003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TwYdR2sNzK/VuyfDBFnt+I0dY4k4mDSScCtdQI7ZEg4GzK+C5f2uUd2BxLKW?=
 =?us-ascii?Q?p8qXPw5Q6BtJpsPH/a2VRlnEHLtFWmYcaS02HajquT20dEoCvTC2h4ib8Brh?=
 =?us-ascii?Q?CaLdOArdhSVzBmpJXwaN88EZOuAPICDNa+/BEckf55rBOllBbeNAGB8Ci8ov?=
 =?us-ascii?Q?tXuelInZJZEJjh7yhFY5SSGz850xDNq27HVdP0kOoVItZKrsVhQgzXdBCiZa?=
 =?us-ascii?Q?yFp0nnpZwq2YTTvXA288ldvBRotAvAP5/W5MVvWdQ+/NzYDQ04aS4j8nUXX2?=
 =?us-ascii?Q?X+cUWgWuFPctV5YekNfY/6xrbyxryG2bXzEcg4pOOjNNzS1XJ8uiRz9EzMBT?=
 =?us-ascii?Q?iO9skgKy5HdUv1VMVKUpZIk3BLajaNQLCvkDAo5Fv96PqP//5ZW+8VJXq+YQ?=
 =?us-ascii?Q?sV4doiPitDKcZjuR2C/8LczntT+1JRaiXc56EhOxMmXKh7qBJecwKgZbR7Ft?=
 =?us-ascii?Q?5pvJwCgDAhg55/f0gRMn8WZtY6EFjwBf94QVzMCCgWZcCFO0KhvMGjxAfYMY?=
 =?us-ascii?Q?j8PLkJ3b/aCatnlQHle8mzfN+QEGVmamupYHRsba0rr4BgSyd5ad7een5Qpr?=
 =?us-ascii?Q?ZhgrDbQipvvLd+7+fRgdiLkZpOVClEbhNGaKpGpA6Ycw/mY5FoQu7NV/FRjl?=
 =?us-ascii?Q?LBGYHnlybouIjrAK5XVGvx4SHkAPMqH4FWT8bvtduWJrcNoi9hzdURXSMWM3?=
 =?us-ascii?Q?9jCElTgRNNsdl+dN1IZip6pCaDoMlV7WhvRq1VI11Roz5Kvuv0l5NrTiwVtt?=
 =?us-ascii?Q?cbP7zfgDQAbbNnitkY2aoah+gEl6rJClUXx7jEAQbzL1NGJ2zkwILYQhsiGA?=
 =?us-ascii?Q?oJsDY1pDRoxwwhsBfgn39RFuWuDJBqL3oaCkww8WH2d2NZZepS12OQA6BBHC?=
 =?us-ascii?Q?zzCbMvhJYmyd/c7Jq4GVJQ4G79U8bZJ+pBSMA5a/3LAEv+8fXUSft7qtKQuJ?=
 =?us-ascii?Q?1B/xijotqLbenp9z1kMCTW5VNtr6ilIr58OjleLW2SxA5TQNmBheSy9uX12a?=
 =?us-ascii?Q?ONF4QSpqkmjbZ1diJ6AaoHr+8oZKFEDId4bFombmzYAFJ9sHR0MopB6b11v2?=
 =?us-ascii?Q?aaMV1H6kwy8oH3GV5a8JNeqVcDp/3X/6liNdx0yX7ns2xXmEwDPEB4hjH/lT?=
 =?us-ascii?Q?dNrBs3FetOi+J3pziou3oi3WHzpGA8r838AQXx7ZongUI/ekjba8k5VcMKSo?=
 =?us-ascii?Q?lqt4F2qTEDZ6vXlDPkk30vnMBdkVBn7jHlLT09r6GlqFxnrNcSXJ7LIF/SBP?=
 =?us-ascii?Q?qiobL1CdBuejNtOUaSEBQiuqIpQxg8uRmr9wNPSLc2tqRooxcMdS9MOYzIRP?=
 =?us-ascii?Q?BKYbbi2zixERT5LTgTT0GSdz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5a0e07-110e-4161-769d-08d91a92e454
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 06:54:04.9932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+TS4XtXoo4rAnN5x1Iaiu/DOTXcuCd0hdHZB2xiel0JimCFGjuegLuMo+DZq1MHv5kbJDOq7mqaZ4o2HGiFUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add dts for imaging subsytem, include jpeg nodes here.
Tested on imx8qxp only, should work on imx8qm, but it was not tested.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v12:
  Adress feedback from Shawn Guo:
  - sort nodes based on unit address
  Adress feedback from Aisheng Dong:
  - Use clock indices for LPCG clocks in consumer nodes (jpegdec/jpegenc)

 .../arm64/boot/dts/freescale/imx8-ss-img.dtsi | 82 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
new file mode 100644
index 000000000000..2ee789930cbc
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
+	jpegdec: jpegdec@58400000 {
+		compatible = "nxp,imx8qxp-jpgdec";
+		reg = <0x58400000 0x00050000 >;
+		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_jpeg_dec_lpcg IMX_LPCG_CLK_0>,
+			 <&img_jpeg_dec_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&img_jpeg_dec_lpcg IMX_LPCG_CLK_0>,
+				  <&img_jpeg_dec_lpcg IMX_LPCG_CLK_4>;
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
+		clocks = <&img_jpeg_enc_lpcg IMX_LPCG_CLK_0>,
+			 <&img_jpeg_enc_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&img_jpeg_enc_lpcg IMX_LPCG_CLK_0>,
+				  <&img_jpeg_enc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <200000000>, <200000000>;
+		power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
+				<&pd IMX_SC_R_MJPEG_ENC_S0>,
+				<&pd IMX_SC_R_MJPEG_ENC_S1>,
+				<&pd IMX_SC_R_MJPEG_ENC_S2>,
+				<&pd IMX_SC_R_MJPEG_ENC_S3>;
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

