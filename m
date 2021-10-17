Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4112C430B74
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 20:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344231AbhJQS0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 14:26:32 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:38141 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344139AbhJQS0c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 14:26:32 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E597C200004;
        Sun, 17 Oct 2021 18:24:19 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/13] media: subdev: Add for_each_active_route() macro
Date:   Sun, 17 Oct 2021 20:24:42 +0200
Message-Id: <20211017182449.64192-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a for_each_active_route() macro to replace the repeated pattern
of iterating on the active routes of a routing table.

Replace the existing occurrences of such pattern in the codebase.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/ds90ub913.c             |  8 ++------
 drivers/media/i2c/ds90ub953.c             |  7 ++-----
 drivers/media/i2c/ds90ub960.c             |  8 ++------
 drivers/media/i2c/max9286.c               | 10 ++--------
 drivers/media/platform/ti-vpe/cal-video.c |  9 ++-------
 drivers/media/v4l2-core/v4l2-subdev.c     | 18 ++++++++++++++++++
 include/media/v4l2-subdev.h               | 11 +++++++++++
 7 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index d675faa2c571..478717e05480 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -342,8 +342,8 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	struct ub913_data *priv = sd_to_ub913(sd);
 	const struct v4l2_subdev_krouting *routing;
 	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
-	unsigned int i;
 	int ret = 0;
 
 	if (pad != 1) /* first tx pad */
@@ -361,13 +361,9 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
 
-	for (i = 0; i < routing->num_routes; ++i) {
-		const struct v4l2_subdev_route *route = &routing->routes[i];
+	for_each_active_route(routing, route) {
 		unsigned int j;
 
-		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
-			continue;
-
 		if (route->source_pad != pad)
 			continue;
 
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index d0b47e31be90..8615d8e996ee 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -383,6 +383,7 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	struct ub953_data *priv = sd_to_ub953(sd);
 	const struct v4l2_subdev_krouting *routing;
 	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
 	unsigned int i;
 	int ret = 0;
@@ -402,14 +403,10 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 
-	for (i = 0; i < routing->num_routes; ++i) {
-		const struct v4l2_subdev_route *route = &routing->routes[i];
+	for_each_active_route(routing, route) {
 		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
 		unsigned int j;
 
-		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
-			continue;
-
 		if (route->source_pad != pad)
 			continue;
 
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index c655cb3e1ad6..9f79efddb138 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1521,9 +1521,9 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 {
 	struct ub960_data *priv = sd_to_ub960(sd);
 	const struct v4l2_subdev_krouting *routing;
+	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
 	int ret = 0;
-	unsigned int i;
 	struct device *dev = &priv->client->dev;
 
 	dev_dbg(dev, "%s for pad %d\n", __func__, pad);
@@ -1539,15 +1539,11 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 
-	for (i = 0; i < routing->num_routes; ++i) {
-		const struct v4l2_subdev_route *route = &routing->routes[i];
+	for_each_active_route(routing, route) {
 		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
 		struct v4l2_mbus_frame_desc source_fd;
 		unsigned int j;
 
-		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
-			continue;
-
 		if (route->source_pad != pad)
 			continue;
 
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index e51771d99437..8bfb88db9976 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -952,7 +952,7 @@ static int max9286_set_routing(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_krouting *routing)
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
-	unsigned int i;
+	struct v4l2_subdev_route *route;
 	int ret;
 
 	state = v4l2_subdev_validate_and_lock_state(sd, state);
@@ -968,14 +968,8 @@ static int max9286_set_routing(struct v4l2_subdev *sd,
 	 * routed sources.
 	 */
 	priv->route_mask = 0;
-	for (i = 0; i < routing->num_routes; ++i) {
-		struct v4l2_subdev_route *route = &routing->routes[i];
-
-		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
-			continue;
-
+	for_each_active_route(routing, route)
 		priv->route_mask |= BIT(route->sink_pad);
-	}
 
 	max9286_set_pixelrate(priv);
 
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index f945d737c5e5..cdd279a32beb 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -771,6 +771,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	if (cal_mc_api) {
 		struct v4l2_subdev_route *route = NULL;
+		struct v4l2_subdev_route *r;
 		struct media_pad *remote_pad;
 		unsigned int i;
 		struct v4l2_subdev_state *state;
@@ -790,13 +791,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 		/* Find the stream */
 
-		for (i = 0; i < state->routing.num_routes; ++i) {
-			struct v4l2_subdev_route *r =
-				&state->routing.routes[i];
-
-			if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
-				continue;
-
+		for_each_active_route(routing, r) {
 			if (r->source_pad != remote_pad->index)
 				continue;
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 2a64ff003e4b..7dde44467c9a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1593,3 +1593,21 @@ int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_routing_simple_verify);
+
+struct v4l2_subdev_route *next_active_route(const struct v4l2_subdev_krouting *routing,
+					    struct v4l2_subdev_route *route)
+{
+	if (route)
+		++route;
+	else
+		route = &routing->routes[0];
+
+	for (; route < routing->routes + routing->num_routes; ++route) {
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		return route;
+	}
+
+	return NULL;
+}
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d0354e507970..ffce66e88952 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1582,4 +1582,15 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
  */
 int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing);
 
+struct v4l2_subdev_route *next_active_route(const struct v4l2_subdev_krouting *routing,
+					    struct v4l2_subdev_route *route);
+/**
+ * for_each_active_route - iterate on all active routes of a routing table
+ * @routing: The routing table
+ * @route: The route iterator
+ */
+#define for_each_active_route(routing, route)			\
+	for ((route) = NULL;					\
+	    ((route) = next_active_route((routing), (route)));)
+
 #endif
-- 
2.33.0

