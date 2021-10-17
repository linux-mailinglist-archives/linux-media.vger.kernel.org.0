Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D5E430B76
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 20:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344257AbhJQS0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 14:26:34 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:49567 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344139AbhJQS0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 14:26:33 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 96AFA200007;
        Sun, 17 Oct 2021 18:24:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 07/13] media: max9286: Implement get_frame_desc()
Date:   Sun, 17 Oct 2021 20:24:43 +0200
Message-Id: <20211017182449.64192-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the get_frame_desc pad operation to allow retrieving the
stream configuration of the max9286 subdevice.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 53 +++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 8bfb88db9976..aca8455d6d56 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -878,6 +878,58 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int max9286_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	if (pad != MAX9286_SRC_PAD)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_active_state(sd);
+
+	memset(fd, 0, sizeof(*fd));
+
+	/* One stream entry per each connected route. */
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *entry =
+						&fd->entry[fd->num_entries];
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_state_get_stream_format(state, pad,
+						   route->source_stream);
+		if (!fmt) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/*
+		 * Assume a YUYV format (0x1e DT) and 16 bpp: we only support
+		 * these formats at the moment.
+		 */
+		entry->stream = fd->num_entries++;
+		entry->flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+		entry->length = fmt->width * fmt->height * 16 / 8;
+		entry->pixelcode = fmt->code;
+
+		/*
+		 * The source stream id corresponds to the virtual channel a
+		 * stream is output on.
+		 */
+		entry->bus.csi2.vc = route->source_stream;
+		entry->bus.csi2.dt = 0x1e;
+	}
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
 static int max9286_routing_verify(struct max9286_priv *priv,
 				  struct v4l2_subdev_krouting *routing)
 {
@@ -1020,6 +1072,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
 	.enum_mbus_code = max9286_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= max9286_set_fmt,
+	.get_frame_desc = max9286_get_frame_desc,
 	.set_routing	= max9286_set_routing,
 };
 
-- 
2.33.0

