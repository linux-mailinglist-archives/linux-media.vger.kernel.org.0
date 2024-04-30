Return-Path: <linux-media+bounces-10431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BA38B6FD4
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50346285150
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B142C12C544;
	Tue, 30 Apr 2024 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="om0wOVXq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BF112C471;
	Tue, 30 Apr 2024 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473625; cv=none; b=Wokyo3Sad8YvP66RxAYGJVLMpNqevZ0XXm9URoyMfXbzPX+XmPw3MoSFgSvaDISnEEH0pei/SV4UyY8P0s81uWzzaSC0f7dQRrXkinlQy1izdLwKPIwbrjQN1l1hR1dCER1iH+7Fbnk14OLSy7HZ+wCI/EbE37SYZxy/lV9bPd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473625; c=relaxed/simple;
	bh=t0yDUkgSlE6P3N/7YSlmyHy16sOglSuO3PqZCLkpGPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXNVvO477WSQXh1qXgp/ImLCOJRJuUQ3O50DgSgtDncBzJ3WR5A9YdmRX/OwgBm3fxaWDRwP4KPWwUtx/iOcGv+3FSgYY3dY4Ur/lvZIZwe4uLdQXBxmyk0RnXkJZbYS8DdNo+ClhH9SB2Qt4sy29AENJ6pUsm7sQ9HwYZ0wx9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=om0wOVXq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6699D19A6;
	Tue, 30 Apr 2024 12:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473559;
	bh=t0yDUkgSlE6P3N/7YSlmyHy16sOglSuO3PqZCLkpGPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=om0wOVXq8zhUDSm5w1g44HFfd/hbJZeG92C+S1OE9Pwu1o3ORL8+eSDtuMIl3oOgj
	 SViRN6j0dD1pCIA+Yz1H6mJs2al6MxHmHGR7dgro/QI0HwXw3EGpfElyWC8hmEcIPW
	 sNg+oSBw9N70mj3UXWhUSjRVbCeX2xiKK9Sj+f74=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 07/19] media: adv748x: Implement .get_frame_desc()
Date: Tue, 30 Apr 2024 12:39:43 +0200
Message-ID: <20240430103956.60190-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the get_frame_desc subdev pad operation.

Implement the get_frame_desc pad operation to allow retrieving the
stream configuration of the adv748x csi2 subdevice.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 86 ++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index a7bfed393ff0..497586aff6b2 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -8,12 +8,51 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 
 #include "adv748x.h"
 
+struct adv748x_csi2_format_info {
+	u8 dt;
+	u8 bpp;
+};
+
+static int adv748x_csi2_get_format_info(struct adv748x_csi2 *tx, u32 mbus_code,
+					struct adv748x_csi2_format_info *fmt)
+{
+	switch (mbus_code) {
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		fmt->dt = MIPI_CSI2_DT_YUV422_8B;
+		fmt->bpp = 16;
+		break;
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+		fmt->dt = MIPI_CSI2_DT_YUV422_10B;
+		fmt->bpp = 20;
+		break;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		fmt->dt = MIPI_CSI2_DT_RGB565;
+		fmt->bpp = 16;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		fmt->dt = MIPI_CSI2_DT_RGB666;
+		fmt->bpp = 18;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		fmt->dt = MIPI_CSI2_DT_RGB888;
+		fmt->bpp = 24;
+		break;
+	default:
+		dev_dbg(tx->state->dev,
+			"Unsupported media bus code: %u\n", mbus_code);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx,
 					    unsigned int vc)
 {
@@ -258,11 +297,58 @@ static int adv748x_csi2_set_routing(struct v4l2_subdev *sd,
 	return adv748x_csi2_apply_routing(sd, state, routing);
 }
 
+static int adv748x_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				       struct v4l2_mbus_frame_desc *fd)
+{
+	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
+	struct adv748x_csi2_format_info info = {};
+	struct v4l2_mbus_frame_desc_entry *entry;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = -EINVAL;
+
+	if (pad != ADV748X_CSI2_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	/* A single route is available. */
+	route = &state->routing.routes[0];
+	fmt = v4l2_subdev_state_get_format(state, pad, route->source_stream);
+	if (!fmt)
+		goto err_unlock;
+
+	ret = adv748x_csi2_get_format_info(tx, fmt->code, &info);
+	if (ret)
+		goto err_unlock;
+
+	memset(fd, 0, sizeof(*fd));
+
+	/* A single stream is available. */
+	fd->num_entries = 1;
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	entry = &fd->entry[0];
+	entry->stream = 0;
+	entry->flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+	entry->length = fmt->width * fmt->height * info.bpp / 8;
+	entry->pixelcode = fmt->code;
+	entry->bus.csi2.vc = route->source_stream;
+	entry->bus.csi2.dt = info.dt;
+
+err_unlock:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
 	.set_routing = adv748x_csi2_set_routing,
+	.get_frame_desc = adv748x_csi2_get_frame_desc,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.44.0


