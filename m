Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEADE3FB455
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236542AbhH3LDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236530AbhH3LDg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:36 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D088D1924;
        Mon, 30 Aug 2021 13:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321362;
        bh=pXHztcgMvIT5+m/DmHgFSB8IHvRQ4N3y2ytWJ/20IXw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DjSslXd5CIDhg29utY3asR86EkmRdlCuorNZAoNtCPBoaYUhG40DuqUHgFUwFneF0
         FYJ/eqB9EGK36HGOspw7pjSYlZSYk0CxAPzFglEKlaciHkA7ZilNsJmqCJ7fNWduda
         zSj6ut8JcOC3IVPpAx+FPT9q+5537Z8t8I+o4kuQ=
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
Subject: [PATCH v8 36/36] media: subdev: add v4l2_routing_simple_verify() helper
Date:   Mon, 30 Aug 2021 14:01:16 +0300
Message-Id: <20210830110116.488338-37-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a helper for verifying routing for the common case of
non-overlapping 1-to-1 streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 24 ++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 14 ++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 83fa87e88bce..e3a7793157db 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1572,3 +1572,27 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
+
+int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing)
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
+EXPORT_SYMBOL_GPL(v4l2_routing_simple_verify);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 3f72c500ff6e..476d797ecc68 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1562,4 +1562,18 @@ v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
 int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format);
 
+/**
+ * v4l2_routing_simple_verify() - Verify that all streams are non-overlapping
+ * 				  1-to-1 streams
+ * @routing: routing to verify
+ *
+ * This verifies that the given routing contains only non-overlapping 1-to-1
+ * streams. In other words, no two streams have the same source or sink
+ * stream ID on a single pad. This is the most common case of routing
+ * supported by devices.
+ *
+ * Returns 0 on success, error value otherwise.
+ */
+int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing);
+
 #endif
-- 
2.25.1

