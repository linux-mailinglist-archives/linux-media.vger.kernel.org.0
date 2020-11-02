Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3C62A36BB
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 23:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgKBWmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 17:42:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42356 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgKBWmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 17:42:14 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A7F2F8D;
        Mon,  2 Nov 2020 23:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604356921;
        bh=aO09/Uvw1tCGGQCATt2tUEzBVr693LVKK8S+zH+HX4s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f5kr0jeDiX55G1dRnqjdKqIcQvvoTnEWMx9xSfU9pVKwKTQMGcHcktq/ntSmexxUg
         2zPdKsO/J3AoqmrbJ65IkAMA0VL68l3tB6G0UfEYsrfybMML0hK/jBlsK0rwMLgwrB
         Qn4tNrsy9zeIYdWWeNqv/aQDTO03/Kz8XCOOE6uQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2 14/19] media: doc: pixfmt-yuv: Move all planar YUV formats to common file
Date:   Tue,  3 Nov 2020 00:40:57 +0200
Message-Id: <20201102224102.30292-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Planar pixel formats are documented in separate files. This duplicates
information, as those formats share comon traits. Consolidate them in a
single file and summarize their descriptions in a single table.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/pixfmt-yuv-planar.rst           | 487 ++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt-yuv410.rst |  72 ---
 .../media/v4l/pixfmt-yuv411p.rst              |  80 ---
 .../userspace-api/media/v4l/pixfmt-yuv420.rst |  81 ---
 .../media/v4l/pixfmt-yuv420m.rst              |  90 ----
 .../media/v4l/pixfmt-yuv422m.rst              | 101 ----
 .../media/v4l/pixfmt-yuv422p.rst              |  89 ----
 .../media/v4l/pixfmt-yuv444m.rst              | 110 ----
 .../userspace-api/media/v4l/yuv-formats.rst   |   7 -
 9 files changed, 487 insertions(+), 630 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 0ca01270bde5..07081ab05419 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -461,3 +461,490 @@ number of lines as the luma plane.
       - Cr\ :sub:`32`
       - Cb\ :sub:`33`
       - Cr\ :sub:`33`
