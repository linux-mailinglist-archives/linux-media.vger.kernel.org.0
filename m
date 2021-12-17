Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A854789AC
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 12:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233443AbhLQLTC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 06:19:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53606 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233382AbhLQLTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 06:19:01 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 815D7AF2;
        Fri, 17 Dec 2021 12:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639739940;
        bh=Zt+cQF0szSUOMc6Kwq5Xr2e/NDJ/FecwgvFFoBrrN5U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tKUBlc02bNIrqLsSHHPjY2B3S+Pe0XZuj/uKvsMFz/zuHYjgElLhBDPuAVOY/Dhag
         7uFHI+ZCWvUQ+ahIwWOf2MqtBWnEMa8k4YwMHG+UfkZAK8G2Z4FmeyK8iDhzC3pOuo
         C4pFehPMaRTAO+ahxYSMHnZlNGHcAsgsHS6JKSSY=
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
Subject: [PATCH 1/6] media: subdev: rename subdev-state alloc & free
Date:   Fri, 17 Dec 2021 13:18:31 +0200
Message-Id: <20211217111836.225013-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217111836.225013-1-tomi.valkeinen@ideasonboard.com>
References: <20211217111836.225013-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++--
 drivers/media/platform/vsp1/vsp1_entity.c   |  4 ++--
 drivers/media/v4l2-core/v4l2-subdev.c       | 12 ++++++------
 drivers/staging/media/tegra-video/vi.c      |  4 ++--
 include/media/v4l2-subdev.h                 | 10 +++++-----
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 2e60b9fce03b..5aae01456c04 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -263,7 +263,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	u32 width, height;
 	int ret;
 
-	sd_state = v4l2_subdev_alloc_state(sd);
+	sd_state = __v4l2_subdev_state_alloc(sd);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 
@@ -299,7 +299,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 
 	rvin_format_align(vin, pix);
 done:
-	v4l2_subdev_free_state(sd_state);
+	__v4l2_subdev_state_free(sd_state);
 
 	return ret;
 }
diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
index 823c15facd1b..869cadc1468d 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/vsp1/vsp1_entity.c
@@ -675,7 +675,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	 * Allocate the pad configuration to store formats and selection
 	 * rectangles.
 	 */
-	entity->config = v4l2_subdev_alloc_state(&entity->subdev);
+	entity->config = __v4l2_subdev_state_alloc(&entity->subdev);
 	if (IS_ERR(entity->config)) {
 		media_entity_cleanup(&entity->subdev.entity);
 		return PTR_ERR(entity->config);
@@ -690,6 +690,6 @@ void vsp1_entity_destroy(struct vsp1_entity *entity)
 		entity->ops->destroy(entity);
 	if (entity->subdev.ctrl_handler)
 		v4l2_ctrl_handler_free(entity->subdev.ctrl_handler);
-	v4l2_subdev_free_state(entity->config);
+	__v4l2_subdev_state_free(entity->config);
 	media_entity_cleanup(&entity->subdev.entity);
 }
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 5d27a27cc2f2..fe49c86a9b02 100644
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
 
@@ -870,7 +870,7 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
+struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
 {
 	struct v4l2_subdev_state *state;
 	int ret;
@@ -903,9 +903,9 @@ struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_alloc);
 
-void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
+void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
 {
 	if (!state)
 		return;
@@ -913,7 +913,7 @@ void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
 	kvfree(state->pads);
 	kfree(state);
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_free);
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 69d9787d5338..b01f19e0f332 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -507,7 +507,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	if (!subdev)
 		return -ENODEV;
 
-	sd_state = v4l2_subdev_alloc_state(subdev);
+	sd_state = __v4l2_subdev_state_alloc(subdev);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 	/*
@@ -558,7 +558,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	v4l2_fill_pix_format(pix, &fmt.format);
 	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
 
-	v4l2_subdev_free_state(sd_state);
+	__v4l2_subdev_state_free(sd_state);
 
 	return 0;
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 95ec18c2f49c..e52bf508c75b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1135,20 +1135,20 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 int v4l2_subdev_link_validate(struct media_link *link);
 
 /**
- * v4l2_subdev_alloc_state - allocate v4l2_subdev_state
+ * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
  *
  * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
  *
- * Must call v4l2_subdev_free_state() when state is no longer needed.
+ * Must call __v4l2_subdev_state_free() when state is no longer needed.
  */
-struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
+struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd);
 
 /**
- * v4l2_subdev_free_state - free a v4l2_subdev_state
+ * __v4l2_subdev_state_free - free a v4l2_subdev_state
  *
  * @state: v4l2_subdev_state to be freed.
  */
-void v4l2_subdev_free_state(struct v4l2_subdev_state *state);
+void __v4l2_subdev_state_free(struct v4l2_subdev_state *state);
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
-- 
2.25.1

