Return-Path: <linux-media+bounces-12798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F761901938
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 03:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7054F1C214A2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 01:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4E44C9F;
	Mon, 10 Jun 2024 01:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T8FE8Ua5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8121860
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 01:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717982585; cv=none; b=sypnehLNDsSLeoWBA6bcvsAwsfc0BL/aAFasqvHfqIJ5sOVWZF2T9r36HKqRUkalAHc8IOYPMtDNRYJjeybPfRyNcbqBWtLpYevM9ZxIiqRsQ1J7SiAAu2YvGfuVImqE3XYMlnOMJnDAkTuoxzFaTekS5r6pHemF72X07QWYjd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717982585; c=relaxed/simple;
	bh=4bNdxjaTn5udbdsVbJRqSRfhGJen2fgLYLzZwMfsHqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWHBRW+f3k1N2ZZKUta7pcmyjvL7gEzmdL/mekxllAeeCWr4zB6ljeai04icoj/pns3JsXN+eSuwf/Om+7dLnqvmi3qi2mT74mGnBp0/zbEWLviDnllkfdOCaXMskWNpVwKBoYqiwnXiHizUk6Zho01Ktrc5l+htMj8KN0Y/UrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T8FE8Ua5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F8BF14B0;
	Mon, 10 Jun 2024 03:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717982569;
	bh=4bNdxjaTn5udbdsVbJRqSRfhGJen2fgLYLzZwMfsHqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T8FE8Ua5VadOepvYEcFOP2bPa4zyA1Xskj73+VLiEHee9KeRd/vWGFnR6/e319wcH
	 zEcDI9k0AXUqZnfKVlTl0fmd15rtHE0+Pdh/xbklscrsQLq8vuvtO75aYwnPtr0bfE
	 70x7vbwvEsoYeScYtn86zq9IzeNoJuMhvBpiHctE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [v4l-utils] [PATCH v1 2/3] utils: media-ctl: Prepare for TRY state support
Date: Mon, 10 Jun 2024 04:22:37 +0300
Message-ID: <20240610012238.30462-3-laurent.pinchart@ideasonboard.com>
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

Pass a 'which' argument to all functions to select which state to
access. Hardcode the value to V4L2_SUBDEV_FORMAT_ACTIVE in a single
location in main(), to preserve the existing behaviour. This prepares
media-ctl for support of the TRY state.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/media-ctl/media-ctl.c | 39 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 44256df953db..42b1bd9aaa6e 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -109,7 +109,7 @@ static void v4l2_subdev_print_format(struct media_entity *entity,
 		return;
 
 	ret = v4l2_subdev_get_frame_interval(entity, &interval, pad, stream,
-					     V4L2_SUBDEV_FORMAT_ACTIVE);
+					     which);
 	if (ret != 0 && ret != -ENOTTY && ret != -EINVAL)
 		return;
 
