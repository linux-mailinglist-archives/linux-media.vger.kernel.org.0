Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4DD274F30
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbgIWCo2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53034 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbgIWCo2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:28 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E65A9555;
        Wed, 23 Sep 2020 04:44:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829058;
        bh=KLYeZc3shvwMRsCv2a9ROhOiKz4WYkk7sMMQznTmzUU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XCp3UXb4cnSIVTquu2Ki7EIESh0DO0dZQu6FO3NX5tn5jw+k/SxJeGvUClS5U76hx
         dZOBqd6NgxHEVMjYvbIhTm9dPKrp8/9UtRzmMZ4q00ByydJjFkcDhhBLP9/BHBxFw7
         ixekxrcS8eWzyyWwJUpl8hoUG0LNJr6866ijYjRs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 12/16] media: doc: pixfmt-yuv: Move all luma-only YUV formats to common file
Date:   Wed, 23 Sep 2020 05:43:29 +0300
Message-Id: <20200923024333.920-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Luma-only pixel formats are documented in separate files. This
duplicates information, as those formats share comon traits. Consolidate
them in a single file and describe them in a single table.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-grey.rst   |  51 -------
 .../userspace-api/media/v4l/pixfmt-y10.rst    |  72 ----------
 .../userspace-api/media/v4l/pixfmt-y10b.rst   |  40 ------
 .../userspace-api/media/v4l/pixfmt-y10p.rst   |  50 -------
 .../userspace-api/media/v4l/pixfmt-y12.rst    |  72 ----------
 .../userspace-api/media/v4l/pixfmt-y14.rst    |  72 ----------
 .../userspace-api/media/v4l/pixfmt-y16-be.rst |  76 ----------
 .../userspace-api/media/v4l/pixfmt-y16.rst    |  76 ----------
 .../media/v4l/pixfmt-yuv-luma.rst             | 133 ++++++++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst   |   9 +-
 10 files changed, 134 insertions(+), 517 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-grey.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y14.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-grey.rst b/Documentation/userspace-api/media/v4l/pixfmt-grey.rst
