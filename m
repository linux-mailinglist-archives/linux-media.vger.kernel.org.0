Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4680E3D6C9C
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 05:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbhG0CmL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 22:42:11 -0400
Received: from mail-eopbgr50057.outbound.protection.outlook.com ([40.107.5.57]:39437
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234914AbhG0CmG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 22:42:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PU4JJZqb31Ews0U7W0wup0Ka0C9j15YZ3trig5jJDR8VIQnyLtuBjjH0wksVTk6cz3InqrXn3lHa0HhpxHF9RR3ZewP5hJMxQJq5catDg3YaXYyElBsp+RG+FswxIfeZIbz0Kdmyx2LC07DtaJAXm9yXbewS8UPl70/IfXusDcLUC5GzBFuh9s2l59pvO0jQ/LLaCcONNFH5fh3mgr4wDTKi9zlGeNYqZbvbinY9Vqbnt42tNriC760fQoCo+sLaX4EsXDPnOkplHx5O03RSbuA3Bdr7CxLgQBiEI4WDCZ5yFPvXtA4ZidR2ma8bR7RC2k/XBqVejePutJmZIusvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL2eFEGo+t58zTFeoq7jyt3P9rMtMKKwa7zLYLqf420=;
 b=XGXOphaq7fj/VOzSh6k0wSegQtUQ7LyjrIV/LRCK70txW70xqn3yAxnuiMivJXFvSuatKS0EAnL2W0bIB7CuJ6J5zdQwW05L/zuP7FWKMs7iVE65RZCGh8Bl8HbKntBOMGCDLGYtXPsqFa71viBkj+ORpJ1hjsWR5bsuUbVQ1KTRW8XqVy/BkVMpxCZ9GdoJ8rM83C+E8+Plxtfr/nHQKB7HX2Mi3OmrK+DW5J0W27WqH5TC19PhWB/oCePTSIub8Z+0xaR9/2Mt1YyE7C7X6LL7MpIf78jShuv5eU+0UajHxSzVTj7W1pPF3nDWcIlX1vzzCQbOf1o4nycyssGD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL2eFEGo+t58zTFeoq7jyt3P9rMtMKKwa7zLYLqf420=;
 b=foDFadgqaB9GDYaESJBBVKZ3MnCIQ1jhX1dN5RFhXmmiS+3Me+LTtUroPvXvA+egujN/Wuhjjgk2DC5lpSFsv+xPQHzaYHiWQHjuejcnAhN7Dr1reJ3cxSn8m87tqTNryD41lCVTbryQYEXlkNxBELggd9pw2TaxlIP9wU6nSqc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2660.eurprd04.prod.outlook.com (2603:10a6:203:3a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 03:22:15 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 03:22:15 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 12/14] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Tue, 27 Jul 2021 11:20:55 +0800
Message-Id: <43038c740f7b6f069c71d6ac2f557cd649e44d42.1627353315.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627353315.git.ming.qian@nxp.com>
References: <cover.1627353315.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 03:22:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42a8b262-8c24-4f69-cd0a-08d950adbb79
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2660FAF026896B4129454045E7E99@AM5PR0401MB2660.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wm0FckveZl2nlCyhgPuw0EfswaBTYa9Lc7VAXud2+2aGI8ZOvZXZvrC1EAPvCHGkAJDxf2qsbxlkbjKgM3joJpx9rnSpC2lHz5s7RkpxbOprcSJuaG3zAQkOfJbFcyAH/APnvpUDL93xwbqc3uFUe2bK1SAKreV0i6VJgdexz7XdCBnfl5q5UGTUKjs1r6YIPv1CRK6RKQBGz2ZtfI+LRPZCyT6pzNdN999tNWv90gfbm+k/6NfmdJn322xW1iyfFXfMIKk2J8a7vMgRNRO9PsOkalwfcU47C45BtlWDoAa3nLQi+HIZ8KPD9t5+Zz9gj4UDsVEVVM3TAHnnx9yFE2Ccvrb8UuFMOQbTz2bl+vSHam3d53ctEvnqs7UJFoFOqq56iJ1QCiSy/nS2j4PaTCfOqfkiTVnayTyEnhhYyiFwtVdHdd5vlyOAUxaX72E4GYCXCYp9nT0Od3FpxmjWBbZXJbR8DklCMicTugSRZ1VcpKYGLtJH6Ub+rcuGGYqCleB1K3nHrJtUrSWxTCLdYuYF/pZthXKB52yaFgF8F+fWCDVQdhljUGEegHXFWex4R8MvCVAxMIz9QbkWaSytN0MCf6J2LUN8UsJERvvVO2NFfRibqwWKz5aXj6gtKiGc7RXdfchJvhl8kd3h8wFkcFIZLb4FYVOZUl/MgWhicznp0/XVg20p6Ne6CStVfoeUTT19hQD9YdZLXV0pGJPsZfvVIZ6kdRXyPYunFz7AZm62lLasqO9p6Dxg5Mfj5uFe5854A48Wh7zHnWyY9UqpVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(4326008)(7416002)(66556008)(38350700002)(6486002)(8676002)(956004)(186003)(2616005)(498600001)(66476007)(52116002)(7696005)(8936002)(44832011)(86362001)(5660300002)(6666004)(36756003)(2906002)(66946007)(26005)(83380400001)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?grPCGzp3aimYQjCk6ziGhmaWXTf5qHGcDYfJB3x850C5WbcTBYULC2qiZEX4?=
 =?us-ascii?Q?l9MxJdbNYGWX3i4HumUhNdS1J2frBT8O5XF+iVzGe1CHoCXllQx2r+OV1BHy?=
 =?us-ascii?Q?pIGQdNAX2K2Gf8Yf5pN9vOqMg5FsNnjRmn3HN0n3andwn1QXyCJXA/Hk8v9a?=
 =?us-ascii?Q?fPfJogGUnK8/LWQTyiZawjs1zBXbJ9Evw5MT8z/cnRVCsXGWb0hT6R2m1dTa?=
 =?us-ascii?Q?e+KXwq32EkbKHzrp/8Co4G/PD43LMJCFIzuxb6CqfGXgsvGdrqA4KKxU+/Yf?=
 =?us-ascii?Q?OTLhLvdf5hHCgFKQzqgFnD6QeOjqVqFZ2QwDI+XrbTj1jRqHCmSAJQ5QO7AQ?=
 =?us-ascii?Q?kQVXrrDrIld861H5pnxdvXK6YA2mbRb9lZgLRrpC9sCOuq38KZ/Pa7ZUpQQV?=
 =?us-ascii?Q?+XyUF+d/hhnrq+VsuNh1emIx32gOmijqQxohPLMei0tb7VWFPVZ7kzy8YKoq?=
 =?us-ascii?Q?PdnyAcaneXUcDCgsfAYBbJ80kxdVhZOWPSLjOdhEtFRbWuIda+T2EZACXGAA?=
 =?us-ascii?Q?tCMm37tum45/ixIhg2yWG8p0UKt6WevvFUFeZCFXiTCRrtPizOt6+/XhhOMm?=
 =?us-ascii?Q?lBpH/KX+hjJ0EDSNv5C9Z7MRPXKWmDgVy0sTtgM9vTLfnpbBFGXdTarh/LZn?=
 =?us-ascii?Q?iC//cWq9fPE/PV9YqvJn3yVuKRH+XHEHGc276XhQ6WKQ2bPhjEcehsE6IWLA?=
 =?us-ascii?Q?NMLKS54nwj58ngEhL2tqqXh9FbaLLyDLPWJI/N48aoPiqVn3bCzFe2cMeZbd?=
 =?us-ascii?Q?VuhNVRFSN0vCy+wT3kCEhCFdY0/aou0RZnjR8fAVKrXsYNI3J5yzkqlZltI2?=
 =?us-ascii?Q?6IgFtfiUE9Mh/lwbIYHKTrRK+tIMqXirJ9DgW4dKX72fse1IUS7RL6RND1aJ?=
 =?us-ascii?Q?LOUBE/Jd+c3BiEabyE9K5TzDXPUdUYRKRElwfN4U9kM/iFtlwwXkzXTbk+lj?=
 =?us-ascii?Q?SXxPaYDAaZd7fnBr2lyt8yY/Uf15WMgqnlSupc0Q5O8AoLEARD19WX6pK9Eu?=
 =?us-ascii?Q?BaY/F9zgI+FbRJU9hFN/pFqV7j7rBsFNfmhEhj84/RihGb7VPYSq4n5bG8uR?=
 =?us-ascii?Q?jXbr/fP6+bGLsDkH26opssPE3/FNy/HXW4R+AMstgzU9Cb3HcdnaLbVq/rvl?=
 =?us-ascii?Q?6Asx7yRgqXm9ykW55ejl7HMecgAwvV6eV/o3OOoNYovq7piqR31Zxc1B3J/P?=
 =?us-ascii?Q?bnfqoN/9qYuC5PrCg2G14qQvaVHev7j1gdo4P0hIUYDfIFBWFMIxxW4aCEn0?=
 =?us-ascii?Q?B6tamm7IlEaP9x7WRaRqRUO8mpFzqcBkYgTFKgdlAUe+OHEo6bLgUa+QUP8x?=
 =?us-ascii?Q?+bsW9e8Q6adbh4BAHsglgIlu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a8b262-8c24-4f69-cd0a-08d950adbb79
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 03:22:15.6120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0f8QUGknPOM1iJpUbOWZLqB4h5JqqFF15+7MRmv1a8ZAmTgX70P3I5l6xWy4raOGtmCFupR1WEgeavU2y6UXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2660
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

