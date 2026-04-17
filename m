Return-Path: <linux-media+bounces-58977-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBOFA0fz4Wmv0AAAu9opvQ
	(envelope-from <linux-media+bounces-58977-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:45:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E2418E09
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D5A631BFA37
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23E937648F;
	Fri, 17 Apr 2026 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Fs1AvCeI"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B3374E48;
	Fri, 17 Apr 2026 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415091; cv=none; b=qR4kJdTzQQICgGsxV/YB23Bcgm3kR7k21brdulmAV1uHj8UY+YYRvbUOO8tvpPvJaNYKOGrjBlzLmH8sy6gyb4MWFtISzumcLO23xMctg8PEdMNh/jhoZlZu1Xk/ghW/40p9Mvc0yYaOKuZctRcFIP1/BYpdHnEaDIRMt2dKVLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415091; c=relaxed/simple;
	bh=+08eqg5Yh2iwWBtDDBxz5ahmhSbcR+w/dAmFiH5uAoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YEjpDUBXKPxoTlsXwZ+OoXjUE515EaUMTJd4NO4S+7BJCynZ8+XUPhKUhkoGm9/VTmgZQ9w1gZjsXcUFtyDlw8YWkXUHvsqeeGIXuhMvAr7y9dYHMuxYd7HbTR3wSqYb5c0qpNITMDE552FjDxjSmVBIta2lfxua1jBR3+Iwde0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Fs1AvCeI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776415088;
	bh=+08eqg5Yh2iwWBtDDBxz5ahmhSbcR+w/dAmFiH5uAoI=;
	h=From:To:Cc:Subject:Date:From;
	b=Fs1AvCeIFd7U3OU3oY0oEMtPtxO8yIQa+f8bnpQVNnxCAjjNwUV2xfP3KfDKr60Rt
	 OO/Pah7bV5TWHm7yQQjTOyWjc3Rc6etQJqAns2Kd7wHtpY0cINmA+0PFBrqPONvnhC
	 ZpCZduN338nUa7isAvpZONLOH40+PJuChh5BcZ4tsx1HAbpB2sluO8HUwbeNYnGwb7
	 GNovrnPmGNlnK+kDtPm30vMaMu8qtnNzq7uhnINGPiFYGEirdnILJN0UMK3Tx9JrDY
	 ayHklclMtSIjqD46sgT8XWAbwE5VUkVrqNHD84eueT71ZtSfzBfwLMFdSeklvbYEJk
	 3dlYoJrCu2QkA==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9E0D17E10A4;
	Fri, 17 Apr 2026 10:38:07 +0200 (CEST)
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
Subject: [RFC v2] media: Add AFBC pixel formats
Date: Fri, 17 Apr 2026 10:38:02 +0200
Message-ID: <20260417083802.16167-1-benjamin.gaignard@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-58977-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid,siliconimaging.com:url]
X-Rspamd-Queue-Id: 8D1E2418E09
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
 .../userspace-api/media/v4l/pixfmt-afbc.rst   |  74 +++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |   1 +
 drivers/media/v4l2-core/v4l2-common.c         | 104 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
 include/media/v4l2-common.h                   |   4 +
 include/uapi/linux/videodev2.h                |   6 +
 6 files changed, 193 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-afbc.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst b/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst
