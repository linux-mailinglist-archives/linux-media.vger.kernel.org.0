Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3020D7D7D40
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 09:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344404AbjJZHDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 03:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbjJZHDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 03:03:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F577195
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698303827; x=1729839827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bVSoyxdHleZFK9o8qrEdwwD208EWFdVEsGYyRHyiBq8=;
  b=kSrDKv532xly3ULv3GwXxVMvG7uYbxFNWrcMkvxRu6Jas/x65yPwpC3F
   Q6EHoqilgjEEPTlYQ6VF0Q6LNDohmKcUSWok46PpIeT85AvU9tBW/KyZ8
   6C/4FCppt5OrrjFGb5mxghVNLN0Nklld4qJ/8HotilqO5x1l/430HRxE2
   wv54WTgopqTgEvnLMsDPKWJXawmxZl/kknncxcgAmadEdF8H3n7/xl4O6
   wuGeaOI6xCNSYLB94XAg0g7ecGlycuVU7lThLo0kXBlbPXTlHVWPQLyyS
   CFhDE49G8IPDwulnuHyO+SPTW4DPqt0RFn6acayl6dWAW3/R5XEYVIhbx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="451711562"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="451711562"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="902795808"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="902795808"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:01:19 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8B4311202BB;
        Thu, 26 Oct 2023 10:03:41 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v4 8/9] media: v4l: subdev: Return NULL from pad access functions on error
Date:   Thu, 26 Oct 2023 10:03:28 +0300
Message-Id: <20231026070329.948847-9-sakari.ailus@linux.intel.com>
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

Return NULL from sub-device pad state access functions
(v4l2_subdev_state_get_{format,crop,compose}) for non-existent pads. While
this behaviour differs from older set of pad state information access
functions, we've had a WARN_ON() there for a long time and callers also do
validate the pad index nowadays. Therefore problems are not expected.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 9d4ff9b4fcec..bd0d89c2996f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1684,12 +1684,8 @@ __v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
 		if (stream)
 			return NULL;
 
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions.
-		 */
 		if (WARN_ON(pad >= state->sd->entity.num_pads))
-			pad = 0;
+			return NULL;
 
 		return &state->pads[pad].try_fmt;
 	}
@@ -1722,12 +1718,8 @@ __v4l2_subdev_state_get_crop_stream(struct v4l2_subdev_state *state,
 		if (stream)
 			return NULL;
 
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions.
-		 */
 		if (WARN_ON(pad >= state->sd->entity.num_pads))
-			pad = 0;
+			return NULL;
 
 		return &state->pads[pad].try_crop;
 	}
@@ -1760,12 +1752,8 @@ __v4l2_subdev_state_get_compose_stream(struct v4l2_subdev_state *state,
 		if (stream)
 			return NULL;
 
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions.
-		 */
 		if (WARN_ON(pad >= state->sd->entity.num_pads))
-			pad = 0;
+			return NULL;
 
 		return &state->pads[pad].try_compose;
 	}
-- 
2.39.2

