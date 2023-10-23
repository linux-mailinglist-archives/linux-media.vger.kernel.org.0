Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54C2A7D3E23
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 19:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbjJWRoe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 13:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232697AbjJWRoc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 13:44:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EEDB0
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698083069; x=1729619069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6QJL42d9W/NSmQCp0sAq7NPvkezknNrVDnudFilvmGs=;
  b=PfpcWuEwSNJkxhcLr9wIR+H7mekqLbbnSGFoD0uGO8jFvLSu106dwfHF
   LXzWrp9soNzSKdIwXOjHe/b1bqFRy6xw33XBGv+x+9n5WMuCUeHwkwWzt
   3614E2Wf7UEKGYcXMEVx5IafmmrLmiGPCwy1+QDk4VuMSEbNh2WBvXIpx
   Fs3rheR3e1ZdehR470dyTcW2bgY0VVh0rpm8pXUEV8GLwAxao+M+6S5RP
   o86Y4uOJ207Fzs3uKXS8G87UdxeJqXty0hjqSCeAUr4yIQBuULFq3yCcQ
   WaTJUdqI3loETULgCYgD23xTJCVAojgVOV4SKd5hfg2KopUamRgdmJScJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366238853"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="366238853"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="751702647"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="751702647"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:44:26 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4729A11F82E;
        Mon, 23 Oct 2023 20:44:23 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [PATCH v3 7/8] media: v4l: subdev: Remove stream-unaware sub-device state access
Date:   Mon, 23 Oct 2023 20:44:07 +0300
Message-Id: <20231023174408.803874-8-sakari.ailus@linux.intel.com>
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

Remove stream-unaware sub-device state access functions and macros. These
are no longer used.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 77 -------------------------------------
 1 file changed, 77 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 12eb0fe746d7..24a0add93e6e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1144,83 +1144,6 @@ struct v4l2_subdev_fh {
 #define to_v4l2_subdev_fh(fh)	\
 	container_of(fh, struct v4l2_subdev_fh, vfh)
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-
-/**
- * v4l2_subdev_get_pad_format - ancillary routine to call
- *	&struct v4l2_subdev_pad_config->try_fmt
- *
- * @sd: pointer to &struct v4l2_subdev
- * @state: pointer to &struct v4l2_subdev_state
- * @pad: index of the pad in the &struct v4l2_subdev_state->pads array
- */
-static inline struct v4l2_mbus_framefmt *
-v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *state,
-			   unsigned int pad)
-{
-	if (WARN_ON(!state))
-		return NULL;
-	if (WARN_ON(pad >= sd->entity.num_pads))
-		pad = 0;
-	return &state->pads[pad].try_fmt;
-}
-
-/**
- * v4l2_subdev_get_pad_crop - ancillary routine to call
- *	&struct v4l2_subdev_pad_config->try_crop
- *
- * @sd: pointer to &struct v4l2_subdev
- * @state: pointer to &struct v4l2_subdev_state.
- * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
- */
-static inline struct v4l2_rect *
-v4l2_subdev_get_pad_crop(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_state *state,
-			 unsigned int pad)
-{
-	if (WARN_ON(!state))
-		return NULL;
-	if (WARN_ON(pad >= sd->entity.num_pads))
-		pad = 0;
-	return &state->pads[pad].try_crop;
-}
-
-/**
- * v4l2_subdev_get_pad_compose - ancillary routine to call
- *	&struct v4l2_subdev_pad_config->try_compose
- *
- * @sd: pointer to &struct v4l2_subdev
- * @state: pointer to &struct v4l2_subdev_state.
- * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
- */
-static inline struct v4l2_rect *
-v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *state,
-			    unsigned int pad)
-{
-	if (WARN_ON(!state))
-		return NULL;
-	if (WARN_ON(pad >= sd->entity.num_pads))
-		pad = 0;
-	return &state->pads[pad].try_compose;
-}
-
-/*
- * Temprary helpers until uses of v4l2_subdev_get_try_* functions have been
- * renamed
- */
-#define v4l2_subdev_get_try_format(sd, state, pad) \
-	v4l2_subdev_get_pad_format(sd, state, pad)
-
-#define v4l2_subdev_get_try_crop(sd, state, pad) \
-	v4l2_subdev_get_pad_crop(sd, state, pad)
-
-#define v4l2_subdev_get_try_compose(sd, state, pad) \
-	v4l2_subdev_get_pad_compose(sd, state, pad)
-
-#endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
-
 extern const struct v4l2_file_operations v4l2_subdev_fops;
 
 /**
-- 
2.39.2

