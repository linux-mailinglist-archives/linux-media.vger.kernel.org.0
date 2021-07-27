Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F323D792D
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 16:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236860AbhG0O6I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 10:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbhG0O6H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 10:58:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DB3C061757
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 07:58:07 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 842F01F432BB
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 4/4] media: Clean V4L2_PIX_FMT_NV12MT documentation
Date:   Tue, 27 Jul 2021 11:57:45 -0300
Message-Id: <20210727145745.25203-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727145745.25203-1-ezequiel@collabora.com>
References: <20210727145745.25203-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add more information about V4L2_PIX_FMT_NV12MT and
V4L2_PIX_FMT_NV12M_16X16, so it's clearer for driver authors and users.

Also, group the two pixel formats with the other tiled formats,
for clarity.

Unlike the recently introduced tiled formats (V4L2_PIX_FMT_NV12_4L4, etc)
these formats have remained Samsung-specific until now. Therefore, and
although the NV12MT and NV12MT_16X16 nomenclatures are less clear, we are
keeping them as-is.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../media/v4l/pixfmt-yuv-planar.rst           | 25 ++++++++++---------
 include/uapi/linux/videodev2.h                |  6 +++--
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 0fc74351605a..3a09d93d405b 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -99,7 +99,7 @@ All components are stored with the same number of bits per component.
       - 4:2:0
       - Cb, Cr
       - No
-      - 64x32 macroblocks
+      - 64x32 tiles
 
         Horizontal Z order
     * - V4L2_PIX_FMT_NV12MT_16X16
@@ -108,7 +108,7 @@ All components are stored with the same number of bits per component.
       - 4:2:2
       - Cb, Cr
       - No
-      - 16x16 macroblocks
+      - 16x16 tiles
     * - V4L2_PIX_FMT_NV16
       - 'NV16'
       - 8
@@ -267,17 +267,18 @@ pixels and the same number of bytes as luma lines, and the chroma plane
 contains half the number of lines of the luma plane. Each tile follows the
 previous one linearly in memory (from left to right, top to bottom).
 
-``V4L2_PIX_FMT_NV12MT_16X16`` stores pixel in 2D 16x16 macroblocks, and stores
-macroblocks linearly in memory. The line stride and image height must be
-aligned to a multiple of 16. The layouts of the luma and chroma planes are
-identical.
+``V4L2_PIX_FMT_NV12MT_16X16`` is similar to ``V4L2_PIX_FMT_NV12M`` but stores
+pixels in 2D 16x16 tiles, and stores tiles linearly in memory.
+The line stride and image height must be aligned to a multiple of 16.
+The layouts of the luma and chroma planes are identical.
 
-``V4L2_PIX_FMT_NV12MT`` stores pixels in 2D 64x32 macroblocks, and stores 2x2
-groups of macroblocks in Z-order in memory, alternating Z and mirrored Z shapes
-horizontally.  The line stride must be a multiple of 128 pixels to ensure an
+``V4L2_PIX_FMT_NV12MT`` is similar to ``V4L2_PIX_FMT_NV12M`` but stores
+pixels in 2D 64x32 tiles, and stores 2x2 groups of tiles in
+Z-order in memory, alternating Z and mirrored Z shapes horizontally.
+The line stride must be a multiple of 128 pixels to ensure an
 integer number of Z shapes. The image height must be a multiple of 32 pixels.
-If the vertical resolution is an odd number of macroblocks, the last row of
-macroblocks is stored in linear order. The layouts of the luma and chroma
+If the vertical resolution is an odd number of tiles, the last row of
+tiles is stored in linear order. The layouts of the luma and chroma
 planes are identical.
 
 ``V4L2_PIX_FMT_NV12_4L4`` stores pixel in 4x4 tiles, and stores
@@ -309,7 +310,7 @@ identical.
     :alt:    nv12mt_example.svg
     :align:  center
 
-    Example V4L2_PIX_FMT_NV12MT memory layout of macroblocks
+    Example V4L2_PIX_FMT_NV12MT memory layout of tiles
 
 
 .. _V4L2-PIX-FMT-NV16:
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5cf71d3aa0a4..80e14d93f59b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -607,8 +607,6 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV21M   v4l2_fourcc('N', 'M', '2', '1') /* 21  Y/CrCb 4:2:0  */
 #define V4L2_PIX_FMT_NV16M   v4l2_fourcc('N', 'M', '1', '6') /* 16  Y/CbCr 4:2:2  */
 #define V4L2_PIX_FMT_NV61M   v4l2_fourcc('N', 'M', '6', '1') /* 16  Y/CrCb 4:2:2  */
-#define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 64x32 macroblocks */
-#define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 macroblocks */
 
 /* three planes - Y Cb, Cr */
 #define V4L2_PIX_FMT_YUV410  v4l2_fourcc('Y', 'U', 'V', '9') /*  9  YUV 4:1:0     */
@@ -631,6 +629,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12_16L16 v4l2_fourcc('H', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12_32L32 v4l2_fourcc('S', 'T', '1', '2') /* 12  Y/CbCr 4:2:0 32x32 tiles */
 
+/* Tiled YUV formats, non contiguous planes */
+#define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 64x32 tiles */
+#define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
+
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
 #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG.. */
-- 
2.32.0

