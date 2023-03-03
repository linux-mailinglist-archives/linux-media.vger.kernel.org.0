Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 721ED6A9B3A
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 16:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbjCCPxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 10:53:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjCCPxJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 10:53:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D9A86B6
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 07:53:07 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F701735;
        Fri,  3 Mar 2023 16:53:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677858785;
        bh=tnltT6vjXGjrZRRCDnNKn+1X2zU3c88sI3DzYd1aFVM=;
        h=From:To:Cc:Subject:Date:From;
        b=W+cLeDs6bkZgBTbaEJrrHy0GxrvQc3eAD0jS8LDovumU8cYGm5rOI0jdz+a5fxQu2
         vlVRrcFeyCuknLk1tQK9pB2fIxrlt+5FAgL0FBS2xJDugR9RhF/jn9ygTrzh9/CxLL
         rjUTmTcd2xr4FGsNfIUbWrr6iTRUjq0xnuNvHAl4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] media: subdev: Fix validation state lockdep issue
Date:   Fri,  3 Mar 2023 17:52:49 +0200
Message-Id: <20230303155249.140929-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The new subdev state code has a possible deadlock scenario during link
validation when the pipeline contains subdevs that support state and
that do not support state.

The current code locks the states of the subdevs on both ends of the
link when starting the link validation, locking the sink side first,
then the source. If either (or both) of the subdevs does not support
state, nothing is done for that subdev at this point, and instead the
locking is handled the old way, i.e. the subdev's ops do the locking
internally.

The issue arises when the sink doesn't support state, but source does,
so the validation code locks the source for the duration of the
validation, and then the sink is locked only when the get_fmt op is
called. So lockdep sees the source locked first, then the sink.

Later, when the streaming is started, the sink's s_stream op is called,
which probably takes the subdev's lock. The op then calls the source's
s_stream, which takes the source's lock. So, the sink is locked first,
then the source.

Note that link validation and stream starting is not done at the same
time, so an actual deadlock should never happen. However, it's still a
clear bug.

Fix this by locking the subdev states only if both subdevs support
state. In other words, we have two scenarios:

1. Both subdevs support state. Lock sink first, then source, and keep
   the locks while validating the link.
2. At least one of the subdevs do not support state. Take the lock only
   for the duration of the operation (get_fmt or looking at the
   routing), and release after the op is done.

Obviously 1. is better, as we have a more consistent view of the states
of the subdevs during validation. 2. is how it has been so far, so it's
no worse than this used to be.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 82 +++++++++++++++++----------
 1 file changed, 52 insertions(+), 30 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index dff1d9be7841..ceee50694c24 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1057,32 +1057,45 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
 
 static int
 v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
-				     struct v4l2_subdev_format *fmt)
+				     struct v4l2_subdev_format *fmt,
+				     bool states_locked)
 {
-	if (is_media_entity_v4l2_subdev(pad->entity)) {
-		struct v4l2_subdev *sd =
-			media_entity_to_v4l2_subdev(pad->entity);
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev *sd;
+	int ret;
 
-		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
-		fmt->pad = pad->index;
-		fmt->stream = stream;
+	if (!is_media_entity_v4l2_subdev(pad->entity)) {
+		WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
+		     "Driver bug! Wrong media entity type 0x%08x, entity %s\n",
+		     pad->entity->function, pad->entity->name);
 
-		return v4l2_subdev_call(sd, pad, get_fmt,
-					v4l2_subdev_get_locked_active_state(sd),
-					fmt);
+		return -EINVAL;
 	}
 
-	WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
-	     "Driver bug! Wrong media entity type 0x%08x, entity %s\n",
-	     pad->entity->function, pad->entity->name);
+	sd = media_entity_to_v4l2_subdev(pad->entity);
 
