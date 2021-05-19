Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6847388693
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 07:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239653AbhESFfA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 01:35:00 -0400
Received: from mail-eopbgr140080.outbound.protection.outlook.com ([40.107.14.80]:27222
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240249AbhESFez (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 01:34:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heynkJCznnkGTqRAjQRNzg4eiAc/QXqYngAX3u2mAtm2bPpEQjUJJR+Q5uBiyjr6KZbzO3dU+V2xcvLzinRQ2HutyIJf40iiBkyP061aIz5DJHxKK6AsvopXUlCdCymz84kWWltPvtkTVs4ABhrdB8nw0wXBAWrnjWGBl42/W9Y8Ut5TwAwsZU/thKrxWjK+jIqy1KwgXZVag2JmvCp9+46mAnzfMSbbozl+Xq9noCJ2XhAQQHbQVMNZ3LcStsAC8LT47PFY5oM+CgkTkGe/yu8dnpvH4BY/VXhhuVHqmbo6O6MLTtB0+Ff1zwVYLI888sOHBZRLQ26VJpTbp4v0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7zVdU3S1l0rPZD0SuCFtJGIzUepuhxXwNQtLnqG2M8=;
 b=FXL8Vl3WrFZJdOn5yxLpQlRRAdku+Ypgwg1zBhxoCPx7FkJ/6PJ/jYnT4TOmpy9jiJHphcBo1D4qX469tvC1LpVmXKncr+rwGjBvr82jrHDcy4LTQMlqwEHFlXV32se+hCwANR+hJPz1f6wtq+LMK2CAWTD3aLYN+QSIHX52pdZoMmaf3X5IldEA6+V/3g5Jry6JNj6H5RA9HoAIZc/1OLMyIm7yMWcCbzzRGiHLPBDuc/nXzNONFo7YfpsSiKXBMFXkQK+txFvy/bItO1FRoAGyd6/6RwvpeFjXmeomLhPiaIm5ZONQQNGkcaGObiOVc1h03watgXS5G1w3QDt1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7zVdU3S1l0rPZD0SuCFtJGIzUepuhxXwNQtLnqG2M8=;
 b=drGGia3/DTAY9KKsaZDlZO8fVT61Qk6w/bLdoa+NJlTH4OxF03GaL939Kx6ZTOtDJR4dM/ewk7EcthoyVgRUkcUb13rUFEZTM1CIWKQVq3GchoHUDzxyQMRaHeI5ytTCzlFB13RNV6n2ZsyaTtPT6mZcQP7mcpFbqpce+jTLjqE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB8119.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 05:33:33 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 05:33:33 +0000
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
Date:   Wed, 19 May 2021 08:33:23 +0300
Message-Id: <20210519053323.27194-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1PR06CA0168.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::25) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1PR06CA0168.eurprd06.prod.outlook.com (2603:10a6:803:c8::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.32 via Frontend Transport; Wed, 19 May 2021 05:33:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f569ba20-8d78-4989-99bb-08d91a87a490
X-MS-TrafficTypeDiagnostic: AS8PR04MB8119:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB81194215F14FDF8745C6E3B7CE2B9@AS8PR04MB8119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n3Zvfy86Tf/z7huVQBtjQ25qjt2TQBKojWrbQeslW+w6GpwARcRHKg1/IlR2Bf1NAGRGYdxyVRl2yZHGU5UHaOo/D6cfNbiyeYm65Av2br4kyQQeReCK5J0nLw6jwEZZG7LW/pxl8SWR4kmSDIs2NhfNR0YcK1Wi46CdsskuYsqx7H39C1cSOTvH4+dGrtMaHEL6POg0AKYlu2uORkByShJXwwunzbFo2ATHj7+J1oCAhDh8AgbpXka38pAgvhN1gEAR+LO1nn9an7ccqtsFM8h/FIcgo4gXJxuMc/rsvFY7mUTauGNBGlBRt9LFJ2DhtnKxg51kV7jT56gwMEuafxjj2Djj7Qd2nIVTeSHqqhetv1xTE+IG6rVZCUrDC8dtUQU7hH/rvpI+9Hk7VGlYfLNK+U9PXDtCCFTYykwcxJnsWRK+I6k085SjZ8sIG3r8DFbrWWjpEZLwtTDQ5SZMMYGQokbeZylUEFtL3+WHM0jAlZK/qa7xXMYCA66SbGmBV3d3cW7/QPIy8+ZVJyfepYJU0dgDP5qJiIyZVIM28qjZSOT4IOxj0nKeDg8QWPMzWbV6eZkKCxJqfs4Wr71ZP0t2l0AuII1JNHcnOLfZj9WjGgNPc0DEfxcsy/xFJKCizL258X5Z9k4ZTF/O0CPhAEW0BuRDu/GKmgMIS0uC5arPVxUNmZBQScyLOVYLGB91
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(2616005)(956004)(6486002)(26005)(5660300002)(2906002)(52116002)(38100700002)(4326008)(7416002)(38350700002)(478600001)(8676002)(6506007)(8936002)(83380400001)(86362001)(66476007)(6666004)(1076003)(316002)(16526019)(6512007)(66556008)(66946007)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HFTZNcWhI3VxjYwXBJ/ZeUazFJf47xjwJ7WZbRshWRweeZPuS8AL5dQs95Mf?=
 =?us-ascii?Q?wcgSKvTSHziTe8/kbHEEyeTlKhpFYuLISHjOYNzx6Icw2D6kgJhLVCPuVWDW?=
 =?us-ascii?Q?i1aEqSgFZIZxrcM2xRxi0dqNTpE6IJKP6WAAYoqarZa9ZjTQ3MUINGf8x3u6?=
 =?us-ascii?Q?/2zUTMB9/AQiXMA/+EXALGGfcBq6AtV8SRzdYHyjULbi6oZkng23PJVPdsxH?=
 =?us-ascii?Q?AOgTFViqE5vm34bIhDN/C2urEncWL4anKvUIrq9w4f/SawnUxKbS1VwUWHKg?=
 =?us-ascii?Q?t74Pa2BpY8NpLXMhVZ8izVUcJQltHk1kaiw2eKqjiaAruiDtm35vopG+9Dcz?=
 =?us-ascii?Q?HqRR7fu0FcGK/DMQMukKr9RKBuiCOhkOUWJPxIoq47I5Ems3VRcFCkNRw4Q5?=
 =?us-ascii?Q?MAhQ0867yi7NUWir/uT4NZJE5VcizOm7pkFM7DkKPvhlrlnI6fHeCqU1TW4L?=
 =?us-ascii?Q?V8EVqRpWcUIXT4FCbQcJsUiNxI/sDSSgM5HaVfxyMC+c4JSLQJ8YF+JBQBUE?=
 =?us-ascii?Q?mqJm/9mtsyNIpbNmg6hjtou/v81sihns6Ew5r1zbBG8rd0ReoeQxwVO4ODf0?=
 =?us-ascii?Q?S/QEcXj/eIMate45PROWKsb1smTbHT3Kt1cWupqNP6+iF4tyuu2uDdwTsWcI?=
 =?us-ascii?Q?IdeWzdmQaZ6F9/NBoDaMJD9t1xq6FOGB2/vdnEe4SV9RJH3pioXiSnXIG8pe?=
 =?us-ascii?Q?vgfU/zboXUawjcUJ8LUQaCR+7OemxQE4OTo6lPffZhUc+9yxCot9/MVdX6SU?=
 =?us-ascii?Q?flZtEAXFuNHGL4oPahNrWWE9u5f4H7ixxYpePoYKhK+wSBzUFBFXqAkI/RKg?=
 =?us-ascii?Q?iooa07VnAi8ddd0SC3xvYoQbhr5Dw3uhol6Zv1MsOC74R4u9BbIBYza5r/xt?=
 =?us-ascii?Q?6KPwD3hZK+52eXnA+AZYFasJaiBFcuJLjVKLSlAi5UHNG79d5WKNaW9RU6Rw?=
 =?us-ascii?Q?Dt4vQvn0i85ImCnUtHxBSPPCD2QeecEo1nzK9c19WUC+uf5fSQaJq0MbCzt0?=
 =?us-ascii?Q?EX6Xe9T1yhQPTEn88f8L/8fxPylNqI0fZKrvOI1Ux9mamcdfqHKIuNBNYnhG?=
 =?us-ascii?Q?q/hmfO74StiKtIHNJwqFLthO+aJFuCXcWoBJ+19W70C/L0QLr7bWHjVrDYVl?=
 =?us-ascii?Q?VAJP4EbHIVagHhZxraMhyNS7aIp8WJTIdc0gzCQ3XXkvkb71ylicsHWtzwS4?=
 =?us-ascii?Q?urIv949CiAjjoQ5qeqTmCd97VnM87TE+51GXhb6S55D9u58DEUJ/1DKNzE08?=
 =?us-ascii?Q?Wm2GN3+yp+MMrH7mFT/KTQ6swd02qkLYNtqNXNVN8Z4nRT58kQoG8GJa/NhM?=
 =?us-ascii?Q?4yn4zp6OorpL9sAdrz9qn0+p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f569ba20-8d78-4989-99bb-08d91a87a490
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 05:33:33.5131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSc/Mj48kOdleVdWx5GjLl/zXTi6Y74Ze5P3IDeNXW7EdwrDvvv+ktLv23j5q4OcM5yJtfpDHC0Vzc/6nBT/Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8119
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

