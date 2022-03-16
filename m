Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975E64DB531
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 16:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357343AbiCPPsV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 11:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357347AbiCPPsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 11:48:17 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36096D394;
        Wed, 16 Mar 2022 08:47:02 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2CEFF240005;
        Wed, 16 Mar 2022 15:46:59 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 04/10] media: adv748x: Implement .get_frame_desc()
Date:   Wed, 16 Mar 2022 16:46:35 +0100
Message-Id: <20220316154641.511667-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
References: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the get_frame_desc subdev pad operation.

Implement the get_frame_desc pad operation to allow retrieving the
stream configuration of the adv748x csi2 subdevice.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 94 ++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 8326cfe6192a..91cd70739e9d 100644
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
@@ -221,11 +265,61 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
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
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	/* A single route is available. */
+	route = &state->routing.routes[0];
+	fmt = v4l2_subdev_state_get_stream_format(state, pad,
+						  route->source_stream);
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
2.35.1

