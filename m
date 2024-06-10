Return-Path: <linux-media+bounces-12797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7917901937
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 03:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F09EB2149C
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 01:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807024428;
	Mon, 10 Jun 2024 01:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RdB+xres"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6211869
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 01:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717982583; cv=none; b=An9XepFAhgWut3R5wYkI+URil04yBZwv3LK9DxyL6ZaAt/z2uhfOyqm5vfwPFzJfpBl+9Tfl9hIxJGU8d8VEw1JdSaXWjTfQTcb14gjb4URWmA/W3rdVtt2SH1guhdqIXmeqQ0R2XIiODejJ1gm7RXwpeVjoYIFTr6azf8ovu4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717982583; c=relaxed/simple;
	bh=SJwZgOt7BnIsBNckuu93V9HPz7inVBiMNALfIFocaGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrbHvgDDVZbTt6ing88Mw0wrx48r/fezEDuguXKrfI/JJ2/uXmfLuaQhNdkg/8Fp5Ugz6v4WpwxsQxXARifh9iWx4LRKi3ElC/jxQS+U+cxMObrElIKswbCFgnMzcRfADuaUx7Xib6yJqGRe7HQk75ovyHlVBkDWHdFB0V4hdxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RdB+xres; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3118AD77;
	Mon, 10 Jun 2024 03:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717982568;
	bh=SJwZgOt7BnIsBNckuu93V9HPz7inVBiMNALfIFocaGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RdB+xres4RHKEiyP2v83/g3LqCAVQf391e2cFk+AUhJzNhQTFMuQUpRm8IiFMdQz9
	 VSYD5W+43MFhxiqRDocP5u9A3GVP+NOaNUVHgohyy29CgZ1fXqDJYIn1DleOjD3brD
	 LpOlMglE8Ae3zrD+tPh8ba1Z6duro+g4I1fzE5/0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [v4l-utils] [PATCH v1 1/3] libv4l2subdev: Extend API with 'which' argument where missing
Date: Mon, 10 Jun 2024 04:22:36 +0300
Message-ID: <20240610012238.30462-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240610012238.30462-1-laurent.pinchart@ideasonboard.com>
References: <20240610012238.30462-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many functions exposed by libv4l2subdev have been added over time
hardcoding usage of the V4L2_SUBDEV_FORMAT_ACTIVE state. Extend them
with a 'which' argument to allow callers to access the TRY state as
well. Update existing callers to pass V4L2_SUBDEV_FORMAT_ACTIVE
unconditionally, preserving the existing behaviour.

To support accessing the TRY state when getting or setting frame
intervals, set the V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH client
capability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/media-ctl/libv4l2subdev.c | 65 +++++++++++++++++++++------------
 utils/media-ctl/media-ctl.c     | 11 ++++--
 utils/media-ctl/v4l2subdev.h    | 49 ++++++++++++++++++++++---
 3 files changed, 92 insertions(+), 33 deletions(-)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index e0df686e01c7..163fd610dce7 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -69,7 +69,8 @@ int v4l2_subdev_open(struct media_entity *entity)
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
 	subdev_streams = !ret && (subdevcap.capabilities & V4L2_SUBDEV_CAP_STREAMS);
 
-	clientcap.capabilities = V4L2_SUBDEV_CLIENT_CAP_STREAMS;
+	clientcap.capabilities = V4L2_SUBDEV_CLIENT_CAP_STREAMS
+			       | V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH;
 
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &clientcap);
 	client_streams = !ret && (clientcap.capabilities & V4L2_SUBDEV_CLIENT_CAP_STREAMS);
@@ -240,10 +241,11 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
 
 int v4l2_subdev_get_routing(struct media_entity *entity,
 			    struct v4l2_subdev_route **routes,
-			    unsigned int *num_routes)
+			    unsigned int *num_routes,
+			    enum v4l2_subdev_format_whence which)
 {
 	struct v4l2_subdev_routing routing = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.which = which,
 	};
 	struct v4l2_subdev_route *r;
 	int ret;
