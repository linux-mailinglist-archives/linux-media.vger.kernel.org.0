Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FBB274F2F
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbgIWCo2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbgIWCo2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:28 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EAD11226;
        Wed, 23 Sep 2020 04:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829058;
        bh=es5EfkpA8Q5soAv5SWi0zPj6sl0cQYz2LmYUfv2KQhc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lyQIVCYUJku/mJlW7JqACLGj/rADBJNueqLR2cWzpAcyorNl7ngA/EQReevg5Iy1G
         xJhKxQLj7cW+bx4aYid2j3jysS0UjEeJXJ/dUfVj/qlwES4sgzV9T0VcGAo/vvlZ4Y
         J4sgXWqzQP5CjaKt+7+LRkPTYfKaSRjfn86ACVeE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 13/16] media: v4l2: Add 10-, 12- and 16-bpc BGR formats
Date:   Wed, 23 Sep 2020 05:43:30 +0300
Message-Id: <20200923024333.920-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add three new pixel formats that store RGB data in BGR order with 10, 12
and 16 bits per component. They are used by the Xilinx Video Frame
Buffer Read/Write IP cores.

The nomenclature for these new formats follows the 8- and 16-bpp RGB
formats and the DRM format naming conventions, which differs from the
24- and 32-bpp RGB formats in V4L2.

As the number of bits per pixel grows quite large, a table with one
column per bit would be difficult to read. These formats are thus
described with one column per byte.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 68 +++++++++++++++++++
 include/uapi/linux/videodev2.h                |  5 ++
 2 files changed, 73 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index 32bfd68af425..2e81d448177e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -1087,6 +1087,74 @@ order of components as seen in a 24- or 32-bit little endian word.
     \endgroup
 
 
+More Than 8 Bits Per Component
+==============================
+
+These formats store an RGB triplet in four bytes or more. Similarly to the 8-
+and 16-bpp formats, they are named based on the order of the RGB components as
+seen in a word, which is then stored in memory in little endian byte order, and
+on the number of bits for each component.
+
+.. raw:: latex
+
+    \begingroup
+    \tiny
+    \setlength{\tabcolsep}{2pt}
+
+.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|
+
+
+.. flat-table:: RGB Formats With More Than 8 Bits Per Component
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      - Byte 0 in memory
+      - Byte 1
+      - Byte 2
+      - Byte 3
+      - Byte 4
+      - Byte 5
+    * .. _V4L2-PIX-FMT-XBGR2101010:
+
+      - ``V4L2_PIX_FMT_XBGR2101010``
+      - 'XB30'
+
+      - R\ :sub:`7-0`
+      - G\ :sub:`5-0` R\ :sub:`9-8`
+      - B\ :sub:`3-0` G\ :sub:`9-6`
+      - `-`\ :sub:`1-0` B\ :sub:`9-4`
+
+      -
+    * .. _V4L2-PIX-FMT-XBGR4121212:
+
+      - ``V4L2_PIX_FMT_XBGR4121212``
+      - 'XB36'
+
+      - R\ :sub:`7-0`
+      - G\ :sub:`3-0` R\ :sub:`11-8`
+      - G\ :sub:`11-4`
+      - B\ :sub:`7-0`
+      - `-`\ :sub:`3-0` B\ :sub:`11-8`
+
+      -
+    * .. _V4L2-PIX-FMT-BGR161616:
+
+      - ``V4L2_PIX_FMT_BGR161616``
+      - 'XB48'
+
+      - R\ :sub:`7-0`
+      - R\ :sub:`15-8`
+      - G\ :sub:`7-0`
+      - G\ :sub:`15-8`
+      - B\ :sub:`7-0`
+      - B\ :sub:`15-8`
+
+.. raw:: latex
+
+    \endgroup
+
+
 Deprecated RGB Formats
 ======================
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3f5f1cf8d1c0..9181e44c20db 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -561,6 +561,11 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_ARGB32  v4l2_fourcc('B', 'A', '2', '4') /* 32  ARGB-8-8-8-8  */
 #define V4L2_PIX_FMT_XRGB32  v4l2_fourcc('B', 'X', '2', '4') /* 32  XRGB-8-8-8-8  */
 
+/* RGB formats (more than 8 bits per component) */
+#define V4L2_PIX_FMT_XBGR2101010 v4l2_fourcc('X', 'B', '3', '0') /* 32  XBGR-2-10-10-10 */
+#define V4L2_PIX_FMT_XBGR4121212 v4l2_fourcc('X', 'B', '3', '6') /* 40  XBGR-4-12-12-12 */
+#define V4L2_PIX_FMT_BGR161616 v4l2_fourcc('X', 'B', '4', '8') /* 48  BGR-16-16-16 */
+
 /* Grey formats */
 #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
 #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Greyscale     */
-- 
Regards,

Laurent Pinchart

