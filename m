Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B787D3E1D
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 19:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbjJWRoX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 13:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbjJWRoU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 13:44:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C3CFF
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 10:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698083058; x=1729619058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=adcXT4JkWrV5SRf8e3xgEZSgNF807OyOCQf0d/fJXto=;
  b=DfKaGzuLdO7e3QiiZboX8+4JIXnMaeb0EXsAKl2IFS2WJuw1FUM7tnaD
   Ygyu8AWPjivY7JYgZanBw59kWluZqtL/Bf+nQWhxtQU8iBXksvvV7fBq4
   xi1JKMeLqlMZhU9zWfakJIF6Xo+MULD7r7lZ1eXRLcP2t5Gi0dVAhLlE0
   7qB0BWl+nnawbg2nPsa+DxrgTw1sANdA8NTIlZ4I/CwCEJXIdfYEj0NuG
   iJf9VunjSvuNXAfhponL8fNXdTsmmToeHawLirMPwMhe7lw94tlR0VL2J
   WYbaxq0Q6noKWsJ4cs0CapwqKzjMv/9CQ2LJz4cIp6xouOfpLqabcb6j5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366238819"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="366238819"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="751702608"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="751702608"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:44:15 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B58D412035C;
        Mon, 23 Oct 2023 20:44:12 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [PATCH v3 2/8] media: v4l: subdev: Also return pads array information on stream functions
Date:   Mon, 23 Oct 2023 20:44:02 +0300
Message-Id: <20231023174408.803874-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
---
 drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  9 ++++---
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index ee4fe8f33a41..955ee9a6c91f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1684,6 +1684,19 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
 
+	if (WARN_ON(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		if (WARN_ON(pad >= state->sd->entity.num_pads))
+			pad = 0;
+
+		return &state->pads[pad].try_fmt;
+	}
+
 	lockdep_assert_held(state->lock);
 
 	stream_configs = &state->stream_configs;
@@ -1705,6 +1718,19 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
 
+	if (WARN_ON(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		if (WARN_ON(pad >= state->sd->entity.num_pads))
+			pad = 0;
+
+		return &state->pads[pad].try_crop;
+	}
+
 	lockdep_assert_held(state->lock);
 
 	stream_configs = &state->stream_configs;
@@ -1726,6 +1752,19 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
 
+	if (WARN_ON(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
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

