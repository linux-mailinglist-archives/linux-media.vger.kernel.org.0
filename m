Return-Path: <linux-media+bounces-35854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8267DAE7CD2
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 11:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDD721763F1
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 09:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2AD29DB9B;
	Wed, 25 Jun 2025 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W4dHbvqx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F50729CB4D
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843250; cv=none; b=C3/Hkz13iQPRBS0PS2SUS/Lv4Fvfhlf427hKwXeHvWY3uHjkypD/Ky4/PJJesPAdxtgJAvmkjsgTm8C9qq89FHmdf19dw3SRpiPnsG9Wm+ljETMuYGW86qppeV55ANI2CImhHM8nnP7QSwwl2PDYbV4R5aegFIdd/tjln4hCj4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843250; c=relaxed/simple;
	bh=0JjiKv7ZHsMBR/2yJFQTlryrnv8Nx630Cw+Pz9FWLfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEB1cUIoEGNoj+laAe2IFKiIxg/WYrp4wkckw5T3q6t7rtfJWPAQfoH9RQlNTNejfan4oeF6bslWxS9dxJiEW+hYHF354voMjKEgizrmqLyBrF+J0QnM7Ns+ijsqmSFuaNhKdyObdTASQ2uVDCGiNAETxUUV9xyuJI+3CF/nBoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W4dHbvqx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F10967F0;
	Wed, 25 Jun 2025 11:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750843221;
	bh=0JjiKv7ZHsMBR/2yJFQTlryrnv8Nx630Cw+Pz9FWLfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W4dHbvqxFJqxmBlRKQcgMGJfjm9B2WE5R+elFWEJ4v+f17mcl6UR+LrtJ/dOrbjhv
	 xZj4zIX3HtBIpqa4URrJMmjUaINEJqpIpCQA2x+6rGhfY7DTY9iGGk14bi3R0LYGl7
	 32AjK+nuxqTrqGknVDzEIPEKeIc8+IOkPlCY5XAA=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 25 Jun 2025 10:20:27 +0100
Subject: [PATCH v6 1/6] media: v4l2: Add Renesas Camera Receiver Unit pixel
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-rzg2l-cru-v6-1-a9099ed26c14@ideasonboard.com>
References: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
In-Reply-To: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
 dan.scally@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10766;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=K3g4FMnQ/cl7PVspXRlTnYun4XPfxJMujgtnENx479o=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoW79kUcsoki6wqQkpLuoukIleTHbhvQLYceCD5
 wbDKwVHZbGJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFu/ZAAKCRDISVd6bEV1
 MuOaD/9sTXJOkS+1cLQdtDiJuUEhmvO8dwkRb6kEU8sPc9wuhk1sS1Dd8bVmhSSG5Tvlx3GWdZq
 nfNWD2Q4w6em5XGj6PBqiRu1J7UW8tgzZuyrU4XeEE7fl2R5PO981dxnJcJVdDDtnVjaShUXBiE
 I1fT0JbGpiY7Tdf1D1qqcwfPt6q/puKgEGkLLf06QH+PtbImQq5wzfd+8EWeEe/Jfand51BzaLw
 873yP3I70t7e+RwfnLNdMjFpbo7apBeSMWemTEVzbM3Dt79Hnp9E0Eekz8xjvkoz0LXRwZpOlOE
 9oxShbiwLgh15q0qpaBufEDE5pDRx9epvzloUS6NztVUpEV5l3vi/WPd3qAHVEXxaw/DndtuVZE
 I7zV5DkmtrNN0U4hPgPxhcILz6JH8cVmWwrApuyEa3hYWPOgTStVyFcDv24PipwCOrp7jiCmtrw
 cwJw/vPl8bk0eepbXAGCDIaNkrLtPLorc3GQ4xYPp6bUIafSyOExYHnJYmOzVKKAAFUfpku5OO3
 moZMBewx/lEmnYncNgxNqqpbDQNpBckhL0sf4xSTUXCF3VL2PQNB3KZmDcD77rZ0/0atP5yONX/
 nSoItYmabRkX4MnIzi0R8hwqSdGqHJxjQVOnZrR71nWh0Ah8kYhn+4NinrlSdaTbBjf/QFD+2JO
 Wx4wH4W2OKN9vLg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
data captured from an image sensor without conversion to an RGB/YUV
format. In that case the data are packed into 64-bit blocks, with a
variable amount of padding in the most significant bits depending on
the bitdepth of the data. Add new V4L2 pixel format codes for the new
formats, along with documentation to describe them.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v6:

	- Rename the new formats with s/CRU_RAW/RAW_CRU/

Changes in v5:

	- None

Changes in v4:

	- Removed references to "Bayer" or "srgb"

Changes in v3:

	- Switched from bayer-order specific formats to generic RAWnn

