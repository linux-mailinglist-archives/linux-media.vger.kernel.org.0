Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981D944AA4A
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 10:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244775AbhKIJNq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 04:13:46 -0500
Received: from mail-eopbgr140087.outbound.protection.outlook.com ([40.107.14.87]:55280
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244807AbhKIJNW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 04:13:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuBpomBo3xv94MsbsIq4MBUFJtNNmXWwX/HgPsAau6eyfSYfSNmDDWsgJmsMLG1dm1/1Sf5Jeh0TgAo5NWiJ9xCzxz0qpXcMcDymF9KzTJsxurfOhz06Mpvp8EjbiWzuwqEBpFKQ6CgbCvgKfUxAKKWXKozy2x8ZPYCI40+5Tk+GuJpdiUiJ6zAx0i/NpNFDv9UeDlqadci+IIy5QQv/rpIp7xs0xAG7+CkrCJl2CMYuqzyymjDeytHpprmGWeEe+iPsrP9ijbluXOizvOutE44EDAW379s0c5rWl/9+6swv+YF+a1V/htrJyYG92UJZ5MIydwV/7iT7LFReKyM6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iceZUBGFfFJacvhh2SyFahzcqY3LIWeknmOtYXejuaY=;
 b=bN7Zs5afc3eRXdWjBlL+mACY8E0P9doSvh7pEiTIQEZgKtjbB/2NNlZwqC3zmjJKYt3HSvwHtDzckqMEhXTT3UKp/EAfZcU4lsQvpq03mjL5pbKZjUaPaxf8hRH29H7H2tP0FAjRZoK3ujT8scOsz/TnYMs0laQUuMgGt/TodoHgufAODB2xGHP+WTKBuYgPjqb8iS5QYcSzAQLHwk6PSlLu1geERvmXZa7VXMvMR6FjEWOQdxM8bi/dKasUyARUa7WOY3NG0lB5L+pQVRCBOLahZFeZdbIP6CN2x2RfI2cSdntkQnbCeO5RMTbTIubIRqXjwljHQlUMhJJWQ5ATBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iceZUBGFfFJacvhh2SyFahzcqY3LIWeknmOtYXejuaY=;
 b=g6kR/ECVLLhLcz1cglD1qodjDpmwb5liNsUROIYpfJmkbXGxr/yhWWcbygJYu2g/reTfauD3OqhKuNOHSxppmV989kUP8WOFSQN0QluhtascjWUYwhQ5q+i5UnvtcwP5x8JarrmUv6PkpGD3KExMvfKHDXDO+/vpVdH6gr2DXEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 09:10:31 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:10:31 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 11/13] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Tue,  9 Nov 2021 17:09:10 +0800