+
+
+Fully Planar YUV Formats
+========================
+
+These formats store the Y, Cb and Cr components in three separate planes. The
+luma plane comes first, and the order of the two chroma planes varies between
+formats. The two chroma planes always use the same subsampling.
+
+For memory contiguous formats, the number of padding pixels at the end of the
+chroma lines is identical to the padding of the luma lines. The chroma line
+stride (in bytes) is thus equal to the luma line stride divided by the
+horizontal subsampling factor. Vertical subsampling doesn't affect the line
+stride.
+
+For non-contiguous formats, no constraints are enforced by the format on the
+relationship between the luma and chroma line padding and stride.
+
+All components are stored with the same number of bits per component.
+
+.. flat-table:: Overview of Fully Planar YUV Formats
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      - Bits per component
+      - Subsampling
+      - Planes order [4]_
+      - Contiguous [5]_
+
+    * - V4L2_PIX_FMT_YUV410
+      - 'YUV9'
+      - 8
+      - 4:1:0
+      - Y, Cb, Cr
+      - Yes
+    * - V4L2_PIX_FMT_YVU410
+      - 'YVU9'
+      - 8
+      - 4:1:0
+      - Y, Cr, Cb
+      - Yes
+    * - V4L2_PIX_FMT_YUV411P
+      - '411P'
+      - 8
+      - 4:1:1
+      - Y, Cb, Cr
+      - Yes
+    * - V4L2_PIX_FMT_YUV420M
+      - 'YM12'
+      - 8
+      - 4:2:0
+      - Y, Cb, Cr
+      - No
+    * - V4L2_PIX_FMT_YVU420M
+      - 'YM21'
+      - 8
+      - 4:2:0
+      - Y, Cb, Cr
+      - No
+    * - V4L2_PIX_FMT_YUV420
+      - 'YU12'
+      - 8
+      - 4:2:0
+      - Y, Cb, Cr
+      - Yes
+    * - V4L2_PIX_FMT_YVU420
+      - 'YV12'
+      - 8
+      - 4:2:0
+      - Y, Cr, Cb
+      - Yes
+    * - V4L2_PIX_FMT_YUV422P
+      - '422P'
+      - 8
+      - 4:2:2
+      - Y, Cb, Cr
+      - Yes
+    * - V4L2_PIX_FMT_YUV422M
+      - 'YM16'
+      - 8
+      - 4:2:2
+      - Y, Cb, Cr
+      - No
+    * - V4L2_PIX_FMT_YVU422M
+      - 'YM61'
+      - 8
+      - 4:2:2
+      - Y, Cr, Cb
+      - No
+    * - V4L2_PIX_FMT_YUV444M
+      - 'YM24'
+      - 8
+      - 4:4:4
+      - Y, Cb, Cr
+      - No
+    * - V4L2_PIX_FMT_YVU444M
+      - 'YM42'
+      - 8
+      - 4:4:4
+      - Y, Cb, Cr
+      - No
+
+.. note::
+
+   .. [4] Order of luma and chroma planes
+   .. [5] Indicates if planes have to be contiguous in memory or can be
+      disjoint
+
+
+**Color Sample Location:**
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
+
+.. _V4L2-PIX-FMT-YUV410:
+.. _V4L2-PIX-FMT-YVU410:
+
+YUV410 and YVU410
+-----------------
+
+Planar YUV 4:1:0 formats. The chroma planes are subsampled by 4 in each
+direction. Chroma lines contain a quarter of the number of pixels and bytes of
+the luma lines, and the chroma planes contain a quarter of the number of lines
+of the luma plane.
+
+.. flat-table:: Sample 4x4 YUV410 Image
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00`
+      - Y'\ :sub:`01`
+      - Y'\ :sub:`02`
+      - Y'\ :sub:`03`
+    * - start + 4:
+      - Y'\ :sub:`10`
+      - Y'\ :sub:`11`
+      - Y'\ :sub:`12`
+      - Y'\ :sub:`13`
+    * - start + 8:
+      - Y'\ :sub:`20`
+      - Y'\ :sub:`21`
+      - Y'\ :sub:`22`
+      - Y'\ :sub:`23`
+    * - start + 12:
+      - Y'\ :sub:`30`
+      - Y'\ :sub:`31`
+      - Y'\ :sub:`32`
+      - Y'\ :sub:`33`
+    * - start + 16:
+      - Cr\ :sub:`00`
+    * - start + 17:
+      - Cb\ :sub:`00`
+
+
+.. _V4L2-PIX-FMT-YUV411P:
+
+YUV411P
+-------
+
+Planar YUV 4:1:1 formats. The chroma planes are subsampled by 4 in the
+horizontal direction. Chroma lines contain a quarter of the number of pixels
+and bytes of the luma lines, and the chroma planes contain the same number of
+lines as the luma plane.
+
+.. flat-table:: Sample 4x4 YUV411P Image
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00`
+      - Y'\ :sub:`01`
+      - Y'\ :sub:`02`
+      - Y'\ :sub:`03`
+    * - start + 4:
+      - Y'\ :sub:`10`
+      - Y'\ :sub:`11`
+      - Y'\ :sub:`12`
+      - Y'\ :sub:`13`
+    * - start + 8:
+      - Y'\ :sub:`20`
+      - Y'\ :sub:`21`
+      - Y'\ :sub:`22`
+      - Y'\ :sub:`23`
+    * - start + 12:
+      - Y'\ :sub:`30`
+      - Y'\ :sub:`31`
+      - Y'\ :sub:`32`
+      - Y'\ :sub:`33`
+    * - start + 16:
+      - Cb\ :sub:`00`
+    * - start + 17:
+      - Cb\ :sub:`10`
+    * - start + 18:
+      - Cb\ :sub:`20`
+    * - start + 19:
+      - Cb\ :sub:`30`
+    * - start + 20:
+      - Cr\ :sub:`00`
+    * - start + 21:
+      - Cr\ :sub:`10`
+    * - start + 22:
+      - Cr\ :sub:`20`
+    * - start + 23:
+      - Cr\ :sub:`30`
+
+
+.. _V4L2-PIX-FMT-YUV420:
+.. _V4L2-PIX-FMT-YVU420:
+.. _V4L2-PIX-FMT-YUV420M:
+.. _V4L2-PIX-FMT-YVU420M:
+
+YUV420, YVU420, YUV420M and YVU420M
+-----------------------------------
+
+Planar YUV 4:2:0 formats. The chroma planes are subsampled by 2 in each
+direction. Chroma lines contain half of the number of pixels and bytes of the
+luma lines, and the chroma planes contain half of the number of lines of the
+luma plane.
+
+.. flat-table:: Sample 4x4 YUV420 Image
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00`
+      - Y'\ :sub:`01`
+      - Y'\ :sub:`02`
+      - Y'\ :sub:`03`
+    * - start + 4:
+      - Y'\ :sub:`10`
+      - Y'\ :sub:`11`
+      - Y'\ :sub:`12`
+      - Y'\ :sub:`13`
+    * - start + 8:
+      - Y'\ :sub:`20`
+      - Y'\ :sub:`21`
+      - Y'\ :sub:`22`
+      - Y'\ :sub:`23`
+    * - start + 12:
+      - Y'\ :sub:`30`
+      - Y'\ :sub:`31`
+      - Y'\ :sub:`32`
+      - Y'\ :sub:`33`
+    * - start + 16:
+      - Cr\ :sub:`00`
+      - Cr\ :sub:`01`
+    * - start + 18:
+      - Cr\ :sub:`10`
+      - Cr\ :sub:`11`
+    * - start + 20:
+      - Cb\ :sub:`00`
+      - Cb\ :sub:`01`
+    * - start + 22:
+      - Cb\ :sub:`10`
+      - Cb\ :sub:`11`
+
+.. flat-table:: Sample 4x4 YUV420M Image
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start0 + 0:
+      - Y'\ :sub:`00`
+      - Y'\ :sub:`01`
+      - Y'\ :sub:`02`
+      - Y'\ :sub:`03`
+    * - start0 + 4:
+      - Y'\ :sub:`10`
+      - Y'\ :sub:`11`
+      - Y'\ :sub:`12`
+      - Y'\ :sub:`13`
+    * - start0 + 8:
+      - Y'\ :sub:`20`
+      - Y'\ :sub:`21`
+      - Y'\ :sub:`22`
+      - Y'\ :sub:`23`
+    * - start0 + 12:
+      - Y'\ :sub:`30`
+      - Y'\ :sub:`31`
+      - Y'\ :sub:`32`
+      - Y'\ :sub:`33`
+    * -
+    * - start1 + 0:
+      - Cb\ :sub:`00`
+      - Cb\ :sub:`01`
+    * - start1 + 2:
+      - Cb\ :sub:`10`
+      - Cb\ :sub:`11`
+    * -
+    * - start2 + 0:
+      - Cr\ :sub:`00`
+      - Cr\ :sub:`01`
+    * - start2 + 2:
+      - Cr\ :sub:`10`
+      - Cr\ :sub:`11`
+
+
+.. _V4L2-PIX-FMT-YUV422P:
+.. _V4L2-PIX-FMT-YUV422M:
+.. _V4L2-PIX-FMT-YVU422M:
+
+YUV422P, YUV422M and YVU422M
+----------------------------
+
+Planar YUV 4:2:2 formats. The chroma planes are subsampled by 2 in the
+horizontal direction. Chroma lines contain half of the number of pixels and
+bytes of the luma lines, and the chroma planes contain the same number of lines
+as the luma plane.
+
+.. flat-table:: Sample 4x4 YUV422P Image
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00`
+      - Y'\ :sub:`01`
+      - Y'\ :sub:`02`
+      - Y'\ :sub:`03`
+    * - start + 4:
+      - Y'\ :sub:`10`
+      - Y'\ :sub:`11`
+      - Y'\ :sub:`12`
+      - Y'\ :sub:`13`
+    * - start + 8:
+      - Y'\ :sub:`20`
+      - Y'\ :sub:`21`
+      - Y'\ :sub:`22`
+      - Y'\ :sub:`23`
+    * - start + 12:
+      - Y'\ :sub:`30`
+      - Y'\ :sub:`31`
+      - Y'\ :sub:`32`
+      - Y'\ :sub:`33`
+    * - start + 16:
+      - Cb\ :sub:`00`
+      - Cb\ :sub:`01`
+    * - start + 18:
+      - Cb\ :sub:`10`
+      - Cb\ :sub:`11`
+    * - start + 20:
+      - Cb\ :sub:`20`
+      - Cb\ :sub:`21`
+    * - start + 22:
+      - Cb\ :sub:`30`
+      - Cb\ :sub:`31`
+    * - start + 24:
+      - Cr\ :sub:`00`
+      - Cr\ :sub:`01`
+    * - start + 26:
+      - Cr\ :sub:`10`
+      - Cr\ :sub:`11`
+    * - start + 28:
+      - Cr\ :sub:`20`
+      - Cr\ :sub:`21`
+    * - start + 30:
+      - Cr\ :sub:`30`
+      - Cr\ :sub:`31`
+
+.. flat-table:: Sample 4x4 YUV422M Image
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start0 + 0:
+      - Y'\ :sub:`00`
+      - Y'\ :sub:`01`
+      - Y'\ :sub:`02`
+      - Y'\ :sub:`03`
+    * - start0 + 4:
+      - Y'\ :sub:`10`
+      - Y'\ :sub:`11`
+      - Y'\ :sub:`12`
+      - Y'\ :sub:`13`
+    * - start0 + 8:
+      - Y'\ :sub:`20`
+      - Y'\ :sub:`21`
+      - Y'\ :sub:`22`
+      - Y'\ :sub:`23`
+    * - start0 + 12:
+      - Y'\ :sub:`30`
+      - Y'\ :sub:`31`
+      - Y'\ :sub:`32`
+      - Y'\ :sub:`33`
+    * -
+    * - start1 + 0:
+      - Cb\ :sub:`00`
+      - Cb\ :sub:`01`
+    * - start1 + 2:
+      - Cb\ :sub:`10`
+      - Cb\ :sub:`11`
+    * - start1 + 4:
+      - Cb\ :sub:`20`
+      - Cb\ :sub:`21`
+    * - start1 + 6:
+      - Cb\ :sub:`30`
+      - Cb\ :sub:`31`
+    * -
+    * - start2 + 0:
+      - Cr\ :sub:`00`
+      - Cr\ :sub:`01`
+    * - start2 + 2:
+      - Cr\ :sub:`10`
+      - Cr\ :sub:`11`
+    * - start2 + 4:
+      - Cr\ :sub:`20`
+      - Cr\ :sub:`21`
+    * - start2 + 6:
+      - Cr\ :sub:`30`
+      - Cr\ :sub:`31`
+
+
+.. _V4L2-PIX-FMT-YUV444M:
+.. _V4L2-PIX-FMT-YVU444M:
+
+YUV444M and YVU444M
+-------------------
+
+Planar YUV 4:4:4 formats. The chroma planes are no subsampled. Chroma lines
+contain the same number of pixels and bytes of the luma lines, and the chroma
+planes contain the same number of lines as the luma plane.
+
+.. flat-table:: Sample 4x4 YUV444M Image
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start0 + 0:
+      - Y'\ :sub:`00`
+      - Y'\ :sub:`01`
+      - Y'\ :sub:`02`
+      - Y'\ :sub:`03`
+    * - start0 + 4:
+      - Y'\ :sub:`10`
+      - Y'\ :sub:`11`
+      - Y'\ :sub:`12`
+      - Y'\ :sub:`13`
+    * - start0 + 8:
+      - Y'\ :sub:`20`
+      - Y'\ :sub:`21`
+      - Y'\ :sub:`22`
+      - Y'\ :sub:`23`
+    * - start0 + 12:
+      - Y'\ :sub:`30`
+      - Y'\ :sub:`31`
+      - Y'\ :sub:`32`
+      - Y'\ :sub:`33`
+    * -
+    * - start1 + 0:
+      - Cb\ :sub:`00`
+      - Cb\ :sub:`01`
+      - Cb\ :sub:`02`
+      - Cb\ :sub:`03`
+    * - start1 + 4:
+      - Cb\ :sub:`10`
+      - Cb\ :sub:`11`
+      - Cb\ :sub:`12`
+      - Cb\ :sub:`13`
+    * - start1 + 8:
+      - Cb\ :sub:`20`
+      - Cb\ :sub:`21`
+      - Cb\ :sub:`22`
+      - Cb\ :sub:`23`
+    * - start1 + 12:
+      - Cb\ :sub:`20`
+      - Cb\ :sub:`21`
+      - Cb\ :sub:`32`
+      - Cb\ :sub:`33`
+    * -
+    * - start2 + 0:
+      - Cr\ :sub:`00`
+      - Cr\ :sub:`01`
+      - Cr\ :sub:`02`
+      - Cr\ :sub:`03`
+    * - start2 + 4:
+      - Cr\ :sub:`10`
+      - Cr\ :sub:`11`
+      - Cr\ :sub:`12`
+      - Cr\ :sub:`13`
+    * - start2 + 8:
+      - Cr\ :sub:`20`
+      - Cr\ :sub:`21`
+      - Cr\ :sub:`22`
+      - Cr\ :sub:`23`
+    * - start2 + 12:
+      - Cr\ :sub:`30`
+      - Cr\ :sub:`31`
+      - Cr\ :sub:`32`
+      - Cr\ :sub:`33`
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
deleted file mode 100644
index d79cd46d5055..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
+++ /dev/null
@@ -1,72 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-YVU410:
-.. _v4l2-pix-fmt-yuv410:
-
-**********************************************************
-V4L2_PIX_FMT_YVU410 ('YVU9'), V4L2_PIX_FMT_YUV410 ('YUV9')
-**********************************************************
-
-
-V4L2_PIX_FMT_YUV410
-Planar formats with ¼ horizontal and vertical chroma resolution, also
-known as YUV 4:1:0
-
-
-Description
-===========
-
-These are planar formats, as opposed to a packed format. The three
-components are separated into three sub-images or planes. The Y plane is
-first. The Y plane has one byte per pixel. For ``V4L2_PIX_FMT_YVU410``,
-the Cr plane immediately follows the Y plane in memory. The Cr plane is
-¼ the width and ¼ the height of the Y plane (and of the image). Each Cr
-belongs to 16 pixels, a four-by-four square of the image. Following the
-Cr plane is the Cb plane, just like the Cr plane.
-``V4L2_PIX_FMT_YUV410`` is the same, except the Cb plane comes first,
-then the Cr plane.
-
-If the Y plane has pad bytes after each row, then the Cr and Cb planes
-have ¼ as many pad bytes after their rows. In other words, four Cx rows
-(including padding) are exactly as long as one Y row (including
-padding).
-
-**Byte Order.**
-Each cell is one byte.
-
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - start + 0:
-      - Y'\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Y'\ :sub:`02`
-      - Y'\ :sub:`03`
-    * - start + 4:
-      - Y'\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Y'\ :sub:`12`
-      - Y'\ :sub:`13`
-    * - start + 8:
-      - Y'\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Y'\ :sub:`22`
-      - Y'\ :sub:`23`
-    * - start + 12:
-      - Y'\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Y'\ :sub:`32`
-      - Y'\ :sub:`33`
-    * - start + 16:
-      - Cr\ :sub:`00`
-    * - start + 17:
-      - Cb\ :sub:`00`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
deleted file mode 100644
index 8a70eeca8d83..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
+++ /dev/null
@@ -1,80 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-YUV411P:
-
-*****************************
-V4L2_PIX_FMT_YUV411P ('411P')
-*****************************
-
-
-Format with ¼ horizontal chroma resolution, also known as YUV 4:1:1.
-Planar layout as opposed to ``V4L2_PIX_FMT_Y41P``
-
-
-Description
-===========
-
-This format is not commonly used. This is a planar format similar to the
-4:2:2 planar format except with half as many chroma. The three
-components are separated into three sub-images or planes. The Y plane is
-first. The Y plane has one byte per pixel. The Cb plane immediately
-follows the Y plane in memory. The Cb plane is ¼ the width of the Y
-plane (and of the image). Each Cb belongs to 4 pixels all on the same
-row. For example, Cb\ :sub:`0` belongs to Y'\ :sub:`00`, Y'\ :sub:`01`,
-Y'\ :sub:`02` and Y'\ :sub:`03`. Following the Cb plane is the Cr plane,
-just like the Cb plane.
-
-If the Y plane has pad bytes after each row, then the Cr and Cb planes
-have ¼ as many pad bytes after their rows. In other words, four C x rows
-(including padding) is exactly as long as one Y row (including padding).
-
-**Byte Order.**
-Each cell is one byte.
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - start + 0:
-      - Y'\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Y'\ :sub:`02`
-      - Y'\ :sub:`03`
-    * - start + 4:
-      - Y'\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Y'\ :sub:`12`
-      - Y'\ :sub:`13`
-    * - start + 8:
-      - Y'\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Y'\ :sub:`22`
-      - Y'\ :sub:`23`
-    * - start + 12:
-      - Y'\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Y'\ :sub:`32`
-      - Y'\ :sub:`33`
-    * - start + 16:
-      - Cb\ :sub:`00`
-    * - start + 17:
-      - Cb\ :sub:`10`
-    * - start + 18:
-      - Cb\ :sub:`20`
-    * - start + 19:
-      - Cb\ :sub:`30`
-    * - start + 20:
-      - Cr\ :sub:`00`
-    * - start + 21:
-      - Cr\ :sub:`10`
-    * - start + 22:
-      - Cr\ :sub:`20`
-    * - start + 23:
-      - Cr\ :sub:`30`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
deleted file mode 100644
index a36ec8d6d8a4..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
+++ /dev/null
@@ -1,81 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-YVU420:
-.. _V4L2-PIX-FMT-YUV420:
-
-**********************************************************
-V4L2_PIX_FMT_YVU420 ('YV12'), V4L2_PIX_FMT_YUV420 ('YU12')
-**********************************************************
-
-
-V4L2_PIX_FMT_YUV420
-Planar formats with ½ horizontal and vertical chroma resolution, also
-known as YUV 4:2:0
-
-
-Description
-===========
-
-These are planar formats, as opposed to a packed format. The three
-components are separated into three sub- images or planes. The Y plane
-is first. The Y plane has one byte per pixel. For
-``V4L2_PIX_FMT_YVU420``, the Cr plane immediately follows the Y plane in
-memory. The Cr plane is half the width and half the height of the Y
-plane (and of the image). Each Cr belongs to four pixels, a two-by-two
-square of the image. For example, Cr\ :sub:`0` belongs to Y'\ :sub:`00`,
-Y'\ :sub:`01`, Y'\ :sub:`10`, and Y'\ :sub:`11`. Following the Cr plane
-is the Cb plane, just like the Cr plane. ``V4L2_PIX_FMT_YUV420`` is the
-same except the Cb plane comes first, then the Cr plane.
-
-If the Y plane has pad bytes after each row, then the Cr and Cb planes
-have half as many pad bytes after their rows. In other words, two Cx
-rows (including padding) is exactly as long as one Y row (including
-padding).
-
-**Byte Order.**
-Each cell is one byte.
-
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - start + 0:
-      - Y'\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Y'\ :sub:`02`
-      - Y'\ :sub:`03`
-    * - start + 4:
-      - Y'\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Y'\ :sub:`12`
-      - Y'\ :sub:`13`
-    * - start + 8:
-      - Y'\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Y'\ :sub:`22`
-      - Y'\ :sub:`23`
-    * - start + 12:
-      - Y'\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Y'\ :sub:`32`
-      - Y'\ :sub:`33`
-    * - start + 16:
-      - Cr\ :sub:`00`
-      - Cr\ :sub:`01`
-    * - start + 18:
-      - Cr\ :sub:`10`
-      - Cr\ :sub:`11`
-    * - start + 20:
-      - Cb\ :sub:`00`
-      - Cb\ :sub:`01`
-    * - start + 22:
-      - Cb\ :sub:`10`
-      - Cb\ :sub:`11`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
deleted file mode 100644
index c2cf17b9743c..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
+++ /dev/null
@@ -1,90 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-YUV420M:
-.. _v4l2-pix-fmt-yvu420m:
-
-************************************************************
-V4L2_PIX_FMT_YUV420M ('YM12'), V4L2_PIX_FMT_YVU420M ('YM21')
-************************************************************
-
-
-V4L2_PIX_FMT_YVU420M
-Variation of ``V4L2_PIX_FMT_YUV420`` and ``V4L2_PIX_FMT_YVU420`` with
-planes non contiguous in memory.
-
-
-Description
-===========
-
-This is a multi-planar format, as opposed to a packed format. The three
-components are separated into three sub-images or planes.
-
-The Y plane is first. The Y plane has one byte per pixel. For
-``V4L2_PIX_FMT_YUV420M`` the Cb data constitutes the second plane which
-is half the width and half the height of the Y plane (and of the image).
-Each Cb belongs to four pixels, a two-by-two square of the image. For
-example, Cb\ :sub:`0` belongs to Y'\ :sub:`00`, Y'\ :sub:`01`,
-Y'\ :sub:`10`, and Y'\ :sub:`11`. The Cr data, just like the Cb plane,
-is in the third plane.
-
-``V4L2_PIX_FMT_YVU420M`` is the same except the Cr data is stored in the
-second plane and the Cb data in the third plane.
-
-If the Y plane has pad bytes after each row, then the Cb and Cr planes
-have half as many pad bytes after their rows. In other words, two Cx
-rows (including padding) is exactly as long as one Y row (including
-padding).
-
-``V4L2_PIX_FMT_YUV420M`` and ``V4L2_PIX_FMT_YVU420M`` are intended to be
-used only in drivers and applications that support the multi-planar API,
-described in :ref:`planar-apis`.
-
-**Byte Order.**
-Each cell is one byte.
-
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - start0 + 0:
-      - Y'\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Y'\ :sub:`02`
-      - Y'\ :sub:`03`
-    * - start0 + 4:
-      - Y'\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Y'\ :sub:`12`
-      - Y'\ :sub:`13`
-    * - start0 + 8:
-      - Y'\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Y'\ :sub:`22`
-      - Y'\ :sub:`23`
-    * - start0 + 12:
-      - Y'\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Y'\ :sub:`32`
-      - Y'\ :sub:`33`
-    * -
-    * - start1 + 0:
-      - Cb\ :sub:`00`
-      - Cb\ :sub:`01`
-    * - start1 + 2:
-      - Cb\ :sub:`10`
-      - Cb\ :sub:`11`
-    * -
-    * - start2 + 0:
-      - Cr\ :sub:`00`
-      - Cr\ :sub:`01`
-    * - start2 + 2:
-      - Cr\ :sub:`10`
-      - Cr\ :sub:`11`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
deleted file mode 100644
index f92b54853fc9..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
+++ /dev/null
@@ -1,101 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-YUV422M:
-.. _v4l2-pix-fmt-yvu422m:
-
-************************************************************
-V4L2_PIX_FMT_YUV422M ('YM16'), V4L2_PIX_FMT_YVU422M ('YM61')
-************************************************************
-
-
-V4L2_PIX_FMT_YVU422M
-Planar formats with ½ horizontal resolution, also known as YUV and YVU
-4:2:2
-
-
-Description
-===========
-
-This is a multi-planar format, as opposed to a packed format. The three
-components are separated into three sub-images or planes.
-
-The Y plane is first. The Y plane has one byte per pixel. For
-``V4L2_PIX_FMT_YUV422M`` the Cb data constitutes the second plane which
-is half the width of the Y plane (and of the image). Each Cb belongs to
-two pixels. For example, Cb\ :sub:`0` belongs to Y'\ :sub:`00`,
-Y'\ :sub:`01`. The Cr data, just like the Cb plane, is in the third
-plane.
-
-``V4L2_PIX_FMT_YVU422M`` is the same except the Cr data is stored in the
-second plane and the Cb data in the third plane.
-
-If the Y plane has pad bytes after each row, then the Cb and Cr planes
-have half as many pad bytes after their rows. In other words, two Cx
-rows (including padding) is exactly as long as one Y row (including
-padding).
-
-``V4L2_PIX_FMT_YUV422M`` and ``V4L2_PIX_FMT_YVU422M`` are intended to be
-used only in drivers and applications that support the multi-planar API,
-described in :ref:`planar-apis`.
-
-**Byte Order.**
-Each cell is one byte.
-
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - start0 + 0:
-      - Y'\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Y'\ :sub:`02`
-      - Y'\ :sub:`03`
-    * - start0 + 4:
-      - Y'\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Y'\ :sub:`12`
-      - Y'\ :sub:`13`
-    * - start0 + 8:
-      - Y'\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Y'\ :sub:`22`
-      - Y'\ :sub:`23`
-    * - start0 + 12:
-      - Y'\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Y'\ :sub:`32`
-      - Y'\ :sub:`33`
-    * -
-    * - start1 + 0:
-      - Cb\ :sub:`00`
-      - Cb\ :sub:`01`
-    * - start1 + 2:
-      - Cb\ :sub:`10`
-      - Cb\ :sub:`11`
-    * - start1 + 4:
-      - Cb\ :sub:`20`
-      - Cb\ :sub:`21`
-    * - start1 + 6:
-      - Cb\ :sub:`30`
-      - Cb\ :sub:`31`
-    * -
-    * - start2 + 0:
-      - Cr\ :sub:`00`
-      - Cr\ :sub:`01`
-    * - start2 + 2:
-      - Cr\ :sub:`10`
-      - Cr\ :sub:`11`
-    * - start2 + 4:
-      - Cr\ :sub:`20`
-      - Cr\ :sub:`21`
-    * - start2 + 6:
-      - Cr\ :sub:`30`
-      - Cr\ :sub:`31`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
deleted file mode 100644
index 33e6b923e325..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
+++ /dev/null
@@ -1,89 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-YUV422P:
-
-*****************************
-V4L2_PIX_FMT_YUV422P ('422P')
-*****************************
-
-
-Format with ½ horizontal chroma resolution, also known as YUV 4:2:2.
-Planar layout as opposed to ``V4L2_PIX_FMT_YUYV``
-
-
-Description
-===========
-
-This format is not commonly used. This is a planar version of the YUYV
-format. The three components are separated into three sub-images or
-planes. The Y plane is first. The Y plane has one byte per pixel. The Cb
-plane immediately follows the Y plane in memory. The Cb plane is half
-the width of the Y plane (and of the image). Each Cb belongs to two
-pixels. For example, Cb\ :sub:`0` belongs to Y'\ :sub:`00`,
-Y'\ :sub:`01`. Following the Cb plane is the Cr plane, just like the Cb
-plane.
-
-If the Y plane has pad bytes after each row, then the Cr and Cb planes
-have half as many pad bytes after their rows. In other words, two Cx
-rows (including padding) is exactly as long as one Y row (including
-padding).
-
-**Byte Order.**
-Each cell is one byte.
-
-
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - start + 0:
-      - Y'\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Y'\ :sub:`02`
-      - Y'\ :sub:`03`
-    * - start + 4:
-      - Y'\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Y'\ :sub:`12`
-      - Y'\ :sub:`13`
-    * - start + 8:
-      - Y'\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Y'\ :sub:`22`
-      - Y'\ :sub:`23`
-    * - start + 12:
-      - Y'\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Y'\ :sub:`32`
-      - Y'\ :sub:`33`
-    * - start + 16:
-      - Cb\ :sub:`00`
-      - Cb\ :sub:`01`
-    * - start + 18:
-      - Cb\ :sub:`10`
-      - Cb\ :sub:`11`
-    * - start + 20:
-      - Cb\ :sub:`20`
-      - Cb\ :sub:`21`
-    * - start + 22:
-      - Cb\ :sub:`30`
-      - Cb\ :sub:`31`
-    * - start + 24:
-      - Cr\ :sub:`00`
-      - Cr\ :sub:`01`
-    * - start + 26:
-      - Cr\ :sub:`10`
-      - Cr\ :sub:`11`
-    * - start + 28:
-      - Cr\ :sub:`20`
-      - Cr\ :sub:`21`
-    * - start + 30:
-      - Cr\ :sub:`30`
-      - Cr\ :sub:`31`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
deleted file mode 100644
index 7c03cc5b07d9..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
+++ /dev/null
@@ -1,110 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-YUV444M:
-.. _v4l2-pix-fmt-yvu444m:
-
-************************************************************
-V4L2_PIX_FMT_YUV444M ('YM24'), V4L2_PIX_FMT_YVU444M ('YM42')
-************************************************************
-
-
-V4L2_PIX_FMT_YVU444M
-Planar formats with full horizontal resolution, also known as YUV and
-YVU 4:4:4
-
-
-Description
-===========
-
-This is a multi-planar format, as opposed to a packed format. The three
-components are separated into three sub-images or planes.
-
-The Y plane is first. The Y plane has one byte per pixel. For
-``V4L2_PIX_FMT_YUV444M`` the Cb data constitutes the second plane which
-is the same width and height as the Y plane (and as the image). The Cr
-data, just like the Cb plane, is in the third plane.
-
-``V4L2_PIX_FMT_YVU444M`` is the same except the Cr data is stored in the
-second plane and the Cb data in the third plane.
-
-If the Y plane has pad bytes after each row, then the Cb and Cr planes
-have the same number of pad bytes after their rows.
-
-``V4L2_PIX_FMT_YUV444M`` and ``V4L2_PIX_FMT_YUV444M`` are intended to be
-used only in drivers and applications that support the multi-planar API,
-described in :ref:`planar-apis`.
-
-**Byte Order.**
-Each cell is one byte.
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - start0 + 0:
-      - Y'\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Y'\ :sub:`02`
-      - Y'\ :sub:`03`
-    * - start0 + 4:
-      - Y'\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Y'\ :sub:`12`
-      - Y'\ :sub:`13`
-    * - start0 + 8:
-      - Y'\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Y'\ :sub:`22`
-      - Y'\ :sub:`23`
-    * - start0 + 12:
-      - Y'\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Y'\ :sub:`32`
-      - Y'\ :sub:`33`
-    * -
-    * - start1 + 0:
-      - Cb\ :sub:`00`
-      - Cb\ :sub:`01`
-      - Cb\ :sub:`02`
-      - Cb\ :sub:`03`
-    * - start1 + 4:
-      - Cb\ :sub:`10`
-      - Cb\ :sub:`11`
-      - Cb\ :sub:`12`
-      - Cb\ :sub:`13`
-    * - start1 + 8:
-      - Cb\ :sub:`20`
-      - Cb\ :sub:`21`
-      - Cb\ :sub:`22`
-      - Cb\ :sub:`23`
-    * - start1 + 12:
-      - Cb\ :sub:`20`
-      - Cb\ :sub:`21`
-      - Cb\ :sub:`32`
-      - Cb\ :sub:`33`
-    * -
-    * - start2 + 0:
-      - Cr\ :sub:`00`
-      - Cr\ :sub:`01`
-      - Cr\ :sub:`02`
-      - Cr\ :sub:`03`
-    * - start2 + 4:
-      - Cr\ :sub:`10`
-      - Cr\ :sub:`11`
-      - Cr\ :sub:`12`
-      - Cr\ :sub:`13`
-    * - start2 + 8:
-      - Cr\ :sub:`20`
-      - Cr\ :sub:`21`
-      - Cr\ :sub:`22`
-      - Cr\ :sub:`23`
-    * - start2 + 12:
-      - Cr\ :sub:`30`
-      - Cr\ :sub:`31`
-      - Cr\ :sub:`32`
-      - Cr\ :sub:`33`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`co-sited<yuv-chroma-cosited>`.
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
index 517499056f3b..24b34cdfa6fe 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -270,11 +270,4 @@ image.
     pixfmt-y8i
     pixfmt-y12i
     pixfmt-uv8
-    pixfmt-yuv420
-    pixfmt-yuv420m
-    pixfmt-yuv422m
-    pixfmt-yuv444m
-    pixfmt-yuv410
-    pixfmt-yuv422p
-    pixfmt-yuv411p
     pixfmt-m420
-- 
Regards,

Laurent Pinchart

