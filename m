Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54944D05E9
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 19:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244629AbiCGSE4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 13:04:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235995AbiCGSEz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 13:04:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C6C673E9
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 10:04:00 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B574051C;
        Mon,  7 Mar 2022 19:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646676239;
        bh=r0Hi3u0PmtzB4TSXEx+SAq/rLUJ1Qb0TlGigzgDCEvQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aK8wwC+EkzEQ3QSshadEjsQ/uoEg7kY0PVVRO4gmrh1jiXpgRcD/XlmlxwiLzq1Xw
         yDabpmFd8Kn8KnXYcqopNXfjz4v7WuEzvy9HvsXiXmrHyQZqjvYiMmktTgVjEr/2cy
         BINOgnPCaW9Ny8M+Inbtd94yUebgkCTb51a4qqZE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 1/3] media: v4l: Add packed YUV 4:4:4 YUVA and YUVX pixel formats
Date:   Mon,  7 Mar 2022 20:03:40 +0200
Message-Id: <20220307180342.10666-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
References: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
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
---
 .../media/v4l/pixfmt-packed-yuv.rst           | 20 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
 include/uapi/linux/videodev2.h                |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index 62bc2bb3f499..92394786251a 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -229,6 +229,26 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
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
index aeecaca3edba..ca3c7bd19d7e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1290,6 +1290,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
 	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
 	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
+	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
+	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
 	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
 	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
 	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index df8b9c486ba1..16dcd9dd1a50 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -592,6 +592,8 @@ struct v4l2_pix_format {
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

