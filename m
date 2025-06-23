Return-Path: <linux-media+bounces-35659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E27AE472B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AE92189CDAE
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EE326772C;
	Mon, 23 Jun 2025 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P/U1WYMQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F389D1F09B3
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689812; cv=none; b=ElAUnWFd6Vkia/3kB1CaCso1+6/CinwVVlCkV1uoHUX4/f5384oyVW6ZbEww7xlzNPKqmXvBpc7rfB77RXLdrLzBocmS3JUvVC17hHDu5DqrBr4GMpsUehn8uxAmNUhShKo14YYEJn/QkFajABZQIAfbhWI1yf5Z94LOc3T9TSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689812; c=relaxed/simple;
	bh=uZ4Flwu8OJq1+v/Xp0aiq328Y12Oa4Hh/ANXQDo1qoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+s+wJiPubKUjBXnlAHHed5kxRPHY0SEE592CPJTvIkuE7Zw5dEY209/F42YBmt3bty7Qrq2ybAS1fPqi3EwvWUidsfBesVhcyae8k6zALlKyr8KtE7fERdZ/XKJmUp2j9UzldrP09MoMn/uXnYkDXddirNzqJSShORUZSx/20Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P/U1WYMQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4560D77;
	Mon, 23 Jun 2025 16:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750689792;
	bh=uZ4Flwu8OJq1+v/Xp0aiq328Y12Oa4Hh/ANXQDo1qoA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P/U1WYMQKDU7IFuPai+TQ/l0sJc501pucHOAvoi/lU9Z4+uLd4gs4NfwOpJW9CAMK
	 ahJRwS64oVx0ST5QmmDNSOT2uuIpGi6ReVUskeljePG9YU9I3M5QN8rjmQot5qfw5W
	 bEntqmAoo2K96MMSgEnt89GjdJP461rTZip00inA=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 23 Jun 2025 15:43:18 +0100
Subject: [PATCH v5 1/6] media: v4l2: Add Renesas Camera Receiver Unit pixel
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-rzg2l-cru-v5-1-1663a8c6719a@ideasonboard.com>
References: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
In-Reply-To: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
 dan.scally@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10651;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=77U95NwxyEwHWgW2AG2TZ1Q2FhOpsqbZk6oS1Nl2NL0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWWgOTLjci9rNrpK3pUnqUYmKK+qtG2wYCFdOX
 3YGvgTUIBWJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFloDgAKCRDISVd6bEV1
 MnXMD/0cLeMzXlSpESOxOBAUZueOxKCxIV76DG3It5gwY2evGHzjczlLXPdREPrsVcYpddGk1pP
 o6XSje0IhS/T6meM6JxPYJfpo51FUJlA49RbiW3h4dSnVbsQ1zfjy6toVOPIDVpsYlB8s/cqSEb
 vBxrQpOPHMn43jg6OOhlh42VY5464YTKNUVu8y2zGabie2qI9q02MtYegQupBvbIrMr4nmKmZ8c
 BYIVNRoRlf+QWW3snr7WYwDnWm/b7ZWymR/UWQIWrPs88KlBGaJgo1ItXY97ycQukCQ39ia/WLy
 gPtegewSfogT2lsRH4SIwQhY3tJwzfl8pbBhgCcinicDznHBOrD9/JBnYWV55yyhxsvugFK2+wm
 9XWgnk0bM1c/Yh8Ou8uS9gZ0JbtHNsKR9d9tHYXDmfE4fSDD+BTboE3qZ59PtA8Eb8nW1PL7ewA
 mdOfaJcJ5dWsiQgVk4LTL/YZYAxFAfp2LR0VFa/ih29/sV/wGvbnA+kz99LwULrKE7D1PoaxTpw
 LHj62WrMmNkP/8cRVGU+e7KCWQjEEXYSj33UF/dVrMAghqd7ieUETh6/6FcoPUXCpaBdTLCZsZs
 D/JeZl+sF7oB/XRpaPTuSjXRzWFMJNuScVx/mw20ajabaW/go/xWnxVSJ3cyv3KQ6Xd5LKK47iv
 BPOQU+JbwKzjBIA==
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
index ed3eb432967d9845d3d65150831d8a7f62dec994..20a8aa04330479ed4d44c8e4fc3d57db8c2e6933 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
     pixfmt-srggb14
     pixfmt-srggb14p
     pixfmt-srggb16
