Return-Path: <linux-media+bounces-14421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3969F91D210
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 16:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6AD51F2124F
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 14:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B01153814;
	Sun, 30 Jun 2024 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aOnOhh4K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8DC1534FC;
	Sun, 30 Jun 2024 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719757129; cv=none; b=gD5B8EcAnCbQ9zcWCiUFDmtGYbXOWwT1JcsG2ghXX3mH6vgj34BAeU+1NmFgX5lAGE5S0dOV7ARbblcgzPQO+YAJ6a5xVND18+ngkOhFYnbDUPyWpyHaaijjoL6mPH3BSeVxUJBftJfTXr0dnb1SghON5P79C7sNGrNM78u5HkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719757129; c=relaxed/simple;
	bh=ejQG76npT5+3tKdJ/t0in2hcief4KieP3Ut1nncUNmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbVzF5vuz0O/TwQsECihuSJwtk5pta4zwsx19Kifb2NESIaWoMARAG2Un6wK8BU68W4fn9AeOs0CddJoI20VRb+4uqKoeuiaHls4HuQ4HKJG4wqER38xGM6s4E4YM7Njf1md5nEeXbjqfvYB8QJtU58rrSkWddmX6G5zC7zMBu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aOnOhh4K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-36-175-nat.elisa-mobile.fi [85.76.36.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C0F666D;
	Sun, 30 Jun 2024 16:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719757095;
	bh=ejQG76npT5+3tKdJ/t0in2hcief4KieP3Ut1nncUNmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aOnOhh4KmwqFdQCU0yaUz+QWKAghql/JVpPvNO+NWHDCZfAhflXzuF9jBCox8nojh
	 LpkRgg0QTz+DPpHZHrk+5UE5/GheC0sBKVfoBm2krV+vxnRaomEUoXw6VHoHUwNAX+
	 Q3FzFBQz/pTvU1+w8OlLj/0cvkGL8SzTx13GqMcU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH/RFC v1 6/9] media: i2c: ar0144: Report internal routes to userspace
Date: Sun, 30 Jun 2024 17:17:56 +0300
Message-ID: <20240630141802.15830-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
References: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usage of internal pads creates a route internal to the subdev, and the
V4L2 camera sensor API requires such routes to be reported to userspace.
Create the route in the .init_state() operation.

Internal routing support requires stream support, so set the
V4L2_SUBDEV_FL_STREAMS flag. As the route is immutable, there's no need
to implement the .set_routing() operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ar0144.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ar0144.c b/drivers/media/i2c/ar0144.c
index edf793f2122e..84915d682b79 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -1432,11 +1432,31 @@ static int ar0144_disable_streams(struct v4l2_subdev *sd,
 static int ar0144_entity_init_state(struct v4l2_subdev *sd,
 		struct v4l2_subdev_state *state)
 {
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = AR0144_PAD_IMAGE,
+			.sink_stream = 0,
+			.source_pad = AR0144_PAD_SOURCE,
+			.source_stream = AR0144_STREAM_IMAGE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
 	const struct ar0144_format_info *info;
 	struct ar0144 *sensor = to_ar0144(sd);
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_rect *crop;
 	struct v4l2_rect *compose;
+	int ret;
+
+	ret = v4l2_subdev_set_routing(sd, state, &routing);
+	if (ret)
+		return ret;
 
 	info = &ar0144_formats[0];
 
@@ -1514,7 +1534,8 @@ static int ar0144_init_subdev(struct ar0144 *sensor)
 
 	v4l2_i2c_subdev_init(sd, client, &ar0144_subdev_ops);
 
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_STREAMS;
 	sd->internal_ops = &ar0144_subdev_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	sd->entity.ops = &ar0144_entity_ops;
-- 
Regards,

Laurent Pinchart


