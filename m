Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57683E8C47
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 10:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbhHKIpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 04:45:45 -0400
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:49541
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236524AbhHKIpa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 04:45:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSee0HRaT5+RfsUVf3+D+kl933edhMmGPp16rhmj3XM7Yl8pJj55aViINX6AABXrb7i/qP9xnRO9ELUFJz0Jd7mBO1szPlbZqJvR+ghwzYP3AYQ2ridhcZcWBTknqSoQKZ9YzHAMxgfl0qcOQsza0GyXUzVtu5jRw7CfrJ2LG9bX/FdaE+5yOA9OYu1Ep6lFOMv1+jVklaijWxh3scMKG3U/YKGaQH283XScA2v2/PYyB8CbXXl5/L+McZPu3eWJUXFmgpl4nchOXGaLrY7S6Robr3EY8NUOaY1+xr3xRRu0TfEWZOepOAaw8Y9MZnPQ7go4HQHMr2ZL3nZCDZsG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy0E1mCprw+OmDtGv+px3Xv40mATsTt0+v4XSM8p7Ys=;
 b=I9tR93koiilYb2VXvBPAUwsBPiI2XDtqkGKLgns9AMOvvwSjLlwNSLf3sN/xON9XhxdT4BQOcQBQEQVOmLxJX0hwXB9BGMKvkm4SnQarMqYj0IetXnsG7X7/tfMS64x9eGIlXRBrj3sQ84D8AWIHbpx6P3ER8Wuc+yDv5APBIhPJhS8naby4P5jt+ToqqRG/CmC4Zsw//8fRFe6cpSSYvHIPi1/uy5uIS42dwrNpLONTe2bboKlw6/rUywWDaG+7p72AGzreR8Wlv0uvOE8pG+lD+gPNQKScbuHayvrHE1/y/cYLEuofzXjNkV3Zn63MGubQCmyVlePdRIvdjCh9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy0E1mCprw+OmDtGv+px3Xv40mATsTt0+v4XSM8p7Ys=;
 b=KnaZLcSOnV6J/jYCOb9hr8ccuQ+lD+Ne0QVfAv9nzuZlXR4WueKn/Atr4lXLQ3St39116OoEfEkXZwHGFWosp/COfA6QCXi+2kCClJZmf1NOhityQkzbGQnX38HIgU4qvSSqfNtZwoAAstsxlGPQISSLS2DZH6cFPrx/M7LUGkU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4888.eurprd04.prod.outlook.com (2603:10a6:20b:12::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 08:44:46 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 08:44:46 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 12/14] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Wed, 11 Aug 2021 16:43:08 +0800
