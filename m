Return-Path: <linux-media+bounces-38601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF3B14505
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 01:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E61AF16D3A1
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 23:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE082367C4;
	Mon, 28 Jul 2025 23:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NkgnyAYH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569C1A316E
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 23:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753746634; cv=none; b=rI7BtOcD/rjKSFFdC8xF5g8k3noTQppsN9kyQ2gK4YtSYQcAiHx79zNNnwgm1UWRYpfFD4Gy2XroibrzTR3jYvvVzTDpI3n4JYVWXHwT0dlsWRIF8gH4pF6ZvEYWp2ye0MaHuelb4A3iLtDIqXv4Pv/RiPecKZ2lovWPvDTcTsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753746634; c=relaxed/simple;
	bh=Te5FKwEIMMgMedqo4Tjz6FCjYOwxkZQJvXY8zBDHMRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CNLRxK63rpJqMeCWh+ddRKDwkgCuXtAy8Y2O/h7ALwX0o96LvyTCbeLrHN8ILlUYV4yfOZDGnseSFYsPeILxKF3YWvXQSCxRNzsGlNFr+pIcJYwaaqd3zmhiU051gu34c5NL4/wZr5uTTGeq3fmY1YKzDpPulBo+ooSkRrhPde4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NkgnyAYH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2B0E31387;
	Tue, 29 Jul 2025 01:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753746579;
	bh=Te5FKwEIMMgMedqo4Tjz6FCjYOwxkZQJvXY8zBDHMRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NkgnyAYHqqiYr1WIW3iMlLdcRW3oBpUlnRtEAOeJ1FLLRYIouipaer9P9zDsj/sK+
	 ZmLFDhxuJAxuyrOCebRTNk6eGee7QkadFBI+UjT6qFsPNii4O6F3Me6m999Zi2imi0
	 BgJPmcrzTUD5OvBXokJOtmEUnlSMYM1SLDiJCvbM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 2/3] media: staging/ipu7: Disallow source multiplexing
Date: Tue, 29 Jul 2025 02:50:09 +0300
Message-ID: <20250728235010.2926-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250728235010.2926-1-laurent.pinchart@ideasonboard.com>
References: <20250728235010.2926-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPU7 ISYS driver can't capture multiple streams on the same video
device. Disallow source multiplexing in the routes of the internal
subdev to reflect that limitation. As a result we can hardcode the
source stream to 0, simplifying the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/ipu7/ipu7-isys-queue.c  |  3 +-
 drivers/staging/media/ipu7/ipu7-isys-subdev.c | 35 ++++++-------------
 drivers/staging/media/ipu7/ipu7-isys-subdev.h |  1 -
 drivers/staging/media/ipu7/ipu7-isys-video.c  | 35 ++-----------------
 4 files changed, 14 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-queue.c b/drivers/staging/media/ipu7/ipu7-isys-queue.c
index 7046c29141f8..434d9d9c7158 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-queue.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-queue.c
@@ -442,14 +442,13 @@ static int ipu7_isys_link_fmt_validate(struct ipu7_isys_queue *aq)
 		media_pad_remote_pad_first(av->vdev.entity.pads);
 	struct v4l2_mbus_framefmt format;
 	struct v4l2_subdev *sd;
-	u32 r_stream, code;
+	u32 r_stream = 0, code;
 	int ret;
 
 	if (!remote_pad)
 		return -ENOTCONN;
 
 	sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-	r_stream = ipu7_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
 
 	ret = ipu7_isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream,
 					   &format);
diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.c b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
index 98b6ef6a2f21..67a776033d5b 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-subdev.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
@@ -194,13 +194,22 @@ static int subdev_set_routing(struct v4l2_subdev *sd,
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 		.field = V4L2_FIELD_NONE,
 	};
+	struct v4l2_subdev_route *route;
 	int ret;
 
 	ret = v4l2_subdev_routing_validate(sd, routing,
-					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
 	if (ret)
 		return ret;
 
+	/*
+	 * The device doesn't support source multiplexing, set all source
+	 * streams to 0 to simplify stream handling through the driver.
+	 */
+	for_each_active_route(routing, route)
+		route->source_stream = 0;
+
 	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &fmt);
 }
 
@@ -222,30 +231,6 @@ int ipu7_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
 	return fmt ? 0 : -EINVAL;
 }
 
