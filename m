Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31AD642EC1B
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 10:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234324AbhJOI0V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 04:26:21 -0400
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]:29391
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235302AbhJOIZo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 04:25:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFd7jiy7kIxap+au2QKVTp+03utwuUT2+yQzTdQXgYe3jdAhWfbwXIQwG5G7cZyQvnQAcly+tGUizRG96Bze5g9NaBcuSHKgANzu4npxTriTubyTOBTHVeWD47bNS42/wMqUwwJynFKRHOdxh5dMMIOVp0CSH9bFlN2pC19VDs4AvbPTqnhDzpPqPaGsou00fvelP5jUu45Leq9xWhJwycLN1vBVdWymgpbnCSDW0u7S1/cc6LrY4KKUZDw/erpHfowFkx+5PIu+xTl1XtPjcwp00/Zd6FABmSp8tqzCLHYQZqUfoBwxIJ31zSMNCEIl8sMcucYApGicMIhnU7vYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iceZUBGFfFJacvhh2SyFahzcqY3LIWeknmOtYXejuaY=;
 b=OfnZN0Y2WjA2ZqJF5qHLW1NStd8it2nm66Jc9idomDOHSSwpjG8L/Cx/2Qse0HxwcevyaA/2gQmVgxRlSNvWDaFUA0vhOSqMiT0uEzG45AvFsKgG/p4Wb0yWAh/WH+oFKmj4+5mCForkFTpDNiDzLxtK9q8R75K3tRtoRSCsv2jsuUWuzSS7phSY8SdLBwnFChdI5pcMitG9e0P6FzXyz+BW+BtpI2KgWzhA3LfRfrQkZWWA+670gTm3GnfeaUUfrWOdmrYHdD/R/Dh3Luj2ll1Kc/ieSOZVEftx31PbPqwSsaALJXMoTW1pTxmaoHmtU+qSINURv8iLOg0GB+lZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iceZUBGFfFJacvhh2SyFahzcqY3LIWeknmOtYXejuaY=;
 b=hr9Rasp5q8gYfIQ1X/NDBwXzT1XTQKW8aaLGH0pUHA+ra8a7Q8BwADGZp4WfbewnLdI/ZoX1e75dEyu6MviHAuG1wxCdjB68gK0LYlmVR0TVlULqKtD4Cb294tjj3jKV4P60SLnjM+dLLuSDvZVaAQe1ixzuQNtknJkvs5XwBPI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3591.eurprd04.prod.outlook.com (2603:10a6:209:8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Fri, 15 Oct
 2021 08:23:35 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Fri, 15 Oct 2021
 08:23:34 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 11/13] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Fri, 15 Oct 2021 16:22:00 +0800
