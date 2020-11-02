Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2FF2A235C
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgKBDKS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:18 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727781AbgKBDKQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/O14qbC3nCQNOyXar0HOze8IhwFyTh26fRWo93YgOidcY1iZ+Zy/UQ+wmj6OOWrIFXT6ZtqJXBdIzkxNa7raPHP7LFN1sDs2gWyGwbzNvWYAPNye1eAiwLUN1VvkW9ITxt5YCsUQVR+0hG4oJwJ6J7O1Kba8J+NgSauhZEnE4VrrR87eD8B0yV9rIurh2JV7Uri9M3vrI4FjMn5HN9tEpiUEV4NkF6swUk5ljdYAzzIYgwd4vTUwc67o37TGlDJGWqFNzrmgTLKgJ0pGoWRQ5COFDbEL7sI2QnIl5E1XBP2pM0Qmzhceg5y1kJBZBoivxTJf9c1FAsIlRqmquXfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMOvSSgHNhcgFbSvMjgkrROxoUwvCKgAU8i+N1ujUyU=;
 b=CUEfGcmKize6EDO7Wt2KYyx4CFc69UDpov5iSu+UiH40X5xeM9ai6UwKWGGSlLI1bioBZFGFZm9J5aJ7Y1NYSfkywgqMABuX5bKu489v99ipsqHMe6O4a4xdj9e65E+VeReV+r3JKEoXm+Sb4HW8D1l/WUjFvlD/fu7kCDgYPOq5cc5RpAsINOvHxRkyo+iQYDqokltvpYpoLBmTi0VTqeYWp3IkA+CXuRbb/POBWtkWNUnu7t1RgJZWnuQnAYQTMfHJgs8IattKLghq4plUAqEWR1IyQLjBnHArdOm1N9xg2O/HaL+1BAM5qBS3YN82roOzH7awor9gieOrsT6uyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMOvSSgHNhcgFbSvMjgkrROxoUwvCKgAU8i+N1ujUyU=;
 b=ixCdV53EWvCSnTcInbuAz7ufD/ohC0hvdFso6Wnio/3tXF1kmLROi8XpyhBMvPf/x5LBtMt6fPj03AmbjdOlonExHz0FHRoKWps2sI6WOnIiRKi4zIndNtzzi2DpWAVnNuZkk+6qhv8tPRNg4mnPoPmDaU+QNIDE8KqbRwRkRqs=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:10:03 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:10:03 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v4 05/11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Date:   Mon,  2 Nov 2020 05:08:15 +0200
Message-Id: <20201102030821.3049-6-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.170.94]
X-ClientProxiedBy: AM0PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::33) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:10:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d172a6f0-4b9a-4373-6065-08d87edccafd
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB51734F74C43E9B0F9FEE0102CE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ytymTMiSlkhTD1oaZGW9FuKtx8wfhCPbAv9W6AoH3BEDpEj3yHTGbTAqCyPXDcrl3nmk7A+83QqRLj0cF9tCwdRiiy+7ISICebVHcv4o0vhZJbSGSoKIPNbNFyE+6Dxq5FdyRVAQFNxkEf7s/ir7T24IFxBypbVcSrIqHC7FRJSWuMPRdK9CybmbJLd5MZRlP9scFN/xiLOLmC4uRUL/RKWIVK3o5Q6Y9Y2wt6+DeXBJXOgy9v4J3KI8hN3ROapUqOFfWGfR6fL1+zvE9a85H6aWQTX5VIqv5Ng2Ma86e6Vzu63eyNE5/o0Y1lauRBkDOPX8SZVun+t61TKdlW4ObUdIDOohkq/hxjTBZV7EF0AeYegZBKAZtqnvFYBlWOy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(86362001)(16526019)(186003)(8936002)(83380400001)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BAKe5Oi3UeQ6TjFSaqnAggQ3uN4ir78NgGAeDSNEeh4K8HWbbmtKnr8jtj1ZGslrULsUjseizjp5IOPp0BKhrdMeOsvm16CTIkRFO/s8oT/PsYbvfilj/D+f1DDkSlcLktZkBYve28+BFx3XKWXix1nps46q7qpQMcZoYSwiuEvbTF71e7PlU5WvPyc93he3Ffb290Az9mPr06Tby2UpU5WdR3yQDYQLf9JHye8nUIKXyrgAyCsv9MaY/qkmKr48+UvdVw7Dn3ivG4pKPfRbmlGBZ4bspL3VfjHZJcWo/Cv1aIaoQDEM7o1TdpCvsWws3PBvEgNhy3zByA8rn2mAcARNIw+tSQM02pL1cHcivTjx2xp1aFcXi/awM0FpMpIx4lH/TYu6Q0FL/ZkWXAP32ZyAcrRTsU55MtMqwRenyQ/yU6Tuhl08FbOvCpEcdv0bbUJJGW4xqvNIM0FbrBo876l/gouz8H3gPK3e+t5DRLgjwOUB3BLR//ZADl0HwC00PMC8GiDmhM0pxXW5IbMmwnSDGtCwg9AFs/hjwDGnEx/8NVdalmNERlNl3YtLqVxgLgSGv5/DEDU4zc0GkSV0hQNvWTU0ex6HqpxL6dL7UeXvWOMi4M5UJA0witYHa7Px0cIxuGnkxQe9i/36pSu82g==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d172a6f0-4b9a-4373-6065-08d87edccafd
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:10:03.8241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tm+Y/vowgy9/fG2aL6v0y0uiXBudiyeV5JaPitrnqcz2Pv4MLlern5OIxkZqGlahvkJG0sLTRWWxCEkCBFnEmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add jpeg decoder/encoder nodes, for now on imx8qxp only.
The same should work on imx8qm, but it was not tested.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  8 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 37 +++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 46437d3c7a04..a0ad9789e9b8 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -270,3 +270,11 @@
 		>;
 	};
 };
+
+&jpegdec {
+	status = "okay";
+};
+
+&jpegenc {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index e46faac1fe71..774afa1d4665 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -629,4 +629,41 @@
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
+			compatible = "fsl,imx8-jpgdec";
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
+			status = "disabled";
+		};
+
+		jpegenc: jpegenc@58450000 {
+			compatible = "fsl,imx8-jpgenc";
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
+			status = "disabled";
+		};
+	};
 };
-- 
2.17.1

