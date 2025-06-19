Return-Path: <linux-media+bounces-35243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA4DADFF92
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A13DD17F6E3
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E063265CC6;
	Thu, 19 Jun 2025 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5UAvbNF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A0C26561D
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320961; cv=none; b=mTZrfvKZ4Osx7dg+pXiCXwgp6A1oC+vPplmJf8hqY40kVzYhu5ZyCRpuRoTf++vS5uQVWHB3GxrNV6+2mBR0mdX0z+MFV2vtA3ozqme5Jw1+QV40xPQcVzECBD1nLDDageGpgetJPY3TKDECCg8GFYO3lvA71FXth4JT9wNqYKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320961; c=relaxed/simple;
	bh=nOC9B6Z2K9Dg+nnVVGPQBQB6Nx+PFGwm7b7OHqABujA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T7sDtm6oIsHY7NMwpGutyfrTU7pZbo17ZCoOhLUH5NroveCvK+tzW4IeuQdPoo4185QJf+MfkzkGNkmLSTCnaLgL7wb3HPZB+QilUlu5ObprU4nd66RW1nttlPJmjoq4dHRrzFBCrXZqAcAZYx7VaXJ2Hoi0pe1eSgsvL5yg/Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5UAvbNF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320960; x=1781856960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nOC9B6Z2K9Dg+nnVVGPQBQB6Nx+PFGwm7b7OHqABujA=;
  b=B5UAvbNFmbVd3cePpvafUaQcAyZRu90C5m4KAFThChVu2b7djTDeldTK
   Q/TjD8ETgZ1bI6EShBU0GZXSv5Bpy6ic0a2v7NhaHPJlINxP9NP1fLfKv
   tv9V6sXo/3LUwMumgbCT666M3GCtxjU9L0hHy6ozZvblQPgeFHftDbvMA
   YKAyujuNVloFffRhz9QZ2+ni76WFulFy1Gqo5s/mlzoqd/5WIe7jn0ulH
   3EsJTM00sogEfs/HWuMG5A/mf5fWMLkzfkoqpsF6aUxMIWR7bm/0qjEOE
   IoxGctOSx6whuQLzVc9WQSdZTu8E63Z1qzeN8806/ggsVySrCgzZDbof7
   g==;
X-CSE-ConnectionGUID: l6dgc3QiRoyQGl+BbJaJZQ==
X-CSE-MsgGUID: 6y/Sb8edT1iBX5TLejgdew==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716704"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716704"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:54 -0700
X-CSE-ConnectionGUID: FrLsTjCBTZSZrX2d9IFRJw==
X-CSE-MsgGUID: pL4YZ1uVSxWSUwX80Mo03g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640672"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A27B4120935;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006dpJ-23;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 12/13] media: v4l2-mc: Introduce v4l2_mc_pipeline_enabled()
Date: Thu, 19 Jun 2025 11:15:45 +0300
Message-Id: <20250619081546.1582969-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_mc_pipeline_enabled() helps solving a problem known for long but
lacked any sort of general solution: with multiple streams, when streaming
is started on video nodes one by one, when should streaming be started in
the source?

v4l2_mc_pipeline_enabled() traverses the pipeline towards the source,
queries the streams generated by the source and traces them back to the
video nodes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 243 ++++++++++++++++++++++++++++++
 include/media/v4l2-mc.h           |  44 ++++++
 2 files changed, 287 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 937d358697e1..1731088ad436 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -612,3 +612,246 @@ int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(v4l2_pipeline_link_notify);
