Return-Path: <linux-media+bounces-7694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2276B887F57
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 23:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B54701F21515
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 22:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3143D994;
	Sun, 24 Mar 2024 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OC3Izkw2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67993BB32
	for <linux-media@vger.kernel.org>; Sun, 24 Mar 2024 22:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711318157; cv=none; b=R84BR8AwS/Aw9HXIwmbLLLl02nTGZedw/WUN8AxiDapQ1/WwbMi/R3HPLT2w+5ME+R9ywP1zlpw6njlukeYa6Zho2ncu7xKfMACO31r4lI/ALgurAZ48UIE6/ITaNsW/nAE8nUdOsdGE4uTasUPyYT5Ep3Iiw+rpfFWuQltGnNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711318157; c=relaxed/simple;
	bh=mqdg0RcNo+h/wZuzxWt+e+CLo6t8ZFm5aULtfoNNuho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhSyN+DGBmW0x79xfqp+zYO0fMvkymCLEhZ+yM631k6I+7Rync1BwJYH45rC+qYCQ0kwyzVmngLcq0vNZbMiteRFLsUKLW/ekEc5ovpbt3Fvfc3IfHzlvy8H2qFt1WWLzd/Q6/klUnW535KmjCY94d/2WJRE43OfFwO7lIdsRDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OC3Izkw2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A92A22E8;
	Sun, 24 Mar 2024 23:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711318117;
	bh=mqdg0RcNo+h/wZuzxWt+e+CLo6t8ZFm5aULtfoNNuho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OC3Izkw2fTHETSLzqWw7k45+0r96Eg+RgZI6I/PHVOhJgKNGod0q+XI7WmPTg/OFy
	 GtvVz2UyO0oewMC8l76xkyJBRqOgLlpQyPJ0B9FLnFgagdCZaMnUMLXgTLhS7w8XZP
	 bCSlQ1qbpKuUNxtRpNO9k2tfL5Dc6F6z2ssdh9vc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v7 03/15] media: i2c: imx219: Report internal routes to userspace
Date: Mon, 25 Mar 2024 00:08:39 +0200
Message-ID: <20240324220854.15010-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
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
V4L2_SUBDEV_FL_HAS_STREAMS flag and switch formats and selection
rectangles access from pads to streams. As the route is immutable,
there's no need to implement the .set_routing() operation, and we can
hardcode the sink and source stream IDs to 0.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes since v6:

- Drop change to get format API in imx219_set_ctrl()
- Fix function name in commit message
- Set V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag on route
---
 drivers/media/i2c/imx219.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 817bf192e4d9..6602250834be 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -993,15 +993,36 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
+	struct v4l2_subdev_route routes[1] = {
+		{
+			.sink_pad = IMX219_PAD_IMAGE,
+			.sink_stream = 0,
+			.source_pad = IMX219_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = IMX219_PAD_SOURCE,
+		.stream = 0,
 		.format = {
 			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
 			.width = supported_modes[0].width,
 			.height = supported_modes[0].height,
 		},
 	};
+	int ret;
+
+	ret = v4l2_subdev_set_routing(sd, state, &routing);
+	if (ret)
+		return ret;
 
 	imx219_set_pad_format(sd, state, &fmt);
 
@@ -1260,7 +1281,8 @@ static int imx219_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			    V4L2_SUBDEV_FL_HAS_EVENTS;
+			    V4L2_SUBDEV_FL_HAS_EVENTS |
+			    V4L2_SUBDEV_FL_STREAMS;
 	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	/*
-- 
Regards,

Laurent Pinchart


