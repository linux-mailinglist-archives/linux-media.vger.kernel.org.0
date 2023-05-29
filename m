Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83D30714697
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 10:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbjE2Iuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 04:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbjE2Iuo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 04:50:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDA591
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 01:50:40 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9740A327;
        Mon, 29 May 2023 10:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685350219;
        bh=yK3NGNeWpNXHxJNcTRdQuYLzHLQAE3wW8JGKfOW/wbY=;
        h=From:To:Cc:Subject:Date:From;
        b=uo7p8sfyJ+Eq/ln6rLCB354K8f043nje3E6Qoxd6MLPrQoQrrIq0QLYGiILBOyT2p
         uetYYXQ5ZpczDTnaIL7/bWRggpunodd8a5aoY+6Ptik/9Jr3aq0jUCgBnv6hMV1vBj
         R1dJqh6QTXbW7PvOXKbB2ODv658pZPAQ+YNrNQv8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 0/7] v4l-utils: Support multiplexed streams
Date:   Mon, 29 May 2023 11:49:56 +0300
Message-Id: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

v4 can be found from:

https://lore.kernel.org/all/20230421124428.393261-1-tomi.valkeinen@ideasonboard.com/

v5 is rebased on top of latest master, and I have addressed most of
Laurent's comment. I did not start refactoring ARRAY_SIZE() nor
print_flags(), nor did I rewrite everything so that a real parser would
be used.

A diff to v4 is included below to help the reviews.

 Tomi

Tomi Valkeinen (7):
  v4l2-ctl: Add routing and streams support
  media-ctl: Add support for routes and streams
  v4l2-ctl/compliance: Add routing and streams multiplexed streams
  v4l2-ctl/compliance: Add simple routing test
  media-ctl: Check for Streams API support
  utils/common: Set V4L2_SUBDEV_CLIENT_CAP_STREAMS for subdevs
  v4l2-ctl: Check for Streams API support

 utils/common/cv4l-helpers.h                 |   1 +
 utils/common/v4l-helpers.h                  |  18 +
 utils/media-ctl/libmediactl.c               |  43 +++
 utils/media-ctl/libv4l2subdev.c             | 339 ++++++++++++++++--
 utils/media-ctl/media-ctl.c                 | 113 +++++-
 utils/media-ctl/mediactl-priv.h             |   1 +
 utils/media-ctl/mediactl.h                  |  16 +
 utils/media-ctl/options.c                   |  15 +-
 utils/media-ctl/options.h                   |   1 +
 utils/media-ctl/v4l2subdev.h                |  66 +++-
 utils/v4l2-compliance/v4l2-compliance.cpp   | 132 +++++--
 utils/v4l2-compliance/v4l2-compliance.h     |   9 +-
 utils/v4l2-compliance/v4l2-test-subdevs.cpp |  59 +++-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 365 ++++++++++++++++++--
 utils/v4l2-ctl/v4l2-ctl.cpp                 |   2 +
 utils/v4l2-ctl/v4l2-ctl.h                   |   2 +
 16 files changed, 1062 insertions(+), 120 deletions(-)

Interdiff against v4:
diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 502df6ac..91a04146 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -82,7 +82,7 @@ public:
 	bool has_rw() const { return v4l_has_rw(this); }
 	bool has_streaming() const { return v4l_has_streaming(this); }
 	bool has_ext_pix_format() const { return v4l_has_ext_pix_format(this); }
-	bool has_streams_support() const { return subdev_supports_streams; }
+	bool has_streams() const { return have_streams; }
 
 	int querycap(v4l2_capability &cap, bool force = false)
 	{
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index 2dd7f061..f8e96d58 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -9,6 +9,7 @@
 #ifndef _V4L_HELPERS_H_
 #define _V4L_HELPERS_H_
 
+#include <linux/v4l2-subdev.h>
 #include <linux/videodev2.h>
 #include <string.h>
 #include <stdlib.h>
@@ -39,7 +40,7 @@ struct v4l_fd {
 	bool have_selection;
 	bool is_subdev;
 	bool is_media;
-	bool subdev_supports_streams;
+	bool have_streams;
 
 	int (*open)(struct v4l_fd *f, const char *file, int oflag, ...);
 	int (*close)(struct v4l_fd *f);
@@ -543,7 +544,7 @@ static inline int v4l_subdev_s_fd(struct v4l_fd *f, int fd, const char *devname)
 	ret = ioctl(f->fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &clientcap);
 	client_streams = !ret && (clientcap.capabilities & V4L2_SUBDEV_CLIENT_CAP_STREAMS);
 
-	f->subdev_supports_streams = subdev_streams && client_streams;
+	f->have_streams = subdev_streams && client_streams;
 
 	return f->fd;
 }
diff --git a/utils/media-ctl/libmediactl.c b/utils/media-ctl/libmediactl.c
index c32fe56a..64ac8cf1 100644
--- a/utils/media-ctl/libmediactl.c
+++ b/utils/media-ctl/libmediactl.c
@@ -909,6 +909,8 @@ struct media_pad *media_parse_pad_stream(struct media_device *media,
 		*stream = 0;
 	}
 
+	for (; isspace(*p); ++p);
+
 	if (endp)
 		*endp = (char*)p;
 
diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index 186708ff..750796cc 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -231,33 +231,6 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
 	return 0;
 }
 
