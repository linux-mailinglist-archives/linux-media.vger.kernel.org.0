Return-Path: <linux-media+bounces-5818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 999728617F8
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 17:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FDB128BF6F
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 16:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC6E12B168;
	Fri, 23 Feb 2024 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mwG3WUvP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C484128815
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 16:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705861; cv=none; b=BdJj8FMouwOIdAchSntqeCVTxgHpxwvfl1AScHMwt2NKdlkBCKVa/czGehFNLXwdk+3x68Nv1GE7PsKQ85S2Ji8z8qwH5QXUq81cgcD02kYOuY2jskwB+eY4MjDK8yk/7GCv6FM/rdR+fAD8bOeGCfNoQ1u88DY+v9RIzcanm30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705861; c=relaxed/simple;
	bh=BsADNnRG8gobZFTN9m3x8Co3Nq9lAUoQopL11WHTmUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBZAMiVmkJThceCclGHVsRGfb3mWyhTc7dLZyoKfXsAnn1lUUXvEqDYQsaqpYJdxiO1Vh+ZPos5z4uhzRyRAfCRNJwNsybeMjq2apZSOBablmAnXehpAGFEHZIDjSTVqpCKOlvH6k2wyfCrUNIOTC+ZyTtDM1F+e0sOZ3v2i+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mwG3WUvP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6250E1803;
	Fri, 23 Feb 2024 17:30:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708705842;
	bh=BsADNnRG8gobZFTN9m3x8Co3Nq9lAUoQopL11WHTmUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mwG3WUvPNPJKrxk2acxXoTaiuI+K9Yv2doNStKRwkyPDSTxLVS+aASgEyOPFNG6Zl
	 vnX7HplGEDsQElh6zVXt0+sSwPGzn6R4Q+F4I2kjQx9GLvy54Hjog7dQQ/4+iSUPpP
	 3a1jmCym4U4DDk1SbrU4aWPAPsIlX6BGcaPyNZNA=
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
Subject: [PATCH v2 6/9] media: uapi: Add PiSP Compressed RAW Bayer formats
Date: Fri, 23 Feb 2024 17:30:08 +0100
Message-ID: <20240223163012.300763-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
References: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
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
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst  |  1 +
 .../media/v4l/pixfmt-pisp-comp-rggb.rst       | 70 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          | 10 +++
 include/uapi/linux/videodev2.h                | 12 ++++
 4 files changed, 93 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index 2500413e5f43..81b69ea4084a 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -30,3 +30,4 @@ orders. See also `the Wikipedia article on Bayer filter
     pixfmt-srggb14
     pixfmt-srggb14p
     pixfmt-srggb16
+    pixfmt-pisp-comp-rggb
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst b/Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst
new file mode 100644
index 000000000000..7be1b25b2241
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst
@@ -0,0 +1,70 @@
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
+================================================
+Raspberry Pi PiSP compressed 8-bit Bayer formats
+================================================
+
+Description
+===========
+
+Raspberry Pi ISP uses a family of three fixed-rate compressed Bayer formats.
+A black-level offset may be subtracted to improve compression efficiency;
+the nominal black level and amount of offset must be signalled out of band.
+Each scanline is padded to a multiple of 8 pixels wide, and each block of 8
+horizontally-contiguous pixels is coded using 8 bytes.
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
+<https://github.com/raspberrypi/rpicam-apps/blob/main/image/dng.cpp>_`.
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
index c3daf61f43d5..feab8a153d2e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -818,6 +818,18 @@ struct v4l2_pix_format {
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
2.43.0


