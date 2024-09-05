Return-Path: <linux-media+bounces-17716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3599496E5F4
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61E161C2281F
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 22:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5BD1B5EB9;
	Thu,  5 Sep 2024 22:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vDGhZoaT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06C61AB514;
	Thu,  5 Sep 2024 22:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576820; cv=none; b=licTeIyBQKHClQRD6hzNZbTT5zwL/S05yIlREpnw1EFEe1tpEt7p8DpMkAV0x9ffJpKriYZow6bbUbzGquUZ71iGXN9vng5KiyR3lvFxzqUrGmgQqHrfBZ+Ip4QztY+LPCTU6RI50kXFBbZchnRFivyGa5Z9nQW65Pdpeq8NFXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576820; c=relaxed/simple;
	bh=SJs3uGkQLdSxJPqrkaRewpnSWVHVRy+oUPRnsCpSTSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WN2nJ+sfJMNdbtBJtMiHdaGtyfC//jY9JuN4uRCditMAFo77/8jAR2oYyVH3aHD7QrIbI72rrcpVNy//pERNMMR1J+thzMSav6UnoYOJXzOK6Z1nEiWl5x60orvVPZOk9MjsZTak1vSzsrLliSk8PR7srP0DuwFVoEeCug1lkY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vDGhZoaT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E28CF1AC8;
	Fri,  6 Sep 2024 00:52:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725576732;
	bh=SJs3uGkQLdSxJPqrkaRewpnSWVHVRy+oUPRnsCpSTSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDGhZoaTo0HB/fzPWpbSDGX8i+iPQz8Xniu5fTtczSQZa2zIKRvGZzBo34z1Hv9If
	 kK6RVPo5oo1C2I3uqBV3cSSkYrY9ch0DEQ5pFXDS25W7rDcL72jXx8q4AYREUj5n7w
	 aD3nd5e9n7c8SL9JO+md9+kFCx7lGtHiE1fwvIvA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH/RFC v2 6/9] media: i2c: ar0144: Report internal routes to userspace
Date: Fri,  6 Sep 2024 01:53:04 +0300
Message-ID: <20240905225308.11267-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
References: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
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
index 432f2dba58d2..a784d806b189 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -1446,11 +1446,31 @@ static int ar0144_disable_streams(struct v4l2_subdev *sd,
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
 
@@ -1528,7 +1548,8 @@ static int ar0144_init_subdev(struct ar0144 *sensor)
 
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