Message-Id: <fc8af80f3f31e195761990b5bad434099e5c7669.1628671163.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628671163.git.ming.qian@nxp.com>
References: <cover.1628671163.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.4 via Frontend Transport; Wed, 11 Aug 2021 08:44:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3362da9d-da37-449b-a15c-08d95ca44584
X-MS-TrafficTypeDiagnostic: AM6PR04MB4888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB488820F5B58014FA0DF5904EE7F89@AM6PR04MB4888.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 477wtLHDv8Ar4GCFy3fHjtNNzsb2WXCTow3xvJlYnsQc+PZyW5J4oqUjBdZJo1a/OPrw5Vxh4nRwHHFE6a4q+I/MXQ4jm741MT4F6K5b/jplVs0E2jDEBWl//YmNSD8VPgUpJlBYjJG/bMrfEIhwVzuJ6r+CSZQnhNkKdQmvOOOSMhzZre8kTt7Ayp5Ky07vqmDMvxizUpY24W8foQ9Or807Th3sJ39CpaDbUPSTttgeM4CVvxg++yWYp6jIagOQyu3JIYkYZbJTsabfGE5aqCXmbqILTvKOvbsGiAgtujiU+hADrRHsM+XKnp+5enIffhnFpoZYnqBy0vTqYeRpNtTBo9cr7cY4tbCbWx5gDvaOvsg8W1FHU6RJbCMrzjWW3Lad4DABXGV7NmQsgZajgHjrqNdS0QROb9NtVjjvlt++PFL8nV421JjkC4LHlg0StyFuLOZZSuBm7lpve7tzN6bhO9olLPGUD4PLIHfXdC8MiEMfCpzhkitOTMvoCzUoafzfSsSWdg62Gg1b+MtcvDXUFvzmj2/3F0c6XZRLlk/mOIg9fzOS/KHqWDG6Es55qIEHEdVck87WGjbUsWXNkeBa2lqzMGjv8IWAtdqj046QewFCnDRTV+jYvt2wukcWHtF8h8MuDR2WPHlmI+S5FxZtlx+Ek2pCYitJS2m6jPffhIhH/8aBYISD8Rguxh1HqaY6RhKLeK9d17fgxou2KGpoCMd9MQ6miERsi1UEy5YN0frJ0l+E/yIPIV56rTk2KjYRDQjtTvlgVyNKQ+VGOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(7416002)(86362001)(8676002)(6486002)(36756003)(44832011)(2616005)(956004)(4326008)(7696005)(2906002)(38100700002)(66476007)(478600001)(26005)(52116002)(66556008)(66946007)(38350700002)(186003)(8936002)(316002)(6666004)(5660300002)(83380400001)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h+ANvcSZxiAvvR2B7vXqnA4O5jT5+Y7KJJy1AnD2IJk5qpd/gRHUNjBfgBDx?=
 =?us-ascii?Q?VHbtmeZGLPRmBN0J2btoe+iI6h23jZ8HV/VJo+uUsh1dm4kQHAdfZYpIDNnB?=
 =?us-ascii?Q?ua4/8bB+rgoh7FflLfR4PT5HhxkZuVIKL590O0ddW+4LCKINecq5ePBbTo/R?=
 =?us-ascii?Q?5GtvOtq2YSN244O9m9rLayrwpKe//jrZ6HnE25hfGAA60Hcc9s4F0yPRXEUS?=
 =?us-ascii?Q?MBr5eLVKqPlw5lqZzdMhXO3yR2UxKfRzPPYLps835wg6gp2DgjqyYk/mgksH?=
 =?us-ascii?Q?c4oA/eMrlh8RGwOImFOtFiSXl+8nCduSnQQqZTszY3G+Wwfj9arEKkcH4q/z?=
 =?us-ascii?Q?2KKtb+8ErtmGOhIWA0kJ09bdY9/iHo/KxP7q93sQvdZqYEyezpM7qElNSWCM?=
 =?us-ascii?Q?s3ncNT+TUVJ6996cd3G6oeucs3Gn9QgYHfTn2THJUudCGolKZgLrBVKnUQTs?=
 =?us-ascii?Q?mOmz/xx/flEII/bA7lfEyXCEikrqGO+cwRIQNa54tTahnwhU+D7hYrhLt9MX?=
 =?us-ascii?Q?6fnrG/4x0ZJYdr9yGN6gduhO6L9POa6Wqy3LHu0AEH/KJgHfuaWU30rnLYy5?=
 =?us-ascii?Q?tu8TkOxbMMfsI5/UBgtZtz6Vm+GIZEGpL0DGxysLBVV4j3x+PyglBkxgzYCv?=
 =?us-ascii?Q?hDocWPb2/07flBjDcSVFdCOQx+fu1Y0uKD0U47PK4X+ppZzd8XxnYgVSum6P?=
 =?us-ascii?Q?7VADpb/eKeylybt9EqM36ZbuQP61n+ktOYb8fcXn6YTL5r2alp4rz8v9E1sr?=
 =?us-ascii?Q?UGnvs901qVcJ87HBoew7LDSzWmeaVcBuxVPQkf6KAn/gB+D+9UYI2FgmbknZ?=
 =?us-ascii?Q?G1Wb1nCJG6gSytvTwhrUDBQCf+Z5Sox/L8Idahc74iCIV+cRo72qm4uTSLL8?=
 =?us-ascii?Q?6SIYUn7CRtznxdsjb6tIG4EBi/PQpXz2iW/DQIWfILvB6R5JcCqmAJp5sjpv?=
 =?us-ascii?Q?L+XiPudpENnqxfoDb0fWlob8v5ASui1U1JUEoPyGo5LC6aDFqCrvayHDpqL8?=
 =?us-ascii?Q?4gsHRto7Dw6R3MSjwhvW0ER1/D9Js9+V/yKDupodCwFiY1q1n8GLYbP7ahKc?=
 =?us-ascii?Q?iTczg7CkaI2FsG3X+9CJtmANxEPkIKPK3PWVQP717oS+Qvw/o3fDjnpBwaBi?=
 =?us-ascii?Q?vM12pjh+9swJrrpMIXWGP7s/G68PkIBDnCbFgBitXR52q+NTa2hbHsDnTkQG?=
 =?us-ascii?Q?kJhL9cs5dT95nSIZJJVfplMGRhZb1/NXEXMPys/DJAEYXlle+pUUgfDCViW/?=
 =?us-ascii?Q?fdTV1dKB3E4mF7vUlyXjep1J3UEXbfEElwP0YKrrI5XxNOeI6xGjYLvqiCOp?=
 =?us-ascii?Q?qXyjgcu6PbL6YrOCn2suhl+l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3362da9d-da37-449b-a15c-08d95ca44584
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:44:46.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1huuqKLy0eonpxQtUKVOPtC6IA8+iycd45ncWLOeHFhPqE0vQZMkuW6UiRWiKxEzAsUaQQMatx02USxIpLuaA==
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

