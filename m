Return-Path: <linux-media+bounces-18024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7885497228B
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 21:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E5871C21932
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 19:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FD118A6CD;
	Mon,  9 Sep 2024 19:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="u9k5I0Bv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732E189F52
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725909950; cv=none; b=K5kiduA29XHRqY36qBA27YSQzvJO3RAre2wmXVFg8X9sFaoMe398tavWwVJsaF39voDVDouVgptUMtB7O/yJiCqUxCUbSiSyV0qQHWoMuFzGtrcsZbMbNNBCrRABtUtJTG+AQw3xstYHDJvjYzNsKGTLIg26AkJ3+MhV9R41sDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725909950; c=relaxed/simple;
	bh=hRj4GFt34WT6KYv2JRhEt1QVppgmz7ROiRcIyljFdlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sr37dX59nHjVDLOi9UIyguni126s2l9Y0YI/6XCTDVhHq5WyGRxNu8l17+aa5jxvxc2VQ4FJEY4t+XEDcun0VHkrghDjl7Xjzs8SBIhJM27weT9pbHUhlm+/mLFlCl3T9NQ4flbaPPAv0jnvhfjrm5IApiFODSWmh3WDhU5nbjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=u9k5I0Bv; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725909943; bh=h1pkmF+60gKkBwDnH7SrfidJ1CJPCrTr2Q080CW3WDQ=;
 b=u9k5I0Bv/6K/PImLzIPOujMeAzUhESvWXC67rfTqadg69w3fR+Py3WOBLsvXN0WiIT/so4V/o
 S1zkH+ePdDnPgiwMyEBb/T3VVsp1Q0JRaTf1iLOjNlH9SbFiaBmkeNjlaC7FkhhGsW/IQDy7lTK
 6Oz2BR/1vEY4g8TC5rqAhMSi0A+uPvnRivBNGVviT1zF6TkdgL7AJril1vjgxhu13gtWbf9zaQP
 3O9eUehk6dmxOg2N+DbkSAbpesCy0DNWVWKlSIfzbfytu6CBFXXgXZrEoq+704qtMPHgFGjjk/v
 WFfeQOD1HGVAa/CRYfNxdzq7xuDH9ElHvrBqxRSQSyNw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [PATCH v6 02/11] media: v4l2: Add NV15 and NV20 pixel formats
Date: Mon,  9 Sep 2024 19:25:00 +0000
Message-ID: <20240909192522.1076704-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909192522.1076704-1-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66df4bb6c680cb8b7d2dc134

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
v6:
- No change

v5:
- Collect t-b tags

v4:
- No change

v3:
- Use bpp and bpp_div instead of the misuse of block_w/block_h
- Update documentation, expand to use full 4x4 sample image
---
 .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |   2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 include/uapi/linux/videodev2.h                |   2 +
 4 files changed, 134 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index b788f6933855..22cad8c9726b 100644
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
index 8ad04d48a023..53b6fdfcb4dd 100644
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
index e14db67be97c..9f09f5cf3e3e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1360,8 +1360,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
index 725e86c4bbbd..941a96b81672 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -642,8 +642,10 @@ struct v4l2_pix_format {
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
2.46.0


