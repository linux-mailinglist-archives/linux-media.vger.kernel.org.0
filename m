Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F71463676
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242175AbhK3OUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242128AbhK3OUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:19 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7999C3527;
        Tue, 30 Nov 2021 15:16:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281820;
        bh=IcgowDqEyiYUjutx7kWHD8Heq5EHz4xcWnRp1SfIqog=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wyiw3jYhZS+RjdtHbLlw5wMSbuhFwndsEZyrjfrG6MpE2zAQblVwvOUJp/KnX2p4i
         0GwTMgeDGXTJg+4g69nDOdFwa55C/wowKLbgKahgr3ZVxNQzAhmnyVjcaBWdri0DK6
         Dw1YE6fU12sODxqZn2XetW6HSLfy4SLeJ6+JLofo=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 34/38] media: subdev: add "opposite" stream helper funcs
Date:   Tue, 30 Nov 2021 16:15:32 +0200
Message-Id: <20211130141536.891878-35-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add two helper functions to make dealing with streams easier:

v4l2_subdev_routing_find_opposite_end - given a routing table and a pad
+ stream, return the pad + stream on the opposite side of the subdev.

v4l2_subdev_state_get_opposite_stream_format - return a pointer to the
format on the pad + stream on the opposite side from the given pad +
stream.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 47 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 36 ++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 5245ec219ee1..13a092442cd4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1489,3 +1489,50 @@ v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(v4l2_state_get_stream_format);
+
+int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
+					  u32 pad, u32 stream, u32 *other_pad,
+					  u32 *other_stream)
+{
+	unsigned int i;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (route->source_pad == pad &&
+		    route->source_stream == stream) {
+			if (other_pad)
+				*other_pad = route->sink_pad;
+			if (other_stream)
+				*other_stream = route->sink_stream;
+			return 0;
+		}
+
+		if (route->sink_pad == pad && route->sink_stream == stream) {
+			if (other_pad)
+				*other_pad = route->source_pad;
+			if (other_stream)
+				*other_stream = route->source_stream;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_routing_find_opposite_end);
+
+struct v4l2_mbus_framefmt *
+v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
+					     u32 pad, u32 stream)
+{
+	u32 other_pad, other_stream;
+	int ret;
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, stream,
+						    &other_pad, &other_stream);
+	if (ret)
+		return NULL;
+
+	return v4l2_state_get_stream_format(state, other_pad, other_stream);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 7d7ef36e2597..b1761da83533 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1503,4 +1503,40 @@ struct v4l2_mbus_framefmt *
 v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
 			     u32 stream);
 
+/**
+ * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
+ * @routing: routing used to find the opposite side
+ * @pad: pad id
+ * @stream: stream id
+ * @other_pad: pointer used to return the opposite pad
+ * @other_stream: pointer used to return the opposite stream
+ *
+ * This function uses the routing table to find the pad + stream which is
+ * opposite the given pad + stream.
+ *
+ * @other_pad and/or @other_stream can be NULL if the caller does not need the
+ * value.
+ *
+ * Returns 0 on success, or -EINVAL if no matching route is found.
+ */
+int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
+					  u32 pad, u32 stream, u32 *other_pad,
+					  u32 *other_stream);
+
+/**
+ * v4l2_subdev_state_get_opposite_stream_format() - Get pointer to opposite
+ *                                                  stream format
+ * @state: subdevice state
+ * @pad: pad id
+ * @stream: stream id
+ *
+ * This returns a pointer to &struct v4l2_mbus_framefmt for the pad + stream
+ * that is opposite the given pad + stream in the subdev state.
+ *
+ * If the state does not contain the given pad + stream, NULL is returned.
+ */
+struct v4l2_mbus_framefmt *
+v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
+					     u32 pad, u32 stream);
+
 #endif
-- 
2.25.1

