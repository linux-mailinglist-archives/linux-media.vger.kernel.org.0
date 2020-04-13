Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3EB1A6D3D
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 22:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388369AbgDMU0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 16:26:11 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:21084 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388370AbgDMU0H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 16:26:07 -0400
X-Halon-ID: fa5c134d-7dc4-11ea-aeed-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id fa5c134d-7dc4-11ea-aeed-005056917f90;
        Mon, 13 Apr 2020 22:25:56 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v7 4/6] rcar-vin: Make use of V4L2_CAP_IO_MC
Date:   Mon, 13 Apr 2020 22:23:49 +0200
Message-Id: <20200413202351.1359754-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the V4L2_CAP_IO_MC capability flag and remove the driver specific
vidioc_enum_input, vidioc_g_input and vidioc_s_input callbacks for the
media controller enabled part of the driver. Also add support mbus_code
filtering for format enumeration.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
* Changes since v6
- Implement mbus_code filtering for format enumeration
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 40 ++++++++++++---------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5151a3cd8a6e6754..f421e25848756c97 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -343,6 +343,29 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 	unsigned int i;
 	int matched;
 
+	/*
+	 * If mbus_code is set only enumerate supported pixel formats for that
+	 * bus code. Converting from YCbCr to RGB and RGB to YCbCr is possible
+	 * with VIN, so all supported YCbCr and RGB media bus codes can produce
+	 * all of the related pixel formats. If mbus_code is not set enumerate
+	 * all possible pixelformats.
+	 *
+	 * TODO: Once raw capture formats are added to the driver this needs
+	 * to be extended so raw media bus codes only result in raw pixel
+	 * formats.
+	 */
+	switch (f->mbus_code) {
+	case 0:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY10_2X10:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	matched = -1;
 	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++) {
 		if (rvin_format_from_pixel(vin, rvin_formats[i].fourcc))
@@ -767,18 +790,6 @@ static int rvin_mc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rvin_mc_enum_input(struct file *file, void *priv,
-			      struct v4l2_input *i)
-{
-	if (i->index != 0)
-		return -EINVAL;
-
-	i->type = V4L2_INPUT_TYPE_CAMERA;
-	strscpy(i->name, "Camera", sizeof(i->name));
-
-	return 0;
-}
-
 static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
 	.vidioc_querycap		= rvin_querycap,
 	.vidioc_try_fmt_vid_cap		= rvin_mc_try_fmt_vid_cap,
@@ -786,10 +797,6 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
 	.vidioc_s_fmt_vid_cap		= rvin_mc_s_fmt_vid_cap,
 	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
 
-	.vidioc_enum_input		= rvin_mc_enum_input,
-	.vidioc_g_input			= rvin_g_input,
-	.vidioc_s_input			= rvin_s_input,
-
 	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
 	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
 	.vidioc_querybuf		= vb2_ioctl_querybuf,
@@ -961,6 +968,7 @@ int rvin_v4l2_register(struct rvin_dev *vin)
 	vin->format.colorspace = RVIN_DEFAULT_COLORSPACE;
 
 	if (vin->info->use_mc) {
+		vdev->device_caps |= V4L2_CAP_IO_MC;
 		vdev->ioctl_ops = &rvin_mc_ioctl_ops;
 	} else {
 		vdev->ioctl_ops = &rvin_ioctl_ops;
-- 
2.26.0