Message-Id: <82e0572a0a3f3dc9e859ebd9bcd2cf6505481726.1634282966.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634282966.git.ming.qian@nxp.com>
References: <cover.1634282966.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SI2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:4:194::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 08:23:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1aca1f9-003c-4ef8-edf3-08d98fb5148e
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3591BAA48D2186504DADC4A6E7B99@AM6PR0402MB3591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8qNgma3EoXYoah0BE6kc5T6ugQdARtOouvhWPcjWvATT2fUA0nmvJSfUOu2FBNLvOsEUqoC2qt8iF1RbGLGHjvxCuWHw7S25kYMd0pHrWANZ5dPs5iyB1uuWOeILU4+77wu6NGldT3UBYry/5ASSHl+3Osi/VEfJRaax/ViV5CBe9/ezyuy7gYfYUb3h/Ebgxr4QEvpEdwt//TYGzNfGQAa4A6Gwq3sX+WTcy80+l0dkbuyk6QLYYPMYvzouPrS9ZkOG7H3L8IYoOjrDQQyxrltndA5MqhhhRp3tVRa8ylSzRl2lfpWDkRwwHdJ/B0kvUqGnYteHVU/yRjAiYDVWqwIU7HZlAuN+DloUJt2l07jvNOvWA5TdF9FLkppYpJBsKv7/svMQk2TgZHbeTEdWOcJMhXUcqP3aNKfzuObS+LXFpFpQve0R9kNW+ztLPte4Qw9Yp6z10VgycmjoWSp7AAdaqki7TW7mz5pUJMdKkXAIIUkN+KH3iq6dOj/OZ2Q/hsSzCQYu7JoZvpahfd5ehAapf15T7aWtZb4tf0+CzjtKxvm2PY7T0WGMmUClNBlRYJricIQAdrOU5Io+IcK65OvyMItnFNNfwRZLnR0/LyFemSt5t53q3IL2G4f3KazNOqFicnvuBgOP3tWi+5m0qVgdbRD9ZN8CUpjKDmHePhS1w3C266xQxO3yi6fObqmrTSnaqMhp3tpqNDnUwbQsU+GGYzqeC2BTUAjvfyXZnod/u8lKnSyBjQtTJjRmOBQkX4mulE3JobENo24aX+tCbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(86362001)(66556008)(8936002)(956004)(8676002)(316002)(508600001)(26005)(6486002)(186003)(4326008)(7416002)(2906002)(6666004)(52116002)(7696005)(2616005)(66946007)(5660300002)(66476007)(38100700002)(36756003)(38350700002)(44832011)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T2LWRRMbhzhSg8wbi/kD9A8ndyOJn7fTXDGPCVcDNuY73Vl3XUmtKYRErTYD?=
 =?us-ascii?Q?oZgitTV9pvkufKycscidBZN8tjYGChD0fWr/p1R4LlZNG9Yfbv0ftd9pJqcO?=
 =?us-ascii?Q?CKHfs78/0NFhScjey1NPIS1BC2gNhCm0zCDkW4qjEvDjbOOzfVnGycGI6Nxg?=
 =?us-ascii?Q?gN3v4QzItPL5Gm/cM/VdpPuvRvD3Hceru0zq/3mKBsT4WMbj9Jxo1uvfDZzv?=
 =?us-ascii?Q?ty1BoBunHRfEuW19kzREux+rXo+6rsQLiNUl7tFzUWqAQrBH9gdkjehwfOam?=
 =?us-ascii?Q?n010CUlo3DzdnQnIe1tFQqgJ7nmAEKd/yn12lXE4nURmaN+fUDYLiOzRSY0C?=
 =?us-ascii?Q?q38Cp8CRWX1+KIh0RtKO67NbqN1VNfBxy6UP5bplZDX2W/KmM1XDTH7hQVEI?=
 =?us-ascii?Q?+9gXAC3rl3kzxTcYJhMVe09jHl3Z0xbaMW++fLyKO9JsVPomYO49ppZOU7Rm?=
 =?us-ascii?Q?sqnurHSeCS0FRQrOVHUjc2nrtUGjUkfONBoKOk2mjFygc3M5lUIpBHa18+UV?=
 =?us-ascii?Q?KwDc9Hwr+zMZoHENClwaAuD2SXYoDfU+iWF68EdF9Rsj2VG+VsoclIqO8QZ5?=
 =?us-ascii?Q?W/o71cRqDH8DTzmakpQRczVdCKIyEfPyp/qIs7hQbC8T1mdB+Cp5gdn08cj+?=
 =?us-ascii?Q?xYlMNBFoMjqIknnubbZ+Wa7Mtglj9rkVnjPzeEaFB1BIF2OZjJRNBDYLDjFf?=
 =?us-ascii?Q?8EGsTAdg6tVZ3DsC64oPIZ/A+o4XHPpCPRkw0qJl/H/Oar+WlATrnvCYxmaF?=
 =?us-ascii?Q?uNBtpQKSHzMjPM0nNHjJiEjlhxiUespWHTGTC6/D3gveuBHAqsFXv4TE63zb?=
 =?us-ascii?Q?mRV7Uh5xUyfL3IE2HZOHbNIX4mOFe36qdKkKBK3okA8kyGCE69zba1gZFR9k?=
 =?us-ascii?Q?43kBNbLFACo5z1J2fcBUKXaN8gCzs2h5EO1IEWqIhEbmUJfMAs4gXUMono1M?=
 =?us-ascii?Q?qwvKVoqd/oOcB7KsE2YGO0BaTWpqFeOr9bA3bYQGtvLh78wUOxbVIb1YgaSh?=
 =?us-ascii?Q?wuj7+d1IVEUZpibcokK2zo0z5lGlt9VJK+/WpBwCCubjCAeJevzESsPQBhnY?=
 =?us-ascii?Q?ZQJL4zdWjL/g9EJ0y1Aqsaou7GUR53AJkQBDp6i9UoEsQHead7k9ZwRFGYVh?=
 =?us-ascii?Q?p0wWxSDW2hSox6tkJJW/k+NWPtALRvjnwVnERVo4LDaTqgV+7IhRAvRcu+kZ?=
 =?us-ascii?Q?+cwUe155+JXATmuaELBPsvsvyNceiPaN3X1L9siYT/025eFcYxpTg+7WNfSN?=
 =?us-ascii?Q?9gg5EIJHQjy+lX6UdSPMA7KcR5d+oB6xQqUNHUUq75zFyaf0QJUxj6037Hff?=
 =?us-ascii?Q?V7s/3VzFZUU/jLrKUpp35gNl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1aca1f9-003c-4ef8-edf3-08d98fb5148e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:23:34.8268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mS68ifdvIsnCQSGNHScPLuP8MlpqRr07XlyFScWwKYdLREVQfoVQX1YGM9edTP/dlf83za5yw9NL9d6BpewHZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3591
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

