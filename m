Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E43E21158C
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 00:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGAWB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 18:01:27 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:42551 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgGAWB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 18:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:mime-version:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=YoXiEJGtZe0e7X5GwX7ycoiC6AsWzUaJUSnHJI7q4k8=;
        b=swT9iZsYVUIc0RAR6bgHDFdbPTLbv9WfW3PlXCst2pnxyv40+G4b9eqhzfp+sSLJAiTa
        H8JIY3i/GPS++/brF4SoXHl0qtdZUlwZQw4RxPrm6MftZFxSCkfABflgfvebcgzgMYR3op
        6cTiCnSJsw84y3xQopJRe/VFm9UCdkwzw=
Received: by filterdrecv-p3iad2-5b55dcd864-v6r54 with SMTP id filterdrecv-p3iad2-5b55dcd864-v6r54-19-5EFD0687-A
        2020-07-01 21:56:23.275700342 +0000 UTC m=+449217.122710142
Received: from bionic.localdomain (unknown)
        by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
        id fyJ0M15-RKS99EoHTmVsDw
        Wed, 01 Jul 2020 21:56:23.017 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 6/9] media: v4l2: Add NV15 and NV20 pixel formats
Date:   Wed, 01 Jul 2020 21:56:23 +0000 (UTC)
Message-Id: <20200701215616.30874-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701215616.30874-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h3CR8+dqM37DsTJGI?=
 =?us-ascii?Q?X8j2w665e9pIJY7pjkQ4ArL57xvtBcnH7b4P7sF?=
 =?us-ascii?Q?b7AcKvuOHprPC1FBKmoEzTNzw=2FIiOWLU1Rp9CzD?=
 =?us-ascii?Q?kpnw2e6blwTeafAMCujiBAV=2Fvp4rKt0VJbRDIK5?=
 =?us-ascii?Q?zq5Sw7WPOs2ta1WoeGL68KzTKGbDD2s+581uowb?=
 =?us-ascii?Q?T3nSQPb59myPzKbZFQNBQ=3D=3D?=
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add NV15 and NV20 pixel formats used by the Rockchip Video Decoder for
10-bit buffers.

NV15 and NV20 is a packed 10-bit 4:2:0/4:2:2 semi-planar Y/CbCr format
similar to P010 and P210 but has no padding between components. Instead,
luminance and chrominance samples are grouped into 4s so that each group is
packed into an integer number of bytes:

YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes

The '15' and '20' suffix refers to the optimum effective bits per pixel
which is achieved when the total number of luminance samples is a multiple
of 8 for NV15 and 4 for NV20.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../userspace-api/media/v4l/pixfmt-nv15.rst   | 101 ++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt-nv20.rst   |  99 +++++++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst   |   2 +
 drivers/media/v4l2-core/v4l2-common.c         |   3 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 include/uapi/linux/videodev2.h                |   3 +
 6 files changed, 210 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv15.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv20.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv15.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv15.rst
