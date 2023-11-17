Return-Path: <linux-media+bounces-477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9F7EEFD1
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 11:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF1C31F285E3
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 10:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9782118B16;
	Fri, 17 Nov 2023 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1ZVEvTy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1140EC1
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 02:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700215941; x=1731751941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KuQ6WXjeUJKZMGbyrsXR0RjlPXXrP45VAbRn3Zmocz0=;
  b=B1ZVEvTyiIPVYiqiTLCMNZvyBLBBAIQXJBGKAYv6xcEgAS6WXt9fcOi2
   lXEe0YiOK0yuwL1IFbgSpPzUjdwglV/6mGYdmZ6NsPMggCW1JbNxPTqob
   S3IMcE00HSq0zsJtUqOhou97owzYYyoC3wpmc4ErrNqjIAbHs19a2f/M0
   ZA6Z4ex75LLdyzYmCfWGhBV73kJYzcjVDBp2Ycdvk5EhJn0pTOgccRkOo
   fx/N6LImZJjVJuUdqPD5tnZ/wy/zcPTvH3wxdeXQLkPdqNouR4V0PJjkl
   F8j00wB6Q/ynP522snPML9TuiiPI6h+yGkpRJ5mHFIepMaEDCtf2wOyOB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457771920"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="457771920"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715494796"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="715494796"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:17 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A304120ED2;
	Fri, 17 Nov 2023 12:12:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1r3vpG-005c9u-0U;
	Fri, 17 Nov 2023 12:11:50 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 2/9] media: v4l: subdev: Also return pads array information on stream functions
Date: Fri, 17 Nov 2023 12:11:32 +0200
Message-Id: <20231117101140.1338288-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231117101140.1338288-1-sakari.ailus@linux.intel.com>
References: <20231117101140.1338288-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two sets of functions that return information from sub-device
state, one for stream-unaware users and another for stream-aware users.
Add support for stream-aware functions to return format, crop and compose
information from pad-based array that are functionally equivalent to the
old, stream-unaware ones.

Also check state is non-NULL, in order to guard against old drivers
potentially calling this with NULL state for active formats or selection
rectangles.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 63 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  9 ++--
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index cd3ff5b19d0c..554d0c128ee9 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1691,6 +1691,27 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
 
+	if (WARN_ON_ONCE(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		/*
+		 * Set the pad to 0 on error as this is aligned with the
+		 * behaviour of the pad state information access functions. The
+		 * purpose of setting pad to 0 here is to avoid accessing memory
+		 * outside the pads array, but still issuing warning of the
+		 * invalid access while making the caller's error handling
+		 * easier.
+		 */
+		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
+			pad = 0;
+
+		return &state->pads[pad].format;
+	}
+
 	lockdep_assert_held(state->lock);
 
 	stream_configs = &state->stream_configs;
@@ -1712,6 +1733,27 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
 
+	if (WARN_ON_ONCE(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		/*
+		 * Set the pad to 0 on error as this is aligned with the
+		 * behaviour of the pad state information access functions. The
+		 * purpose of setting pad to 0 here is to avoid accessing memory
+		 * outside the pads array, but still issuing warning of the
+		 * invalid access while making the caller's error handling
+		 * easier.
+		 */
+		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
+			pad = 0;
+
+		return &state->pads[pad].crop;
+	}
+
 	lockdep_assert_held(state->lock);
 
 	stream_configs = &state->stream_configs;
@@ -1733,6 +1775,27 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
 
+	if (WARN_ON_ONCE(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		/*
+		 * Set the pad to 0 on error as this is aligned with the
+		 * behaviour of the pad state information access functions. The
+		 * purpose of setting pad to 0 here is to avoid accessing memory
+		 * outside the pads array, but still issuing warning of the
+		 * invalid access while making the caller's error handling
+		 * easier.
+		 */
+		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
+			pad = 0;
+
+		return &state->pads[pad].compose;
+	}
+
 	lockdep_assert_held(state->lock);
 
 	stream_configs = &state->stream_configs;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 46296852cb5b..6b242ec58cb7 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1543,7 +1543,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
  * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
  * stream in the subdev state.
  *
- * If the state does not contain the given pad + stream, NULL is returned.
+ * For stream-unaware drivers the format for the corresponding pad is returned.
+ * If the pad does not exist, NULL is returned.
  */
 struct v4l2_mbus_framefmt *
 v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
@@ -1558,7 +1559,8 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
  * This returns a pointer to crop rectangle for the given pad + stream in the
  * subdev state.
  *
- * If the state does not contain the given pad + stream, NULL is returned.
+ * For stream-unaware drivers the crop rectangle for the corresponding pad is
+ * returned. If the pad does not exist, NULL is returned.
  */
 struct v4l2_rect *
 v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
@@ -1574,7 +1576,8 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
  * This returns a pointer to compose rectangle for the given pad + stream in the
  * subdev state.
  *
- * If the state does not contain the given pad + stream, NULL is returned.
+ * For stream-unaware drivers the compose rectangle for the corresponding pad is
+ * returned. If the pad does not exist, NULL is returned.
  */
 struct v4l2_rect *
 v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
-- 
2.39.2


