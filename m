Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0264D274F29
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbgIWCoU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbgIWCoU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:20 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDC381487;
        Wed, 23 Sep 2020 04:44:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829055;
        bh=X9iqmiofZHumjz5DB7Mysihz7MJ2CO+rp0KbMZY7AV8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BMgS+xqKeuf8AdN+W7nQ0y9pl8xLPQdgVQvx3DyaL0NBJTJs1ghfy1V06ps1WgD3K
         m0rhkQOuKuqyY8VGmXQwTXdNynKDjItPRCk62Qu88jlBpK9+kcJQcroVxSUYvAY0Xy
         TR2HPjWvn50l5PVkgdTg0OnoFRS2HuyZE7qU3fwo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 06/16] media: doc: pixfmt-rgb: Clarify naming scheme for RGB formats
Date:   Wed, 23 Sep 2020 05:43:23 +0300
Message-Id: <20200923024333.920-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The naming scheme for the RGB pixel formats has been developed
organically, and isn't consistent between formats stored in 1 or 2
bytes, and formats stored in 3 or 4 bytes. For the latter category, the
names use a components order convention that is the opposite of the
first category, and the opposite of DRM pixel formats. This has lead to
lots of confusion in the past, and would really benefit from being
explained more precisely. Do so, which also prepares for the addition of
additional RGB pixels formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 196 ++++++++++++------
 include/uapi/linux/videodev2.h                |   4 +-
 2 files changed, 141 insertions(+), 59 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index 3208ec94db4c..32bfd68af425 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -13,13 +13,63 @@
 RGB Formats
 ***********
 
-Description
-===========
+These formats encode each pixel as a triplet of RGB values. They are packed
+formats, meaning that the RGB values for one pixel are stored consecutively in
+memory. Multiple pixels are however not packed in the same byte, each pixel
+consumes an integer number of bytes. When the number of bits required to store
+a pixel is not aligned to a byte boundary, the data is padded with additional
+bits to fill the remaining byte.
 
-These formats are designed to match the pixel formats of typical PC
-graphics frame buffers. They occupy 8, 16, 24 or 32 bits per pixel.
-These are all packed-pixel formats, meaning all the data for a pixel lie
-next to each other in memory.
+The formats differ by the number of bits per RGB component (typically but not
+always the same for all components), the order of components in memory, and the
+presence of an alpha component or an additional padding byte.
+
+The usage and value of the alpha bits in formats that support them (named ARGB
+or a permutation thereof, collectively referred to as alpha formats) depend on
+the device type and hardware operation. :ref:`Capture <capture>` devices
+(including capture queues of mem-to-mem devices) fill the alpha component in
+memory. When the device captures an alpha channel the alpha component will have
+a meaningful value. Otherwise, when the device doesn't capture an alpha channel
+but can set the alpha bit to a user-configurable value, the
+:ref:`V4L2_CID_ALPHA_COMPONENT <v4l2-alpha-component>` control is used to
+specify that alpha value, and the alpha component of all pixels will be set to
+the value specified by that control. Otherwise a corresponding format without
+an alpha component (XRGB or XBGR) must be used instead of an alpha format.
+
+:ref:`Output <output>` devices (including output queues of mem-to-mem devices
+and :ref:`video output overlay <osd>` devices) read the alpha component from
+memory. When the device processes the alpha channel the alpha component must be
+filled with meaningful values by applications. Otherwise a corresponding format
+without an alpha component (XRGB or XBGR) must be used instead of an alpha
+format.
+
+Formats that contain padding bits are named XRGB (or a permutation thereof).
+The padding bits contain undefined values and must be ignored by applications,
+devices and drivers, for both :ref:`capture` and :ref:`output` devices.
+
+.. note::
+
+   - In all the tables that follow, bit 7 is the most significant bit in a byte.
+   - 'r', 'g' and 'b' denote bits of the red, green and blue components
+     respectively. 'a' denotes bits of the the alpha component (if supported by
+     the format), and '-' denotes padding bits.
+
+
+8 or 16 Bits Per Pixel
+======================
+
+These formats store an RGB triplet in one or two bytes. They are named based on
+the order of the RGB components as seen in a 8- or 16-bit word, which is then
+stored in memory in little endian byte order (unless otherwise noted by the
+presence of bit 31 in the 4CC value), and on the number of bits for each
+component. For instance, the RGB565 format stores a pixel in a 16-bit word
+[15:0] laid out at as [R\ :sub:`4` R\ :sub:`3` R\ :sub:`2` R\ :sub:`1`
+R\ :sub:`0` G\ :sub:`5` G\ :sub:`4` G\ :sub:`3` G\ :sub:`2` G\ :sub:`1`
+G\ :sub:`0` B\ :sub:`4` B\ :sub:`3` B\ :sub:`2` B\ :sub:`1` B\ :sub:`0`], and
+stored in memory in two bytes, [R\ :sub:`4` R\ :sub:`3` R\ :sub:`2` R\ :sub:`1`
+R\ :sub:`0` G\ :sub:`5` G\ :sub:`4` G\ :sub:`3`] followed by [G\ :sub:`2`
+G\ :sub:`1` G\ :sub:`0` B\ :sub:`4` B\ :sub:`3` B\ :sub:`2` B\ :sub:`1`
+B\ :sub:`0`].
 
 .. raw:: latex
 
