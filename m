Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC747E212D
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbjKFMSl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbjKFMSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:18:17 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13D310DA
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273093; x=1730809093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7hTtsJEcYferNH5t/f3ahCcG0cgw8o+MwFwUYYXYT3s=;
  b=eBow+CMb3e7Rbys4AYLhoEwqJSue5P0pr8/qTUzuU64+NxhLCD5ympgx
   JjAh3PHC1HHlmVarVMYTS89nzdMDCggN4Vk9nLhGWoLMTAzU1kSePNsav
   QECsy8IFHMQ6c/ULZfoaaHdWX5QmT+hb3do2wXI7gd1A3wVyJXJ+bM08+
   TKMawtPEyY/7ZRK/XM1D2LfcvaIxqyEN+m8aSPoxUGkVqJWzPzh9rwVya
   oNMu45t0762HylORwGY34OPZtzrNgmamA0DYHZ0gG9Nl5rYn9PibZuC57
   k8f1K5w/vu77EugMcfkdMLEEq4m8tfvociYI074K2zN0rL+7RuDoaz5NJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420375241"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="420375241"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="828192138"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="828192138"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:10 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B9A6411FB8D;
        Mon,  6 Nov 2023 14:18:06 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v6 1/8] media: v4l: subdev: Store the sub-device in the sub-device state
Date:   Mon,  6 Nov 2023 14:17:58 +0200
Message-Id: <20231106121805.1266696-2-sakari.ailus@linux.intel.com>
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

