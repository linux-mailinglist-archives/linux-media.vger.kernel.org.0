Return-Path: <linux-media+bounces-6260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D9386EB2E
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D0021F24178
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3074758AC1;
	Fri,  1 Mar 2024 21:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Dtntj+CY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AD35821B
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 21:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709328758; cv=none; b=e3q5mhrtSWj0ZFKYo4sHmqqWQvVqH4ioPenx7gsmQERKlM0xCUXzhidktjxbX4zZW5+D2Agankol1H63m7QHCq0h2eURgKN1cPn1iMQ+3Y7n3VA/EFb3nCoNnvdfx0pofwZjG8Dyddwf31jxqDLFgRVzbD4HdqLTBRfdVFJ9atg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709328758; c=relaxed/simple;
	bh=viugRBs8+4VOZIXKF2Kso1hP8cXyJ/iMOX3jyZbnmwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UIv7CQLDlHph1mP5OJ61xWaL9JL1srhyWF9+VyFk9wr01CLQUs35WeqzhSPWIzwkAyQcpsZFISDV9+UMAgDBgPI5hC2i91qb9rTYu4BqMUmZt6c6kkpodOTKauoj/zLPNr5ENHzzSEHs/KmjuJG17LkuM5TcR5XDA6+EUe8drNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Dtntj+CY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36DFE31B4;
	Fri,  1 Mar 2024 22:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709328739;
	bh=viugRBs8+4VOZIXKF2Kso1hP8cXyJ/iMOX3jyZbnmwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dtntj+CYL/1nqqwMMwVLL9w7SRzmFtRH/NXonZA3IMF+IFEsrcOkPdy2HX5jSLL+t
	 m/huvnKO/1WBYToc6uxHRFxRmkP0POVWx6ZCrhV9Dc80XNZAIEwpL9mq07JXyEJT4Z
	 YESAf81a6haxPZggUHpQekTYtxX7sW/yruKZjSLo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v6 03/15] media: i2c: imx219: Report internal routes to userspace
Date: Fri,  1 Mar 2024 23:32:18 +0200
Message-ID: <20240301213231.10340-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usage of internal pads creates a route internal to the subdev, and the
V4L2 camera sensor API requires such routes to be reported to userspace.
Create the route in the .init_cfg() operation.

Internal routing support requires stream support, so set the
V4L2_SUBDEV_FL_HAS_STREAMS flag and switch formats and selection
rectangles access from pads to streams. As the route is immutable,
there's no need to implement the .set_routing() operation, and we can
hardcode the sink and source stream IDs to 0.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 817bf192e4d9..52afb821f667 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -381,7 +381,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+
+	format = v4l2_subdev_state_get_opposite_stream_format(state,
+							      IMX219_PAD_IMAGE,
+							      0);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
@@ -993,15 +996,35 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
+	struct v4l2_subdev_route routes[1] = {
+		{
+			.sink_pad = IMX219_PAD_IMAGE,
+			.sink_stream = 0,
+			.source_pad = IMX219_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
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
 
@@ -1260,7 +1283,8 @@ static int imx219_probe(struct i2c_client *client)
 
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


