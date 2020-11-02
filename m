Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFDC2A36B9
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 23:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgKBWmN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 17:42:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42350 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgKBWmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 17:42:12 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CCBB1AAF;
        Mon,  2 Nov 2020 23:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604356922;
        bh=EvqpKkV3D4pk0+RNfF0JbTc4YD+SkIHtxf7y4XERnrs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AlvWWIfGQ7sSNmdcYv/T6dTbByDaRUu9t7Tgkh8jIhhgKPgohucWa8ZCjVV5fsONe
         tdyOR5WA+aF7cV8CbyVBFOIJ2c7qcXrqzCE5cKzzAzhWsSvk7u8xpi8PY3qcZkyzO7
         /vRx2gejISM4CBVsdG2ZkZdOf3gQpWFUDd+oXSd0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2 15/19] media: v4l2: Add 10-, 12- and 16-bpc BGR formats
Date:   Tue,  3 Nov 2020 00:40:58 +0200
Message-Id: <20201102224102.30292-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
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
Changes since v1:

- Interleave component names and number of bits
---
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 69 +++++++++++++++++++
 include/uapi/linux/videodev2.h                |  5 ++
 2 files changed, 74 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index 405d6f032078..846d307624fc 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -1079,6 +1079,75 @@ order of components as seen in a 24- or 32-bit little endian word.
     \endgroup
 
 
+More Than 8 Bits Per Component
+==============================
+
+These formats store an RGB triplet in four bytes or more. Similarly to the 8-
+and 16-bpp formats, they are named based on the order of the RGB components as
+seen in a word, which is then stored in memory in little endian byte order, and
+on the number of bits for each component. The component names and the
+corresponding number of bits are interleaved for clarity.
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
+    * .. _V4L2-PIX-FMT-X2B10G10R10:
+
+      - ``V4L2_PIX_FMT_X2B10G10R10``
+      - 'XB30'
+
+      - R\ :sub:`7-0`
+      - G\ :sub:`5-0` R\ :sub:`9-8`
+      - B\ :sub:`3-0` G\ :sub:`9-6`
+      - `-`\ :sub:`1-0` B\ :sub:`9-4`
+
+      -
+    * .. _V4L2-PIX-FMT-X4B12G12R12:
+
+      - ``V4L2_PIX_FMT_X4B12G12R12``
+      - 'XB36'
+
+      - R\ :sub:`7-0`
+      - G\ :sub:`3-0` R\ :sub:`11-8`
+      - G\ :sub:`11-4`
+      - B\ :sub:`7-0`
+      - `-`\ :sub:`3-0` B\ :sub:`11-8`
+
+      -
+    * .. _V4L2-PIX-FMT-B16G16R16:
+
+      - ``V4L2_PIX_FMT_B16G16R16``
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
index 54b9fe3b7636..fab1dbb1a618 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -558,6 +558,11 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_ARGB32  v4l2_fourcc('B', 'A', '2', '4') /* 32  ARGB-8-8-8-8  */
 #define V4L2_PIX_FMT_XRGB32  v4l2_fourcc('B', 'X', '2', '4') /* 32  XRGB-8-8-8-8  */
 
+/* RGB formats (more than 8 bits per component) */
+#define V4L2_PIX_FMT_X2B10G10R10 v4l2_fourcc('X', 'B', '3', '0') /* 32  XBGR-2-10-10-10 */
+#define V4L2_PIX_FMT_X4B12G12R12 v4l2_fourcc('X', 'B', '3', '6') /* 40  XBGR-4-12-12-12 */
+#define V4L2_PIX_FMT_B16G16R16 v4l2_fourcc('X', 'B', '4', '8') /* 48  BGR-16-16-16 */
+
 /* Grey formats */
 #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
 #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Greyscale     */
-- 
Regards,

Laurent Pinchart

