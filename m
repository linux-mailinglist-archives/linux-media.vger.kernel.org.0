Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC75C3ADA70
	for <lists+linux-media@lfdr.de>; Sat, 19 Jun 2021 16:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234498AbhFSOjN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Jun 2021 10:39:13 -0400
Received: from mail-eopbgr140044.outbound.protection.outlook.com ([40.107.14.44]:8613
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233240AbhFSOjM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Jun 2021 10:39:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msINs+ylfmYE0DG9XDBY7m5D2EGBXnNI6A/6DzT6oo4DebBCceja5O7RUiEmLqvE4zLgQMww8o4zK+MKKfqXYO1Eelg2aLJrRA8A/lBcgA72H3BvK7NomDGQoK6PDWmDzHSoU2Yc9ib7TujZNJG9rHDqrw/m9BFe0mXLiC6ebj9lyp+CdbmMseywjvfhuhjX8DBXR3DY0Mge5wbNBBC1i174ixRjVkw7ul0ZZrMIhOxHzYh5UKYndy82VgPLsq7NgQDcluGppVV5k0S9OaQnNt+SMwX/lZtxATkSJMwWncXbh9n4eodfCGZy+p548GTB2Nibn1dMfT0oKP0R2Kaiig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fUvww1qHv/NyrImBfkEoQkTUR/qOm+ss86v/PKr2kY=;
 b=ZVO8PEl1LBBE3sK0BXCVUZD/Z2UCk+9hIjdzJ2zpK6JRWSGCnBkzozae64d8QHZ7UwhrNKbcIPCBD1v1zMs+5zokng7V0ehw7zihtnaPapXpr6jlumXc8bdAIbRlX2GTZ06UCBv0MRZXUdQ5Kfd7a73mVEmvlZwrJyJyz5RgXEqADAVqDL13wQQpPCWkZfH4APoopoiWuzvPtcre/MIjBXU8GEOfI8VaOHCpKZq19VTKcMwjfrCA7WnT1BGGonNb25wXSboW3bKl6n0NvGQ3LifKqfGSpRw+lH9zibBXGS9vBy0iDJ4oh74GOTmjCO6Mx8NfXodeyPZe0taE7zprbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fUvww1qHv/NyrImBfkEoQkTUR/qOm+ss86v/PKr2kY=;
 b=cvXNWFbNshnLPyJkz7bcvrF8E/7REvFLt+f9HWF3Xj4TOU+tMCNEOGdiMmie1uCNJK6lFXEFYbhHHoOztkFGszRYOSXKl5TJ5e27i6ZH7D71GeEuGnu2P4o5RyFCkRvybDXs9zBaXJN+rIhowVmI+IEukI4k+2zkeWeXDs7BOiY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB6710.eurprd04.prod.outlook.com (2603:10a6:20b:d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Sat, 19 Jun
 2021 14:36:59 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::bd06:5847:5090:2a21]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::bd06:5847:5090:2a21%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 14:36:59 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, aisheng.dong@nxp.com,
        guoniu.zhou@nxp.com, linux-arm-kernel@lists.infradead.org,
        mchehab@kernel.org
Cc:     peng.fan@nxp.com, s.hauer@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul.kocialkowski@bootlin.com, daniel.baluta@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        p.zabel@pengutronix.de, ezequiel@collabora.com,
        kernel@pengutronix.de, Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v14 2/2] arm64: dts: imx8: Add jpeg encoder/decoder nodes