deleted file mode 100644
index 7b03db3393be..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-grey.rst
+++ /dev/null
@@ -1,51 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-GREY:
-
-**************************
-V4L2_PIX_FMT_GREY ('GREY')
-**************************
-
-Grey-scale image
-
-
-Description
-===========
-
-This is a grey-scale image. It is really a degenerate Y'CbCr format
-which simply contains no Cb or Cr data.
-
-**Byte Order.**
-Each cell is one byte.
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
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y10.rst b/Documentation/userspace-api/media/v4l/pixfmt-y10.rst
deleted file mode 100644
index dfb352ae6784..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-y10.rst
+++ /dev/null
@@ -1,72 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-Y10:
-
-*************************
-V4L2_PIX_FMT_Y10 ('Y10 ')
-*************************
-
-
-Grey-scale image
-
-
-Description
-===========
-
-This is a grey-scale image with a depth of 10 bits per pixel. Pixels are
-stored in 16-bit words with unused high bits padded with 0. The least
-significant byte is stored at lower memory addresses (little-endian).
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
-      - Y'\ :sub:`00low`
-      - Y'\ :sub:`00high`
-      - Y'\ :sub:`01low`
-      - Y'\ :sub:`01high`
-      - Y'\ :sub:`02low`
-      - Y'\ :sub:`02high`
-      - Y'\ :sub:`03low`
-      - Y'\ :sub:`03high`
-    * - start + 8:
-      - Y'\ :sub:`10low`
-      - Y'\ :sub:`10high`
-      - Y'\ :sub:`11low`
-      - Y'\ :sub:`11high`
-      - Y'\ :sub:`12low`
-      - Y'\ :sub:`12high`
-      - Y'\ :sub:`13low`
-      - Y'\ :sub:`13high`
-    * - start + 16:
-      - Y'\ :sub:`20low`
-      - Y'\ :sub:`20high`
-      - Y'\ :sub:`21low`
-      - Y'\ :sub:`21high`
-      - Y'\ :sub:`22low`
-      - Y'\ :sub:`22high`
-      - Y'\ :sub:`23low`
-      - Y'\ :sub:`23high`
-    * - start + 24:
-      - Y'\ :sub:`30low`
-      - Y'\ :sub:`30high`
-      - Y'\ :sub:`31low`
-      - Y'\ :sub:`31high`
-      - Y'\ :sub:`32low`
-      - Y'\ :sub:`32high`
-      - Y'\ :sub:`33low`
-      - Y'\ :sub:`33high`
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y10b.rst b/Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
deleted file mode 100644
index b5d89d6d5c52..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
+++ /dev/null
@@ -1,40 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-Y10BPACK:
-
-******************************
-V4L2_PIX_FMT_Y10BPACK ('Y10B')
-******************************
-
-Grey-scale image as a bit-packed array
-
-
-Description
-===========
-
-This is a packed grey-scale image format with a depth of 10 bits per
-pixel. Pixels are stored in a bit-packed array of 10bit bits per pixel,
-with no padding between them and with the most significant bits coming
-first from the left.
-
-**Bit-packed representation.**
-
-pixels cross the byte boundary and have a ratio of 5 bytes for each 4
-pixels.
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    * - Y'\ :sub:`00[9:2]`
-      - Y'\ :sub:`00[1:0]`\ Y'\ :sub:`01[9:4]`
-      - Y'\ :sub:`01[3:0]`\ Y'\ :sub:`02[9:6]`
-      - Y'\ :sub:`02[5:0]`\ Y'\ :sub:`03[9:8]`
-      - Y'\ :sub:`03[7:0]`
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y10p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
deleted file mode 100644
index ffb6e1631b78..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
+++ /dev/null
@@ -1,50 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-Y10P:
-
-******************************
-V4L2_PIX_FMT_Y10P ('Y10P')
-******************************
-
-Grey-scale image as a MIPI RAW10 packed array
-
-
-Description
-===========
-
-This is a packed grey-scale image format with a depth of 10 bits per
-pixel. Every four consecutive pixels are packed into 5 bytes. Each of
-the first 4 bytes contain the 8 high order bits of the pixels, and
-the 5th byte contains the 2 least significants bits of each pixel,
-in the same order.
-
-**Bit-packed representation.**
-
-.. raw:: latex
-
-    \small
-
-.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths: 8 8 8 8 64
-
-    * - Y'\ :sub:`00[9:2]`
-      - Y'\ :sub:`01[9:2]`
-      - Y'\ :sub:`02[9:2]`
-      - Y'\ :sub:`03[9:2]`
-      - Y'\ :sub:`03[1:0]`\ (bits 7--6) Y'\ :sub:`02[1:0]`\ (bits 5--4)
-	Y'\ :sub:`01[1:0]`\ (bits 3--2) Y'\ :sub:`00[1:0]`\ (bits 1--0)
-
-.. raw:: latex
-
-    \normalsize
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y12.rst b/Documentation/userspace-api/media/v4l/pixfmt-y12.rst
deleted file mode 100644
index 4226c49232de..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-y12.rst
+++ /dev/null
@@ -1,72 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-Y12:
-
-*************************
-V4L2_PIX_FMT_Y12 ('Y12 ')
-*************************
-
-
-Grey-scale image
-
-
-Description
-===========
-
-This is a grey-scale image with a depth of 12 bits per pixel. Pixels are
-stored in 16-bit words with unused high bits padded with 0. The least
-significant byte is stored at lower memory addresses (little-endian).
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
-      - Y'\ :sub:`00low`
-      - Y'\ :sub:`00high`
-      - Y'\ :sub:`01low`
-      - Y'\ :sub:`01high`
-      - Y'\ :sub:`02low`
-      - Y'\ :sub:`02high`
-      - Y'\ :sub:`03low`
-      - Y'\ :sub:`03high`
-    * - start + 8:
-      - Y'\ :sub:`10low`
-      - Y'\ :sub:`10high`
-      - Y'\ :sub:`11low`
-      - Y'\ :sub:`11high`
-      - Y'\ :sub:`12low`
-      - Y'\ :sub:`12high`
-      - Y'\ :sub:`13low`
-      - Y'\ :sub:`13high`
-    * - start + 16:
-      - Y'\ :sub:`20low`
-      - Y'\ :sub:`20high`
-      - Y'\ :sub:`21low`
-      - Y'\ :sub:`21high`
-      - Y'\ :sub:`22low`
-      - Y'\ :sub:`22high`
-      - Y'\ :sub:`23low`
-      - Y'\ :sub:`23high`
-    * - start + 24:
-      - Y'\ :sub:`30low`
-      - Y'\ :sub:`30high`
-      - Y'\ :sub:`31low`
-      - Y'\ :sub:`31high`
-      - Y'\ :sub:`32low`
-      - Y'\ :sub:`32high`
-      - Y'\ :sub:`33low`
-      - Y'\ :sub:`33high`
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y14.rst b/Documentation/userspace-api/media/v4l/pixfmt-y14.rst
deleted file mode 100644
index d702b6549160..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-y14.rst
+++ /dev/null
@@ -1,72 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-Y14:
-
-*************************
-V4L2_PIX_FMT_Y14 ('Y14 ')
-*************************
-
-
-Grey-scale image
-
-
-Description
-===========
-
-This is a grey-scale image with a depth of 14 bits per pixel. Pixels are
-stored in 16-bit words with unused high bits padded with 0. The least
-significant byte is stored at lower memory addresses (little-endian).
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
-      - Y'\ :sub:`00low`
-      - Y'\ :sub:`00high`
-      - Y'\ :sub:`01low`
-      - Y'\ :sub:`01high`
-      - Y'\ :sub:`02low`
-      - Y'\ :sub:`02high`
-      - Y'\ :sub:`03low`
-      - Y'\ :sub:`03high`
-    * - start + 8:
-      - Y'\ :sub:`10low`
-      - Y'\ :sub:`10high`
-      - Y'\ :sub:`11low`
-      - Y'\ :sub:`11high`
-      - Y'\ :sub:`12low`
-      - Y'\ :sub:`12high`
-      - Y'\ :sub:`13low`
-      - Y'\ :sub:`13high`
-    * - start + 16:
-      - Y'\ :sub:`20low`
-      - Y'\ :sub:`20high`
-      - Y'\ :sub:`21low`
-      - Y'\ :sub:`21high`
-      - Y'\ :sub:`22low`
-      - Y'\ :sub:`22high`
-      - Y'\ :sub:`23low`
-      - Y'\ :sub:`23high`
-    * - start + 24:
-      - Y'\ :sub:`30low`
-      - Y'\ :sub:`30high`
-      - Y'\ :sub:`31low`
-      - Y'\ :sub:`31high`
-      - Y'\ :sub:`32low`
-      - Y'\ :sub:`32high`
-      - Y'\ :sub:`33low`
-      - Y'\ :sub:`33high`
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst b/Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
deleted file mode 100644
index f4eda7b95b51..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
+++ /dev/null
@@ -1,76 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-Y16-BE:
-
-****************************************
-V4L2_PIX_FMT_Y16_BE ('Y16 ' | (1 << 31))
-****************************************
-
-
-Grey-scale image
-
-
-Description
-===========
-
-This is a grey-scale image with a depth of 16 bits per pixel. The most
-significant byte is stored at lower memory addresses (big-endian).
-
-.. note::
-
-   The actual sampling precision may be lower than 16 bits, for
-   example 10 bits per pixel with values in range 0 to 1023.
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
-      - Y'\ :sub:`00high`
-      - Y'\ :sub:`00low`
-      - Y'\ :sub:`01high`
-      - Y'\ :sub:`01low`
-      - Y'\ :sub:`02high`
-      - Y'\ :sub:`02low`
-      - Y'\ :sub:`03high`
-      - Y'\ :sub:`03low`
-    * - start + 8:
-      - Y'\ :sub:`10high`
-      - Y'\ :sub:`10low`
-      - Y'\ :sub:`11high`
-      - Y'\ :sub:`11low`
-      - Y'\ :sub:`12high`
-      - Y'\ :sub:`12low`
-      - Y'\ :sub:`13high`
-      - Y'\ :sub:`13low`
-    * - start + 16:
-      - Y'\ :sub:`20high`
-      - Y'\ :sub:`20low`
-      - Y'\ :sub:`21high`
-      - Y'\ :sub:`21low`
-      - Y'\ :sub:`22high`
-      - Y'\ :sub:`22low`
-      - Y'\ :sub:`23high`
-      - Y'\ :sub:`23low`
-    * - start + 24:
-      - Y'\ :sub:`30high`
-      - Y'\ :sub:`30low`
-      - Y'\ :sub:`31high`
-      - Y'\ :sub:`31low`
-      - Y'\ :sub:`32high`
-      - Y'\ :sub:`32low`
-      - Y'\ :sub:`33high`
-      - Y'\ :sub:`33low`
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16.rst b/Documentation/userspace-api/media/v4l/pixfmt-y16.rst
deleted file mode 100644
index a092b0a5ff12..000000000000
--- a/Documentation/userspace-api/media/v4l/pixfmt-y16.rst
+++ /dev/null
@@ -1,76 +0,0 @@
-.. Permission is granted to copy, distribute and/or modify this
-.. document under the terms of the GNU Free Documentation License,
-.. Version 1.1 or any later version published by the Free Software
-.. Foundation, with no Invariant Sections, no Front-Cover Texts
-.. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
-
-.. _V4L2-PIX-FMT-Y16:
-
-*************************
-V4L2_PIX_FMT_Y16 ('Y16 ')
-*************************
-
-
-Grey-scale image
-
-
-Description
-===========
-
-This is a grey-scale image with a depth of 16 bits per pixel. The least
-significant byte is stored at lower memory addresses (little-endian).
-
-.. note::
-
-   The actual sampling precision may be lower than 16 bits, for
-   example 10 bits per pixel with values in range 0 to 1023.
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
-      - Y'\ :sub:`00low`
-      - Y'\ :sub:`00high`
-      - Y'\ :sub:`01low`
-      - Y'\ :sub:`01high`
-      - Y'\ :sub:`02low`
-      - Y'\ :sub:`02high`
-      - Y'\ :sub:`03low`
-      - Y'\ :sub:`03high`
-    * - start + 8:
-      - Y'\ :sub:`10low`
-      - Y'\ :sub:`10high`
-      - Y'\ :sub:`11low`
-      - Y'\ :sub:`11high`
-      - Y'\ :sub:`12low`
-      - Y'\ :sub:`12high`
-      - Y'\ :sub:`13low`
-      - Y'\ :sub:`13high`
-    * - start + 16:
-      - Y'\ :sub:`20low`
-      - Y'\ :sub:`20high`
-      - Y'\ :sub:`21low`
-      - Y'\ :sub:`21high`
-      - Y'\ :sub:`22low`
-      - Y'\ :sub:`22high`
-      - Y'\ :sub:`23low`
-      - Y'\ :sub:`23high`
-    * - start + 24:
-      - Y'\ :sub:`30low`
-      - Y'\ :sub:`30high`
-      - Y'\ :sub:`31low`
-      - Y'\ :sub:`31high`
-      - Y'\ :sub:`32low`
-      - Y'\ :sub:`32high`
-      - Y'\ :sub:`33low`
-      - Y'\ :sub:`33high`
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
new file mode 100644
index 000000000000..b24947b52cf8
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -0,0 +1,133 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/userspace-api/media/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _yuv-luma-only:
+
+*****************
+Luma-Only Formats
+*****************
+
+This family of formats only store the luma component of a Y'CbCr image. They
+are often referred to as greyscale formats.
+
+.. note::
+
+   - In all the tables that follow, bit 7 is the most significant bit in a byte.
+   - Formats are described with the minimum number of pixels needed to create a
+     byte-aligned repeating pattern. `...` indicates repetition of the pattern.
+   - Y'\ :sub:`x`\ [9:2] denotes bits 9 to 2 of the Y' value for pixel at colum
+     `x`.
+   - `0` denotes padding bits set to 0.
+
+
+.. flat-table:: Luma-Only Image Formats
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
+
+    * .. _V4L2-PIX-FMT-GREY:
+
+      - ``V4L2_PIX_FMT_GREY``
+      - 'GREY'
+
+      - Y'\ :sub:`0`\ [7:0]
+      - ...
+      - ...
+      - ...
+      - ...
+
+    * .. _V4L2-PIX-FMT-Y10:
+
+      - ``V4L2_PIX_FMT_Y10``
+      - 'Y10 '
+
+      - Y'\ :sub:`0`\ [7:0]
+      - `000000` Y'\ :sub:`0`\ [9:8]
+      - ...
+      - ...
+      - ...
+
+    * .. _V4L2-PIX-FMT-Y10BPACK:
+
+      - ``V4L2_PIX_FMT_Y10BPACK``
+      - 'Y10B'
+
+      - Y'\ :sub:`0`\ [9:2]
+      - Y'\ :sub:`0`\ [1:0] Y'\ :sub:`1`\ [9:4]
+      - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`2`\ [9:6]
+      - Y'\ :sub:`2`\ [5:0] Y'\ :sub:`3`\ [9:8]
+      - Y'\ :sub:`3`\ [7:0]
+
+    * .. _V4L2-PIX-FMT-Y10P:
+
+      - ``V4L2_PIX_FMT_Y10P``
+      - 'Y10P'
+
+      - Y'\ :sub:`0`\ [7:0]
+      - Y'\ :sub:`1`\ [9:8]
+      - Y'\ :sub:`2`\ [9:2]
+      - Y'\ :sub:`3`\ [9:2]
+      - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
+
+    * .. _V4L2-PIX-FMT-Y12:
+
+      - ``V4L2_PIX_FMT_Y12``
+      - 'Y12 '
+
+      - Y'\ :sub:`0`\ [7:0]
+      - `0000` Y'\ :sub:`0`\ [11:8]
+      - ...
+      - ...
+      - ...
+
+    * .. _V4L2-PIX-FMT-Y14:
+
+      - ``V4L2_PIX_FMT_Y14``
+      - 'Y14 '
+
+      - Y'\ :sub:`0`\ [7:0]
+      - `00` Y'\ :sub:`0`\ [13:8]
+      - ...
+      - ...
+      - ...
+
+    * .. _V4L2-PIX-FMT-Y16:
+
+      - ``V4L2_PIX_FMT_Y16``
+      - 'Y16 '
+
+      - Y'\ :sub:`0`\ [7:0]
+      - Y'\ :sub:`0`\ [15:8]
+      - ...
+      - ...
+      - ...
+
+    * .. _V4L2-PIX-FMT-Y16-BE:
+
+      - ``V4L2_PIX_FMT_Y16_BE``
+      - 'Y16 ' | (1 << 31)
+
+      - Y'\ :sub:`0`\ [7:0]
+      - Y'\ :sub:`0`\ [15:8]
+      - ...
+      - ...
+      - ...
+
+.. note::
+
+    For the Y16 and Y16_BE formats, the actual sampling precision may be lower
+    than 16 bits. For example, 10 bits per pixel uses values in the range 0 to
+    1023.
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
index afe4f7956e7f..f3321f503568 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -272,14 +272,7 @@ image.
     :maxdepth: 1
 
     pixfmt-packed-yuv
-    pixfmt-grey
-    pixfmt-y10
-    pixfmt-y12
-    pixfmt-y14
-    pixfmt-y10b
-    pixfmt-y10p
-    pixfmt-y16
-    pixfmt-y16-be
+    pixfmt-yuv-luma
     pixfmt-y8i
     pixfmt-y12i
     pixfmt-uv8
-- 
Regards,

Laurent Pinchart

