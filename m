Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB40A3CF1D9
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 04:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236525AbhGTB0Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 21:26:16 -0400
Received: from mail-eopbgr70085.outbound.protection.outlook.com ([40.107.7.85]:8686
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243729AbhGTBFH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 21:05:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7EMdWzwMUkD/7wZi/mOdaZwEV9SpwsxX6BpGIIeYBCUYu1oKvsnbwk6359lW2Y6u2bLlhNX23+LTKagQQEpuGHuowMK8WrbRyxpAkPP6kLY1bG0INepbLHa0uqPVaEBukbq9PAMnXHH9ao83jzwjV40OTRxXzjfXnlZ0VLd8tdXnlFxn18bvrPh8IyfGIKT+15OE3klu0tYYdxuZpUiYjXgdc6p5aZ/gKe8+g1Gag8WhPujV9+2VcKLiFT6/qOEP36OvZ5vTafCDnPYIidT4vJ98FgXuGOE8sUlG+6lhMut7xcXiZamSBQHoPW4DO/sme3DMjbChGuZvyHKs64Wgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0AaWLVjVBRs3JpgU52azq9m3Z543dioQRn+ogW5W7M=;
 b=WzQJ67SEL7pdnf1m2Emhss/irq6k7370PMhH5TEFWnnibou6Ijz9nt4r/emAKXt9bpxYA3SDhetSPIFawUXsWBntvH04tbHDwWsJmenSarB9S8ESPX2X7OkWulJUgde62LtRnv1BXp9PIT2ZMdgwwpesWJaGQCaPYaTFmq1Q9axwQk2/CIdLaZt4D0Z+pbtxWD2H9zLM/4EHSghzkE/S8YtjZAJ6A9o7mntVSy+0RAJCgKrx/BYBZGt9iR+hEDa4ppxmOBPjTowJ8slaQrXCcASk6RHXhyTBiJxr5BCg6AI2HBIk0TB6Yv/Sh1d6QT8oyz6jGO6lrp3GzvuYH+pxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0AaWLVjVBRs3JpgU52azq9m3Z543dioQRn+ogW5W7M=;
 b=YlieImXMJoCKPc9+fJw13cy9pA++iDtq4RC6UNT39oVZmQe05faXBFRSfysDNVrSHBcVKY798d0krzevQje85JHv1b3Y40p9QTfyARni/GiVlKO7ZD8OGySvWFSqdb+DjU856P0EVL08hBCcVh9Iv7fpGMTnj+UK5Yy85lomAyU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3813.eurprd04.prod.outlook.com (2603:10a6:209:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 01:44:43 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 01:44:43 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 11/13] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Tue, 20 Jul 2021 09:43:30 +0800
Message-Id: <8c29c4832ed8c44b0c62c79d34b3b5b73603f388.1626743758.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626743758.git.ming.qian@nxp.com>
References: <cover.1626743758.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0232.apcprd06.prod.outlook.com (2603:1096:4:ac::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 01:44:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3272d8db-6458-4d3f-5c0f-08d94b1ff251
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3813C7209C0493342D9A8124E7E29@AM6PR0402MB3813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqT4uqQ/QgwJWVO5CNxXw7lQd+1iY3jnzS0IvG1GSG3qoNYM/g46MW8NEjTez2dztckYbGZSOPkQzbJ3zBANK2GrnCxNaJ0iZ2gMnF0D+jIn+bmz72Gsq89VrIeObtc6CqSVgiHTEgpkVqPZuDVoF25eO3tvMcqN0iTuOqPWpbCyXZoHRZu9vCJEWNHvgXNn5/TPn3WEFXWv+9sNHFSo2N++Qs32vRwwURy/LvwaSsKIxMquyBD/AVXgmVHXBlUlGe5NTnQDiyw9rg6htRbY0muy3LsGgU03fgxoBEpspA6UY1WLyGYJTL7wFCaDxgEAVVBPo+RafWWVtL/+bPrmJQ7H6mW2ZEuuPotjxY9gedfro9vP6KPrKqKBj1RjBTtPgd/at9TZs5z4ba/1QifozNMhCovhO35V5NfplnPzwbzWt8WjsyrbLbnNGaqBLcmKKdDLAM4gRXRuLsCk6T9Iz1xAv2RobV2luwEGa7vVM/84d7YWb02SHiuvldCSt5REQiwnnXPJedkRbeV5FoHF5iwT8bzEps1cTqlGmBjti4nbhq3IxH1CW9MAxFmxu3EnNqlAYtL/68fspOC3lqfOUgjWRMUytQ47y3euzrsf9ZxG30eXI4mf0ecm5ZJ4R/3NZrXsFxOqyA4Lnb9cPX3mOPDWucM5JDdF83ugmdwzu/Ln/vLQ2F4cFFGHNc8Qp6pFjKBkq1uKmJbd3PBL7nX/yECt8rY23fHLwdOkOSx+qXF+sidKLijyi/z9C+mP4nwRRk0SaMjsxRBUxaQ5PxRlyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(316002)(8676002)(7416002)(4326008)(86362001)(6666004)(186003)(66476007)(66946007)(66556008)(38100700002)(26005)(38350700002)(6486002)(83380400001)(508600001)(44832011)(5660300002)(956004)(2906002)(2616005)(8936002)(7696005)(52116002)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rB9xqpzC8grtOG+I0tG5Ph7o/tR1R2gwu0aDkImscgWMTAL8yhdtJ13co8q+?=
 =?us-ascii?Q?84Dnl+ziHdX5DeJcRk8tUccis+8njo4zlKCUP84IRvlHQYDjUyqIbneU8VEn?=
 =?us-ascii?Q?kX5i2CACkIxJif6Ewh9OF4D1fn2mP93L3PTpNfftPjQlGFsAgd7C+HRcIbOa?=
 =?us-ascii?Q?7YwSovohGJmSpnCG52LC3Ej1cSugnY9OndwjHTMrWFCSodCXTlXYpfWmxoHc?=
 =?us-ascii?Q?NKFTt1g/Dzc7trGjMJD+bj693Rf6OQX4tkysL8nShbg96SeNG0Ziss6ps8f+?=
 =?us-ascii?Q?aiFATw4dMN3rj6Ql0u2bPkBS0jsNU3PgdNuOshFxvStgOJy2+IxIbZKDF5gs?=
 =?us-ascii?Q?+yMqKKNILNH4KDZu6sgDTjIESR+dNcSOMr1I2duRIJqnWhUFkoLWA0yXrSge?=
 =?us-ascii?Q?6UWRpp2KMYt9W2R32SDR22jY1NUq1A3akWwtEdk8sAdvzuU+MZuvLz1zp132?=
 =?us-ascii?Q?RkvGXLE9CHEtisCvjJMBZ4vuyeDvi6Jcmm9clRY4PE5axxRGXuaf0RMP0uo6?=
 =?us-ascii?Q?YToLQYA6eg+zxOmMnm8OubbpLdlKAxS3pNSfu8uWLGb8UYZ4AsTFNM5AWXv2?=
 =?us-ascii?Q?/d8zEhiuzC32iX96PAry9r7rxuiMN1Dhcc+Kqx/yGvhG4i+7OFiDlb1K2ok6?=
 =?us-ascii?Q?LhFHQzpb+WLVtl+A8o6aNDCvn+8nKi7xS8NyDtEY2X3HBiBPoi6I90uvuQOe?=
 =?us-ascii?Q?eILvd8c2bOi1sQB3sCY/r0nXSoWCBqyswL8x8AwgdM1GL0YFL4prjnGnKdbF?=
 =?us-ascii?Q?pRXm6tHe0Px+byOsmz9dFB31BnSx4ys3znSTgCs4RNVft2j3c/AAa+NXzMk+?=
 =?us-ascii?Q?ci6LiCdQkYn45e7hEx9mNutfrlCWJm3Cf1sUtyTSTGeYU/8Hyqh+jm0gm6u0?=
 =?us-ascii?Q?IySaYJ/rrnMUBnDJg7T/NvFtWNY/gN3PsFFn8ab6+F9jBCjQt8oKZYLF6cTR?=
 =?us-ascii?Q?9IRXJpw9EAzu8zKjClQUl4zCXfoYKSWtR1uAoEPH5mRdi1gK0ZJl+sgCyHpV?=
 =?us-ascii?Q?txVtx+5DZ3C5Lmb1HU5XhzMR2yNmMxKHaUo6Y+4egNEIOE+bmY7I5sFHWU2j?=
 =?us-ascii?Q?gl9Bd2KOWUSj7mB6VCSbqali8EUEedobouluTsi+92NJPzV/7/wLTh915m+p?=
 =?us-ascii?Q?SZwRhne8tOugtmM6mRYSV7cmGOAM8gv9yCO/WmIki0spi+KS61EHe4N53cFI?=
 =?us-ascii?Q?7E3G7dw9t0yQ1XRS/pOo0AAKHID9iWKVgtqleQbFVuw98jr66hXJeqqzFzMq?=
 =?us-ascii?Q?MZQ2saSol9ZrevL5aIzbn5BLG8aXJR4yuy5GTutvuv0efmK/AjfNwWzHVGdC?=
 =?us-ascii?Q?Ok5CpZFCK2eJT2efoxuhKayc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3272d8db-6458-4d3f-5c0f-08d94b1ff251
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:44:43.3192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/VFHCF3qRuTj23W9B5AolADJe/cE2XjfeqeDgYffDrfJtb29lbDdAdj2MZkZ6/q3cbCdEransOTyJWZeszk+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3813
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
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 26 +++++++
 3 files changed, 115 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
new file mode 100644
index 000000000000..9f43f18d0df8
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
+		mboxes = <&mu_m0 0 0
+			&mu_m0 0 1
+			&mu_m0 1 0>;
+		status = "disabled";
+	};
+	vpu_core1: vpu_core@2d090000 {
+		reg = <0x2d090000 0x10000>;
+		compatible = "nxp,imx8q-vpu-encoder";
+		power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu1_m0 0 0
+			&mu1_m0 0 1
+			&mu1_m0 1 0>;
+		status = "disabled";
+	};
+	vpu_core2: vpu_core@2d0a0000 {
+		reg = <0x2d0a0000 0x10000>;
+		compatible = "nxp,imx8q-vpu-encoder";
+		power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu2_m0 0 0
+			&mu2_m0 0 1
+			&mu2_m0 1 0>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 46437d3c7a04..1a282e63507e 100644
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
index e46faac1fe71..b9540de09a7e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -45,6 +45,9 @@ aliases {
 		serial1 = &adma_lpuart1;
 		serial2 = &adma_lpuart2;
 		serial3 = &adma_lpuart3;
+		vpu_core0 = &vpu_core0;
+		vpu_core1 = &vpu_core1;
+		vpu_core2 = &vpu_core2;
 	};
 
 	cpus {
@@ -133,10 +136,30 @@ reserved-memory {
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
@@ -629,4 +652,7 @@ map0 {
 			};
 		};
 	};
+
+	/* sorted in register address */
+	#include "imx8-ss-vpu.dtsi"
 };
-- 
2.32.0

