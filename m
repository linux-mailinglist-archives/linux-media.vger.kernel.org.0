Return-Path: <linux-media+bounces-6261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBD786EB2F
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDE5FB263AC
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B2156B85;
	Fri,  1 Mar 2024 21:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eq0Hfrme"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E4058AC4
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 21:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709328761; cv=none; b=cODp0m9JjY4WOSlHTVsgEf+Bq0bzONgSICj0WSaPSE0YwWiAJLzfwnak5PosKb3O9HP0PLuYVSAidwlC/FBhfpi34LKcOf0TcJjRy3c3s5XIWy7101qCbXgVeDQp3dKRyXHmWsnj+7HBr+Tfk3Z643RwuVyKjX9tnaH7u9P9AdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709328761; c=relaxed/simple;
	bh=UQ2vl/FAyiUIwGX3ePxKwlIuALmOQ4LD7wcQNW+YcOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FUENXXCVRZnXMGnVmYBIB867+NLvU0Z2vIy0g7nAQs0GPdSgf712n5FZiB5WGzH7l0qc0QZcjhIx9e8YaQsIAFoo7Tz2tOed9qX4cJo/hIpa1i0pyp+2/2oaZjEPsEDzfGmaujaiI6mdhw7C+3Cftazs/qpMgpfKLyzAWM7NZCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eq0Hfrme; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 954C33305;
	Fri,  1 Mar 2024 22:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709328740;
	bh=UQ2vl/FAyiUIwGX3ePxKwlIuALmOQ4LD7wcQNW+YcOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eq0Hfrmeqy2MnNgVJhTOMImv2Wco4pHQg3eLL5HDChrljsLfVwKWcLP33ETxg0JF1
	 UcwdEs7K9g9y65z7+37anE0BvNodp/VGNSD4CaAHIbSHhvlELA/tLFQajCpx2QLLin
	 AUYpGdoHW85bi7YXaWA/wzThVNtQrvvzrBw/gidM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v6 04/15] media: i2c: imx219: Report streams using frame descriptors
Date: Fri,  1 Mar 2024 23:32:19 +0200
Message-ID: <20240301213231.10340-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 67 ++++++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 52afb821f667..6e0232b6772b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -594,6 +595,24 @@ static void imx219_free_controls(struct imx219 *imx219)
  * Subdev operations
  */
 
+static int imx219_format_bpp(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		return 8;
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	default:
+		return 10;
+	}
+}
+
 static int imx219_set_framefmt(struct imx219 *imx219,
 			       struct v4l2_subdev_state *state)
 {
@@ -605,23 +624,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 
 	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
 	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
-
-	switch (format->code) {
-	case MEDIA_BUS_FMT_SRGGB8_1X8:
-	case MEDIA_BUS_FMT_SGRBG8_1X8:
-	case MEDIA_BUS_FMT_SGBRG8_1X8:
-	case MEDIA_BUS_FMT_SBGGR8_1X8:
-		bpp = 8;
-		break;
-
-	case MEDIA_BUS_FMT_SRGGB10_1X10:
-	case MEDIA_BUS_FMT_SGRBG10_1X10:
-	case MEDIA_BUS_FMT_SGBRG10_1X10:
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
-	default:
-		bpp = 10;
-		break;
-	}
+	bpp = imx219_format_bpp(format->code);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
 		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
@@ -1031,6 +1034,35 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	if (pad != IMX219_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_stream_format(state, IMX219_PAD_SOURCE, 0);
+	code = fmt->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	memset(fd->entry, 0, sizeof(fd->entry));
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8
+				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_core_ops imx219_core_ops = {
 	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
@@ -1046,6 +1078,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.get_frame_desc = imx219_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
Regards,

Laurent Pinchart


