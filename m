Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1E611E33C
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 13:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfLMMHB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 07:07:01 -0500
Received: from inva021.nxp.com ([92.121.34.21]:39872 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726717AbfLMMHB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 07:07:01 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9C241200761;
        Fri, 13 Dec 2019 13:06:58 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 80094200151;
        Fri, 13 Dec 2019 13:06:58 +0100 (CET)
Received: from fsr-ub1664-134.ea.freescale.net (fsr-ub1664-134.ea.freescale.net [10.171.74.111])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B12E5203B1;
        Fri, 13 Dec 2019 13:06:57 +0100 (CET)
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v3 1/6] media: v4l: Add packed YUV444 24bpp pixel format
Date:   Fri, 13 Dec 2019 14:06:16 +0200
Message-Id: <1576238781-5911-2-git-send-email-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576238781-5911-1-git-send-email-mirela.rabulea@nxp.com>
References: <1576238781-5911-1-git-send-email-mirela.rabulea@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The added format is V4L2_PIX_FMT_YUV24, this is a packed
YUV 4:4:4 format, with 8 bits for each component, 24 bits
per sample.

This format is used by the i.MX 8QuadMax and i.MX 8DualXPlus/8QuadXPlus
JPEG encoder/decoder.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst | 37 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst b/Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst
index 41b60fa..5750ff6 100644
--- a/Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst
@@ -17,7 +17,8 @@ Description
 ===========
 
 Similar to the packed RGB formats these formats store the Y, Cb and Cr
-component of each pixel in one 16 or 32 bit word.
+component of each pixel next to each other in memory. They occupy 16, 24 or 32
+bits per pixel.
 
 
 .. raw:: latex
@@ -157,6 +158,40 @@ component of each pixel in one 16 or 32 bit word.
 
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
index 003b742..182eabe 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1246,6 +1246,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
 	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
 	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
+	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
 	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
 	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
 	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 04481c7..cb52044 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -588,6 +588,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_YUV444  v4l2_fourcc('Y', '4', '4', '4') /* 16  xxxxyyyy uuuuvvvv */
 #define V4L2_PIX_FMT_YUV555  v4l2_fourcc('Y', 'U', 'V', 'O') /* 16  YUV-5-5-5     */
 #define V4L2_PIX_FMT_YUV565  v4l2_fourcc('Y', 'U', 'V', 'P') /* 16  YUV-5-6-5     */
+#define V4L2_PIX_FMT_YUV24   v4l2_fourcc('Y', 'U', 'V', '3') /* 24  YUV-8-8-8     */
 #define V4L2_PIX_FMT_YUV32   v4l2_fourcc('Y', 'U', 'V', '4') /* 32  YUV-8-8-8-8   */
 #define V4L2_PIX_FMT_AYUV32  v4l2_fourcc('A', 'Y', 'U', 'V') /* 32  AYUV-8-8-8-8  */
 #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
-- 
2.7.4

