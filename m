Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3B9274F33
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgIWCob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbgIWCob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:31 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68D7F124E;
        Wed, 23 Sep 2020 04:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829060;
        bh=3r1BOoDtAXmhTQITTn6XUFBaY185rTwT6Jre5ZlZlUo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m2kYBhHdMDZKbFr8UAEIV3NMkfgRpdP483hUgjqCJysVbpXrj3edY787r6TfVcjsG
         kjWssBFKSTjy9kS/ke5cZ30nIMszkdvs0Z9ptotRGPXOxExzntT1WZkRWzeDqcZ+nF
         E+ObpZEOiBVqYvcNUZTTq7uIixGUNX4cb0Lz+8Gc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 16/16] media: v4l2: Add 10- and 12-bpc luma-only formats with linear packing
Date:   Wed, 23 Sep 2020 05:43:33 +0300
Message-Id: <20200923024333.920-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
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
index b24947b52cf8..3e2a7af5ed67 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -24,6 +24,7 @@ are often referred to as greyscale formats.
    - Y'\ :sub:`x`\ [9:2] denotes bits 9 to 2 of the Y' value for pixel at colum
      `x`.
    - `0` denotes padding bits set to 0.
+   - `-` denotes padding bits with undefined values.
 
 
 .. flat-table:: Luma-Only Image Formats
@@ -82,6 +83,17 @@ are often referred to as greyscale formats.
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
@@ -93,6 +105,17 @@ are often referred to as greyscale formats.
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
index 9b4cab651df7..3d137a020cdb 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -579,6 +579,8 @@ struct v4l2_pix_format {
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