+    pixfmt-rawnn-cru
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
new file mode 100644
index 0000000000000000000000000000000000000000..d786833d0cf355b3955fe63d85c8a211a7a4fb23
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
+V4L2_PIX_FMT_CRU_RAW10 ('CR10'), V4L2_PIX_FMT_CRU_RAW12 ('CR12'), V4L2_PIX_FMT_CRU_RAW14 ('CR14'), V4L2_PIX_FMT_CRU_RAW20 ('CR20')
+**********************************************************************************************************************************
+
+===============================================================
+Renesas RZ/V2H Camera Receiver Unit 64-bit packed pixel formats
+===============================================================
+
+| V4L2_PIX_FMT_CRU_RAW10 (CR10)
+| V4L2_PIX_FMT_CRU_RAW12 (CR12)
+| V4L2_PIX_FMT_CRU_RAW14 (CR14)
+| V4L2_PIX_FMT_CRU_RAW20 (CR20)
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
+    * - V4L2_PIX_FMT_CRU_RAW10
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
+    * - V4L2_PIX_FMT_CRU_RAW12
+      - 0
+      - 0
+      - 0
+      - 0
+      - :cspan:`11` P4
+      - :cspan:`11` P3
+      - :cspan:`11` P2
+      - :cspan:`11` P1
+      - :cspan:`11` P0
+    * - V4L2_PIX_FMT_CRU_RAW14
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
+    * - V4L2_PIX_FMT_CRU_RAW20
+      - 0
+      - 0
+      - 0
+      - 0
+      - :cspan:`19` P2
+      - :cspan:`19` P1
+      - :cspan:`19` P0
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index bd160a8c9efedbcefc58b8ecc829e902f392e5c5..d162cebfc4159ff3913416ebb5eaa06e968d0e89 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -344,6 +344,12 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+
+		/* Renesas Camera Data Receiver Unit formats, bayer order agnostic */
+		{ .format = V4L2_PIX_FMT_CRU_RAW10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_RAW12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_RAW14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_RAW20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 3, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 	};
 	unsigned int i;
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 650dc1956f73d2f1943b56c42140c7b8d757259f..c5c2586b11fb1d389b89838449be2e8637b7b6b5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1413,6 +1413,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
 	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
 	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
+	case V4L2_PIX_FMT_CRU_RAW10:	descr = "10-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
@@ -1421,6 +1422,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
 	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_CRU_RAW12:	descr = "12-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
@@ -1429,10 +1431,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
 	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_CRU_RAW14:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_CRU_RAW20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
 	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9e3b366d5fc79d8a04c6f0752858fc23363db65c..13f741c94e49ff6c199efc7a213c4e0de74780fa 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -840,6 +840,12 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B') /* PiSP 8-bit mode 2 compressed BGGR bayer */
 #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M') /* PiSP 8-bit mode 2 compressed monochrome */
 
+/* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixels */
+#define V4L2_PIX_FMT_CRU_RAW10	v4l2_fourcc('C', 'R', '1', '0')
+#define V4L2_PIX_FMT_CRU_RAW12	v4l2_fourcc('C', 'R', '1', '2')
+#define V4L2_PIX_FMT_CRU_RAW14	v4l2_fourcc('C', 'R', '1', '4')
+#define V4L2_PIX_FMT_CRU_RAW20	v4l2_fourcc('C', 'R', '2', '0')
+
 /* SDR formats - used only for Software Defined Radio devices */
 #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
 #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */

-- 
2.34.1