@@ -287,10 +289,11 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
 
 int v4l2_subdev_set_routing(struct media_entity *entity,
 			    struct v4l2_subdev_route *routes,
-			    unsigned int num_routes)
+			    unsigned int num_routes,
+			    enum v4l2_subdev_format_whence which)
 {
 	struct v4l2_subdev_routing routing = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.which = which,
 		.routes = (uintptr_t)routes,
 		.num_routes = num_routes,
 		.len_routes = num_routes,
@@ -387,7 +390,8 @@ int v4l2_subdev_set_dv_timings(struct media_entity *entity,
 
 int v4l2_subdev_get_frame_interval(struct media_entity *entity,
 				   struct v4l2_fract *interval,
-				   unsigned int pad, unsigned int stream)
+				   unsigned int pad, unsigned int stream,
+				   enum v4l2_subdev_format_whence which)
 {
 	struct v4l2_subdev_frame_interval ival;
 	int ret;
@@ -404,6 +408,7 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
 	memset(&ival, 0, sizeof(ival));
 	ival.pad = pad;
 	ival.stream = stream;
+	ival.which = which;
 
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &ival);
 	if (ret < 0)
@@ -415,7 +420,8 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
 
 int v4l2_subdev_set_frame_interval(struct media_entity *entity,
 				   struct v4l2_fract *interval,
-				   unsigned int pad, unsigned int stream)
+				   unsigned int pad, unsigned int stream,
+				   enum v4l2_subdev_format_whence which)
 {
 	struct v4l2_subdev_frame_interval ival;
 	int ret;
@@ -433,6 +439,7 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
 	ival.pad = pad;
 	ival.stream = stream;
 	ival.interval = *interval;
+	ival.which = which;
 
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &ival);
 	if (ret < 0)
@@ -514,7 +521,9 @@ static int v4l2_subdev_parse_setup_route(struct media_device *media,
 	return 0;
 }
 
-int v4l2_subdev_parse_setup_routes(struct media_device *media, const char *p)
+int v4l2_subdev_parse_setup_routes(struct media_device *media,
+				   enum v4l2_subdev_format_whence which,
+				   const char *p)
 {
 	struct media_entity *entity;
 	struct v4l2_subdev_route *routes;
@@ -578,7 +587,7 @@ int v4l2_subdev_parse_setup_routes(struct media_device *media, const char *p)
 			  r->flags);
 	}
 