new file mode 100644
index 000000000000..7fad401b95ce
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst
@@ -0,0 +1,74 @@
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
+.. tabularcolumns:: |p{5.2cm}|p{1.0cm}|p{1.5cm}|p{5.0cm}|p{1.2cm}|p{1.8cm}|p{10.0cm}|
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
+      - DRM format (modifier)
+    * - V4L2_PIX_FMT_AFBC_YUV420_16x16_SPLIT
+      - 'A168'
+      - YUV420
+      - 8 bits
+      - 16x16
+      - Sparse, Split
+      - DRM_FORMAT_YUV420_8BIT (AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 | AFBC_FORMAT_MOD_SPARSE | AFBC_FORMAT_MOD_SPLIT)
+    * - V4L2_PIX_FMT_AFBC_YUV420_32x8
+      - 'A328'
+      - YUV420
+      - 8 bits
+      - 32x8
+      - Sparse
+      - DRM_FORMAT_YUV420_8BIT (AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 | AFBC_FORMAT_MOD_SPARSE)
+    * - V4L2_PIX_FMT_AFBC_YUV420_16x16_10_SPLIT
+      - 'A16a'
+      - YUV420
+      - 10 bits
+      - 16x16
+      - Sparse, Split
+      - DRM_FORMAT_YUV420_10BIT (AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 | AFBC_FORMAT_MOD_SPARSE | AFBC_FORMAT_MOD_SPLIT)
+    * - V4L2_PIX_FMT_AFBC_YUV420_32x8_10
+      - 'A32a'
+      - YUV420
+      - 10 bits
+      - 32x8
+      - Sparse
+      - DRM_FORMAT_YUV420_10BIT (AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 | AFBC_FORMAT_MOD_SPARSE)
+
+AFBC Stride computation
+=======================
+
+Stride is equal to the aligned width * 3 * bits per component / 2 / 8.
+
+.. _V4L2-PIX-FMT-AFBC-YUV420-16x16-SPLIT:
+.. _V4L2-PIX-FMT-AFBC-YUV420-32x8:
+.. _V4L2-PIX-FMT-AFBC-YUV420-16x16-10-SPLIT:
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
index 554c591e1113..1383d39cc521 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -332,6 +332,16 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV12MT_16X16,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 16,  8, 0, 0 },	.block_h = { 16,  8, 0, 0 }},
 
+		/* AFBC formats */
+		{ .format = V4L2_PIX_FMT_AFBC_YUV420_16x16_SPLIT, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
+		  .block_w = { 16, 0, 0, 0 },	.block_h = { 16, 0, 0, 0 }},
+		{ .format = V4L2_PIX_FMT_AFBC_YUV420_32x8, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
+		  .block_w = { 32, 0, 0, 0 },	.block_h = { 8, 0, 0, 0 }},
+		{ .format = V4L2_PIX_FMT_AFBC_YUV420_16x16_10_SPLIT, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 15, 0, 0, 0 }, .bpp_div = { 8, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
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
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_SPLIT:
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10_SPLIT:
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
+	int width_in_block, height_in_block, block_payload_size = 0;
+
+	if (!v4l2_is_format_afbc(fourcc))
+		return 0;
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_SPLIT:
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10_SPLIT:
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
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_SPLIT:
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
+		block_payload_size = 384;
+		break;
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10_SPLIT:
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
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_SPLIT:
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10_SPLIT:
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
index a2b650f4ec3c..e731c7e4fba9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1387,6 +1387,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_YVU422M:	descr = "Planar YVU 4:2:2 (N-C)"; break;
 	case V4L2_PIX_FMT_YUV444M:	descr = "Planar YUV 4:4:4 (N-C)"; break;
 	case V4L2_PIX_FMT_YVU444M:	descr = "Planar YVU 4:4:4 (N-C)"; break;
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_SPLIT: descr = "AFBC 8-bit YUV420 16x16 split"; break;
+	case V4L2_PIX_FMT_AFBC_YUV420_32x8: descr = "AFBC 8-bit YUV420 32x8"; break;
+	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10_SPLIT: descr = "AFBC 10-bit YUV420 16x16 split"; break;
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
index eda4492e40dc..ffaaaa955156 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -698,6 +698,12 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
 #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
 
+/* AFBC formats */
+#define V4L2_PIX_FMT_AFBC_YUV420_16x16_SPLIT	v4l2_fourcc('A', '1', '6', '8') /* AFBC containing 8-bit YUV420 in 16x16 blocks, sparse, split */
+#define V4L2_PIX_FMT_AFBC_YUV420_32x8		v4l2_fourcc('A', '3', '2', '8') /* AFBC containing 8-bit YUV420 in 32x8 blocks, sparse */
+#define V4L2_PIX_FMT_AFBC_YUV420_16x16_10_SPLIT v4l2_fourcc('A', '1', '6', 'a') /* AFBC containing 10-bit YUV420 in 16x16 blocks, sparse, split */
+#define V4L2_PIX_FMT_AFBC_YUV420_32x8_10	v4l2_fourcc('A', '3', '2', 'a') /* AFBC containing 10-bit YUV420 in 32x8 blocks, sparse */
+
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
 #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG.. */
-- 
2.43.0


