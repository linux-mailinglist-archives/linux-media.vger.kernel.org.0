Return-Path: <linux-media+bounces-10429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA0B8B6FD0
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8CA71F23A4F
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1212CA7;
	Tue, 30 Apr 2024 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T9SQA+TJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA0512C462;
	Tue, 30 Apr 2024 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473622; cv=none; b=UfwRHk7sCYA7AekVf9Tno49fnx371TCRls9uCjxO+2UBq4zVi2yAVVWEBKjDXq1myinXIbxh0B/f0sU07A8iMTanwRzJAgSZBRGtwbAOwr39BB29sMm7dhdGKitoFgs6FWLSGoQB+XgvIiijxuYrohkwipW33ITvCw9MGMh9puw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473622; c=relaxed/simple;
	bh=rIk5g7YaB0zCpD5JgjgMVsk620zp0+qOgqPGhQvC52E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNIVHbsY1mgXA2rkSG5cZr18O5kYMIXL4vNsdaB3fA3aYP/36xI9aa7PukVELTIMmfGaO/gen1q8WxSY4EocNU+rh9GBOAeCXcgrAp6Fxsz53ShqKb099GKlp4qisi3MTgbmwuEEjTWjwA+ebxaIh0xl27ctmOYsDspHO0oSPEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T9SQA+TJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D18611D1;
	Tue, 30 Apr 2024 12:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473558;
	bh=rIk5g7YaB0zCpD5JgjgMVsk620zp0+qOgqPGhQvC52E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T9SQA+TJBbuA7hFuoR2yM43iKXBryKrwdPSIKGb5VSN7nJg7mIhxivuMpj6iBMu5g
	 Z0N+RBYVgJbZdNHsCfa+3VEbz1/cfSBKNG5dWFflEnV49fHkL/R1hNxfOR3uDPPC/5
	 1zLQJJnUiEJ7a96W7D7JHTn0lCoy/pNy1cL6TKI8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 05/19] media: adv748x: Implement set_routing()
Date: Tue, 30 Apr 2024 12:39:41 +0200
Message-ID: <20240430103956.60190-6-jacopo.mondi@ideasonboard.com>
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

Implement the set_routing() pad operation to control the MIPI CSI-2
Virtual Channel on which the video stream is sent on according to
the active route source stream number.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 43 +++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index ace4e1d904d9..7fa72340e66e 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -57,6 +57,38 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
 	return 0;
 }
 
+static int adv748x_csi2_apply_routing(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_krouting *routing)
+{
+	struct v4l2_subdev_route *route;
+	int ret;
+
+	/* Only one route at the time can be active. */
+	if (routing->num_routes > 1)
+		return -EINVAL;
+
+	/*
+	 * Validate the route: sink pad and sink stream shall be 0 and only
+	 * 4 source streams are supported (one for each supported MIPI CSI-2
+	 * channel).
+	 */
+	route = &routing->routes[0];
+
+	if (route->sink_pad != ADV748X_CSI2_SINK || route->sink_stream)
+		return -EINVAL;
+	if (route->source_pad != ADV748X_CSI2_SOURCE ||
+	    route->source_stream > 4)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing(sd, state, routing);
+}
+
 /* -----------------------------------------------------------------------------
  * v4l2_subdev_internal_ops
  */
@@ -79,7 +111,7 @@ static int adv748x_csi2_init_state(struct v4l2_subdev *sd,
 		.routes = routes,
 	};
 
-	return v4l2_subdev_set_routing(sd, state, &routing);
+	return adv748x_csi2_apply_routing(sd, state, &routing);
 }
 
 /*
@@ -200,10 +232,19 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
 	return 0;
 }
 
+static int adv748x_csi2_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    enum v4l2_subdev_format_whence which,
+				    struct v4l2_subdev_krouting *routing)
+{
+	return adv748x_csi2_apply_routing(sd, state, routing);
+}
+
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
+	.set_routing = adv748x_csi2_set_routing,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.44.0


