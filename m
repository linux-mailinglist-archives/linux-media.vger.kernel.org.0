Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D597D3E24
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 19:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233958AbjJWRof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 13:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233949AbjJWRod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 13:44:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9275D10D
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698083070; x=1729619070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mv378EIG+MqVmNxYy8tpZXyVmBjZmhQgWb36pYUtBV8=;
  b=gT+6JM5AGntPdPBTkF577RX5OG5iD6G5Nq+l8J8R/A+DdT85H4Iu3TQn
   OesJnEV5nmH/g44WuB+nn0ZVQU1ue0JLlnV3bMSqHrxdFJUCdqIerKWPn
   odj38d6OQHjLBANGVeWr4aEek7TJ/6McHd7kmt5z9dNO1mgoku+plL3nh
   KIdvsXHMulKCmP42Xj2pvKMFIjNMxsgMU4dwbo6uappRsWUUDWFIUwB7m
   1U9lFGDPe5uOBry+1AQg8BZgIbm6R1oZIG8sNdTRf+DAu1AdytByiZGmN
   fvGZpYndSDL1p/d51bZgZqvlSO9ODkLvZnxodrhUPflGHkOoPvhJXlBKS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366238859"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="366238859"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="751702649"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="751702649"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:44:27 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BC20512035C;
        Mon, 23 Oct 2023 20:44:24 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [PATCH v3 8/8] media: v4l: subdev: Also assert acquired mutex for non-stream drivers
Date:   Mon, 23 Oct 2023 20:44:08 +0300
Message-Id: <20231023174408.803874-9-sakari.ailus@linux.intel.com>
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

Assert mutex is taken by drivers that are not stream-aware.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e35226587244..8d079ad3287e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1680,6 +1680,8 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
 	if (WARN_ON(!state))
 		return NULL;
 
+	lockdep_assert_held(state->lock);
+
 	if (state->pads) {
 		if (stream)
 			return NULL;
@@ -1690,8 +1692,6 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
 		return &state->pads[pad].try_fmt;
 	}
 
-	lockdep_assert_held(state->lock);
-
 	stream_configs = &state->stream_configs;
 
 	for (i = 0; i < stream_configs->num_configs; ++i) {
@@ -1714,6 +1714,8 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
 	if (WARN_ON(!state))
 		return NULL;
 
+	lockdep_assert_held(state->lock);
+
 	if (state->pads) {
 		if (stream)
 			return NULL;
@@ -1724,8 +1726,6 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
 		return &state->pads[pad].try_crop;
 	}
 
-	lockdep_assert_held(state->lock);
-
 	stream_configs = &state->stream_configs;
 
 	for (i = 0; i < stream_configs->num_configs; ++i) {
@@ -1748,6 +1748,8 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
 	if (WARN_ON(!state))
 		return NULL;
 
+	lockdep_assert_held(state->lock);
+
 	if (state->pads) {
 		if (stream)
 			return NULL;
@@ -1758,8 +1760,6 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
 		return &state->pads[pad].try_compose;
 	}
 
-	lockdep_assert_held(state->lock);
-
 	stream_configs = &state->stream_configs;
 
 	for (i = 0; i < stream_configs->num_configs; ++i) {
-- 
2.39.2