-	ret = v4l2_subdev_set_routing(entity, routes, num_routes);
+	ret = v4l2_subdev_set_routing(entity, routes, num_routes, which);
 	if (ret) {
 		media_dbg(entity->media, "VIDIOC_SUBDEV_S_ROUTING failed: %d\n",
 			  ret);
@@ -961,7 +970,8 @@ static struct media_pad *v4l2_subdev_parse_pad_format(
 
 static int set_format(struct media_pad *pad,
 		      unsigned int stream,
-		      struct v4l2_mbus_framefmt *format)
+		      struct v4l2_mbus_framefmt *format,
+		      enum v4l2_subdev_format_whence which)
 {
 	int ret;
 
@@ -975,7 +985,7 @@ static int set_format(struct media_pad *pad,
 		  pad->entity->info.name, pad->index, stream);
 
 	ret = v4l2_subdev_set_format(pad->entity, format, pad->index, stream,
-				     V4L2_SUBDEV_FORMAT_ACTIVE);
+				     which);
 	if (ret < 0) {
 		media_dbg(pad->entity->media,
 			  "Unable to set format: %s (%d)\n",
@@ -992,7 +1002,8 @@ static int set_format(struct media_pad *pad,
 }
 
 static int set_selection(struct media_pad *pad, unsigned int stream,
-			 unsigned int target, struct v4l2_rect *rect)
+			 unsigned int target, struct v4l2_rect *rect,
+			 enum v4l2_subdev_format_whence which)
 {
 	int ret;
 
@@ -1005,7 +1016,7 @@ static int set_selection(struct media_pad *pad, unsigned int stream,
 		  pad->entity->info.name, pad->index, stream);
 
 	ret = v4l2_subdev_set_selection(pad->entity, rect, pad->index, stream,
-					target, V4L2_SUBDEV_FORMAT_ACTIVE);
+					target, which);
 	if (ret < 0) {
 		media_dbg(pad->entity->media,
 			  "Unable to set selection rectangle: %s (%d)\n",
@@ -1021,7 +1032,8 @@ static int set_selection(struct media_pad *pad, unsigned int stream,
 }
 
 static int set_frame_interval(struct media_pad *pad, unsigned int stream,
-			      struct v4l2_fract *interval)
+			      struct v4l2_fract *interval,
+			      enum v4l2_subdev_format_whence which)
 {
 	int ret;
 
@@ -1034,7 +1046,7 @@ static int set_frame_interval(struct media_pad *pad, unsigned int stream,
 		  pad->entity->info.name, pad->index, stream);
 
 	ret = v4l2_subdev_set_frame_interval(pad->entity, interval, pad->index,
-					     stream);
+					     stream, which);
 	if (ret < 0) {
 		media_dbg(pad->entity->media,
 			  "Unable to set frame interval: %s (%d)",
@@ -1050,6 +1062,7 @@ static int set_frame_interval(struct media_pad *pad, unsigned int stream,
 
 
 static int v4l2_subdev_parse_setup_format(struct media_device *media,
+					  enum v4l2_subdev_format_whence which,
 					  const char *p, char **endp)
 {
 	struct v4l2_mbus_framefmt format = { 0, 0, 0 };
@@ -1072,26 +1085,26 @@ static int v4l2_subdev_parse_setup_format(struct media_device *media,
 	}
 
 	if (pad->flags & MEDIA_PAD_FL_SINK) {
-		ret = set_format(pad, stream, &format);
+		ret = set_format(pad, stream, &format, which);
 		if (ret < 0)
 			return ret;
 	}
 
-	ret = set_selection(pad, stream, V4L2_SEL_TGT_CROP, &crop);
+	ret = set_selection(pad, stream, V4L2_SEL_TGT_CROP, &crop, which);
 	if (ret < 0)
 		return ret;
 
-	ret = set_selection(pad, stream, V4L2_SEL_TGT_COMPOSE, &compose);
+	ret = set_selection(pad, stream, V4L2_SEL_TGT_COMPOSE, &compose, which);
 	if (ret < 0)
 		return ret;
 
 	if (pad->flags & MEDIA_PAD_FL_SOURCE) {
-		ret = set_format(pad, stream, &format);
+		ret = set_format(pad, stream, &format, which);
 		if (ret < 0)
 			return ret;
 	}
 
-	ret = set_frame_interval(pad, stream, &interval);
+	ret = set_frame_interval(pad, stream, &interval, which);
 	if (ret < 0)
 		return ret;
 
@@ -1109,9 +1122,11 @@ static int v4l2_subdev_parse_setup_format(struct media_device *media,
 			if (link->source == pad &&
 			    link->sink->entity->info.type == MEDIA_ENT_T_V4L2_SUBDEV) {
 				remote_format = format;
-				set_format(link->sink, stream, &remote_format);
+				set_format(link->sink, stream, &remote_format,
+					   which);
 
-				ret = set_frame_interval(link->sink, stream, &interval);
+				ret = set_frame_interval(link->sink, stream,
+							 &interval, which);
 				if (ret < 0 && ret != -EINVAL && ret != -ENOTTY)
 					return ret;
 			}
@@ -1122,13 +1137,15 @@ static int v4l2_subdev_parse_setup_format(struct media_device *media,
 	return 0;
 }
 
-int v4l2_subdev_parse_setup_formats(struct media_device *media, const char *p)
+int v4l2_subdev_parse_setup_formats(struct media_device *media,
+				    enum v4l2_subdev_format_whence which,
+				    const char *p)
 {
 	char *end;
 	int ret;
 
 	do {
-		ret = v4l2_subdev_parse_setup_format(media, p, &end);
+		ret = v4l2_subdev_parse_setup_format(media, which, p, &end);
 		if (ret < 0)
 			return ret;
 
diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 1a9e393ac1f3..44256df953db 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -108,7 +108,8 @@ static void v4l2_subdev_print_format(struct media_entity *entity,
 	if (ret != 0)
 		return;
 
-	ret = v4l2_subdev_get_frame_interval(entity, &interval, pad, stream);
+	ret = v4l2_subdev_get_frame_interval(entity, &interval, pad, stream,
+					     V4L2_SUBDEV_FORMAT_ACTIVE);
 	if (ret != 0 && ret != -ENOTTY && ret != -EINVAL)
 		return;
 
@@ -527,7 +528,8 @@ static void media_print_topology_text_entity(struct media_device *media,
 	unsigned int padding;
 
 	if (media_entity_type(entity) == MEDIA_ENT_T_V4L2_SUBDEV)
-		v4l2_subdev_get_routing(entity, &routes, &num_routes);
+		v4l2_subdev_get_routing(entity, &routes, &num_routes,
+					V4L2_SUBDEV_FORMAT_ACTIVE);
 
 	padding = printf("- entity %u: ", info->id);
 	printf("%s (%u pad%s, %u link%s", info->name,
@@ -738,7 +740,9 @@ int main(int argc, char **argv)
 	}
 
 	if (media_opts.routes) {
-		ret = v4l2_subdev_parse_setup_routes(media, media_opts.routes);
+		ret = v4l2_subdev_parse_setup_routes(media,
+						     V4L2_SUBDEV_FORMAT_ACTIVE,
+						     media_opts.routes);
 		if (ret) {
 			printf("Unable to setup routes: %s (%d)\n",
 			       strerror(-ret), -ret);
@@ -748,6 +752,7 @@ int main(int argc, char **argv)
 
 	if (media_opts.formats) {
 		ret = v4l2_subdev_parse_setup_formats(media,
+						      V4L2_SUBDEV_FORMAT_ACTIVE,
 						      media_opts.formats);
 		if (ret) {
 			printf("Unable to setup formats: %s (%d)\n",
diff --git a/utils/media-ctl/v4l2subdev.h b/utils/media-ctl/v4l2subdev.h
index 1277040bfeae..0c1feae28e88 100644
--- a/utils/media-ctl/v4l2subdev.h
+++ b/utils/media-ctl/v4l2subdev.h
@@ -142,32 +142,44 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
  * @param entity - subdev-device media entity.
  * @param routes - routes of the subdev.
  * @param num_routes - number of routes.
+ * @param which - identifier of the routes to get.
  *
  * Get the routes of @a entity and return them in an allocated array in @a routes
  * and the number of routes in @a num_routes.
  *
  * The caller is responsible for freeing the routes array after use.
  *
+ * @a which is set to V4L2_SUBDEV_FORMAT_TRY to get the routing table stored in
+ * the file handle, of V4L2_SUBDEV_FORMAT_ACTIVE to get the device's active
+ * routing table.
+ *
  * @return 0 on success, or a negative error code on failure.
  */
 int v4l2_subdev_get_routing(struct media_entity *entity,
 			    struct v4l2_subdev_route **routes,
-			    unsigned int *num_routes);
+			    unsigned int *num_routes,
+			    enum v4l2_subdev_format_whence which);
 
 /**
  * @brief Set the routing table of a subdev media entity.
  * @param entity - subdev-device media entity.
  * @param routes - routes of the subdev.
  * @param num_routes - number of routes.
+ * @param which - identifier of the routes to set.
  *
  * Set the routes of @a entity. The routes are given in @a routes with the
  * length of @a num_routes.
  *
+ * @a which is set to V4L2_SUBDEV_FORMAT_TRY to set the routing table stored in
+ * the file handle, of V4L2_SUBDEV_FORMAT_ACTIVE to set the device's active
+ * routing table.
+ *
  * @return 0 on success, or a negative error code on failure.
  */
 int v4l2_subdev_set_routing(struct media_entity *entity,
 			    struct v4l2_subdev_route *route,
-			    unsigned int num_routes);
+			    unsigned int num_routes,
+			    enum v4l2_subdev_format_whence which);
 
 /**
  * @brief Query the digital video capabilities of a pad.
@@ -228,6 +240,7 @@ int v4l2_subdev_set_dv_timings(struct media_entity *entity,
  * @param interval - frame interval to be filled.
  * @param pad - pad number.
  * @param stream - stream number.
+ * @param which - identifier of the interval to get.
  *
  * Retrieve the current frame interval on subdev @a entity and store it in the
  * @a interval structure.
@@ -235,11 +248,16 @@ int v4l2_subdev_set_dv_timings(struct media_entity *entity,
  * Frame interval retrieving is usually supported only on devices at the
  * beginning of video pipelines, such as sensors.
  *
+ * @a which is set to V4L2_SUBDEV_FORMAT_TRY to get the frame interval stored
+ * in the file handle, of V4L2_SUBDEV_FORMAT_ACTIVE to get the device's active
+ * frame interval.
+ *
  * @return 0 on success, or a negative error code on failure.
  */
 
 int v4l2_subdev_get_frame_interval(struct media_entity *entity,
-	struct v4l2_fract *interval, unsigned int pad, unsigned int stream);
+	struct v4l2_fract *interval, unsigned int pad, unsigned int stream,
+	enum v4l2_subdev_format_whence which);
 
 /**
  * @brief Set the frame interval on a sub-device.
@@ -247,6 +265,7 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
  * @param interval - frame interval.
  * @param pad - pad number.
  * @param stream - stream number.
+ * @param which - identifier of the interval to set.
  *
  * Set the frame interval on subdev @a entity to @a interval. The driver is
  * allowed to modify the requested frame interval, in which case @a interval is
@@ -255,14 +274,20 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
  * Frame interval setting is usually supported only on devices at the beginning
  * of video pipelines, such as sensors.
  *
+ * @a which is set to V4L2_SUBDEV_FORMAT_TRY to set the frame interval stored
+ * in the file handle, of V4L2_SUBDEV_FORMAT_ACTIVE to set the device's active
+ * frame interval.
+ *
  * @return 0 on success, or a negative error code on failure.
  */
 int v4l2_subdev_set_frame_interval(struct media_entity *entity,
-	struct v4l2_fract *interval, unsigned int pad, unsigned int stream);
+	struct v4l2_fract *interval, unsigned int pad, unsigned int stream,
+	enum v4l2_subdev_format_whence which);
 
 /**
  * @brief Parse a string and apply format, crop and frame interval settings.
  * @param media - media device.
+ * @param which - identifier of the parameters to set.
  * @param p - input string
  * @param endp - pointer to string p where parsing ended (return)
  *
@@ -272,20 +297,32 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
  *
  * Format strings are separeted by commas (,).
  *
+ * @a which is set to V4L2_SUBDEV_FORMAT_TRY to set the parameters stored in the
+ * file handle, of V4L2_SUBDEV_FORMAT_ACTIVE to set the device's active
+ * parameters.
+ *
  * @return 0 on success, or a negative error code on failure.
  */
-int v4l2_subdev_parse_setup_formats(struct media_device *media, const char *p);
+int v4l2_subdev_parse_setup_formats(struct media_device *media,
+				    enum v4l2_subdev_format_whence which,
+				    const char *p);
 
 /**
  * @brief Parse a string and apply route settings.
  * @param media - media device.
+ * @param which - identifier of the routes to set.
  * @param p - input string
  *
  * Parse string @a p and apply route settings to a subdev.
  *
+ * @a which is set to V4L2_SUBDEV_FORMAT_TRY to set the routes stored in the
+ * file handle, of V4L2_SUBDEV_FORMAT_ACTIVE to set the device's active routes.
+ *
  * @return 0 on success, or a negative error code on failure.
  */
-int v4l2_subdev_parse_setup_routes(struct media_device *media, const char *p);
+int v4l2_subdev_parse_setup_routes(struct media_device *media,
+				   enum v4l2_subdev_format_whence which,
+				   const char *p);
 
 /**
  * @brief Convert media bus pixel code to string.
-- 
Regards,

Laurent Pinchart


