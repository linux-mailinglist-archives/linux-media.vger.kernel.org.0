Return-Path: <linux-media+bounces-10442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF8D8B6FEE
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79E92B21DD6
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B8912CDB1;
	Tue, 30 Apr 2024 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pBwJu1Z6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945012C472;
	Tue, 30 Apr 2024 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473642; cv=none; b=PUoMiVGURY1jpwyn8+zbNoyq2/7CY87TRP2HKn2GEkNNuCutEJDH3EZGWKUKRYEx3xMM8SGnYJsahHGrmaDdACt0LnmJyGldIxbonnsFaem3wFOO21t4fHDLrnkciUzRZbfokTMq5b8NXzgqerKaEXGBubHV8/JDSfFQrPJzPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473642; c=relaxed/simple;
	bh=EydoJwbDqglKuaFtwarozcvw/Ov3oNvA/FhfsRczdZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/1agCTTi877yHD8KJAyxnD7lKB3S5QIdroqRWazeEVQhkKI5Jaj2y3AkxjbwY3k8KTVUk+UMWto8aH9HoQP99insYMRqEo6kQixp+KFPVKJ3+lZwAeSZatndoiRAYIFKfmUTEy3OS4HhCdMjRwDjExktG5w+ZVwHImZlY71slI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pBwJu1Z6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CB1E331B;
	Tue, 30 Apr 2024 12:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473566;
	bh=EydoJwbDqglKuaFtwarozcvw/Ov3oNvA/FhfsRczdZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pBwJu1Z6mxTKh+xYs9aKs9pYMxwYYHDRuLlHi6/NMvofdnvZ9ayt81Vrh8AMxANvX
	 zmKLim4VMX97cLSkNCPNiaCuNNbv1scyG75AdRVLKXS+bMGy7xX3PdcyEkj5H5o7i2
	 te+tL9E0W1T980bDI2kXzQ6IGaYwyius0ZHsCZiY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 18/19] media: rcar-csi2: Implement set_routing
Date: Tue, 30 Apr 2024 12:39:54 +0200
Message-ID: <20240430103956.60190-19-jacopo.mondi@ideasonboard.com>
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

Add the set_routing() subdev operation to allow userspace to activate
routes on the R-Car CSI-2 receiver.

Routing for this device is fixed. Validate that the provided route
respects it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 48 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index ed818a6fa655..47cb12f077e5 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1287,6 +1287,51 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_apply_routing(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	/*
+	 * Routing is fixed for this device.
+	 *
+	 * Only routes in the form of CSI2:0/x->CSI2:x+1/0 are allowed.
+	 *
+	 * We have anyway to implement set_routing to mark the route as active.
+	 */
+	for (unsigned int i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+		unsigned int pad = route->sink_stream + 1;
+
+		if (route->sink_pad != 0)
+			return -EINVAL;
+
+		if (route->source_pad != pad || route->source_stream != 0)
+			return -EINVAL;
+	}
+
+	return v4l2_subdev_set_routing(sd, state, routing);
+}
+
+static int rcsi2_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     enum v4l2_subdev_format_whence which,
+			     struct v4l2_subdev_krouting *routing)
+{
+	struct rcar_csi2 *priv = sd_to_csi2(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->stream_count)
+		return -EBUSY;
+
+	return rcsi2_apply_routing(sd, state, routing);
+}
+
 static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
 	.s_stream = rcsi2_s_stream,
 };
@@ -1294,6 +1339,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.set_routing = rcsi2_set_routing,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
@@ -1353,7 +1399,7 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
 		.routes = routes,
 	};
 
-	return v4l2_subdev_set_routing(sd, state, &routing);
+	return rcsi2_apply_routing(sd, state, &routing);
 }
 
 static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
-- 
2.44.0