@@ -459,7 +459,8 @@ static void media_print_topology_dot(struct media_device *media)
 static void media_print_pad_text(struct media_entity *entity,
 				 const struct media_pad *pad,
 				 struct v4l2_subdev_route *routes,
-				 unsigned int num_routes)
+				 unsigned int num_routes,
+				 enum v4l2_subdev_format_whence which)
 {
 	uint64_t printed_streams_mask = 0;
 	unsigned int i;
@@ -468,8 +469,7 @@ static void media_print_pad_text(struct media_entity *entity,
 		return;
 
 	if (!routes) {
-		v4l2_subdev_print_format(entity, pad->index, 0,
-					 V4L2_SUBDEV_FORMAT_ACTIVE);
+		v4l2_subdev_print_format(entity, pad->index, 0, which);
 	} else {
 		for (i = 0; i < num_routes; ++i) {
 			const struct v4l2_subdev_route *route = &routes[i];
@@ -494,20 +494,21 @@ static void media_print_pad_text(struct media_entity *entity,
 				continue;
 
 			v4l2_subdev_print_format(entity, pad->index, stream,
-						 V4L2_SUBDEV_FORMAT_ACTIVE);
+						 which);
 
 			printed_streams_mask |= (1ULL << stream);
 		}
 	}
 
-	v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
+	v4l2_subdev_print_pad_dv(entity, pad->index, which);
 
 	if (pad->flags & MEDIA_PAD_FL_SOURCE)
 		v4l2_subdev_print_subdev_dv(entity);
 }
 
 static void media_print_topology_text_entity(struct media_device *media,
-					     struct media_entity *entity)
+					     struct media_entity *entity,
+					     enum v4l2_subdev_format_whence which)
 {
 	static const struct flag_name link_flags[] = {
 		{ MEDIA_LNK_FL_ENABLED, "ENABLED" },
@@ -528,8 +529,7 @@ static void media_print_topology_text_entity(struct media_device *media,
 	unsigned int padding;
 
 	if (media_entity_type(entity) == MEDIA_ENT_T_V4L2_SUBDEV)
-		v4l2_subdev_get_routing(entity, &routes, &num_routes,
-					V4L2_SUBDEV_FORMAT_ACTIVE);
+		v4l2_subdev_get_routing(entity, &routes, &num_routes, which);
 
 	padding = printf("- entity %u: ", info->id);
 	printf("%s (%u pad%s, %u link%s", info->name,
@@ -557,7 +557,7 @@ static void media_print_topology_text_entity(struct media_device *media,
 		printf("\tpad%u: ", j);
 		print_flags(pad_flags, ARRAY_SIZE(pad_flags), pad->flags);
 		printf("\n");
-		media_print_pad_text(entity, pad, routes, num_routes);
+		media_print_pad_text(entity, pad, routes, num_routes, which);
 
 		for (k = 0; k < num_links; k++) {
 			const struct media_link *link = media_entity_get_link(entity, k);
@@ -585,7 +585,8 @@ static void media_print_topology_text_entity(struct media_device *media,
 	free(routes);
 }
 
-static void media_print_topology_text(struct media_device *media)
+static void media_print_topology_text(struct media_device *media,
+				      enum v4l2_subdev_format_whence which)
 {
 	unsigned int nents = media_get_entities_count(media);
 	unsigned int i;
@@ -594,11 +595,12 @@ static void media_print_topology_text(struct media_device *media)
 
 	for (i = 0; i < nents; ++i)
 		media_print_topology_text_entity(
-			media, media_get_entity(media, i));
+			media, media_get_entity(media, i), which);
 }
 
 int main(int argc, char **argv)
 {
+	const enum v4l2_subdev_format_whence which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	struct media_device *media;
 	struct media_entity *entity = NULL;
 	int ret = -1;
@@ -665,8 +667,7 @@ int main(int argc, char **argv)
 			goto out;
 		}
 
-		v4l2_subdev_print_format(pad->entity, pad->index, stream,
-					 V4L2_SUBDEV_FORMAT_ACTIVE);
+		v4l2_subdev_print_format(pad->entity, pad->index, stream, which);
 	}
 
 	if (media_opts.get_dv_pad) {
@@ -708,9 +709,9 @@ int main(int argc, char **argv)
 		media_print_topology_dot(media);
 	} else if (media_opts.print) {
 		if (entity)
-			media_print_topology_text_entity(media, entity);
+			media_print_topology_text_entity(media, entity, which);
 		else
-			media_print_topology_text(media);
+			media_print_topology_text(media, which);
 	} else if (entity) {
 		const char *devname;
 
@@ -740,8 +741,7 @@ int main(int argc, char **argv)
 	}
 
 	if (media_opts.routes) {
-		ret = v4l2_subdev_parse_setup_routes(media,
-						     V4L2_SUBDEV_FORMAT_ACTIVE,
+		ret = v4l2_subdev_parse_setup_routes(media, which,
 						     media_opts.routes);
 		if (ret) {
 			printf("Unable to setup routes: %s (%d)\n",
@@ -751,8 +751,7 @@ int main(int argc, char **argv)
 	}
 
 	if (media_opts.formats) {
-		ret = v4l2_subdev_parse_setup_formats(media,
-						      V4L2_SUBDEV_FORMAT_ACTIVE,
+		ret = v4l2_subdev_parse_setup_formats(media, which,
 						      media_opts.formats);
 		if (ret) {
 			printf("Unable to setup formats: %s (%d)\n",
-- 
Regards,

Laurent Pinchart


