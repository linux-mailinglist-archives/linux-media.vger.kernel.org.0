Return-Path: <linux-media+bounces-28747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE156A70C27
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 22:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE9B23B8837
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 21:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77773269B03;
	Tue, 25 Mar 2025 21:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="btYT+nn2"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C097026980C;
	Tue, 25 Mar 2025 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742938401; cv=none; b=KCs3+zh3hk0h131CkcImFPPBxpzBF4xNRlVlWNJsSu6A56X9UGcdJ7L5L6yf0lQLEKolrAnqfR/79GKqfVY6U8G8Vu38Py06PPh/6B+eFlLEQu9X3MhyQvmc3Rl6/nOpUVq33VNwPPEFE0OZ6+qxhtWp9a/xSeHvAVQpu9JobOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742938401; c=relaxed/simple;
	bh=W8C32j+Z+Tu5rUmg2doFcvtcvCvqRwlVTpiJcRhXIn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFAhIx5rtl8kbkU5++Rjel2PJ1pNeTSYt5+zYSv7i564m1qAlAmzDbUspMRpw1/f4dvpABnBaQZMcZ84cmADt4P5GjCtiMptszvKijfJ1WH6vpEaiqj3GA6wUes7qiwfwv4bAyKI7Q0DW/NEmySvC/hNq9xCRopp/G7XSEu4BC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=btYT+nn2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742938398;
	bh=W8C32j+Z+Tu5rUmg2doFcvtcvCvqRwlVTpiJcRhXIn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=btYT+nn2/Xefv3cox6iqNQkgWMS1QeTyKnUYMT2QR61yHUaWhg7S3GEI6kFeQuC14
	 PnvsKNGC0MUmP5l75LHA2KTakXHFA6WP3DaVTKT/Ye42znIDK6XkRBVbKxy14knREA
	 /D/c0h7lkjvE7/BMH1UMxCWAUxOD50lakTo+ARHhnvl52CpmTM8EXkgV1iB9a9hrBg
	 vJjyZP49BBoSWSm3HURTQpjnwSX1rPFl6XYTI5/HlzcCCjJ/owMEBWTbzAr+vHjcMc
	 iK/kN3gnpjU8OBW8Uaq2esC3EEOlhTBR0FEVZzfpuK0/CcBgxKW6xBh9tbjlogoFin
	 BvrmCE3LiFFbA==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E0A4317E0C81;
	Tue, 25 Mar 2025 22:33:13 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [PATCH v4 1/6] media: v4l2: Add NV15 and NV20 pixel formats
Date: Tue, 25 Mar 2025 17:22:17 -0400
Message-ID: <20250325213303.826925-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325213303.826925-1-detlev.casanova@collabora.com>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonas Karlman <jonas@kwiboo.se>

Add NV15 and NV20 pixel formats used by the Rockchip Video Decoder for
10-bit buffers.

NV15 and NV20 is 10-bit 4:2:0/4:2:2 semi-planar YUV formats similar to
NV12 and NV16, using 10-bit components with no padding between each
component. Instead, a group of 4 luminance/chrominance samples are
stored over 5 bytes in little endian order:

YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes

The '15' and '20' suffix refers to the optimum effective bits per pixel
which is achieved when the total number of luminance samples is a
multiple of 8 for NV15 and 4 for NV20.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
 .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |   2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 include/uapi/linux/videodev2.h                |   2 +
 4 files changed, 134 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index b788f69338554..22cad8c9726bf 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -79,6 +79,13 @@ All components are stored with the same number of bits per component.
       - Cr, Cb
       - Yes
       - Linear
+    * - V4L2_PIX_FMT_NV15
+      - 'NV15'
+      - 10
+      - 4:2:0
+      - Cb, Cr
+      - Yes
+      - Linear
     * - V4L2_PIX_FMT_NV12M
       - 'NM12'
       - 8
@@ -172,6 +179,13 @@ All components are stored with the same number of bits per component.
       - Cr, Cb
       - Yes
       - Linear