Message-Id: <d7c52bfa3c64d456e06f800f413341a0c119e7c0.1636445575.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1636445575.git.ming.qian@nxp.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend Transport; Tue, 9 Nov 2021 09:10:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44402f9f-cb0f-458a-5c24-08d9a360c7d3
X-MS-TrafficTypeDiagnostic: AS8PR04MB8278:
X-Microsoft-Antispam-PRVS: <AS8PR04MB82786941C364805D97345308E7929@AS8PR04MB8278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vDhoEgxV+hWxbBCBJFhiBULm0nVnf1VNVwNlFmMgs58IwHfOtLUHTFuy0qB4RRsctXeTmI5UTzT1gp3Tz66rscftLFVNWdhksaU8TrfkZlXmwgXY6G+N7FzPvQ1QtgGwVVpvU4ZaeCExXrEo2bl1/fFaI/0aG+vv5zngBhcsYBQgkCNeSmAqjc0dP+K/kj357PHr+iy4CwmwAq7r6bAPn3e1QqRqzzimLi/X3wB+FbdyAEFpHK6dzxVKyY8/mOlPtemSUPQX64QbkvPcRWhIOVtC6tv5AlQeNVHyv/vu7KQNSjJERF20n+a72U3hmVJbn5tnUBQC+sf0S3YX1mSC0mcS/NGtiJ5KgLtON+Mzg98EZuI11jPyNKybv6+Tck4PujBm28bVtrbVYWoCc3i/wxwQ0IuO/8I4FuUBTqYXYWmB074DeXGJcdqr+NupTzi8Hq2JWF29jqeDWP5RD+G0eB/zezI7G5yojNwzmp5MLtzF+qJKZbGP+0HMHWhRnTUSO9ipb5SrgeZagWgqoQ6db5JIK0pXYN8Z4DHnO0/POK9tYphV/uEErI9LhcrpVLV+FGx1z2T/mtSpEbqt4XL2FMvS3qrtdVk+eWvCCejvHWTGk9TlXVojc7yC7XwgFLHO87cZPCHQ1HTKmHhp9znHepqhKZsJATAMGimDxtuGS5zVyrTgM3iuW1r1YjtzvnMcCyo+OXHDXqUmHZrkSSrkPZ4Mh/DgOCExYriyo4VARdkzStKp2PrHrNbh9jYiTtccK1srevuz3ORiUGPwy0Ki9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(508600001)(6666004)(38100700002)(6486002)(956004)(4326008)(44832011)(5660300002)(26005)(316002)(7696005)(52116002)(38350700002)(2906002)(186003)(8936002)(36756003)(66476007)(66556008)(8676002)(7416002)(83380400001)(66946007)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qaOcPombIk5EkeocP1bgRPG5aoyIenXiOtgg/o3YOeR725MFCYeKKGcwtB6u?=
 =?us-ascii?Q?ygzxrVJyT2pjkC95xZo1R6hr2yJz9s7kbzYNjmRc0dmhKWoUK/Zo6/6/859F?=
 =?us-ascii?Q?7qe/wI5UM8RToTK2GyxaBGlPLaD/OHMrRd+CIEJRJ3CZ9ye8+16M42FoCSVv?=
 =?us-ascii?Q?mTVD54yjKlYb5m8Sx3MFv5YKl8mXAa7zVP5V2oVNRrtYT6sJtMH4ZWMwbj5/?=
 =?us-ascii?Q?iYYm2wK0KrMpouPxc6KpCuUsXdlUi8J4PrZB7TIG81fWa+MCAafLFsQt7Q6m?=
 =?us-ascii?Q?jc5N5HmGGSrtELLlYba3nh1gptuaal5jze//9jGjyqyZXv1AJJFOSqTxCAkQ?=
 =?us-ascii?Q?p1S1br9PJmS9OinBw8m2U6+5ISvaWjvO/8ZvY91Dt3u7q6CP+YU/pB+Xh+ps?=
 =?us-ascii?Q?O1865BtHqeqJnVm2KM85VVyCScF+AqovBCW4k+RCRw0RYVu0jPSw8A0cSATs?=
 =?us-ascii?Q?zLsNKe3fB4jQExwPLaj9LouPB9S1K57Pr2xl6hRkArXlMVZru71IqI8frV/J?=
 =?us-ascii?Q?ajPpF73GgyiUZSF6/9wBranhlOidzVjwU0jZjd45FZ6mbYFKzgL6tL7G8NGL?=
 =?us-ascii?Q?uFkNbvpol/nF71/63ErvVqgDsjpA20qLYKFl6yKq6U233ZdtcrCSFzX6dI2D?=
 =?us-ascii?Q?frpdhhjIUWC/+zho0JvN4uM5fSsGPaOvnow3WAmV+3j2okmKNWobOYn6kPDM?=
 =?us-ascii?Q?k4BsFHzgFmsjPwH20JWIJJHtFdAhn+gbbdw+vrjRmcDN3NlsUgsCT5UsL7SO?=
 =?us-ascii?Q?eKSFdCM010bUlyo/DUcaFcKRFaEMg691kr5mK5G91wg+v9AqU1z+mjMyC28V?=
 =?us-ascii?Q?gnhTM+fW2rVzjHvFTD37ybmRXv89RrvXbdnRlPMJZKnXSJ8GULRlOdToSAVf?=
 =?us-ascii?Q?9NzT8ONFuiNNh4RxwggMi/CT18e4bHeV70CkspDyQmbGrJngCQoE359dHp2W?=
 =?us-ascii?Q?p9p8Z5I+0YfrJcdlMMO8uwPODWiBxo8z7cb8Gc/AVg+r3L2WkjLgCy6wHl9o?=
 =?us-ascii?Q?1QcudnkTrnvX6xnVii+g2GdmDdC95hMKn3j1zhXEEJPsvppjj+5gRrPNOISe?=
 =?us-ascii?Q?cefb7nMi838g0rmqlynj7I/GA+N+3E33HNkm7coL7vRdsyFgU9035KHfz7wO?=
 =?us-ascii?Q?sMRZvkkyvFqJ32TE6mNnCidBCJQuL0mCk2u2LpNmkNm8WlTF1ke93FbmpIfV?=
 =?us-ascii?Q?PVuDp1ZxHAst7RAtW4AtGvKzwCqI/bXWVScStuzsTkZj/LknYNhHNf9E3BXX?=
 =?us-ascii?Q?xAq1Sy32Az84GEOWFJbJNbpUqhuyRKx+Izm0erWnZXmMjrhGDIDUmK5QYfn+?=
 =?us-ascii?Q?DLBcvyn41T5MY3UnpDm43eam24okstpDbNsphyQIJKL/a9PbzTz3TAJJAsy4?=
 =?us-ascii?Q?XoReTrV9c04E4+hkcjhzr2u524LVXShWZ64JxusLAC168D1CD2DM1WskZJQL?=
 =?us-ascii?Q?w5jUHALKwnn4z9ctCMXlFmFoo8doNMdwjKYaO4v/lEbB4up6ttxkHcGbU2C/?=
 =?us-ascii?Q?tuR9JtHMsAbdb20KHtZOSw7zYjjqs7ARj7mDc2NaEJ7uOw2IDzz0SLaG1cbK?=
 =?us-ascii?Q?2ZBl/YYaWVSeQbIK4x3zd/RGeZUze9Gkq6wB6IffpW8rQ/UMJPaPcLiuUlpb?=
 =?us-ascii?Q?yFFX9VwygwIH0w3FsGQX2cY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44402f9f-cb0f-458a-5c24-08d9a360c7d3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:10:31.6340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOIdoa3yiY2ffHod9aCgu9sn2lug+qsT7EhSqKG8E1UtHEMKsAa7Q//21RF37SK/ICzrLnE3Omp4nwrfAC5tcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278
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