-u32 ipu7_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
-{
-	struct v4l2_subdev_state *state;
-	struct v4l2_subdev_route *routes;
-	u32 source_stream = 0;
-	unsigned int i;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-	if (!state)
-		return 0;
-
-	routes = state->routing.routes;
-	for (i = 0; i < state->routing.num_routes; i++) {
-		if (routes[i].source_pad == pad) {
-			source_stream = routes[i].source_stream;
-			break;
-		}
-	}
-
-	v4l2_subdev_unlock_state(state);
-
-	return source_stream;
-}
-
 static int ipu7_isys_subdev_init_state(struct v4l2_subdev *sd,
 				       struct v4l2_subdev_state *state)
 {
diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.h b/drivers/staging/media/ipu7/ipu7-isys-subdev.h
index 1057ec39ae39..faa50031cf24 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-subdev.h
+++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.h
@@ -37,7 +37,6 @@ int ipu7_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum
 				    *code);
-u32 ipu7_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
 int ipu7_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
 				 struct v4l2_mbus_framefmt *format);
 int ipu7_isys_subdev_set_routing(struct v4l2_subdev *sd,
diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8756da3a8fb0..3d52634683d6 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -291,7 +291,7 @@ static int link_validate(struct media_link *link)
 	struct v4l2_mbus_framefmt *s_fmt;
 	struct v4l2_subdev *s_sd;
 	struct media_pad *s_pad;
-	u32 s_stream, code;
+	u32 s_stream = 0, code;
 	int ret = -EPIPE;
 
 	if (!link->source->entity)
@@ -307,7 +307,6 @@ static int link_validate(struct media_link *link)
 		link->sink->entity->name);
 
 	s_pad = media_pad_remote_pad_first(&av->pad);
-	s_stream = ipu7_isys_get_src_stream_by_src_pad(s_sd, s_pad->index);
 
 	v4l2_subdev_lock_state(s_state);
 
@@ -370,10 +369,9 @@ static int ipu7_isys_fw_pin_cfg(struct ipu7_isys_video *av,
 	struct device *dev = &isys->adev->auxdev.dev;
 	struct v4l2_mbus_framefmt fmt;
 	int output_pins;
-	u32 src_stream;
+	u32 src_stream = 0;
 	int ret;
 
-	src_stream = ipu7_isys_get_src_stream_by_src_pad(sd, src_pad->index);
 	ret = ipu7_isys_get_stream_pad_fmt(sd, src_pad->index, src_stream,
 					   &fmt);
 	if (ret < 0) {
@@ -781,32 +779,6 @@ ipu7_isys_query_stream_by_source(struct ipu7_isys *isys, int source, u8 vc)
 	return stream;
 }
 
-static u32 get_remote_pad_stream(struct media_pad *r_pad)
-{
-	struct v4l2_subdev_state *state;
-	struct v4l2_subdev *sd;
-	u32 stream_id = 0;
-	unsigned int i;
-
-	sd = media_entity_to_v4l2_subdev(r_pad->entity);
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-	if (!state)
-		return 0;
-
-	for (i = 0; i < state->stream_configs.num_configs; i++) {
-		struct v4l2_subdev_stream_config *cfg =
-			&state->stream_configs.configs[i];
-		if (cfg->pad == r_pad->index) {
-			stream_id = cfg->stream;
-			break;
-		}
-	}
-
-	v4l2_subdev_unlock_state(state);
-
-	return stream_id;
-}
-
 int ipu7_isys_video_set_streaming(struct ipu7_isys_video *av, int state,
 				  struct ipu7_isys_buffer_list *bl)
 {
@@ -814,7 +786,7 @@ int ipu7_isys_video_set_streaming(struct ipu7_isys_video *av, int state,
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct media_pad *r_pad;
 	struct v4l2_subdev *sd;
-	u32 r_stream;
+	u32 r_stream = 0;
 	int ret = 0;
 
 	dev_dbg(dev, "set stream: %d\n", state);
@@ -824,7 +796,6 @@ int ipu7_isys_video_set_streaming(struct ipu7_isys_video *av, int state,
 
 	sd = &stream->asd->sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
-	r_stream = get_remote_pad_stream(r_pad);
 	if (!state) {
 		stop_streaming_firmware(av);
 
-- 
Regards,

Laurent Pinchart


