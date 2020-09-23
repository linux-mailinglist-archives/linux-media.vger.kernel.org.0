Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D88274F2B
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgIWCoX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbgIWCoW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:22 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE39A148C;
        Wed, 23 Sep 2020 04:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829056;
        bh=TqSvDMlXDKmP2RO+DLAUmKuPAIwXRi1aV/vx2T6KUy0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qGs5V1LRLgYHxnT0rQBpECd1kivKmBaVcRf7yznLk35yGrcMRnmDWLcoXY8ApMQpT
         WyttMrB62Lu7l4durhUphJGw3XJgqlxECRfFVoMUWVBiM461kf6/KgJmWRQrtf6Lw9
         4xrK+Du89kMNdWRz1uJmP05StEiBIiP/Lm5MlgZI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 08/16] media: doc: pixfmt-yuv: Move all packed YUV formats to common file
Date:   Wed, 23 Sep 2020 05:43:25 +0300
Message-Id: <20200923024333.920-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pixfmt-packed-yuv.rst file documents packed YUV 4:4:4 formats, but
is titled generically as "Packed YUV formats". 4:2:2 and 4:1:1 packed
YUV formats are documented in separate files, which can be confusing.

Group all packed YUV formats in pixfmt-packed-yuv.rst, which allows
documenting the 4:2:2 formats in a more concise way.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/pixfmt-packed-yuv.rst           | 147 +++++++++++++++++-
 .../userspace-api/media/v4l/pixfmt-uyvy.rst   |  77 ---------
 .../userspace-api/media/v4l/pixfmt-vyuy.rst   |  77 ---------
 .../userspace-api/media/v4l/pixfmt-y41p.rst   | 100 ------------
 .../userspace-api/media/v4l/pixfmt-yuyv.rst   |  80 ----------
 .../userspace-api/media/v4l/pixfmt-yvyu.rst   |  77 ---------
 .../userspace-api/media/v4l/yuv-formats.rst   |   5 -
 7 files changed, 140 insertions(+), 423 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index bbd4bd094deb..08b4361ba879 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -13,12 +13,16 @@
 Packed YUV formats
 ******************
 
-Description
-===========
+Similarly to the packed RGB formats, the packed YUV formats store the Y, Cb and
+Cr components consecutively in memory. They may apply subsampling to the chroma
+components and thus differ in how they interlave the three components.
 
-Similar to the packed RGB formats these formats store the Y, Cb and Cr
-component of each pixel in one 16 or 32 bit word.
 
+4:4:4 Subsampling
+=================
+
+These formats do not subsample the chroma components and store each pixels as a
+full triplet of Y, Cb and Cr values.
 
 .. raw:: latex
 
