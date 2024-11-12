Return-Path: <linux-media+bounces-21311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5BA9C5833
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 13:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 309941F21BC5
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 12:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CDE1531C8;
	Tue, 12 Nov 2024 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h4ZvtkHl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69B714D6EF
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415601; cv=none; b=irTmoAnU3vt+oFGeyuN0Sl+idm9NuEdSxuAqNBEwFfIRck5AL960Jf2hd45FGlfzkxnDmQ1mC/KPOHPiNQ2Sf31iiloECaIbDGWWqbhD1L2NQI8mnVwwZQCvCaOXqznctPpkAbGbzKXHs17XBTk1BpCmfvbevCbL7fqmY+1VNH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415601; c=relaxed/simple;
	bh=JtGi77exmMQ+RgQq58Wto7TY4+NHhPF3e8AfZDePr4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p7/dTvp5DAPCS5Fz4Y2+TAw7yjHM6NbT13Go2cdA85qGeRGe9y4+bLmbnp2N8YcK4LMGADj0dOPwND/6BQ+RIABa/RoE3IqOQzPLEyL9PYtQt8q+Gq5ITu4hkM2K1nlDWfCV6tj+SCsOPE1vHmgU9UTTjru499MlkRPXbXdBXIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h4ZvtkHl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F6A178C;
	Tue, 12 Nov 2024 13:46:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731415582;
	bh=JtGi77exmMQ+RgQq58Wto7TY4+NHhPF3e8AfZDePr4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h4ZvtkHlLR2bfPCQgv7edBU594A89AAh7ufqAxgOdpldQBcwOTWTTWISVqMROFid0
	 aJqcU99l1G6661kYQxn8lyQ0BiSEvjchW6wjfMakwi3r7o0NJIoVh7MJiWJX2zDzZs
	 9+qguMkf8A/Zn3XITOsTg2tkeGNKs+4W4s8fLMF4=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH v2 1/4] media: v4l2: Add Renesas Camera Receiver Unit pixel formats
Date: Tue, 12 Nov 2024 12:46:11 +0000
Message-Id: <20241112124614.646281-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112124614.646281-1-dan.scally@ideasonboard.com>
References: <20241112124614.646281-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
data captured from an image sensor without conversion to an RGB/YUV
format. In that case the data are packed into 64-bit blocks, with a
variable amount of padding in the most significant bits depending on
the bitdepth of the data. Add new V4L2 pixel format codes for the new
formats, along with documentation to describe them.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v2:

	- Added labels to the new formats in the documentation file
	- Added 20-bit formats

 .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
 .../media/v4l/pixfmt-srggbnn-cru.rst          | 168 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |  16 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  16 ++
 include/uapi/linux/videodev2.h                |  21 +++
 5 files changed, 222 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index ed3eb432967d..658068364ea1 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
     pixfmt-srggb14
     pixfmt-srggb14p
     pixfmt-srggb16
