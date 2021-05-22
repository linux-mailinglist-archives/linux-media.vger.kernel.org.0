Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6744738D777
	for <lists+linux-media@lfdr.de>; Sat, 22 May 2021 23:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhEVVNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 May 2021 17:13:47 -0400
Received: from mail-eopbgr70051.outbound.protection.outlook.com ([40.107.7.51]:12614
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231423AbhEVVNq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 May 2021 17:13:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJRCYHg3afBVEaG7JenPkNRJzjgKhciI+Nzh3mO2aov618B6f8fXliDswwbM9LKgPMgG0h7lK/fasHcqrjpLxgR6m0dcNNBpuFmdOqLN5mkIUoanck9bWqmmya/BBc/NqVXHptn1fFZMk207+2RkkAooBRIH2nake+eVPqJ0V8kvi9TP3wUfPlpa8XD0j34wFG1XSXq8pNTBjdwaq49jM31pIY07fzG37mTFveJmUcCsOzxM02f/rrCwM0/YfABz8o40T3TVcWHxChja/CX73oLDNGdl4WwKNSZHjzRCXjSbSi4Z056R1GSyUgapNeV+7zPQDUKBlHXfCftK68cCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pdu3BKBa0SwVW8Y0GcRQEJsE760uJtALiqL0Dgnz7Pc=;
 b=ChcRtOaE18aoKKWljTy1nuAYggZ14uE3ZDk25vuUFpZIptRBPUR62hA3ooJDpgN82zAAGqRYu4jG1jqiySL6Kfz2h+th23YpX7Pf3bgbCnfnE83pY+a/YU8htBBTgWpErcKSeHIlwg9ltxpDyEzyy2uZOGrbwieuY29E26TORawMDfrKsDQ7DLZ+nFwUCoN/UcATxqRgSy29asKPCwY6F0tdMxBKETBCYwpSiYEaEFwWEXIiaw6pfPEePIYVbvpUNEhwdGrACxOuaXJWvOmIzN91K2n9KNXVfjIkDI7dNSKZzz8TOAXsA5CtO9xTUboeIhOXDjbt3GfeF75gQZZ4xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pdu3BKBa0SwVW8Y0GcRQEJsE760uJtALiqL0Dgnz7Pc=;
 b=fzpHjoPky2M03JzmSBMlpqBK1+B2aH5r2yd5Dj6IFHZU562UQtwIX794oSlakPU9VlifvtBbGDWBh087AfKbYZsfcxv0uQAu+jRzFSWI6CjMAOy7g3USgJqnifH37XCCtHdxiMt/6rnNq/FnpWE3vphf8n7XMMA7TSTSoMpBSis=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from HE1PR04MB3146.eurprd04.prod.outlook.com (2603:10a6:7:21::17) by
 HE1PR04MB3260.eurprd04.prod.outlook.com (2603:10a6:7:1c::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.27; Sat, 22 May 2021 21:12:18 +0000
Received: from HE1PR04MB3146.eurprd04.prod.outlook.com
 ([fe80::4564:419a:6e63:24b7]) by HE1PR04MB3146.eurprd04.prod.outlook.com
 ([fe80::4564:419a:6e63:24b7%4]) with mapi id 15.20.4150.027; Sat, 22 May 2021
 21:12:18 +0000
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
Subject: [PATCH v13 2/2] arm64: dts: imx: Add jpeg encoder/decoder nodes
Date:   Sun, 23 May 2021 00:10:55 +0300
Message-Id: <20210522211055.15988-3-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
References: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::41) To HE1PR04MB3146.eurprd04.prod.outlook.com
 (2603:10a6:7:21::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Sat, 22 May 2021 21:12:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdbe77a0-ebf6-45d7-88f2-08d91d664810
X-MS-TrafficTypeDiagnostic: HE1PR04MB3260:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR04MB3260BE83052D935A653D437ECE289@HE1PR04MB3260.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3a4wD5vHnlwZfaL7olliLX7kA6a5hPawhCrQZFe2AuIl0L43P2/4Ja7KRU09R8F8oHyT1hUxAqcWCSlBsG8m8SfQHXxv8kv/KZ80q6vTw/W1lu6SkTI9PgKniG8NFonYN0DW71KEL0o+fhsc7VIZKLCVZm9LxcSamxLjAOVpS/dQF07IDgfWaA1xg1E8se2QJ4MAe/wwNI4mFraYjOXn7DIoTA/789m2sBcdVm7KH+g+GG+jP3XsYFpXMyMZyTJEGTLB3EkmVSqdmu+nv+khzH8OoRxXhwSe2oAF9AczZg07iL4oklI1VKNXrNFpj2RKFIt+4kT82P0eXsE1Mp+74juyu+1MwjBmvDUPbIWUuxXQQXU845CId8QE9wntGvDi0LIMxFFqjmPCOklRJwncLESiFrNLwC1Glt16c+pTyaCJ93/95gEUSlnYGApgTCpIGi0JN1KqLUcRRfeKTjGYh305wOcg6R2plAWxsxA/oCiDZncaujcjZy3RtYCKTvxolm3W/YVZAUBnZXIKgog2FpXI+gDp7w42AYjtTbqlAKco2U99Ni3O1VVwMSBFyUP8ghr1LWjRZEKz0CpVGsXnmM1LhTvlpXn5Vg0cZepcCzTACnj/xmQglCb2Ps5eckz9IGIe03Mq1A6UMNtv9YoVPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR04MB3146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(8676002)(26005)(2906002)(5660300002)(478600001)(6506007)(316002)(52116002)(7416002)(4326008)(38350700002)(38100700002)(66556008)(6486002)(6512007)(66946007)(66476007)(8936002)(186003)(83380400001)(86362001)(16526019)(956004)(2616005)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H3bxFedHkOXT1ZYzlTroWDqFtLIYao+46E2AEX6uCoovLEAJ+XNZ3W03GMv5?=
 =?us-ascii?Q?+b9Mc69LfNFn3P66lTWlcnydamF9aYqdVIX4IORNJmBEG2VWD9FCwhqwQRHu?=
 =?us-ascii?Q?YqMg/y3u+7RVz6mg/bKWDWmT7hEoVgYGG0KMRR8SV6Edd2F8Sc7qp8dBIy93?=
 =?us-ascii?Q?v3lFCb7he5/T4VjYH4mkp/9N+Rag/mE7hS86hUghC9JypCV97FKxnI+vRmSz?=
 =?us-ascii?Q?MWcQ809OGqgMx32+/IyIA8w3OR+VEKgDmKgxjkly/A6hFLZ0uFrsIni1s4OO?=
 =?us-ascii?Q?UWu3zRoaVW2+j8B8Xs+Q7XboBg/fb2suIm4MuOnZ5pN3LAuldpmEat70rcD7?=
 =?us-ascii?Q?ZIwRRyEWY69NnMrc20DvqXGUXjdJqQSjW8LvWMTqGqktqLy3CERw73ItFSFG?=
 =?us-ascii?Q?UuuAmXBVfRlQWJ0dyxRCqGRYDpkpBpgOUDu95jcikxRdRi7LUr0C4y0Y5cbA?=
 =?us-ascii?Q?CH8c+wwj2Ns6zVlyxNCurKeJ/xUDdojar+n1ryrZsA7y95WOf9SG0i+6PON8?=
 =?us-ascii?Q?fBPnDn8a1UwGkwi97pVJpLCJRZzPpKRBV9NY1xRVgJGcaVYLewpxFaE1tVlK?=
 =?us-ascii?Q?4P28n93ulrZOYU3Y0ywUsJHg7poT5VXkcnRerfUktmJgFjSJq0gnV/qzaevK?=
 =?us-ascii?Q?yWE5F5DYECQa5BlxSoPB+AM9Kvq8wXH34/LIjfonL/A6viTEZltxtzsqV7Qq?=
 =?us-ascii?Q?CQkySyJRzTtzJP2oGW/eLPIwaMwTtaRR+5os2m0FdczMQ5hrfBj2RgZFJUcX?=
 =?us-ascii?Q?+EeH0fhYZ3PbwDw6p5vPjQrwxQMaZOaFZpMbw/yaubbXTM9D/87xoPUYqjBk?=
 =?us-ascii?Q?RuCvIkFHsTXv7yWmYjWtZsau3BNAqPPCD5bPxT2oqa7kM9t5levB+wWAFxo+?=
 =?us-ascii?Q?2gzEbcfrulPaV0pDbDYiX9KkIOhY9jBW6wbirfvTywGXwWAz8ItFwO2gAAoh?=
 =?us-ascii?Q?pkjSm/CNfnCLpl7g/09JI8i1F1pmrPuARUBcW+iGYup2AP4q8MJbkuVoXUIx?=
 =?us-ascii?Q?/uufXO6mm0Y8piPUYJT7gTNffk3HLY70grTWK+DDErA7KOXA9Jc+orDAUD3y?=
 =?us-ascii?Q?7qQ6TxNt3a0TqwZ6ZySGPxofMu2qUsgxR0MGg6Q0LXjVniNk+4kLGh0fpJiL?=
 =?us-ascii?Q?DRN9beOEQ4LzQ1Lr56F3x1IidOVi+vMj+ChTTgmSQyGdNaBrq7Ox2GCNH+2U?=
 =?us-ascii?Q?MSB8HpN0bSrlHgiX9jCVA6GBhTIOQxtX5rEFTfBXZO3Xnj56Ugnxk5gmcfgk?=
 =?us-ascii?Q?W0EL57TwcdGixwsLHsaV1maKg6pEmqev03JzMdnbu8PoUXsctq7pNULV/0vu?=
 =?us-ascii?Q?T74Kj9ia4epfev0cVsrzizrW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbe77a0-ebf6-45d7-88f2-08d91d664810
X-MS-Exchange-CrossTenant-AuthSource: HE1PR04MB3146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2021 21:12:18.4457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c56+H+NG+wpkgc8N//NF/erB7Cu3LmH45yVynjtkq+e7ZOboG6Wk4xMz+Bo7X7M18NOv12lAZjSG3zzYZHwGWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3260
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add dts for imaging subsytem, include jpeg nodes here.
Tested on imx8qxp/qm.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v13:
  Adress feedback from Aisheng Dong and update the commit message:
  - Move jpeg compatibles from imx8-ss-img.dtsi to imx8qxp-ss-img.dtsi
  - Add imx8qm-ss-img.dtsi for i.MX8QM

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
index 000000000000..4b8456bb4712
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

