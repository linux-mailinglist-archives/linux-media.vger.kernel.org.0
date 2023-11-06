Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A16E7E2133
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjKFMS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbjKFMSS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:18:18 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD59F10E6
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273094; x=1730809094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SnurpDXcqlMcoUr3lGzDLbBzifaE3YxtcFmcqVgFBKA=;
  b=H4mctvzJV5OE19BNU/LwKRlCPQcWX8JRjKmHtNforOf/eQJPaBsC6P+g
   wli1gngdmYYRXTa/pl6tAGXLqXisIdl94Zu0mNfF90/J9cQDXn7sEoY2L
   6grmOHtizP9CQMuc4sN7rH4R+fQu8qL2iwENSf96dANMFfLTom65pC4wA
   voJ/+psEyKRVx8CtUD7l0tJEK86ArV4w0j5IavbVKNA2AqL6gS14YzHd2
   afmvNE7tJ4kNljv3VMCll8jjNCvrdYRKRxepAVaRTL3+Tv96zWZm2UGMs
   nb3BdYMhVp58Os1s9WxENlLdeBCmjigvR8sVD4grPNa08pwCpct34Qe8h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420375246"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="420375246"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="828192145"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="828192145"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:11 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C47D411FBBC;
        Mon,  6 Nov 2023 14:18:07 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v6 2/8] media: v4l: subdev: Also return pads array information on stream functions
Date:   Mon,  6 Nov 2023 14:17:59 +0200
Message-Id: <20231106121805.1266696-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106121805.1266696-1-sakari.ailus@linux.intel.com>
References: <20231106121805.1266696-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
index ee4fe8f33a41..0495507475e7 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1684,6 +1684,27 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
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
+		return &state->pads[pad].try_fmt;
+	}
+
 	lockdep_assert_held(state->lock);
 
 	stream_configs = &state->stream_configs;
@@ -1705,6 +1726,27 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
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
+		return &state->pads[pad].try_crop;
+	}
+
 	lockdep_assert_held(state->lock);
 
 	stream_configs = &state->stream_configs;
@@ -1726,6 +1768,27 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
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
+		return &state->pads[pad].try_compose;
+	}
+
 	lockdep_assert_held(state->lock);
 
 	stream_configs = &state->stream_configs;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 6a02a565035c..0ba1cd8c3ac7 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1550,7 +1550,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
  * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
  * stream in the subdev state.
  *
- * If the state does not contain the given pad + stream, NULL is returned.
+ * For stream-unaware drivers the format for the corresponding pad is returned.
+ * If the pad does not exist, NULL is returned.
  */
 struct v4l2_mbus_framefmt *
 v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
@@ -1565,7 +1566,8 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
  * This returns a pointer to crop rectangle for the given pad + stream in the
  * subdev state.
  *
- * If the state does not contain the given pad + stream, NULL is returned.
+ * For stream-unaware drivers the crop rectangle for the corresponding pad is
+ * returned. If the pad does not exist, NULL is returned.
  */
 struct v4l2_rect *
 v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
@@ -1581,7 +1583,8 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
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