@@ -27,10 +77,10 @@ next to each other in memory.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 
-.. flat-table:: RGB Image Formats
+.. flat-table:: RGB Formats With 8 or 16 Bits Per Pixel
     :header-rows:  2
     :stub-columns: 0
 
@@ -38,8 +88,6 @@ next to each other in memory.
       - Code
       - :cspan:`7` Byte 0 in memory
       - :cspan:`7` Byte 1
-      - :cspan:`7` Byte 2
-      - :cspan:`7` Byte 3
     * -
       -
       - 7
@@ -59,24 +107,6 @@ next to each other in memory.
       - 2
       - 1
       - 0
-
-      - 7
-      - 6
-      - 5
-      - 4
-      - 3
-      - 2
-      - 1
-      - 0
-
-      - 7
-      - 6
-      - 5
-      - 4
-      - 3
-      - 2
-      - 1
-      - 0
     * .. _V4L2-PIX-FMT-RGB332:
 
       - ``V4L2_PIX_FMT_RGB332``
@@ -551,6 +581,82 @@ next to each other in memory.
       - b\ :sub:`1`
       - b\ :sub:`0`
       -
+
+.. raw:: latex
+
+    \endgroup
+
+
+24 or 32 Bits Per Pixel
+=======================
+
+These formats store an RGB triplet in three or four bytes. They are named based
+on the order of the RGB components as stored in memory, and on the total number
+of bits per pixel (with an exception for the BGR666 format). For instance,
+RGB24 format stores a pixel with [R\ :sub:`7` R\ :sub:`6` R\ :sub:`5`
+R\ :sub:`4` R\ :sub:`3` R\ :sub:`2` R\ :sub:`1` R\ :sub:`0`] in the first byte,
+[G\ :sub:`7` G\ :sub:`6` G\ :sub:`5` G\ :sub:`4` G\ :sub:`3` G\ :sub:`2`
+G\ :sub:`1` G\ :sub:`0`] in the second byte and [B\ :sub:`7` B\ :sub:`6`
+B\ :sub:`5` B\ :sub:`4` B\ :sub:`3` B\ :sub:`2` B\ :sub:`1` B\ :sub:`0`] in the
+third byte. This differs from the DRM format nomenclature that instead use the
+order of components as seen in a 24- or 32-bit little endian word.
+
+.. raw:: latex
+
+    \begingroup
+    \tiny
+    \setlength{\tabcolsep}{2pt}
+
+.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+
+
+.. flat-table:: RGB Formats With 24 or 32 Bits Per Pixel
+    :header-rows:  2
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      - :cspan:`7` Byte 0 in memory
+      - :cspan:`7` Byte 1
+      - :cspan:`7` Byte 2
+      - :cspan:`7` Byte 3
+    * -
+      -
+      - 7
+      - 6
+      - 5
+      - 4
+      - 3
+      - 2
+      - 1
+      - 0
+
+      - 7
+      - 6
+      - 5
+      - 4
+      - 3
+      - 2
+      - 1
+      - 0
+
+      - 7
+      - 6
+      - 5
+      - 4
+      - 3
+      - 2
+      - 1
+      - 0
+
+      - 7
+      - 6
+      - 5
+      - 4
+      - 3
+      - 2
+      - 1
+      - 0
     * .. _V4L2-PIX-FMT-BGR24:
 
       - ``V4L2_PIX_FMT_BGR24``
