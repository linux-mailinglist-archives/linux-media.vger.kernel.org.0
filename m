Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8A52B504C
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 19:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgKPSwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 13:52:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51284 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728505AbgKPSwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 13:52:41 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98FF5A1B;
        Mon, 16 Nov 2020 19:52:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605552749;
        bh=UXzxN+wVycubxVSx9Cy/IIuUWrWyNtRIX0Xg8QaadxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d7ezO8rINH02zhabRQDgpd8pql6l8KH6jedAJ6hLm660vAI+fQRybL3bfc7NvILCj
         67ZWJEteOZtP0nRrWMyJB1q2v2dwImYkKViG7MmNNiaCrL0psmdWL+AwlBd2exLF0b
         h8LgaMX7uf6ECJK2uo2Ckg14yM9ZNulHFphyZ7PU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v3 17/21] media: v4l2: Add 10-, 12- and 16-bpc BGR formats
Date:   Mon, 16 Nov 2020 20:52:03 +0200
Message-Id: <20201116185207.13208-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201116185207.13208-1-laurent.pinchart@ideasonboard.com>
References: <20201116185207.13208-1-laurent.pinchart@ideasonboard.com>
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
Changes since v2:

- Fix table header
- Use 'X' instead of '-' for padding bits

Changes since v1:

- Interleave component names and number of bits
---
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 70 +++++++++++++++++++
 include/uapi/linux/videodev2.h                |  5 ++
 2 files changed, 75 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index 897676ee2c9d..f1851657d390 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -768,6 +768,76 @@ nomenclature that instead use the order of components as seen in a 24- or
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
+    :header-rows:  1
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
+      - X\ :sub:`1-0` B\ :sub:`9-4`
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
+      - X\ :sub:`3-0` B\ :sub:`11-8`
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

