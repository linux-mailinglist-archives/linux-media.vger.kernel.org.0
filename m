Return-Path: <linux-media+bounces-6996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED02787A732
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 12:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C64C1C22629
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 11:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41ADA3FB09;
	Wed, 13 Mar 2024 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XEkeWyRn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46103F9F9
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710330223; cv=none; b=gBLzqneA37TFQYyxmIXQ1HouoprMZ4ICWJgNwhQ5SCrQrcqJTGZlS7U4IPhlYwTVCrLWloq2Q/nvPE2dowbPSe8Pj3/mudDwJwihx0j0bPXjwcYUCyMLAuyAiRDjUlLrTdYcrlDrcccaK2yiqQHN57Z/uEkJTpW4CyfwisLzr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710330223; c=relaxed/simple;
	bh=76PmVe+9zN5WWY7U0jbBz2lTnOK2WhvDEu+lwOBjo3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQNksYKoaCpLVpj+gYX+CPEKiJbaAvm+RyahcXo2flMNh2SXeRfCADRTO+37RALk+Uvn9fJZHx3kPi/IMioRsFVfjuA2K4QAI9dJzt68Ywo12Gf9UnZ30NHwpTX7uwfAB8JrZhrBMJgA1T/kBx9JA3vFRN44wLiLPhR+ZArp3+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XEkeWyRn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3EC53372;
	Wed, 13 Mar 2024 12:43:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710330192;
	bh=76PmVe+9zN5WWY7U0jbBz2lTnOK2WhvDEu+lwOBjo3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XEkeWyRnu8D6vgocMm056bs0a63VRpt1/9tcQwYwqDcFbUV4t9axwRXgxlS255rGB
	 SpUOSXTDhfv2mvKDUZnk65V0poSX508xe/mQ9fRw+6ko/aQ5neznSRvwfrN9FcNjhg
	 EIBKeHWyU5cFmz9zqcQW7EjBonVAB0LyE+tczjCU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 6/9] media: uapi: Add PiSP Compressed RAW Bayer formats
Date: Wed, 13 Mar 2024 12:43:04 +0100
Message-ID: <20240313114308.51896-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313114308.51896-1-jacopo.mondi@ideasonboard.com>
References: <20240313114308.51896-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Raspberry Pi compressed RAW Bayer formats.

