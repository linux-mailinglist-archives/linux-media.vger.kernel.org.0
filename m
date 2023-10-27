Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8A37D9481
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345708AbjJ0J7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345698AbjJ0J7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:59:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A259D
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698400770; x=1729936770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PRKsxdCz2fw/776dl7MFLHxX1d3xGiQsUoW2ZJLrqXQ=;
  b=S7GiIudrcozNZzDU0uXHG9PUtKCpLoKrzNrNf4Gf0sMjPkse47OJ1LMk
   tI9i7gqzjs3G7Qpa8yamecJ6S+PuJnJbiQcmcAdSvA1Q5dBvaUyhKJcne
   B83UH5trEABFRPb2C6U7lJpiCCVvmlzDeuS5XJ3PIvsL//tcM7/Fzhn30
   j1J/V/GZhmyWkUkEQ3Cu3QMltmkON0G6niDJt2eEUoMphBUIOMYjCpny/
   6tZoy/PlYYoTpY/ASX7lrhZ6+uHvWKIF4ghnjG0QdkZlsFG2iO7v9DPTR
   CRpNZwi1wycuEL11atdlZ+mUCICxRtgUSnfyESWLlHGbn0X3Vm6dt9sXU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473986713"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="473986713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:59:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="7179909"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:58:04 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D626E11F894;
        Fri, 27 Oct 2023 12:59:23 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v5 8/8] media: v4l: subdev: Return NULL from pad access functions on error
Date:   Fri, 27 Oct 2023 12:59:13 +0300
Message-Id: <20231027095913.1010187-9-sakari.ailus@linux.intel.com>
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

