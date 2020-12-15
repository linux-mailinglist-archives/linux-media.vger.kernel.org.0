Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B438F2DABD4
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbgLOLUz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:20:55 -0500
Received: from mail-eopbgr130083.outbound.protection.outlook.com ([40.107.13.83]:62016
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728758AbgLOLUs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:20:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPovnH6H7drncWsQ32ZjCp8/c0z8mX7zsx13dWPjc3m5E2gLMqBO9Qkz+tVoVYWMMIMCzLI1oyeR4CF0yj0lSrmLmXSsCEvP+gSLRKCW7L0sdlBtKxJskeM1RDSSt5V4CK1nd/2fHwLS2NK8ZqFL8ncEKAbw109E1v0gdHb8G0a7lgb2tBqU73cyWg3vWgxA9iIxjzfunVqaousy5EE5Nz64AuSlmoucrpLTd8NhvJTNW+9cg5fhf4/oCl6qBCioawOjCxiH7hZ1PRoG4NFe5mQH4N0gV1NAmxK58kN6uiDp3VWGdCt+Gz3kqUEs5P/QhUlR5Xj+JUpPrC7flUCgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6U87qm3k/1UwuQMLQa0o40T6bNCr1bNRj+NJT1CZds=;
 b=TL2aDXcK1vPBSLSRPK1k6kb6ZwfR4stlFAfsXXIm9TWFYHVw16g4Fm4HuCKykgAomnXRbR+Dcs6NMXM1XOUaKMYp6r7rjYuxvzYDRp6bq639W5Go2cP9OrkjZ3kDClQnPTXITUbEp7a1IRs0MFcSQOhF4QbQZV7euv2ErcnfUd5pCGmJKfQxcDQd4mRhZqK0Xb6/GQcQdUx5RzjxIYTs3+Gmdl2K20Z9IBadWA2FFuKF+8hkGxNGyKkHe88reIeH92uNRd7JuAXLIvrYKFlH0IfVY4W+IUEDQlElKm73xFYJ715KKY0MKZ5U8vAiLd+VKtW9+1b8Nyzpi4PYNvU2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6U87qm3k/1UwuQMLQa0o40T6bNCr1bNRj+NJT1CZds=;
 b=UbnRLIhC9nwSjpwT0HnSWIL4sxbCSc5iXpq2hu2KgTGT/VhCkYCv0/MNYyTmsCK6vUqzNfC0o01eMuCOkBJnGBQrC3HcldKJnIg1nSC0LciZ/UVy8CAH+wFlZPeBX2gA+M/gfHg/APREJn/uB6IQziqbkOGHoJDm+c6F9o/tQ0A=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM5PR0402MB2737.eurprd04.prod.outlook.com (2603:10a6:203:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 11:19:26 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 11:19:26 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
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
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v6 4/9] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Date:   Tue, 15 Dec 2020 13:18:38 +0200
Message-Id: <20201215111843.30269-5-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
References: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [79.115.51.151]
X-ClientProxiedBy: VI1PR09CA0178.eurprd09.prod.outlook.com
 (2603:10a6:800:120::32) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (79.115.51.151) by VI1PR09CA0178.eurprd09.prod.outlook.com (2603:10a6:800:120::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 11:19:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6db7bd71-aae5-4ea4-7b61-08d8a0eb4893
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2737:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2737EDB2701E14759A608B8CCEC60@AM5PR0402MB2737.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: po22yDgm0UtT4IHO14PJuipg1hvCzD8H+um1eBIUKN6B0Vh0QMhKGkx8Y/UXCti6yEnnLvDfcb1Tc0r1dAL0ZSIa3dsB4/vUhs8oNF3YqYMOrMUeFTqbh+UeyoVKJwC3CWfB2X6/V3eo5nI/fyoMTSDxDUjHb9UuCz93OLBtvqlA8rYoAhqWp5Ypfzkh11WOSPiewGJhCqX/oNv2j3Twe333nPXrbv+FckuTAz1AJUNH3B6ySyCy52qUN2CQG6EeTZ5SUAAhrG6bvrcMq7oqy57BXh7WU4C5KzLpxZ7AmztZ/VOeaLS6voKDGGscvFYfBdJEPOfs3BcWY+r4G3Ul4NOjIIpwyoakJ5pQQaqgtruE8KXNWaRLXCwnbuxGC3RH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(2616005)(16526019)(8936002)(52116002)(2906002)(1076003)(956004)(66946007)(6486002)(66556008)(66476007)(498600001)(6512007)(86362001)(8676002)(7416002)(6506007)(186003)(4326008)(26005)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KSZLd7N9hp3BCyR/ZLZn9v1k5DwwiAqy9Bh5RZxJLQI272nNfO/ROQpgHBNh?=
 =?us-ascii?Q?SPc+lcgFFYUpF/ORkbWiS1ZLFyNKCczbBn/lxPiLMUwhV8NBHgfdyC3PmXKR?=
 =?us-ascii?Q?4D4WG/e3yUoxrvs1y0Brt70y2nQ+OuXiOXueMGJJBw5XtqeDDFLHpwjQinNH?=
 =?us-ascii?Q?R7JGVVYLXjGE32wke3gR2XYFChqzRTbR0JiJRS/zSGrA4k5tcJqj6HNQJ7hO?=
 =?us-ascii?Q?7XLtYDT+wWFi4Ahbn4pK2yaUjB7G4nR27+EbpIFB1RuHEEH7eccxaSRtxJkt?=
 =?us-ascii?Q?bjf8qvqKDsq/xAS65jZqUHbcGVWbun5NTCccar251xf0uNtWRUA4fX+9XU+U?=
 =?us-ascii?Q?xbaU0PcaKWZojWo9eAQN0/6d9whJMYS9O5B63nO6VaF0QFMBO1Wt6nj9h2rV?=
 =?us-ascii?Q?O4QOsCF8QyJJtAGQrBPh+lIRx1eySA0xgZKg9BKfSXZ4ER87bOj6MzK67V1p?=
 =?us-ascii?Q?CBvpMePNkcZa01bKHWCIFbhwk5+eIeOhE1/hJfnda6wo7yu9cfFPKGXfdIn5?=
 =?us-ascii?Q?OnajSi/nxVFOHmTS7wavFBGJiMJGyypIKVtD5F8yH5v4obPuMdQKLPAr2/JX?=
 =?us-ascii?Q?CKPd1RU0XFoX+ByOyYEzgWrNAFo2XLf6s/y5/oeqntvHxL6WOrTrZVKlDyEA?=
 =?us-ascii?Q?nqZBb/nOF8WFF3SAVa5QPoqvyfo7aMe1gtfY8mItsmJg7HJV9ycsHiMAHA9Z?=
 =?us-ascii?Q?AUHtsXqxjlVAbc7ZjcKv2dzz0OsB0YgjlSHvTeeE8BQeAyeY18I/ZjNrj0J7?=
 =?us-ascii?Q?mLnmmeegxG3/ELBmjuXfwTJVz7Epqilqndja53ysunusKhWM2kh3PGGIe5mx?=
 =?us-ascii?Q?l2djaVCh+ctvCFZcUZGPRgMW7QYPY4kPzNAZ+mM1nNtaW2JSMEngS3dfakEQ?=
 =?us-ascii?Q?Leez8IfaD9gZH4+tjps/w1aRVudErJic1ImA56jnhtdK/Rl5G3sffF4aULcQ?=
 =?us-ascii?Q?+TCEJFy/XtKXirs56YG5MSK+O/EJMpfdbA8hLq4Vwgiq4ztIXJ2GLy8O9mV2?=
 =?us-ascii?Q?mGmL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 11:19:26.7499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db7bd71-aae5-4ea4-7b61-08d8a0eb4893
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eo98viKMsLnkMBJtiAWTNi5PLBwtOuiltt33mJMDi/Lx0aYD7bUaWQfWvAwrCysieI/7ZZ2YMtc3q6inTpFKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2737
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add jpeg decoder/encoder nodes, for now on imx8qxp only.
The same should work on imx8qm, but it was not tested.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v6:
  Pure memory-to-memory are typically not enabled per-board, but just per-platform
  Thanks Ezequiel for feedback.

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