Changes in v2:

	- Added labels to the new formats in the documentation file
	- Added 20-bit formats
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
 .../userspace-api/media/v4l/pixfmt-rawnn-cru.rst   | 143 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c              |   6 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 include/uapi/linux/videodev2.h                     |   6 +
 5 files changed, 160 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index ed3eb432967d9845d3d65150831d8a7f62dec994..b5ca501842b0df0ff0ad32c6aff130fdd28939ee 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -19,6 +19,7 @@ orders. See also `the Wikipedia article on Bayer filter
 .. toctree::
     :maxdepth: 1
 
+    pixfmt-rawnn-cru
     pixfmt-srggb8
     pixfmt-srggb8-pisp-comp
     pixfmt-srggb10
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
new file mode 100644
index 0000000000000000000000000000000000000000..07726e9fb1b5bdda2c00a0d712e83523493bbd83
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
@@ -0,0 +1,143 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _v4l2-pix-fmt-cru-raw10:
+.. _v4l2-pix-fmt-cru-raw12:
+.. _v4l2-pix-fmt-cru-raw14:
+.. _v4l2-pix-fmt-cru-raw20:
+
+**********************************************************************************************************************************
+V4L2_PIX_FMT_RAW_CRU10 ('CR10'), V4L2_PIX_FMT_RAW_CRU12 ('CR12'), V4L2_PIX_FMT_RAW_CRU14 ('CR14'), V4L2_PIX_FMT_RAW_CRU20 ('CR20')
+**********************************************************************************************************************************
+
+===============================================================
+Renesas RZ/V2H Camera Receiver Unit 64-bit packed pixel formats
+===============================================================
+
+| V4L2_PIX_FMT_RAW_CRU10 (CR10)
+| V4L2_PIX_FMT_RAW_CRU12 (CR12)
+| V4L2_PIX_FMT_RAW_CRU14 (CR14)
+| V4L2_PIX_FMT_RAW_CRU20 (CR20)
+
+Description
+===========
+
+These pixel formats are some of the RAW outputs for the Camera Receiver Unit in
+the Renesas RZ/V2H SoC. They are raw formats which pack pixels contiguously into
+64-bit units, with the 4 or 8 most significant bits padded.
+
+**Byte Order**
+
+.. flat-table:: RAW formats
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
+    * - V4L2_PIX_FMT_RAW_CRU10
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
+    * - V4L2_PIX_FMT_RAW_CRU12
+      - 0
+      - 0
+      - 0
+      - 0
+      - :cspan:`11` P4
+      - :cspan:`11` P3
+      - :cspan:`11` P2
+      - :cspan:`11` P1
+      - :cspan:`11` P0
+    * - V4L2_PIX_FMT_RAW_CRU14
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
+    * - V4L2_PIX_FMT_RAW_CRU20
+      - 0
+      - 0
+      - 0
+      - 0
+      - :cspan:`19` P2
+      - :cspan:`19` P1
+      - :cspan:`19` P0
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index bd160a8c9efedbcefc58b8ecc829e902f392e5c5..8cb452ffe3f08f4ba1605cef32b6a92cc10c1dc7 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -344,6 +344,12 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+
+		/* Renesas Camera Data Receiver Unit formats, bayer order agnostic */
+		{ .format = V4L2_PIX_FMT_RAW_CRU10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RAW_CRU12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RAW_CRU14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RAW_CRU20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 3, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 	};
 	unsigned int i;
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 650dc1956f73d2f1943b56c42140c7b8d757259f..be94a79b976e3de4eb957f5d2584ec6d4230469e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1413,6 +1413,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
 	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
 	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
+	case V4L2_PIX_FMT_RAW_CRU10:	descr = "10-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
@@ -1421,6 +1422,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
 	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_RAW_CRU12:	descr = "12-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
@@ -1429,10 +1431,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
 	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_RAW_CRU14:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
 	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9e3b366d5fc79d8a04c6f0752858fc23363db65c..6f7bd38dd5aa4b1b2084685512512a380d76a5e4 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -840,6 +840,12 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B') /* PiSP 8-bit mode 2 compressed BGGR bayer */
 #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M') /* PiSP 8-bit mode 2 compressed monochrome */
 
+/* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixels */
+#define V4L2_PIX_FMT_RAW_CRU10	v4l2_fourcc('C', 'R', '1', '0')
+#define V4L2_PIX_FMT_RAW_CRU12	v4l2_fourcc('C', 'R', '1', '2')
+#define V4L2_PIX_FMT_RAW_CRU14	v4l2_fourcc('C', 'R', '1', '4')
+#define V4L2_PIX_FMT_RAW_CRU20	v4l2_fourcc('C', 'R', '2', '0')
+
 /* SDR formats - used only for Software Defined Radio devices */
 #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
 #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */

-- 
2.34.1


