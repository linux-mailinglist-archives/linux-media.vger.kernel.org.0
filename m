Return-Path: <linux-media+bounces-10047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA198B0E84
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C5A01F2A794
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57079161318;
	Wed, 24 Apr 2024 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bFFfJyy+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5139515B97E
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972952; cv=none; b=MzmDndmkKQmsvpU5EXFZCf+ZduvgMGeTYZNjPOljUZHcCFKnMw84BOyPgIq/2rq8hV6Eq3CRODChbNe3aC1CkcnkDvIRT1c2cs2UA9/MvR565ZgS81j60iYOxgU/MgBIPUmMDYBdvvrEWd5gycT+vBQGp29kOGN/OjEsZf22lCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972952; c=relaxed/simple;
	bh=qNl1P6OxFeoDiUEFv8kzqwEdEB6g8PB6OAlrAdG4lsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8L1ga9lR91xNBK8cO9Jc+of4PviO3U0NZuXYLYbQMAt9w7MXgJHjfr7rDNISfG7BoK+mB9huzxApInh3Y0nTDphZI1GJw+nyX4vzgg/j4IW1NkgbQ8riYr8E+2Chm+2kum2Mw0SpQqVs5Ke/xbqaKGJ3GEkpH0xjpbhQ78IopQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bFFfJyy+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E07AE82A;
	Wed, 24 Apr 2024 17:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972898;
	bh=qNl1P6OxFeoDiUEFv8kzqwEdEB6g8PB6OAlrAdG4lsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bFFfJyy+qn3Z6rybC/IyzPkpmlxyWujIGK36+DZec/imZk24qTwocNoZUcTygnqWa
	 DU2JJHxeoBPxAQX9QSvBHL8i/K3K2XpxeZvgpE0lLnSgyiGACcSv9aINbfPMBSEYuP
	 i6LW9xWLlSluLvPBc1DLTzMhVrrzdlWDhuyy2u8M=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v11 1/5] media: v4l: Add V4L2-PIX-FMT-Y12P format
Date: Wed, 24 Apr 2024 18:35:37 +0300
Message-ID: <20240424153542.32503-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424153542.32503-1-laurent.pinchart@ideasonboard.com>
References: <20240424153542.32503-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

This is a packed grey-scale image format with a depth of 12 bits per
pixel. Two consecutive pixels are packed into 3 bytes. The first 2 bytes
contain the 8 high order bits of the pixels, and the 3rd byte contains
the 4 least significants bits of each pixel, in the same order.

Add the entry in userspace API, and document it.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst       | 11 +++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                  |  1 +
 include/uapi/linux/videodev2.h                        |  1 +
 3 files changed, 13 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index cf8e4dfbfbd4..a650ceda7cdb 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -114,6 +114,17 @@ are often referred to as greyscale formats.
       - ...
       - ...
 
+    * .. _V4L2-PIX-FMT-Y12P:
+
+      - ``V4L2_PIX_FMT_Y12P``
+      - 'Y12P'
+
+      - Y'\ :sub:`0`\ [11:4]
+      - Y'\ :sub:`1`\ [11:4]
+      - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [3:0]
+      - ...
+      - ...
+
     * .. _V4L2-PIX-FMT-Y14:
 
       - ``V4L2_PIX_FMT_Y14``
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index aab671fae45b..94fe2a1d13cd 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1321,6 +1321,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
 	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
 	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
+	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
 	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index d944db7ae1ed..760fb8ed7f69 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -599,6 +599,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
 #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
+#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
 
 /* Palette formats */
 #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
-- 
Regards,

Laurent Pinchart


