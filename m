Return-Path: <linux-media+bounces-10435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4A68B6FDD
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57A6CB217DD
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F41312C80F;
	Tue, 30 Apr 2024 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cVjQkJzh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830D812C7E8;
	Tue, 30 Apr 2024 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473630; cv=none; b=rqeVwXbb+5B2gDRz4R+zgjJXRWVHv12IpNwpjSTG6H6Nc48xrUs5ScTjNxxKCAYBe5xx0snc89QpGR+JjbxpzF7JP3gyHa0WSXvb2lTWq/H40d7VQO6NDUSKr1O74+xhNPO9tWoM+uz1JnrZ0k2uFDWfdV8s32knKIfJnZCjy1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473630; c=relaxed/simple;
	bh=xS8pEzeDg9reNTYgVyYP6vUbluP5/nTp+G69p2pXS6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mL2mDMw2/9whIJwurZdwoqg82+mF6Mdj0r0OizyuPmRs3Ppf6qjt2+3/3QgKZtnWBpIrbLVk0m/9h4f1A5/dSk0vC53yehE1qw/aPgWMH3/wAZdaKtWHZpykp0FjJ8eJ5S2bVFkFLALkrb1HoTqfh4JCThIQjVy5QRjyvnpBogQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cVjQkJzh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDCA62A75;
	Tue, 30 Apr 2024 12:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473562;
	bh=xS8pEzeDg9reNTYgVyYP6vUbluP5/nTp+G69p2pXS6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cVjQkJzhygAKgyzz/tn1ZXquAa0syl2XtYnLxDH8AUzQRkN97fyEj8JUyvjFNF/OX
	 ExAKJfd58yeJC0r3SeXT6DHn/M0yH87iIPbp8C/tU+nEoiUFvVGD5ymDNzhLGRz/zx
	 AmNpCXAGILZXO2gTm/pe4+Pac+LUonnNSL00aqkM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 11/19] media: max9286: Use V4L2 Streams
Date: Tue, 30 Apr 2024 12:39:47 +0200
Message-ID: <20240430103956.60190-12-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use V4L2 streams by introducing a static route table that reports
how the enabled source links are routed through the CSI-2 source pad.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 43 +++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ae1b73fde832..f203e4527257 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -800,7 +800,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 		 * Get the format from the first used sink pad, as all sink
 		 * formats must be identical.
 		 */
-		format = v4l2_subdev_state_get_format(state, source_idx);
+		format = v4l2_subdev_state_get_format(state, source_idx, 0);
 
 		max9286_set_video_format(priv, format);
 		max9286_set_fsync_period(priv, state);
@@ -918,13 +918,14 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	if (i == ARRAY_SIZE(max9286_formats))
 		format->format.code = max9286_formats[0].code;
 
-	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
+	*v4l2_subdev_state_get_format(state, format->pad, 0) = format->format;
 
 	/*
-	 * Apply the same format on the source pad: all links must have the
+	 * Apply the same format on the opposite stream: all links must have the
 	 * same format.
 	 */
-	*v4l2_subdev_state_get_format(state, MAX9286_SRC_PAD) = format->format;
+	*v4l2_subdev_state_get_opposite_stream_format(state, format->pad, 0) =
+		format->format;
 
 	return 0;
 }
@@ -957,23 +958,32 @@ static const struct v4l2_mbus_framefmt max9286_default_format = {
 	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
 };
 
-static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
-{
-	*fmt = max9286_default_format;
-}
-
 static int max9286_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
-	struct v4l2_mbus_framefmt *format;
-	unsigned int i;
+	struct v4l2_subdev_route routes[MAX9286_N_SINKS];
+	struct max9286_priv *priv = sd_to_max9286(sd);
+	struct max9286_source *source;
+	unsigned int num_routes = 0;
 
-	for (i = 0; i < MAX9286_N_SINKS; i++) {
-		format = v4l2_subdev_state_get_format(state, i);
-		max9286_init_format(format);
+	for_each_source(priv, source) {
+		struct v4l2_subdev_route *route = &routes[num_routes++];
+		unsigned int index = to_index(priv, source);
+
+		route->sink_pad = index;
+		route->sink_stream = 0;
+		route->source_pad = MAX9286_SRC_PAD;
+		route->source_stream = index;
+		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
 	}
 
-	return 0;
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = num_routes,
+		.routes = routes,
+	};
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+						&max9286_default_format);
 }
 
 static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
@@ -1014,7 +1024,8 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 	/* Configure V4L2 for the MAX9286 itself */
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
 	priv->sd.internal_ops = &max9286_subdev_internal_ops;
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			  V4L2_SUBDEV_FL_STREAMS;
 
 	v4l2_ctrl_handler_init(&priv->ctrls, 1);
 	priv->pixelrate_ctrl = v4l2_ctrl_new_std(&priv->ctrls,
-- 
2.44.0


