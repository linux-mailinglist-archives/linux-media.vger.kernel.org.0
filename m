Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E650422186
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbhJEJAh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60822 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbhJEJAe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:34 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16B781449;
        Tue,  5 Oct 2021 10:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424323;
        bh=GubJX4blob6Z5rs7gOSFZugxd+yts5uABnPBMtM5M3I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p5HISd0OZ2R031bfKQJPcEcksRvS+nJri0lXBLtp49aVyv3wEHjEYRDIyBBJj2Evm
         MfimGgMCewSrA8+QtEtl5Unrjq3DY+LFFAVqryQA9UCpBemn2qXxir7Pz97TyMKv9V
         J7AwObV1ZpzZNYM72gzrIpiwAnPKfkPa4x26/mkU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 33/36] media: subdev: add "opposite" stream helper funcs
Date:   Tue,  5 Oct 2021 11:57:47 +0300
Message-Id: <20211005085750.138151-34-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
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
 include/media/v4l2-subdev.h           | 32 ++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 37e2e1f907fc..9eeadad997c8 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1484,3 +1484,45 @@ v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
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
index 1dc824416c1b..4b9520410783 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1501,4 +1501,36 @@ struct v4l2_mbus_framefmt *
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
+ * v4l2_state_get_opposite_stream_format() - Get pointer to opposite stream
+ *					     format
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

