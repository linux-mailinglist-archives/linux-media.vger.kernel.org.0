Return-Path: <linux-media+bounces-58882-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP1YBCPZ4GlymgAAu9opvQ
	(envelope-from <linux-media+bounces-58882-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 14:42:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE7B40E56C
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 14:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62CC230413A5
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9811C3A6F03;
	Thu, 16 Apr 2026 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fr/dlLQj"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653B221256C;
	Thu, 16 Apr 2026 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776343318; cv=none; b=PWy5OoryMNTDKzPuavjL/wsBvXNh9ftCC+q/PvU4gaukfTGw8OXpFU3fBXsthEhH+CM0CLTdpJpu3lDHAd+A/ykf7FQRytXV36TWVn/c/xO+2L6/Jw2fyTmlqxgqe4e6O4xUWI3oPPd2Y9zYTtbfj9/f0vwLtB7mNU4otibQN0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776343318; c=relaxed/simple;
	bh=hSXfYrfyRB6eHJjfizkXWubMNJ0alx2Qgo/T3WcV9V4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJ7AZjplTrInhZtohnbmR+PQ9pamsPaGtw3UwR0kmlABIa9UHknwyeMhcYdplne5L1Ba35o/sBsuGWJCyI443tyuiyxzv/pzI5TUSI2Y8UVsM3Pm9mtr3OXTdLO60dNajcGkBBz5R67AvT9uH+s3Q53bmQZH9ecPKls2bnb6Lbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fr/dlLQj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776343309;
	bh=hSXfYrfyRB6eHJjfizkXWubMNJ0alx2Qgo/T3WcV9V4=;
	h=From:To:Cc:Subject:Date:From;
	b=fr/dlLQjOyg/fVnm/qcdCuufl+J/q/oZtDNeN5nQctZJJIgLtQ164VwGPFwO6Ec5w
	 RX79I4fzc96FeiaULqZYdzIw7X+XRQkzO+qezLE6aFzrPY4rY4QOlrw5RGTBNfnQfp
	 LGCrXaq4R63Amr7Ci8FVkyZbLP+JxiTMzJ30lBzvMsQcZzueNtOwn5NzKc3KHgiXSa
	 +lz4e8MMb+brzIjTdNWtTPYsITdLs7OEJW3NBYoDFYxEZi1+wiD03paEs7I6j1S2vg
	 OAmQNGetnfRk0PUw79EXhPTDgOgNnzHfTbic5JGQakdu0h16lDnilP9dwPlW4+Klth
	 HtL5EY5xlyKng==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23B4517E0FFA;
	Thu, 16 Apr 2026 14:41:49 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	corbet@lwn.net,
	hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [RFC] media: Add AFBC pixel formats
Date: Thu, 16 Apr 2026 14:41:43 +0200
Message-ID: <20260416124143.128412-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58882-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EE7B40E56C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add 8-bit and 10-bit YUV420 Arm Frame Buffer Compression (AFBC)
pixel formats.

AFBC stride and image size computation needed to be done by
specific helpers functions which are also exported to be used
by drivers.

Add documentation for each of the formats.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../userspace-api/media/v4l/pixfmt-afbc.rst   |  64 +++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |   1 +
 drivers/media/v4l2-core/v4l2-common.c         | 104 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
 include/media/v4l2-common.h                   |   4 +
 include/uapi/linux/videodev2.h                |   6 +
 6 files changed, 183 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-afbc.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst b/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst
new file mode 100644
index 000000000000..2867e5d45810
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. afbc:
+
+*******************************************
+ARM Frame Buffer Compression formats (AFBC)
+*******************************************
+
+The AFBC format is a lossless compression format which can support
+up to four components. It could compress 8 bits to 64 bits per pixel.
+The internal superblock size could be:
+
+- 16x16 pixels
+
+- 32x8 pixels
+
+- 64x4 pixels.
+
+The memory layout is composed of a header block followed by payload data.
+
+AFBC Formats
+============
+
+.. tabularcolumns:: |p{5.2cm}|p{1.0cm}|p{1.5cm}|p{1.9cm}|p{1.2cm}|p{1.8cm}|
+
+.. flat-table:: Overview of AFBC formats
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      - Colorspace
+      - Bits per component
+      - Superblock size
+      - Compression parameters
+    * - V4L2_PIX_FMT_AFBC_YUV420_16x16
+      - 'A168'
+      - YUV420
+      - 8 bits
+      - 16x16
+      - Sparse, Split
+    * - V4L2_PIX_FMT_AFBC_YUV420_32x8
+      - 'A328'
+      - YUV420
+      - 8 bits
+      - 32x8
+      - Sparse
+    * - V4L2_PIX_FMT_AFBC_YUV420_16x16_10
+      - 'A16a'
+      - YUV420
+      - 10 bits
+      - 16x16
+      - Sparse, Split
+    * - V4L2_PIX_FMT_AFBC_YUV420_32x8_10
+      - 'A32a'
+      - YUV420
+      - 10 bits
+      - 32x8
+      - Sparse
+
+.. _V4L2-PIX-FMT-AFBC-YUV420-16x16:
+.. _V4L2-PIX-FMT-AFBC-YUV420-32x8:
+.. _V4L2-PIX-FMT-AFBC-YUV420-16x16-10:
+.. _V4L2-PIX-FMT-AFBC-YUV420-32x8-10:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
index 71b29267488f..c6728b91b74f 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -26,6 +26,7 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
     pixfmt-indexed
     pixfmt-rgb
     pixfmt-bayer
+    pixfmt-afbc
     yuv-formats
     hsv-formats
     depth-formats
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e1113..9187cb18a4ef 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -332,6 +332,16 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV12MT_16X16,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 16,  8, 0, 0 },	.block_h = { 16,  8, 0, 0 }},
 