+    * - V4L2_PIX_FMT_NV20
+      - 'NV20'
+      - 10
+      - 4:2:2
+      - Cb, Cr
+      - Yes
+      - Linear
     * - V4L2_PIX_FMT_NV16M
       - 'NM16'
       - 8
@@ -302,6 +316,57 @@ of the luma plane.
       - Cr\ :sub:`11`
 
 
+.. _V4L2-PIX-FMT-NV15:
+
+NV15
+----
+
+Semi-planar 10-bit YUV 4:2:0 format similar to NV12, using 10-bit components
+with no padding between each component. A group of 4 components are stored over
+5 bytes in little endian order.
+
+.. flat-table:: Sample 4x4 NV15 Image (1 byte per cell)
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
+      - Y'\ :sub:`20[7:0]`
+      - Y'\ :sub:`21[5:0]`\ Y'\ :sub:`20[9:8]`
+      - Y'\ :sub:`22[3:0]`\ Y'\ :sub:`21[9:6]`
+      - Y'\ :sub:`23[1:0]`\ Y'\ :sub:`22[9:4]`
+      - Y'\ :sub:`23[9:2]`
+    * - start + 15:
+      - Y'\ :sub:`30[7:0]`
+      - Y'\ :sub:`31[5:0]`\ Y'\ :sub:`30[9:8]`
+      - Y'\ :sub:`32[3:0]`\ Y'\ :sub:`31[9:6]`
+      - Y'\ :sub:`33[1:0]`\ Y'\ :sub:`32[9:4]`
+      - Y'\ :sub:`33[9:2]`
+    * - start + 20:
+      - Cb\ :sub:`00[7:0]`
+      - Cr\ :sub:`00[5:0]`\ Cb\ :sub:`00[9:8]`
+      - Cb\ :sub:`01[3:0]`\ Cr\ :sub:`00[9:6]`
+      - Cr\ :sub:`01[1:0]`\ Cb\ :sub:`01[9:4]`
+      - Cr\ :sub:`01[9:2]`
+    * - start + 25:
+      - Cb\ :sub:`10[7:0]`
+      - Cr\ :sub:`10[5:0]`\ Cb\ :sub:`10[9:8]`
+      - Cb\ :sub:`11[3:0]`\ Cr\ :sub:`10[9:6]`
+      - Cr\ :sub:`11[1:0]`\ Cb\ :sub:`11[9:4]`
+      - Cr\ :sub:`11[9:2]`
+
+
 .. _V4L2-PIX-FMT-NV12MT:
 .. _V4L2-PIX-FMT-NV12MT-16X16:
 .. _V4L2-PIX-FMT-NV12-4L4:
@@ -631,6 +696,69 @@ number of lines as the luma plane.
       - Cr\ :sub:`32`
 
 