+
+static int
+__v4l2_mc_pipeline_enabled(struct v4l2_subdev_state *state,
+			   struct media_pad *src_pad, u64 __src_streams,
+			   struct media_pad **__sink_pad, u64 *__sink_streams)
+{
+	struct v4l2_subdev_route *route;
+	u64 src_streams = 0, sink_streams = 0;
+	bool has_sink_pad = false;
+	unsigned int sink_pad;
+
+	dev_dbg(state->sd->dev, "%s: source enabled, pad/streams %u/%#llx\n",
+		state->sd->entity.name, src_pad->index, __src_streams);
+	for_each_active_route(&state->routing, route) {
+		dev_dbg(state->sd->dev, "%s: %u/%u -> %u/%u, flags %x\n",
+			state->sd->entity.name,
+			route->sink_pad, route->sink_stream, route->source_pad,
+			route->source_stream, route->flags);
+		if (route->source_pad != src_pad->index)
+			continue;
+
+		if (!(BIT_ULL(route->source_stream) & __src_streams))
+			continue;
+
+		if (!has_sink_pad) {
+			has_sink_pad = true;
+			sink_pad = route->sink_pad;
+		}
+
+		if (route->sink_pad != sink_pad) {
+			dev_dbg(state->sd->dev,
+				"sink pads (%u vs. %u) differ\n",
+				route->sink_pad, sink_pad);
+			return -EMLINK;
+		}
+
+		sink_streams |= BIT_ULL(route->sink_stream);
+		src_streams |= BIT_ULL(route->source_stream);
+	}
+
+	*__sink_pad = has_sink_pad ? &state->sd->entity.pads[sink_pad] : NULL;
+	*__sink_streams = sink_streams;
+
+	return 0;
+}
+
+static int v4l2_mc_downpath_enabled(struct media_pad *sink_pad,
+				    unsigned int sink_stream,
+				    bool (*func)(struct video_device *vdev),
+				    struct media_pad **__sink_pad,
+				    u64 *__sink_streams)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev *sd;
+	struct media_pad *source_pad, *tmp_pad;
+	u32 source_stream;
+
+	if (!is_media_entity_v4l2_subdev(sink_pad->entity))
+		return -ENXIO;
+
+	sd = media_entity_to_v4l2_subdev(sink_pad->entity);
+	dev_dbg(sd->dev, "path_enabled: found sub-device %s\n",
+		sd->entity.name);
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	route = v4l2_subdev_find_route(&state->routing, sink_pad->index,
+				       sink_stream, true, 0);
+	if (IS_ERR(route)) {
+		v4l2_subdev_unlock_state(state);
+		dev_dbg(sd->dev,
+			"path_enabled: can't find opposite route for %s:%u/%u",
+			sd->entity.name, sink_pad->index, sink_stream);
+		return 2;
+	}
+
+	source_pad = &sd->entity.pads[route->source_pad];
+	v4l2_subdev_unlock_state(state);
+
+	tmp_pad = sink_pad;
+	sink_pad = media_pad_remote_pad_unique(source_pad);
+	if (IS_ERR(sink_pad)) {
+		dev_dbg(sd->dev,
+			"path_enabled: can't find remote source for %s:%u\n",
+			source_pad->entity->name, source_pad->index);
+		return PTR_ERR(sink_pad);
+	}
+
+	if (is_media_entity_v4l2_video_device(sink_pad->entity)) {
+		struct video_device *vdev;
+
+		vdev = media_entity_to_video_device(sink_pad->entity);
+		if (!vdev)
+			return -ENXIO;
+
+		dev_dbg(vdev->dev_parent,
+			"path_enabled: found video device %s\n",
+			vdev->name);
+
+		if (!*__sink_pad) {
+			*__sink_pad = tmp_pad;
+			dev_dbg(sd->dev, "path_enabled: sink %u/%u\n",
+				tmp_pad->index, sink_stream);
+		} else if (tmp_pad != *__sink_pad) {
+			dev_dbg(sd->dev,
+				"path_enabled: pads %s/%u and %s/%u differ\n",
+				tmp_pad->entity->name, tmp_pad->index,
+				(*__sink_pad)->entity->name,
+				(*__sink_pad)->index);
+			return -EXDEV;
+		}
+
+		*__sink_streams |= BIT_ULL(sink_stream);
+
+		return func(vdev);
+	}
+
+	return v4l2_mc_downpath_enabled(sink_pad, source_stream, func,
+					__sink_pad, __sink_streams);
+}
+
+static int v4l2_mc_source_get_streams(struct v4l2_subdev *sd, unsigned int pad,
+				      u64 *__streams)
+{
+	struct v4l2_mbus_frame_desc desc;
+	u64 streams = 0;
+	int ret;
+
+	if (!__streams)
+		return -EINVAL;
+
+	ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, &desc);
+	if (ret == -ENOIOCTLCMD) {
+		*__streams = 1ULL;
+		return 0;
+	}
+	if (ret)
+		return ret;
+
+	for (unsigned int i = 0; i < desc.num_entries; i++) {
+		if (streams & BIT_ULL(desc.entry[i].stream))
+			return -EINVAL;
+
+		streams |= BIT_ULL(desc.entry[i].stream);
+	}
+
+	dev_dbg(sd->dev, "found streams %#llx based on streams %#llx\n",
+		*__streams, streams);
+	if (*__streams & ~streams)
+		return -EINVAL;
+
+	*__streams = streams;
+
+	return 0;
+}
+
+int v4l2_mc_pipeline_enabled(struct video_device *vdev,
+			     bool (*func)(struct video_device *vdev),
+			     struct media_pad **__sink_pad, u64 *__sink_streams)
+{
+	u64 sink_streams = 1U;
+	struct media_pad *src_pad;
+	u64 src_streams;
+	struct v4l2_subdev_state *state;
+	struct media_pad *sink_pad = vdev->entity.pads;
+	struct v4l2_subdev *sd = NULL;
+	bool streaming = true;
+	struct media_pad *tmp_pad;
+	u64 tmp_streams;
+	int ret;
+
+	if (!__sink_pad)
+		__sink_pad = &tmp_pad;
+	if (!__sink_streams)
+		__sink_streams = &tmp_streams;
+	*__sink_pad = NULL;
+	*__sink_streams = 0;
+
+	do {
+		src_pad = media_pad_remote_pad_unique(sink_pad);
+		if (IS_ERR(src_pad)) {
+			dev_dbg(sd ? sd->dev : vdev->dev_parent,
+				"no unique remote pad found from %s:%u\n",
+				sink_pad->entity->name, sink_pad->index);
+			return PTR_ERR(src_pad);
+		}
+
+		sd = media_entity_to_v4l2_subdev(src_pad->entity);
+		if (!sd) {
+			dev_dbg(sd->dev,
+				"media entity %s is not a V4L2 sub-device\n",
+				src_pad->entity->name);
+			return -ENXIO;
+		}
+
+		/* Source streams match sink. */
+		src_streams = sink_streams;
+
+		state = v4l2_subdev_lock_and_get_active_state(sd);
+		ret = __v4l2_mc_pipeline_enabled(state, src_pad,
+						 src_streams, &sink_pad,
+						 &sink_streams);
+		v4l2_subdev_unlock_state(state);
+		if (ret)
+			return ret;
+	} while (sink_pad);
+
+	ret = v4l2_mc_source_get_streams(sd, src_pad->index, &src_streams);
+	if (ret)
+		return ret;
+
+	sd = media_entity_to_v4l2_subdev(src_pad->entity);
+
+	dev_dbg(sd->dev, "following %s:%u/%#llx\n", sd->entity.name,
+		src_pad->index, src_streams);
+
+	for (unsigned int i = __ffs(src_streams); src_streams;
+	     src_streams &= ~BIT_ULL(i), i = __ffs(src_streams)) {
+		sink_pad = media_pad_remote_pad_unique(src_pad);
+		if (IS_ERR(src_pad)) {
+			dev_dbg(sd->dev,
+				"no unique remote pad found from %s:%u\n",
+				sink_pad->entity->name, sink_pad->index);
+			return PTR_ERR(src_pad);
+		}
+
+		ret = v4l2_mc_downpath_enabled(sink_pad, i, func, __sink_pad,
+					       __sink_streams);
+		if (ret == 2)
+			continue;
+		if (ret < 0)
+			return ret;
+		if (!ret)
+			streaming = false;
+	}
+
+	dev_dbg(media_entity_to_v4l2_subdev((*__sink_pad)->entity)->dev,
+		"sink pad %s:%u/%#llx\n", (*__sink_pad)->entity->name,
+		(*__sink_pad)->index, *__sink_streams);
+
+	return streaming;
+}
+EXPORT_SYMBOL_GPL(v4l2_mc_pipeline_enabled);
diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
index 1837c9fd78cf..e72c0f62fa34 100644
--- a/include/media/v4l2-mc.h
+++ b/include/media/v4l2-mc.h
@@ -193,6 +193,50 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
 int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
 			      unsigned int notification);
 
