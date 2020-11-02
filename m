Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21D62A36BA
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 23:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgKBWmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 17:42:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42350 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgKBWmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 17:42:14 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9ECC721F5;
        Mon,  2 Nov 2020 23:42:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604356923;
        bh=s7RVCjRt1www5u0dP9VDmF/M/VTa+FPgw5pzNdggikE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TJDvLqwNctBLGNhGaooTRzy7Zofc9pZNL22Fa1MYNgGTwlqK2zoRVGaZ28qbn9754
         6KUwAE1aWtnuQOUt1oQ2JlUN0Cgo3KYQha/u992uWzRTQ2ztHMRyJLVefV97SR4u50
         dssDUKospmc0xCxQ6E3D/x3az/T4ERmjR6JgIbUE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2 16/19] media: v4l2: Add a few missing packed YUV 4:4:4 formats
Date:   Tue,  3 Nov 2020 00:40:59 +0200
Message-Id: <20201102224102.30292-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add three new formats belonging to the packed YUV 4:4:4 family. They are
used by the Xilinx Video Frame Buffer Read/Write IP cores.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/pixfmt-packed-yuv.rst           | 29 +++++++++++++++++++
 include/uapi/linux/videodev2.h                |  3 ++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index 8f0f1405bfe3..6824898122aa 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -170,6 +170,15 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
       - Byte 2
       - Byte 3
 
+    * .. _V4L2-PIX-FMT-YUV24:
+
+      - ``V4L2_PIX_FMT_YUV24``
+      - 'YUV3'
+
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Cr\ :sub:`7-0`
+
     * .. _V4L2-PIX-FMT-YUV32:
 
       - ``V4L2_PIX_FMT_YUV32``
@@ -220,6 +229,26 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
       - Y'\ :sub:`7-0`
       - `-`\ :sub:`7-0`
 
+    * .. _V4L2-PIX-FMT-YUVA32:
+
+      - ``V4L2_PIX_FMT_YUVA32``
+      - 'YUVA'
+
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Cr\ :sub:`7-0`
+      - `-`\ :sub:`7-0`
+
+    * .. _V4L2-PIX-FMT-YUVX32:
+
+      - ``V4L2_PIX_FMT_YUVX32``
+      - 'YUVX'
+
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Cr\ :sub:`7-0`
+      - `-`\ :sub:`7-0`
+
 .. note::
 
     - The alpha component is expected to contain a meaningful value that can be
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index fab1dbb1a618..afe3619bc77c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -593,11 +593,14 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_YUV444  v4l2_fourcc('Y', '4', '4', '4') /* 16  xxxxyyyy uuuuvvvv */
 #define V4L2_PIX_FMT_YUV555  v4l2_fourcc('Y', 'U', 'V', 'O') /* 16  YUV-5-5-5     */
 #define V4L2_PIX_FMT_YUV565  v4l2_fourcc('Y', 'U', 'V', 'P') /* 16  YUV-5-6-5     */
+#define V4L2_PIX_FMT_YUV24   v4l2_fourcc('Y', 'U', 'V', '3') /* 24  YUV-8-8-8     */
 #define V4L2_PIX_FMT_YUV32   v4l2_fourcc('Y', 'U', 'V', '4') /* 32  YUV-8-8-8-8   */
 #define V4L2_PIX_FMT_AYUV32  v4l2_fourcc('A', 'Y', 'U', 'V') /* 32  AYUV-8-8-8-8  */
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

