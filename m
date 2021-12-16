Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77E54779EC
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 18:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239905AbhLPRC6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 12:02:58 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:46035 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239859AbhLPRC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 12:02:58 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AC0521BF20B;
        Thu, 16 Dec 2021 17:02:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/5] media: adv748x: Implement .get_frame_desc()
Date:   Thu, 16 Dec 2021 18:03:22 +0100
Message-Id: <20211216170323.141321-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216170323.141321-1-jacopo+renesas@jmondi.org>
References: <20211216170323.141321-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the get_frame_desc subdev pad operation.

Implement the get_frame_desc pad operation to allow retrieving the
stream configuration of the adv748x csi2 subdevice.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 93 ++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 549c3cd96006..9824ebe44eb1 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -14,6 +14,50 @@
 
 #include "adv748x.h"
 
+/* Describes a format bit depth and CSI-2 defined Data Type. */
+struct adv748x_csi2_format_info {
+	u8 dt;
+	u8 bpp;
+};
+
+static int adv748x_csi2_get_format_info(struct adv748x_csi2 *tx,
+					u32 mbus_code,
+					struct adv748x_csi2_format_info *fmt)
+{
+	switch (mbus_code) {
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+		fmt->dt = 0x1e;
+		fmt->bpp = 16;
+		break;
+	case MEDIA_BUS_FMT_YUYV10_2X10:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+		fmt->dt = 0x1f;
+		fmt->bpp = 20;
+		break;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_RGB565_2X8_LE:
+	case MEDIA_BUS_FMT_RGB565_2X8_BE:
+		fmt->dt = 0x22;
+		fmt->bpp = 16;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		fmt->dt = 0x23;
+		fmt->bpp = 18;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		fmt->dt = 0x24;
+		fmt->bpp = 24;
+		break;
+	default:
+		dev_err(tx->state->dev,
+			"Unsupported media bus code: %u\n", mbus_code);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
 {
 	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
@@ -248,11 +292,60 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
 	return 0;
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
+	int ret;
+
+	if (pad != ADV748X_CSI2_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_active_state(sd);
+
+	/* A single route is available. */
+	route = &state->routing.routes[0];
+	fmt = v4l2_state_get_stream_format(state, pad, route->source_stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = adv748x_csi2_get_format_info(tx, fmt->code, &info);
+	if (ret)
+		goto out;
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
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
 	.init_cfg = adv748x_csi2_init_cfg,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
+	.get_frame_desc = adv748x_csi2_get_frame_desc,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.33.1

