Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFB6C7D9479
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345663AbjJ0J7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbjJ0J7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:59:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24734192
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698400762; x=1729936762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7hTtsJEcYferNH5t/f3ahCcG0cgw8o+MwFwUYYXYT3s=;
  b=Bm+UYvFP+d5yJpTZ73jIKNlnVraV0SwU/LVZQg13Vuf9yljra8LjivSm
   8sAPHF7oxB4HoRafE+PJFZSQDUssF38HiMXvAfVQTn9qESqE/xGXaJPvy
   oydj0X76WQ5PHJeTEwmqPkaqZ13JqQZ+Jth6Z5ofEV38iT9m0ksnXjZrq
   DrWNHi3iVInc+TwqZsEUe4I6VjDXV0oPObPLGXgPhw2bqvCnOxNFVpOLL
   R/mrjF+P8CqT2t0P0xOEznupjfqf3LQjhH1bA/gME8OnD+8FqbFidncpz
   Uqf+Ur9VSUPPB51AjLZHhbVZbJmGvJqtDGmXhzQMMxt4izxsYxuV44RMZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473986668"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="473986668"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="7179884"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:57:55 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6B21B11F830;
        Fri, 27 Oct 2023 12:59:15 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v5 1/8] media: v4l: subdev: Store the sub-device in the sub-device state
Date:   Fri, 27 Oct 2023 12:59:06 +0300
Message-Id: <20231027095913.1010187-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231027095913.1010187-1-sakari.ailus@linux.intel.com>
References: <20231027095913.1010187-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Store the sub-device in the sub-device state. This will be needed in e.g.
validating pad number when retrieving information for non-stream-aware
users. There are expected to be more needs for this in the future.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
 include/media/v4l2-subdev.h           | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d295a4e87b66..ee4fe8f33a41 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1441,6 +1441,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 	else
 		state->lock = &state->_lock;
 
+	state->sd = sd;
+
 	/* Drivers that support streams do not need the legacy pad config */
 	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS) && sd->entity.num_pads) {
 		state->pads = kvcalloc(sd->entity.num_pads,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c1f90c1223a7..6a02a565035c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -756,6 +756,7 @@ struct v4l2_subdev_krouting {
  *
  * @_lock: default for 'lock'
  * @lock: mutex for the state. May be replaced by the user.
+ * @sd: the sub-device which the state is related to
  * @pads: &struct v4l2_subdev_pad_config array
  * @routing: routing table for the subdev
  * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_STREAMS)
@@ -768,6 +769,7 @@ struct v4l2_subdev_state {
 	/* lock for the struct v4l2_subdev_state fields */
 	struct mutex _lock;
 	struct mutex *lock;
+	struct v4l2_subdev *sd;
 	struct v4l2_subdev_pad_config *pads;
 	struct v4l2_subdev_krouting routing;
 	struct v4l2_subdev_stream_configs stream_configs;
-- 
2.39.2