+/**
+ * v4l2_mc_pipeline_enabled - Tell when to start streaming
+ * @vdev: The video device
+ * @func: Caller-provided function to tell a video device's streaming state
+ * @__sink_pad: sink pad at the root of the local pipeline
+ * @__sink_streams: streams to start
+ *
+ * Use to tell whether streaming should start on a video node. @func returns
+ * true if streaming has been started on a given video node. @__sink_pad and
+ * @__sink_streams are filled with pad and streams on the sub-device closest to
+ * the video nodes, to be used for calling v4l2_subdev_enable_streams() and
+ * v4l2_subdev_disable_streams().
+ *
+ * Using v4l2_mc_pipeline_enabled() has a few limitations currently (consider it
+ * a to-do list):
+ * * only unbranched streams can be supported albeit adding support for
+ *   downstream branches would be fairly trivial,
+ * * streams within a single source sub-device are considered to start at the
+ *   same time, more control could be added in two ways: 1) for sources to
+ *   determine stream starting, a control could be added to UAPI and 2) sources
+ *   could tell which streams start at the same time using a sub-device
+ *   operation,
+ * * CSI-2 VC framing is ignored currently, but VC-based stream starting could
+ *   be implemented by letting the caller to provide a function to determine
+ *   which streams are of interest and
+ * * routes leading to nowhere are ignored, on some hardware this is a problem,
+ *   but this can also be rather trivially addressed.
+ *
+ * Return:
+ * * 0: Success, but don't start streaming yet
+ * * 1: Success, now it's time to start streaming
+ * * -ENXIO: Route traversal encountered a non-video device/sub-device entity
+ * * -ENOTUNIQ: No unique remote pad
+ * * -ENOLINK: No remote pad found
+ * * -ENOENT: Enabled upstream route not found
+ * * -EMLINK: No unique downstream route found
+ * * -EINVAL: Stream could not be followed to source or was not produced by
+ *            the source
+ */
+int v4l2_mc_pipeline_enabled(struct video_device *vdev,
+			     bool (*func)(struct video_device *vdev),
+			     struct media_pad **__sink_pad,
+			     u64 *__sink_streams);
+
 #else /* CONFIG_MEDIA_CONTROLLER */
 
 static inline int v4l2_mc_create_media_graph(struct media_device *mdev)
-- 
2.39.5