@@ -26,11 +30,9 @@ component of each pixel in one 16 or 32 bit word.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. _packed-yuv-formats:
-
 .. tabularcolumns:: |p{2.5cm}|p{0.69cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|
 
-.. flat-table:: Packed YUV Image Formats
+.. flat-table:: Packed YUV 4:4:4 Image Formats
     :header-rows:  2
     :stub-columns: 0
 
@@ -378,3 +380,134 @@ component of each pixel in one 16 or 32 bit word.
        expected to contain a meaningful value that can be used by drivers
        and applications. And, the formats XYUV32 and VUYX32 contain undefined
        alpha values that must be ignored by all applications and drivers.
+
+
+4:2:2 Subsampling
+=================
+
+These formats, commonly referred to as YUYV or YUY2, subsample the chroma
+components horizontally by 2, storing 2 pixels in 4 bytes.
+
+.. flat-table:: Packed YUV 4:2:2 Formats
+    :header-rows: 1
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      - Byte 0
+      - Byte 1
+      - Byte 2
+      - Byte 3
+      - Byte 4
+      - Byte 5
+      - Byte 6
+      - Byte 7
+    * .. _V4L2-PIX-FMT-UYVY:
+
+      - ``V4L2_PIX_FMT_UYVY``
+      - 'UYVY'
+
+      - Cb\ :sub:`0`
+      - Y'\ :sub:`0`
+      - Cr\ :sub:`0`
+      - Y'\ :sub:`1`
+      - Cb\ :sub:`2`
+      - Y'\ :sub:`2`
+      - Cr\ :sub:`2`
+      - Y'\ :sub:`3`
+    * .. _V4L2-PIX-FMT-VYUY:
+
+      - ``V4L2_PIX_FMT_VYUY``
+      - 'VYUY'
+
+      - Cr\ :sub:`0`
+      - Y'\ :sub:`0`
+      - Cb\ :sub:`0`
+      - Y'\ :sub:`1`
+      - Cr\ :sub:`2`
+      - Y'\ :sub:`2`
+      - Cb\ :sub:`2`
+      - Y'\ :sub:`3`
+    * .. _V4L2-PIX-FMT-YUYV:
+
+      - ``V4L2_PIX_FMT_YUYV``
+      - 'YUYV'
+
+      - Y'\ :sub:`0`
+      - Cb\ :sub:`0`
+      - Y'\ :sub:`1`
+      - Cr\ :sub:`0`
+      - Y'\ :sub:`2`
+      - Cb\ :sub:`2`
+      - Y'\ :sub:`3`
+      - Cr\ :sub:`2`
+    * .. _V4L2-PIX-FMT-YVYU:
+
+      - ``V4L2_PIX_FMT_YVYU``
+      - 'YVYU'
+
+      - Y'\ :sub:`0`
+      - Cr\ :sub:`0`
+      - Y'\ :sub:`1`
+      - Cb\ :sub:`0`
+      - Y'\ :sub:`2`
+      - Cr\ :sub:`2`
+      - Y'\ :sub:`3`
+      - Cb\ :sub:`2`
+
+**Color Sample Location:**
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
+
+
+4:1:1 Subsampling
+=================
+
+This format subsamples the chroma components horizontally by 4, storing 8
+pixels in 12 bytes.
+
+.. flat-table:: Packed YUV 4:1:1 Formats
+    :header-rows: 1
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      - Byte 0
+      - Byte 1
+      - Byte 2
+      - Byte 3
+      - Byte 4
+      - Byte 5
+      - Byte 6
+      - Byte 7
+      - Byte 8
+      - Byte 9
+      - Byte 10
+      - Byte 11
+    * .. _V4L2-PIX-FMT-Y41P:
+
+      - ``V4L2_PIX_FMT_Y41P``
+      - 'Y41P'
+
+      - Cb\ :sub:`0`
+      - Y'\ :sub:`0`
+      - Cr\ :sub:`0`
+      - Y'\ :sub:`1`
+      - Cb\ :sub:`4`
+      - Y'\ :sub:`2`
+      - Cr\ :sub:`4`
+      - Y'\ :sub:`3`
+      - Y'\ :sub:`4`
+      - Y'\ :sub:`5`
+      - Y'\ :sub:`6`
+      - Y'\ :sub:`7`
+
+.. note::
+
+    Do not confuse ``V4L2_PIX_FMT_Y41P`` with
+    :ref:`V4L2_PIX_FMT_YUV411P <V4L2-PIX-FMT-YUV411P>`. Y41P is derived from
+    "YUV 4:1:1 *packed*", while YUV411P stands for "YUV 4:1:1 *planar*".
+
+**Color Sample Location:**
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst b/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
deleted file mode 100644
index 5571d771af89..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
+++ /dev/null
@@ -1,77 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-UYVY:
-
-**************************
-V4L2_PIX_FMT_UYVY ('UYVY')
-**************************
-
-
-Variation of ``V4L2_PIX_FMT_YUYV`` with different order of samples in
-memory
-
-
-Description
-===========
-
-In this format each four bytes is two pixels. Each four bytes is two
-Y's, a Cb and a Cr. Each Y goes to one of the pixels, and the Cb and Cr
-belong to both pixels. As you can see, the Cr and Cb components have
-half the horizontal resolution of the Y component.
-
-**Byte Order.**
-Each cell is one byte.
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - start + 0:
-      - Cb\ :sub:`00`
-      - Y'\ :sub:`00`
-      - Cr\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Cb\ :sub:`01`
-      - Y'\ :sub:`02`
-      - Cr\ :sub:`01`
-      - Y'\ :sub:`03`
-    * - start + 8:
-      - Cb\ :sub:`10`
-      - Y'\ :sub:`10`
-      - Cr\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Cb\ :sub:`11`
-      - Y'\ :sub:`12`
-      - Cr\ :sub:`11`
-      - Y'\ :sub:`13`
-    * - start + 16:
-      - Cb\ :sub:`20`
-      - Y'\ :sub:`20`
-      - Cr\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Cb\ :sub:`21`
-      - Y'\ :sub:`22`
-      - Cr\ :sub:`21`
-      - Y'\ :sub:`23`
-    * - start + 24:
-      - Cb\ :sub:`30`
-      - Y'\ :sub:`30`
-      - Cr\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Cb\ :sub:`31`
-      - Y'\ :sub:`32`
-      - Cr\ :sub:`31`
-      - Y'\ :sub:`33`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst b/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
deleted file mode 100644
index 3d0dce59c591..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
+++ /dev/null
@@ -1,77 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-VYUY:
-
-**************************
-V4L2_PIX_FMT_VYUY ('VYUY')
-**************************
-
-
-Variation of ``V4L2_PIX_FMT_YUYV`` with different order of samples in
-memory
-
-
-Description
-===========
-
-In this format each four bytes is two pixels. Each four bytes is two
-Y's, a Cb and a Cr. Each Y goes to one of the pixels, and the Cb and Cr
-belong to both pixels. As you can see, the Cr and Cb components have
-half the horizontal resolution of the Y component.
-
-**Byte Order.**
-Each cell is one byte.
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - start + 0:
-      - Cr\ :sub:`00`
-      - Y'\ :sub:`00`
-      - Cb\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Cr\ :sub:`01`
-      - Y'\ :sub:`02`
-      - Cb\ :sub:`01`
-      - Y'\ :sub:`03`
-    * - start + 8:
-      - Cr\ :sub:`10`
-      - Y'\ :sub:`10`
-      - Cb\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Cr\ :sub:`11`
-      - Y'\ :sub:`12`
-      - Cb\ :sub:`11`
-      - Y'\ :sub:`13`
-    * - start + 16:
-      - Cr\ :sub:`20`
-      - Y'\ :sub:`20`
-      - Cb\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Cr\ :sub:`21`
-      - Y'\ :sub:`22`
-      - Cb\ :sub:`21`
-      - Y'\ :sub:`23`
-    * - start + 24:
-      - Cr\ :sub:`30`
-      - Y'\ :sub:`30`
-      - Cb\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Cr\ :sub:`31`
-      - Y'\ :sub:`32`
-      - Cb\ :sub:`31`
-      - Y'\ :sub:`33`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
deleted file mode 100644
index 880e87490b25..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
+++ /dev/null
@@ -1,100 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-Y41P:
-
-**************************
-V4L2_PIX_FMT_Y41P ('Y41P')
-**************************
-
-
-Format with ¼ horizontal chroma resolution, also known as YUV 4:1:1
-
-
-Description
-===========
-
-In this format each 12 bytes is eight pixels. In the twelve bytes are
-two CbCr pairs and eight Y's. The first CbCr pair goes with the first
-four Y's, and the second CbCr pair goes with the other four Y's. The Cb
-and Cr components have one fourth the horizontal resolution of the Y
-component.
-
-Do not confuse this format with
-:ref:`V4L2_PIX_FMT_YUV411P <V4L2-PIX-FMT-YUV411P>`. Y41P is derived
-from "YUV 4:1:1 *packed*", while YUV411P stands for "YUV 4:1:1
-*planar*".
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
-      - Cb\ :sub:`00`
-      - Y'\ :sub:`00`
-      - Cr\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Cb\ :sub:`01`
-      - Y'\ :sub:`02`
-      - Cr\ :sub:`01`
-      - Y'\ :sub:`03`
-      - Y'\ :sub:`04`
-      - Y'\ :sub:`05`
-      - Y'\ :sub:`06`
-      - Y'\ :sub:`07`
-    * - start + 12:
-      - Cb\ :sub:`10`
-      - Y'\ :sub:`10`
-      - Cr\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Cb\ :sub:`11`
-      - Y'\ :sub:`12`
-      - Cr\ :sub:`11`
-      - Y'\ :sub:`13`
-      - Y'\ :sub:`14`
-      - Y'\ :sub:`15`
-      - Y'\ :sub:`16`
-      - Y'\ :sub:`17`
-    * - start + 24:
-      - Cb\ :sub:`20`
-      - Y'\ :sub:`20`
-      - Cr\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Cb\ :sub:`21`
-      - Y'\ :sub:`22`
-      - Cr\ :sub:`21`
-      - Y'\ :sub:`23`
-      - Y'\ :sub:`24`
-      - Y'\ :sub:`25`
-      - Y'\ :sub:`26`
-      - Y'\ :sub:`27`
-    * - start + 36:
-      - Cb\ :sub:`30`
-      - Y'\ :sub:`30`
-      - Cr\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Cb\ :sub:`31`
-      - Y'\ :sub:`32`
-      - Cr\ :sub:`31`
-      - Y'\ :sub:`33`
-      - Y'\ :sub:`34`
-      - Y'\ :sub:`35`
-      - Y'\ :sub:`36`
-      - Y'\ :sub:`37`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
deleted file mode 100644
index 0ad1169b221f..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
+++ /dev/null
@@ -1,80 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-YUYV:
-
-**************************
-V4L2_PIX_FMT_YUYV ('YUYV')
-**************************
-
-
-Packed format with ½ horizontal chroma resolution, also known as YUV
-4:2:2
-
-
-Description
-===========
-
-In this format each four bytes is two pixels. Each four bytes is two
-Y's, a Cb and a Cr. Each Y goes to one of the pixels, and the Cb and Cr
-belong to both pixels. As you can see, the Cr and Cb components have
-half the horizontal resolution of the Y component. ``V4L2_PIX_FMT_YUYV``
-is known in the Windows environment as YUY2.
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
-      - Cb\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Cr\ :sub:`00`
-      - Y'\ :sub:`02`
-      - Cb\ :sub:`01`
-      - Y'\ :sub:`03`
-      - Cr\ :sub:`01`
-    * - start + 8:
-      - Y'\ :sub:`10`
-      - Cb\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Cr\ :sub:`10`
-      - Y'\ :sub:`12`
-      - Cb\ :sub:`11`
-      - Y'\ :sub:`13`
-      - Cr\ :sub:`11`
-    * - start + 16:
-      - Y'\ :sub:`20`
-      - Cb\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Cr\ :sub:`20`
-      - Y'\ :sub:`22`
-      - Cb\ :sub:`21`
-      - Y'\ :sub:`23`
-      - Cr\ :sub:`21`
-    * - start + 24:
-      - Y'\ :sub:`30`
-      - Cb\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Cr\ :sub:`30`
-      - Y'\ :sub:`32`
-      - Cb\ :sub:`31`
-      - Y'\ :sub:`33`
-      - Cr\ :sub:`31`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst b/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
deleted file mode 100644
index c9f35d7183c5..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
+++ /dev/null
@@ -1,77 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-YVYU:
-
-**************************
-V4L2_PIX_FMT_YVYU ('YVYU')
-**************************
-
-
-Variation of ``V4L2_PIX_FMT_YUYV`` with different order of samples in
-memory
-
-
-Description
-===========
-
-In this format each four bytes is two pixels. Each four bytes is two
-Y's, a Cb and a Cr. Each Y goes to one of the pixels, and the Cb and Cr
-belong to both pixels. As you can see, the Cr and Cb components have
-half the horizontal resolution of the Y component.
-
-**Byte Order.**
-Each cell is one byte.
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - start + 0:
-      - Y'\ :sub:`00`
-      - Cr\ :sub:`00`
-      - Y'\ :sub:`01`
-      - Cb\ :sub:`00`
-      - Y'\ :sub:`02`
-      - Cr\ :sub:`01`
-      - Y'\ :sub:`03`
-      - Cb\ :sub:`01`
-    * - start + 8:
-      - Y'\ :sub:`10`
-      - Cr\ :sub:`10`
-      - Y'\ :sub:`11`
-      - Cb\ :sub:`10`
-      - Y'\ :sub:`12`
-      - Cr\ :sub:`11`
-      - Y'\ :sub:`13`
-      - Cb\ :sub:`11`
-    * - start + 16:
-      - Y'\ :sub:`20`
-      - Cr\ :sub:`20`
-      - Y'\ :sub:`21`
-      - Cb\ :sub:`20`
-      - Y'\ :sub:`22`
-      - Cr\ :sub:`21`
-      - Y'\ :sub:`23`
-      - Cb\ :sub:`21`
-    * - start + 24:
-      - Y'\ :sub:`30`
-      - Cr\ :sub:`30`
-      - Y'\ :sub:`31`
-      - Cb\ :sub:`30`
-      - Y'\ :sub:`32`
-      - Cr\ :sub:`31`
-      - Y'\ :sub:`33`
-      - Cb\ :sub:`31`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally.
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
index 77ab71c7d0f5..afe4f7956e7f 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -283,11 +283,6 @@ image.
     pixfmt-y8i
     pixfmt-y12i
     pixfmt-uv8
-    pixfmt-yuyv
-    pixfmt-uyvy
-    pixfmt-yvyu
-    pixfmt-vyuy
-    pixfmt-y41p
     pixfmt-yuv420
     pixfmt-yuv420m
     pixfmt-yuv422m
-- 
Regards,

Laurent Pinchart

