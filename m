Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D013FB452
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236539AbhH3LDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236520AbhH3LDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:34 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C87C156A;
        Mon, 30 Aug 2021 13:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321359;
        bh=AABiepMnXHGBVzO9AXWI5PWachgJarGqTETuT78lxGA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iRXz85GtcZA8sShq+2iv0xIYs6igQhcZlYiF/s4EZRYTGzz5jPB2Pli0fsjsYJpbR
         P0INQ6yNHnfBup5+0iTGFT+Nr7MsAS4iYE03FJ8FAL7/xXBE9DX7v9MQ/jrCTozuH5
         XgP8V0u/3xoNov38xCYxYVAT1yadDEAr8Gj9PDvI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v8 33/36] media: subdev: add "opposite" stream helper funcs
Date:   Mon, 30 Aug 2021 14:01:13 +0300
Message-Id: <20210830110116.488338-34-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add two helper functions to make dealing with streams easier:

v4l2_state_find_opposite_end - given a routing table and a pad + stream,
return the pad + stream on the opposite side of the subdev.

v4l2_state_get_opposite_stream_format - return a pointer to the format
on the pad + stream on the opposite side from the given pad + stream.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 42 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 31 ++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e8bfca595e11..68db3f23c256 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1487,3 +1487,45 @@ v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(v4l2_state_get_stream_format);
+
+int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
+				 u32 stream, u32 *other_pad, u32 *other_stream)
+{
+	unsigned int i;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (route->source_pad == pad &&
+		    route->source_stream == stream) {
+			*other_pad = route->sink_pad;
+			*other_stream = route->sink_stream;
+			return 0;
+		}
+
+		if (route->sink_pad == pad && route->sink_stream == stream) {
+			*other_pad = route->source_pad;
+			*other_stream = route->source_stream;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(v4l2_state_find_opposite_end);
+
+struct v4l2_mbus_framefmt *
+v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
+				      u32 stream)
+{
+	u32 other_pad, other_stream;
+	int ret;
+
+	ret = v4l2_state_find_opposite_end(&state->routing, pad, stream,
+					   &other_pad, &other_stream);
+	if (ret)
+		return NULL;
+
+	return v4l2_state_get_stream_format(state, other_pad, other_stream);
+}
+EXPORT_SYMBOL_GPL(v4l2_state_get_opposite_stream_format);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 5a2c7e2cb561..bc69123f71cb 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1500,4 +1500,35 @@ struct v4l2_mbus_framefmt *
 v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
 			     u32 stream);
 
+/**
+ * v4l2_state_find_opposite_end() - Find the opposite stream
+ * @routing: routing used to find the opposite side
+ * @pad: pad id
+ * @stream: stream id
+ * @other_pad: pointer used to return the opposite pad
+ * @other_stream: pointer used to return the opposite stream
+ *
+ * This function uses the routing table to find the pad + stream which is
+ * opposite the given pad + stream.
+ *
+ * Returns 0 on success, or -EINVAL if no matching route is found.
+ */
+int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
+				 u32 stream, u32 *other_pad, u32 *other_stream);
+
+/**
+ * v4l2_state_get_opposite_stream_format() - Get pointer to opposite stream format
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
+v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
+				      u32 stream);
+
 #endif
-- 
2.25.1