Date:   Sat, 19 Jun 2021 17:36:11 +0300
Message-Id: <20210619143611.17280-3-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
References: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1PR07CA0214.eurprd07.prod.outlook.com
 (2603:10a6:802:58::17) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1PR07CA0214.eurprd07.prod.outlook.com (2603:10a6:802:58::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend Transport; Sat, 19 Jun 2021 14:36:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b56a3380-5ede-4c06-2002-08d9332fb1b4
X-MS-TrafficTypeDiagnostic: AM6PR04MB6710:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB671071AD723CB7C44AA6AC45CE0C9@AM6PR04MB6710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xcLQ1hzH0XaKzUL7ezsWgxCdWrOU50SfWvOVjf1Z/+NviY4ZtHZkv+0TgTyX/9kUkae296ha1+tw+9LRgl7okBVCIe7RU481dgRyYUTyAIl43nSL3JdRpandAMTlmSlSQUJoJPTLo5DuXFkNLUMWL4cEUTST5/G4oNZyiExBRHQumheKGLJthmV3qGucwqYpE4K2W6Suq9vkptpP9ujCiT5Qr09gBvU3KIVrPyLr2OEAvUvpi2Zj+RkhfegmbHR4P21FyM4uWqs0Hq7rO3xRNdFH15WX3yntYdJT78fH7PXPt1+rz3x+kpPR0XdWye+EetRx8rv9Jn6XFO94CBILyGAnniNV8UBOZTSYh6jivJsp9f/1qRnpWcdRWr6kkTa99YC9Al/6hpiq4fSWnoPs3qcIdawA7prLjG6g8eXzsKPzeBfcgvIPpVU7QJ+C09+niewX6wKqxj3/ueyEXI9Z1o7UWZnNcK7Ye2QiFocoprsvsifbb+iaLLJW2qZgQU8m5mL7zLj2tujPJMBgJbMjaYP57PJXqGtTEvhto1TmKZNFU/FNJAGZzBWahqKRUNUTR+5cvtKn0Q7EMQ/o8AWk7rTw4LdhzHTtnRP7tgivftx+v8OGaI+wvtC+K9U6cQm3NF6xAzyircdkbiNAHH0m0CqwWvZqPnC1cVwdKd3IHsc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(366004)(136003)(376002)(86362001)(186003)(16526019)(6512007)(6666004)(8676002)(7416002)(6506007)(38350700002)(956004)(478600001)(52116002)(66476007)(66946007)(2616005)(1076003)(66556008)(316002)(4326008)(26005)(83380400001)(2906002)(5660300002)(6486002)(38100700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dvMUlDRqj0YRLiaxRuNa/gPS2eGqTR+sXTV+RWdwsJ74St6dlygyjtKcLaly?=
 =?us-ascii?Q?LWmVTrRcxxeUeLCXpragH9Rqd/sD80EgxSacOm+PZ0rN21AKQL53mfopr0iG?=
 =?us-ascii?Q?oKS4CoPb0lyxK8L4oVi0TDLLuNo4fxNMWy8DVaBszqadnnhICVIyMhWjHLMC?=
 =?us-ascii?Q?HChmFh5qIP7LWbvp8mOvKwCowUU81MBtUZfiRAEVteXdyJxxF9uYgxcKAUQ3?=
 =?us-ascii?Q?T0b9Lx9MdDJG6p1bvjYEQGLwW67br61t4a0QOyfXnzyv8+uDe8fIgZdfFkLl?=
 =?us-ascii?Q?3PmnwRkg4Ql3D/h/SY+Urha5Z8BWImcVT3OuJCKN2kURSEWrMsOVsTaVXA3K?=
 =?us-ascii?Q?eBYvhijqa47Qja30ZENHVI2verU7dLtHdT7f80B9A6Z/IVdfKfqcn6J3A5bB?=
 =?us-ascii?Q?PAyo1e82OrnGx1XvdUHCXEcMSJDjcs2gVXpVdhZnxxoh633e79ObPBfDqczY?=
 =?us-ascii?Q?mBt0mnPpWPYujz+WJ7mwMnZJucE2r+QZftVHnhMnq7Xf+bTguT5W1TpMNHyO?=
 =?us-ascii?Q?oi64MlxMg2VOlgf9ALjvCDcOE0wl0S+Oc1H9eTqzVe9Fv9MMwJjojPtuBGc/?=
 =?us-ascii?Q?mtklm4Og0210YPbSTirpivZDMt6jSr3pZn6bo05Gl0pa7yi3fN5ISRbAYEQD?=
 =?us-ascii?Q?Q4aohrz3ly7IctUY0Kz2sjI94aaKf7R8PklwU/XAr9uZq9GniNzsamw0tOfH?=
 =?us-ascii?Q?CbAR/9K4v0SkxNW41j2ZvCuTbC2APcmY5wkaj2fXvaKUIFa2otw8Npc1xAmn?=
 =?us-ascii?Q?jgiRJrRMCluWgYaxDaKJgSPmTuaFOsawGOTKu9G3axMlVLH7p6gP+yzouuBj?=
 =?us-ascii?Q?qau+ujeivjdEz2tQMKLTLI3l3JyU1sdvZNFY/7sxQoLHDLrwPRa32GnMOmTo?=
 =?us-ascii?Q?2h8FvsZbnDKKQId5r3XIaXEsZhgGM7WeY8vh+9szKsHQw3dETlkmSOV8059J?=
 =?us-ascii?Q?/tOiapgSSINZR1h+aVFpEyCCKqYclybZM6/aykUaX06n4XgB2wMp5qMQiqSr?=
 =?us-ascii?Q?Hv1BFOHGsnEkoazPcwwjAsi1+kO+NxqJDw3+y035zGfekJkGrOBZmMJXLs3A?=
 =?us-ascii?Q?bWiGbE95yeL99fnzQWcYK7H7pk+kH+pduEIFFNTZEaRRNnAbPXor+CoROWIh?=
 =?us-ascii?Q?6gwF89RlXJUl1QMHZ1lN28269g67Xe0E3U5SrtixTZQwJ791a1zcsTFupE+i?=
 =?us-ascii?Q?q6u3WMz0pl7d3GqVlFzODIW/YJqSW2an8VKV8KvIX9V0q2wtLc8LfEdfM3Z6?=
 =?us-ascii?Q?WadHzFAi0oKsbzlEXtpnqRa+/mKYIO7C0X63kSE055fBJlIKv8RlJR5g0aAg?=
 =?us-ascii?Q?oFZjNgdraHyJOSvk1yQn2fwM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56a3380-5ede-4c06-2002-08d9332fb1b4
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 14:36:58.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ectn1OLQba46YPdd31WlWJHQPnNMXx6gKoXndNwlCbBTJYD6Pt17/PRvPLqoZSCFr+CFcAUHoXT/IZIucl05wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6710
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add dts for imaging subsytem, include jpeg nodes here.
Tested on imx8qxp/qm.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v14:
  Address feedback from Aisheng Dong and Ezequiel Garcia:
    - use imx8 instead of imx in patch subject
    - keep jpeg and LPCGs used by jpeg enabled by default in platform dts (no change here)

 .../arm64/boot/dts/freescale/imx8-ss-img.dtsi | 80 +++++++++++++++++++
 .../boot/dts/freescale/imx8qm-ss-img.dtsi     | 12 +++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     |  2 +
 .../boot/dts/freescale/imx8qxp-ss-img.dtsi    | 13 +++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  2 +
 5 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
new file mode 100644
index 000000000000..a90654155a88
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -0,0 +1,80 @@
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
+		reg = <0x58400000 0x00050000>;
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
+		reg = <0x58450000 0x00050000>;
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
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
new file mode 100644
index 000000000000..7764b4146e0a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 NXP
+ */
+
+&jpegdec {
+	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec";
+};
+
+&jpegenc {
+	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgenc";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 12cd059b339b..aebbe2b84aa1 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -166,11 +166,13 @@
 	};
 
 	/* sorted in register address */
+	#include "imx8-ss-img.dtsi"
 	#include "imx8-ss-dma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-lsio.dtsi"
 };
 
+#include "imx8qm-ss-img.dtsi"
 #include "imx8qm-ss-dma.dtsi"
 #include "imx8qm-ss-conn.dtsi"
 #include "imx8qm-ss-lsio.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
new file mode 100644
index 000000000000..3a087317591d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+&jpegdec {
+	compatible = "nxp,imx8qxp-jpgdec";
+};
+
+&jpegenc {
+	compatible = "nxp,imx8qxp-jpgenc";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 1e6b4995091e..a625fb6bdc62 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -258,12 +258,14 @@
 	};
 
 	/* sorted in register address */
+	#include "imx8-ss-img.dtsi"
 	#include "imx8-ss-adma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-ddr.dtsi"
 	#include "imx8-ss-lsio.dtsi"
 };
 
+#include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.17.1