-	return -EINVAL;
+	fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt->pad = pad->index;
+	fmt->stream = stream;
+
+	if (states_locked)
+		state = v4l2_subdev_get_locked_active_state(sd);
+	else
+		state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	ret = v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
+
+	if (!states_locked && state)
+		v4l2_subdev_unlock_state(state);
+
+	return ret;
 }
 
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 
 static void __v4l2_link_validate_get_streams(struct media_pad *pad,
-					     u64 *streams_mask)
+					     u64 *streams_mask,
+					     bool states_locked)
 {
 	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
@@ -1092,7 +1105,11 @@ static void __v4l2_link_validate_get_streams(struct media_pad *pad,
 
 	*streams_mask = 0;
 
-	state = v4l2_subdev_get_locked_active_state(subdev);
+	if (states_locked)
+		state = v4l2_subdev_get_locked_active_state(subdev);
+	else
+		state = v4l2_subdev_lock_and_get_active_state(subdev);
+
 	if (WARN_ON(!state))
 		return;
 
@@ -1113,12 +1130,16 @@ static void __v4l2_link_validate_get_streams(struct media_pad *pad,
 
 		*streams_mask |= BIT_ULL(route_stream);
 	}
+
+	if (!states_locked)
+		v4l2_subdev_unlock_state(state);
 }
 
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 static void v4l2_link_validate_get_streams(struct media_pad *pad,
-					   u64 *streams_mask)
+					   u64 *streams_mask,
+					   bool states_locked)
 {
 	struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(pad->entity);
 
@@ -1129,14 +1150,14 @@ static void v4l2_link_validate_get_streams(struct media_pad *pad,
 	}
 
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-	__v4l2_link_validate_get_streams(pad, streams_mask);
+	__v4l2_link_validate_get_streams(pad, streams_mask, states_locked);
 #else
 	/* This shouldn't happen */
 	*streams_mask = 0;
 #endif
 }
 
-static int v4l2_subdev_link_validate_locked(struct media_link *link)
+static int v4l2_subdev_link_validate_locked(struct media_link *link, bool states_locked)
 {
 	struct v4l2_subdev *sink_subdev =
 		media_entity_to_v4l2_subdev(link->sink->entity);
@@ -1151,8 +1172,8 @@ static int v4l2_subdev_link_validate_locked(struct media_link *link)
 		link->source->entity->name, link->source->index,
 		link->sink->entity->name, link->sink->index);
 
-	v4l2_link_validate_get_streams(link->source, &source_streams_mask);
-	v4l2_link_validate_get_streams(link->sink, &sink_streams_mask);
+	v4l2_link_validate_get_streams(link->source, &source_streams_mask, states_locked);
+	v4l2_link_validate_get_streams(link->sink, &sink_streams_mask, states_locked);
 
 	/*
 	 * It is ok to have more source streams than sink streams as extra
@@ -1180,7 +1201,7 @@ static int v4l2_subdev_link_validate_locked(struct media_link *link)
 			link->sink->entity->name, link->sink->index, stream);
 
 		ret = v4l2_subdev_link_validate_get_format(link->source, stream,
-							   &source_fmt);
+							   &source_fmt, states_locked);
 		if (ret < 0) {
 			dev_dbg(dev,
 				"Failed to get format for \"%s\":%u:%u (but that's ok)\n",
@@ -1190,7 +1211,7 @@ static int v4l2_subdev_link_validate_locked(struct media_link *link)
 		}
 
 		ret = v4l2_subdev_link_validate_get_format(link->sink, stream,
-							   &sink_fmt);
+							   &sink_fmt, states_locked);
 		if (ret < 0) {
 			dev_dbg(dev,
 				"Failed to get format for \"%s\":%u:%u (but that's ok)\n",
@@ -1222,6 +1243,7 @@ int v4l2_subdev_link_validate(struct media_link *link)
 {
 	struct v4l2_subdev *source_sd, *sink_sd;
 	struct v4l2_subdev_state *source_state, *sink_state;
+	bool states_locked;
 	int ret;
 
 	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
@@ -1230,19 +1252,19 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	sink_state = v4l2_subdev_get_unlocked_active_state(sink_sd);
 	source_state = v4l2_subdev_get_unlocked_active_state(source_sd);
 
-	if (sink_state)
-		v4l2_subdev_lock_state(sink_state);
+	states_locked = sink_state && source_state;
 
-	if (source_state)
+	if (states_locked) {
+		v4l2_subdev_lock_state(sink_state);
 		v4l2_subdev_lock_state(source_state);
+	}
 
-	ret = v4l2_subdev_link_validate_locked(link);
+	ret = v4l2_subdev_link_validate_locked(link, states_locked);
 
-	if (sink_state)
+	if (states_locked) {
 		v4l2_subdev_unlock_state(sink_state);
-
-	if (source_state)
 		v4l2_subdev_unlock_state(source_state);
+	}
 
 	return ret;
 }
-- 
2.34.1

