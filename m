Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E351E3B6F55
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 10:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbhF2IZe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 04:25:34 -0400
Received: from mail-eopbgr70051.outbound.protection.outlook.com ([40.107.7.51]:61251
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232508AbhF2IZK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 04:25:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gl7DhX43TjXElq8z7rlfJwAu/FVf/Ict4NggH+Yspvhp/scb+zmqZ5/CRP4zqxAtIew/M0t+RLwauDqrhgdt0DGZ8nROL4fB7DkNP6PQQz2J1k63CjOONKBwF5qqIhF7PG/oT1xQBEAR9SiF00Psu8UYFKGGjqIYzQxLQ3zyRjpPFavZLHRsp5CM99/9Fsq9B3XxuF4t3R2EAuMlQjc0HaU69QenL1pjrAcMZP5y6k6dTqkWkoO/c59nMjpmAOi/4wNblcXUMDOEerBq0VL0LkoL08i6lfc4T8EvMRtRVetQbRBmEI6BALqN+sDdKFX/5g/zrYL0fONrMlRBoct6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2+pda5yJ6+LjBrBQemo2U2A4vTp4APtD37R3NpoKWU=;
 b=AxDoJVkwjOgC36P/SgNKLxaLq/hOSkOwAxDAzqGcDGMYAwzTSR1cYWVEneZFWY+asaaZ2nq+ANJT9dNRWKB5htb20w6EUTwbR1NIV4pWd0gpYi3oLaczwmKUb6xqUdb4Z5ZvDTYljuXfX3IJQVe8bcBraIGRGzApXpV+IGDTqdteE5mHoVnf4q5c1aiTqxf9ZelTjdrhRSuyKmftvUW8VPVvcnCvS1n+Kn2+zZjZyBToCeyKW9KGvbbZNZrlCQQpu26Mk5I1gRYD11en2khEgmHeX+3hQQMMGFzel19pftLUpleUZTP56bNAAD290TITpqpDblPUUXRgOQ0NPgSNxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2+pda5yJ6+LjBrBQemo2U2A4vTp4APtD37R3NpoKWU=;
 b=qXPL+TpkSzwmiYwWp47YU6z8OmGb80DjNrVNtu9TLw4wX/sy06T4eX7z3qPuA4nzioahHzPmhwz3yGAms9PnqEOasPSDS8dfxG/veKH4KmYJnmSjlMXTWDfbKM03BuTugI5xByNkHCkgsleZBf6WHc6yQoZWuPpLHqCd2lAPq8Y=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR04MB3089.eurprd04.prod.outlook.com (2603:10a6:206:b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 29 Jun
 2021 08:22:24 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642%3]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 08:22:24 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 11/13] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Tue, 29 Jun 2021 16:21:12 +0800