new file mode 100644
index 000000000000..d059db58c6e0
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv15.rst
@@ -0,0 +1,101 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/userspace-api/media/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _V4L2-PIX-FMT-NV15:
+
+**************************
+V4L2_PIX_FMT_NV15 ('NV15')
+**************************
+
+Format with ½ horizontal and vertical chroma resolution, also known as
+YUV 4:2:0. One luminance and one chrominance plane with alternating
+chroma samples similar to ``V4L2_PIX_FMT_NV12`` but with 10-bit samples
+that are grouped into four and packed into five bytes.
+
+The '15' suffix refers to the optimum effective bits per pixel which is
+achieved when the total number of luminance samples is a multiple of 8.
+
+
+Description
+===========
+
+This is a packed 10-bit two-plane version of the YUV 4:2:0 format. The
+three components are separated into two sub-images or planes. The Y plane
+is first. The Y plane has five bytes per each group of four pixels. A
+combined CbCr plane immediately follows the Y plane in memory. The CbCr
+plane is the same width, in bytes, as the Y plane (and of the image), but
+is half as tall in pixels. Each CbCr pair belongs to four pixels. For
+example, Cb\ :sub:`00`/Cr\ :sub:`00` belongs to Y'\ :sub:`00`,
+Y'\ :sub:`01`, Y'\ :sub:`10`, Y'\ :sub:`11`.
+
+If the Y plane has pad bytes after each row, then the CbCr plane has as
+many pad bytes after its rows.
+
+**Byte Order.**
+Little endian. Each cell is one byte. Pixels cross the byte boundary.
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00[7:0]`
+      - Y'\ :sub:`01[5:0]`\ Y'\ :sub:`00[9:8]`
+      - Y'\ :sub:`02[3:0]`\ Y'\ :sub:`01[9:6]`
+      - Y'\ :sub:`03[1:0]`\ Y'\ :sub:`02[9:4]`
+      - Y'\ :sub:`03[9:2]`
+    * - start + 5:
+      - Y'\ :sub:`10[7:0]`
+      - Y'\ :sub:`11[5:0]`\ Y'\ :sub:`10[9:8]`
+      - Y'\ :sub:`12[3:0]`\ Y'\ :sub:`11[9:6]`
+      - Y'\ :sub:`13[1:0]`\ Y'\ :sub:`12[9:4]`
+      - Y'\ :sub:`13[9:2]`
+    * - start + 10:
+      - Cb'\ :sub:`00[7:0]`
+      - Cr'\ :sub:`00[5:0]`\ Cb'\ :sub:`00[9:8]`
+      - Cb'\ :sub:`01[3:0]`\ Cr'\ :sub:`00[9:6]`
+      - Cr'\ :sub:`01[1:0]`\ Cb'\ :sub:`01[9:4]`
+      - Cr'\ :sub:`01[9:2]`
+
+
+**Color Sample Location:**
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * -
+      - 0
+      -
+      - 1
+      - 2
+      -
+      - 3
+    * - 0
+      - Y
+      -
+      - Y
+      - Y
+      -
+      - Y
+    * -
+      -
+      - C
+      -
+      -
+      - C
+      -
+    * - 1
+      - Y
+      -
+      - Y
+      - Y
+      -
+      - Y
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv20.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv20.rst
new file mode 100644
index 000000000000..a8123be0baa3
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv20.rst
@@ -0,0 +1,99 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/userspace-api/media/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _V4L2-PIX-FMT-NV20:
+
+**************************
+V4L2_PIX_FMT_NV20 ('NV20')
+**************************
+
+Format with ½ horizontal chroma resolution, also known as YUV 4:2:2.
+One luminance and one chrominance plane with alternating chroma samples
+similar to ``V4L2_PIX_FMT_NV16`` but with 10-bit samples
+that are grouped into four and packed into five bytes.
+
+The '20' suffix refers to the optimum effective bits per pixel which is
+achieved when the total number of luminance samples is a multiple of 4.
+
+
+Description
+===========
+
+This is a packed 10-bit two-plane version of the YUV 4:2:2 format. The
+three components are separated into two sub-images or planes. The Y plane
+is first. The Y plane has five bytes per each group of four pixels. A
+combined CbCr plane immediately follows the Y plane in memory. The CbCr
+plane is the same width and height, in bytes, as the Y plane (and of the
+image). Each CbCr pair belongs to two pixels. For example,
+Cb\ :sub:`00`/Cr\ :sub:`00` belongs to Y'\ :sub:`00`, Y'\ :sub:`01`.
+
+If the Y plane has pad bytes after each row, then the CbCr plane has as
+many pad bytes after its rows.
+
+**Byte Order.**
+Little endian. Each cell is one byte. Pixels cross the byte boundary.
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00[7:0]`
+      - Y'\ :sub:`01[5:0]`\ Y'\ :sub:`00[9:8]`
+      - Y'\ :sub:`02[3:0]`\ Y'\ :sub:`01[9:6]`
+      - Y'\ :sub:`03[1:0]`\ Y'\ :sub:`02[9:4]`
+      - Y'\ :sub:`03[9:2]`
+    * - start + 5:
+      - Y'\ :sub:`10[7:0]`
+      - Y'\ :sub:`11[5:0]`\ Y'\ :sub:`10[9:8]`
+      - Y'\ :sub:`12[3:0]`\ Y'\ :sub:`11[9:6]`
+      - Y'\ :sub:`13[1:0]`\ Y'\ :sub:`12[9:4]`
+      - Y'\ :sub:`13[9:2]`
+    * - start + 10:
+      - Cb'\ :sub:`00[7:0]`
+      - Cr'\ :sub:`00[5:0]`\ Cb'\ :sub:`00[9:8]`
+      - Cb'\ :sub:`01[3:0]`\ Cr'\ :sub:`00[9:6]`
+      - Cr'\ :sub:`01[1:0]`\ Cb'\ :sub:`01[9:4]`
+      - Cr'\ :sub:`01[9:2]`
+    * - start + 15:
+      - Cb'\ :sub:`10[7:0]`
+      - Cr'\ :sub:`10[5:0]`\ Cb'\ :sub:`10[9:8]`
+      - Cb'\ :sub:`11[3:0]`\ Cr'\ :sub:`10[9:6]`
+      - Cr'\ :sub:`11[1:0]`\ Cb'\ :sub:`11[9:4]`
+      - Cr'\ :sub:`11[9:2]`
+
+
+**Color Sample Location:**
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * -
+      - 0
+      -
+      - 1
+      - 2
+      -
+      - 3
+    * - 0
+      - Y
+      - C
+      - Y
+      - Y
+      - C
+      - Y
+    * - 1
+      - Y
+      - C
+      - Y
+      - Y
+      - C
+      - Y
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
index 8ee92d0cd769..7cca883f178a 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -61,4 +61,6 @@ to brightness information.
     pixfmt-nv16
     pixfmt-nv16m
     pixfmt-nv24