+		/* AFBC formats */
+		{ .format = V4L2_PIX_FMT_AFBC_YUV420_16x16, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
+		  .block_w = { 16, 0, 0, 0 },	.block_h = { 16, 0, 0, 0 }},
+		{ .format = V4L2_PIX_FMT_AFBC_YUV420_32x8, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
+		  .block_w = { 32, 0, 0, 0 },	.block_h = { 8, 0, 0, 0 }},
+		{ .format = V4L2_PIX_FMT_AFBC_YUV420_16x16_10, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 15, 0, 0, 0 }, .bpp_div = { 8, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
+		   .block_w = { 16, 0, 0, 0 },	.block_h = { 16, 0, 0, 0 }},
+		{ .format = V4L2_PIX_FMT_AFBC_YUV420_32x8_10, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 15, 0, 0, 0 }, .bpp_div = { 8, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
+		   .block_w = { 32, 0, 0, 0 },	.block_h = { 8, 0, 0, 0 }},
+
 		/* Bayer RGB formats */
 		{ .format = V4L2_PIX_FMT_SBGGR8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGBRG8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
@@ -448,6 +458,97 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 }
 EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
 
+size_t v4l2_pixfmt_afbc_header_size(int fourcc, int width, int height)
+{
+	int width_in_block, height_in_block;
+
+	if (!v4l2_is_format_afbc(fourcc))
+		return 0;
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
+		width_in_block = ALIGN(width, 16) >> 4;
+		height_in_block = ALIGN(height, 16) >> 4;
+		break;
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
+		width_in_block = ALIGN(width, 32) >> 5;
+		height_in_block = ALIGN(height, 8) >> 3;
+		break;
+	}
+
+	return ALIGN(width_in_block * 16 * height_in_block, 128);
+}
+EXPORT_SYMBOL_GPL(v4l2_pixfmt_afbc_header_size);
+
+size_t v4l2_pixfmt_afbc_payload_size(int fourcc, int width, int height)
+{
+	int width_in_block, height_in_block, block_payload_size;
+
+	if (!v4l2_is_format_afbc(fourcc))
+		return 0;
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
+		width_in_block = ALIGN(width, 16) >> 4;
+		height_in_block = ALIGN(height, 16) >> 4;
+		break;
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
+		width_in_block = ALIGN(width, 32) >> 5;
+		height_in_block = ALIGN(height, 8) >> 3;
+		break;
+	}
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
+		block_payload_size = 384;
+		break;
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
+		block_payload_size = 512;
+		break;
+	}
+
+	return ALIGN(block_payload_size * width_in_block * height_in_block, 128);
+}
+EXPORT_SYMBOL_GPL(v4l2_pixfmt_afbc_payload_size);
+
+static int v4l2_fill_pixfmt_afbc(struct v4l2_pix_format_mplane *pixfmt,
+				 const struct v4l2_format_info *info)
+{
+	struct v4l2_plane_pix_format *plane = &pixfmt->plane_fmt[0];
+	unsigned int width = pixfmt->width;
+	unsigned int height = pixfmt->height;
+	unsigned int aligned_width = ALIGN(width, v4l2_format_block_width(info, 0));
+	unsigned int stride = DIV_ROUND_UP(aligned_width, info->hdiv) *
+			      info->bpp[0] / info->bpp_div[0];
+	size_t header_size = v4l2_pixfmt_afbc_header_size(info->format, width, height);
+	size_t payload_size = v4l2_pixfmt_afbc_payload_size(info->format, width, height);
+
+	plane->bytesperline = stride;
+	plane->sizeimage = header_size + payload_size;
+
+	return 0;
+}
+
+bool v4l2_is_format_afbc(int fourcc)
+{
+	switch (fourcc) {
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
+		return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(v4l2_is_format_afbc);
+
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 			u32 pixelformat, u32 width, u32 height)
 {
@@ -464,6 +565,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 	pixfmt->pixelformat = pixelformat;
 	pixfmt->num_planes = info->mem_planes;
 
+	if (v4l2_is_format_afbc(info->format))
+		return v4l2_fill_pixfmt_afbc(pixfmt, info);
+
 	if (info->mem_planes == 1) {
 		plane = &pixfmt->plane_fmt[0];
 		plane->bytesperline = v4l2_format_plane_stride(info, 0, width);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c..016d4244c9ee 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1387,6 +1387,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_YVU422M:	descr = "Planar YVU 4:2:2 (N-C)"; break;
 	case V4L2_PIX_FMT_YUV444M:	descr = "Planar YUV 4:4:4 (N-C)"; break;
 	case V4L2_PIX_FMT_YVU444M:	descr = "Planar YVU 4:4:4 (N-C)"; break;
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16: descr = "AFBC 8-bit YUV420 16x16"; break;
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8: descr = "AFBC 8-bit YUV420 32x8"; break;
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10: descr = "AFBC 10-bit YUV420 16x16"; break;
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10: descr = "AFBC 10-bit YUV420 32x8"; break;
 	case V4L2_PIX_FMT_SBGGR8:	descr = "8-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG8:	descr = "8-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG8:	descr = "8-bit Bayer GRGR/BGBG"; break;
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index f8b1faced79c..d1a75e6a7d4c 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -549,6 +549,10 @@ static inline bool v4l2_is_format_bayer(const struct v4l2_format_info *f)
 	return f && f->pixel_enc == V4L2_PIXEL_ENC_BAYER;
 }
 
+bool v4l2_is_format_afbc(int fourcc);
+size_t v4l2_pixfmt_afbc_header_size(int fourcc, int width, int height);
+size_t v4l2_pixfmt_afbc_payload_size(int fourcc, int width, int height);
+
 const struct v4l2_format_info *v4l2_format_info(u32 format);
 void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize);
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc..88fafadbe13c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -698,6 +698,12 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
 #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
 
+/* AFBC formats */
+#define V4L2_PIX_FMT_AFBC_YUV420_16x16    v4l2_fourcc('A', '1', '6', '8') /* AFBC containing 8-bit YUV420 in 16x16 blocks, sparse, split */
+#define V4L2_PIX_FMT_AFBC_YUV420_32x8     v4l2_fourcc('A', '3', '2', '8') /* AFBC containing 8-bit YUV420 in 32x8 blocks, sparse */
+#define V4L2_PIX_FMT_AFBC_YUV420_16x16_10 v4l2_fourcc('A', '1', '6', 'a') /* AFBC containing 10-bit YUV420 in 16x16 blocks, sparse, split */
+#define V4L2_PIX_FMT_AFBC_YUV420_32x8_10  v4l2_fourcc('A', '3', '2', 'a') /* AFBC containing 10-bit YUV420 in 32x8 blocks, sparse */
+
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
 #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG.. */
-- 
2.43.0


