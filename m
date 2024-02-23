Return-Path: <linux-media+bounces-5814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559688617F2
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 17:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 747291C24231
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 16:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFC912A140;
	Fri, 23 Feb 2024 16:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y1VrupSp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19555128372
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705854; cv=none; b=V82ie71zL1iHjozbYtbIpDEDYYU3X6ilHA2jrAXejcJYCyFn3PLMBYqTdF9YX2rVNzFdkE2nDNAJxj4f3yG0mUVCkcy+FwLyiBpf8qXcLn2soO7K1fXr6KTW/MH9LrG7Vu405Cbnpsa9nNxbCmpkMxwECdTJzqvu6IXS5DxIMvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705854; c=relaxed/simple;
	bh=o1KxLvMluCvCTRGyamFPof8KTtpw4UsmC7COb7m7pLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhfdviVbAn/L+x/Vs7B16rUXmGn1PMkrPBJRuItenqD0JFwNH32Kob/Pri5+Al0SpoUGGvUkK3aMboXQw4Z35J6D8aeCJk8Vag9Wl1Q68ABNJCjDPrf21a7Y0c0V/q4xT5cozKzCHAwq4VBYKv05suInr5NqomrtELthh34A3Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y1VrupSp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44576FF1;
	Fri, 23 Feb 2024 17:30:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708705838;
	bh=o1KxLvMluCvCTRGyamFPof8KTtpw4UsmC7COb7m7pLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y1VrupSpTfNII6szcQoAm4M7aKS5RCyRw1jH9hELqi6U4liDUjJYJSVyYgXAQJHgz
	 YvEx86ACCXypUzA7R2AI4bJcGB9g/K0ji+bwA9t5CzPuRvp6ABhw0gJAVUg5doMOHp
	 2HnPqqm3uoeWCxxu2R0sg4bbq/N5k8cOi0JQXtDU=
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
Subject: [PATCH v2 2/9] media: uapi: Add MIPI packed 14bit luma
Date: Fri, 23 Feb 2024 17:30:04 +0100
Message-ID: <20240223163012.300763-3-jacopo.mondi@ideasonboard.com>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add the Y14P format to describe monochrome 14 bit image format
packed according to the RAW14 format as defined by the MIPI
CSI-2 specification.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/pixfmt-yuv-luma.rst             | 37 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  1 +
 3 files changed, 39 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index 585d736f36e5..3af6e3cb70c4 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -36,6 +36,8 @@ are often referred to as greyscale formats.
       - Byte 2
       - Byte 3
       - Byte 4
+      - Byte 5
+      - Byte 6
 
     * .. _V4L2-PIX-FMT-GREY:
 
@@ -47,6 +49,8 @@ are often referred to as greyscale formats.
       - ...
       - ...
       - ...
+      - ...
+      - ...
 
     * .. _V4L2-PIX-FMT-IPU3-Y10:
 
@@ -58,6 +62,8 @@ are often referred to as greyscale formats.
       - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
       - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [9:4]
       - Y'\ :sub:`3`\ [9:2]
+      - ...
+      - ...
 
     * .. _V4L2-PIX-FMT-Y10:
 
@@ -69,6 +75,8 @@ are often referred to as greyscale formats.
       - ...
       - ...
       - ...
+      - ...
+      - ...
 
     * .. _V4L2-PIX-FMT-Y10BPACK:
 
@@ -80,6 +88,8 @@ are often referred to as greyscale formats.
       - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`2`\ [9:6]
       - Y'\ :sub:`2`\ [5:0] Y'\ :sub:`3`\ [9:8]
       - Y'\ :sub:`3`\ [7:0]
+      - ...
+      - ...
 
     * .. _V4L2-PIX-FMT-Y10P:
 
@@ -91,6 +101,8 @@ are often referred to as greyscale formats.
       - Y'\ :sub:`2`\ [9:2]
       - Y'\ :sub:`3`\ [9:2]
       - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
+      - ...
+      - ...
 
     * .. _V4L2-PIX-FMT-Y12:
 
@@ -102,6 +114,8 @@ are often referred to as greyscale formats.
       - ...
       - ...
       - ...
+      - ...
+      - ...
 
     * .. _V4L2-PIX-FMT-Y012:
 
@@ -113,6 +127,8 @@ are often referred to as greyscale formats.
       - ...
       - ...
       - ...
+      - ...
+      - ...
 
     * .. _V4L2-PIX-FMT-Y12P:
 
@@ -124,6 +140,8 @@ are often referred to as greyscale formats.
       -  Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [3:0]
       - ...
       - ...
+      - ...
+      - ...
 
     * .. _V4L2-PIX-FMT-Y14:
 
@@ -135,6 +153,21 @@ are often referred to as greyscale formats.
       - ...
       - ...
       - ...
+      - ...
+      - ...
+
+    * .. _V4L2-PIX-FMT-Y14P:
+
+      - ``V4L2_PIX_FMT_Y14P``
+      - 'Y14P'
+
+      -  Y'\ :sub:`0`\ [13:6]
+      -  Y'\ :sub:`1`\ [13:6]
+      -  Y'\ :sub:`2`\ [13:6]
+      -  Y'\ :sub:`3`\ [13:6]
+      -  Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [5:0]
+      -  Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [5:2]
+      -  Y'\ :sub:`3`\ [5:0] Y'\ :sub:`2`\ [5:4]
 
     * .. _V4L2-PIX-FMT-Y16:
 
@@ -146,6 +179,8 @@ are often referred to as greyscale formats.
       - ...
       - ...
       - ...
+      - ...
+      - ...
 
     * .. _V4L2-PIX-FMT-Y16-BE:
 
@@ -157,6 +192,8 @@ are often referred to as greyscale formats.
       - ...
       - ...
       - ...
+      - ...
+      - ...
 
 .. raw:: latex
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 9cb09334161b..d0724240a446 100644
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
index 11ebf9b22ccb..911f00ed28fd 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -599,6 +599,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
 #define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
+#define V4L2_PIX_FMT_Y14P    v4l2_fourcc('Y', '1', '4', 'P') /* 14  Greyscale, MIPI RAW14 packed */
 #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
 
 /* Palette formats */
-- 
2.43.0


