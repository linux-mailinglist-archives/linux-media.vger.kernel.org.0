Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC63D46367E
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236252AbhK3OVt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:21:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41530 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbhK3OVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:21:47 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CC54144E;
        Tue, 30 Nov 2021 15:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281905;
        bh=lsseBUOhLNVZvBtCCgNLAOVTLXHmUQG/iTtNc66yyvU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nIWeg9mSwe9dQAjIGBnPpCmAVnrRz742LvYVfAfFlXI29XKCmRtpDuE/6XVZ9MKIe
         j4h3YJLADTPj5L1jugbsJQnWFO/HQ7RJkVJFr6P39jX+xEwwbVTieReIEaHPRf1iQu
         ZQO8jNJgpi48CxJlSJ8cxwhjIONGI4rXUEPHy/j8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 3/4] media-ctl: add support for routes and streams
Date:   Tue, 30 Nov 2021 16:18:14 +0200
Message-Id: <20211130141815.892354-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to get and set subdev routes and to get and set
configurations per stream.

Based on work from Sakari Ailus <sakari.ailus@linux.intel.com>.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/media-ctl/libmediactl.c   |  41 +++++
 utils/media-ctl/libv4l2subdev.c | 256 ++++++++++++++++++++++++++++----
 utils/media-ctl/media-ctl.c     | 113 +++++++++++---
 utils/media-ctl/mediactl.h      |  16 ++
 utils/media-ctl/options.c       |  15 +-
 utils/media-ctl/options.h       |   1 +
 utils/media-ctl/v4l2subdev.h    |  58 +++++++-
 7 files changed, 444 insertions(+), 56 deletions(-)

diff --git a/utils/media-ctl/libmediactl.c b/utils/media-ctl/libmediactl.c
index 1fd6525b..537365d0 100644
--- a/utils/media-ctl/libmediactl.c
+++ b/utils/media-ctl/libmediactl.c
@@ -876,6 +876,47 @@ struct media_pad *media_parse_pad(struct media_device *media,
 	return &entity->pads[pad];
 }
 
