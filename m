Return-Path: <linux-media+bounces-22462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A79E9E061A
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEFA22833BC
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B72E204F70;
	Mon,  2 Dec 2024 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DrOe8lpa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882DE204093
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151524; cv=none; b=pk/AwjgZ7g8LZeNx6iOPGSiaObZn5oWIdlJRXHPT976151M20n+W+ovNXOESvae7Hkd0ZQwHmIayDP0ry6BMTnUyy/oKP2r0rjqSQtbsaH9WUPGzxf62047o6pcDl2k3evdqcwzLD7gYUEIBU1AGNydn3o/y8w9pLNLLI92NzdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151524; c=relaxed/simple;
	bh=oMcW58QfVTUpM/P97XYYoIy7PQWj8tWqsBOxeeZHGs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uMvDP6V8mgtBqfQu2AK9mYK5MuCzpiGhyyQbfwGsn/DMiBW3wrsZF7LkZT0zsJqN8IjVoWVBOCy8fsWwvoIrQ1N0FWoGqsVxYpKzvDr2uVSyQeojKgTWQhebAUWXxRGUN+2S/WctOzpRzEi8HA5g8R9HKYNhMtgpnHtWF9oKSRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DrOe8lpa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A63B475A;
	Mon,  2 Dec 2024 15:58:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733151494;
	bh=oMcW58QfVTUpM/P97XYYoIy7PQWj8tWqsBOxeeZHGs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DrOe8lpaoivrGr80ZR4lp8Mu4oMTUnrLfnVFbRArz2ymjRaec+ZeO34DVEy3qscSG
	 wi9os+XhEIA8fUTAbmdaKKiOJu3DFSZ7QKIMP+gaOTw4prDU/lO10ruxi9wMSpdASv
	 8C57UTfbCcDb3makkX1I+XIox47qKAR1ylEbsx2w=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	isaac.scott@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 1/5] media: v4l2: Add Renesas Camera Receiver Unit pixel formats
Date: Mon,  2 Dec 2024 14:58:27 +0000
Message-Id: <20241202145831.127297-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202145831.127297-1-dan.scally@ideasonboard.com>
References: <20241202145831.127297-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
data captured from an image sensor without conversion to an RGB/YUV
format. In that case the data are packed into 64-bit blocks, with a
variable amount of padding in the most significant bits depending on
the bitdepth of the data. Add new V4L2 pixel format codes for the new
formats, along with documentation to describe them.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- Switched from bayer-order specific formats to generic RAWnn

Changes in v2:

	- Added labels to the new formats in the documentation file
	- Added 20-bit formats

 .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
 .../media/v4l/pixfmt-rawnn-cru.rst            | 144 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |   4 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
 include/uapi/linux/videodev2.h                |   6 +
 5 files changed, 159 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index ed3eb432967d9..20a8aa0433047 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
     pixfmt-srggb14
     pixfmt-srggb14p
     pixfmt-srggb16
+    pixfmt-rawnn-cru
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
new file mode 100644
index 0000000000000..959ecc33654a1
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
@@ -0,0 +1,144 @@
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
index 0a2f4f0d0a073..696b33add65b8 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -329,10 +329,14 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB10DPCM8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_RAW10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SBGGR12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_RAW12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_RAW14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_CRU_RAW20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 3, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 	};
 	unsigned int i;
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d1..85bd068b14275 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1409,6 +1409,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
 	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
 	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
+	case V4L2_PIX_FMT_CRU_RAW10:	descr = "10-bit Bayer CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
@@ -1417,6 +1418,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
 	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_CRU_RAW12:	descr = "12-bit Bayer CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
@@ -1425,10 +1427,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
 	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_CRU_RAW14:	descr = "14-bit Bayer CRU Packed"; break;
 	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_CRU_RAW20:	descr = "14-bit Bayer CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
 	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce390074..b0482b9af04f5 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -830,6 +830,12 @@ struct v4l2_pix_format {
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


