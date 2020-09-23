Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0029274F2D
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbgIWCoZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53034 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbgIWCoY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:24 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5D72148F;
        Wed, 23 Sep 2020 04:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829057;
        bh=UAnUnAWElrUtH7Z8ywMkrbLdn1ORKggrplCGC3tMGPQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PTt+Sol16ya1ZSuHura88TcewgwM9Ykxhr9w0cJvdJCvVwZNiz/DymCKCUH9Hqm1T
         kljSaxx4pv4MZa3cTObOqkQuhSIk61QUwrXC4sB83CpyIljHw9l2GZgoPuNuyirvN8
         tcwYsIxuH7BEDKf8IAL8A6nT34jP8u0stgR5b2Ck=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 10/16] media: doc: pixfmt-packed-yuv: Express 4:4:4 formats in a more compact way
Date:   Wed, 23 Sep 2020 05:43:27 +0300
Message-Id: <20200923024333.920-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 4:4:4 packed YUV formats are documented with a bit-level
representation, which creates a wide table. Switch to a byte-oriented
representation to make it more compact. This prepares for the addition
of formats with more than 8 bits per component, that would make the
table way too wide.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/pixfmt-packed-yuv.rst           | 273 ++++--------------
 1 file changed, 56 insertions(+), 217 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index c4ee8d5ac668..e378309d70f0 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -17,6 +17,14 @@ Similarly to the packed RGB formats, the packed YUV formats store the Y, Cb and
 Cr components consecutively in memory. They may apply subsampling to the chroma
 components and thus differ in how they interlave the three components.
 
+.. note::
+
+   - In all the tables that follow, bit 7 is the most significant bit in a byte.
+   - 'Y', 'Cb' and 'Cr' denote bits of the luma, blue chroma (also known as
+     'U') and red chroma (also known as 'V') components respectively. 'A'
+     denotes bits of the the alpha component (if supported by the format), and
+     '-' denotes padding bits.
+
 
 4:4:4 Subsampling
 =================
