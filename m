Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714482A36BD
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 23:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgKBWmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 17:42:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42356 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgKBWmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 17:42:15 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0356FD1;
        Mon,  2 Nov 2020 23:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604356924;
        bh=dTlhXG+9yHH8WP+v9tvsn2+wtF6rBscX5uLjXNB7GUc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ooWJZ2r6YGlRY22CaZ4fF4IzDCNfbJvycWXjr422bL6in11s36qF863bbP7dhMEMH
         dBnbWQWRtIS6+yyeBfPeOMM94Z0sD10mKrfaeZahXeXyyt4djZ9ZM6QJs143Hb2pin
         AigZ4EBG9gM99r8AaKpOgseK2sXAV1GQ1Jy3S1+g=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2 18/19] media: v4l2: Add 10- and 12-bpc luma-only formats with linear packing
Date:   Tue,  3 Nov 2020 00:41:01 +0200
Message-Id: <20201102224102.30292-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add two new formats storing luma only in 10- and 12-bpc variants, with
linear packing. They are used by the Xilinx Video Frame Buffer
Read/Write IP cores.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/pixfmt-yuv-luma.rst             | 23 +++++++++++++++++++
 include/uapi/linux/videodev2.h                |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index ba8cd895cb0b..7c65d58d9e25 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -17,6 +17,7 @@ are often referred to as greyscale formats.
    - Y'\ :sub:`x`\ [9:2] denotes bits 9 to 2 of the Y' value for pixel at colum
      `x`.
    - `0` denotes padding bits set to 0.
+   - `-` denotes padding bits with undefined values.
 
 
 .. flat-table:: Luma-Only Image Formats
@@ -75,6 +76,17 @@ are often referred to as greyscale formats.
       - Y'\ :sub:`3`\ [9:2]
       - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
 
+    * .. _V4L2-PIX-FMT-Y10X:
+
+      - ``V4L2_PIX_FMT_Y10X``
+      - 'Y10X'
+
+      - Y'\ :sub:`0`\ [7:0]
+      - Y'\ :sub:`1`\ [5:0] Y'\ :sub:`0`\ [9:8]
+      - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
+      - `- -` Y'\ :sub:`2`\ [9:4]
+      - ...
+
     * .. _V4L2-PIX-FMT-Y12:
 
       - ``V4L2_PIX_FMT_Y12``
@@ -86,6 +98,17 @@ are often referred to as greyscale formats.
       - ...
       - ...
 
+    * .. _V4L2-PIX-FMT-Y12X:
+
+      - ``V4L2_PIX_FMT_Y12X``
+      - 'Y12X'
+
+      - Y'\ :sub:`0`\ [7:0]
+      - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [11:8]
+      - Y'\ :sub:`1`\ [11:4]
+      - Y'\ :sub:`2`\ [7:0]
+      - `- - - -` Y'\ :sub:`2`\ [11:8]
+
     * .. _V4L2-PIX-FMT-Y14:
 
       - ``V4L2_PIX_FMT_Y14``
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5cdbd1a2fddb..cf9288d270c6 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -576,6 +576,8 @@ struct v4l2_pix_format {
 /* Grey bit-packed formats */
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
+#define V4L2_PIX_FMT_Y10X    v4l2_fourcc('Y', '1', '0', 'X') /* 10  Greyscale, 3 pixels in 4 bytes */
+#define V4L2_PIX_FMT_Y12X    v4l2_fourcc('Y', '1', '2', 'X') /* 12  Greyscale, 4 pixels in 5 bytes */
 
 /* Palette formats */
 #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
-- 
Regards,

Laurent Pinchart