+struct media_pad *media_parse_pad_stream(struct media_device *media,
+					 const char *p, unsigned int *stream,
+					 char **endp)
+{
+	struct media_pad *pad;
+	const char *orig_p = p;
+	char *ep;
+
+	pad = media_parse_pad(media, p, &ep);
+	if (pad == NULL)
+		return NULL;
+
+	p = ep;
+
+	if (*p == '/') {
+		unsigned int s;
+
+		p++;
+
+		s = strtoul(p, &ep, 10);
+
+		if (ep == p) {
+			printf("Unable to parse stream: '%s'\n", orig_p);
+			if (endp)
+				*endp = (char*)p;
+			return NULL;
+		}
+
+		*stream = s;
+
+		p++;
+	} else {
+		*stream = 0;
+	}
+
+	if (endp)
+		*endp = (char*)p;
+
+	return pad;
+}
+
 struct media_link *media_parse_link(struct media_device *media,
 				    const char *p, char **endp)
 {
diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index 0d0afbe7..eb9e1cc4 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -63,7 +63,7 @@ void v4l2_subdev_close(struct media_entity *entity)
 }
 
 int v4l2_subdev_get_format(struct media_entity *entity,
-	struct v4l2_mbus_framefmt *format, unsigned int pad,
+	struct v4l2_mbus_framefmt *format, unsigned int pad, unsigned int stream,
 	enum v4l2_subdev_format_whence which)
 {
 	struct v4l2_subdev_format fmt;
@@ -75,6 +75,7 @@ int v4l2_subdev_get_format(struct media_entity *entity,
 
 	memset(&fmt, 0, sizeof(fmt));
 	fmt.pad = pad;
+	fmt.stream = stream;
 	fmt.which = which;
 
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_FMT, &fmt);
@@ -87,6 +88,7 @@ int v4l2_subdev_get_format(struct media_entity *entity,
 
 int v4l2_subdev_set_format(struct media_entity *entity,
 	struct v4l2_mbus_framefmt *format, unsigned int pad,
+	unsigned int stream,
 	enum v4l2_subdev_format_whence which)
 {
 	struct v4l2_subdev_format fmt;
@@ -98,6 +100,7 @@ int v4l2_subdev_set_format(struct media_entity *entity,
 
 	memset(&fmt, 0, sizeof(fmt));
 	fmt.pad = pad;
+	fmt.stream = stream;
 	fmt.which = which;
 	fmt.format = *format;
 
@@ -110,8 +113,8 @@ int v4l2_subdev_set_format(struct media_entity *entity,
 }
 
 int v4l2_subdev_get_selection(struct media_entity *entity,
-	struct v4l2_rect *rect, unsigned int pad, unsigned int target,
-	enum v4l2_subdev_format_whence which)
+	struct v4l2_rect *rect, unsigned int pad, unsigned int stream,
+	unsigned int target, enum v4l2_subdev_format_whence which)
 {
 	union {
 		struct v4l2_subdev_selection sel;
@@ -149,8 +152,8 @@ int v4l2_subdev_get_selection(struct media_entity *entity,
 }
 
 int v4l2_subdev_set_selection(struct media_entity *entity,
-	struct v4l2_rect *rect, unsigned int pad, unsigned int target,
-	enum v4l2_subdev_format_whence which)
+	struct v4l2_rect *rect, unsigned int pad, unsigned int stream,
+	unsigned int target, enum v4l2_subdev_format_whence which)
 {
 	union {
 		struct v4l2_subdev_selection sel;
@@ -164,6 +167,7 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
 
 	memset(&u.sel, 0, sizeof(u.sel));
 	u.sel.pad = pad;
+	u.sel.stream = stream;
 	u.sel.target = target;
 	u.sel.which = which;
 	u.sel.r = *rect;
@@ -178,6 +182,7 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
 
 	memset(&u.crop, 0, sizeof(u.crop));
 	u.crop.pad = pad;
+	u.crop.stream = stream;
 	u.crop.which = which;
 	u.crop.rect = *rect;
 
@@ -189,6 +194,63 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
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
+	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_ROUTING, &routing);
+	if (ret == -1)
+		return -errno;
+
+	return 0;
+}
+
+int v4l2_subdev_get_routing(struct media_entity *entity,
+			    struct v4l2_subdev_route **routes,
+			    unsigned int *num_routes)
+{
+	struct v4l2_subdev_routing routing = { 0 };
+	struct v4l2_subdev_route *r;
+	int ret;
+
+	ret = v4l2_subdev_open(entity);
+	if (ret < 0)
+		return ret;
+
+	routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+
+	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
+	if (ret == -1 && errno != ENOSPC)
+		return -errno;
+
+	r = calloc(routing.num_routes, sizeof(*r));
+	if (!r)
+		return -ENOMEM;
+
+	routing.routes = (uintptr_t)r;
+	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
+	if (ret) {
+		free(r);
+		return ret;
+	}
+
+	*num_routes = routing.num_routes;
+	*routes = r;
+
+	return 0;
+}
+
 int v4l2_subdev_get_dv_timings_caps(struct media_entity *entity,
 	struct v4l2_dv_timings_cap *caps)
 {
@@ -263,7 +325,7 @@ int v4l2_subdev_set_dv_timings(struct media_entity *entity,
 
 int v4l2_subdev_get_frame_interval(struct media_entity *entity,
 				   struct v4l2_fract *interval,
-				   unsigned int pad)
+				   unsigned int pad, unsigned int stream)
 {
 	struct v4l2_subdev_frame_interval ival;
 	int ret;
@@ -274,6 +336,7 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
 
 	memset(&ival, 0, sizeof(ival));
 	ival.pad = pad;
+	ival.stream = stream;
 
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &ival);
 	if (ret < 0)
@@ -285,7 +348,7 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
 
 int v4l2_subdev_set_frame_interval(struct media_entity *entity,
 				   struct v4l2_fract *interval,
-				   unsigned int pad)
+				   unsigned int pad, unsigned int stream)
 {
 	struct v4l2_subdev_frame_interval ival;
 	int ret;
@@ -296,6 +359,7 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
 
 	memset(&ival, 0, sizeof(ival));
 	ival.pad = pad;
+	ival.stream = stream;
 	ival.interval = *interval;
 
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &ival);
@@ -306,6 +370,135 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
 	return 0;
 }
 
+int v4l2_subdev_parse_setup_routes(struct media_device *media, const char *p)
+{
+	struct media_entity *entity;
+	struct v4l2_subdev_route *routes;
+	unsigned int num_routes;
+	char *end;
+	int ret;
+	int i;
+
+	entity = media_parse_entity(media, p, &end);
+	if (!entity)
+		return -EINVAL;
+
+	p = end;
+
+	if (*p != '[') {
+		media_dbg(media, "Expected '['\n");
+		return -EINVAL;
+	}
+
+	p++;
+
+	routes = calloc(256, sizeof(routes[0]));
+	num_routes = 0;
+
+	while (*p != 0) {
+		struct v4l2_subdev_route *r = &routes[num_routes];
+
+		/* sink pad/stream */
+
+		r->sink_pad = strtoul(p, &end, 10);
+
+		if (*end != '/') {
+			media_dbg(media, "Expected '/'\n");
+			return -EINVAL;
+		}
+
+		p = end + 1;
+
+		r->sink_stream = strtoul(p, &end, 10);
+
+		for (; isspace(*end); ++end);
+
+		if (end[0] != '-' || end[1] != '>') {
+			media_dbg(media, "Expected '->'\n");
+			return -EINVAL;
+		}
+		p = end + 2;
+
+		/* source pad/stream */
+
+		r->source_pad = strtoul(p, &end, 10);
+
+		if (*end != '/') {
+			media_dbg(media, "Expected '/'\n");
+			return -EINVAL;
+		}
+
+		p = end + 1;
+
+		r->source_stream = strtoul(p, &end, 10);
+
+		/* flags */
+
+		for (; isspace(*end); ++end);
+
+		if (*end != '[') {
+			media_dbg(media, "Expected '['\n");
+			return -EINVAL;
+		}
+
+		for (end++; isspace(*end); ++end);
+
+		p = end;
+
+		r->flags = strtoul(p, &end, 0);
+
+		if (r->flags & ~(V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_SOURCE)) {
+			media_dbg(media, "Bad route flags %#x\n", r->flags);
+			return -EINVAL;
+		}
+
+		for (; isspace(*end); ++end);
+
+		if (*end != ']') {
+			media_dbg(media, "Expected ']'\n");
+			return -EINVAL;
+		}
+		end++;
+
+		p = end;
+
+		num_routes++;
+
+		if (*p == ',') {
+			p++;
+			continue;
+		}
+
+		break;
+	}
+
+	if (*p != ']') {
+		media_dbg(media, "Expected ']'\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_routes; ++i) {
+		struct v4l2_subdev_route *r = &routes[i];
+
+		media_dbg(entity->media,
+			  "Setting up route %s : %u/%u -> %u/%u, flags 0x%8.8x\n",
+			  entity->info.name,
+			  r->sink_pad, r->sink_stream,
+			  r->source_pad, r->source_stream,
+			  r->flags);
+	}
+
+	ret = v4l2_subdev_set_routing(entity, routes, num_routes);
+	if (ret) {
+		printf("VIDIOC_SUBDEV_S_ROUTING failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int v4l2_subdev_parse_format(struct media_device *media,
 				    struct v4l2_mbus_framefmt *format,
 				    const char *p, char **endp)
@@ -441,7 +634,8 @@ static bool strhazit(const char *str, const char **p)
 }
 
 static struct media_pad *v4l2_subdev_parse_pad_format(
-	struct media_device *media, struct v4l2_mbus_framefmt *format,
+	struct media_device *media, unsigned int *stream,
+	struct v4l2_mbus_framefmt *format,
 	struct v4l2_rect *crop, struct v4l2_rect *compose,
 	struct v4l2_fract *interval, const char *p, char **endp)
 {
@@ -452,7 +646,7 @@ static struct media_pad *v4l2_subdev_parse_pad_format(
 
 	for (; isspace(*p); ++p);
 
-	pad = media_parse_pad(media, p, &end);
+	pad = media_parse_pad_stream(media, p, stream, &end);
 	if (pad == NULL) {
 		*endp = end;
 		return NULL;
@@ -674,6 +868,7 @@ static struct media_pad *v4l2_subdev_parse_pad_format(
 }
 
 static int set_format(struct media_pad *pad,
+		      unsigned int stream,
 		      struct v4l2_mbus_framefmt *format)
 {
 	int ret;
@@ -682,12 +877,12 @@ static int set_format(struct media_pad *pad,
 		return 0;
 
 	media_dbg(pad->entity->media,
-		  "Setting up format %s %ux%u on pad %s/%u\n",
+		  "Setting up format %s %ux%u on pad %s/%u/%u\n",
 		  v4l2_subdev_pixelcode_to_string(format->code),
 		  format->width, format->height,
-		  pad->entity->info.name, pad->index);
+		  pad->entity->info.name, pad->index, stream);
 
-	ret = v4l2_subdev_set_format(pad->entity, format, pad->index,
+	ret = v4l2_subdev_set_format(pad->entity, format, pad->index, stream,
 				     V4L2_SUBDEV_FORMAT_ACTIVE);
 	if (ret < 0) {
 		media_dbg(pad->entity->media,
@@ -704,8 +899,8 @@ static int set_format(struct media_pad *pad,
 	return 0;
 }
 
-static int set_selection(struct media_pad *pad, unsigned int target,
-			 struct v4l2_rect *rect)
+static int set_selection(struct media_pad *pad, unsigned int stream,
+			 unsigned int target, struct v4l2_rect *rect)
 {
 	int ret;
 
@@ -713,11 +908,11 @@ static int set_selection(struct media_pad *pad, unsigned int target,
 		return 0;
 
 	media_dbg(pad->entity->media,
-		  "Setting up selection target %u rectangle (%u,%u)/%ux%u on pad %s/%u\n",
+		  "Setting up selection target %u rectangle (%u,%u)/%ux%u on pad %s/%u/%u\n",
 		  target, rect->left, rect->top, rect->width, rect->height,
-		  pad->entity->info.name, pad->index);
+		  pad->entity->info.name, pad->index, stream);
 
-	ret = v4l2_subdev_set_selection(pad->entity, rect, pad->index,
+	ret = v4l2_subdev_set_selection(pad->entity, rect, pad->index, stream,
 					target, V4L2_SUBDEV_FORMAT_ACTIVE);
 	if (ret < 0) {
 		media_dbg(pad->entity->media,
@@ -733,7 +928,7 @@ static int set_selection(struct media_pad *pad, unsigned int target,
 	return 0;
 }
 
-static int set_frame_interval(struct media_pad *pad,
+static int set_frame_interval(struct media_pad *pad, unsigned int stream,
 			      struct v4l2_fract *interval)
 {
 	int ret;
@@ -742,11 +937,12 @@ static int set_frame_interval(struct media_pad *pad,
 		return 0;
 
 	media_dbg(pad->entity->media,
-		  "Setting up frame interval %u/%u on pad %s/%u\n",
+		  "Setting up frame interval %u/%u on pad %s/%u/%u\n",
 		  interval->numerator, interval->denominator,
-		  pad->entity->info.name, pad->index);
+		  pad->entity->info.name, pad->index, stream);
 
-	ret = v4l2_subdev_set_frame_interval(pad->entity, interval, pad->index);
+	ret = v4l2_subdev_set_frame_interval(pad->entity, interval, pad->index,
+					     stream);
 	if (ret < 0) {
 		media_dbg(pad->entity->media,
 			  "Unable to set frame interval: %s (%d)",
@@ -769,11 +965,13 @@ static int v4l2_subdev_parse_setup_format(struct media_device *media,
 	struct v4l2_rect crop = { -1, -1, -1, -1 };
 	struct v4l2_rect compose = crop;
 	struct v4l2_fract interval = { 0, 0 };
+	unsigned int stream;
 	unsigned int i;
 	char *end;
 	int ret;
 
-	pad = v4l2_subdev_parse_pad_format(media, &format, &crop, &compose,
+	pad = v4l2_subdev_parse_pad_format(media, &stream,
+					   &format, &crop, &compose,
 					   &interval, p, &end);
 	if (pad == NULL) {
 		media_print_streampos(media, p, end);
@@ -782,26 +980,26 @@ static int v4l2_subdev_parse_setup_format(struct media_device *media,
 	}
 
 	if (pad->flags & MEDIA_PAD_FL_SINK) {
-		ret = set_format(pad, &format);
+		ret = set_format(pad, stream, &format);
 		if (ret < 0)
 			return ret;
 	}
 
-	ret = set_selection(pad, V4L2_SEL_TGT_CROP, &crop);
+	ret = set_selection(pad, stream, V4L2_SEL_TGT_CROP, &crop);
 	if (ret < 0)
 		return ret;
 
-	ret = set_selection(pad, V4L2_SEL_TGT_COMPOSE, &compose);
+	ret = set_selection(pad, stream, V4L2_SEL_TGT_COMPOSE, &compose);
 	if (ret < 0)
 		return ret;
 
 	if (pad->flags & MEDIA_PAD_FL_SOURCE) {
-		ret = set_format(pad, &format);
+		ret = set_format(pad, stream, &format);
 		if (ret < 0)
 			return ret;
 	}
 
-	ret = set_frame_interval(pad, &interval);
+	ret = set_frame_interval(pad, stream, &interval);
 	if (ret < 0)
 		return ret;
 
@@ -820,9 +1018,9 @@ static int v4l2_subdev_parse_setup_format(struct media_device *media,
 			if (link->source == pad &&
 			    link->sink->entity->info.type == MEDIA_ENT_T_V4L2_SUBDEV) {
 				remote_format = format;
-				set_format(link->sink, &remote_format);
+				set_format(link->sink, stream, &remote_format);
 
-				ret = set_frame_interval(link->sink, &interval);
+				ret = set_frame_interval(link->sink, stream, &interval);
 				if (ret < 0 && ret != -EINVAL && ret != -ENOTTY)
 					return ret;
 			}
diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 84ee7a83..cff08428 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -75,23 +75,45 @@ static void print_flags(const struct flag_name *flag_names, unsigned int num_ent
 	}
 }
 
+static void v4l2_subdev_print_routes(struct media_entity *entity,
+				     struct v4l2_subdev_route *routes,
+				     unsigned int num_routes)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_routes; i++) {
+		const struct v4l2_subdev_route *r = &routes[i];
+
+		if (i == 0)
+			printf("\troutes:\n");
+
+		printf("\t\t%u/%u -> %u/%u [%s%s%s]\n",
+		       r->sink_pad, r->sink_stream,
+		       r->source_pad, r->source_stream,
+		       r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE ? "ACTIVE" : "INACTIVE",
+		       r->flags & V4L2_SUBDEV_ROUTE_FL_IMMUTABLE ? ", IMMUTABLE" : "",
+		       r->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE ? ", SOURCE" : "");
+	}
+}
+
 static void v4l2_subdev_print_format(struct media_entity *entity,
-	unsigned int pad, enum v4l2_subdev_format_whence which)
+	unsigned int pad, unsigned int stream,
+	enum v4l2_subdev_format_whence which)
 {
 	struct v4l2_mbus_framefmt format;
 	struct v4l2_fract interval = { 0, 0 };
 	struct v4l2_rect rect;
 	int ret;
 
-	ret = v4l2_subdev_get_format(entity, &format, pad, which);
+	ret = v4l2_subdev_get_format(entity, &format, pad, stream, which);
 	if (ret != 0)
 		return;
 
-	ret = v4l2_subdev_get_frame_interval(entity, &interval, pad);
+	ret = v4l2_subdev_get_frame_interval(entity, &interval, pad, stream);
 	if (ret != 0 && ret != -ENOTTY && ret != -EINVAL)
 		return;
 
-	printf("\t\t[fmt:%s/%ux%u",
+	printf("\t\t[stream:%u fmt:%s/%ux%u", stream,
 	       v4l2_subdev_pixelcode_to_string(format.code),
 	       format.width, format.height);
 
@@ -118,28 +140,28 @@ static void v4l2_subdev_print_format(struct media_entity *entity,
 			       v4l2_subdev_quantization_to_string(format.quantization));
 	}
 
-	ret = v4l2_subdev_get_selection(entity, &rect, pad,
+	ret = v4l2_subdev_get_selection(entity, &rect, pad, stream,
 					V4L2_SEL_TGT_CROP_BOUNDS,
 					which);
 	if (ret == 0)
 		printf("\n\t\t crop.bounds:(%u,%u)/%ux%u", rect.left, rect.top,
 		       rect.width, rect.height);
 
-	ret = v4l2_subdev_get_selection(entity, &rect, pad,
+	ret = v4l2_subdev_get_selection(entity, &rect, pad, stream,
 					V4L2_SEL_TGT_CROP,
 					which);
 	if (ret == 0)
 		printf("\n\t\t crop:(%u,%u)/%ux%u", rect.left, rect.top,
 		       rect.width, rect.height);
 
-	ret = v4l2_subdev_get_selection(entity, &rect, pad,
+	ret = v4l2_subdev_get_selection(entity, &rect, pad, stream,
 					V4L2_SEL_TGT_COMPOSE_BOUNDS,
 					which);
 	if (ret == 0)
 		printf("\n\t\t compose.bounds:(%u,%u)/%ux%u",
 		       rect.left, rect.top, rect.width, rect.height);
 
-	ret = v4l2_subdev_get_selection(entity, &rect, pad,
+	ret = v4l2_subdev_get_selection(entity, &rect, pad, stream,
 					V4L2_SEL_TGT_COMPOSE,
 					which);
 	if (ret == 0)
@@ -455,16 +477,51 @@ static void media_print_topology_dot(struct media_device *media)
 }
 
 static void media_print_pad_text(struct media_entity *entity,
-				 const struct media_pad *pad)
+				 const struct media_pad *pad,
+				 struct v4l2_subdev_route *routes,
+				 unsigned int num_routes)
 {
+	unsigned int i;
+
 	if (media_entity_type(entity) != MEDIA_ENT_T_V4L2_SUBDEV)
 		return;
 
-	v4l2_subdev_print_format(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
-	v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
+	if (!routes) {
+		v4l2_subdev_print_format(entity, pad->index, 0, V4L2_SUBDEV_FORMAT_ACTIVE);
+		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
+
+		if (pad->flags & MEDIA_PAD_FL_SOURCE)
+			v4l2_subdev_print_subdev_dv(entity);
+
+		return;
+	}
+
+	for (i = 0; i < num_routes; ++i) {
+		const struct v4l2_subdev_route *r = &routes[i];
+		unsigned int stream;
+
+		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
 
-	if (pad->flags & MEDIA_PAD_FL_SOURCE)
-		v4l2_subdev_print_subdev_dv(entity);
+		if (pad->flags & MEDIA_PAD_FL_SINK) {
+			if (r->sink_pad != pad->index)
+				continue;
+
+			stream = r->sink_stream;
+		} else {
+			if (r->source_pad != pad->index)
+				continue;
+
+			stream = r->source_stream;
+		}
+
+		v4l2_subdev_print_format(entity, pad->index, stream, V4L2_SUBDEV_FORMAT_ACTIVE);
+		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
+
+		if (pad->flags & MEDIA_PAD_FL_SOURCE)
+			v4l2_subdev_print_subdev_dv(entity);
+
+	}
 }
 
 static void media_print_topology_text_entity(struct media_device *media,
@@ -480,11 +537,17 @@ static void media_print_topology_text_entity(struct media_device *media,
 	unsigned int num_links = media_entity_get_links_count(entity);
 	unsigned int j, k;
 	unsigned int padding;
+	struct v4l2_subdev_route *routes = NULL;
+	unsigned int num_routes = 0;
+
+	if (media_entity_type(entity) == MEDIA_ENT_T_V4L2_SUBDEV)
+		v4l2_subdev_get_routing(entity, &routes, &num_routes);
 
 	padding = printf("- entity %u: ", info->id);
-	printf("%s (%u pad%s, %u link%s)\n", info->name,
+	printf("%s (%u pad%s, %u link%s, %u route%s)\n", info->name,
 	       info->pads, info->pads > 1 ? "s" : "",
-	       num_links, num_links > 1 ? "s" : "");
+	       num_links, num_links > 1 ? "s" : "",
+	       num_routes, num_routes > 1 ? "s" : "");
 	printf("%*ctype %s subtype %s flags %x\n", padding, ' ',
 	       media_entity_type_to_string(info->type),
 	       media_entity_subtype_to_string(info->type),
@@ -492,12 +555,15 @@ static void media_print_topology_text_entity(struct media_device *media,
 	if (devname)
 		printf("%*cdevice node name %s\n", padding, ' ', devname);
 
+	if (media_entity_type(entity) == MEDIA_ENT_T_V4L2_SUBDEV)
+		v4l2_subdev_print_routes(entity, routes, num_routes);
+
 	for (j = 0; j < info->pads; j++) {
 		const struct media_pad *pad = media_entity_get_pad(entity, j);
 
 		printf("\tpad%u: %s\n", j, media_pad_type_to_string(pad->flags));
 
-		media_print_pad_text(entity, pad);
+		media_print_pad_text(entity, pad, routes, num_routes);
 
 		for (k = 0; k < num_links; k++) {
 			const struct media_link *link = media_entity_get_link(entity, k);
@@ -594,14 +660,16 @@ int main(int argc, char **argv)
 
 	if (media_opts.fmt_pad) {
 		struct media_pad *pad;
+		unsigned int stream;
+		char *p;
 
-		pad = media_parse_pad(media, media_opts.fmt_pad, NULL);
+		pad = media_parse_pad_stream(media, media_opts.fmt_pad, &stream, &p);
 		if (pad == NULL) {
 			printf("Pad '%s' not found\n", media_opts.fmt_pad);
 			goto out;
 		}
 
-		v4l2_subdev_print_format(pad->entity, pad->index,
+		v4l2_subdev_print_format(pad->entity, pad->index, stream,
 					 V4L2_SUBDEV_FORMAT_ACTIVE);
 	}
 
@@ -685,6 +753,15 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (media_opts.routes) {
+		ret = v4l2_subdev_parse_setup_routes(media, media_opts.routes);
+		if (ret) {
+			printf("Unable to setup routes: %s (%d)\n",
+			       strerror(-ret), -ret);
+			goto out;
+		}
+	}
+
 	if (media_opts.interactive) {
 		while (1) {
 			char buffer[32];
diff --git a/utils/media-ctl/mediactl.h b/utils/media-ctl/mediactl.h
index af360518..c0fc2962 100644
--- a/utils/media-ctl/mediactl.h
+++ b/utils/media-ctl/mediactl.h
@@ -394,6 +394,22 @@ struct media_entity *media_parse_entity(struct media_device *media,
 struct media_pad *media_parse_pad(struct media_device *media,
 				  const char *p, char **endp);
 
+/**
+ * @brief Parse string to a pad and stream on the media device.
+ * @param media - media device.
+ * @param p - input string
+ * @param stream - pointer to uint where the stream number is stored
+ * @param endp - pointer to string where parsing ended
+ *
+ * Parse NULL terminated string describing a pad and stream and return its struct
+ * media_pad instance and the stream number.
+ *
+ * @return Pointer to struct media_pad on success, NULL on failure.
+ */
+struct media_pad *media_parse_pad_stream(struct media_device *media,
+					 const char *p, unsigned int *stream,
+					 char **endp);
+
 /**
  * @brief Parse string to a link on the media device.
  * @param media - media device.
diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
index 6d30d3dc..58ddec3c 100644
--- a/utils/media-ctl/options.c
+++ b/utils/media-ctl/options.c
@@ -63,6 +63,7 @@ static void usage(const char *argv0)
 	printf("    --get-v4l2 pad	Print the active format on a given pad\n");
 	printf("    --get-dv pad        Print detected and current DV timings on a given pad\n");
 	printf("    --set-dv pad	Configure DV timings on a given pad\n");
+	printf("-R, --set-routes routes Configure routes on a given subdev entity\n");
 	printf("-h, --help		Show verbose help and exit\n");
 	printf("-i, --interactive	Modify links interactively\n");
 	printf("-l, --links links	Comma-separated list of link descriptors to setup\n");
@@ -78,7 +79,7 @@ static void usage(const char *argv0)
 	printf("Links and formats are defined as\n");
 	printf("\tlinks           = link { ',' link } ;\n");
 	printf("\tlink            = pad '->' pad '[' flags ']' ;\n");
-	printf("\tpad             = entity ':' pad-number ;\n");
+	printf("\tpad             = entity ':' pad-number { '/' stream-number } ;\n");
 	printf("\tentity          = entity-number | ( '\"' entity-name '\"' ) ;\n");
 	printf("\n");
 	printf("\tv4l2            = pad '[' v4l2-properties ']' ;\n");
@@ -95,11 +96,16 @@ static void usage(const char *argv0)
 	printf("\trectangle       = '(' left ',' top, ')' '/' size ;\n");
 	printf("\tsize            = width 'x' height ;\n");
 	printf("\n");
+	printf("\troutes          = entity '[' route { ',' route } ']' ;\n");
+	printf("\troute           = pad-number '/' stream-number '->' pad-number '/' stream-number '[' route-flags ']' ;\n");
+	printf("\n");
 	printf("where the fields are\n");
 	printf("\tentity-number   Entity numeric identifier\n");
 	printf("\tentity-name     Entity name (string) \n");
 	printf("\tpad-number      Pad numeric identifier\n");
+	printf("\tstream-number   Stream numeric identifier\n");
 	printf("\tflags           Link flags (0: inactive, 1: active)\n");
+	printf("\troute-flags     Route flags (bitmask of route flags: active - 0x1, immutable - 0x2, source - 0x4)\n");
 	printf("\tfcc             Format FourCC\n");
 	printf("\twidth           Image width in pixels\n");
 	printf("\theight          Image height in pixels\n");
@@ -152,6 +158,7 @@ static struct option opts[] = {
 	{"get-v4l2", 1, 0, OPT_GET_FORMAT},
 	{"get-dv", 1, 0, OPT_GET_DV},
 	{"set-dv", 1, 0, OPT_SET_DV},
+	{"set-routes", 1, 0, 'R'},
 	{"help", 0, 0, 'h'},
 	{"interactive", 0, 0, 'i'},
 	{"links", 1, 0, 'l'},
@@ -237,7 +244,7 @@ int parse_cmdline(int argc, char **argv)
 	}
 
 	/* parse options */
-	while ((opt = getopt_long(argc, argv, "d:e:f:hil:prvV:",
+	while ((opt = getopt_long(argc, argv, "d:e:f:hil:prvV:R:",
 				  opts, NULL)) != -1) {
 		switch (opt) {
 		case 'd':
@@ -283,6 +290,10 @@ int parse_cmdline(int argc, char **argv)
 			media_opts.verbose = 1;
 			break;
 
+		case 'R':
+			media_opts.routes = optarg;
+			break;
+
 		case OPT_PRINT_DOT:
 			media_opts.print_dot = 1;
 			break;
diff --git a/utils/media-ctl/options.h b/utils/media-ctl/options.h
index b1751f56..8796f1b6 100644
--- a/utils/media-ctl/options.h
+++ b/utils/media-ctl/options.h
@@ -38,6 +38,7 @@ struct media_options
 	const char *fmt_pad;
 	const char *get_dv_pad;
 	const char *dv_pad;
+	const char *routes;
 };
 
 extern struct media_options media_opts;
diff --git a/utils/media-ctl/v4l2subdev.h b/utils/media-ctl/v4l2subdev.h
index a1813911..a8a6e7ad 100644
--- a/utils/media-ctl/v4l2subdev.h
+++ b/utils/media-ctl/v4l2subdev.h
@@ -64,7 +64,7 @@ void v4l2_subdev_close(struct media_entity *entity);
  * @return 0 on success, or a negative error code on failure.
  */
 int v4l2_subdev_get_format(struct media_entity *entity,
-	struct v4l2_mbus_framefmt *format, unsigned int pad,
+	struct v4l2_mbus_framefmt *format, unsigned int pad, unsigned int stream,
 	enum v4l2_subdev_format_whence which);
 
 /**
@@ -86,6 +86,7 @@ int v4l2_subdev_get_format(struct media_entity *entity,
  */
 int v4l2_subdev_set_format(struct media_entity *entity,
 	struct v4l2_mbus_framefmt *format, unsigned int pad,
+	unsigned int stream,
 	enum v4l2_subdev_format_whence which);
 
 /**
@@ -107,8 +108,8 @@ int v4l2_subdev_set_format(struct media_entity *entity,
  * @return 0 on success, or a negative error code on failure.
  */
 int v4l2_subdev_get_selection(struct media_entity *entity,
-	struct v4l2_rect *rect, unsigned int pad, unsigned int target,
-	enum v4l2_subdev_format_whence which);
+	struct v4l2_rect *rect, unsigned int pad, unsigned int stream,
+	unsigned int target, enum v4l2_subdev_format_whence which);
 
 /**
  * @brief Set a selection rectangle on a pad.
@@ -129,8 +130,40 @@ int v4l2_subdev_get_selection(struct media_entity *entity,
  * @return 0 on success, or a negative error code on failure.
  */
 int v4l2_subdev_set_selection(struct media_entity *entity,
-	struct v4l2_rect *rect, unsigned int pad, unsigned int target,
-	enum v4l2_subdev_format_whence which);
+	struct v4l2_rect *rect, unsigned int pad, unsigned int stream,
+	unsigned int target, enum v4l2_subdev_format_whence which);
+
+/**
+ * @brief Get the routing table of a subdev media entity.
+ * @param entity - subdev-device media entity.
+ * @param routes - routes of the subdev.
+ * @param num_routes - number of routes.
+ *
+ * Get the routes of @a entity and return them in an allocated array in @a routes
+ * and the number of routes in @a num_routes.
+ *
+ * The caller is responsible for freeing the routes array after use.
+ *
+ * @return 0 on success, or a negative error code on failure.
+ */
+int v4l2_subdev_get_routing(struct media_entity *entity,
+			    struct v4l2_subdev_route **routes,
+			    unsigned int *num_routes);
+
+/**
+ * @brief Set the routing table of a subdev media entity.
+ * @param entity - subdev-device media entity.
+ * @param routes - routes of the subdev.
+ * @param num_routes - number of routes.
+ *
+ * Set the routes of @a entity. The routes are given in @a routes with the
+ * length of @a num_routes.
+ *
+ * @return 0 on success, or a negative error code on failure.
+ */
+int v4l2_subdev_set_routing(struct media_entity *entity,
+			    struct v4l2_subdev_route *route,
+			    unsigned int num_routes);
 
 /**
  * @brief Query the digital video capabilities of a pad.
@@ -200,7 +233,7 @@ int v4l2_subdev_set_dv_timings(struct media_entity *entity,
  */
 
 int v4l2_subdev_get_frame_interval(struct media_entity *entity,
-	struct v4l2_fract *interval, unsigned int pad);
+	struct v4l2_fract *interval, unsigned int pad, unsigned int stream);
 
 /**
  * @brief Set the frame interval on a sub-device.
@@ -217,7 +250,7 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
  * @return 0 on success, or a negative error code on failure.
  */
 int v4l2_subdev_set_frame_interval(struct media_entity *entity,
-	struct v4l2_fract *interval, unsigned int pad);
+	struct v4l2_fract *interval, unsigned int pad, unsigned int stream);
 
 /**
  * @brief Parse a string and apply format, crop and frame interval settings.
@@ -235,6 +268,17 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
  */
 int v4l2_subdev_parse_setup_formats(struct media_device *media, const char *p);
 
+/**
+ * @brief Parse a string and apply route settings.
+ * @param media - media device.
+ * @param p - input string
+ *
+ * Parse string @a p and apply route settings to a subdev.
+ *
+ * @return 0 on success, or a negative error code on failure.
+ */
+int v4l2_subdev_parse_setup_routes(struct media_device *media, const char *p);
+
 /**
  * @brief Convert media bus pixel code to string.
  * @param code - input string
-- 
2.25.1

