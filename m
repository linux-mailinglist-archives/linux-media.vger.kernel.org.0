Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7EF7AB164
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 13:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbjIVL5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 07:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbjIVL5t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 07:57:49 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF91FB
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 04:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695383863; x=1726919863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jPUQfYZpMu4dDF/qgkcx1DHbxhRRl3Fk2GemjArNuxw=;
  b=JZGwN3+dJHTS2UzIufODOndK7wEyL+57kfzwJyC1UKHMRjkSU5RvnDP1
   WQSnMtcG+6QS9lxTSlS3KNrqYQ85db3Ds+xuVpxeO27SECht1ZNeio2Kt
   g5bFAWQRu0hjG/wHClho9LmpN365A7P1iJKuLGCYRHPBV1R/r/8GIb5fA
   pV8Jf2NdduO0MVbvCNxt9VK6CNZlnQWARgNOo/LYy8D5gf1xjihz0KD3J
   oz1ZrfTMPZeW/ChRaa1Nt8jZYaVvtf5tNKYpXNmefqNzArzyHQFL8a/c1
   7tCq4gNEI8c0mlJ8LOjqoPxQ8hy5s0dGYGjrsbPHbLQ2sJKQ2c+lVlWLO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383558588"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383558588"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837714663"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="837714663"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:57:40 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AAD181209D0;
        Fri, 22 Sep 2023 14:57:37 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v4 05/12] media: ccs: Switch to init_cfg
Date:   Fri, 22 Sep 2023 14:57:23 +0300
Message-Id: <20230922115730.251779-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
References: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use init_cfg() instead of manually setting up defaults in file handle
open.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 3fed071b65ab..a4f593866ad6 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2945,7 +2945,6 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 }
 
 static const struct v4l2_subdev_ops ccs_ops;
-static const struct v4l2_subdev_internal_ops ccs_internal_ops;
 static const struct media_entity_operations ccs_entity_ops;
 
 static int ccs_register_subdev(struct ccs_sensor *sensor,
@@ -3076,13 +3075,13 @@ static void ccs_create_subdev(struct ccs_sensor *sensor,
 	if (ssd == sensor->src)
 		return;
 
-	ssd->sd.internal_ops = &ccs_internal_ops;
 	ssd->sd.owner = THIS_MODULE;
 	ssd->sd.dev = &client->dev;
 	v4l2_set_subdevdata(&ssd->sd, client);
 }
 
-static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+static int ccs_init_cfg(struct v4l2_subdev *sd,
+			struct v4l2_subdev_state *sd_state)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(sd);
 	struct ccs_sensor *sensor = ssd->sensor;
@@ -3092,9 +3091,9 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	for (i = 0; i < ssd->npads; i++) {
 		struct v4l2_mbus_framefmt *try_fmt =
-			v4l2_subdev_get_try_format(sd, fh->state, i);
+			v4l2_subdev_get_try_format(sd, sd_state, i);
 		struct v4l2_rect *try_crop =
-			v4l2_subdev_get_try_crop(sd, fh->state, i);
+			v4l2_subdev_get_try_crop(sd, sd_state, i);
 		struct v4l2_rect *try_comp;
 
 		ccs_get_native_size(ssd, try_crop);
@@ -3107,7 +3106,7 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		if (ssd == sensor->pixel_array)
 			continue;
 
-		try_comp = v4l2_subdev_get_try_compose(sd, fh->state, i);
+		try_comp = v4l2_subdev_get_try_compose(sd, sd_state, i);
 		*try_comp = *try_crop;
 	}
 
@@ -3123,6 +3122,7 @@ static const struct v4l2_subdev_video_ops ccs_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
+	.init_cfg = ccs_init_cfg,
 	.enum_mbus_code = ccs_enum_mbus_code,
 	.get_fmt = ccs_get_format,
 	.set_fmt = ccs_set_format,
@@ -3148,11 +3148,6 @@ static const struct media_entity_operations ccs_entity_ops = {
 static const struct v4l2_subdev_internal_ops ccs_internal_src_ops = {
 	.registered = ccs_registered,
 	.unregistered = ccs_unregistered,
-	.open = ccs_open,
-};
-
-static const struct v4l2_subdev_internal_ops ccs_internal_ops = {
-	.open = ccs_open,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.39.2

