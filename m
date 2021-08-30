Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB3A3FB433
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236434AbhH3LDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235818AbhH3LDJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B774BC061575
        for <linux-media@vger.kernel.org>; Mon, 30 Aug 2021 04:02:15 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69149B9C;
        Mon, 30 Aug 2021 13:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321333;
        bh=6ixnkitdFV8wkw/jxpb4KNH0fDO9jVN/+XJikhlaYf4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ghxigdf8aN6FZvQc6sZypTHhhHSm6q3BXA0AYDphfq1R8kZ70MACcDbDvyWz1/b4S
         s3lTPrDxq3ldwgOS3Pbc8IXFXcI0OT2j/claw71OfN1gfsdEZnvJY1Y1ESW/4mVrDF
         hZViKQ/DLS1sb3xtUJqG3aLPElZcuZO1Isb0arhQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v8 03/36] media: subdev: add 'which' to subdev state
Date:   Mon, 30 Aug 2021 14:00:43 +0300
Message-Id: <20210830110116.488338-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev state is passed to functions in the media drivers, and
usually either V4L2_SUBDEV_FORMAT_ACTIVE or V4L2_SUBDEV_FORMAT_TRY is
also given to the function in one way or another.

One op where this is not the case is v4l2_subdev_pad_ops.init_cfg. One
could argue that the initialization of the state should be the same for
both ACTIVE and TRY cases, but unfortunately that is not the case:

- Some drivers do also other things than just touch the state when
dealing with ACTIVE, e.g. if there is extra state outside the standard
subdev state.
- Some drivers might need to create, say, struct v4l2_subdev_format
which has 'which' field, and that needs to be filled with either ACTIVE
or TRY.

Currently init_cfg is only called for TRY case from the v4l2 framework,
passing the TRY state. Some drivers call their own init_cfg, passing
NULL as the state, which is used to indicate ACTIVE case.

In the future we want to pass subdev's active state from the v4l2
framework side, so we need a solution to this.

We could change the init_cfg() to include the TRY/ACTIVE value, which
would require changing more or less all the drivers. Instead, I have
added 'which' field to the subdev state itself, filled at state
allocation time, which only requires changes to the drivers that
allocate a state themselves.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  2 +-
 drivers/media/platform/vsp1/vsp1_entity.c   |  2 +-
 drivers/media/v4l2-core/v4l2-subdev.c       | 10 +++++++---
 drivers/staging/media/tegra-video/vi.c      |  2 +-
 include/media/v4l2-subdev.h                 |  7 ++++++-
 5 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5f4fa8c48f68..1de30d5b437f 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -252,7 +252,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	u32 width, height;
 	int ret;
 
-	sd_state = v4l2_alloc_subdev_state(sd);
+	sd_state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 
diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
index e40bca254b8b..63ea5e472c33 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/vsp1/vsp1_entity.c
@@ -675,7 +675,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	 * Allocate the pad configuration to store formats and selection
 	 * rectangles.
 	 */
-	entity->config = v4l2_alloc_subdev_state(&entity->subdev);
+	entity->config = v4l2_alloc_subdev_state(&entity->subdev, V4L2_SUBDEV_FORMAT_ACTIVE);
 	if (IS_ERR(entity->config)) {
 		media_entity_cleanup(&entity->subdev.entity);
 		return PTR_ERR(entity->config);
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e1a794f69815..04ad319fb150 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -28,7 +28,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 {
 	struct v4l2_subdev_state *state;
 
-	state = v4l2_alloc_subdev_state(sd);
+	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
@@ -870,7 +870,9 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-struct v4l2_subdev_state *v4l2_alloc_subdev_state(struct v4l2_subdev *sd)
+struct v4l2_subdev_state *
+v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
+			enum v4l2_subdev_format_whence which)
 {
 	struct v4l2_subdev_state *state;
 	int ret;
@@ -879,6 +881,8 @@ struct v4l2_subdev_state *v4l2_alloc_subdev_state(struct v4l2_subdev *sd)
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 
+	state->which = which;
+
 	if (sd->entity.num_pads) {
 		state->pads = kvmalloc_array(sd->entity.num_pads,
 					     sizeof(*state->pads),
@@ -948,7 +952,7 @@ int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
 {
 	struct v4l2_subdev_state *state;
 
-	state = v4l2_alloc_subdev_state(sd);
+	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index a94d19e2a67c..691f5e04b0a1 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -507,7 +507,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	if (!subdev)
 		return -ENODEV;
 
-	sd_state = v4l2_alloc_subdev_state(subdev);
+	sd_state = v4l2_alloc_subdev_state(subdev, V4L2_SUBDEV_FORMAT_ACTIVE);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 	/*
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index ecaf040ead57..5ec78ffda4f5 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -655,6 +655,7 @@ struct v4l2_subdev_pad_config {
 /**
  * struct v4l2_subdev_state - Used for storing subdev state information.
  *
+ * @which: state type (from enum v4l2_subdev_format_whence)
  * @pads: &struct v4l2_subdev_pad_config array
  *
  * This structure only needs to be passed to the pad op if the 'which' field
@@ -662,6 +663,7 @@ struct v4l2_subdev_pad_config {
  * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
  */
 struct v4l2_subdev_state {
+	u32 which;
 	struct v4l2_subdev_pad_config *pads;
 };
 
@@ -1141,10 +1143,13 @@ int v4l2_subdev_link_validate(struct media_link *link);
  * v4l2_alloc_subdev_state - allocate v4l2_subdev_state
  *
  * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
+ * @which: configuration type for the state (from enum v4l2_subdev_format_whence)
  *
  * Must call v4l2_free_subdev_state() when state is no longer needed.
  */
-struct v4l2_subdev_state *v4l2_alloc_subdev_state(struct v4l2_subdev *sd);
+struct v4l2_subdev_state *
+v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
+			enum v4l2_subdev_format_whence which);
 
 /**
  * v4l2_free_subdev_state - free a v4l2_subdev_state
-- 
2.25.1