@@ -30,9 +38,9 @@ full triplet of Y, Cb and Cr values.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{2.5cm}|p{0.69cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|
+.. tabularcolumns:: |p{2.5cm}|p{0.69cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|
 
-.. flat-table:: Packed YUV 4:4:4 Image Formats
+.. flat-table:: Packed YUV 4:4:4 Image Formats (less than 8bpc)
     :header-rows:  2
     :stub-columns: 0
 
@@ -43,10 +51,6 @@ full triplet of Y, Cb and Cr values.
 
       - :cspan:`7` Byte 1
 
-      - :cspan:`7` Byte 2
-
-      - :cspan:`7` Byte 3
-
     * -
       -
       - 7
@@ -67,24 +71,6 @@ full triplet of Y, Cb and Cr values.
       - 1
       - 0
 
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
-
     * .. _V4L2-PIX-FMT-YUV444:
 
       - ``V4L2_PIX_FMT_YUV444``
@@ -108,8 +94,6 @@ full triplet of Y, Cb and Cr values.
       - Y'\ :sub:`1`
       - Y'\ :sub:`0`
 
-      -  :cspan:`15`
-
     * .. _V4L2-PIX-FMT-YUV555:
 
       - ``V4L2_PIX_FMT_YUV555``
@@ -133,7 +117,6 @@ full triplet of Y, Cb and Cr values.
       - Cb\ :sub:`4`
       - Cb\ :sub:`3`
 
-      -  :cspan:`15`
     * .. _V4L2-PIX-FMT-YUV565:
 
       - ``V4L2_PIX_FMT_YUV565``
@@ -157,229 +140,85 @@ full triplet of Y, Cb and Cr values.
       - Cb\ :sub:`4`
       - Cb\ :sub:`3`
 
-      -  :cspan:`15`
+.. raw:: latex
+
+    \endgroup
+
+.. note::
+
+    For the YUV444 and YUV555 formats, the value of alpha bits is undefined
+    when reading from the driver, ignored when writing to the driver, except
+    when alpha blending has been negotiated for a :ref:`Video Overlay
+    <overlay>` or :ref:`Video Output Overlay <osd>`.
+
+
+.. flat-table:: Packed YUV Image Formats (8bpc)
+    :header-rows: 1
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      - Byte 0
+      - Byte 1
+      - Byte 2
+      - Byte 3
 
     * .. _V4L2-PIX-FMT-YUV32:
 
       - ``V4L2_PIX_FMT_YUV32``
       - 'YUV4'
 
-      - a\ :sub:`7`
-      - a\ :sub:`6`
-      - a\ :sub:`5`
-      - a\ :sub:`4`
-      - a\ :sub:`3`
-      - a\ :sub:`2`
-      - a\ :sub:`1`
-      - a\ :sub:`0`
-
-      - Y'\ :sub:`7`
-      - Y'\ :sub:`6`
-      - Y'\ :sub:`5`
-      - Y'\ :sub:`4`
-      - Y'\ :sub:`3`
-      - Y'\ :sub:`2`
-      - Y'\ :sub:`1`
-      - Y'\ :sub:`0`
-
-      - Cb\ :sub:`7`
-      - Cb\ :sub:`6`
-      - Cb\ :sub:`5`
-      - Cb\ :sub:`4`
-      - Cb\ :sub:`3`
-      - Cb\ :sub:`2`
-      - Cb\ :sub:`1`
-      - Cb\ :sub:`0`
-
-      - Cr\ :sub:`7`
-      - Cr\ :sub:`6`
-      - Cr\ :sub:`5`
-      - Cr\ :sub:`4`
-      - Cr\ :sub:`3`
-      - Cr\ :sub:`2`
-      - Cr\ :sub:`1`
-      - Cr\ :sub:`0`
+      - A\ :sub:`7-0`
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Cr\ :sub:`7-0`
 
     * .. _V4L2-PIX-FMT-AYUV32:
 
       - ``V4L2_PIX_FMT_AYUV32``
       - 'AYUV'
 
-      - a\ :sub:`7`
-      - a\ :sub:`6`
-      - a\ :sub:`5`
-      - a\ :sub:`4`
-      - a\ :sub:`3`
-      - a\ :sub:`2`
-      - a\ :sub:`1`
-      - a\ :sub:`0`
-
-      - Y'\ :sub:`7`
-      - Y'\ :sub:`6`
-      - Y'\ :sub:`5`
-      - Y'\ :sub:`4`
-      - Y'\ :sub:`3`
-      - Y'\ :sub:`2`
-      - Y'\ :sub:`1`
-      - Y'\ :sub:`0`
-
-      - Cb\ :sub:`7`
-      - Cb\ :sub:`6`
-      - Cb\ :sub:`5`
-      - Cb\ :sub:`4`
-      - Cb\ :sub:`3`
-      - Cb\ :sub:`2`
-      - Cb\ :sub:`1`
-      - Cb\ :sub:`0`
-
-      - Cr\ :sub:`7`
-      - Cr\ :sub:`6`
-      - Cr\ :sub:`5`
-      - Cr\ :sub:`4`
-      - Cr\ :sub:`3`
-      - Cr\ :sub:`2`
-      - Cr\ :sub:`1`
-      - Cr\ :sub:`0`
+      - A\ :sub:`7-0`
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Cr\ :sub:`7-0`
 
     * .. _V4L2-PIX-FMT-XYUV32:
 
       - ``V4L2_PIX_FMT_XYUV32``
       - 'XYUV'
 
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-
-      - Y'\ :sub:`7`
-      - Y'\ :sub:`6`
-      - Y'\ :sub:`5`
-      - Y'\ :sub:`4`
-      - Y'\ :sub:`3`
-      - Y'\ :sub:`2`
-      - Y'\ :sub:`1`
-      - Y'\ :sub:`0`
-
-      - Cb\ :sub:`7`
-      - Cb\ :sub:`6`
-      - Cb\ :sub:`5`
-      - Cb\ :sub:`4`
-      - Cb\ :sub:`3`
-      - Cb\ :sub:`2`
-      - Cb\ :sub:`1`
-      - Cb\ :sub:`0`
-
-      - Cr\ :sub:`7`
-      - Cr\ :sub:`6`
-      - Cr\ :sub:`5`
-      - Cr\ :sub:`4`
-      - Cr\ :sub:`3`
-      - Cr\ :sub:`2`
-      - Cr\ :sub:`1`
-      - Cr\ :sub:`0`
+      - `-`\ :sub:`7-0`
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Cr\ :sub:`7-0`
 
     * .. _V4L2-PIX-FMT-VUYA32:
 
       - ``V4L2_PIX_FMT_VUYA32``
       - 'VUYA'
 
-      - Cr\ :sub:`7`
-      - Cr\ :sub:`6`
-      - Cr\ :sub:`5`
-      - Cr\ :sub:`4`
-      - Cr\ :sub:`3`
-      - Cr\ :sub:`2`
-      - Cr\ :sub:`1`
-      - Cr\ :sub:`0`
-
-      - Cb\ :sub:`7`
-      - Cb\ :sub:`6`
-      - Cb\ :sub:`5`
-      - Cb\ :sub:`4`
-      - Cb\ :sub:`3`
-      - Cb\ :sub:`2`
-      - Cb\ :sub:`1`
-      - Cb\ :sub:`0`
-
-      - Y'\ :sub:`7`
-      - Y'\ :sub:`6`
-      - Y'\ :sub:`5`
-      - Y'\ :sub:`4`
-      - Y'\ :sub:`3`
-      - Y'\ :sub:`2`
-      - Y'\ :sub:`1`
-      - Y'\ :sub:`0`
-
-      - a\ :sub:`7`
-      - a\ :sub:`6`
-      - a\ :sub:`5`
-      - a\ :sub:`4`
-      - a\ :sub:`3`
-      - a\ :sub:`2`
-      - a\ :sub:`1`
-      - a\ :sub:`0`
+      - Cr\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Y'\ :sub:`7-0`
+      - A\ :sub:`7-0`
 
     * .. _V4L2-PIX-FMT-VUYX32:
 
       - ``V4L2_PIX_FMT_VUYX32``
       - 'VUYX'
 
-      - Cr\ :sub:`7`
-      - Cr\ :sub:`6`
-      - Cr\ :sub:`5`
-      - Cr\ :sub:`4`
-      - Cr\ :sub:`3`
-      - Cr\ :sub:`2`
-      - Cr\ :sub:`1`
-      - Cr\ :sub:`0`
-
-      - Cb\ :sub:`7`
-      - Cb\ :sub:`6`
-      - Cb\ :sub:`5`
-      - Cb\ :sub:`4`
-      - Cb\ :sub:`3`
-      - Cb\ :sub:`2`
-      - Cb\ :sub:`1`
-      - Cb\ :sub:`0`
-
-      - Y'\ :sub:`7`
-      - Y'\ :sub:`6`
-      - Y'\ :sub:`5`
-      - Y'\ :sub:`4`
-      - Y'\ :sub:`3`
-      - Y'\ :sub:`2`
-      - Y'\ :sub:`1`
-      - Y'\ :sub:`0`
-
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-      - `-`
-
-.. raw:: latex
-
-    \endgroup
+      - Cr\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Y'\ :sub:`7-0`
+      - `-`\ :sub:`7-0`
 
 .. note::
 
-    #) Bit 7 is the most significant bit;
-
-    #) The value of a = alpha bits is undefined when reading from the driver,
-       ignored when writing to the driver, except when alpha blending has
-       been negotiated for a :ref:`Video Overlay <overlay>` or
-       :ref:`Video Output Overlay <osd>` for the formats Y444, YUV555 and
-       YUV4. However, for formats AYUV32 and VUYA32, the alpha component is
-       expected to contain a meaningful value that can be used by drivers
-       and applications. And, the formats XYUV32 and VUYX32 contain undefined
-       alpha values that must be ignored by all applications and drivers.
+    - The alpha component is expected to contain a meaningful value that can be
+      used by drivers and applications.
+    - The padding bits contain undefined values that must be ignored by all
+      applications and drivers.
 
 
 4:2:2 Subsampling
-- 
Regards,

Laurent Pinchart

