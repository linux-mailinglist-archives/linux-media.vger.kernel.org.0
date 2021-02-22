Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260BF321FC2
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 20:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbhBVTNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 14:13:13 -0500
Received: from mail-am6eur05on2047.outbound.protection.outlook.com ([40.107.22.47]:47872
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232852AbhBVTKJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 14:10:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkLrbMiUpExLs4m9UPMH7iWyITOq6H/U1nQC7l0DfoJsYhKdWhguGshs3iZv5MwOpjlHtaOedJvpeDUDeSoXhyvoNuE7Px1MAiMuIuWF77Q6fKOgTt4A/hTIuclQ4SPOYXHvxziAHDA4E++CTxeTqr5eIo+JlAxCvsTjNTaFbBpk8gr1YU1zXkkTRsc1jGV4rznJhRFUX/ZnhIMkJq8tzoXoi62qIcxNpr3eGesRUO9bCuoz6hdzdKuHLgHGT1X6Fmgy+OAbIRzgleNPDQOABr3Sz8oclitPaLeXyi14JkP7A1l00CusZuKBBE6TGOUSSNSaqXAwiHk0BJZ709asnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzhW5NqQ0iDAfA8eGHT5kNIFMpWDCiXBXrnYX52tN2M=;
 b=REQvuOynBmHqGxwYkZ02cCIK544QuaphK0dfqClVptHZfUGraa37CBE0dtPE0QYTfkbP2wtC4gEH7iyew0cmAd6fULYnhd8Sesfsl/gYcPsKhVRI2j5h8t9EVUQHnoLOjdl9EjtUCSMNGHQX74cQ/og/HGgszQeD34eXBHr8MPALofJvXEWxbVQcBFBCwIU3Khd4uChTApbWbg4adrRwIR7YqRuoUFEq5xjFv1SbDdZ64PFBgBWKWjWxlJPYCMDdEigLUeJen89ZQMyto5v6e7cqims2W6Hnkj//zDsltAThvbzrngC43Dg8Zzg/Zp+8oQ6H+Bv8mRIzCevmtKNGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzhW5NqQ0iDAfA8eGHT5kNIFMpWDCiXBXrnYX52tN2M=;
 b=P/MdEWyckaZLsVdGMTuWuTTrq3PF14m9uwfc6eBnTo4reV6h+JkF0u43yRuObHz7ThnShWFbxE0YvLplBnaB6V5EHRtRmd9OP6mor/EYwRdke7ufGphPEVlz+gcsTgBBlNL7Sg9tJxzpHHyXH4UqkbtpfBJ4ayZumWbu4hrrbjU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 22 Feb
 2021 19:08:13 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 19:08:13 +0000
From:   Mirela Rabulea <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
Subject: [PATCH v8 4/9] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Date:   Mon, 22 Feb 2021 21:07:33 +0200
Message-Id: <20210222190738.2346378-5-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
References: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.124.171.30) by FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 19:08:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 975bd780-4945-40eb-02c3-08d8d7653376
X-MS-TrafficTypeDiagnostic: AS8PR04MB7591:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7591C7C546308EB327E36B6DCE819@AS8PR04MB7591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ihXWJ05nL45A8Ti5G636ySDRZuu8ZI7zV2aV0jWnYn7QPGRJ1QO2udXYfxli9sQ0dJICETmO9p18Mz/n3ReEFAD8Pm58LqWJ8eEsA1Bo0+akeysVPQ7A0GzRLlSFXFBneAAnKu9d3+nwV3EG0pLInGbtfdpdjtx+LZVFMgiRQBVwo6yc4PziMNkz8X9S1DciY/sQ0DPN0IJIPE7DXBExz4xD0sjE9igHABsnZKL37EjWLxUlGPNbZtNnULzXGbOfBYbclwgDsd9Md+abi1/lIA75loA770FRawKBfCd+gY38H/eSwDKiED6ezI3pgOKc8HVRFrjBB/G1SvqPlOrRtGbQTyVDQROy9NinT8VOizIUF3UeYQKWjDJxtGu0EbjYLkq+VbhsQ6a/BIaDnrwkl7/F55Os1VEmVOQgwN0gJTZVpkYL7e8CCRU034x6ZFZojiBNQYSPlrMwrXyvUH2zrUY+1nFe4apKo18w2XufPEw0RrgJa8FDr5cVnRQlGXB8CtuJxrAFlBOvh9U7lOhRlakIYDzD5Y01D8P1zCdYZ2KjdfraYcnS/hYbvbfAw6Xt9bBx2q6e6qSmms6FF6Lx1nJs53MtV4vVtGy1Hij92aw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(316002)(6666004)(2906002)(956004)(2616005)(52116002)(8936002)(186003)(69590400012)(1076003)(66476007)(6506007)(86362001)(44832011)(66946007)(5660300002)(478600001)(66556008)(6512007)(6486002)(7416002)(4326008)(16526019)(8676002)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7J7LdcSo/D/Bir61wFhahAiEJu7sXVj7yBJefJd3E6I+aqXIUGZHL0x6EEf7?=
 =?us-ascii?Q?DQlDSy1tC6w8iemacPMDrh/YaNT2XHyG2pOMqTfBsz6D1nGo+YW/pfyoVKHX?=
 =?us-ascii?Q?ieeFFfFJV1d2tv1AvRhXTGeIgHkTPVkxv/7CbGs8MvlBqJ6NpERHVkHOKYuI?=
 =?us-ascii?Q?yAh1twXEM2OjHOKOPoILxFfruOemyS0vLTyPi4cymmLiePc5rKRrjvHXoYGO?=
 =?us-ascii?Q?ZLjWUVaXN08A50Q5FbpYbsTZHLmsZmd6N0og/qQZYRCLxme1mpFE/9A3t8IT?=
 =?us-ascii?Q?XYrx/auUhPtoZZlYXvPd7/Ys355nI5YKnGaDFPXOQAuYOs0hUpqpwyA6u06s?=
 =?us-ascii?Q?iN7nOIzouFhzO9nrUUmkCtnAW7gMz/BopMxL/66m2riVnNJULVfeb+Cg28rq?=
 =?us-ascii?Q?fWbk4F3016BYcdGvsndZe1opjqeCeCSVxIr/6s+NipBdAB4bWuBjtQFSJLEt?=
 =?us-ascii?Q?o3gjgv0NKaBa/lIKdQBSC34X1VJ4/5Oq6cfZTFqWOzAORbDIBYmKqdCZcEdA?=
 =?us-ascii?Q?s8UFtQmHqkF3oqLNSssDjIQ7SHMX8f5RKoJt7ECtD8Z+WjvB+6ZJhoO8lKo9?=
 =?us-ascii?Q?jgTli6tFG3KECHbqSP7ddTRwenFrDyGJvhgvqDIW9/cbcsuYD9fVIIS3PXn7?=
 =?us-ascii?Q?edt1tXF/AGlT671eb/ZhY3R46/P8EAHdQGwykiPM697k2yKqF4PJ8wr5YZLw?=
 =?us-ascii?Q?b0xeom0ZvB6JqFjV7fl0rrXLygdGTB5Fbcof/kztTHb8FJU/ALbGO+VIUJWk?=
 =?us-ascii?Q?iQpXSzV4eLGAGx+ppcnbiYeV8fV3ROoKuO9rI4fNurp39E7CRMntnYFWLIm1?=
 =?us-ascii?Q?HiHDltWP4VPxc0/Cfss9WonyM6UpH0+uOofntgeuHx1FNi3Ror81N0BLyMUA?=
 =?us-ascii?Q?WQr4HM37hwzOOc8ILeLHLp8MYggPKRK0JFJzCvQfPnSj3h9i26HhEsSApQMu?=
 =?us-ascii?Q?95GTVXg7GiBFJyg7qZaOVdkv9K7En5LTXSJpYmX/nAcHDaJq3KFqPwlRnXmP?=
 =?us-ascii?Q?OzYGyNmkglHlzCfFn5CYqwa+ga5414y/wvCgvXTNLAVJ9YltB+ecuUpI8LdS?=
 =?us-ascii?Q?9/pSAnRYTH83mCCOhEbcxqtJqAd64GZQxegUL7X8Dr/VGZ2yo3Gefj3Xn/x7?=
 =?us-ascii?Q?XZC7x1Lbf5zKZbArpaHSNIui942iVHWC04Yymk/vBIFUP0kXESAuNSK5Xw2+?=
 =?us-ascii?Q?zUXo/fzsbkzItBLrs/pZz5oTO81MNR6wjpHOG4xHklBt4q8VVXBUGIlXurb4?=
 =?us-ascii?Q?pyCXcUHKvFmwuWvNva2CLgPh+EqBD3pyriZ8NVfaVE+XUZoLhxYUTq8Kz281?=
 =?us-ascii?Q?Jc8ggedwPYRYZkp+PyWK9pNBG77Ia3rFzT0dkaCwfplk4A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975bd780-4945-40eb-02c3-08d8d7653376
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:08:13.0424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BtUM0hmTKs6AbOCoIXqFClwHnRdYjRwx859kqKdtHy7hZ504ivnaXqkzdDjGFFw//Rp5TaeWB3YcF2t33cE+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add jpeg decoder/encoder nodes, for now on imx8qxp only.
The same should work on imx8qm, but it was not tested.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index e46faac1fe71..ee822560af54 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -629,4 +629,39 @@ map0 {
 			};
 		};
 	};
+
+	img_subsys: bus@58000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x58000000 0x0 0x58000000 0x1000000>;
+
+		jpegdec: jpegdec@58400000 {
+			compatible = "nxp,imx8qxp-jpgdec";
+			reg = <0x58400000 0x00050000 >;
+			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
+					<&pd IMX_SC_R_MJPEG_DEC_S0>,
+					<&pd IMX_SC_R_MJPEG_DEC_S1>,
+					<&pd IMX_SC_R_MJPEG_DEC_S2>,
+					<&pd IMX_SC_R_MJPEG_DEC_S3>;
+		};
+
+		jpegenc: jpegenc@58450000 {
+			compatible = "nxp,imx8qxp-jpgenc";
+			reg = <0x58450000 0x00050000 >;
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
+					<&pd IMX_SC_R_MJPEG_ENC_S0>,
+					<&pd IMX_SC_R_MJPEG_ENC_S1>,
+					<&pd IMX_SC_R_MJPEG_ENC_S2>,
+					<&pd IMX_SC_R_MJPEG_ENC_S3>;
+		};
+	};
 };
-- 
2.25.1

