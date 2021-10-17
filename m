Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B1F430B80
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 20:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344398AbhJQS0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 14:26:44 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:51111 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344139AbhJQS0m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 14:26:42 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id F0CCE200004;
        Sun, 17 Oct 2021 18:24:29 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 12/13] media: rcar-csi2: Implement .get_frame_desc()
Date:   Sun, 17 Oct 2021 20:24:48 +0200
Message-Id: <20211017182449.64192-13-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the get_frame_desc subdev pad operation.

The operation informs the VIN entity to which the CSI-2 output channel
is routed to about the CSI-2 Virtual Channel and the Datatype the
transported stream is tagged with.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 63 +++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 4ef7b9cb1ab7..7084ee06e99e 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -828,6 +828,68 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
+/*
+ * The R-Car CSI-2 receivers are connected to the VINs (or ISP) by 'channels'
+ * not to be confused with CSI-2 Virtual Channels.
+ *
+ * Inform the VIN instance, to which the channel identified by the source pad is
+ * routed to, about the CSI-2 Virtual Channel and CSI-2 Datatype of the
+ * transported data stream.
+ */
+static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	int ret;
+
+	if (pad < RCAR_CSI2_SOURCE_VC0 || pad > RCAR_CSI2_SOURCE_VC3)
+		return -EINVAL;
+
+	state = v4l2_subdev_validate_and_lock_state(sd, state);
+
+	memset(fd, 0, sizeof(*fd));
+
+	for_each_active_route(&state->routing, route) {
+		const struct rcar_csi2_format *rcsi2_fmt;
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (route->source_pad != pad)
+			continue;
+
+		fmt = v4l2_state_get_stream_format(state, pad,
+						   route->source_stream);
+		if (!fmt) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		rcsi2_fmt = rcsi2_code_to_fmt(fmt->code);
+
+		/* Only one stream per 'channel' is allowed. */
+		fd->entry[0].pixelcode = fmt->code;
+		fd->entry[0].length = fmt->width * fmt->height * rcsi2_fmt->bpp / 8;
+		fd->entry[0].flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+
+		/*
+		 * The sink stream id corresponds to the CSI-2 Virtual Channel
+		 * which is output on the channel identified by the current
+		 * source pad.
+		 */
+		fd->entry[0].bus.csi2.vc = route->source_stream;
+		fd->entry[0].bus.csi2.dt = rcsi2_fmt->datatype;
+
+		break;
+	}
+	fd->num_entries = 1;
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
 static int _rcsi2_set_routing(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_krouting *routing)
@@ -906,6 +968,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.init_cfg = rcsi2_init_cfg,
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.get_frame_desc = rcsi2_get_frame_desc,
 	.set_routing = rcsi2_set_routing,
 };
 
-- 
2.33.0

