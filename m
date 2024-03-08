Return-Path: <linux-media+bounces-6697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CEA876021
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 09:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AF611F26D50
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 08:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB83524CC;
	Fri,  8 Mar 2024 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zyzt8Cq6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADAE208AD
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709887853; cv=none; b=dNrpptcIUXy3H3nEEv/PZJG2CcOCBJ4SqtbMYhRbeM34tp5mU4nwyGET9FwVAaCJ4S4t5O8KrNZAgFaPCwOnWROxOojfPUAKexjTnbWRoeHcjfd6GRnJpDeQCpd8uWV2r6YnFMqaSly50ZQ3e6Fw6WfcZ3VwpUXVQYgazvF8hQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709887853; c=relaxed/simple;
	bh=mw7wTeqW8iPqOIS1vTbaIu6G229TZrDE+AKuyELufgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9YlkLxmhDbXe8js9ycGk7WEbvr4730u4Tx3og94KZ1CuEGsexk4qDtqxaiOuApvCOo9Q8D+mhWd4e3BjPhhUWuNq9DA/v6QilLFLb2C9UqDy15w3Y8HiGScVQCzuQ4zjnhX8lGCJx8K3y/OeCbYRFExrs3dOCSJp9/pKdm1eok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zyzt8Cq6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3BDDEF2;
	Fri,  8 Mar 2024 09:50:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709887827;
	bh=mw7wTeqW8iPqOIS1vTbaIu6G229TZrDE+AKuyELufgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zyzt8Cq66OCmZnH44DYWsXcU1A76ZSaLOq7rQkrqNjFMFyMMW65ZiLCDGt3F7A21m
	 /fujOivjSWDQku+uzObozVv4qH1jMkig4HRK5+cpPQVNe5zm0qLvJBRu9xbZ7JnCmY
	 URGhc0q3pE/dKk0GnC8CC5nI+B0n0Lb+Qcwuf5+E=
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
Subject: [PATCH v4 4/9] media: uapi: Add a pixel format for BGR48 and RGB48
Date: Fri,  8 Mar 2024 09:50:22 +0100
Message-ID: <20240308085028.44388-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com>
References: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add BGR48 and RGB48 16-bit per component image formats.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 54 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |  2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
 include/uapi/linux/videodev2.h                |  2 +
 4 files changed, 60 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index b71b80d634d6..5ed4d62df909 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -996,6 +996,60 @@ arranged in little endian order.
 
     \normalsize
 
+16 Bits Per Component
+=====================
+
+These formats store an RGB triplet in six bytes, with 16 bits per component
+stored in memory in little endian byte order. They are named based on the order
+of the RGB components as stored in memory. For instance, RGB48 stores R\
+:sub:`7:0` and R\ :sub:`15:8` in bytes 0 and 1 respectively. This differs from
+the DRM format nomenclature that instead uses the order of components as seen in
+the 48-bits little endian word.
+
+.. raw:: latex
+
+    \small
+
+.. flat-table:: RGB Formats With 16 Bits Per Component
+    :header-rows:  1
+
+    * - Identifier
+      - Code
+      - Byte 0
+      - Byte 1
+      - Byte 2
+      - Byte 3
+      - Byte 4
+      - Byte 5
+
+    * .. _V4L2-PIX-FMT-BGR48:
+
+      - ``V4L2_PIX_FMT_BGR48``
+      - 'BGR6'
+
+      - B\ :sub:`7-0`
+      - B\ :sub:`15-8`
+      - G\ :sub:`7-0`
+      - G\ :sub:`15-8`
+      - R\ :sub:`7-0`
+      - R\ :sub:`15-8`
+
+    * .. _V4L2-PIX-FMT-RGB48:
+
+      - ``V4L2_PIX_FMT_RGB48``
+      - 'RGB6'
+
+      - R\ :sub:`7-0`
+      - R\ :sub:`15-8`
+      - G\ :sub:`7-0`
+      - G\ :sub:`15-8`
+      - B\ :sub:`7-0`
+      - B\ :sub:`15-8`
+
+.. raw:: latex
+
+    \normalsize
+
 Deprecated RGB Formats
 ======================
 
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index d34d210908d9..ff4b4d2de9d2 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -253,6 +253,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_BGR48_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_BGR48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RGB48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_ABGR64_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_RGBA1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_RGBX1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index d0724240a446..a2f9c446a565 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1298,6 +1298,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_RGBX1010102:	descr = "32-bit RGBX 10-10-10-2"; break;
 	case V4L2_PIX_FMT_RGBA1010102:	descr = "32-bit RGBA 10-10-10-2"; break;
 	case V4L2_PIX_FMT_ARGB2101010:	descr = "32-bit ARGB 2-10-10-10"; break;
+	case V4L2_PIX_FMT_BGR48:	descr = "48-bit BGR 16-16-16"; break;
+	case V4L2_PIX_FMT_RGB48:	descr = "48-bit RGB 16-16-16"; break;
 	case V4L2_PIX_FMT_BGR48_12:	descr = "12-bit Depth BGR"; break;
 	case V4L2_PIX_FMT_ABGR64_12:	descr = "12-bit Depth BGRA"; break;
 	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 911f00ed28fd..91fba9adcda2 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -582,6 +582,8 @@ struct v4l2_pix_format {
 
 /* RGB formats (6 or 8 bytes per pixel) */
 #define V4L2_PIX_FMT_BGR48_12    v4l2_fourcc('B', '3', '1', '2') /* 48  BGR 12-bit per component */
+#define V4L2_PIX_FMT_BGR48       v4l2_fourcc('B', 'G', 'R', '6') /* 48  BGR 16-bit per component */
+#define V4L2_PIX_FMT_RGB48       v4l2_fourcc('R', 'G', 'B', '6') /* 48  RGB 16-bit per component */
 #define V4L2_PIX_FMT_ABGR64_12   v4l2_fourcc('B', '4', '1', '2') /* 64  BGRA 12-bit per component */
 
 /* Grey formats */
-- 
2.43.2


