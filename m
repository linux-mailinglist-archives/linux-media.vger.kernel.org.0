Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24864087ED
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 11:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238684AbhIMJOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:14:43 -0400
Received: from mail-eopbgr140043.outbound.protection.outlook.com ([40.107.14.43]:39618
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238568AbhIMJOb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:14:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3yBJ/WiYkJguJ16jwfcqpMrsu0eFAv46NYUG9Hg0lXxcFAT5dYM+i9KNcwSpqs7DeyG59iMiqTsvZQXBMby+YzlvFzqVGrnxb9Pel1dpXZ1HF5CtuJWqcZ6WXL5s2u+tijPyTv36859y58OqpoxexBvK2W1wVNKex0GL24fna0vcz4wlGuyMoNsYxO74QG8TYpDQTmKxZf/S1R0IgFAWZarRb/JJeL1a17ZPoLB80oyATOt1ccWUbdsGzUHK0L3H0vVVkXb8itxFp3vFP/p0vZfIWw7qyPQLW1kuDqOty8kdf2eSdZ1Rzj18FQnSVyVXiwTIZjIORUWboLNA2JIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Gy0E1mCprw+OmDtGv+px3Xv40mATsTt0+v4XSM8p7Ys=;
 b=U3BS1W1l1bsmOUYwgJVTTifTNC0d89chHNis+rqct/1PmhEZ1dXKBQda696+zdgAvEEF1O6DCPuUedym2ILiBsB5oZxoHevWmMj9pPtgoWreoFS44wfDTAwPWRWSyfutvbg4x22TZkNM14o9aHMrosh37YPD4TMwY+tnPxqdJ8WdozJHsIYIz/LzFVCVgKgNDIOGivb194BmN90w03Y/Qiq6W4/BgrQlPqnlTJ5q30tIQKv/eKHJXL2n13AYlHrhT5UPDoYsw+lQRUV9V3PZw5zeyVJjUwjz+RXEfnnyiJ1w7yRkrdY5fEzV2h7cyMA4kQ4t592Hh/jWd/YpLJPwgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy0E1mCprw+OmDtGv+px3Xv40mATsTt0+v4XSM8p7Ys=;
 b=icMADYuV6q7miiqlmGb4wbHPFXtBsqvUDuoJWAkcKmBAcRv6Ss6Q8+2Q92LeUhdov3OvHEMa17dCw/BfBdxphNAc+RqfhcZTeAWRzIvRgIGETZx+1k0EJHxi8yxtbOBL6PxemeopMl50cw3ellcKNuZS0iv8Fg0zPJ1kr3g536c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3925.eurprd04.prod.outlook.com (2603:10a6:209:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 09:12:30 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 09:12:30 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 11/13] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Mon, 13 Sep 2021 17:11:13 +0800
Message-Id: <620081ca2f6441de6307792dbb7797da148cf04c.1631521295.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631521295.git.ming.qian@nxp.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0101.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::27) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR01CA0101.apcprd01.prod.exchangelabs.com (2603:1096:3:15::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend Transport; Mon, 13 Sep 2021 09:12:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b29729a3-396c-4e17-fa88-08d976969ccc
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3925:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3925583919E871E742FCAF43E7D99@AM6PR0402MB3925.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+weOpMcsqcGlXgYMRbd2ZOjbCf7sI3ae9rinkrBSU3ow8xnaR4Ri4WGsJprAJ4YkGXU7umA5Aj0tALXTLBGbx+64caj6Tu38Mfn6XOTJGM5J8SqY3kej4Z+ceT2xE9Kh6ZOmLjzMRIxrIfTUjuDtg221quYHR3nYU+iG9uN46ql7A7lWT64cSm7pTAoJ+mJZeiREu2se5mEx6qWzpGrSqEdgH5rr2nGmu5U3RJDvNzSHyN1klzx1j9psNQqQOiEuyT4ogUtnY7RqQpWxg7aJEBVVS11C+B9aM0CcqeeA08025/rHmICQvcsDkcE+5vIUHyMso/z9Yp+iU+01ZErkbcPUNAfnKYSzlVuyMDggDJBuMW4+zy6MRs+iY4Syj/jYcFTOQ+QFVDPXf2MwfZ/YP+SASTGRDbWN3G7PBoQC2ZyEyhh+syC9kwRiqoVQqiBeX68NedAjjjOWmmf9Y3rsWaRnUSR/nZp2cOheAbdZsv8RclI3TCbIW1rixUog4kRSSkrbf/CnMPL1NxRN2gDzQeKJRmCJ+2Q/8Yjq9Xm168IfEtH9mAGaLXwGrzKr7PcxrJcaDcawzrPneGPRGr0M9drCYMeukWISi2A4e9iS5mu1x4yb/tn+607f79Stfphu2oZ9yTNk2hUe/OF2gj/Y0RIgMgM8BTeA8zxyUhSNArd/82V8scOItcUBywy51+c+6XvLZw3OW1ndvWuLvJr23S3jOPVPMNXMqjNWqHstguk+O29Ekj8xWs62HQ5W0HhI6iUxhoYkWIQS/yuV6yrYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(7416002)(66946007)(66476007)(38350700002)(38100700002)(26005)(8676002)(6486002)(52116002)(7696005)(5660300002)(8936002)(83380400001)(186003)(66556008)(478600001)(956004)(6666004)(316002)(2616005)(36756003)(44832011)(4326008)(2906002)(86362001)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TH5adfazSMPm5pnhmA+Qmq8bNCfRBeRwQQLhlWdeY0P7OeKduYRtgeh6DQu1?=
 =?us-ascii?Q?kF+Rf3CAY3UseLZFIjLKOLfDGUj5iuXjAUM8b/YN7dh0gDdJ/Tv6hNwfr0l6?=
 =?us-ascii?Q?kPEEMDH4axkE9XaDJNEqXzCPMHtRYuuFYQ3Nv1TF9fynHnrTkASXT8OV4oxI?=
 =?us-ascii?Q?U44vBjC3lhJmEV39jLBJWmLT/Gs1ESqU6FAMwGK4eLo3zJdkWNrXbEaVg8+f?=
 =?us-ascii?Q?EuBRPrSUCUejyfDOhgV3W1mpblYHj0ZqLuL2PMGxojiqSsp3P7rJJ89MxpLV?=
 =?us-ascii?Q?bXn5v+rfvPLNQQER8Au6HMX4bGyxAXje6pXJ1A0eJtkfCHqJDoJTiq6WG0z1?=
 =?us-ascii?Q?bliBTNYr8Cb7+qijHUu3H3BzIpaLABRJzMXU7yBxHVP2ua1IfPxeB+t0NlFk?=
 =?us-ascii?Q?snEPZ9UkAliUqCefGEUAjBSs3/B48gmh4//wDRrXGIDCkj6V3uQuEdW6quYB?=
 =?us-ascii?Q?OT8VxCKXVSiEKmhYpUVhYkYKjV8+5Pec74+8eawofdoce6yrtHlBhgsKsE+T?=
 =?us-ascii?Q?NQT7lDkMSi6V5Kf9AOtrLqKpl/1i8Ih+VvsqSoS/XJgEO+uT0BidCJjAPB/x?=
 =?us-ascii?Q?dErm/I3GwAuFsJBTFWumnRemiyLxyYfAULNf+2FGx46aJmo2q6ORX6DmeRZt?=
 =?us-ascii?Q?zvFOYcIQEBVErBfxnKYnXv0JXm4HsCHH/xXh85wsRKeEDLnX1NiXLEOzSNl/?=
 =?us-ascii?Q?+W3xE8xSVbG5Z3vf9jC4Fb59NkVwgxX200jJ1fH08iAGGZ9UlQtP0K5ux0JF?=
 =?us-ascii?Q?iDtpRGZ2HMyh5pmy4VQcs0KKIZ8QMMPiYFMNSIA5F4KpwId8fUBZPWlGOkWe?=
 =?us-ascii?Q?6YGo1GzZ2b6RTSGRUiQUGsEFOm/PPrgeLXnv11b6ln17erllu1HfVfmNgTtq?=
 =?us-ascii?Q?sjfeodJPVwCzlAQS8zXxa/MxpZIKGkO+F76ZK6ulGjwWwiSOs1/cSjY3hFH9?=
 =?us-ascii?Q?l8N2rm+f/NXg4MUhYHRbanWH/oR2tsx3nrOT4TGfr0PxlwU5kKNdKbw3Ehjc?=
 =?us-ascii?Q?TCTaN54fowu39f7U+rYt3EQSf7JY/YMq3DTrRZEwtERVM+2KbmgbM7T4uFnQ?=
 =?us-ascii?Q?DKRt5Wmdm0p8YY9n30w8aM46q+X4bCrAyB+JjDW946FTGWCsPke1++w1+Jx8?=
 =?us-ascii?Q?+N7x9egellZXkps1FSz+WqS98BZ0lTh1j1mGK/Xto4SSiSeMDu/ZrnLb0u6W?=
 =?us-ascii?Q?j7OMa9eJkTawXoZn+8Pbh4wtq3G4O8TS8+NkKH/ybEgA4kH8bHeRCe0knBl8?=
 =?us-ascii?Q?lFJ2xsvHhNxXa/QTVxC7kjkDIW9BKEoNG2TvEKG0ewnkpE/JH1fkDOmE3yHo?=
 =?us-ascii?Q?VlmFV1/S4cozNbyIxLC/2hgo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b29729a3-396c-4e17-fa88-08d976969ccc
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 09:12:29.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eS9WkKWBHjRGgUpNjc5az4zpePgDqRAFPnMi1QsL9WQ+OQjVjTPd2ofXTlJ/1eKTXUOHUYVBJF97hABk/XU1PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3925
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the Video Processing Unit node for IMX8Q SoC.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi | 72 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 17 +++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 24 +++++++
 3 files changed, 113 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
new file mode 100644
index 000000000000..f2dde6d14ca3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+vpu: vpu@2c000000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x2c000000 0x0 0x2c000000 0x2000000>;
+	reg = <0 0x2c000000 0 0x1000000>;
+	power-domains = <&pd IMX_SC_R_VPU>;
+	status = "disabled";
+
+	mu_m0: mailbox@2d000000 {
+		compatible = "fsl,imx6sx-mu";
+		reg = <0x2d000000 0x20000>;
+		interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		power-domains = <&pd IMX_SC_R_VPU_MU_0>;
+		status = "okay";
+	};
+
+	mu1_m0: mailbox@2d020000 {
+		compatible = "fsl,imx6sx-mu";
+		reg = <0x2d020000 0x20000>;
+		interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		power-domains = <&pd IMX_SC_R_VPU_MU_1>;
+		status = "okay";
+	};
+
+	mu2_m0: mailbox@2d040000 {
+		compatible = "fsl,imx6sx-mu";
+		reg = <0x2d040000 0x20000>;
+		interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		power-domains = <&pd IMX_SC_R_VPU_MU_2>;
+		status = "disabled";
+	};
+
+	vpu_core0: vpu_core@2d080000 {
+		reg = <0x2d080000 0x10000>;
+		compatible = "nxp,imx8q-vpu-decoder";
+		power-domains = <&pd IMX_SC_R_VPU_DEC_0>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu_m0 0 0>,
+			<&mu_m0 0 1>,
+			<&mu_m0 1 0>;
+		status = "disabled";
+	};
+	vpu_core1: vpu_core@2d090000 {
+		reg = <0x2d090000 0x10000>;
+		compatible = "nxp,imx8q-vpu-encoder";
+		power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu1_m0 0 0>,
+			<&mu1_m0 0 1>,
+			<&mu1_m0 1 0>;
+		status = "disabled";
+	};
+	vpu_core2: vpu_core@2d0a0000 {
+		reg = <0x2d0a0000 0x10000>;
+		compatible = "nxp,imx8q-vpu-encoder";
+		power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu2_m0 0 0>,
+			<&mu2_m0 0 1>,
+			<&mu2_m0 1 0>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 863232a47004..05495b60beb8 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -196,6 +196,23 @@ &usdhc2 {
 	status = "okay";
 };
 
+&vpu {
+	compatible = "nxp,imx8qxp-vpu";
+	status = "okay";
+};
+
+&vpu_core0 {
+	reg = <0x2d040000 0x10000>;
+	memory-region = <&decoder_boot>, <&decoder_rpc>;
+	status = "okay";
+};
+
+&vpu_core1 {
+	reg = <0x2d050000 0x10000>;
+	memory-region = <&encoder_boot>, <&encoder_rpc>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 1e6b4995091e..6b421cfa5534 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -46,6 +46,9 @@ aliases {
 		serial1 = &lpuart1;
 		serial2 = &lpuart2;
 		serial3 = &lpuart3;
+		vpu_core0 = &vpu_core0;
+		vpu_core1 = &vpu_core1;
+		vpu_core2 = &vpu_core2;
 	};
 
 	cpus {
@@ -134,10 +137,30 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		decoder_boot: decoder-boot@84000000 {
+			reg = <0 0x84000000 0 0x2000000>;
+			no-map;
+		};
+
+		encoder_boot: encoder-boot@86000000 {
+			reg = <0 0x86000000 0 0x200000>;
+			no-map;
+		};
+
+		decoder_rpc: decoder-rpc@0x92000000 {
+			reg = <0 0x92000000 0 0x100000>;
+			no-map;
+		};
+
 		dsp_reserved: dsp@92400000 {
 			reg = <0 0x92400000 0 0x2000000>;
 			no-map;
 		};
+
+		encoder_rpc: encoder-rpc@0x94400000 {
+			reg = <0 0x94400000 0 0x700000>;
+			no-map;
+		};
 	};
 
 	pmu {
@@ -258,6 +281,7 @@ map0 {
 	};
 
 	/* sorted in register address */
+	#include "imx8-ss-vpu.dtsi"
 	#include "imx8-ss-adma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-ddr.dtsi"
-- 
2.32.0

