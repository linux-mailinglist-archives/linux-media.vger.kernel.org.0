Return-Path: <linux-media+bounces-13615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1DF90DCD2
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 21:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6B031C2247F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 19:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D121849F8;
	Tue, 18 Jun 2024 19:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="w+KW0gdq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D9F1849C5
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.172.40.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718740072; cv=none; b=serIhwlbJ6y9FA1FgL8Dw1pbYDJMd00euqJd9GISPWZPflEiiFY/S1I2DfmuDTtjRRi7s4/w43c3oLjCwcus6TY2WZ+FPib1Tpwd3acOAx+KDwUNBzX+KDCbVfs+0v7R2JaELVdfhBYQBvLPh1UNQpovljAQicfOPeK067WnaL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718740072; c=relaxed/simple;
	bh=m1YVw1m+mkdtE3zDIn0tb7+TKFDW0wgDYxsnpYnoEnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZm6sMAiuJiMSoKgxY+edptINRUtcgGiC9xfLv63XBnc5GOxDF1vkJj6nX5SfOQ/Wy2ofqIiiBBTaVNOBgVENdaiFfrJ0qfnEsHMYhxyqdD9oREIyPOY6SHbpoc52pFnLyxDpOEqo8viXJgDLy4qDI7658f/GErjY7sTzlJNjJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=w+KW0gdq; arc=none smtp.client-ip=167.172.40.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718740027; bh=Bshf+2pT/j6lYR02AoHli/leQAIlm/QAIZHOm1UGNcA=;
 b=w+KW0gdqilNO5PIsrT4yFfRmAlTYORUW5KtaXr66Fgh8XFTWxAYVTivilnNFAKU4ivAyOjQ1y
 DONAy630hbK4nUoIiI9Tjqv1LrekNuDmMdTra6XcEq/iADjfBWc7k5gYLWP35UxUPFoV1HmDcIB
 M/Wbu8JojwrWRUgkGk8zYb8/HjBnKfd6ZxaYVVGIGIEoL+5mg2luY2Yw3Xu3Yif/CZlTLVgWLw7
 dKKgbcTVzzm0roSxlEfryGSx9wyIqHCnXFnbC0YCcKl+il4ryeQVA7LKmD0EkMKqPXnK30PkA6L
 JnkNU7uMgLPq52EJ94ya/vSRSviqvAU6FpEm72QBmRhw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Alex Bee <knaerzche@gmail.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Christopher Obbard
 <chris.obbard@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v5 02/10] media: v4l2: Add NV15 and NV20 pixel formats
Date: Tue, 18 Jun 2024 19:46:26 +0000
Message-ID: <20240618194647.742037-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618194647.742037-1-jonas@kwiboo.se>
References: <20240618194647.742037-1-jonas@kwiboo.se>
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
 167.172.40.54
X-ForwardEmail-ID: 6671e43764ade33c90059f8a

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
v5:
- Collect t-b tags

v4:
- No change

v3:
- Use bpp and bpp_div instead of the misuse of block_w/block_h
- Update documentation, expand to use full 4x4 sample image

 .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |   2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 include/uapi/linux/videodev2.h                |   2 +
 4 files changed, 134 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 1840224faa41..4366cdcb970e 100644
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
@@ -158,6 +165,13 @@ All components are stored with the same number of bits per component.
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
@@ -288,6 +302,57 @@ of the luma plane.
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
@@ -500,6 +565,69 @@ number of lines as the luma plane.
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
index 9f749384a4f5..f03c9e89ef1f 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -275,8 +275,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
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
index 4c76d17b4629..1ffe39e2ba93 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1358,8 +1358,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
index fe6b67e83751..1c99b1dc73b0 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -640,8 +640,10 @@ struct v4l2_pix_format {
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
2.45.2