The compression algorithm description is provided by Nick Hollinghurst
<nick.hollinghurst@raspberrypi.com> from Raspberry Pi.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst  |  1 +
 .../media/v4l/pixfmt-srggb8-pisp-comp.rst     | 74 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          | 10 +++
 include/uapi/linux/videodev2.h                | 12 +++
 4 files changed, 97 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index 2500413e5f43..ed3eb432967d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -20,6 +20,7 @@ orders. See also `the Wikipedia article on Bayer filter
     :maxdepth: 1
 
     pixfmt-srggb8
+    pixfmt-srggb8-pisp-comp
     pixfmt-srggb10
     pixfmt-srggb10p
     pixfmt-srggb10alaw8
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
new file mode 100644
index 000000000000..ff0fbcf34258
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
@@ -0,0 +1,74 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _v4l2-pix-fmt-pisp-comp1-rggb:
+.. _v4l2-pix-fmt-pisp-comp1-grbg:
+.. _v4l2-pix-fmt-pisp-comp1-gbrg:
+.. _v4l2-pix-fmt-pisp-comp1-bggr:
+.. _v4l2-pix-fmt-pisp-comp1-mono:
+.. _v4l2-pix-fmt-pisp-comp2-rggb:
+.. _v4l2-pix-fmt-pisp-comp2-grbg:
+.. _v4l2-pix-fmt-pisp-comp2-gbrg:
+.. _v4l2-pix-fmt-pisp-comp2-bggr:
+.. _v4l2-pix-fmt-pisp-comp2-mono:
+
+**************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
+V4L2_PIX_FMT_PISP_COMP1_RGGB ('PC1R'), V4L2_PIX_FMT_PISP_COMP1_GRBG ('PC1G'), V4L2_PIX_FMT_PISP_COMP1_GBRG ('PC1g'), V4L2_PIX_FMT_PISP_COMP1_BGGR ('PC1B), V4L2_PIX_FMT_PISP_COMP1_MONO ('PC1M'), V4L2_PIX_FMT_PISP_COMP2_RGGB ('PC2R'), V4L2_PIX_FMT_PISP_COMP2_GRBG ('PC2G'), V4L2_PIX_FMT_PISP_COMP2_GBRG ('PC2g'), V4L2_PIX_FMT_PISP_COMP2_BGGR ('PC2B), V4L2_PIX_FMT_PISP_COMP2_MONO ('PC2M')
+**************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
+
+================================================
+Raspberry Pi PiSP compressed 8-bit Bayer formats
+================================================
+
+Description
+===========
+
+The Raspberry Pi ISP (PiSP) uses a family of three fixed-rate compressed Bayer
+formats. A black-level offset may be subtracted to improve compression
+efficiency; the nominal black level and amount of offset must be signalled out
+of band. Each scanline is padded to a multiple of 8 pixels wide, and each block
+of 8 horizontally-contiguous pixels is coded using 8 bytes.
+
+Mode 1 uses a quantization and delta-based coding scheme which preserves up to
+12 significant bits. Mode 2 is a simple sqrt-like companding scheme with 6 PWL
+chords, preserving up to 12 significant bits. Mode 3 combines both companding
+(with 4 chords) and the delta scheme, preserving up to 14 significant bits.
+
+The remainder of this description applies to Modes 1 and 3.
+
+Each block of 8 pixels is separated into even and odd phases of 4 pixels,
+coded independently by 32-bit words at successive locations in memory.
+The two LS bits of each 32-bit word give its "quantization mode".
+
+In quantization mode 0, the lowest 321 quantization levels are multiples of
+FSD/4096 and the remaining levels are successive multiples of FSD/2048.
+Quantization modes 1 and 2 use linear quantization with step sizes of
+FSD/1024 and FSD/512 respectively. Each of the four pixels is quantized
+independently, with rounding to the nearest level.
+In quantization mode 2 where the middle two samples have quantized values
+(q1,q2) both in the range [384..511], they are coded using 9 bits for q1
+followed by 7 bits for (q2 & 127). Otherwise, for quantization modes
+0, 1 and 2: a 9-bit field encodes MIN(q1,q2) which must be in the range
+[0..511] and a 7-bit field encodes (q2-q1+64) which must be in [0..127].
+
+Each of the outer samples (q0,q3) is encoded using a 7-bit field based
+on its inner neighbour q1 or q2. In quantization mode 2 where the inner
+sample has a quantized value in the range [448..511], the field value is
+(q0-384). Otherwise for quantization modes 0, 1 and 2: The outer sample
+is encoded as (q0-MAX(0,q1-64)). q3 is likewise coded based on q2.
+Each of these values must be in the range [0..127]. All these fields
+of 2, 9, 7, 7, 7 bits respectively are packed in little-endian order
+to give a 32-bit word with LE byte order.
+
+Quantization mode 3 has a "7.5-bit" escape, used when none of the above
+encodings will fit. Each pixel value is quantized to the nearest of 176
+levels, where the lowest 48 levels are multiples of FSD/256 and the
+remaining levels are multiples of FSD/512 (level 175 represents values
+very close to FSD and may require saturating arithmetic to decode).
+
+Each pair of quantized pixels (q0,q1) or (q2,q3) is jointly coded
+by a 15-bit field: 2816*(q0>>4) + 16*q1 + (q0&15).
+Three fields of 2, 15, 15 bits are packed in LE order {15,15,2}.
+
+An implementation of a software decoder of compressed formats is available
+in `Raspberry Pi camera applications code base
+<https://github.com/raspberrypi/rpicam-apps/blob/main/image/dng.cpp>`_.
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 18e9aa1297e1..fc7af7337ab4 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1516,6 +1516,16 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
+		case V4L2_PIX_FMT_PISP_COMP1_RGGB: descr = "PiSP 8b RGRG/GBGB mode1 compr"; break;
+		case V4L2_PIX_FMT_PISP_COMP1_GRBG: descr = "PiSP 8b GRGR/BGBG mode1 compr"; break;
+		case V4L2_PIX_FMT_PISP_COMP1_GBRG: descr = "PiSP 8b GBGB/RGRG mode1 compr"; break;
+		case V4L2_PIX_FMT_PISP_COMP1_BGGR: descr = "PiSP 8b BGBG/GRGR mode1 compr"; break;
+		case V4L2_PIX_FMT_PISP_COMP1_MONO: descr = "PiSP 8b monochrome mode1 compr"; break;
+		case V4L2_PIX_FMT_PISP_COMP2_RGGB: descr = "PiSP 8b RGRG/GBGB mode2 compr"; break;
+		case V4L2_PIX_FMT_PISP_COMP2_GRBG: descr = "PiSP 8b GRGR/BGBG mode2 compr"; break;
+		case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr = "PiSP 8b GBGB/RGRG mode2 compr"; break;
+		case V4L2_PIX_FMT_PISP_COMP2_BGGR: descr = "PiSP 8b BGBG/GRGR mode2 compr"; break;
+		case V4L2_PIX_FMT_PISP_COMP2_MONO: descr = "PiSP 8b monochrome mode2 compr"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 2125d8d82ee2..5fb3669ad3d6 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -816,6 +816,18 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_IPU3_SGRBG10	v4l2_fourcc('i', 'p', '3', 'G') /* IPU3 packed 10-bit GRBG bayer */
 #define V4L2_PIX_FMT_IPU3_SRGGB10	v4l2_fourcc('i', 'p', '3', 'r') /* IPU3 packed 10-bit RGGB bayer */
 
