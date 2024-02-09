Return-Path: <linux-media+bounces-4887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6248484FA12
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 17:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 185941F266B3
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 16:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2DF7EF02;
	Fri,  9 Feb 2024 16:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="th9YduPC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0A07691B
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497331; cv=none; b=VdE+Lwh8wNWpM3KbDl/TsQ6hH7KZkKQ1A2u4PYScJ5mfQaPe60WRZd6YlHCVVMRW2V8Skoet+XdgkudS6hqJMoJhPcLfCZH694QTJbiwXOTWkosqwuUkd7rhi0kaFouLLI7NIClLj80gEehUNB7S8k087ZKtkJPmwq4Wt9k/J8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497331; c=relaxed/simple;
	bh=ZGU1VA9GBaD+RhQlH+sll9LBO9QBQ0ojmgtgWRLM5zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyKp/VvuWRozAnC8xgDMuUz8/Q7MwZojOGthe6+BOBwF2CMnXgdXg/n8V1aDqNOdYbX/ESONU53MDHpxXwmvPAeCXWtlgRWZ5dJMNl7wa/DVn+eBKYkOMjisi7/DhMmvsBNpMJaGBxIxE6cWxdmQpGLzhhVM6ku5qRXuh0NiXEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=th9YduPC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5BDCD01;
	Fri,  9 Feb 2024 17:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707497240;
	bh=ZGU1VA9GBaD+RhQlH+sll9LBO9QBQ0ojmgtgWRLM5zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=th9YduPC72ScDIdHI0U7aP5vuJJSQ6dENbuDrwIhb16r4r8v/7T291MmTi6se0WF8
	 GUz1ywPflX7ZbS6B8NEcVaXMTaj6uAAoN6l21DYdNQ5w8tZWEkVXq8UomfBlR+Dll4
	 Ogc+KDFB5kcVx/3ZgqYA7uqL/Zf4vJRpigd6dLSs=
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
Subject: [PATCH 1/8] media: Add a pixel format for MIPI packed 12bit luma only.
Date: Fri,  9 Feb 2024 17:48:16 +0100
Message-ID: <20240209164825.166800-2-jacopo.mondi@ideasonboard.com>
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

This is the format used by monochrome 12bit image sensors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-y12p.rst   | 38 +++++++++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  1 +
 4 files changed, 41 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12p.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
new file mode 100644
index 000000000000..b2eb4a72724d
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _V4L2-PIX-FMT-Y12P:
+
+******************************
+V4L2_PIX_FMT_Y12P ('Y12P')
+******************************
+
+Grey-scale image as a MIPI RAW12 packed array
+
+
+Description
+===========
+
+This is a packed grey-scale image format with a depth of 12 bits per
+pixel. Two consecutive pixels are packed into 3 bytes. The first 2 bytes
+contain the 8 high order bits of the pixels, and the 3rd byte contains the 4
+least significants bits of each pixel, in the same order.
+
+**Byte Order.**
+Each cell is one byte.
+
+.. tabularcolumns:: |p{2.2cm}|p{1.2cm}|p{1.2cm}|p{3.1cm}|
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       2 1 1 1
+
+
+    -  -  start + 0:
+       -  Y'\ :sub:`00high`
+       -  Y'\ :sub:`01high`
+       -  Y'\ :sub:`01low`\ (bits 7--4)
+
+          Y'\ :sub:`00low`\ (bits 3--0)
+
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
index 24b34cdfa6fe..7c9ccfdd94cd 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -267,6 +267,7 @@ image.
     pixfmt-packed-yuv
     pixfmt-yuv-planar
     pixfmt-yuv-luma
+    pixfmt-y12p
     pixfmt-y8i
     pixfmt-y12i
     pixfmt-uv8
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 33076af4dfdb..483498c55899 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1311,6 +1311,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
 	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
 	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
+	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
 	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
 	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index a8015e5e7fa4..11ebf9b22ccb 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -598,6 +598,7 @@ struct v4l2_pix_format {
 /* Grey bit-packed formats */
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
+#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
 #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
 
 /* Palette formats */
-- 
2.43.0