-int v4l2_subdev_set_routing(struct media_entity *entity,
-			    struct v4l2_subdev_route *routes,
-			    unsigned int num_routes)
-{
-	struct v4l2_subdev_routing routing = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.routes = (uintptr_t)routes,
-		.num_routes = num_routes,
-	};
-	int ret;
-
-	ret = v4l2_subdev_open(entity);
-	if (ret < 0)
-		return ret;
-
-	if (!entity->supports_streams) {
-		media_dbg(entity->media, "Streams API not supported\n");
-		return -ENOTSUP;
-	}
-
-	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_ROUTING, &routing);
-	if (ret == -1)
-		return -errno;
-
-	return 0;
-}
-
 int v4l2_subdev_get_routing(struct media_entity *entity,
 			    struct v4l2_subdev_route **routes,
 			    unsigned int *num_routes)
@@ -272,8 +245,10 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
-	if (!entity->supports_streams)
+	if (!entity->supports_streams) {
+		media_dbg(entity->media, "Streams API not supported\n");
 		return -ENOTSUP;
+	}
 
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
 	if (ret == -1 && errno != ENOSPC)
@@ -302,6 +277,33 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
 	return 0;
 }
 
+int v4l2_subdev_set_routing(struct media_entity *entity,
+			    struct v4l2_subdev_route *routes,
+			    unsigned int num_routes)
+{
+	struct v4l2_subdev_routing routing = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.routes = (uintptr_t)routes,
+		.num_routes = num_routes,
+	};
+	int ret;
+
+	ret = v4l2_subdev_open(entity);
+	if (ret < 0)
+		return ret;
+
+	if (!entity->supports_streams) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
+	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_ROUTING, &routing);
+	if (ret == -1)
+		return -errno;
+
+	return 0;
+}
+
 int v4l2_subdev_get_dv_timings_caps(struct media_entity *entity,
 	struct v4l2_dv_timings_cap *caps)
 {
@@ -496,6 +498,8 @@ static int v4l2_subdev_parse_setup_route(struct media_device *media,
 	}
 	end++;
 
+	for (; isspace(*end); ++end);
+
 	*endp = end;
 
 	return 0;
@@ -506,9 +510,9 @@ int v4l2_subdev_parse_setup_routes(struct media_device *media, const char *p)
 	struct media_entity *entity;
 	struct v4l2_subdev_route *routes;
 	unsigned int num_routes;
+	unsigned int i;
 	char *end;
 	int ret;
-	int i;
 
 	entity = media_parse_entity(media, p, &end);
 	if (!entity)
@@ -558,7 +562,7 @@ int v4l2_subdev_parse_setup_routes(struct media_device *media, const char *p)
 		struct v4l2_subdev_route *r = &routes[i];
 
 		media_dbg(entity->media,
-			  "Setting up route %s : %u/%u -> %u/%u, flags 0x%8.8x\n",
+			  "Setting up route %s : %u/%u -> %u/%u [0x%08x]\n",
 			  entity->info.name,
 			  r->sink_pad, r->sink_stream,
 			  r->source_pad, r->source_stream,
diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 831136a0..1531cffa 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -82,16 +82,16 @@ static void v4l2_subdev_print_routes(struct media_entity *entity,
 {
 	unsigned int i;
 
-	for (i = 0; i < num_routes; i++) {
-		const struct v4l2_subdev_route *r = &routes[i];
+	if (num_routes)
+		printf("\troutes:\n");
 
-		if (i == 0)
-			printf("\troutes:\n");
+	for (i = 0; i < num_routes; i++) {
+		const struct v4l2_subdev_route *route = &routes[i];
 
 		printf("\t\t%u/%u -> %u/%u [%s]\n",
-		       r->sink_pad, r->sink_stream,
-		       r->source_pad, r->source_stream,
-		       r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE ? "ACTIVE" : "INACTIVE");
+		       route->sink_pad, route->sink_stream,
+		       route->source_pad, route->source_stream,
+		       route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE ? "ACTIVE" : "INACTIVE");
 	}
 }
 
@@ -480,54 +480,49 @@ static void media_print_pad_text(struct media_entity *entity,
 				 struct v4l2_subdev_route *routes,
 				 unsigned int num_routes)
 {
+	uint64_t printed_streams_mask = 0;
 	unsigned int i;
-	uint64_t printed_streams_mask;
 
 	if (media_entity_type(entity) != MEDIA_ENT_T_V4L2_SUBDEV)
 		return;
 
 	if (!routes) {
-		v4l2_subdev_print_format(entity, pad->index, 0, V4L2_SUBDEV_FORMAT_ACTIVE);
-		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
-
-		if (pad->flags & MEDIA_PAD_FL_SOURCE)
-			v4l2_subdev_print_subdev_dv(entity);
+		v4l2_subdev_print_format(entity, pad->index, 0,
+					 V4L2_SUBDEV_FORMAT_ACTIVE);
+	} else {
+		for (i = 0; i < num_routes; ++i) {
+			const struct v4l2_subdev_route *route = &routes[i];
+			unsigned int stream;
 
-		return;
-	}
+			if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+				continue;
 
-	printed_streams_mask = 0;
+			if (pad->flags & MEDIA_PAD_FL_SINK) {
+				if (route->sink_pad != pad->index)
+					continue;
 
-	for (i = 0; i < num_routes; ++i) {
-		const struct v4l2_subdev_route *r = &routes[i];
-		unsigned int stream;
+				stream = route->sink_stream;
+			} else {
+				if (route->source_pad != pad->index)
+					continue;
 
-		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
-			continue;
+				stream = route->source_stream;
+			}
 
-		if (pad->flags & MEDIA_PAD_FL_SINK) {
-			if (r->sink_pad != pad->index)
+			if (printed_streams_mask & (1 << stream))
 				continue;
 
-			stream = r->sink_stream;
-		} else {
-			if (r->source_pad != pad->index)
-				continue;
+			v4l2_subdev_print_format(entity, pad->index, stream,
+						 V4L2_SUBDEV_FORMAT_ACTIVE);
 
-			stream = r->source_stream;
+			printed_streams_mask |= (1 << stream);
 		}
+	}
 
-		if (printed_streams_mask & (1 << stream))
-			continue;
-
-		v4l2_subdev_print_format(entity, pad->index, stream, V4L2_SUBDEV_FORMAT_ACTIVE);
-		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
-
-		if (pad->flags & MEDIA_PAD_FL_SOURCE)
-			v4l2_subdev_print_subdev_dv(entity);
+	v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
 
-		printed_streams_mask |= (1 << stream);
-	}
+	if (pad->flags & MEDIA_PAD_FL_SOURCE)
+		v4l2_subdev_print_subdev_dv(entity);
 }
 
 static void media_print_topology_text_entity(struct media_device *media,
@@ -541,19 +536,24 @@ static void media_print_topology_text_entity(struct media_device *media,
 	const struct media_entity_desc *info = media_entity_get_info(entity);
 	const char *devname = media_entity_get_devname(entity);
 	unsigned int num_links = media_entity_get_links_count(entity);
-	unsigned int j, k;
-	unsigned int padding;
 	struct v4l2_subdev_route *routes = NULL;
 	unsigned int num_routes = 0;
+	unsigned int j, k;
+	unsigned int padding;
 
 	if (media_entity_type(entity) == MEDIA_ENT_T_V4L2_SUBDEV)
 		v4l2_subdev_get_routing(entity, &routes, &num_routes);
 
 	padding = printf("- entity %u: ", info->id);
-	printf("%s (%u pad%s, %u link%s, %u route%s)\n", info->name,
+	printf("%s (%u pad%s, %u link%s", info->name,
 	       info->pads, info->pads > 1 ? "s" : "",
-	       num_links, num_links > 1 ? "s" : "",
-	       num_routes, num_routes > 1 ? "s" : "");
+	       num_links, num_links > 1 ? "s" : "");
+
+	if (media_entity_type(entity) == MEDIA_ENT_T_V4L2_SUBDEV)
+		printf(", %u route%s", num_routes, num_routes != 1 ? "s" : "");
+
+	printf(")\n");
+
 	printf("%*ctype %s subtype %s flags %x\n", padding, ' ',
 	       media_entity_type_to_string(info->type),
 	       media_entity_subtype_to_string(info->type),
diff --git a/utils/media-ctl/v4l2subdev.h b/utils/media-ctl/v4l2subdev.h
index a8a6e7ad..1277040b 100644
--- a/utils/media-ctl/v4l2subdev.h
+++ b/utils/media-ctl/v4l2subdev.h
@@ -52,6 +52,7 @@ void v4l2_subdev_close(struct media_entity *entity);
  * @param entity - subdev-device media entity.
  * @param format - format to be filled.
  * @param pad - pad number.
+ * @param stream - stream number.
  * @param which - identifier of the format to get.
  *
  * Retrieve the current format on the @a entity @a pad and store it in the
@@ -72,6 +73,7 @@ int v4l2_subdev_get_format(struct media_entity *entity,
  * @param entity - subdev-device media entity.
  * @param format - format.
  * @param pad - pad number.
+ * @param stream - stream number.
  * @param which - identifier of the format to set.
  *
  * Set the format on the @a entity @a pad to @a format. The driver is allowed to
@@ -94,6 +96,7 @@ int v4l2_subdev_set_format(struct media_entity *entity,
  * @param entity - subdev-device media entity.
  * @param r - rectangle to be filled.
  * @param pad - pad number.
+ * @param stream - stream number.
  * @param target - selection target
  * @param which - identifier of the format to get.
  *
@@ -116,6 +119,7 @@ int v4l2_subdev_get_selection(struct media_entity *entity,
  * @param entity - subdev-device media entity.
  * @param rect - crop rectangle.
  * @param pad - pad number.
+ * @param stream - stream number.
  * @param target - selection target
  * @param which - identifier of the format to set.
  *
@@ -222,6 +226,8 @@ int v4l2_subdev_set_dv_timings(struct media_entity *entity,
  * @brief Retrieve the frame interval on a sub-device.
  * @param entity - subdev-device media entity.
  * @param interval - frame interval to be filled.
+ * @param pad - pad number.
+ * @param stream - stream number.
  *
  * Retrieve the current frame interval on subdev @a entity and store it in the
  * @a interval structure.
@@ -239,6 +245,8 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
  * @brief Set the frame interval on a sub-device.
  * @param entity - subdev-device media entity.
  * @param interval - frame interval.
+ * @param pad - pad number.
+ * @param stream - stream number.
  *
  * Set the frame interval on subdev @a entity to @a interval. The driver is
  * allowed to modify the requested frame interval, in which case @a interval is
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index f96f5972..f082f569 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1255,8 +1255,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
 
 				printf("\ttest %s VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: %s\n",
-						       which ? "Active" : "Try",
-						       ok(testSubDevRouting(&node, which)));
+				       which ? "Active" : "Try",
+				       ok(testSubDevRouting(&node, which)));
 			}
 
 			printf("\n");
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index ec70b52b..8539c416 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -569,7 +569,7 @@ void subdev_set(cv4l_fd &_fd)
 	if (options[OptSetSubDevFormat] || options[OptTrySubDevFormat]) {
 		struct v4l2_subdev_format fmt;
 
-		if (!_fd.has_streams_support() && set_fmt_stream) {
+		if (!_fd.has_streams() && set_fmt_stream) {
 			printf("Streams API not supported.\n");
 			return;
 		}
@@ -622,7 +622,7 @@ void subdev_set(cv4l_fd &_fd)
 	if (options[OptSetSubDevSelection] || options[OptTrySubDevSelection]) {
 		struct v4l2_subdev_selection sel;
 
-		if (!_fd.has_streams_support() && vsel.stream) {
+		if (!_fd.has_streams() && vsel.stream) {
 			printf("Streams API not supported.\n");
 			return;
 		}
@@ -659,7 +659,7 @@ void subdev_set(cv4l_fd &_fd)
 	if (options[OptSetSubDevFPS]) {
 		struct v4l2_subdev_frame_interval fival;
 
-		if (!_fd.has_streams_support() && set_fps_stream) {
+		if (!_fd.has_streams() && set_fps_stream) {
 			printf("Streams API not supported.\n");
 			return;
 		}
@@ -689,7 +689,7 @@ void subdev_set(cv4l_fd &_fd)
 		}
 	}
 	if (options[OptSetRouting]) {
-		if (!_fd.has_streams_support()) {
+		if (!_fd.has_streams()) {
 			printf("Streams API not supported.\n");
 			return;
 		}
@@ -736,7 +736,7 @@ static void print_routes(const struct v4l2_subdev_routing *r)
 	};
 
 	for (i = 0; i < r->num_routes; i++) {
-		printf("%d/%d -> %d/%d [",
+		printf("%u/%u -> %u/%u [",
 		       routes[i].sink_pad, routes[i].sink_stream,
 		       routes[i].source_pad, routes[i].source_stream);
 		print_flags(route_flags, ARRAY_SIZE(route_flags), routes[i].flags);
@@ -751,7 +751,7 @@ void subdev_get(cv4l_fd &_fd)
 	if (options[OptGetSubDevFormat]) {
 		struct v4l2_subdev_format fmt;
 
-		if (!_fd.has_streams_support() && get_fmt_stream) {
+		if (!_fd.has_streams() && get_fmt_stream) {
 			printf("Streams API not supported.\n");
 			return;
 		}
@@ -761,7 +761,7 @@ void subdev_get(cv4l_fd &_fd)
 		fmt.pad = get_fmt_pad;
 		fmt.stream = get_fmt_stream;
 
-		printf("ioctl: VIDIOC_SUBDEV_G_FMT (pad=%u, stream=%u)\n", fmt.pad, fmt.stream);
+		printf("ioctl: VIDIOC_SUBDEV_G_FMT (pad=%u,stream=%u)\n", fmt.pad, fmt.stream);
 		if (doioctl(fd, VIDIOC_SUBDEV_G_FMT, &fmt) == 0)
 			print_framefmt(fmt.format);
 	}
@@ -770,7 +770,7 @@ void subdev_get(cv4l_fd &_fd)
 		struct v4l2_subdev_selection sel;
 		unsigned idx = 0;
 
-		if (!_fd.has_streams_support() && get_sel_stream) {
+		if (!_fd.has_streams() && get_sel_stream) {
 			printf("Streams API not supported.\n");
 			return;
 		}
@@ -797,7 +797,7 @@ void subdev_get(cv4l_fd &_fd)
 	if (options[OptGetSubDevFPS]) {
 		struct v4l2_subdev_frame_interval fival;
 
-		if (!_fd.has_streams_support() && get_fps_stream) {
+		if (!_fd.has_streams() && get_fps_stream) {
 			printf("Streams API not supported.\n");
 			return;
 		}
@@ -819,7 +819,7 @@ void subdev_get(cv4l_fd &_fd)
 	}
 
 	if (options[OptGetRouting]) {
-		if (!_fd.has_streams_support()) {
+		if (!_fd.has_streams()) {
 			printf("Streams API not supported.\n");
 			return;
 		}
@@ -907,7 +907,7 @@ void subdev_list(cv4l_fd &_fd)
 	int fd = _fd.g_fd();
 
 	if (options[OptListSubDevMBusCodes]) {
-		if (!_fd.has_streams_support() && list_mbus_codes_stream) {
+		if (!_fd.has_streams() && list_mbus_codes_stream) {
 			printf("Streams API not supported.\n");
 			return;
 		}
@@ -917,7 +917,7 @@ void subdev_list(cv4l_fd &_fd)
 		print_mbus_codes(fd, list_mbus_codes_pad, list_mbus_codes_stream);
 	}
 	if (options[OptListSubDevFrameSizes]) {
-		if (!_fd.has_streams_support() && frmsize.stream) {
+		if (!_fd.has_streams() && frmsize.stream) {
 			printf("Streams API not supported.\n");
 			return;
 		}
@@ -932,7 +932,7 @@ void subdev_list(cv4l_fd &_fd)
 		}
 	}
 	if (options[OptListSubDevFrameIntervals]) {
-		if (!_fd.has_streams_support() && frmival.stream) {
+		if (!_fd.has_streams() && frmival.stream) {
 			printf("Streams API not supported.\n");
 			return;
 		}
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 1cfb50f7..52974b40 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -64,8 +64,8 @@ static struct option long_options[] = {
 	{"get-fmt-video-out", no_argument, nullptr, OptGetVideoOutFormat},
 	{"set-fmt-video-out", required_argument, nullptr, OptSetVideoOutFormat},
 	{"try-fmt-video-out", required_argument, nullptr, OptTryVideoOutFormat},
-	{"set-routing", required_argument, 0, OptSetRouting},
 	{"get-routing", no_argument, 0, OptGetRouting},
+	{"set-routing", required_argument, 0, OptSetRouting},
 	{"help", no_argument, nullptr, OptHelp},
 	{"help-tuner", no_argument, nullptr, OptHelpTuner},
 	{"help-io", no_argument, nullptr, OptHelpIO},
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 9396c974..bf519c3f 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -191,8 +191,8 @@ enum Option {
 	OptInfoEdid,
 	OptShowEdid,
 	OptFixEdidChecksums,
-	OptSetRouting,
 	OptGetRouting,
+	OptSetRouting,
 	OptFreqSeek,
 	OptEncoderCmd,
 	OptTryEncoderCmd,
-- 
2.34.1

