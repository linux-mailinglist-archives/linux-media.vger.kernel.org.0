Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29EB7D36AB
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 14:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbjJWMdT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 08:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjJWMdS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 08:33:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3F910B
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 05:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698064396; x=1729600396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qjm6svv4D0DuGrVolKreoEP23CfUm7kXYDUe9CebMII=;
  b=ibeEM8UFRUFLjPs1KHluYHlLCjSOov0d8t5UftrbzHTVNLew5Q8RTBUB
   Lpv2GZHAndOYDo7yXdig9/oUuUommHdqa1MI5nu3SGmyVCtVScyQ5E2Ne
   xzWjqCAgpJIx05vPUBJfYK7He1xtfcaXwY6Tcj4UA9e252w6Rxx0poyrd
   x4+iVgdWyVmIV7AtwapEpS7NlmRYtlMy94QQPKOf3K5wCxT2Zqk65d6Hk
   dUldXmcSjfGNAHMB+vYMcry1AK2pvKOAsQQG9TIYwlclTNccVRWhDGEA5
   KgamVE0N0fMVLFkQCD0mvLGr5ExbL6qan7GGWpUGxHzye2BQocJncL7nF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="386645044"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="386645044"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 05:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="761728892"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="761728892"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 05:33:13 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7BD671202BB;
        Mon, 23 Oct 2023 15:33:10 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [PATCH v2 1/6] media: v4l: subdev: Also return pads array information on stream functions
Date:   Mon, 23 Oct 2023 15:33:03 +0300
Message-Id: <20231023123308.782592-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
 1 file changed, 39 insertions(+)

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
-- 
2.39.2

