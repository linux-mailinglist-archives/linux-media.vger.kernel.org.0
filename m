Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2CAA2B504B
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 19:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgKPSwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 13:52:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51284 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728505AbgKPSwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 13:52:39 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FA7E1AAE;
        Mon, 16 Nov 2020 19:52:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605552746;
        bh=bG3fULcz6NvSVyC+QxL4/fZ0xFmxr9pMZlFOgjjDfrQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UKtfanCqSSFiym+Tn4ucCYoWpmoExcbD09qau3bWau5BxHRWJDaIW4I/yjRrPS4No
         ZZaIU9rSCt49WaZTx9lTKNIStlU1McMHjuU7NdLGHIwT9NXTjM+1VQWmNCzJxNo0V7
         12sJXwp/YpY1EA9SYASeoH4JxFNixdgJrP159KYA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v3 15/21] media: doc: pixfmt-yuv: Move all semi-planar YUV formats to common file
Date:   Mon, 16 Nov 2020 20:52:01 +0200
Message-Id: <20201116185207.13208-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201116185207.13208-1-laurent.pinchart@ideasonboard.com>
References: <20201116185207.13208-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Semi-planar pixel formats are documented in separate files. This
duplicates information, as those formats share comon traits. Consolidate
them in a single file and summarize their descriptions in a single
table.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-nv12.rst   |  76 ---
 .../userspace-api/media/v4l/pixfmt-nv12m.rst  |  88 ----
 .../userspace-api/media/v4l/pixfmt-nv12mt.rst |  60 ---
 .../userspace-api/media/v4l/pixfmt-nv16.rst   |  84 ----
 .../userspace-api/media/v4l/pixfmt-nv16m.rst  |  88 ----
 .../userspace-api/media/v4l/pixfmt-nv24.rst   |  95 ----
 .../media/v4l/pixfmt-yuv-planar.rst           | 463 ++++++++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst   |   7 +-
 8 files changed, 464 insertions(+), 497 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv24.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
