Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FED339D7C3
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 10:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbhFGIqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 04:46:22 -0400
Received: from mail-am6eur05on2043.outbound.protection.outlook.com ([40.107.22.43]:22497
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231176AbhFGIqI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 04:46:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDcdCuWSkW8pu87jbn1C1Gnp1Oq7vPuYInP2WhM76l4Hlsf0nEKKK3lQ8MQnPnL6ZrvIbTDgsuBgTPTVjfPn/fU4UFFHYZuBU6gOeowZ5cYUeh35rH/M+ai4IPef7cxy0oKmDkrEbxJuVzYcNnVZpeehgEjeTi3eBo+H2GZyZW+P68JvH7TPd6qheKngjN6GPeceSTzSQCbQisH+sNPJ16VtmAC+0r4Rd1jj3JASEE54ubwiWP4L9T7ioOUSO860so+9aAox4tmVaRihdrOrC37NSTZGwMbJOlKTSm81jJuxRMR/Tk7XrBn82vjfEJRujGzUi5BGgMgeOSRcjFmL4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6DAY7aLMxuGV9sNtpoFKQOs/Z9bMQ+hE0dCB4uEMuA=;
 b=BHTQK/8bZapirGprUVaOaeCAbEzOOol/Fs2rzRvzuvGZrvGWsjjZL9QONKSLuDcjkvMi5xovi8laA2lMtj0vLX8ctWOA0llQ5NoZn3sqvd8J5h7aDTzAYo3RYQctrDNf/b7CU2E8cDDW6W4XlRUJakxpnkNlk1Puo2RJXSECSZAaMBz2aLqhIi8wtr8WK93fufLiSOxFV9Yibj+bFqjKDp+ct3taXEb7xxV6/nVVxJ9DGRR+xLAIeNOx2J6N09uJ9bGIUPLoTffCXlZUTKKvNJajHFLPP3KEfTtxAVJTqKLEu9HaPRGXUAmUCFAbS9nmrv0aBU455JbiBiMopMMi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6DAY7aLMxuGV9sNtpoFKQOs/Z9bMQ+hE0dCB4uEMuA=;
 b=DM4eVFqyKapSDyUjHnSzUO2v7BcGDqbF9q1PIBR0hv7ugfmVZtEVhiEubxP413hibWHS1bGsfo5/Zv6yOgveQzFMrGI9yQl8jZ8hcAZkcMm6lgucIq64tEO5ys4VtfvUhu/3eaSrUdL3xFZU2aWxqS/J7N1jWB3ajCiVQqutrsE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM7PR04MB6933.eurprd04.prod.outlook.com (2603:10a6:20b:10d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 08:44:15 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 08:44:15 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 11/13] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Mon,  7 Jun 2021 16:42:58 +0800
Message-Id: <9695e8d0adee42f3bc6449e32cdb974cdd10757b.1623054584.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623054584.git.ming.qian@nxp.com>
References: <cover.1623054584.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 08:44:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1876649-7da4-44bd-9426-08d929906e58
X-MS-TrafficTypeDiagnostic: AM7PR04MB6933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69334B5CCA759947C013DDFFE7389@AM7PR04MB6933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 58kF9KQynlSApBgdAAcQdzCw9v3LF0sbi23gV/ki/+1rYmJK4ty058YVpi5QZWg65ULRzVmYP1pzp3y0LS7kJK7DqU1IburvvDtkn/SR1QsgYraMYSYE5m8DkT0FMb0x4d+j+zMlq/He6JwMILMN/nWt4PWfRo6GoP8fEfxmfjXvxcFaPoIiFTlQy81UgTJUbxHmio8Wgz7n067fRpozbVPIG+RnZyvly7ll5BDgCC5M01bR9UeqYOLduY0Z1QKuFywwIfQ8XJE08TOFbHETfqVJTx/GxLtOKaMs5c844lqJQm+LO7qer5e39IemSUCMLFJmqutGmSeQ1R2geICs2Dwra9ZzWvZ6YjdcpNe0Pvgo55sWHKK+VfxU0MKpdfRKYY9B13gK3Mxkpm2fUSr+3Za0SiiLHki7KaOgEd0K4YP7jcCL6mP9vT9ouCl08sNkI3JWZqIAOzsdDsyrBVdaOvZPeUg/9rsdSVwJT3h4ikbjlUAddbdczxmiShG6ilzwHxPJE4iKI4nNR60fabFSR4bfltPNbD0LTYlFb4OtvnsdpeUtmPI12EqLaYMG8DuqsC5TFuvXzf6ZGo7QDPvl9BfMrux/61Kjn9X0a4X6suf48y6nVbhnIQEJuktD1VPjDsHxqBAifQaQ/6dqrtrE74m/bgOQH5VkK1Jxh2GL3q1SQ8iKqCSqLs4YqDmocn/E2EN+lMZCPKQ52xDLiVmoZ0EqBnhbx2YCGbwzpKojjO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(186003)(956004)(16526019)(7416002)(6486002)(26005)(316002)(2616005)(2906002)(4326008)(478600001)(38100700002)(38350700002)(7696005)(66476007)(66556008)(66946007)(8676002)(5660300002)(83380400001)(52116002)(86362001)(36756003)(6666004)(44832011)(8936002)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8L8n8yfbemUIe2HjxIf6ZWjvU8/sQn+nvlaubgRgfr8Sy+8hlSFnsr4AWAXZ?=
 =?us-ascii?Q?arzpa8fcGZdBdVo5+UGfWx1ZRd5bELx3ZzEqtd0+HoLJamHA49hmn6IZVx0U?=
 =?us-ascii?Q?9BkBvIvJDKpe3ETqIMPcIjwD0wrUw2tV8u9hUQvzyOvtwKLyvEHxHf31s2h1?=
 =?us-ascii?Q?qPefZTw7jISyPb+ZWij3ebpyD6ve9/1yOLRcw0AHRaPJN0R0c8ONVWq//2Gj?=
 =?us-ascii?Q?4YxRx4F2+duUyiSnJkZ4FEmsuDAvQ9h6ZwS/YdKBJ5X8PhmyGn42VDKOg9DT?=
 =?us-ascii?Q?CaDXGp1EvfgtyiVWU0OmAAgsNRlo4ZU4o9FRC2JL7dQqWHwt/50bxud/GNjO?=
 =?us-ascii?Q?FDc6c6tX9gtxb2WuA0OxONvrDmiQmZ9dwCWHnlHAM9kX2jDVQL7ZQU7Z8DT/?=
 =?us-ascii?Q?PNysMWtt9yn+zy+bxL+Pjj0Rh6Pg8GQIP8Xj5KU+1s+fEQSvLa1h4aG+qt58?=
 =?us-ascii?Q?ZDXixR/oHxWsPNk8b1lz4ND/9P/97SyBsuJGMkVTIeAlek2L+/9TQj+NrKGK?=
 =?us-ascii?Q?6BIqI6L3jQ5Ni/FL8k9UmGeyL0m0/szOHH0XAEydBsCeit/qZs7m833Z+q3U?=
 =?us-ascii?Q?iHlKhflar3rPUXa8+sWoTZWYPrvFiYQ259n99LMWuZd+EfeWaK74pEjf2ANr?=
 =?us-ascii?Q?Un95d820/VOgUwVW4XzMIjXuK8nWnkIWV5dJU3cuZqVjpvgQQBr9f5tHlKeL?=
 =?us-ascii?Q?78miERLQbS++gnUAlc0iStWvhWyGDLmO7GOevZZ3qxoYs8922/CRPPhUdbd5?=
 =?us-ascii?Q?himn6aw5SxlUQ38Jhkgso2eav/hVDVVz/ZwMhMLoJIeoJJa+8NWaf1DKphky?=
 =?us-ascii?Q?1rp56tSh75h2BmCzhAjdJrLGIHdkcuMTOw7RRlvrE379kGCD0J3QofHONaR8?=
 =?us-ascii?Q?xkdgGlnM+JDmM7WfYwo4Hw5AoDgwlNRFKb47LoH/RxPGn41bE5jALfFMZ36t?=
 =?us-ascii?Q?HZiX1Ngf2J9TT9PF5ZJsWAvuDgpYb/Ov4T0oaKvzPY3nIoYMz2+N6qleDnA8?=
 =?us-ascii?Q?/1iqU1/J0KqtSj3uxBZSNE/gFOetAFSPG8zvhK81sxFKNTZTXgVvPtsJeNRt?=
 =?us-ascii?Q?IrOnwR35QLTl7L7uh/Q9oNlDP1zhzSLOu4SUQN9Qrr9Jbz0qASGNe8N1W/LO?=
 =?us-ascii?Q?XYLo6XPafs5LIb4CKGDNQCYZcamgwV4Ch/lggNc+LUsidjmCnY21GBIlYo58?=
 =?us-ascii?Q?NfopdXkqJ4n7BaQnOB5nSFHKkitZNyR5KARauAK2wa/bw1sKlMYvnjA8QUCw?=
 =?us-ascii?Q?h9hUxUoYtml5nULQZZmJ14gUBjD8Gbkk7k+mmiGPNL9QVZGaxyi2J4dpkrOX?=
 =?us-ascii?Q?9weaWJr/Rg/N3CWOdv01zjf5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1876649-7da4-44bd-9426-08d929906e58
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 08:44:15.4513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2n0gX5p9/0hKfMAUfal60aN4YGyVnPnLpdu4zWgPNL0qc/6bRZuuQ8YkEEzETayPSPdO6CKUOr0qZXgq/JBuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6933
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the Video Processing Unit node for IMX8Q SoC.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi | 76 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 22 ++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 27 +++++++
 3 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
new file mode 100644
index 000000000000..6e9437f11817
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+vpu: vpu-bus@2c000000 {
+	compatible = "simple-bus";
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
+	vpu_core0: vpu_decoder@2d080000 {
+		reg = <0x2d080000 0x10000>;
+		compatible = "nxp,imx8q-vpu-decoder";
+		power-domains = <&pd IMX_SC_R_VPU_DEC_0>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu_m0 0 0
+			&mu_m0 0 1
+			&mu_m0 1 0>;
+		id = <0>;
+		status = "disabled";
+	};
+	vpu_core1: vpu_encoder@2d090000 {
+		reg = <0x2d090000 0x10000>;
+		compatible = "nxp,imx8q-vpu-encoder";
+		power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu1_m0 0 0
+			&mu1_m0 0 1
+			&mu1_m0 1 0>;
+		id = <1>;
+		status = "disabled";
+	};
+	vpu_core2: vpu_encoder@2d0a0000 {
+		reg = <0x2d0a0000 0x10000>;
+		compatible = "nxp,imx8q-vpu-encoder";
+		power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu2_m0 0 0
+			&mu2_m0 0 1
+			&mu2_m0 1 0>;
+		id = <2>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 46437d3c7a04..d79eaa0a28ac 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -196,6 +196,28 @@ &usdhc2 {
 	status = "okay";
 };
 
+&vpu {
+	compatible = "nxp,imx8qxp-vpu", "simple-bus";
+	memory-region = <&vpu_reserved>;
+	status = "okay";
+};
+
+&vpu_core0 {
+	reg = <0x2d040000 0x10000>;
+	boot-region = <&decoder_boot>;
+	rpc-region = <&decoder_rpc>;
+	print-offset = <0x180000>;
+	status = "okay";
+};
+
+&vpu_core1 {
+	reg = <0x2d050000 0x10000>;
+	boot-region = <&encoder_boot>;
+	rpc-region = <&encoder_rpc>;
+	print-offset = <0x80000>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index e46faac1fe71..74900686ec37 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -133,10 +133,34 @@ reserved-memory {
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
+			reg = <0 0x92000000 0 0x200000>;
+			no-map;
+		};
+
+		encoder_rpc: encoder-rpc@0x92200000 {
+			reg = <0 0x92200000 0 0x100000>;
+			no-map;
+		};
 		dsp_reserved: dsp@92400000 {
 			reg = <0 0x92400000 0 0x2000000>;
 			no-map;
 		};
+		vpu_reserved: vpu_reserved@94400000 {
+			compatible = "shared-dma-pool";
+			no-map;
+			reg = <0 0x94400000 0 0x800000>;
+		};
 	};
 
 	pmu {
@@ -629,4 +653,7 @@ map0 {
 			};
 		};
 	};
+
+	/* sorted in register address */
+	#include "imx8-ss-vpu.dtsi"
 };
-- 
2.31.1

