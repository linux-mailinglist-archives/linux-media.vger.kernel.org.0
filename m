Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C387E2134
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbjKFMTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbjKFMSk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:18:40 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6E61997
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273108; x=1730809108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U7VDAITYT4Nh3jM3mK2vVOX3ltSwf7cPWirY/klmmu4=;
  b=Y0PmRCH/gkhEKwS6SVEr9Fa9OJqpNfgJfak5IyvJexSlMLiqUDoAJ7eL
   71sCNBzE1N2ZkOjBAQ+hp38ZwcrFH6FBR7pKQPClY73bEfjbI+2dermMQ
   cj7co2p7YyU0HuRSFK76kAH3ueDtiiE9ja7e4tivw1/PSNj+VrbyQQVxG
   ftGUBVbdbfh4DCkxq/vQzs1xicBDUvhMx8w/hM5yLiR61c44618k/nbZR
   JARRQNoXKyKtnPLmU29xkxsAyECdGzGb8wh6p39E95URvIOIAScti8vfM
   ewVXfgTJyfnQQoE3laEuqcz//H2Pkf3URGTFy8mgyTztUiAu9WmjwhnE4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420375295"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="420375295"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="828192208"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="828192208"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:18 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1FE5111FB8D;
        Mon,  6 Nov 2023 14:18:15 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v6 7/8] media: v4l: subdev: Remove stream-unaware sub-device state access
Date:   Mon,  6 Nov 2023 14:18:04 +0200
Message-Id: <20231106121805.1266696-8-sakari.ailus@linux.intel.com>
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

Remove stream-unaware sub-device state access functions and macros. These
are no longer used.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 77 -------------------------------------
 1 file changed, 77 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index bd0b97ffb87f..34ef5f263bfb 100644
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