deleted file mode 100644
index 692117bf83ad..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
+++ /dev/null
@@ -1,76 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-NV12:
-.. _V4L2-PIX-FMT-NV21:
-
-******************************************************
-V4L2_PIX_FMT_NV12 ('NV12'), V4L2_PIX_FMT_NV21 ('NV21')
-******************************************************
-
-
-V4L2_PIX_FMT_NV21
-Formats with ½ horizontal and vertical chroma resolution, also known as
-YUV 4:2:0. One luminance and one chrominance plane with alternating
-chroma samples as opposed to ``V4L2_PIX_FMT_YVU420``
-
-
-Description
-===========
-
-These are two-plane versions of the YUV 4:2:0 format. The three
-components are separated into two sub-images or planes. The Y plane is
-first. The Y plane has one byte per pixel. For ``V4L2_PIX_FMT_NV12``, a
-combined CbCr plane immediately follows the Y plane in memory. The CbCr
-plane is the same width, in bytes, as the Y plane (and of the image),
-but is half as tall in pixels. Each CbCr pair belongs to four pixels.
-For example, Cb\ :sub:`0`/Cr\ :sub:`0` belongs to Y'\ :sub:`00`,
-Y'\ :sub:`01`, Y'\ :sub:`10`, Y'\ :sub:`11`. ``V4L2_PIX_FMT_NV21`` is
-the same except the Cb and Cr bytes are swapped, the CrCb plane starts
-with a Cr byte.
-
-If the Y plane has pad bytes after each row, then the CbCr plane has as
-many pad bytes after its rows.
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
-      - Cr\ :sub:`00`
-      - Cb\ :sub:`01`
-      - Cr\ :sub:`01`
-    * - start + 20:
-      - Cb\ :sub:`10`
-      - Cr\ :sub:`10`
-      - Cb\ :sub:`11`
-      - Cr\ :sub:`11`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
deleted file mode 100644
index 002b361d5a9b..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
+++ /dev/null
@@ -1,88 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-NV12M:
-.. _v4l2-pix-fmt-nv12mt-16x16:
-.. _V4L2-PIX-FMT-NV21M:
-
-***********************************************************************************
-V4L2_PIX_FMT_NV12M ('NM12'), V4L2_PIX_FMT_NV21M ('NM21'), V4L2_PIX_FMT_NV12MT_16X16
-***********************************************************************************
-
-
-V4L2_PIX_FMT_NV21M
-V4L2_PIX_FMT_NV12MT_16X16
-Variation of ``V4L2_PIX_FMT_NV12`` and ``V4L2_PIX_FMT_NV21`` with planes
-non contiguous in memory.
-
-
-Description
-===========
-
-This is a multi-planar, two-plane version of the YUV 4:2:0 format. The
-three components are separated into two sub-images or planes.
-``V4L2_PIX_FMT_NV12M`` differs from ``V4L2_PIX_FMT_NV12`` in that the
-two planes are non-contiguous in memory, i.e. the chroma plane do not
-necessarily immediately follows the luma plane. The luminance data
-occupies the first plane. The Y plane has one byte per pixel. In the
-second plane there is a chrominance data with alternating chroma
-samples. The CbCr plane is the same width, in bytes, as the Y plane (and
-of the image), but is half as tall in pixels. Each CbCr pair belongs to
-four pixels. For example, Cb\ :sub:`0`/Cr\ :sub:`0` belongs to
-Y'\ :sub:`00`, Y'\ :sub:`01`, Y'\ :sub:`10`, Y'\ :sub:`11`.
-``V4L2_PIX_FMT_NV12MT_16X16`` is the tiled version of
-``V4L2_PIX_FMT_NV12M`` with 16x16 macroblock tiles. Here pixels are
-arranged in 16x16 2D tiles and tiles are arranged in linear order in
-memory. ``V4L2_PIX_FMT_NV21M`` is the same as ``V4L2_PIX_FMT_NV12M``
-except the Cb and Cr bytes are swapped, the CrCb plane starts with a Cr
-byte.
-
-``V4L2_PIX_FMT_NV12M`` is intended to be used only in drivers and
-applications that support the multi-planar API, described in
-:ref:`planar-apis`.
-
-If the Y plane has pad bytes after each row, then the CbCr plane has as
-many pad bytes after its rows.
-
-**Byte Order.**
-Each cell is one byte.
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
-      - Cr\ :sub:`00`
-      - Cb\ :sub:`01`
-      - Cr\ :sub:`01`
-    * - start1 + 4:
-      - Cb\ :sub:`10`
-      - Cr\ :sub:`10`
-      - Cb\ :sub:`11`
-      - Cr\ :sub:`11`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally and vertically.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst
deleted file mode 100644
index 46f63d793ec5..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst
+++ /dev/null
@@ -1,60 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-NV12MT:
-
-****************************
-V4L2_PIX_FMT_NV12MT ('TM12')
-****************************
-
-Formats with ½ horizontal and vertical chroma resolution. This format
-has two planes - one for luminance and one for chrominance. Chroma
-samples are interleaved. The difference to ``V4L2_PIX_FMT_NV12`` is the
-memory layout. Pixels are grouped in macroblocks of 64x32 size. The
-order of macroblocks in memory is also not standard.
-
-
-Description
-===========
-
-This is the two-plane versions of the YUV 4:2:0 format where data is
-grouped into 64x32 macroblocks. The three components are separated into
-two sub-images or planes. The Y plane has one byte per pixel and pixels
-are grouped into 64x32 macroblocks. The CbCr plane has the same width,
-in bytes, as the Y plane (and the image), but is half as tall in pixels.
-The chroma plane is also grouped into 64x32 macroblocks.
-
-Width of the buffer has to be aligned to the multiple of 128, and height
-alignment is 32. Every four adjacent buffers - two horizontally and two
-vertically are grouped together and are located in memory in Z or
-flipped Z order.
-
-Layout of macroblocks in memory is presented in the following figure.
-
-
-.. _nv12mt:
-
-.. kernel-figure:: nv12mt.svg
-    :alt:    nv12mt.svg
-    :align:  center
-
-    V4L2_PIX_FMT_NV12MT macroblock Z shape memory layout
-
-The requirement that width is multiple of 128 is implemented because,
-the Z shape cannot be cut in half horizontally. In case the vertical
-resolution of macroblocks is odd then the last row of macroblocks is
-arranged in a linear order.
-
-In case of chroma the layout is identical. Cb and Cr samples are
-interleaved. Height of the buffer is aligned to 32.
-
-
-.. _nv12mt_ex:
-
-.. kernel-figure:: nv12mt_example.svg
-    :alt:    nv12mt_example.svg
-    :align:  center
-
-    Example V4L2_PIX_FMT_NV12MT memory layout of macroblocks
-
-Memory layout of macroblocks of ``V4L2_PIX_FMT_NV12MT`` format in most
-extreme case.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
deleted file mode 100644
index e6307843d848..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
+++ /dev/null
@@ -1,84 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-NV16:
-.. _V4L2-PIX-FMT-NV61:
-
-******************************************************
-V4L2_PIX_FMT_NV16 ('NV16'), V4L2_PIX_FMT_NV61 ('NV61')
-******************************************************
-
-V4L2_PIX_FMT_NV61
-Formats with ½ horizontal chroma resolution, also known as YUV 4:2:2.
-One luminance and one chrominance plane with alternating chroma samples
-as opposed to ``V4L2_PIX_FMT_YVU420``
-
-
-Description
-===========
-
-These are two-plane versions of the YUV 4:2:2 format. The three
-components are separated into two sub-images or planes. The Y plane is
-first. The Y plane has one byte per pixel. For ``V4L2_PIX_FMT_NV16``, a
-combined CbCr plane immediately follows the Y plane in memory. The CbCr
-plane is the same width and height, in bytes, as the Y plane (and of the
-image). Each CbCr pair belongs to two pixels. For example,
-Cb\ :sub:`0`/Cr\ :sub:`0` belongs to Y'\ :sub:`00`, Y'\ :sub:`01`.
-``V4L2_PIX_FMT_NV61`` is the same except the Cb and Cr bytes are
-swapped, the CrCb plane starts with a Cr byte.
-
-If the Y plane has pad bytes after each row, then the CbCr plane has as
-many pad bytes after its rows.
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
-      - Cr\ :sub:`00`
-      - Cb\ :sub:`01`
-      - Cr\ :sub:`01`
-    * - start + 20:
-      - Cb\ :sub:`10`
-      - Cr\ :sub:`10`
-      - Cb\ :sub:`11`
-      - Cr\ :sub:`11`
-    * - start + 24:
-      - Cb\ :sub:`20`
-      - Cr\ :sub:`20`
-      - Cb\ :sub:`21`
-      - Cr\ :sub:`21`
-    * - start + 28:
-      - Cb\ :sub:`30`
-      - Cr\ :sub:`30`
-      - Cb\ :sub:`31`
-      - Cr\ :sub:`31`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
deleted file mode 100644
index 58e97205d41f..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
+++ /dev/null
@@ -1,88 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-NV16M:
-.. _v4l2-pix-fmt-nv61m:
-
-********************************************************
-V4L2_PIX_FMT_NV16M ('NM16'), V4L2_PIX_FMT_NV61M ('NM61')
-********************************************************
-
-V4L2_PIX_FMT_NV61M
-Variation of ``V4L2_PIX_FMT_NV16`` and ``V4L2_PIX_FMT_NV61`` with planes
-non contiguous in memory.
-
-
-Description
-===========
-
-This is a multi-planar, two-plane version of the YUV 4:2:2 format. The
-three components are separated into two sub-images or planes.
-``V4L2_PIX_FMT_NV16M`` differs from ``V4L2_PIX_FMT_NV16`` in that the
-two planes are non-contiguous in memory, i.e. the chroma plane does not
-necessarily immediately follow the luma plane. The luminance data
-occupies the first plane. The Y plane has one byte per pixel. In the
-second plane there is chrominance data with alternating chroma samples.
-The CbCr plane is the same width and height, in bytes, as the Y plane.
-Each CbCr pair belongs to two pixels. For example,
-Cb\ :sub:`0`/Cr\ :sub:`0` belongs to Y'\ :sub:`00`, Y'\ :sub:`01`.
-``V4L2_PIX_FMT_NV61M`` is the same as ``V4L2_PIX_FMT_NV16M`` except the
-Cb and Cr bytes are swapped, the CrCb plane starts with a Cr byte.
-
-``V4L2_PIX_FMT_NV16M`` and ``V4L2_PIX_FMT_NV61M`` are intended to be
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
-      - Cr\ :sub:`00`
-      - Cb\ :sub:`02`
-      - Cr\ :sub:`02`
-    * - start1 + 4:
-      - Cb\ :sub:`10`
-      - Cr\ :sub:`10`
-      - Cb\ :sub:`12`
-      - Cr\ :sub:`12`
-    * - start1 + 8:
-      - Cb\ :sub:`20`
-      - Cr\ :sub:`20`
-      - Cb\ :sub:`22`
-      - Cr\ :sub:`22`
-    * - start1 + 12:
-      - Cb\ :sub:`30`
-      - Cr\ :sub:`30`
-      - Cb\ :sub:`32`
-      - Cr\ :sub:`32`
-
-
-**Color Sample Location:**
-Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
-horizontally.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv24.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv24.rst
deleted file mode 100644
index bf1b94062fc2..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-nv24.rst
+++ /dev/null
@@ -1,95 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _V4L2-PIX-FMT-NV24:
-.. _V4L2-PIX-FMT-NV42:
-
-******************************************************
-V4L2_PIX_FMT_NV24 ('NV24'), V4L2_PIX_FMT_NV42 ('NV42')
-******************************************************
-
-V4L2_PIX_FMT_NV42
-Formats with full horizontal and vertical chroma resolutions, also known
-as YUV 4:4:4. One luminance and one chrominance plane with alternating
-chroma samples as opposed to ``V4L2_PIX_FMT_YVU420``
-
-
-Description
-===========
-
-These are two-plane versions of the YUV 4:4:4 format. The three
-components are separated into two sub-images or planes. The Y plane is
-first, with each Y sample stored in one byte per pixel. For
-``V4L2_PIX_FMT_NV24``, a combined CbCr plane immediately follows the Y
-plane in memory. The CbCr plane has the same width and height, in
-pixels, as the Y plane (and the image). Each line contains one CbCr pair
-per pixel, with each Cb and Cr sample stored in one byte.
-``V4L2_PIX_FMT_NV42`` is the same except that the Cb and Cr samples are
-swapped, the CrCb plane starts with a Cr sample.
-
-If the Y plane has pad bytes after each row, then the CbCr plane has
-twice as many pad bytes after its rows.
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
-      - Cr\ :sub:`00`
-      - Cb\ :sub:`01`
-      - Cr\ :sub:`01`
-      - Cb\ :sub:`02`
-      - Cr\ :sub:`02`
-      - Cb\ :sub:`03`
-      - Cr\ :sub:`03`
-    * - start + 24:
-      - Cb\ :sub:`10`
-      - Cr\ :sub:`10`
-      - Cb\ :sub:`11`
-      - Cr\ :sub:`11`
-      - Cb\ :sub:`12`
-      - Cr\ :sub:`12`
-      - Cb\ :sub:`13`
-      - Cr\ :sub:`13`
-    * - start + 32:
-      - Cb\ :sub:`20`
-      - Cr\ :sub:`20`
-      - Cb\ :sub:`21`
-      - Cr\ :sub:`21`
-      - Cb\ :sub:`22`
-      - Cr\ :sub:`22`
-      - Cb\ :sub:`23`
-      - Cr\ :sub:`23`
-    * - start + 40:
-      - Cb\ :sub:`30`
-      - Cr\ :sub:`30`
-      - Cb\ :sub:`31`
-      - Cr\ :sub:`31`
-      - Cb\ :sub:`32`
-      - Cr\ :sub:`32`
-      - Cb\ :sub:`33`
-      - Cr\ :sub:`33`
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
new file mode 100644
index 000000000000..0ca01270bde5
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -0,0 +1,463 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. planar-yuv:
+
+******************
+Planar YUV formats
+******************
+
+Planar formats split luma and chroma data in separate memory regions. They
+exist in two variants:
+
+- Semi-planar formats use two planes. The first plane is the luma plane and
+  stores the Y components. The second plane is the chroma plane and stores the
+  Cb and Cr components interleaved.
+
+- Fully planar formats use three planes to store the Y, Cb and Cr components
+  separately.
+
+Within a plane, components are stored in pixel order, which may be linear or
+tiled. Padding may be supported at the end of the lines, and the line stride of
+the chroma planes may be constrained by the line stride of the luma plane.
+
+Some planar formats allow planes to be placed in independent memory locations.
+They are identified by an 'M' suffix in their name (such as in
+``V4L2_PIX_FMT_NV12M``). Those formats are intended to be used only in drivers
+and applications that support the multi-planar API, described in
+:ref:`planar-apis`. Unless explicitly documented as supporting non-contiguous
+planes, formats require the planes to follow each other immediately in memory.
+
+
+Semi-Planar YUV Formats
+=======================
+
+These formats are commonly referred to as NV formats (NV12, NV16, ...). They
+use two planes, and store the luma components in the first plane and the chroma
+components in the second plane. The Cb and Cr components are interleaved in the
+chroma plane, with Cb and Cr always stored in pairs. The chroma order is
+exposed as different formats.
+
+For memory contiguous formats, the number of padding pixels at the end of the
+chroma lines is identical to the padding of the luma lines. Without horizontal
+subsampling, the chroma line stride (in bytes) is thus equal to twice the luma
+line stride. With horizontal subsampling by 2, the chroma line stride is equal
+to the luma line stride. Vertical subsampling doesn't affect the line stride.
+
+For non-contiguous formats, no constraints are enforced by the format on the
+relationship between the luma and chroma line padding and stride.
+
+All components are stored with the same number of bits per component.
+
+.. flat-table:: Overview of Semi-Planar YUV Formats
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      - Bits per component
+      - Subsampling
+      - Chroma order [1]_
+      - Contiguous [2]_
+      - Tiling [3]_
+    * - V4L2_PIX_FMT_NV12
+      - 'NV12'
+      - 8
+      - 4:2:0
+      - Cb, Cr
+      - Yes
+      - Linear
+    * - V4L2_PIX_FMT_NV21
+      - 'NV21'
+      - 8
+      - 4:2:0
+      - Cr, Cr
+      - Yes
+      - Linear
+    * - V4L2_PIX_FMT_NV12M
+      - 'NM12'
+      - 8
+      - 4:2:0
+      - Cb, Cr
+      - No
+      - Linear
+    * - V4L2_PIX_FMT_NV21M
+      - 'NM21'
+      - 8
+      - 4:2:0
+      - Cr, Cr
+      - No
+      - Linear
+    * - V4L2_PIX_FMT_NV12MT
+      - 'TM12'
+      - 8
+      - 4:2:0
+      - Cb, Cr
+      - No
+      - 64x32 macroblocks
+
+        Horizontal Z order
+    * - V4L2_PIX_FMT_NV12MT_16X16
+      - 'VM12'
+      - 8
+      - 4:2:2
+      - Cb, Cr
+      - No
+      - 16x16 macroblocks
+    * - V4L2_PIX_FMT_NV16
+      - 'NV16'
+      - 8
+      - 4:2:2
+      - Cb, Cr
+      - Yes
+      - Linear
+    * - V4L2_PIX_FMT_NV61
+      - 'NV61'
+      - 8
+      - 4:2:2
+      - Cr, Cr
+      - Yes
+      - Linear
+    * - V4L2_PIX_FMT_NV16M
+      - 'NM16'
+      - 8
+      - 4:2:2
+      - Cb, Cr
+      - No
+      - Linear
+    * - V4L2_PIX_FMT_NV61M
+      - 'NM61'
+      - 8
+      - 4:2:2
+      - Cr, Cr
+      - No
+      - Linear
+    * - V4L2_PIX_FMT_NV24
+      - 'NV24'
+      - 8
+      - 4:4:4
+      - Cb, Cr
+      - Yes
+      - Linear
+    * - V4L2_PIX_FMT_NV42
+      - 'NV42'
+      - 8
+      - 4:4:4
+      - Cr, Cr
+      - Yes
+      - Linear
+
+.. note::
+
+   .. [1] Order of chroma samples in the second plane
+   .. [2] Indicates if planes have to be contiguous in memory or can be
+      disjoint
+   .. [3] Macroblock size in pixels
+
+
+**Color Sample Location:**
+Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
+horizontally.
+
+
+.. _V4L2-PIX-FMT-NV12:
+.. _V4L2-PIX-FMT-NV21:
+.. _V4L2-PIX-FMT-NV12M:
+.. _V4L2-PIX-FMT-NV21M:
+
+NV12, NV21, NV12M and NV21M
+---------------------------
+
+Semi-planar YUV 4:2:0 formats. The chroma plane is subsampled by 2 in each
+direction. Chroma lines contain half the number of pixels and the same number
+of bytes as luma lines, and the chroma plane contains half the number of lines
+of the luma plane.
+
+.. flat-table:: Sample 4x4 NV12 Image
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
+      - Cr\ :sub:`00`
+      - Cb\ :sub:`01`
+      - Cr\ :sub:`01`
+    * - start + 20:
+      - Cb\ :sub:`10`
+      - Cr\ :sub:`10`
+      - Cb\ :sub:`11`
+      - Cr\ :sub:`11`
+
+.. flat-table:: Sample 4x4 NV12M Image
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
+      - Cr\ :sub:`00`
+      - Cb\ :sub:`01`
+      - Cr\ :sub:`01`
+    * - start1 + 4:
+      - Cb\ :sub:`10`
+      - Cr\ :sub:`10`
+      - Cb\ :sub:`11`
+      - Cr\ :sub:`11`
+
+
+.. _V4L2-PIX-FMT-NV12MT:
+.. _V4L2-PIX-FMT-NV12MT-16X16:
+
+NV12MT and MV12MT_16X16
+-----------------------
+
+Semi-planar YUV 4:2:0 formats, using macroblock tiling. The chroma plane is
+subsampled by 2 in each direction. Chroma lines contain half the number of
+pixels and the same number of bytes as luma lines, and the chroma plane
+contains half the number of lines of the luma plane.
+
+``V4L2_PIX_FMT_NV12MT_16X16`` stores pixel in 2D 16x16 macroblocks, and stores
+macroblocks linearly in memory. The line stride and image height must be
+aligned to a multiple of 16. The layouts of the luma and chroma planes are
+identical.
+
+``V4L2_PIX_FMT_NV12MT`` stores pixels in 2D 64x32 macroblocks, and stores 2x2
+groups of macroblocks in Z-order in memory, alternating Z and mirrored Z shapes
+horizontally.  The line stride must be a multiple of 128 pixels to ensure an
+integer number of Z shapes. The image height must be a multiple of 32 pixels.
+If the vertical resolution is an odd number of macroblocks, the last row of
+macroblocks is stored in linear order. The layouts of the luma and chroma
+planes are identical.
+
+.. _nv12mt:
+
+.. kernel-figure:: nv12mt.svg
+    :alt:    nv12mt.svg
+    :align:  center
+
+    V4L2_PIX_FMT_NV12MT macroblock Z shape memory layout
+
+.. _nv12mt_ex:
+
+.. kernel-figure:: nv12mt_example.svg
+    :alt:    nv12mt_example.svg
+    :align:  center
+
+    Example V4L2_PIX_FMT_NV12MT memory layout of macroblocks
+
+
+.. _V4L2-PIX-FMT-NV16:
+.. _V4L2-PIX-FMT-NV61:
+.. _V4L2-PIX-FMT-NV16M:
+.. _V4L2-PIX-FMT-NV61M:
+
+NV16, NV61, NV16M and NV61M
+---------------------------
+
+Semi-planar YUV 4:2:2 formats. The chroma plane is subsampled by 2 in the
+horizontal direction. Chroma lines contain half the number of pixels and the
+same number of bytes as luma lines, and the chroma plane contains the same
+number of lines as the luma plane.
+
+.. flat-table:: Sample 4x4 NV16 Image
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
+      - Cr\ :sub:`00`
+      - Cb\ :sub:`01`
+      - Cr\ :sub:`01`
+    * - start + 20:
+      - Cb\ :sub:`10`
+      - Cr\ :sub:`10`
+      - Cb\ :sub:`11`
+      - Cr\ :sub:`11`
+    * - start + 24:
+      - Cb\ :sub:`20`
+      - Cr\ :sub:`20`
+      - Cb\ :sub:`21`
+      - Cr\ :sub:`21`
+    * - start + 28:
+      - Cb\ :sub:`30`
+      - Cr\ :sub:`30`
+      - Cb\ :sub:`31`
+      - Cr\ :sub:`31`
+
+.. flat-table:: Sample 4x4 NV16M Image
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
+      - Cr\ :sub:`00`
+      - Cb\ :sub:`02`
+      - Cr\ :sub:`02`
+    * - start1 + 4:
+      - Cb\ :sub:`10`
+      - Cr\ :sub:`10`
+      - Cb\ :sub:`12`
+      - Cr\ :sub:`12`
+    * - start1 + 8:
+      - Cb\ :sub:`20`
+      - Cr\ :sub:`20`
+      - Cb\ :sub:`22`
+      - Cr\ :sub:`22`
+    * - start1 + 12:
+      - Cb\ :sub:`30`
+      - Cr\ :sub:`30`
+      - Cb\ :sub:`32`
+      - Cr\ :sub:`32`
+
+
+.. _V4L2-PIX-FMT-NV24:
+.. _V4L2-PIX-FMT-NV42:
+
+NV24 and NV42
+-------------
+
+Semi-planar YUV 4:4:4 formats. The chroma plane is subsampled by 2 in the
+horizontal direction. Chroma lines contain half the number of pixels and the
+same number of bytes as luma lines, and the chroma plane contains the same
+number of lines as the luma plane.
+
+.. flat-table:: Sample 4x4 NV24 Image
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
+      - Cr\ :sub:`00`
+      - Cb\ :sub:`01`
+      - Cr\ :sub:`01`
+      - Cb\ :sub:`02`
+      - Cr\ :sub:`02`
+      - Cb\ :sub:`03`
+      - Cr\ :sub:`03`
+    * - start + 24:
+      - Cb\ :sub:`10`
+      - Cr\ :sub:`10`
+      - Cb\ :sub:`11`
+      - Cr\ :sub:`11`
+      - Cb\ :sub:`12`
+      - Cr\ :sub:`12`
+      - Cb\ :sub:`13`
+      - Cr\ :sub:`13`
+    * - start + 32:
+      - Cb\ :sub:`20`
+      - Cr\ :sub:`20`
+      - Cb\ :sub:`21`
+      - Cr\ :sub:`21`
+      - Cb\ :sub:`22`
+      - Cr\ :sub:`22`
+      - Cb\ :sub:`23`
+      - Cr\ :sub:`23`
+    * - start + 40:
+      - Cb\ :sub:`30`
+      - Cr\ :sub:`30`
+      - Cb\ :sub:`31`
+      - Cr\ :sub:`31`
+      - Cb\ :sub:`32`
+      - Cr\ :sub:`32`
+      - Cb\ :sub:`33`
+      - Cr\ :sub:`33`
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
index 7179d715f8a7..517499056f3b 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -265,6 +265,7 @@ image.
     :maxdepth: 1
 
     pixfmt-packed-yuv
+    pixfmt-yuv-planar
     pixfmt-yuv-luma
     pixfmt-y8i
     pixfmt-y12i
@@ -276,10 +277,4 @@ image.
     pixfmt-yuv410
     pixfmt-yuv422p
     pixfmt-yuv411p
-    pixfmt-nv12
-    pixfmt-nv12m
-    pixfmt-nv12mt
-    pixfmt-nv16
-    pixfmt-nv16m
-    pixfmt-nv24
     pixfmt-m420
-- 
Regards,

Laurent Pinchart

