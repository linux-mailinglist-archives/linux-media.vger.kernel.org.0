Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BE33368BA
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 01:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhCKAbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 19:31:22 -0500
Received: from mail-eopbgr140054.outbound.protection.outlook.com ([40.107.14.54]:57152
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229570AbhCKAax (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 19:30:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aj78aYKeuYdv2s+3DNKu7s4GMcW8GX3RWhFSbEU+IxwWG2VElxauLPRN1RF0cCqwI+AnxbatpuTCNp8BGVCVLFL861BKpNb4+s9xf+Vl7eQFrQDqg30TZtyrrzOELL5ybubRwRVaaLTEZIA+AFGPf35kzJRuLeYO+V0i+RrcK7oBdglq/hS4K32GMbP4WSbtXhUuRRbqYmdQ/EGbq3ryNcITIdk72YmMfXyb1mkBtsyNPoK53wic+0/AN3wK+UtzxFIzvSn2qW1r1Vs/dmMsY3mMh97FbfeOttw+maWEWYsRp28t/CPXEnVH3KR6FwD92PgydWspfwjLNgdg/yfUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMD7/78RfCIKYkFuMkBo9eHp2V6BZSkIQ1tET1aYVAg=;
 b=TBKF7n3T+HcpmKnjFXeywuFqQpqQ6gTdh0PhCpu13sfjI/SFDbgHSHAqfqZPGIVjWu1uhxbO9fKLUcrv1oSPKfgJks50gl0ER5x5oV+lMdqlR5xGq90mRPU40QygOtat//sB1P2JoP1DYznrY5wAnjTJwtrO7oBm+kuvr1rYFBjc1s/SjNJqKU1dA2cOX8QP8T30DHIlDp7b1Ig30IYD7RBRf0/RqdvYowVb8zfmquEp8zD9LXL83u7ZiJk3CHxp2xBx6aK0sdXQCwxRvx9K5dImC5OyI6H0DV1787Xk7kNwhOvBK/39HTD1+bC1VyOmqu6VvGFtZTvPYYtOeqoRdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMD7/78RfCIKYkFuMkBo9eHp2V6BZSkIQ1tET1aYVAg=;
 b=lCrzPeFAGHGDNaiUVsgoUX2VRN/A5FFEq9JWz1CPDSO/Y+QFsGYTEShXpAYGXeSU5bDzi6OxnLottM3zv4yHuRYQQ+j6Ltvb9IP0IN6mEcSf+5FaIKRMt85PalpU9dQmd9nm0YNP7jaCHz8NEV0jUo0JWxOrSoR8zDrGwFMXzcc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4984.eurprd04.prod.outlook.com (2603:10a6:20b:7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 11 Mar
 2021 00:30:49 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3912.029; Thu, 11 Mar 2021
 00:30:49 +0000
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
Subject: [PATCH v9 7/8] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Date:   Thu, 11 Mar 2021 02:28:53 +0200
Message-Id: <20210311002854.13687-8-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
References: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 00:30:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d63d3cb9-42c8-4b92-068a-08d8e424eb73
X-MS-TrafficTypeDiagnostic: AM6PR04MB4984:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB49843DA1725E0A7FF5AF0869CE909@AM6PR04MB4984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nA9a1hfw6y3Fi5n2DkLBwPSChyb0uSj8/McbdTpFNOcVu4plHJ0/8Vr6dHoaMGKxPW+nISQZeadcQADewXg21rqP2ikMYxZmCs53+IF/wOvyTPvQdj21o+qYz5KpGFNkQOZrJqKrvV0mOJ0hN3Lt37R554NP/ZuPPn8oWqCcJi3xTVuv9Z7ktUJGF+9BNj9/glLjm9Dydz1y8U6VaAJNgX8P4jiBJjK1dHRLX5wOVWjUlPmvBXnaDIHeACIa6AKiKv+XOpl7LqN2m7GrPgKVGfBEPzcMTbxoz/Cko9piXvIcY+MzgEYS4DUcJLdjkodnwa4RWfHHD8UpvnpKWpFGUYx773h3Ls2Z3pr/fwBNwXLAUESMnJjJjYBX4eZOY4eM6YX1eKwyLQVtJ1Ly+GXHIirmpnsymxkjDx88cdnZO4veH+cGvG1N8riVeyxTblEe86fo5bu81vUnljuvkslcBEbQRF8EpgdhVEEigK9VXsFGmZlQ05ZJ6ag2vVkpBuKTOtH00v+82+rsrWH4SVljeEobckBuemi0fIc2JRR6QzYtFnCvo0QxbyaDoUaFA383
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39850400004)(66476007)(66946007)(4326008)(2906002)(5660300002)(7416002)(16526019)(26005)(52116002)(186003)(66556008)(6666004)(316002)(478600001)(1076003)(6512007)(6486002)(6506007)(8936002)(8676002)(86362001)(2616005)(956004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+zeASdEdPHA0RkLapyToQ2x5yxlrxZ1oR/S3v4tGqZDdkv6EZx3aV8VZn/vp?=
 =?us-ascii?Q?sDKU1dmMstSwbfS+XBPrCfxP9A0KtmSUbhMS+6JQ5IE9m1Xe35OZpJbnwFhs?=
 =?us-ascii?Q?/BOsuFyW8a1o9W26gxMTYAA7Lc3GyNn4OR2OLKJ6QZauq/llbmyrtjewVw8c?=
 =?us-ascii?Q?Gf3ktAiPEaBVmk7f7G1OTngEOqg9CJs0ruVqfl4gj30GWv6Uk9I4durxNL6P?=
 =?us-ascii?Q?kSsZ0xKYLEEJz3J+/J8NSN0Zd5bp0ltr/3Tx0KZfxQiJQCmsQdDgNuN48Ewv?=
 =?us-ascii?Q?o9BIfi0Cj0bE5NUrjuv5SjUriRlz4v7JuSXlLbqQKE5DfmRoplcwUfo4ffRU?=
 =?us-ascii?Q?tg23+6A+IxZQFpgZI4pqAvdTUxTXgP6yfxfpmKSblK5CaHdB12nQEvnJAYkm?=
 =?us-ascii?Q?efeOHcMADaSFf0pibe4AsJ8oNNI3o64MXr+UcEIanz/eeiaPjGeIHl0bVNH6?=
 =?us-ascii?Q?XrdVDeJ9MiXn2NEafyhTZMM33esv1KUN+UqssgFrVt2RUGFNJy0mHeN2pHnr?=
 =?us-ascii?Q?oXfAjHgfxnoSR+41biVBrG3y7u9jhsrEavU2e8qXKA8SIPFHx/HKh+B5zRQQ?=
 =?us-ascii?Q?361l7hMRK0Zk17hw02f/dETf3ejindYwEuhu4xv9RblI+DWBOz9vnkD1uvu9?=
 =?us-ascii?Q?E/ElnZgszbPcngjMjGe9ngfzPzjXVUKiMZEcibf2hrCwmkUt8b1p5Ie7PnL1?=
 =?us-ascii?Q?2cnMBGRnKyeIOgc3wzNrrU5BgimzKPUR6CtwtOMjW3dp0fHZZkRrR/83NlxG?=
 =?us-ascii?Q?u9pDFoc//bZkSuHcXauMkeOGJdPL32cemAYHm+ZgH/x6eQ72Rge3s7SguvEy?=
 =?us-ascii?Q?phQvT0y0mykSL2Io7WLZbfjwoAI4myjd2wFwswsDLpJTnXvBucz0EqjZ5HZy?=
 =?us-ascii?Q?7JBgBlQbIGWsk2GqfbJF5e3LaDuDY5wZuGD36zK6XcUUded5WEVP18G0juWv?=
 =?us-ascii?Q?ac1HRa4KsnSryCcICW53QKTxrgWkyGiclHLZOezqxpKOp56jXIYuyyNIIVc8?=
 =?us-ascii?Q?UuaLtk3Padppfpon4A7oKlhUt7So6Ht+SoU7/SDkVTQasBCRaisi6Ow30RuK?=
 =?us-ascii?Q?z0BFYtT1ygcfR9ECSlOVAFzg5j7MTxLpYc4z8tBzbEyE+jDWykoTH2a/XFxo?=
 =?us-ascii?Q?N9v6lKd9MaJDRCSvghFqomEU43nIaFmC/yjdYOvKOGySxWD9UBhylVHXWVV/?=
 =?us-ascii?Q?3/Yqzv3tQj6tdqXCEalRKql+zhktxH+eyJDWFnPJkuO8zf7MeMkcTSnX+buV?=
 =?us-ascii?Q?52ObAritMLNRebHnGPM+H97TIvj0EXMd7z/NhA7h/A+dHvBrSPfO75JNXPNF?=
 =?us-ascii?Q?TjXYOyTPxYyf6GNkTmnKz1o6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63d3cb9-42c8-4b92-068a-08d8e424eb73
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 00:30:49.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPVFZf5YhDWfJmVw/QbQQk720+kbAi1WwRVjrvb/Qf1Bj/E4J85DTqFBjyXPY6TDi1OKbL7nqciB8HOd6Hc/ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4984
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
index 1d522de7b017..4f2b3edd7850 100644
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

