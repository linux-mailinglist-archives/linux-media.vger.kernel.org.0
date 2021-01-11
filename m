Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0AC2F1F68
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 20:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391093AbhAKTbJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 14:31:09 -0500
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:30817
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732738AbhAKTbJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 14:31:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToUN7EoCCT61TPOrPND3YUBXWWHtip1k4HT+QehRRGm1MYs6tlXmZUd8SjFEHVpMBQYiD72BVYl+20bI8ZxFhRXdndi1pvqmORLFhz/kFDI2hYFIUZ9H5ZIBfL3660OCYmNDgqzTACofSrsjYJBfmXInJa7p8i+LMr8i1e5FLs96LyDAmov+9ekZw3zX7/II+mgvwaM40PNyNBzNuiJzVZg9ar2rspYOEV3BbqPTbJbhz2ygs5PGOkrPWdPW0vBKT0oT+8CswjUAgEz7w0Y3OSKT911RpUJ1TGDl3smuL3RkuEOEOYXdZTjjcxZPvEWbAQVw/Ewv14gDhAGP7beJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HaOCnWJvAtGb6ECXUOdoWoIOnXIznKlOrctC5dTma8=;
 b=jS1RS/YP5Kuc8Wn1/3V9hg+aftlIJDktW+XxMGve/nn0uZCMQw5wFhLpty8Ye8bcnOahDRR2ZAvDUuskn4+umrpMkzcwXzj/POeB6Tv2dC0uEuYS8MeAK5LnE0FIk2Hmn1pXil3mEuYjNYSCVb1alHqPRfjiMlSEhqu1JkQujXWReyPkizjHEPEthWCzZOuG/HBSBQRx+o+Yl/8/5lhj5ynJ+/HkTWbg9rlGnqBFeqOo2EQM2u2kL2aFGAnfG9ILN9wsXgVuroBRGdD75JkoTcdX1On7CqHG3CjPwLQKZlUQsM6VUNSOkrDYCLmCJw39NhgvPlCwbYcnjW15DoXs0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HaOCnWJvAtGb6ECXUOdoWoIOnXIznKlOrctC5dTma8=;
 b=jagueH4INlWV+VGekBrDRcG8xg2O+Ju8SAL0QWdaX+D//OsNpWCs3YRu8MxLVG+id71RzscSWxMyG8WAU93IKyqu0RN2qn2+3V+qK7+5epYzSO3corCsNjeEgl3xbNDhYTn46S/42jjKYp5CGurK+1fIiTIqqgjis9sNz+rxbzw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 19:28:50 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%6]) with mapi id 15.20.3742.011; Mon, 11 Jan 2021
 19:28:50 +0000
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
Subject: [PATCH v7 4/9] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Date:   Mon, 11 Jan 2021 21:28:17 +0200
Message-Id: <20210111192822.12178-5-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
References: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [178.138.194.64]
X-ClientProxiedBy: VI1PR07CA0296.eurprd07.prod.outlook.com
 (2603:10a6:800:130::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (178.138.194.64) by VI1PR07CA0296.eurprd07.prod.outlook.com (2603:10a6:800:130::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 19:28:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2a611b7e-ae5d-4dd1-c5aa-08d8b6672001
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB44244265C2275690EC31154BCEAB0@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UuyQkDHZtX2nmZp/lpGv50OdragjBfOUmrisxrne1oCgLsab38+JYd9MXKYITDAVwLUSSKTFNzlNOYEImoa4ook5MvlL4QSdvf6pGn8zG38PKZfjzQxjSMWrKew4+ARi4vt5Q7tp7GkS4/wij6CX6yZa4Z3Ep1EudDyBZ1OFYOF+KyGv33xEfkKiA+gvFTCHZV/S0sPi0b6sPrnKxyzYNXz1jlMmDIFyEU8KaB2AVFRhNMzuy9Vh93UmwhkxZX4HXGNcMzfHedsDvpfp7n8BARuUKvTLoi6QBWSFD0S+m6Uhk2A/NW7qyErhhXH3HCXClHteMXunI9OEoFI1f5vorvFTGSjzsbnbinfxh441MXFbRSMudmNsY1M16cBkiBeoB9mTJ0WZMsgws940HV34hgAJAzXQEtgjunJZYKxBaDXzGDXkOmrKQsEwPT+eoQ/S7l0KOVBqVXLWMYkk+kCXiALkrw2a1osgOM7ywOUnmJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(6486002)(6666004)(7416002)(5660300002)(52116002)(66946007)(316002)(69590400011)(478600001)(4326008)(66476007)(66556008)(1076003)(8936002)(2906002)(6512007)(2616005)(956004)(44832011)(8676002)(26005)(16526019)(186003)(6506007)(86362001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vUPNnJfd+Wsu8wUfoq8j2T7xhaAW/y87olfP3cnXxa4W1R8XoKFB6hcjeJtK?=
 =?us-ascii?Q?Fak9tlAn1QEHEV3uYW0bteDK15jzjZLBbbSeOV+OTqPZi0+E/v/YRyKvVJmd?=
 =?us-ascii?Q?4H4pSoU+4rOnHYvkim2CxaTgMTVJayD/R4I/Rf4WI31IP49q+9C0f+ubXOcO?=
 =?us-ascii?Q?xYooe5g+OGRi2cw4gJiCwHNAeU8MSkRPhUqlv7bhLcpE0nQITmpNiCO5Q+Db?=
 =?us-ascii?Q?2nSgubWyP/E05u/1cDRt4NO3gbHyEeaok4ugFj6L5aEnX+XN0Aw99tXqOgj8?=
 =?us-ascii?Q?1XV2hvMeFAGpGXx24+hwnnHVn3Dado5amIVpNV+QwX1Hpdf4H5tun4j8vO4j?=
 =?us-ascii?Q?DPiUbTEd6TRyoLMvFXhHof/kgfWnnJOphTU+6EwoH17BkQguK43RPcY5i1Ku?=
 =?us-ascii?Q?jtLngpWaKE6qejbQXomJq6rT92GyXsTr+NkBnlZ3in635iqQYt27EvOE8S2W?=
 =?us-ascii?Q?VVUWy8enGLZBii++PRHhatdmUTFWkKdtt2zIrOTJQ3Z1t4sBYXuiOiIntDzu?=
 =?us-ascii?Q?q7Oc7LFWc3MxlnMhrVBkG106a2FkwRJazCYk/cG51rHS4agmgJOU+x+034LT?=
 =?us-ascii?Q?AETzEN++r8OHo258FvP6m8+zOcUz4l/E0y9L1esAPIoKSMYdQ0Re811fqefd?=
 =?us-ascii?Q?YXcXpwVU3hXTPvUfL1d00B8uXTSVKbVetE8w5E3Cs7oUT0MCXAmPpe5O6gdH?=
 =?us-ascii?Q?xzlPGW9qa0RehdqqZ1G/jOKhMYRV352FI8zwAS2RAONsIm+4U4pQ/aBfGWiZ?=
 =?us-ascii?Q?N3JSbA4vXJ0FF7nhZuUA1Tws45IsBOURyfhYXhf/bKf0QRWuP7HzNh7ADZx4?=
 =?us-ascii?Q?AxF7U1RcSKxGEc/hAt1iXiW9Fm+oSB14rWPGcoCx06EVBrRDmzfCl2jYmuep?=
 =?us-ascii?Q?XRm/fk9/jso4xha+MkRdaUdEsl9CwS/QJnethTA7ndR1Gxmwz4qHCcw0X9+q?=
 =?us-ascii?Q?jNRlfUiH+CWpKA/J2Eku9oLQbFHRwStfm4h5SFlINSIcDe6Kwq7L4uuDZ+cg?=
 =?us-ascii?Q?v4nI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:28:50.7020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a611b7e-ae5d-4dd1-c5aa-08d8b6672001
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1xnQDDI7oHv+lP+dde4tZ68W59j9SDGQETqg8ZXtfKEymJXZ0jgCgU5KarryuSdjDWZ/4BXzhQBg7AV6+BhVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424
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
@@ -629,4 +629,39 @@
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
2.17.1

