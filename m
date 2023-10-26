Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB287D7D3A
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 09:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344111AbjJZHDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 03:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjJZHDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 03:03:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D865E129
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698303820; x=1729839820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wH4uya9ny0olxIHRzH1PwUqTLVrinXqoUmuqqRf3ZYE=;
  b=MmTDUBiHi0rsGBdZjgthmJyMSxJo78gXidyOYgr3QLyXYTN14G87dcHd
   EDD7YDridsEnEi51MWjah1d6ZcmkmejIXR/g/vYb3mmmena4YcYsracVR
   B4he+2+AW9/+PXsddUbbcPgnIt4CWK0LiSLZN3UIhtyBfm2MCSmyJA4VK
   Eg+80ntmPXEgNudAHI+uZeilgnCRtf5Vk3BIomGERdLDAvDkQ3Akr+FPT
   w3njpdAxOTHMtMlVtF6McDI8dgqKiSoM/pys+/004ohDHP50mpIHHUtCa
   50IwNZ5WaTQe0jwVQ6ANIK3ogbd4cHcLbGPSnD/d09JiWv/j9p+P3Iu4A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="451711526"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="451711526"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="902795779"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="902795779"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:01:11 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 67C031202BB;
        Thu, 26 Oct 2023 10:03:33 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v4 2/9] media: v4l: subdev: Also return pads array information on stream functions
Date:   Thu, 26 Oct 2023 10:03:22 +0300
Message-Id: <20231026070329.948847-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
 drivers/media/v4l2-core/v4l2-subdev.c | 51 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  9 +++--
 2 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index ee4fe8f33a41..7feaea6b04ad 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1684,6 +1684,23 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
 
+	if (WARN_ON(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		/*
+		 * Set the pad to 0 on error as this is aligned with the
+		 * behaviour of the pad state information access functions.
+		 */
+		if (WARN_ON(pad >= state->sd->entity.num_pads))
+			pad = 0;
+
+		return &state->pads[pad].try_fmt;
+	}
+
 	lockdep_assert_held(state->lock);
 
 	stream_configs = &state->stream_configs;
@@ -1705,6 +1722,23 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
 
+	if (WARN_ON(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		/*
+		 * Set the pad to 0 on error as this is aligned with the
+		 * behaviour of the pad state information access functions.
+		 */
+		if (WARN_ON(pad >= state->sd->entity.num_pads))
+			pad = 0;
+
+		return &state->pads[pad].try_crop;
+	}
+
 	lockdep_assert_held(state->lock);
 
 	stream_configs = &state->stream_configs;
@@ -1726,6 +1760,23 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
 
+	if (WARN_ON(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		/*
+		 * Set the pad to 0 on error as this is aligned with the
+		 * behaviour of the pad state information access functions.
+		 */
+		if (WARN_ON(pad >= state->sd->entity.num_pads))
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

