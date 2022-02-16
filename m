Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F35274B885A
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 14:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbiBPNBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 08:01:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233480AbiBPNBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 08:01:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35C62A794D
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 05:01:17 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60F40482;
        Wed, 16 Feb 2022 14:01:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645016476;
        bh=dlQSrXOXoK3tcS3Pb5R6xw0cq5MIya9oEXWANnos0zQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gfCtI3qwudROfLsUu6A6CKWQ1AruwEiuQZNHPYRcpe8PXo/RaoekLcxTZxLFAzISH
         GGitRyOLtVUyEhWNq1HrgM19inpqlVBLCNNvRmEUNyMpjz4noQBLolE4JpciLWk84i
         stNQ4RRjXo/KlKhpZJTuZ0cDr29VZtx/GZYD0e4k=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 1/7] media: subdev: rename subdev-state alloc & free
Date:   Wed, 16 Feb 2022 15:00:43 +0200
Message-Id: <20220216130049.508664-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_subdev_alloc_state() and v4l2_subdev_free_state() are not supposed
to be used by the drivers. However, we do have a few drivers that use
those at the moment, so we need to expose these functions for the time
being.

Prefix the functions with __ to mark the functions as internal.

At the same time, rename them to v4l2_subdev_state_alloc and
v4l2_subdev_state_free to match the style used for other functions like
video_device_alloc() and media_request_alloc().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  8 ++++++--
 drivers/media/platform/vsp1/vsp1_entity.c   |  8 ++++++--
 drivers/media/v4l2-core/v4l2-subdev.c       | 12 ++++++------
 drivers/staging/media/tegra-video/vi.c      |  8 ++++++--
 include/media/v4l2-subdev.h                 | 14 +++++++++-----
 5 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 2e60b9fce03b..da88f968c31a 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -263,7 +263,11 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	u32 width, height;
 	int ret;
 
-	sd_state = v4l2_subdev_alloc_state(sd);
+	/*
+	 * FIXME: Drop this call, drivers are not supposed to use
+	 * __v4l2_subdev_state_alloc().
+	 */
+	sd_state = __v4l2_subdev_state_alloc(sd);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 
@@ -299,7 +303,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 
 	rvin_format_align(vin, pix);
 done:
-	v4l2_subdev_free_state(sd_state);
+	__v4l2_subdev_state_free(sd_state);
 
 	return ret;
 }
diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
index 823c15facd1b..c82b3fb7b89a 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/vsp1/vsp1_entity.c
@@ -675,7 +675,11 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	 * Allocate the pad configuration to store formats and selection
 	 * rectangles.
 	 */
-	entity->config = v4l2_subdev_alloc_state(&entity->subdev);
+	/*
+	 * FIXME: Drop this call, drivers are not supposed to use
+	 * __v4l2_subdev_state_alloc().
+	 */
+	entity->config = __v4l2_subdev_state_alloc(&entity->subdev);
 	if (IS_ERR(entity->config)) {
 		media_entity_cleanup(&entity->subdev.entity);
 		return PTR_ERR(entity->config);
@@ -690,6 +694,6 @@ void vsp1_entity_destroy(struct vsp1_entity *entity)
 		entity->ops->destroy(entity);
 	if (entity->subdev.ctrl_handler)
 		v4l2_ctrl_handler_free(entity->subdev.ctrl_handler);
-	v4l2_subdev_free_state(entity->config);
+	__v4l2_subdev_state_free(entity->config);
 	media_entity_cleanup(&entity->subdev.entity);
 }
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 30eb50407db5..376595954db0 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -28,7 +28,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 {
 	struct v4l2_subdev_state *state;
 
-	state = v4l2_subdev_alloc_state(sd);
+	state = __v4l2_subdev_state_alloc(sd);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
@@ -39,7 +39,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 
 static void subdev_fh_free(struct v4l2_subdev_fh *fh)
 {
-	v4l2_subdev_free_state(fh->state);
+	__v4l2_subdev_state_free(fh->state);
 	fh->state = NULL;
 }
 
@@ -862,7 +862,7 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
+struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
 {
 	struct v4l2_subdev_state *state;
 	int ret;
@@ -895,9 +895,9 @@ struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_alloc);
 
-void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
+void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
 {
 	if (!state)
 		return;
@@ -905,7 +905,7 @@ void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
 	kvfree(state->pads);
 	kfree(state);
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_free);
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index d1f43f465c22..07d368f345cd 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -507,7 +507,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	if (!subdev)
 		return -ENODEV;
 
-	sd_state = v4l2_subdev_alloc_state(subdev);
+	/*
+	 * FIXME: Drop this call, drivers are not supposed to use
+	 * __v4l2_subdev_state_alloc().
+	 */
+	sd_state = __v4l2_subdev_state_alloc(subdev);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 	/*
@@ -558,7 +562,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	v4l2_fill_pix_format(pix, &fmt.format);
 	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
 
-	v4l2_subdev_free_state(sd_state);
+	__v4l2_subdev_state_free(sd_state);
 
 	return 0;
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 6c153b33bb04..5d6f56648ad6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1122,20 +1122,24 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 int v4l2_subdev_link_validate(struct media_link *link);
 
 /**
- * v4l2_subdev_alloc_state - allocate v4l2_subdev_state
+ * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
  *
  * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
  *
- * Must call v4l2_subdev_free_state() when state is no longer needed.
+ * Must call __v4l2_subdev_state_free() when state is no longer needed.
+ *
+ * Not to be called directly by the drivers.
  */
-struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
+struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd);
 
 /**
- * v4l2_subdev_free_state - free a v4l2_subdev_state
+ * __v4l2_subdev_state_free - free a v4l2_subdev_state
  *
  * @state: v4l2_subdev_state to be freed.
+ *
+ * Not to be called directly by the drivers.
  */
-void v4l2_subdev_free_state(struct v4l2_subdev_state *state);
+void __v4l2_subdev_state_free(struct v4l2_subdev_state *state);
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
-- 
2.25.1