Message-Id: <5c25b5c8db63f7dadaa5bb5885bb892ec6d05993.1624954576.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624954576.git.ming.qian@nxp.com>
References: <cover.1624954576.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0160.apcprd06.prod.outlook.com
 (2603:1096:1:1e::14) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0160.apcprd06.prod.outlook.com (2603:1096:1:1e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 08:22:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a15fbb7b-611c-4562-6afa-08d93ad705c5
X-MS-TrafficTypeDiagnostic: AM5PR04MB3089:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR04MB3089C728F75F6324B38AA0A3E7029@AM5PR04MB3089.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8dzAyifD28yZnS4RtzOfiZVUQ/amtVGRDKJ4w0rwUbOMlb7ICDytwEXL2P4bghadrTYcwM/Z9TgPpWMGQjakaTVwBw6TUDQw7MAG4jhrFhn3uuRbTKVavLQ3wRoQ0dlsuZgvy+75vTYxpNXTdYcEaiZ1Irf7uAQMMUSwvP/9b8E8MghNlZeu4pqSbDym6xpZxRuaydFavetQ94hSVImORlZreNrP65PqojcpeRePSkAqzWQJgDlSu04wSU2vG52RBAV7XlmhU4BZh3NxthLaDMZz0av6I07lQ0hJZKyhkqhQWU6RJr+7zCGmLchpjEyC13D0juOc+6waA1ztToZXEjwSRgIU2SMyCR1hJuG1gafysdl6FPM7GFOAv+79NqQoPhQ5hBg3p31/Cp6a3aATImNaJ/yfUKeg1Q5eCIjTrFyt9Obp647G2QEgZmXIvb+ltGgmZgpp2qUBa0sHyc+4Rb/N42mCt7aicYnZiQxJuZhJsZrf8Xa/2HIVqshO4O3Keg3dcEROVd7JPIA/b5MuweBdVI8Iks+Uliv2nJ4D4jWEzUPypOw4hTwfVdVg379qGBZiELsqXBl2WqKKajbWHGB28mpii0LFx4xFsmaqmDpiIjLfo24VlfE7AspSjMY9nep4y06KpaFSWawPfhBKubdD+aCeiAomL+I971alkoBgFPC/o/Uoe2OASC0RklJpvP/AVhCSBxwCXLljND1K1azXFM+epdsoCRIz19KrxSUbMFnJpTyWf4peTe82QauQMxpJs4yUQDHw6JALcYHCnAlDH/3XlG9xjQihgiokGV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39850400004)(4326008)(86362001)(44832011)(316002)(66476007)(36756003)(478600001)(956004)(26005)(8676002)(7696005)(8936002)(5660300002)(2616005)(52116002)(6486002)(38100700002)(6666004)(83380400001)(7416002)(66946007)(66556008)(16526019)(186003)(38350700002)(2906002)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2iNUMZQew/AguSr1X1Nchff6fTA0eGjfhydNy77m3v2SjMypiEBsgrQ7leta?=
 =?us-ascii?Q?Zz2SHXkLdLmljCTWHQf4Rt86E5igo7WfAZs8lzjeKzR/qVJXaEKSlcwCqmfw?=
 =?us-ascii?Q?33FWencr+NXsn/eONAoB4IoMRVevo7Qaeqjhj7v3DMWdmy2+2Myn2SVlrNqm?=
 =?us-ascii?Q?i5iSWlAts0zCGPV/kHqd/IFE9USEQf10RlJx3UHgTsE8TmjMH7GgwVuyjxxL?=
 =?us-ascii?Q?tlHb1AnY0nrjzx9H1XxQp4dE0YlFdn39jaSnF1uFi6o3S7co4lvPb4js6V45?=
 =?us-ascii?Q?B0wSDgzIPRjyDgx0b/mn+1SnTME4athe5FWsyqkkRxXkha0iadrT8QOcuCBx?=
 =?us-ascii?Q?3z8CaABjBJ4pyLresAOaXo3pDFe02R78iPYr1EBcSJB9KpGHtzTIx4LikycP?=
 =?us-ascii?Q?+HEZusMBiKjmtTsbk2YPOpsgjrZFFBVpNQGAWqurd19MAEVCwrMvRMtuTOXr?=
 =?us-ascii?Q?dKZqJpEWNVJkuYB4eYU6lXoqW0byzqGx2YNrYMUl/vI6ywJRNZY6ABrvwuow?=
 =?us-ascii?Q?LCKfkrn8wISRBNAEIZkLJVQAVaaS2P+dK+mB5ANs0rRsiAU8X0r0E1stsSJA?=
 =?us-ascii?Q?0QGFWgGwFpKVAZKjxRQrCYezYWOTdy58oXd8IYM6QH1zwcapoV9VS3iWPdod?=
 =?us-ascii?Q?Ar65rm6TnKo4ujTwAqaYldN04KK9mNmVVqDdQIiuJfzvvdunJRdorFMTiLDy?=
 =?us-ascii?Q?hwujruLQsmt+/7INtbEkJ5oLKlpnAZ1o11kqjl54e5YdNdTCHB0yz9h6bB03?=
 =?us-ascii?Q?cTs0us5hIwg7LUgye9wIjjLhlUAB81SxD6y84Bw352jF4vbJYlCcamkJm569?=
 =?us-ascii?Q?V454FKcRNmtZjEiw2SNmZ0jwKFgGsOl8EpzA+TQFHYk7/K0mlAUNpLYFiFob?=
 =?us-ascii?Q?yL5JxetnzWe+EYwOX9j81tkM+MGRjG91XoGLs5mHvinyLJHjah5qHxQJKABz?=
 =?us-ascii?Q?ut6d1kwScpKKAyO8hxMuo3B6sQAMd3GTJ+nRcamnW8MS6Xj6s8Jnx+lZfvN4?=
 =?us-ascii?Q?qrmpeLuUC/iYIB9OJOeOgKRLLak7vMsfJDaqGS7hIgBt2Z0xwWcnWGWMDxGh?=
 =?us-ascii?Q?Ar0oJQHTtqOtWHdSonwokS785wP0apyxl/Y/tZhJwHfqwrtCPyu0fvad+uhU?=
 =?us-ascii?Q?BdqLOdM7K2JLCzvJ0kYFwDJ+ytjH3ok7ZXcbxmvlj4GhQVsrJDY+To4jW1h+?=
 =?us-ascii?Q?nMZd9eU2ir/kqik5dRNvd72+RUKbvrLzTR/cuTnkThETajPyAJIpEAt0gaGL?=
 =?us-ascii?Q?w1+qalKr/99Uo36J1aMLCbGpVSWH2pjGBObRXWsEnGqkNnBPbeDrP/tWdmD4?=
 =?us-ascii?Q?xiMlGi7cXKKVkGCheWPqdqvm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15fbb7b-611c-4562-6afa-08d93ad705c5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:22:24.0388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2B+ak7krEVjATC3sR4xZKc6/TMQvFii7zMWxn2yEoaVezBoACyMFzgq1lZqncasH5GYyT18ZN7JJvYlXVVz4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3089
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the Video Processing Unit node for IMX8Q SoC.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi | 72 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 22 ++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 30 ++++++++
 3 files changed, 124 insertions(+)
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
index 46437d3c7a04..49ce171cc8fb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -196,6 +196,28 @@ &usdhc2 {
 	status = "okay";
 };
 
+&vpu {
+	compatible = "nxp,imx8qxp-vpu";
+	memory-region = <&vpu_reserved>;
+	status = "okay";
+};
+
+&vpu_core0 {
+	reg = <0x2d040000 0x10000>;
+	nxp,boot-region = <&decoder_boot>;
+	nxp,rpc-region = <&decoder_rpc>;
+	nxp,print-offset = <0x180000>;
+	status = "okay";
+};
+
+&vpu_core1 {
+	reg = <0x2d050000 0x10000>;
+	nxp,boot-region = <&encoder_boot>;
+	nxp,rpc-region = <&encoder_rpc>;
+	nxp,print-offset = <0x80000>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index e46faac1fe71..92be5c53c65e 100644
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
@@ -133,10 +136,34 @@ reserved-memory {
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
@@ -629,4 +656,7 @@ map0 {
 			};
 		};
 	};
+
+	/* sorted in register address */
+	#include "imx8-ss-vpu.dtsi"
 };
-- 
2.31.1

