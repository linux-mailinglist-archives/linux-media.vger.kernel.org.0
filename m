Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB15570E82
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 02:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiGLADa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 20:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiGLAD2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 20:03:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633522CE09
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 17:03:26 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2C41739;
        Tue, 12 Jul 2022 02:03:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657584204;
        bh=bYP4QImqWYQaoz13+NhX5EENxmeFn8JuurdBUX48Y/Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MuN0+mZbMGJOTwC/U4lA24kToL0Xx/xmXETXjI/ymq1j/AXeT3NABhbDiuU4pdXBn
         mcz7Qo4k6IlVljKVyJ4I6ZsDFu2ekv1g74lL5kbMMquoEzxyTUoX4708o7LOR4AxzV
         YYHJ1rNiUu1Bptxcu8GbTj9ww2WtFp7YXFUSaDAY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH v2 1/7] media: v4l: Add packed YUV 4:4:4 YUVA and YUVX pixel formats
Date:   Tue, 12 Jul 2022 03:02:45 +0300
Message-Id: <20220712000251.13607-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The new YUVA and YUVX are permutations of the existing AYUV and XYUV
formats. They are use by the NXP i.MX8 ISI hardware.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/pixfmt-packed-yuv.rst           | 20 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
 include/uapi/linux/videodev2.h                |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index 65520c3af7cf..bf283a1b5581 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -220,6 +220,26 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
       - Y'\ :sub:`7-0`
       - X\ :sub:`7-0`
 
+    * .. _V4L2-PIX-FMT-YUVA32:
+
+      - ``V4L2_PIX_FMT_YUVA32``
+      - 'YUVA'
+
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Cr\ :sub:`7-0`
+      - A\ :sub:`7-0`
+
+    * .. _V4L2-PIX-FMT-YUVX32:
+
+      - ``V4L2_PIX_FMT_YUVX32``
+      - 'YUVX'
+
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Cr\ :sub:`7-0`
+      - X\ :sub:`7-0`
+
     * .. _V4L2-PIX-FMT-YUV24:
 
       - ``V4L2_PIX_FMT_YUV24``
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index f42f7ffcc247..18ed2227255a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1297,6 +1297,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
 	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
 	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
+	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
+	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
 	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
 	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
 	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 343b95107fce..f6f9a690971e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -593,6 +593,8 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
 #define V4L2_PIX_FMT_VUYA32  v4l2_fourcc('V', 'U', 'Y', 'A') /* 32  VUYA-8-8-8-8  */
 #define V4L2_PIX_FMT_VUYX32  v4l2_fourcc('V', 'U', 'Y', 'X') /* 32  VUYX-8-8-8-8  */
+#define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
+#define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
 #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
 
 /* two planes -- one Y, one Cr + Cb interleaved  */
-- 
Regards,

Laurent Pinchart

