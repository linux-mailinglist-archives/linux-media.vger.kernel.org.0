Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8E82AFF4E
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgKLFcG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:06 -0500
Received: from mail-vi1eur05on2044.outbound.protection.outlook.com ([40.107.21.44]:36416
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728045AbgKLDHM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 22:07:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4Rt1jtOL8PF69v4pFoHJciNNLFX4zTOITCQFuntVhCPn/aJ+8O82r3J6UtOWyUnUx5UNwTC79wcsI5IetooXEEOHLToHTlAa4QkBWOAFvimLqaRodBgeznjvmAk3EGGEgbhnAznt7Bz8iPQMskRNYvFRFWbvmfqO4wQpsmxajtWHx2xi/LyIm+0cXWYRIhCW9ZIPkGY1F1tc/bUsA9DWSreBonliRHfl1x/0skymGE6bd94VztKS3vFP9+Nv6FNl7Y2Htk2dzibTXu9pmb7ZHnU6MZ7o1kIo4kc28kXh5osnbm0zsI0dPeb9yiV0bYemsuEAg9DOlcTx5U+CKOLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRWB4puhvm9zyiAowDe9o9ScC4tdP7HzWUR+hadkfsM=;
 b=lQMPyR7cL12fW5zdCuZ+0d/9Z+81aUxqUZEEgWj3bn6NhvnBxZ4507/Gk5i2fSgFL456oI3hz4xby0ZdLxjXxaLkzvN2ksxRczCyS5UbfNwJVLUycZovzFLuSUaiDbRp33bVv1krRlLQCIjHIGgQxFJjMLD82h+WGa2nMgTrPvBvXcGJKKv1Xw0z9VuW9abw8DGqFrb7JGeWz0I9QXf0vi9mE5OlqnGwyY+jh+NmMPhtlKfu2qGXsSeY6j6Ah0eZFtHvpT6u/AqAa9JsIWN7BFyQwsiCQnE5ECUAEorbaVudOM7MqdZEasZdK1cyz78D2avAbsER51qmC8jSWiHNfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRWB4puhvm9zyiAowDe9o9ScC4tdP7HzWUR+hadkfsM=;
 b=VnFCB/RYdvMNKCiG/rqmZEPsMEfhMV3Ie3kFzREp9thdXKvrBm7zqbJvgejSEqRnw5+RzE545R5192vC9/7pEfi2K1qGStamFDE5Q/Acq9NMTxFqnIuUZYm1rFoZclQ0xjhs4HDuLGWoJnk/tqU00Scye2eBQEfjtFLAehIAQng=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 03:06:42 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 03:06:42 +0000
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
Subject: [PATCH v5 01/10] media: v4l: Add packed YUV444 24bpp pixel format
Date:   Thu, 12 Nov 2020 05:05:48 +0200
Message-Id: <20201112030557.8540-2-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.138) by AM0PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:208:fa::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 03:06:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9cea5af3-78b2-4586-ac7a-08d886b7fb10
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB699745A38964AB947A2456B7CEE70@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPDxS6We+NGeu64BgbLXQy9aoHZPYIbQTXiKEY7j4+HCjOQnRqmeO21TdzqrtpDtS98YMhU6D8fhmxmjL7+aW9O7EGLtuRps/ipGcMPFiivXDVsq21hzqfNDzFLUjGnchkOkqKh0O50UuDRBqbYgcGbHyfwloEWfnMhzc1CFXhu6uwN+rBZan6nAaPHxtZmM4eyn5bUODkWxQbZ3XSgOdRTYWSXFjHnMAHJeh3zq8saX3BkSlxuUKu89vOGrz8ZxrG9wX64+qucxXO13WoqOkc7amOF7kXlOcjkTVLR6YIuPGK9KUCpoPtqLvTnOM3u546FkoELM+XDPTHrCy82Ohg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(1076003)(316002)(26005)(478600001)(6506007)(4326008)(6512007)(66946007)(66476007)(186003)(6486002)(2906002)(66556008)(5660300002)(16526019)(8676002)(19627235002)(52116002)(86362001)(7416002)(8936002)(2616005)(956004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6mDE7ZVI4zmYV0gytrfe6UcghVp/PKqaD6zeUQqs2xiMTiSs7waWuhl+mpHRuaGRPuU2FUgHaNOM18B4eAic5L+pe4fmN5OaAKD7fr1p2IX9kUylP5xvVxU4eqWzhs7BGObALIiPxd6Uo1vO00vjAXS6bIj8ELHBph72yZn3/I3rQN6J8/ZSgvmkkxB8hRNbOzeRY5vhPvbaANNB9SN5vF0I4NChPAhpwksnw1wJyaJfnm6gDrIJQMYy+rwO8H4yA1E8RVVqTHbQXIjGVK7I0ItzF9j6GtNdxdl7KINC+ynDcO3zvdzPaIXdZmOGhe+WpQvZXZilnEsjOAtKb9LhkwQgMai6Wg0BLOapBycYJFtdP8pROg8FgT7dZ2IaHHDs52CHp/cm3LZ6DzWlm/bgq1Z/5kbOWCrnK0oKHwycYnVrRqT5bCDQf2Xyf89FfvdLW6pfs7+xd56XBaNmxgNZeRB2hE8DC5LBjEbzrbX67VIsSn1mN/bb12+lFY3NmRONAZEa2K1i3Msu6i96V8dl8qFUwKxczZ0lZPQtrWmaib48RXHqnBZIpfFs/sCI/zHQjvFgel6qh6iVmSV5kEmsLdq4j3Y3/YpeefNzKGtl/f5qUts3n/Sqlrmeg1/pZHx9kl9T3zJHAEjHMcTz7gQWH7xb2g2HwAjSZfGZTqOMUBvnWcCUtUobSEMYxs4iuKOa1hAz+VjpRwG7i3HqXY9FyBBV2BntkCa3/OrH2PXbBNFtY/Itg+U1s9XDm5fBOcl8UyY/ftKhsGLvC7cNMl/fOLtkRAyyYRPF0FIsB84gEb2zeu5VIY1gU7oZ1IoYPOBhsudkSXE2hhfyJTqUETLzl5OJwFhIalrVJfWHpHVov2n7FeT/rnzyM6PWyQuvL5rFtcLb80uLiez0WC2zFcCqnw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cea5af3-78b2-4586-ac7a-08d886b7fb10
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 03:06:42.4854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUnl3yUf6FzzhWn4oVDoRhK12MqMiXfAyCEYjhGud+YGw+ciSK/br6fas8g97jOcnBi7eJbTmd4uZoalB04F9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
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
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
Changes in v5:
Added <Reviewed-by>

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
index f0f6906a879d..366b76690432 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1304,6 +1304,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
 	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
 	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
+	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
 	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
 	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
 	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 927075fa9099..9973b5f76c76 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -590,6 +590,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_YUV444  v4l2_fourcc('Y', '4', '4', '4') /* 16  xxxxyyyy uuuuvvvv */
 #define V4L2_PIX_FMT_YUV555  v4l2_fourcc('Y', 'U', 'V', 'O') /* 16  YUV-5-5-5     */
 #define V4L2_PIX_FMT_YUV565  v4l2_fourcc('Y', 'U', 'V', 'P') /* 16  YUV-5-6-5     */
+#define V4L2_PIX_FMT_YUV24   v4l2_fourcc('Y', 'U', 'V', '3') /* 24  YUV-8-8-8     */
 #define V4L2_PIX_FMT_YUV32   v4l2_fourcc('Y', 'U', 'V', '4') /* 32  YUV-8-8-8-8   */
 #define V4L2_PIX_FMT_AYUV32  v4l2_fourcc('A', 'Y', 'U', 'V') /* 32  AYUV-8-8-8-8  */
 #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
-- 
2.17.1

