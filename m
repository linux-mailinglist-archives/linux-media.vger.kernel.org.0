Return-Path: <linux-media+bounces-18418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA3597D588
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 14:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF673285353
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 12:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6763B1509AF;
	Fri, 20 Sep 2024 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AlyIZNc0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD2F14E2DF
	for <linux-media@vger.kernel.org>; Fri, 20 Sep 2024 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836094; cv=none; b=qqPmYk9UEdJ1t5+dCWqNxQu5gRP7XTBF74TrpTgyxkiIAT8EoNyz1hcQMyHgEZpSGY7iZSoZAnmglgLnGz0yDNRpDOhO28c9fDYTG1UG4LKJXE8ffrevVq8bBanoXLowXijC+Gmz9aAO3ZC3ae17bJJUJRONdpmyEbENVvpTQS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836094; c=relaxed/simple;
	bh=QpwZ76TLzOLqDccGFZldI5QrKWG0O+JkW61nUG5t8TU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F7UED5mlVdoGdgNFO/JaaVFH41O8VHDvvM5BxCdtD5ssa66N2vojsadTv8YWA38r8ApV8a30tKbm5g3sXYcHze9e1IUsI+lu/oqgfyrC5td8EOLrno1NhcEdALzpVH7/uduKS5Lc1LrJ7olKCMA8ORgcTomQ7AQR6OdVAiIZFxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AlyIZNc0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 961C08D4;
	Fri, 20 Sep 2024 14:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726836006;
	bh=QpwZ76TLzOLqDccGFZldI5QrKWG0O+JkW61nUG5t8TU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AlyIZNc0ibzwtp9bFfBEhppqX5dQCzB5Av1Ym5CF6KmuPd0IIICT3vRM3gfVY0G9c
	 62pkuEqNtT7Db+MH1arUK+/Hwku1O/SL38Xagnprtt6DsLvF7QJH8Fytw+qsJsspfJ
	 +sEvFx39yrla0UOpqLi4vwSmXrdFPoR2mBHBly7A=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH 1/4] media: v4l2: Add Renesas Camera Receiver Unit pixel formats
Date: Fri, 20 Sep 2024 13:41:12 +0100
Message-Id: <20240920124115.375748-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920124115.375748-1-dan.scally@ideasonboard.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

The Renesas Camera Receiver Unit in the RZ/G2L and RZ/V2H SoCs can
output RAW data captured from an image sensor without conversion to
an RGB/YUV format. In that case the data are packed into 64-bit
blocks, with a variable amount of padding in the most significant
bits depending on the bitdepth of the data. Add new V4L2 pixel format
codes for the new formats, along with documentation to describe them.

Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
 .../media/v4l/pixfmt-srggbnn-cru.rst          | 143 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |  12 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  12 ++
 include/uapi/linux/videodev2.h                |  16 ++
 5 files changed, 184 insertions(+)
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
index 000000000000..a169b7bbef79
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
@@ -0,0 +1,143 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+******************************************************************************************************************************************
+V4L2_PIX_FMT_CRU_SBGGRnn ('CnnB'), V4L2_PIX_FMT_CRU_SGBRGnn ('CnnG'), V4L2_PIX_FMT_CRU_SGRBGnn ('Cnng'), V4L2_PIX_FMT_CRU_SRGGBnn ('CnnR')
+******************************************************************************************************************************************
+
+========================================================
+Renesas Camera Receiver Unit 64-bit packed pixel formats
+========================================================
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
+
+Description
+===========
+
+These pixel formats are some of the available output formats for the Camera
+Receiver Unit in the Renesas RZ/G2L and V2H SoCs. They are raw sRGB / Bayer
+formats which pack pixels contiguously into 64-bit units, with the 4 or 8 most
+significant bits padded.
+
+The packing format is similar to the IPU3 packing formats defined in
+:ref:`v4l2-pix-fmt-ipu3-sbggr10`, albeit with the packing performed over a much
+shorter window.
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
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a07..ca78d26071c7 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -329,10 +329,22 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
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
 	};
 	unsigned int i;
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index e14db67be97c..9db0ec4a5d77 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1408,6 +1408,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
@@ -1416,6 +1420,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
@@ -1424,6 +1432,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 725e86c4bbbd..8f0e3d8215ab 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -828,6 +828,22 @@ struct v4l2_pix_format {
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
 /* SDR formats - used only for Software Defined Radio devices */
 #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
 #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */
-- 
2.34.1


