Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5ADF2AFF57
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgKLFcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:09 -0500
Received: from mail-vi1eur05on2077.outbound.protection.outlook.com ([40.107.21.77]:31329
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728061AbgKLDJM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 22:09:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhmXvR28Z13j89ZM0Yy/KMTUj3Z5cOBMYAu3c0qYBMJ42dG6t4c7A1ibWeYiRrbxtJMmyQjUfaT2r9Fu4ogoke/jP0ZwjagU4eAGgCqgt3ry7p9/0VM2X5GEC2qmfRWDNWMJ48W5dqzR/dAMN8vQ66rjikRjZWHkK27bEV3QlMSl/2+ij1BZkRF8vJaU0e2Rq647QsSW8NxvuOaWkepaSgnW9IXd9yrm4jArZBA0CbOj59qibVfAci1JTh5QJI1hUQjna+o/VzGtL6QmRbHsuNNnwUZwlhL/2timm47v2QFOHg6pTPwMN0kLP57E3EXszS/JrnLx0ud/3BEuwOxPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asYdVtgjIwzKqgp/1lbjUgHKtbm8LUevvTtopi0Cftw=;
 b=oeCr1zxpeZpu1HzA35a+LAuKWjygmZFza5RuJSs9lxACYki5EuDtNYO8Q4f9vLVhxTx744d4yoy0S2bpPxRdAR9fKuobq8yBsod7PB0GUaJIOBb4KCp68HOVgCtMLWHTO8r8OueJkYXr5qvmG+ndfUeRbdk5owOb0LTMZnBuqOenMZTTyO7m6SW+aletdpU3ktkfmxvAAjws7CO0N9iWAUsI6XuEAId861fGyF2BmAGKyqgL3j+zc/QsDbtny/xjtE/vsD0otFUGB0oSuaKToW6vxEtj156l3EgDD9oJoJqJcDCkgqz/VbkK3Lgav3hR6XYZZTVBN953TiqrI3XHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asYdVtgjIwzKqgp/1lbjUgHKtbm8LUevvTtopi0Cftw=;
 b=JVJcr5eZWOJd2slzsoGnz7MgFX4AufiBRKRomflS3+WpOJaPEdBK4ZSTX8sBXcjagoabtJfIW0Mp7mzCxdlRf12VyXl20rCXC2fs6B3q5vxIm1rYFjGluIzTOf27xbMKvQziqippWNGvFhUsV6RQBmJx8S976Iu+tqevu4aMRfA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 03:07:06 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 03:07:05 +0000
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
Subject: [PATCH v5 05/10] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Date:   Thu, 12 Nov 2020 05:05:52 +0200
Message-Id: <20201112030557.8540-6-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.138]
X-ClientProxiedBy: AM0PR06CA0100.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::41) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.138) by AM0PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:208:fa::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 03:07:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9ecd10e7-e139-4959-7ea9-08d886b808ff
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6997F1AE004B7F21CD872CA7CEE70@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CRvfVfzfywPxe/f9jAJNtYnXc8pia4HKgcvTJAFiSPyycglgKZTyDV2iyp0jYh4vQEP6X/axRjtlzVYzosVvo+w8c74j+VlUR5pwOfCPfm+2MjLPSfoG7srpGFcoioWoalVft3Qmh8C8o9SzewKsKakQhbs/NgIUqjS2twsfiuXcgOsrQ/JnxLFRxOy4TMu/4twdxgmEimJzdDdgyh+8fRJ6Zt336UBUBWgszm9YcCpeSz2mhK3EQQ+Tzh7Q7JF3PI38NyTHk+EsQD5lKNdfzYSxJD/j3dhr7pSLT+tpkJTHwCBThwaxjxYgY1OqVeRwevlTupRLGv9s7L9dWaSeGoPVfwWd0cYvgH3KE6/9SKSIyHoyN8zv+3lRN4kGERNf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6666004)(1076003)(316002)(26005)(478600001)(6506007)(4326008)(6512007)(66946007)(66476007)(186003)(6486002)(2906002)(66556008)(5660300002)(16526019)(8676002)(52116002)(86362001)(7416002)(8936002)(2616005)(956004)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 98D2N++c3MOp+/HOe0aZ7lzfLcb7IhodmIvOvkrGtfGKKa3f9YNuOcct2UvHwLcpgZoh0pJCCV50tg1N0fd2hQAKMSM+RUvNrC3GPJa1aW73TNQhUYeH5l5+CIToT5pkKKBArVWHKdsrkEtQlNiNTuXripmz9gB2oUHIl6je+s4aRm6zTVMvhkQUCK5pQw/SXZGpUDvJ7D9Py5CL5mapM5flejyu6fNj0fmVP3zGjdTEf1Yg0Fs6hQn8CWSmFUQuAW9g9cL2S52nV+8as6mgJTvICTSlGflTI0r3lZOcm9550WdOVo4PDxRz0lvRrSpJ0fE2owogYYigIyRydOJ6CXisT0WsaJ1txPdJjRcA7uY5/LT2fFP2CaBRoC54IvwnXMiUNKhstEli4Fzr/dhzC0qXJmWaxKbEUvXlSEXDJ7eVNTEWcVfrW2B7XY7OKl1bWt6iDtJdV7G/jb/RxmGsAtBxaPw+dpEEwlZaalVlSgUB+bUTekLnqAazbc0d7EHIMiyW5iKIOaekwRUPE4S+aCv8mBDGE19os2LFsss9Xhx2qoZDhBB765LWkTNyLbduAjYjMCkaHJm+poQjCeiJOX43W7+r2vuSeJ6UZ7Za/WMUWnbqmxt9KdXO0jUCu//6zR2Zmc2YMb0jGk3CXmsUsF6tk2eGrPBN7KXlxmqgvOrY0BpQw93ckCdgambpBTTdH9WptT9/8Mg1le+DCHPlLltVnKF2v9AwIv8rxBRlF3HYQDrJNS3ECUeoSSGXJbrzDs1xS/Al85hSEAaPoY274SEB0pNmqFABztVvmGZrm0Oj/tBF1EB8mJYNsPegcpLIzH6SrYjZco/0OJZTabWlggEgJ+BW5LnMymdYBoyVcOvRsgCW02NGivHwv7gEtqzqq6v6tL5d9XIGjCq4NCN+jA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecd10e7-e139-4959-7ea9-08d886b808ff
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 03:07:05.8619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Et0O32gM6yjIVP5H1Xx2yWmxHuVET4O/JR/gCfM5kGvlWR3cI0TrLzhRuADW9BwyL7ykMGlW4ThnouixDO6Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
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
index e46faac1fe71..1d9a16388fa8 100644
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
+			status = "disabled";
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
+			status = "disabled";
+		};
+	};
 };
-- 
2.17.1

