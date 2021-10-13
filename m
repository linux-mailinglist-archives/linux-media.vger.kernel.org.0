Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7026342BA5F
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 10:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238811AbhJMIbo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 04:31:44 -0400
Received: from mail-db8eur05on2078.outbound.protection.outlook.com ([40.107.20.78]:6081
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238986AbhJMIbd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 04:31:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5iPeKDXZZiwRulu6exgz+kW95bnkk/rwlruowswPG4P2LHfDJj7RxH88tweuZTcCuZHzBwgpIP01QRitpJaqe+bVeO0eMTw+3QN+NQyOAEzifVBWeQ0amjG+X+5TUI3s1JTvRYP4sCvOHcLQxi0GyBSzVe95zYZ4rWMzwOo0qE0Kz9m/Jq2exdhP24nV9MrdHuoF5exa9RWJ+gtJgvO6sqNAvFSgJbbWHYzFWWSabGUCBcbqzijs9hoPWG3pW4jH51TWzLloKVfHFiD8ovRHPc4uxgmwM8d4R/To0LKneu4tU1p8Pz3iTT4rDCe/EAu+ulCpCPogU1qEs6kVqgw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iceZUBGFfFJacvhh2SyFahzcqY3LIWeknmOtYXejuaY=;
 b=fUkGF4SKAIkxoE2NviI4e8mJqKvbu9F8CQ/4q11kK5ZTXPKRDQZQZnCVh5s04kn/eawn/LbGfhy32arb/Tg6ltnv4YLC+djb3R3UyBXOat6CQ6P+D4h1D74wQIDVdvTMeeD/km3DlgjIc+EokcVHfT1/REphhUblIBpXvRNoDuhpqACUBwO3DVzH+Yed+rBs4I1XRzoSz0OZwxeQFZofCNuGHDR7gJXG69q0r2mNrOugB+oZsmTaH3NDEbe3jMhrpYZqUz/MF+HDbjX6Cux/9AkgCTjNJ4fD2u3gwdo5pi1SU8u/8qnFFLiE8MJOf5Z+7VHM5ip6GZp0SqAVlj2c1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iceZUBGFfFJacvhh2SyFahzcqY3LIWeknmOtYXejuaY=;
 b=LRv2vQrHCql3OHOHkgHMOHfTsKGu/Fxi4y85tXKoWMY+91PJnURRP63XgmOXPi2ZgINOZ+cgtYKnE5WnFlQ1Fk3YDZVgGRelBINuZNGVR9r+W4nEeCRzSdhHr+v5oUqNyXdFtCRpXGsL5Phbc34rDjn1jZzi1vC5N3IMalXguAo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4789.eurprd04.prod.outlook.com (2603:10a6:20b:7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Wed, 13 Oct
 2021 08:29:11 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 08:29:11 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 11/13] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Wed, 13 Oct 2021 16:27:27 +0800
Message-Id: <f848dc76e8557781082124f4a4d388546f7008f6.1634095309.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634095309.git.ming.qian@nxp.com>
References: <cover.1634095309.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0121.apcprd03.prod.outlook.com
 (2603:1096:4:91::25) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR03CA0121.apcprd03.prod.outlook.com (2603:1096:4:91::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.12 via Frontend Transport; Wed, 13 Oct 2021 08:29:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70fc99d4-4bd8-430e-f2f3-08d98e238856
X-MS-TrafficTypeDiagnostic: AM6PR04MB4789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB478941FF7003631561FDF858E7B79@AM6PR04MB4789.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QkLE5E0LqYnKrc1VVcJz8G+ZusnCeVMe9fXmu+lVNSWp79PwwgebxXUJnyKG3U3TniT4Ia51Ue7gAuQEUk4OTY7BSDS6j6aX7jDN5PtKR/XWS5DxxZ8zF3uSYBcG5an3wTe2o6/vUoxGuS8RYyLH6nJI/izDuhUviUrsP2GZYQtDcO7Y/VOPrYNVx0EUtm0Mth2ucA0ma/7lhXwx7dnzuYNE2hU118/4N0kTevmxSS70jXl9mctllv3/sKT07z5+ogaRifEZgswN6X2Hc9yqZ18j263JSyC2GBYn79BQUDddwKAnwsm2I6Xgi3fgBAP9HG8L/uzfM7GtLh8Ens7wtd4eSPjQBDp7ZH4mGza4KoeDrRzvY8BhdqQIc2ZXDeEZre9S/5eWGla8pea0jsd+t6jFoV1eHUIvhAWWMA36u3SYqh0o6TUpuozaUB+59sH/Xxbrzlb9W4ZXQt0gHntl/1CQKMtwbwOiJZeDDUzDh1w0bFCAzQR1M59+aycfQyEJ86yTRZsSdmJQRpCOsS5XHUNIIjAA5HcraT2EOAa4kTVUZu+Aq+wSTPSH25xMlLCdEcM5+6GmMnHQk92L9jPAFWFWxE4pYykZ57MeEmHEqWUBdhTlHdhJujxJ2E0MyG4avNHlFaZbAHMRloCtknXY/RJIyUJzPQ0hjufFUQvbWvRIWzFPkNVczxjekCOashXkXfOiavXPjaVWbNNiIm8yFKX5zcNZqcjkZFWW8H5vFLaTN+bR5AaUo9hMcMusQw66Vbrgj5/WNwvbhgZBuBj8sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(36756003)(83380400001)(186003)(2616005)(66556008)(66946007)(26005)(956004)(66476007)(6486002)(44832011)(316002)(7696005)(86362001)(6666004)(508600001)(52116002)(8676002)(4326008)(38100700002)(5660300002)(7416002)(38350700002)(8936002)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RVleAHDTxq72g/MBijSUNVWW3OGff+wqKepV/bFo3aGXXbTHeQF8tHLFUrOT?=
 =?us-ascii?Q?uPofmPtAFC1b4YcvB+a4Ou7v8+5hYdnE2Gjt34xvrP7Z3bf1gxY4CNnqX57i?=
 =?us-ascii?Q?oMzdsYbSW56VItlcE1E7njD7raQbyj+eKmpfnHJDuqBGiDcLUpC4ERSNv7ey?=
 =?us-ascii?Q?oJ3U2qXmPV1vRUjeRXi4KAUz93j7/1w4wqn9nviSsSGNUqHVD9WVJbuOt8BI?=
 =?us-ascii?Q?XMyG8ZV1gULIcPodcWqHj1CWGHc6Qcr+FibbWtgATB91HraiTqusEHMZY6yD?=
 =?us-ascii?Q?eSRAzebkYB3OtdQeaJmcKgs0XGtRzcHwvxC1jtNHMz1yglEeDWMrq43j35N3?=
 =?us-ascii?Q?XtTd5L8sFPvNHe8ASCuynjqkhMhs6KY5mwVK28jhqmM5imFo4NijianhQ95w?=
 =?us-ascii?Q?Sl9n7OXZXkTS3GmZNVtGXyIyB4RHXLeFMOECchPQ7dwwmSgjohn+KgXINx/B?=
 =?us-ascii?Q?VsjEakxLbPi85aVvD0IV9++X8zriQRTJGTz+UxIl92tbDm+Tl6ZFKMSFDyB3?=
 =?us-ascii?Q?P5oQv6I9aUp7Ex4jokSzlsCwEhUCl4Q0yxkG/ouCfrR5BPSUfSd6/HfKEVWV?=
 =?us-ascii?Q?XKAdPssK7En9SoR1W7cRSfP/t12RLn/TVeGfrvHQ7ESiJlvvCyvICXWhvIqg?=
 =?us-ascii?Q?KABqz/ZgR5OZ2J7NAz+imtH9wwK3Wb46dNJUE+LSgY2/+r7ZBZbom9TiuZkz?=
 =?us-ascii?Q?LWbNmiJ9NAi21ASczhMFRZogFvJQ0zL2aEy2Odb541IJVGVGC2h0N7Jm75ZE?=
 =?us-ascii?Q?t7ZgoGOrA4mUekeALBWbS9DPvtIpCnnjVOVJ9NYZIVrVJPjXFAKydOy0zXWx?=
 =?us-ascii?Q?nlcdlP9+T4jGukoerUuRyBnJq2BFBAxf2hdyjxYM7WRSBXK1zIaIDjqJtPWK?=
 =?us-ascii?Q?O3JnxlQwDb+WB33e1Bs4/PCHiTzF87TWZHuyALDS+NEWE+/iqUvcP3I5IFw4?=
 =?us-ascii?Q?0SUoilATWio3wLMABBoaVpFp5enQ55SIzfo+Evm/MEHB6OXFtaOqkeF+l7ZD?=
 =?us-ascii?Q?fjbHs8bCiEEuoy3BW7kM8GitQEtMT5k3tC2aBJf521OqYqI8HbA+Fl8PKr6y?=
 =?us-ascii?Q?8wq2R9F4QDaL4tYt2FhYz5ygVPJZ2m/bJ44xV++AK8AzOYDIAcr03VLiW5Ww?=
 =?us-ascii?Q?MrULju8JZGbhnE77Aczv2tti0+4FOW5yORwkfQqgabRXBEG5oexW/oE16paO?=
 =?us-ascii?Q?rg10YDwFwaTUIKSQtixmUqYcV1eGYsXZoA7IZJFZIbVHAQAc3ABms3P6g5ZB?=
 =?us-ascii?Q?SS6p6eYc1U1To/J0EWnCairYfo1Dr5ZOrlCZ6pGTj0UTjq1BoKo91sdxiz7V?=
 =?us-ascii?Q?nTMnOBhHqvS0K7+ezLy5FDDq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fc99d4-4bd8-430e-f2f3-08d98e238856
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:29:11.3684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVmn29/oOgRcLtGKTwlSJw7OB22ZFsrqERx93czjSe691n5zOXlzerWv5Mq8R2JW10Qv6pm59aAKnuZIR5fV9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4789
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
index 617618edf77e..6b6d3c71632b 100644
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
@@ -259,6 +282,7 @@ map0 {
 
 	/* sorted in register address */
 	#include "imx8-ss-img.dtsi"
+	#include "imx8-ss-vpu.dtsi"
 	#include "imx8-ss-adma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-ddr.dtsi"
-- 
2.33.0

