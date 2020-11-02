Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628F92A233F
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbgKBDKH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:07 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727665AbgKBDKH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDZ3FYmafDDXqkOWaWzYAATVW9Rj28pEMOXQXE6uuKYIMjfURMQJCMWmfS8m5TbhHfSH4IdU1tL5+4eJJCv7dZ7XuMjoKL+3Kiy1GvTSisfjslqYn4IhLDLXz24IcLhyS6ylX56X1OMC+wPnmCxr+7NUDMgHC4vr43QwVL0wEEeB9UbHGDhJ9WTwk3prXG57ZX2eYJ/cC4yGfZ84skifUaifWlvoxAhir7DpWvy9nE21PjQmhb5w8Sn6VQrTcn/ytNE3EUW9kMJuj346IU2DXRGQBLxxAGOlPRcvzTtIjO2VKeap8qa6BS1TZBVVii++F7eu2sFgaSy9d8jYiEfwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yculCX1O5ZeLJM27uptsnXKwzXqedQMwTZir3weqeCA=;
 b=Cy9xnOhtSpe9/8V07riVHniqLau4kPwbabcNeiju3NS4BsH5ptcf5Lh+jJFkeqIFuG7CEoApJ/b9i8J81xdoX1whOuJ+EFNTJO5VWUTGBGOPx+jEo3UqhCgkldBQxjl0cs0rTswhp9jL5SWgY4Bz8KkrkQUNHL9YON0xBsR+36O5bHW2eAMoY7DX3TY1Y8uUraAAobo+3UP03JNlot6fW1xNsn7ORzVVz9QkV0/sZFXcMSHsGvmgLtp0VetXBvSNZ/Fr4CvhcQ8fGomdkadoPoQKsgeaqSlTJDKXVVETzyeaILOzSJDBUTiKnjV0e9dJkXYH0wgLi8WlSw4O/kDEgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yculCX1O5ZeLJM27uptsnXKwzXqedQMwTZir3weqeCA=;
 b=mxbeIpEQRUEiQ+YKWTET8NpxU1h7LHdbCWKe5XObS7cTUidYKYMVDfDxURBy9ZRYu2/inETNlVwMW/BpX4/slhjzPDxg/fzmoiH1VcVcIZdDPHFSK3b8kiMKpTYoVBkmWeH9hdYsw7PVU6k+krDcaWX9uhsy4fOkKkb4DOFrWbk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:09:58 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:09:58 +0000
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
Subject: [PATCH v4 01/11] media: v4l: Add packed YUV444 24bpp pixel format
Date:   Mon,  2 Nov 2020 05:08:11 +0200
Message-Id: <20201102030821.3049-2-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:09:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e530143-a58d-4543-c7ac-08d87edcc782
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB51734C399A99454703E94985CE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hYGJ2zLUP40C6lpTqprQWRg9ps+13kUETfL9oEN8GNw5CmVu9iHyrYnuQHqhn0qNu0uTnoPi7K5Gxbw3kbb9weP9C6MyAgcqEfOJp4amlqbShOkAPwhKw8kN70D1Ra3eQTUF3XrywtUT8r45QfReGJ584cO9wGhanltVcn6EKrR7kqQMjopeCJ+hmnyqh6sjhVNgl+T+Z8QF+b48Eq2AZTZXaL0TW6UT6k3Biivj53S5rullu28vNsQVooklQzEKk7yfGesqHGOEytplrKWyshbJgN7WQCZCWjjiutn5aj5X4Lo2I9c68ynUW42GBNjjAWlg/xkCMEkqTs+B1QbUOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(86362001)(16526019)(186003)(8936002)(83380400001)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(19627235002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: J8oHNiU2nt0KsGjTETGEgJ9xvb66rozORNpjt7m6x8M18ARw6Y+wLPBW15g6oxW4Bsugc5pwlaGpZCaYWVL/3yEZpF21nSFJqZJsJVsahTY5YVnamMwDuqMZ4GbmycCXW1R3EtAHD0+PgZuAwgmxXw3ItCBrlAZ+zKXQ2Mrrp7BTKVjCDrc9epcXI+YtddO4FTMvaoQp7NyjPxyWTJKXFtbKMedhvkP0sjLfcDvOLMkTBflGBkZ9256If3DIyFa2SyX79QSa38YQZpxn36mmeD6vmE241otwY/OQHSJHqT416C9BE3E5JxltTyS2wTRPfejRwnjoT843n09thVRxSJr3E6OnKfkoqkemsuo7GAJeaIG9zlDagCr1k6leCNfcAwI7A2C/z3I6N9SVxjif/lSIByS3Ms4maBhf7nzNIBb/uwAXIpX5sYqALStx9Lnb1GK9bruupvFzPJcn0vqiE3KlyXs+PtMHzG4W8C5h9LaGfx00WUdCKcval0kiSpISfu/yNlM9IFCG80XmlFfgzzRl7rC5ZPWHzLWVmiWX/rDCme3Y8/gkcKJBZf/RLQxpFhwolyAr/VNe8/kYPuIFOIoMv4jOTWTx1VPmVHz5JhHj6PV2tFJYOLd+780qmIcfp4HSqdryrsP2W2rq3JsJcw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e530143-a58d-4543-c7ac-08d87edcc782
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:09:58.0065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udhgsOQPr5IBEGg+WMIkcsCwYaA/fDpwm7MwaxW7mZ553HS8k5Zd1xVTt9tPQ8NGdHgPvPkPImJNVuSGBtyz3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

The added format is V4L2_PIX_FMT_YUV24, this is a packed
YUV 4:4:4 format, with 8 bits for each component, 24 bits
per sample.

This format is used by the i.MX 8QuadMax and i.MX 8DualXPlus/8QuadXPlus
JPEG encoder/decoder.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 .../media/v4l/pixfmt-packed-yuv.rst           | 37 ++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  1 +
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index 84262208dd1c..7b340bf5695d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -10,7 +10,8 @@ Description
 ===========
 
 Similar to the packed RGB formats these formats store the Y, Cb and Cr
-component of each pixel in one 16 or 32 bit word.
+component of each pixel next to each other in memory. They occupy 16, 24 or 32
+bits per pixel.
 
 
 .. raw:: latex
@@ -150,6 +151,40 @@ component of each pixel in one 16 or 32 bit word.
 
       -  :cspan:`15`
 
+    * .. _V4L2-PIX-FMT-YUV24:
+
+      - ``V4L2_PIX_FMT_YUV24``
+      - 'YUV3'
+
+      - Y'\ :sub:`7`
+      - Y'\ :sub:`6`
+      - Y'\ :sub:`5`
+      - Y'\ :sub:`4`
+      - Y'\ :sub:`3`
+      - Y'\ :sub:`2`
+      - Y'\ :sub:`1`
+      - Y'\ :sub:`0`
+
+      - Cb\ :sub:`7`
+      - Cb\ :sub:`6`
+      - Cb\ :sub:`5`
+      - Cb\ :sub:`4`
+      - Cb\ :sub:`3`
+      - Cb\ :sub:`2`
+      - Cb\ :sub:`1`
+      - Cb\ :sub:`0`
+
+      - Cr\ :sub:`7`
+      - Cr\ :sub:`6`
+      - Cr\ :sub:`5`
+      - Cr\ :sub:`4`
+      - Cr\ :sub:`3`
+      - Cr\ :sub:`2`
+      - Cr\ :sub:`1`
+      - Cr\ :sub:`0`
+
+      -  :cspan:`7`
+
     * .. _V4L2-PIX-FMT-YUV32:
 
       - ``V4L2_PIX_FMT_YUV32``
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index eeff398fbdcc..579350b25206 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1303,6 +1303,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
 	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
 	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
+	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
 	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
 	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
 	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 534eaa4d39bc..5ea4917cb81f 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -592,6 +592,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_YUV444  v4l2_fourcc('Y', '4', '4', '4') /* 16  xxxxyyyy uuuuvvvv */
 #define V4L2_PIX_FMT_YUV555  v4l2_fourcc('Y', 'U', 'V', 'O') /* 16  YUV-5-5-5     */
 #define V4L2_PIX_FMT_YUV565  v4l2_fourcc('Y', 'U', 'V', 'P') /* 16  YUV-5-6-5     */
+#define V4L2_PIX_FMT_YUV24   v4l2_fourcc('Y', 'U', 'V', '3') /* 24  YUV-8-8-8     */
 #define V4L2_PIX_FMT_YUV32   v4l2_fourcc('Y', 'U', 'V', '4') /* 32  YUV-8-8-8-8   */
 #define V4L2_PIX_FMT_AYUV32  v4l2_fourcc('A', 'Y', 'U', 'V') /* 32  AYUV-8-8-8-8  */
 #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
-- 
2.17.1

