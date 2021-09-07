Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A34740267D
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 11:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244061AbhIGJxI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 05:53:08 -0400
Received: from mail-vi1eur05on2069.outbound.protection.outlook.com ([40.107.21.69]:36412
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244974AbhIGJwZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 05:52:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDcbMSdXhJ78G/oCek/podTDc/NFLeApOdIe9j9iLxX1rweabiHfJxtbgOpwULFHtB1Bo2bVTtLNwmFp+ibOwxJzbpGw1F+OQ/ylpKcQRfoME8E+dcacxCkhi9HvgsZ7DoW6DJ+nba/H6U+rnwnKEd7xBTdg8enUC/yNlhQrC7AXc+k3ik/YOKVrE9Fdidm+9zNya8tSZnAUgCmmy0T157aKPdBfj40tjEOcmeSFxQWpcAS8/uF1BaH/2zM/+jJobV66kdEV/jVVfIb0Ce2EyQfj2adTg9AKfkrRzE6UU7EvdTm0biITGHf9359fRLGpMH0/SBaB2aiJmGVQY35QXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Gy0E1mCprw+OmDtGv+px3Xv40mATsTt0+v4XSM8p7Ys=;
 b=ZRAAlBHZU/JLMEPmhdynJMB96byeTycwGXDwxAUgwDD7ctanI+UPCsXyOjw2ITS5o507tQgz6ESA23u2lsevykKwG0BIDIR7HM0PgQKr7nCi8OHmw0Z9LHI7XQssqLFuNNwKfAYrEj773NwKu8oD2OGiFeUg6kB9wJeISLzHx1xW5vJzamesWRhsLrhD5/huCw7llVXiLTpR6Kkt1kk0HblzrUR1M8L5NSg2L/2vhK2N65fjDUXgKSaL+IUJeM2K3+KHKIa4qFu3CCKm9hxObghrprnv+RtRWiJjCvK3yyRucr4WsNTH7xHrwW3jRoqvuaKHBCR/t/wBPiemADPwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy0E1mCprw+OmDtGv+px3Xv40mATsTt0+v4XSM8p7Ys=;
 b=eT1WZz2InadhCzBatVOckF0U1ca0l2Jcf0q+vUj8HoZ6AFRAQHdHGvfGLuGFg41tzLhyX8R71u26pXbunIYNaMrf7r1BIO/1IE3I04OekzbTZHjXOhiNRNwKNeo4YOYIZeEJbqJag851299/1X5QzwVL0+OFiC/gzFfn2oRyvn8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0402MB2772.eurprd04.prod.outlook.com (2603:10a6:203:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 09:50:43 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:50:43 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 13/15] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Tue,  7 Sep 2021 17:49:20 +0800
Message-Id: <28f73491de58d0c564541c71d36d6aeb57f7b267.1631002447.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631002447.git.ming.qian@nxp.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0097.apcprd02.prod.outlook.com
 (2603:1096:4:92::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR02CA0097.apcprd02.prod.outlook.com (2603:1096:4:92::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:50:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00faa52a-e98a-4c5a-e20d-08d971e4f528
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2772D9BA74AC865B683C31B7E7D39@AM5PR0402MB2772.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VTY17HXFmiqz0J0pU7o1p+XiS32wkASEKTWgSn/DJieGLRZSYkxCBhscoqPpeqKpUzBOvl1zJvhQ4/0ptweUXeBS0MhjQlQZtV3ihsNHxUzFhzs740GXklfsvkZzlFuenQwLLYkUKYz5aviKKGno6ggm6+Vpjn3OUQR+T3Ata04ymutiJ7GD4RC80Sg844j1lkjTA3B9l2P5ydNAZQ4rK/1VLdloaGvekb9ky6RJpaCB3UPPaGykoKaoY83f6ytwlKqHtzm+Y8LBd42Dbbrxk/PNph1y8EyLbxhiJmMJcBj4xmnutLw/U1XN60g0aGQlDsgdAs60TpFZFHYGisPGVkqvWUAp/FAqgyYuorfbIsHwxGJJfxH6H6104YTsYhffEparrFlzMDcz8wa5656WbPr6NIPaWwR5Mw1GCjOjUDaiDcUOTnTeZM1UX5Vv0s9T7i84GyZBKjVyLCA2HYvDzEQNhMIvlCJIywE349h2eVUJJE2b9r6ARgZ/BfJjjz05RsmHCKVvKvU7P2Jr5wSOazFHxMxZRdapvbyFPdkB2W4tO+FU5gID3vmfGFVbhNX5GBViaCr/rqAtoYab5xa4/c2BRWWEtWIG52tr760hD97XrOnyIiSWXtJLTCJLtTYBkcdRkeVY+L31YS+JtsjZkzFxYNmaVDg1g8YmgEUB3GV8TbXaZ5nYcGxRXzc2N2GgQWpR7CtUPrLEtd6hV8wezOrBAXm1hAfPiop+hHUrR5mI+Wz6GBgRafM9kMCV6KY3UlN0W096z7I0VDcPJRahA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(7696005)(52116002)(6666004)(66476007)(66556008)(44832011)(2616005)(86362001)(8676002)(83380400001)(66946007)(956004)(26005)(38350700002)(38100700002)(6486002)(4326008)(8936002)(186003)(36756003)(316002)(478600001)(7416002)(2906002)(5660300002)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2tz6l9+UsJf7dxufxbj9f9dB9Y4TmeOpnKq4qSymXDAzKOoDTnj4MDGmgZc6?=
 =?us-ascii?Q?vqac9qlKS39pxL5j1uh4Ot4yyWmQSBM+9WiuLPW2unxbwGVDYdJ59IAzcqJX?=
 =?us-ascii?Q?AasZRKKCDvXH+3rttzDqKXdIjoNK4u6kbTkatShDChYt+gOUaz4KrX/F3l89?=
 =?us-ascii?Q?L9ci8AawxMZmh2wpX94ZFMkCmz5lpEIykyFOgniNJDhkwJoW9ko4nfVHMbl9?=
 =?us-ascii?Q?OwcQKbPb3ybCA3x7YGptswJbDxl/tUVNaQfeSwsGbIiqfzQBqQqT+bEGYwhR?=
 =?us-ascii?Q?wow9stjC/grE9Ow7QhK/pVKE0qR0iNn9t0bmL9Hah4OI7FWab5MDdr+TtTVc?=
 =?us-ascii?Q?XX3TEBmC0/aE6PjHfa3/KgftThEh84bfent3YSvXQlVIZsnAmcGlr3nZwt54?=
 =?us-ascii?Q?Lg33TiSStUaWTpL8Pjf0z6UnToDk8cCd8bVgvSiBHk9PaBw31jM3xh6ZSmbB?=
 =?us-ascii?Q?uTkv4qXBt1DwXDAceINIDzmKIA2+exAtL0Rgjx1mC30zFVCBvX+M68h0q8vm?=
 =?us-ascii?Q?sc1lLEDPW4iwG5MEI65XtyxV8ES3bcnDjlwPSE4EGq+oN1B6Ajx4r0y7pcAi?=
 =?us-ascii?Q?I4B8ek59n9AVChtHTIKeUM2Hv6aRA8JPULxybbUNAtACGPrDupRhk8AEJDrB?=
 =?us-ascii?Q?w8vKs8+ZiLqRiqYWIYqJSYdH9y3tZrX7RLYzVmu7HP+TKfB4TGSuGl3+RTst?=
 =?us-ascii?Q?FYEwNGpOyPdu+B9lIXB/6og9tqzyNysekqbbxRU59+RXs7RF96r5f5mr8F5p?=
 =?us-ascii?Q?trysUH5Cvoe2ToWm9epMG8dqiE/vTGZNHzmwh8X6LG9UJArOxbVcrOTaVR23?=
 =?us-ascii?Q?/Po0P7MGuaI5LJlQ65+ShcjUCD265w8guACDOgYT47Y/yvbQuQDYR5zIiMic?=
 =?us-ascii?Q?3PK3o05QP8U38o+uiogWR7fbroFWgcVIOwtcSVtme4n9cul9rASDUFf+sOJ6?=
 =?us-ascii?Q?F1DLX85PQc4hlyN2ARBFQj9KTr6jrVQDZxyFMMJUiSit9GgCuXTmA1zjmbrL?=
 =?us-ascii?Q?n59PuI7wxaeRqkfPrj22TZWTar3QFLdG2xn2UftETwhlIr15kolSuZ7wGcl7?=
 =?us-ascii?Q?UJ7a6WJtsnMg1ZmH/oq8eSGL05l5XZfuAyQ9okHM33v8jIr43M4HeLLpLqgr?=
 =?us-ascii?Q?etnkqPYYTAQbHeshNnMsYmheq1+SGxTAew2eZL2cfkrLSi4s7idI0UahCzfo?=
 =?us-ascii?Q?UHoZGZcc1oq7LTTLfo7X3GmPPPiyZ/our/SIgkJMHIng1kP8EZ7fYoz158J7?=
 =?us-ascii?Q?SwWPxFa/FUhUsu8xhZmRZkyJYGjk1WZQxYQnkaCGmb1ohLoFdH8MIPUBIZuI?=
 =?us-ascii?Q?154KGqeiwGQeGDdrKWlt0msq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00faa52a-e98a-4c5a-e20d-08d971e4f528
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:50:43.1743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBZwlXJRWMq6iQIsv21WZGb+j9bhXPNBQ18I4yAfu3h2uCDv/W031YuAklDSL5unLGGNOfVW8oE27L2YVh3y2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2772
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

