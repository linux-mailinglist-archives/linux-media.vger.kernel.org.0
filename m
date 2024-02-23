Return-Path: <linux-media+bounces-5816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1198617F4
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 17:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6646C1F23F1E
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 16:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6767D12AACB;
	Fri, 23 Feb 2024 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v0UUtwWV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334AE127B51
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 16:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705857; cv=none; b=iIZDCn7dDTXTAIU8VebSQ0vYBj62L9mQZ48IuDN1Ja0l2KkUNGBSZQeC0DvmAakp7O+E2pdEiYNa2NVnWb407eKx+i3Bmn0NgmdCU1X9WZQ+lPcksbr1cTqSKIs6mo5ODV2pSknQ0ANwLl86mNIB9wAwU/xIXeHHuYfNe9CmKJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705857; c=relaxed/simple;
	bh=JCK8oeAArCm7ANzCIES4sJlxIvAJTz9JGrUflHy5SNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+0hV5U+FNcVqhULnZBGzxkv/2sNkM8qreFBTZPz20QmZ6gpK7GajHzhzRXzFiQZElvYKcmco5Yvo0GmB8BJB5VhBgPMz8a1Dy1uYtA5Se9UHYvejN2NzFZqKFN6ob3E3wn7ha+7RGDDsC34SutT0cDd7UmQxJSurceVkzgunPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v0UUtwWV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBB6F1653;
	Fri, 23 Feb 2024 17:30:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708705840;
	bh=JCK8oeAArCm7ANzCIES4sJlxIvAJTz9JGrUflHy5SNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=v0UUtwWVRLTcGZ+gQ546ULix1bC1fWfpzw11J8cDS9mDzB5TZxdJx5sQRjR5324EF
	 07645o4dUZ/k/S0fkqpotWBw2PG9czyZKbmtxX4C1yM5YDviWQ7dDWumcNH/Imb/xu
	 aVqQYG9VKjijVce567Nx2l+ZWzzggCvrK2M/idoc=
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
Subject: [PATCH v2 4/9] media: uapi: Add a pixel format for BGR48 and RGB48
Date: Fri, 23 Feb 2024 17:30:06 +0100
Message-ID: <20240223163012.300763-5-jacopo.mondi@ideasonboard.com>
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

Add BGR48 and RGB48 16-bit per component image formats.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 39 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |  2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
 include/uapi/linux/videodev2.h                |  4 ++
 4 files changed, 47 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index b71b80d634d6..458308ae4eb8 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -996,6 +996,45 @@ arranged in little endian order.
 
     \normalsize
 
+16 Bits Per Component
+=====================
+
+These formats store an RGB triplet in six bytes, with 16 bits per component.
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
+      - Byte 1-0
+      - Byte 3-2
+      - Byte 5-4
+    * .. _V4L2-PIX-FMT-BGR48:
+
+      - ``V4L2_PIX_FMT_BGR48``
+      - 'BGR6'
+
+      - B\ :sub:`15-0`
+      - G\ :sub:`15-0`
+      - R\ :sub:`15-0`
+      -
+    * .. _V4L2-PIX-FMT-RGB48:
+
+      - ``V4L2_PIX_FMT_RGB48``
+      - 'RGB6'
+
+      - R\ :sub:`15-0`
+      - G\ :sub:`15-0`
+      - B\ :sub:`15-0`
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
index 911f00ed28fd..89b2b409fc03 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -584,6 +584,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_BGR48_12    v4l2_fourcc('B', '3', '1', '2') /* 48  BGR 12-bit per component */
 #define V4L2_PIX_FMT_ABGR64_12   v4l2_fourcc('B', '4', '1', '2') /* 64  BGRA 12-bit per component */
 
+/* RGB formats (6 bytes per pixel) */
+#define V4L2_PIX_FMT_BGR48 v4l2_fourcc('B', 'G', 'R', '6') /* 16  BGR-16-16-16 */
+#define V4L2_PIX_FMT_RGB48 v4l2_fourcc('R', 'G', 'B', '6') /* 16  RGB-16-16-16 */
+
 /* Grey formats */
 #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
 #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Greyscale     */
-- 
2.43.0


