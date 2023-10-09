Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5426F7BEE18
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 00:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378868AbjJIWJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 18:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378741AbjJIWJO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 18:09:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1998A3
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 15:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696889352; x=1728425352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c49XPAjuHDXYtqbxmRDmqhUJOa2+EOstv1rRmUF6/l8=;
  b=JUeKw4eH1MsEDj3BfcXhiRXNPLcBDRcvaTFqHyIGYKYdOsQmRnIcalYL
   P4OO/zmG1n9FAE+xHOqoZCNE/jFuiyiooZtwQE3wBlaR5UP8sJURuwCs/
   galZ1ZiJOwBPt/wtuVfM+KTIUCwxbWIXurzhKNVpVGC2woHNj78ogkUgB
   pevuub/D7lFbNcQhyA8et8QAyNW/FF1VOYRo1jJcLYb2QPRdmSYw41X8Q
   AgwVVbkg3EtrKdB+5an2VMZbuwVjWwNAlEMNHKyils0fZ6qKybBF+KtTA
   XGWdw3/1GrbnIfhfSuC6yOgVevzRqnDetgFiOZe7BsSihZCWfIaO614ax
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="388123376"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="388123376"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782647385"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="782647385"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:09:10 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8EDDF1206D2;
        Tue, 10 Oct 2023 01:09:07 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 1/4] media: v4l: subdev: Set sub-device active state earlier
Date:   Tue, 10 Oct 2023 01:09:03 +0300
Message-Id: <20231009220906.221303-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009220906.221303-1-sakari.ailus@linux.intel.com>
References: <20231009220906.221303-1-sakari.ailus@linux.intel.com>
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

Set sub-device active state earlier in order to have it available to the
sub-device driver when driver's init_cfg operation is called.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |  3 ++-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |  3 ++-
 drivers/media/v4l2-core/v4l2-subdev.c              | 14 +++++++++-----
 drivers/staging/media/tegra-video/vi.c             |  2 +-
 include/media/v4l2-subdev.h                        |  3 ++-
 5 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 073f70c6ac68..26c2470dc289 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -266,7 +266,8 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	 * FIXME: Drop this call, drivers are not supposed to use
 	 * __v4l2_subdev_state_alloc().
 	 */
-	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
+	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key,
+					     false);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index c31f05a80bb5..ab0f47a5fd96 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -680,7 +680,8 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	 * __v4l2_subdev_state_alloc().
 	 */
 	entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
-						   "vsp1:config->lock", &key);
+						   "vsp1:config->lock", &key,
+						   false);
 	if (IS_ERR(entity->config)) {
 		media_entity_cleanup(&entity->subdev.entity);
 		return PTR_ERR(entity->config);
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d295a4e87b66..cd590951c393 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -53,7 +53,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 	struct v4l2_subdev_state *state;
 	static struct lock_class_key key;
 
-	state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
+	state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key, false);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
@@ -1426,7 +1426,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_has_pad_interdep);
 
 struct v4l2_subdev_state *
 __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
-			  struct lock_class_key *lock_key)
+			  struct lock_class_key *lock_key, bool active)
 {
 	struct v4l2_subdev_state *state;
 	int ret;
@@ -1451,6 +1451,9 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 		}
 	}
 
+	if (active)
+		sd->active_state = state;
+
 	/*
 	 * There can be no race at this point, but we lock the state anyway to
 	 * satisfy lockdep checks.
@@ -1470,6 +1473,9 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 
 	kfree(state);
 
+	if (active)
+		sd->active_state = NULL;
+
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_state_alloc);
@@ -1493,12 +1499,10 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
 {
 	struct v4l2_subdev_state *state;
 
-	state = __v4l2_subdev_state_alloc(sd, name, key);
+	state = __v4l2_subdev_state_alloc(sd, name, key, true);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
-	sd->active_state = state;
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index e98b3010520e..733fccb157fe 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -450,7 +450,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	 * __v4l2_subdev_state_alloc().
 	 */
 	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
-					     &key);
+					     &key, false);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 	/*
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c1f90c1223a7..ea05b70389b3 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1346,7 +1346,8 @@ bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
  */
 struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd,
 						    const char *lock_name,
-						    struct lock_class_key *key);
+						    struct lock_class_key *key,
+						    bool active);
 
 /**
  * __v4l2_subdev_state_free - free a v4l2_subdev_state
-- 
2.39.2