+/* Raspberry Pi PiSP compressed formats. */
+#define V4L2_PIX_FMT_PISP_COMP1_RGGB	v4l2_fourcc('P', 'C', '1', 'R') /* PiSP 8-bit mode 1 compressed RGGB bayer */
+#define V4L2_PIX_FMT_PISP_COMP1_GRBG	v4l2_fourcc('P', 'C', '1', 'G') /* PiSP 8-bit mode 1 compressed GRBG bayer */
+#define V4L2_PIX_FMT_PISP_COMP1_GBRG	v4l2_fourcc('P', 'C', '1', 'g') /* PiSP 8-bit mode 1 compressed GBRG bayer */
+#define V4L2_PIX_FMT_PISP_COMP1_BGGR	v4l2_fourcc('P', 'C', '1', 'B') /* PiSP 8-bit mode 1 compressed BGGR bayer */
+#define V4L2_PIX_FMT_PISP_COMP1_MONO	v4l2_fourcc('P', 'C', '1', 'M') /* PiSP 8-bit mode 1 compressed monochrome */
+#define V4L2_PIX_FMT_PISP_COMP2_RGGB	v4l2_fourcc('P', 'C', '2', 'R') /* PiSP 8-bit mode 2 compressed RGGB bayer */
+#define V4L2_PIX_FMT_PISP_COMP2_GRBG	v4l2_fourcc('P', 'C', '2', 'G') /* PiSP 8-bit mode 2 compressed GRBG bayer */
+#define V4L2_PIX_FMT_PISP_COMP2_GBRG	v4l2_fourcc('P', 'C', '2', 'g') /* PiSP 8-bit mode 2 compressed GBRG bayer */
+#define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B') /* PiSP 8-bit mode 2 compressed BGGR bayer */
+#define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M') /* PiSP 8-bit mode 2 compressed monochrome */
+
 /* SDR formats - used only for Software Defined Radio devices */
 #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
 #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */
-- 
2.44.0


