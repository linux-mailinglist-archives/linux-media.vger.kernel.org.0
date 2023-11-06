Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB507E2135
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjKFMTC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbjKFMSm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:18:42 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91111993
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273108; x=1730809108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PRKsxdCz2fw/776dl7MFLHxX1d3xGiQsUoW2ZJLrqXQ=;
  b=bTod+3X5gjeX17r2SBdaZw/cVzhkoVbUQKaQVIPcWhThFUpwoooWfeM6
   3/zOQ4DB3r5cBKWGncE+eGwqVvwdd3roH0lWc4fVX5RHw95OqdsWSRmd8
   HbPqpuBOGb0e8XH5zUkHGcWlOfH52VzV9bGqGSY1wkFhN54bws+1gfubQ
   gTbQ2DpD4zqvEn2LL7grdCn0rCqxMhNZIlofGUFX9BFTNDJR8XeE8jmAV
   tzx8nXQST9XFapRSN+W7pJuCVY9e05rHFvUuzs+0sfa9VAaeaTvh9zH6F
   MKcLO4/c/wfTMcedRoTRj6fbfVK5zw6LVswkeTVhZXlLQaVZMDhEpBnS2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420375304"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="420375304"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="828192223"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="828192223"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:19 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6C44111FBBC;
        Mon,  6 Nov 2023 14:18:16 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v6 8/8] media: v4l: subdev: Return NULL from pad access functions on error
Date:   Mon,  6 Nov 2023 14:18:05 +0200
Message-Id: <20231106121805.1266696-9-sakari.ailus@linux.intel.com>
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

Return NULL from sub-device pad state access functions
(v4l2_subdev_state_get_{format,crop,compose}) for non-existent pads. While
this behaviour differs from older set of pad state information access
functions, we've had a WARN_ON() there for a long time and callers also do
validate the pad index nowadays. Therefore problems are not expected.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 36 +++++----------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index bae932134cfc..923a221955a9 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1684,16 +1684,8 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
 		if (stream)
 			return NULL;
 
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions. The
-		 * purpose of setting pad to 0 here is to avoid accessing memory
-		 * outside the pads array, but still issuing warning of the
-		 * invalid access while making the caller's error handling
-		 * easier.
-		 */
-		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
-			pad = 0;
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
 
 		return &state->pads[pad].try_fmt;
 	}
@@ -1726,16 +1718,8 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
 		if (stream)
 			return NULL;
 
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions. The
-		 * purpose of setting pad to 0 here is to avoid accessing memory
-		 * outside the pads array, but still issuing warning of the
-		 * invalid access while making the caller's error handling
-		 * easier.
-		 */
-		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
-			pad = 0;
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
 
 		return &state->pads[pad].try_crop;
 	}
@@ -1768,16 +1752,8 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
 		if (stream)
 			return NULL;
 
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions. The
-		 * purpose of setting pad to 0 here is to avoid accessing memory
-		 * outside the pads array, but still issuing warning of the
-		 * invalid access while making the caller's error handling
-		 * easier.
-		 */
-		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
-			pad = 0;
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
 
 		return &state->pads[pad].try_compose;
 	}
-- 
2.39.2