+    pixfmt-srggbnn-cru
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
new file mode 100644
index 000000000000..ee2a72eb05fb
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
@@ -0,0 +1,168 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _v4l2-pix-fmt-cru-sbggr10:
+.. _v4l2-pix-fmt-cru-sgbrg10:
+.. _v4l2-pix-fmt-cru-sgrbg10:
+.. _v4l2-pix-fmt-cru-srggb10:
+.. _v4l2-pix-fmt-cru-sbggr12:
+.. _v4l2-pix-fmt-cru-sgbrg12:
+.. _v4l2-pix-fmt-cru-sgrbg12:
+.. _v4l2-pix-fmt-cru-srggb12:
+.. _v4l2-pix-fmt-cru-sbggr14:
+.. _v4l2-pix-fmt-cru-sgbrg14:
+.. _v4l2-pix-fmt-cru-sgrbg14:
+.. _v4l2-pix-fmt-cru-srggb14:
+.. _v4l2-pix-fmt-cru-sbggr20:
+.. _v4l2-pix-fmt-cru-sgbrg20:
+.. _v4l2-pix-fmt-cru-sgrbg20:
+.. _v4l2-pix-fmt-cru-srggb20:
+
+******************************************************************************************************************************************
+V4L2_PIX_FMT_CRU_SBGGRnn ('CnnB'), V4L2_PIX_FMT_CRU_SGBRGnn ('CnnG'), V4L2_PIX_FMT_CRU_SGRBGnn ('Cnng'), V4L2_PIX_FMT_CRU_SRGGBnn ('CnnR')
+******************************************************************************************************************************************
+
+===============================================================
+Renesas RZ/V2H Camera Receiver Unit 64-bit packed pixel formats
+===============================================================
+
+| V4L2_PIX_FMT_CRU_SBGGR10 (C10B)
+| V4L2_PIX_FMT_CRU_SGBRG10 (C10G)
+| V4L2_PIX_FMT_CRU_SGRBG10 (C10g)
+| V4L2_PIX_FMT_CRU_SRGGB10 (C10R)
+| V4L2_PIX_FMT_CRU_SBGGR12 (C12B)
+| V4L2_PIX_FMT_CRU_SGBRG12 (C12G)
+| V4L2_PIX_FMT_CRU_SGRBG12 (C12g)
+| V4L2_PIX_FMT_CRU_SRGGB12 (C12R)
+| V4L2_PIX_FMT_CRU_SBGGR14 (C14B)
+| V4L2_PIX_FMT_CRU_SGBRG14 (C14G)
+| V4L2_PIX_FMT_CRU_SGRBG14 (C14g)
+| V4L2_PIX_FMT_CRU_SRGGB14 (C14R)
+| V4L2_PIX_FMT_CRU_SBGGR20 (C20B)
+| V4L2_PIX_FMT_CRU_SGBRG20 (C20G)
+| V4L2_PIX_FMT_CRU_SGRBG20 (C20g)
+| V4L2_PIX_FMT_CRU_SRGGB20 (C20R)
+
+Description
+===========
+
+These pixel formats are some of the Bayer RAW outputs for the Camera Receiver
+Unit in the Renesas RZ/V2H SoC. They are raw sRGB / Bayer formats which pack
+pixels contiguously into 64-bit units, with the 4 or 8 most significant
+bits padded.
+
+**Byte Order**
+
+.. flat-table:: RGB formats
+    :header-rows:  2
+    :stub-columns: 0
+    :widths: 36 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
+    :fill-cells:
+
+    * - :rspan:`1` Pixel Format Code
+      - :cspan:`63` Data organization
+    * - 63
+      - 62
+      - 61
+      - 60
+      - 59
+      - 58
+      - 57
+      - 56
+      - 55
+      - 54
+      - 53
+      - 52
+      - 51
+      - 50
+      - 49
+      - 48
+      - 47
+      - 46
+      - 45
+      - 44
+      - 43
+      - 42
+      - 41
+      - 40
+      - 39
+      - 38
+      - 37
+      - 36
+      - 35
+      - 34
+      - 33
+      - 32
+      - 31
+      - 30
+      - 29
+      - 28
+      - 27
+      - 26
+      - 25
+      - 24
+      - 23
+      - 22
+      - 21
+      - 20
+      - 19
+      - 18
+      - 17
+      - 16
+      - 15
+      - 14
+      - 13
+      - 12
+      - 11
+      - 10
+      - 9
+      - 8
+      - 7
+      - 6
+      - 5
+      - 4
+      - 3
+      - 2
+      - 1
+      - 0
+    * - V4L2_PIX_FMT_CRU_SBGGR10
+      - 0
+      - 0
+      - 0
+      - 0
+      - :cspan:`9` P5
+      - :cspan:`9` P4
+      - :cspan:`9` P3
+      - :cspan:`9` P2
+      - :cspan:`9` P1
+      - :cspan:`9` P0
+    * - V4L2_PIX_FMT_CRU_SBGGR12
+      - 0
+      - 0
+      - 0
+      - 0
+      - :cspan:`11` P4
+      - :cspan:`11` P3
+      - :cspan:`11` P2
+      - :cspan:`11` P1
+      - :cspan:`11` P0
+    * - V4L2_PIX_FMT_CRU_SBGGR14
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - :cspan:`13` P3
+      - :cspan:`13` P2
+      - :cspan:`13` P1
+      - :cspan:`13` P0
+    * - V4L2_PIX_FMT_CRU_SBGGR20
+      - 0
+      - 0
+      - 0
+      - 0
+      - :cspan:`19` P2
+      - :cspan:`19` P1
+      - :cspan:`19` P0
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a07..af7cd70fa41c 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -329,10 +329,26 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SBGGR10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SGBRG10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SGRBG10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SRGGB10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SBGGR12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SBGGR12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SBGGR14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SGBRG14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SGRBG14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SRGGB14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SBGGR20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 3, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SGBRG20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 3, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SGRBG20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 3, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_SRGGB20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 3, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 	};
 	unsigned int i;
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..642d755a7d7a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1409,6 +1409,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
 	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
 	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
