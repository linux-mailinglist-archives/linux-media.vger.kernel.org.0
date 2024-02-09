Return-Path: <linux-media+bounces-4889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A084FA16
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 17:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5686E1C2912A
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 16:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32497BAED;
	Fri,  9 Feb 2024 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FhN15mYY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D26128388
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497334; cv=none; b=amwUrRYgUHdj/aoGAyoDoz+KQy2s8uOPL/SEcdV4NBMerU8skfl7FytddWEiNb0cmuEDQPuSrc1kqZLuK/HC76SdofE4+bExLwDUZygKPzsleuwqX7xIMwgwLZQlpf39n6+f8HwMKrAqqUQaIDfdUFJZcIZpTPS3LzrVbCSt27g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497334; c=relaxed/simple;
	bh=297Ddslcy/gPV+tSPhS1lhAFRGwfoWsPexvOCcidt5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSWYqd5+souNJqxaev2APe6kd46/T/Hq6ihEHuN+u5VEepXMOhSZRMQhyKIWfhILcpdmWhFfG9MSriSohP8MFXhHSabP5bB0Ftdl8LvLmmQB1Kr9xUMD/4f8NljDdbZ9PE02bSzlObQo4rlVxQmHpyMV10YPMdebPlxgvaD92NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FhN15mYY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9936F1ADE;
	Fri,  9 Feb 2024 17:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707497241;
	bh=297Ddslcy/gPV+tSPhS1lhAFRGwfoWsPexvOCcidt5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FhN15mYYNUYvic+Yk+C734B8xJIAr0ahZ9rNKm1pJPFqOJ8OMBegBF0WsbS+mrsuC
	 1yr3Qf2eWUe2dJaYQ95S/l6ZQp+2JLde79VmfoP7YrD8JSjiGBdwqTvPoBiOMEnR1G
	 C62zraCiwfB9xNPZ7YtBcIS+uHVVN3LAqp5zupSc=
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
Subject: [PATCH 2/8] media: Add a pixel format for MIPI packed 14bit luma only
Date: Fri,  9 Feb 2024 17:48:17 +0100
Message-ID: <20240209164825.166800-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

This is the format used by monochrome 14bit image sensors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-y14p.rst   | 47 +++++++++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  1 +
 4 files changed, 50 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y14p.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y14p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y14p.rst
new file mode 100644
index 000000000000..8e986bc6904f
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y14p.rst
@@ -0,0 +1,47 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _V4L2-PIX-FMT-Y14P:
+
+**************************
+V4L2_PIX_FMT_Y14P ('Y14P')
+**************************
+
+Grey-scale image as a MIPI RAW14 packed array
+
+
+Description
+===========
+
+This is a packed grey-scale image format with a depth of 14 bits per
+pixel. Every four consecutive samples are packed into seven bytes. Each
+of the first four bytes contain the eight high order bits of the pixels,
+and the three following bytes contains the six least significants bits of
+each pixel, in the same order.
+
+**Byte Order.**
+Each cell is one byte.
+
+.. tabularcolumns:: |p{1.8cm}|p{1.0cm}|p{1.0cm}|p{1.0cm}|p{1.1cm}|p{3.3cm}|p{3.3cm}|p{3.3cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       2 1 1 1 1 3 3 3
+
+
+    -  -  start + 0:
+       -  Y'\ :sub:`00high`
+       -  Y'\ :sub:`01high`
+       -  Y'\ :sub:`02high`
+       -  Y'\ :sub:`03high`
+       -  Y'\ :sub:`01low bits 1--0`\ (bits 7--6)
+
+	  Y'\ :sub:`00low bits 5--0`\ (bits 5--0)
+
+       -  Y'\ :sub:`02low bits 3--0`\ (bits 7--4)
+
+	  Y'\ :sub:`01low bits 5--2`\ (bits 3--0)
+
+       -  Y'\ :sub:`03low bits 5--0`\ (bits 7--2)
+
+	  Y'\ :sub:`02low bits 5--4`\ (bits 1--0)
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
index 7c9ccfdd94cd..6104747d17d4 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -268,6 +268,7 @@ image.
     pixfmt-yuv-planar
     pixfmt-yuv-luma
     pixfmt-y12p
+    pixfmt-y14p
     pixfmt-y8i
     pixfmt-y12i
     pixfmt-uv8
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 483498c55899..24f52485e59c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1312,6 +1312,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
 	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
 	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
+	case V4L2_PIX_FMT_Y14P:		descr = "14-bit Greyscale (MIPI Packed)"; break;
 	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
 	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 11ebf9b22ccb..94a0373e8234 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -599,6 +599,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
 #define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
+#define V4L2_PIX_FMT_Y14P    v4l2_fourcc('Y', '1', '4', 'P') /* 14  Greyscale, MIPI RAW12 packed */
 #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
 
 /* Palette formats */
-- 
2.43.0


