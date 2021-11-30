Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A89463679
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242177AbhK3OUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242150AbhK3OUW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:22 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFF1D181E;
        Tue, 30 Nov 2021 15:17:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281822;
        bh=vdL8UI4gh1t4hcNkbxvLiwahYveWGWSB92RMm1k257k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C/Jl12EDuGOhn4y+qwa/iBADUD9AF+GPQ40yWLz2PE19M3ES3xa1RRuzNaXwChapz
         aPUx4eUsR51dX+cxJe7DHpQcsRje04rkxC9nVBxi9qWXDCi3gMxjAxN+Dp0M8ZmG0g
         lxwbG7n2akzVaTGzcfLva4p1pt/EN/969uZd/ass=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 37/38] media: subdev: add v4l2_subdev_routing_validate_1_to_1 helper
Date:   Tue, 30 Nov 2021 16:15:35 +0200
Message-Id: <20211130141536.891878-38-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a helper for verifying routing for the common case of
non-overlapping 1-to-1 streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 24 ++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 14 ++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 83ff15dc440a..dc31118adc6b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1579,3 +1579,27 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
+
+int v4l2_subdev_routing_validate_1_to_1(const struct v4l2_subdev_krouting *routing)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+
+		for (j = i + 1; j < routing->num_routes; ++j) {
+			const struct v4l2_subdev_route *r = &routing->routes[j];
+
+			if (route->sink_pad == r->sink_pad &&
+			    route->sink_stream == r->sink_stream)
+				return -EINVAL;
+
+			if (route->source_pad == r->source_pad &&
+			    route->source_stream == r->source_stream)
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_routing_validate_1_to_1);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 2c70d92e497b..a0c122c9f51e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1572,4 +1572,18 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format);
 
+/**
+ * v4l2_subdev_routing_validate_1_to_1() - Verify that all streams are
+ *                                         non-overlapping 1-to-1 streams
+ * @routing: routing to verify
+ *
+ * This verifies that the given routing contains only non-overlapping 1-to-1
+ * streams. In other words, no two streams have the same source or sink
+ * stream ID on a single pad. This is the most common case of routing
+ * supported by devices.
+ *
+ * Returns 0 on success, error value otherwise.
+ */
+int v4l2_subdev_routing_validate_1_to_1(const struct v4l2_subdev_krouting *routing);
+
 #endif
-- 
2.25.1