+    pixfmt-nv15
+    pixfmt-nv20
     pixfmt-m420
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 4102c373b48a..0caac755d303 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -267,6 +267,9 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
 
+		{ .format = V4L2_PIX_FMT_NV15,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 5, 0, 0 }, .hdiv = 2, .vdiv = 2, .block_w = { 4, 2, 0, 0 }, .block_h = { 1, 1, 0, 0 } },
+		{ .format = V4L2_PIX_FMT_NV20,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 5, 0, 0 }, .hdiv = 2, .vdiv = 1, .block_w = { 4, 2, 0, 0 }, .block_h = { 1, 1, 0, 0 } },
+
 		{ .format = V4L2_PIX_FMT_YUV410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
 		{ .format = V4L2_PIX_FMT_YVU410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
 		{ .format = V4L2_PIX_FMT_YUV411P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 1 },
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 02bfef0da76d..4657274bb37a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1315,6 +1315,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
 	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
 	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
+	case V4L2_PIX_FMT_NV15:		descr = "10-bit Y/CbCr 4:2:0 (Packed)"; break;
+	case V4L2_PIX_FMT_NV20:		descr = "10-bit Y/CbCr 4:2:2 (Packed)"; break;
 	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV16M:	descr = "Y/CbCr 4:2:2 (N-C)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 303805438814..bd23aeaf0706 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -610,6 +610,9 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
 #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
 
+#define V4L2_PIX_FMT_NV15    v4l2_fourcc('N', 'V', '1', '5') /* 15  Y/CbCr 4:2:0 10-bit packed */
+#define V4L2_PIX_FMT_NV20    v4l2_fourcc('N', 'V', '2', '0') /* 20  Y/CbCr 4:2:2 10-bit packed */
+
 /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */
 #define V4L2_PIX_FMT_NV21M   v4l2_fourcc('N', 'M', '2', '1') /* 21  Y/CrCb 4:2:0  */
-- 
2.17.1