+.. _V4L2-PIX-FMT-NV20:
+
+NV20
+----
+
+Semi-planar 10-bit YUV 4:2:2 format similar to NV16, using 10-bit components
+with no padding between each component. A group of 4 components are stored over
+5 bytes in little endian order.
+
+.. flat-table:: Sample 4x4 NV20 Image (1 byte per cell)
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
+      - Y'\ :sub:`20[7:0]`
+      - Y'\ :sub:`21[5:0]`\ Y'\ :sub:`20[9:8]`
+      - Y'\ :sub:`22[3:0]`\ Y'\ :sub:`21[9:6]`
+      - Y'\ :sub:`23[1:0]`\ Y'\ :sub:`22[9:4]`
+      - Y'\ :sub:`23[9:2]`
+    * - start + 15:
+      - Y'\ :sub:`30[7:0]`
+      - Y'\ :sub:`31[5:0]`\ Y'\ :sub:`30[9:8]`
+      - Y'\ :sub:`32[3:0]`\ Y'\ :sub:`31[9:6]`
+      - Y'\ :sub:`33[1:0]`\ Y'\ :sub:`32[9:4]`
+      - Y'\ :sub:`33[9:2]`
+    * - start + 20:
+      - Cb\ :sub:`00[7:0]`
+      - Cr\ :sub:`00[5:0]`\ Cb\ :sub:`00[9:8]`
+      - Cb\ :sub:`01[3:0]`\ Cr\ :sub:`00[9:6]`
+      - Cr\ :sub:`01[1:0]`\ Cb\ :sub:`01[9:4]`
+      - Cr\ :sub:`01[9:2]`
+    * - start + 25:
+      - Cb\ :sub:`10[7:0]`
+      - Cr\ :sub:`10[5:0]`\ Cb\ :sub:`10[9:8]`
+      - Cb\ :sub:`11[3:0]`\ Cr\ :sub:`10[9:6]`
+      - Cr\ :sub:`11[1:0]`\ Cb\ :sub:`11[9:4]`
+      - Cr\ :sub:`11[9:2]`
+    * - start + 30:
+      - Cb\ :sub:`20[7:0]`
+      - Cr\ :sub:`20[5:0]`\ Cb\ :sub:`20[9:8]`
+      - Cb\ :sub:`21[3:0]`\ Cr\ :sub:`20[9:6]`
+      - Cr\ :sub:`21[1:0]`\ Cb\ :sub:`21[9:4]`
+      - Cr\ :sub:`21[9:2]`
+    * - start + 35:
+      - Cb\ :sub:`30[7:0]`
+      - Cr\ :sub:`30[5:0]`\ Cb\ :sub:`30[9:8]`
+      - Cb\ :sub:`31[3:0]`\ Cr\ :sub:`30[9:6]`
+      - Cr\ :sub:`31[1:0]`\ Cb\ :sub:`31[9:4]`
+      - Cr\ :sub:`31[9:2]`
+
+
 .. _V4L2-PIX-FMT-NV24:
 .. _V4L2-PIX-FMT-NV42:
 
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a073..d86d54c22fdb0 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -277,8 +277,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		/* YUV planar formats */
 		{ .format = V4L2_PIX_FMT_NV12,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_NV21,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_NV15,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_NV16,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV61,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_NV20,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d1..864cd2939222e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1361,8 +1361,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_YUV48_12:	descr = "12-bit YUV 4:4:4 Packed"; break;
 	case V4L2_PIX_FMT_NV12:		descr = "Y/UV 4:2:0"; break;
 	case V4L2_PIX_FMT_NV21:		descr = "Y/VU 4:2:0"; break;
+	case V4L2_PIX_FMT_NV15:		descr = "10-bit Y/UV 4:2:0 (Packed)"; break;
 	case V4L2_PIX_FMT_NV16:		descr = "Y/UV 4:2:2"; break;
 	case V4L2_PIX_FMT_NV61:		descr = "Y/VU 4:2:2"; break;
+	case V4L2_PIX_FMT_NV20:		descr = "10-bit Y/UV 4:2:2 (Packed)"; break;
 	case V4L2_PIX_FMT_NV24:		descr = "Y/UV 4:4:4"; break;
 	case V4L2_PIX_FMT_NV42:		descr = "Y/VU 4:4:4"; break;
 	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/UV 4:2:0"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce390074..700e7033b88e6 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -643,8 +643,10 @@ struct v4l2_pix_format {
 /* two planes -- one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */
 #define V4L2_PIX_FMT_NV21    v4l2_fourcc('N', 'V', '2', '1') /* 12  Y/CrCb 4:2:0  */
+#define V4L2_PIX_FMT_NV15    v4l2_fourcc('N', 'V', '1', '5') /* 15  Y/CbCr 4:2:0 10-bit packed */
 #define V4L2_PIX_FMT_NV16    v4l2_fourcc('N', 'V', '1', '6') /* 16  Y/CbCr 4:2:2  */
 #define V4L2_PIX_FMT_NV61    v4l2_fourcc('N', 'V', '6', '1') /* 16  Y/CrCb 4:2:2  */
+#define V4L2_PIX_FMT_NV20    v4l2_fourcc('N', 'V', '2', '0') /* 20  Y/CbCr 4:2:2 10-bit packed */
 #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
 #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
 #define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 24  Y/CbCr 4:2:0 10-bit per component */
-- 
2.49.0