+	case V4L2_PIX_FMT_CRU_SBGGR10:	descr = "10-bit Bayer BGGR CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SGBRG10:	descr = "10-bit Bayer GBRG CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SGRBG10:	descr = "10-bit Bayer GRBG CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SRGGB10:	descr = "10-bit Bayer RGGB CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
@@ -1417,6 +1421,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
 	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_CRU_SBGGR12:	descr = "12-bit Bayer BGGR CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SGBRG12:	descr = "12-bit Bayer GBRG CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SGRBG12:	descr = "12-bit Bayer GRBG CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SRGGB12:	descr = "12-bit Bayer RGGB CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
@@ -1425,10 +1433,18 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
 	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_CRU_SBGGR14:	descr = "14-bit Bayer BGGR CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SGBRG14:	descr = "14-bit Bayer GBRG CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SGRBG14:	descr = "14-bit Bayer GRBG CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SRGGB14:	descr = "14-bit Bayer RGGB CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_CRU_SBGGR20:	descr = "14-bit Bayer BGGR CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SGBRG20:	descr = "14-bit Bayer GBRG CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SGRBG20:	descr = "14-bit Bayer GRBG CRU Packed"; break;
+	case V4L2_PIX_FMT_CRU_SRGGB20:	descr = "14-bit Bayer RGGB CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
 	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..38ace20a4f84 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -830,6 +830,27 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B') /* PiSP 8-bit mode 2 compressed BGGR bayer */
 #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M') /* PiSP 8-bit mode 2 compressed monochrome */
 
+/* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixels */
+#define V4L2_PIX_FMT_CRU_SBGGR10	v4l2_fourcc('C', '1', '0', 'B')
+#define V4L2_PIX_FMT_CRU_SGBRG10	v4l2_fourcc('C', '1', '0', 'G')
+#define V4L2_PIX_FMT_CRU_SGRBG10	v4l2_fourcc('C', '1', '0', 'g')
+#define V4L2_PIX_FMT_CRU_SRGGB10	v4l2_fourcc('C', '1', '0', 'R')
+
+#define V4L2_PIX_FMT_CRU_SBGGR12	v4l2_fourcc('C', '1', '2', 'B')
+#define V4L2_PIX_FMT_CRU_SGBRG12	v4l2_fourcc('C', '1', '2', 'G')
+#define V4L2_PIX_FMT_CRU_SGRBG12	v4l2_fourcc('C', '1', '2', 'g')
+#define V4L2_PIX_FMT_CRU_SRGGB12	v4l2_fourcc('C', '1', '2', 'R')
+
+#define V4L2_PIX_FMT_CRU_SBGGR14	v4l2_fourcc('C', '1', '4', 'B')
+#define V4L2_PIX_FMT_CRU_SGBRG14	v4l2_fourcc('C', '1', '4', 'G')
+#define V4L2_PIX_FMT_CRU_SGRBG14	v4l2_fourcc('C', '1', '4', 'g')
+#define V4L2_PIX_FMT_CRU_SRGGB14	v4l2_fourcc('C', '1', '4', 'R')
+
+#define V4L2_PIX_FMT_CRU_SBGGR20	v4l2_fourcc('C', '2', '0', 'B')
+#define V4L2_PIX_FMT_CRU_SGBRG20	v4l2_fourcc('C', '2', '0', 'G')
+#define V4L2_PIX_FMT_CRU_SGRBG20	v4l2_fourcc('C', '2', '0', 'g')
+#define V4L2_PIX_FMT_CRU_SRGGB20	v4l2_fourcc('C', '2', '0', 'R')
+
 /* SDR formats - used only for Software Defined Radio devices */
 #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
 #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */
-- 
2.34.1