@@ -980,40 +1086,14 @@ next to each other in memory.
 
     \endgroup
 
-.. note:: Bit 7 is the most significant bit.
-
-The usage and value of the alpha bits (a) in the ARGB and ABGR formats
-(collectively referred to as alpha formats) depend on the device type
-and hardware operation. :ref:`Capture <capture>` devices (including
-capture queues of mem-to-mem devices) fill the alpha component in
-memory. When the device outputs an alpha channel the alpha component
-will have a meaningful value. Otherwise, when the device doesn't output
-an alpha channel but can set the alpha bit to a user-configurable value,
-the :ref:`V4L2_CID_ALPHA_COMPONENT <v4l2-alpha-component>` control
-is used to specify that alpha value, and the alpha component of all
-pixels will be set to the value specified by that control. Otherwise a
-corresponding format without an alpha component (XRGB or XBGR) must be
-used instead of an alpha format.
-
-:ref:`Output <output>` devices (including output queues of mem-to-mem
-devices and :ref:`video output overlay <osd>` devices) read the alpha
-component from memory. When the device processes the alpha channel the
-alpha component must be filled with meaningful values by applications.
-Otherwise a corresponding format without an alpha component (XRGB or
-XBGR) must be used instead of an alpha format.
-
-The XRGB and XBGR formats contain undefined bits (-). Applications,
-devices and drivers must ignore those bits, for both
-:ref:`capture` and :ref:`output` devices.
-
 
 Deprecated RGB Formats
 ======================
 
-Formats defined in :ref:`pixfmt-rgb-deprecated` are deprecated and
-must not be used by new drivers. They are documented here for reference.
-The meaning of their alpha bits ``(a)`` are ill-defined and interpreted as in
-either the corresponding ARGB or XRGB format, depending on the driver.
+Formats defined in :ref:`pixfmt-rgb-deprecated` are deprecated and must not be
+used by new drivers. They are documented here for reference. The meaning of
+their alpha bits ``(a)`` is ill-defined and they are interpreted as in either
+the corresponding ARGB or XRGB format, depending on the driver.
 
 .. raw:: latex
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index f4b66bfb859f..3f5f1cf8d1c0 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -520,7 +520,7 @@ struct v4l2_pix_format {
 
 /*      Pixel format         FOURCC                          depth  Description  */
 
-/* RGB formats */
+/* RGB formats (1 or 2 bytes per pixel) */
 #define V4L2_PIX_FMT_RGB332  v4l2_fourcc('R', 'G', 'B', '1') /*  8  RGB-3-3-2     */
 #define V4L2_PIX_FMT_RGB444  v4l2_fourcc('R', '4', '4', '4') /* 16  xxxxrrrr ggggbbbb */
 #define V4L2_PIX_FMT_ARGB444 v4l2_fourcc('A', 'R', '1', '2') /* 16  aaaarrrr ggggbbbb */
@@ -545,6 +545,8 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_ARGB555X v4l2_fourcc_be('A', 'R', '1', '5') /* 16  ARGB-5-5-5 BE */
 #define V4L2_PIX_FMT_XRGB555X v4l2_fourcc_be('X', 'R', '1', '5') /* 16  XRGB-5-5-5 BE */
 #define V4L2_PIX_FMT_RGB565X v4l2_fourcc('R', 'G', 'B', 'R') /* 16  RGB-5-6-5 BE  */
+
+/* RGB formats (3 or 4 bytes per pixel) */
 #define V4L2_PIX_FMT_BGR666  v4l2_fourcc('B', 'G', 'R', 'H') /* 18  BGR-6-6-6	  */
 #define V4L2_PIX_FMT_BGR24   v4l2_fourcc('B', 'G', 'R', '3') /* 24  BGR-8-8-8     */
 #define V4L2_PIX_FMT_RGB24   v4l2_fourcc('R', 'G', 'B', '3') /* 24  RGB-8-8-8     */
-- 
Regards,

Laurent Pinchart

