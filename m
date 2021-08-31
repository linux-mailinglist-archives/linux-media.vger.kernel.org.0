Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4E03FC11F
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 05:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239530AbhHaDDO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 23:03:14 -0400
Received: from mail-eopbgr00063.outbound.protection.outlook.com ([40.107.0.63]:56994
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239726AbhHaDCi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 23:02:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dus0nF+8FNCAnxfsORMYauP0Np9EMmEaGvavkFBZaNbpYoa7P2bKgxVqZ3lIjwvLNDjvsNbgVdI8l0xTxJti/8WBb2K0NyttvyG3mMeS7k43zRtptbyKyywUjdm1oPW9M51KBzD7OWNy6gf4JKvk7CCt6eHKEjQqPuqxpcWKDO58xain/VUIrEdACiT49q5Z0+Vz+f9rgsaPYj1h28juQOfWHQw0ld9Zwfd2lQVT//e7VWJfuY2IzWQlaibhWNIYsuz+NJVQoHl8ykKgjLEWPQNlxHcjllmRCZkMnnW03CvG20oJKH+liqatKL2yLmzCPBbhDSHj5SeaaewId2/tCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy0E1mCprw+OmDtGv+px3Xv40mATsTt0+v4XSM8p7Ys=;
 b=Tzn+1ZFVMoMfTQ2x61AdBAvX9+r8xu/hlNIOFdUIEG80TVyTHOXZVHxUqslNVtmGtxqVHJh+dYpGI0c7MT/lX5/scb7s/4Gi9OrE6XMgjcYsOF45yD1mOD/hrgVIPNKC8WusyhBbcuVKRmr/auJLguaE2atIycyVwhDx+xcUODGno8O1ja4w379fCoapqAuMxLrgOdEgVS60HPnslrAeBYYsf60hjq+e4+yMwodsoYue43sSeZ6vP8rMxywKq44rCYGRFsFdY4vGLXMhrG6njnHDAOtOuMcmfzZlUGHqUfrcSJsSL8HQ32cGbCABp818DQhVpLC3/N9Yxz5QGuapHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy0E1mCprw+OmDtGv+px3Xv40mATsTt0+v4XSM8p7Ys=;
 b=pL+dqItVAGCYGapaM1a3+8nnIvfEW25d+PH1xp7QNe1m60OdnFU3gSsx5iKZOfA5aO2pa/qwVyA03WYuGNHF8rrQJiLlJ2m67IpS/Me1N2cmEzdyDsdT5Y7GB3RJ5DGlwbFVTfYRhqEwr7JX/m+Zborz0CQz1LoD/zHJGfxaI1I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4888.eurprd04.prod.outlook.com (2603:10a6:20b:12::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 03:00:48 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 03:00:48 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 12/14] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Tue, 31 Aug 2021 10:59:13 +0800
Message-Id: <7fce243c6ffd73c92ac49ebd160e78cef92bef77.1630377507.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1630377507.git.ming.qian@nxp.com>
References: <cover.1630377507.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 03:00:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82cf87e5-e156-4ab7-90f7-08d96c2b8874
X-MS-TrafficTypeDiagnostic: AM6PR04MB4888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4888D9C7B729FA84B915995CE7CC9@AM6PR04MB4888.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mo+N5eFmrlo7G7dlF8yZDB+PeVXU77V2ckYJ8UfFp2fqtWGE1RBEgveVB3LZ8Hb1+UD8P3hZTyV3tfcjx009+ECnu9veeEq3CpEwYMIjvIgLRXIYTM6NOOvXFQLyuXCFl37nH4dgVS0CQtJ7yk497BmoeXjdhm1h4Qq2KBqDIrVd96k9L+sRJQYdWHQiLF90i6zF7S1TFlH55NImkgcToszBMt8H7uWjVd1W3Ez98eOKYb/SW36EDxq/xKRMh0yAAfroARbR/MINmJ4HmJRarRH6lAtT5I2ABWB8vN6YXb5gEq8zXM3LHEwkNX3EaiIxkSPLqFSU+fzsHkeUK0auRycV1wSKmf8EjXETt6NIQ5gz69mJWnlORWfl+QAhDR2Hh64f3FGzwicq/Ch3Rn/xASF5ongpU5/GMT2OzYf4nQOrZxNUNmxAfO1NX+gB+UEvfLf8EAzV6whWqSMMCLXgEk3kEzjPtxBpwbq+LuJT/iWKktjcwe5B9yugDFMo8EhlWtCupzAoQDO8dXflIB5v/CM1RGjKoFk/4OYVr/4qesCILbx3YrbJEUtyG465p0/otl4LobWz51x3LTspV8U5uPkDOvIV7+g8kvZKoZSAFVCNwNKYshVx1aTQbV4d8c7mclFNcYGEIuSzrMcXcYUopRxm3R5JLFhA2oMaLxuvM1Vls3mo0jDEwb3MmhgrYc6jF7k3V5GKUbRIiF0V6zWE0HcibGkuMaDD6jdagB36xm0JKGOAJPX2wDbD5OJfBBncH5AwGH5gFeTp2fBDn44gVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(6486002)(36756003)(8676002)(2616005)(186003)(38350700002)(38100700002)(2906002)(5660300002)(8936002)(44832011)(6666004)(478600001)(956004)(26005)(7696005)(83380400001)(316002)(7416002)(66556008)(66476007)(66946007)(52116002)(86362001)(4326008)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d25jeaJVPKMO3/z6NGL444YNZlC3n4ZKz9Nxd7GnHtMeD7z5wUot2Wy3VJjE?=
 =?us-ascii?Q?4uk89ERQOHOO3ICcX/ZGfWo048bbsjz6ysGHz/A6YW7on6GyaOiJfsG9taqv?=
 =?us-ascii?Q?MIGM5bAaxZNGYn5Qb6CEgVyO82TfSYRffnLAxabOcAijZPKQBogJ4jLD6TVF?=
 =?us-ascii?Q?y9CVtj8+unKTPWs7UZnqQbptaa82HVMNbQTy8TYjbehIoUTzYSKxXeaq9BYV?=
 =?us-ascii?Q?vNCdsborL5DqDptEMyyYj/iM/hszy07N6KP1eQT11TPoPYsiF6z7SmRBIzL4?=
 =?us-ascii?Q?YYV1wTOhygxDenP0e2hTB13nuWZLwMgEVsNuXMSQGtne/40vgybFaXKd6xiq?=
 =?us-ascii?Q?QzVF3iFhL4chQrB9J+4yiBRVX/Abd/VmaDPWB0fVHjqBwfg/Xn8hvvy8Dmli?=
 =?us-ascii?Q?DdRWNKjyDxrOSRxw3EuPRKe7uXSuzpMOU4kHdZSdeoSZh4NyVk8nQLzYo4L2?=
 =?us-ascii?Q?rePrC9tR4XD2YNEv/4MFdymljlOxiHkq6ffTXaBh0gFdgrK2m1JVngmVSMwv?=
 =?us-ascii?Q?5ekzNC0aVxu1YdEyprLynacqoLu7Pid8oG+doMVsg3P4VbldX9cKVnmLzYmy?=
 =?us-ascii?Q?ufmgbgqD7mx0aFfRG7Tis6muGWbdV4ZSqEYEo1Rwtm3OeMIrMltlveVCylUn?=
 =?us-ascii?Q?CDqUPo0lU1XVdVD1G48nwpZb+3ul8NTUcsyitVRbxANi/l1WnjJm/+ZPh0LO?=
 =?us-ascii?Q?dYaqF3XFOHlboSGZvSqibrLeKsJOnTetpb04y3zojanRzNw55zQXIZ2Ha6ed?=
 =?us-ascii?Q?8Tpdv9x49gkUs+iW8IkSz0MTX0F2GzlSL6MshmPGlRejq0i7pWQoqn/D8Gak?=
 =?us-ascii?Q?9NeC0y3WNQMIMP8qY7XJ7AtrE1jCgP9PfkvXqzLvBDJyfMPlQ+9Dnyyn4oQr?=
 =?us-ascii?Q?IT7BC22ixS2QMswyQb3ZoB+7lHKevw2o1KxJXoOgUBRY6Apfq9Gjui5Z0B1u?=
 =?us-ascii?Q?fSMwEwSIeXPh2+CmUpq20FO4PYbyZYjoXNgpXaV3j9JzxM2HCn5mg4sgxVl5?=
 =?us-ascii?Q?HzFQZdEO3EbOXeoq34Rx/gMf5qBgfVrM6w8dI6FOngssBa9LMxaQj5pgtRmH?=
 =?us-ascii?Q?rivo1IslfWo36I3NvAFUpGKwWE+A06okIiEkRa8aAbvEA5d64RH3IY4BqYIQ?=
 =?us-ascii?Q?HB+2ayPK27Fkg9uDf5LSLttn6sjWaWXJahhtwonXF0kM20OC2lUqKhpDL4xY?=
 =?us-ascii?Q?tvSRaVCsv4oJTii0NABU/ipf9fUgQUiexs7ZWXoGuIIj+QO0C/joGVX0nnLj?=
 =?us-ascii?Q?b3bV27nKm1iPZ1zSHpW/kpV32d4aYff+rwVH3mkbKHkAa6oU8uXH7KPKbSDo?=
 =?us-ascii?Q?PKAglMiiEWgTT7P/N1hPZNn2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82cf87e5-e156-4ab7-90f7-08d96c2b8874
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 03:00:48.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzgUj4WO8kF8SJe8r3L/LKKngfM7qCBQzWPK+jmqkTrnpAc4DMd31PAMgnUpObRNJQDQThhp7Zp6MHYyJ114FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4888
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

