Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 667197D9470
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345686AbjJ0J7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345671AbjJ0J7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:59:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB34192
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:58:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6F6F1B1C;
        Fri, 27 Oct 2023 11:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698400720;
        bh=zWSHJv8f3Ox0q9o/eNpzQ692G2fpVFwF8u+VUtJiOoo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eUwwvEC9ar1zucECdpshCFYvUOl+AjqwKnjR50qHIcriEKXVIc012oGeX1AnTNRyZ
         GMy+r82fkoXmdw3zre7En9Sg9YSR9v0sjlzXa1Fp4GwUXpi+FSQ6Z5JAO8aJVPos43
         nxJyI+8x0Z5u6ZuHbrpYvO860ers4hKw8J5++LV0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v1 5/9] media: renesas: vsp1: Fix references to pad config
Date:   Fri, 27 Oct 2023 12:58:49 +0300
Message-ID: <20231027095853.29057-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
References: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 subdev operations have moved from operating on a
v4l2_subdev_pad_config to a v4l2_subdev_state a long time ago. Fix
remaining incorrect references to pad config in function and variable
names.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_brx.c    | 40 +++++----
 .../media/platform/renesas/vsp1/vsp1_entity.c | 85 +++++++++----------
 .../media/platform/renesas/vsp1/vsp1_entity.h | 10 +--
 .../media/platform/renesas/vsp1/vsp1_histo.c  | 24 +++---
 .../media/platform/renesas/vsp1/vsp1_hsit.c   | 11 ++-
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 37 ++++----
 .../media/platform/renesas/vsp1/vsp1_sru.c    | 36 ++++----
 .../media/platform/renesas/vsp1/vsp1_uds.c    | 39 ++++-----
 .../media/platform/renesas/vsp1/vsp1_uif.c    | 24 +++---
 9 files changed, 145 insertions(+), 161 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 95bf7b4ac9b8..758525a03289 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -136,29 +136,28 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_brx *brx = to_brx(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
 	mutex_lock(&brx->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&brx->entity, sd_state,
-					    fmt->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&brx->entity, sd_state, fmt->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
 
-	brx_try_format(brx, config, fmt->pad, &fmt->format);
+	brx_try_format(brx, state, fmt->pad, &fmt->format);
 
-	format = vsp1_entity_get_pad_format(&brx->entity, config, fmt->pad);
+	format = vsp1_entity_get_pad_format(&brx->entity, state, fmt->pad);
 	*format = fmt->format;
 
 	/* Reset the compose rectangle. */
 	if (fmt->pad != brx->entity.source_pad) {
 		struct v4l2_rect *compose;
 
-		compose = brx_get_compose(brx, config, fmt->pad);
+		compose = brx_get_compose(brx, state, fmt->pad);
 		compose->left = 0;
 		compose->top = 0;
 		compose->width = format->width;
@@ -171,7 +170,7 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 
 		for (i = 0; i <= brx->entity.source_pad; ++i) {
 			format = vsp1_entity_get_pad_format(&brx->entity,
-							    config, i);
+							    state, i);
 			format->code = fmt->format.code;
 		}
 	}
@@ -186,7 +185,7 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_brx *brx = to_brx(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 
 	if (sel->pad == brx->entity.source_pad)
 		return -EINVAL;
@@ -200,13 +199,13 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 		return 0;
 
 	case V4L2_SEL_TGT_COMPOSE:
-		config = vsp1_entity_get_pad_config(&brx->entity, sd_state,
-						    sel->which);
-		if (!config)
+		state = vsp1_entity_get_state(&brx->entity, sd_state,
+					      sel->which);
+		if (!state)
 			return -EINVAL;
 
 		mutex_lock(&brx->entity.lock);
-		sel->r = *brx_get_compose(brx, config, sel->pad);
+		sel->r = *brx_get_compose(brx, state, sel->pad);
 		mutex_unlock(&brx->entity.lock);
 		return 0;
 
@@ -220,7 +219,7 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_brx *brx = to_brx(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *compose;
 	int ret = 0;
@@ -233,9 +232,8 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&brx->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&brx->entity, sd_state,
-					    sel->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&brx->entity, sd_state, sel->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
@@ -244,7 +242,7 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 	 * The compose rectangle top left corner must be inside the output
 	 * frame.
 	 */
-	format = vsp1_entity_get_pad_format(&brx->entity, config,
+	format = vsp1_entity_get_pad_format(&brx->entity, state,
 					    brx->entity.source_pad);
 	sel->r.left = clamp_t(unsigned int, sel->r.left, 0, format->width - 1);
 	sel->r.top = clamp_t(unsigned int, sel->r.top, 0, format->height - 1);
@@ -253,11 +251,11 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 	 * Scaling isn't supported, the compose rectangle size must be identical
 	 * to the sink format size.
 	 */
-	format = vsp1_entity_get_pad_format(&brx->entity, config, sel->pad);
+	format = vsp1_entity_get_pad_format(&brx->entity, state, sel->pad);
 	sel->r.width = format->width;
 	sel->r.height = format->height;
 
-	compose = brx_get_compose(brx, config, sel->pad);
+	compose = brx_get_compose(brx, state, sel->pad);
 	*compose = sel->r;
 
 done:
@@ -293,7 +291,7 @@ static void brx_configure_stream(struct vsp1_entity *entity,
 	unsigned int flags;
 	unsigned int i;
 
-	format = vsp1_entity_get_pad_format(&brx->entity, brx->entity.config,
+	format = vsp1_entity_get_pad_format(&brx->entity, brx->entity.state,
 					    brx->entity.source_pad);
 
 	/*
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index d5a49e08a607..0280b8ff7ba9 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -101,27 +101,26 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
  */
 
 /**
- * vsp1_entity_get_pad_config - Get the pad configuration for an entity
+ * vsp1_entity_get_state - Get the subdev state for an entity
  * @entity: the entity
  * @sd_state: the TRY state
- * @which: configuration selector (ACTIVE or TRY)
+ * @which: state selector (ACTIVE or TRY)
  *
  * When called with which set to V4L2_SUBDEV_FORMAT_ACTIVE the caller must hold
  * the entity lock to access the returned configuration.
  *
- * Return the pad configuration requested by the which argument. The TRY
- * configuration is passed explicitly to the function through the cfg argument
- * and simply returned when requested. The ACTIVE configuration comes from the
- * entity structure.
+ * Return the subdev state requested by the which argument. The TRY state is
+ * passed explicitly to the function through the sd_state argument and simply
+ * returned when requested. The ACTIVE state comes from the entity structure.
  */
 struct v4l2_subdev_state *
-vsp1_entity_get_pad_config(struct vsp1_entity *entity,
-			   struct v4l2_subdev_state *sd_state,
-			   enum v4l2_subdev_format_whence which)
+vsp1_entity_get_state(struct vsp1_entity *entity,
+		      struct v4l2_subdev_state *sd_state,
+		      enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return entity->config;
+		return entity->state;
 	case V4L2_SUBDEV_FORMAT_TRY:
 	default:
 		return sd_state;
@@ -174,10 +173,11 @@ vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
 /*
  * vsp1_entity_init_cfg - Initialize formats on all pads
  * @subdev: V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  *
- * Initialize all pad formats with default values in the given pad config. This
- * function can be used as a handler for the subdev pad::init_cfg operation.
+ * Initialize all pad formats with default values in the given subdev state.
+ * This function can be used as a handler for the subdev pad::init_cfg
+ * operation.
  */
 int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
 			 struct v4l2_subdev_state *sd_state)
@@ -200,7 +200,7 @@ int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
 /*
  * vsp1_subdev_get_pad_format - Subdev pad get_fmt handler
  * @subdev: V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: V4L2 subdev format
  *
  * This function implements the subdev get_fmt pad operation. It can be used as
@@ -211,14 +211,14 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 
-	config = vsp1_entity_get_pad_config(entity, sd_state, fmt->which);
-	if (!config)
+	state = vsp1_entity_get_state(entity, sd_state, fmt->which);
+	if (!state)
 		return -EINVAL;
 
 	mutex_lock(&entity->lock);
-	fmt->format = *vsp1_entity_get_pad_format(entity, config, fmt->pad);
+	fmt->format = *vsp1_entity_get_pad_format(entity, state, fmt->pad);
 	mutex_unlock(&entity->lock);
 
 	return 0;
@@ -227,7 +227,7 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
 /*
  * vsp1_subdev_enum_mbus_code - Subdev pad enum_mbus_code handler
  * @subdev: V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code: Media bus code enumeration
  * @codes: Array of supported media bus codes
  * @ncodes: Number of supported media bus codes
@@ -250,7 +250,7 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 
 		code->code = codes[code->index];
 	} else {
-		struct v4l2_subdev_state *config;
+		struct v4l2_subdev_state *state;
 		struct v4l2_mbus_framefmt *format;
 
 		/*
@@ -260,13 +260,12 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 		if (code->index)
 			return -EINVAL;
 
-		config = vsp1_entity_get_pad_config(entity, sd_state,
-						    code->which);
-		if (!config)
+		state = vsp1_entity_get_state(entity, sd_state, code->which);
+		if (!state)
 			return -EINVAL;
 
 		mutex_lock(&entity->lock);
-		format = vsp1_entity_get_pad_format(entity, config, 0);
+		format = vsp1_entity_get_pad_format(entity, state, 0);
 		code->code = format->code;
 		mutex_unlock(&entity->lock);
 	}
@@ -277,7 +276,7 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 /*
  * vsp1_subdev_enum_frame_size - Subdev pad enum_frame_size handler
  * @subdev: V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fse: Frame size enumeration
  * @min_width: Minimum image width
  * @min_height: Minimum image height
@@ -296,15 +295,15 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
 				unsigned int max_width, unsigned int max_height)
 {
 	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
-	config = vsp1_entity_get_pad_config(entity, sd_state, fse->which);
-	if (!config)
+	state = vsp1_entity_get_state(entity, sd_state, fse->which);
+	if (!state)
 		return -EINVAL;
 
-	format = vsp1_entity_get_pad_format(entity, config, fse->pad);
+	format = vsp1_entity_get_pad_format(entity, state, fse->pad);
 
 	mutex_lock(&entity->lock);
 
@@ -337,7 +336,7 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
 /*
  * vsp1_subdev_set_pad_format - Subdev pad set_fmt handler
  * @subdev: V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: V4L2 subdev format
  * @codes: Array of supported media bus codes
  * @ncodes: Number of supported media bus codes
@@ -360,7 +359,7 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 			       unsigned int max_width, unsigned int max_height)
 {
 	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *selection;
 	unsigned int i;
@@ -368,13 +367,13 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 
 	mutex_lock(&entity->lock);
 
-	config = vsp1_entity_get_pad_config(entity, sd_state, fmt->which);
-	if (!config) {
+	state = vsp1_entity_get_state(entity, sd_state, fmt->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
 
-	format = vsp1_entity_get_pad_format(entity, config, fmt->pad);
+	format = vsp1_entity_get_pad_format(entity, state, fmt->pad);
 
 	if (fmt->pad == entity->source_pad) {
 		/* The output format can't be modified. */
@@ -402,18 +401,18 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 	fmt->format = *format;
 
 	/* Propagate the format to the source pad. */
-	format = vsp1_entity_get_pad_format(entity, config, entity->source_pad);
+	format = vsp1_entity_get_pad_format(entity, state, entity->source_pad);
 	*format = fmt->format;
 
 	/* Reset the crop and compose rectangles. */
-	selection = vsp1_entity_get_pad_selection(entity, config, fmt->pad,
+	selection = vsp1_entity_get_pad_selection(entity, state, fmt->pad,
 						  V4L2_SEL_TGT_CROP);
 	selection->left = 0;
 	selection->top = 0;
 	selection->width = format->width;
 	selection->height = format->height;
 
-	selection = vsp1_entity_get_pad_selection(entity, config, fmt->pad,
+	selection = vsp1_entity_get_pad_selection(entity, state, fmt->pad,
 						  V4L2_SEL_TGT_COMPOSE);
 	selection->left = 0;
 	selection->top = 0;
@@ -670,18 +669,18 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	vsp1_entity_init_cfg(subdev, NULL);
 
 	/*
-	 * Allocate the pad configuration to store formats and selection
+	 * Allocate the subdev state to store formats and selection
 	 * rectangles.
 	 */
 	/*
 	 * FIXME: Drop this call, drivers are not supposed to use
 	 * __v4l2_subdev_state_alloc().
 	 */
-	entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
-						   "vsp1:config->lock", &key);
-	if (IS_ERR(entity->config)) {
+	entity->state = __v4l2_subdev_state_alloc(&entity->subdev,
+						  "vsp1:state->lock", &key);
+	if (IS_ERR(entity->state)) {
 		media_entity_cleanup(&entity->subdev.entity);
-		return PTR_ERR(entity->config);
+		return PTR_ERR(entity->state);
 	}
 
 	return 0;
@@ -693,6 +692,6 @@ void vsp1_entity_destroy(struct vsp1_entity *entity)
 		entity->ops->destroy(entity);
 	if (entity->subdev.ctrl_handler)
 		v4l2_ctrl_handler_free(entity->subdev.ctrl_handler);
-	__v4l2_subdev_state_free(entity->config);
+	__v4l2_subdev_state_free(entity->state);
 	media_entity_cleanup(&entity->subdev.entity);
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index 17f98a6a972e..8c737cadee81 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -115,9 +115,9 @@ struct vsp1_entity {
 	unsigned int sink_pad;
 
 	struct v4l2_subdev subdev;
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 
-	struct mutex lock;	/* Protects the pad config */
+	struct mutex lock;	/* Protects the state */
 };
 
 static inline struct vsp1_entity *to_vsp1_entity(struct v4l2_subdev *subdev)
@@ -135,9 +135,9 @@ int vsp1_entity_link_setup(struct media_entity *entity,
 			   const struct media_pad *remote, u32 flags);
 
 struct v4l2_subdev_state *
-vsp1_entity_get_pad_config(struct vsp1_entity *entity,
-			   struct v4l2_subdev_state *sd_state,
-			   enum v4l2_subdev_format_whence which);
+vsp1_entity_get_state(struct vsp1_entity *entity,
+		      struct v4l2_subdev_state *sd_state,
+		      enum v4l2_subdev_format_whence which);
 struct v4l2_mbus_framefmt *
 vsp1_entity_get_pad_format(struct vsp1_entity *entity,
 			   struct v4l2_subdev_state *sd_state,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index f22449dd654c..71155282ca11 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -203,7 +203,7 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	int ret = 0;
@@ -213,9 +213,8 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&histo->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&histo->entity, sd_state,
-					    sel->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&histo->entity, sd_state, sel->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
@@ -223,7 +222,7 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 	switch (sel->target) {
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
-		crop = vsp1_entity_get_pad_selection(&histo->entity, config,
+		crop = vsp1_entity_get_pad_selection(&histo->entity, state,
 						     HISTO_PAD_SINK,
 						     V4L2_SEL_TGT_CROP);
 		sel->r.left = 0;
@@ -234,7 +233,7 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
-		format = vsp1_entity_get_pad_format(&histo->entity, config,
+		format = vsp1_entity_get_pad_format(&histo->entity, state,
 						    HISTO_PAD_SINK);
 		sel->r.left = 0;
 		sel->r.top = 0;
@@ -244,7 +243,7 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 
 	case V4L2_SEL_TGT_COMPOSE:
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *vsp1_entity_get_pad_selection(&histo->entity, config,
+		sel->r = *vsp1_entity_get_pad_selection(&histo->entity, state,
 							sel->pad, sel->target);
 		break;
 
@@ -346,7 +345,7 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	int ret;
 
 	if (sel->pad != HISTO_PAD_SINK)
@@ -354,17 +353,16 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&histo->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&histo->entity, sd_state,
-					    sel->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&histo->entity, sd_state, sel->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
 
 	if (sel->target == V4L2_SEL_TGT_CROP)
-		ret = histo_set_crop(subdev, config, sel);
+		ret = histo_set_crop(subdev, state, sel);
 	else if (sel->target == V4L2_SEL_TGT_COMPOSE)
-		ret = histo_set_compose(subdev, config, sel);
+		ret = histo_set_compose(subdev, state, sel);
 	else
 		ret = -EINVAL;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
index 361a870380c2..6342ac7bdf54 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
@@ -66,20 +66,19 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_hsit *hsit = to_hsit(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
 	mutex_lock(&hsit->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&hsit->entity, sd_state,
-					    fmt->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&hsit->entity, sd_state, fmt->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
 
-	format = vsp1_entity_get_pad_format(&hsit->entity, config, fmt->pad);
+	format = vsp1_entity_get_pad_format(&hsit->entity, state, fmt->pad);
 
 	if (fmt->pad == HSIT_PAD_SOURCE) {
 		/*
@@ -102,7 +101,7 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
 	fmt->format = *format;
 
 	/* Propagate the format to the source pad. */
-	format = vsp1_entity_get_pad_format(&hsit->entity, config,
+	format = vsp1_entity_get_pad_format(&hsit->entity, state,
 					    HSIT_PAD_SOURCE);
 	*format = fmt->format;
 	format->code = hsit->inverse ? MEDIA_BUS_FMT_ARGB8888_1X32
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index ae7ff8d5ecf1..16941ff9dbdd 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -61,15 +61,14 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
 	mutex_lock(&rwpf->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&rwpf->entity, sd_state,
-					    fmt->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&rwpf->entity, sd_state, fmt->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
@@ -80,7 +79,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	    fmt->format.code != MEDIA_BUS_FMT_AYUV8_1X32)
 		fmt->format.code = MEDIA_BUS_FMT_AYUV8_1X32;
 
-	format = vsp1_entity_get_pad_format(&rwpf->entity, config, fmt->pad);
+	format = vsp1_entity_get_pad_format(&rwpf->entity, state, fmt->pad);
 
 	if (fmt->pad == RWPF_PAD_SOURCE) {
 		/*
@@ -106,7 +105,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 		struct v4l2_rect *crop;
 
 		/* Update the sink crop rectangle. */
-		crop = vsp1_rwpf_get_crop(rwpf, config);
+		crop = vsp1_rwpf_get_crop(rwpf, state);
 		crop->left = 0;
 		crop->top = 0;
 		crop->width = fmt->format.width;
@@ -114,7 +113,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	}
 
 	/* Propagate the format to the source pad. */
-	format = vsp1_entity_get_pad_format(&rwpf->entity, config,
+	format = vsp1_entity_get_pad_format(&rwpf->entity, state,
 					    RWPF_PAD_SOURCE);
 	*format = fmt->format;
 
@@ -133,7 +132,7 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
@@ -146,20 +145,19 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&rwpf->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&rwpf->entity, sd_state,
-					    sel->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&rwpf->entity, sd_state, sel->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *vsp1_rwpf_get_crop(rwpf, config);
+		sel->r = *vsp1_rwpf_get_crop(rwpf, state);
 		break;
 
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		format = vsp1_entity_get_pad_format(&rwpf->entity, config,
+		format = vsp1_entity_get_pad_format(&rwpf->entity, state,
 						    RWPF_PAD_SINK);
 		sel->r.left = 0;
 		sel->r.top = 0;
@@ -182,7 +180,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	int ret = 0;
@@ -199,15 +197,14 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&rwpf->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&rwpf->entity, sd_state,
-					    sel->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&rwpf->entity, sd_state, sel->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
 
 	/* Make sure the crop rectangle is entirely contained in the image. */
-	format = vsp1_entity_get_pad_format(&rwpf->entity, config,
+	format = vsp1_entity_get_pad_format(&rwpf->entity, state,
 					    RWPF_PAD_SINK);
 
 	/*
@@ -228,11 +225,11 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	sel->r.height = min_t(unsigned int, sel->r.height,
 			      format->height - sel->r.top);
 
-	crop = vsp1_rwpf_get_crop(rwpf, config);
+	crop = vsp1_rwpf_get_crop(rwpf, state);
 	*crop = sel->r;
 
 	/* Propagate the format to the source pad. */
-	format = vsp1_entity_get_pad_format(&rwpf->entity, config,
+	format = vsp1_entity_get_pad_format(&rwpf->entity, state,
 					    RWPF_PAD_SOURCE);
 	format->width = crop->width;
 	format->height = crop->height;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index b614a2aea461..2dd6f8575614 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -123,16 +123,15 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct vsp1_sru *sru = to_sru(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
-	config = vsp1_entity_get_pad_config(&sru->entity, sd_state,
-					    fse->which);
-	if (!config)
+	state = vsp1_entity_get_state(&sru->entity, sd_state, fse->which);
+	if (!state)
 		return -EINVAL;
 
-	format = vsp1_entity_get_pad_format(&sru->entity, config, SRU_PAD_SINK);
+	format = vsp1_entity_get_pad_format(&sru->entity, state, SRU_PAD_SINK);
 
 	mutex_lock(&sru->entity.lock);
 
@@ -221,31 +220,30 @@ static int sru_set_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_sru *sru = to_sru(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
 	mutex_lock(&sru->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&sru->entity, sd_state,
-					    fmt->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&sru->entity, sd_state, fmt->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
 
-	sru_try_format(sru, config, fmt->pad, &fmt->format);
+	sru_try_format(sru, state, fmt->pad, &fmt->format);
 
-	format = vsp1_entity_get_pad_format(&sru->entity, config, fmt->pad);
+	format = vsp1_entity_get_pad_format(&sru->entity, state, fmt->pad);
 	*format = fmt->format;
 
 	if (fmt->pad == SRU_PAD_SINK) {
 		/* Propagate the format to the source pad. */
-		format = vsp1_entity_get_pad_format(&sru->entity, config,
+		format = vsp1_entity_get_pad_format(&sru->entity, state,
 						    SRU_PAD_SOURCE);
 		*format = fmt->format;
 
-		sru_try_format(sru, config, SRU_PAD_SOURCE, format);
+		sru_try_format(sru, state, SRU_PAD_SOURCE, format);
 	}
 
 done:
@@ -280,9 +278,9 @@ static void sru_configure_stream(struct vsp1_entity *entity,
 	struct v4l2_mbus_framefmt *output;
 	u32 ctrl0;
 
-	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.config,
+	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
 					   SRU_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.config,
+	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
 					    SRU_PAD_SOURCE);
 
 	if (input->code == MEDIA_BUS_FMT_ARGB8888_1X32)
@@ -310,9 +308,9 @@ static unsigned int sru_max_width(struct vsp1_entity *entity,
 	struct v4l2_mbus_framefmt *input;
 	struct v4l2_mbus_framefmt *output;
 
-	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.config,
+	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
 					   SRU_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.config,
+	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
 					    SRU_PAD_SOURCE);
 
 	/*
@@ -336,9 +334,9 @@ static void sru_partition(struct vsp1_entity *entity,
 	struct v4l2_mbus_framefmt *input;
 	struct v4l2_mbus_framefmt *output;
 
-	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.config,
+	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
 					   SRU_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.config,
+	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
 					    SRU_PAD_SOURCE);
 
 	/* Adapt if SRUx2 is enabled. */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index 1c290cda005a..59ff4ae46cea 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -128,17 +128,15 @@ static int uds_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct vsp1_uds *uds = to_uds(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
-	config = vsp1_entity_get_pad_config(&uds->entity, sd_state,
-					    fse->which);
-	if (!config)
+	state = vsp1_entity_get_state(&uds->entity, sd_state, fse->which);
+	if (!state)
 		return -EINVAL;
 
-	format = vsp1_entity_get_pad_format(&uds->entity, config,
-					    UDS_PAD_SINK);
+	format = vsp1_entity_get_pad_format(&uds->entity, state, UDS_PAD_SINK);
 
 	mutex_lock(&uds->entity.lock);
 
@@ -205,31 +203,30 @@ static int uds_set_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_uds *uds = to_uds(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
 	mutex_lock(&uds->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&uds->entity, sd_state,
-					    fmt->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&uds->entity, sd_state, fmt->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
 
-	uds_try_format(uds, config, fmt->pad, &fmt->format);
+	uds_try_format(uds, state, fmt->pad, &fmt->format);
 
-	format = vsp1_entity_get_pad_format(&uds->entity, config, fmt->pad);
+	format = vsp1_entity_get_pad_format(&uds->entity, state, fmt->pad);
 	*format = fmt->format;
 
 	if (fmt->pad == UDS_PAD_SINK) {
 		/* Propagate the format to the source pad. */
-		format = vsp1_entity_get_pad_format(&uds->entity, config,
+		format = vsp1_entity_get_pad_format(&uds->entity, state,
 						    UDS_PAD_SOURCE);
 		*format = fmt->format;
 
-		uds_try_format(uds, config, UDS_PAD_SOURCE, format);
+		uds_try_format(uds, state, UDS_PAD_SOURCE, format);
 	}
 
 done:
@@ -269,9 +266,9 @@ static void uds_configure_stream(struct vsp1_entity *entity,
 	unsigned int vscale;
 	bool multitap;
 
-	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
+	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
 					   UDS_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
+	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
 					    UDS_PAD_SOURCE);
 
 	hscale = uds_compute_ratio(input->width, output->width);
@@ -314,7 +311,7 @@ static void uds_configure_partition(struct vsp1_entity *entity,
 	struct vsp1_partition *partition = pipe->partition;
 	const struct v4l2_mbus_framefmt *output;
 
-	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
+	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
 					    UDS_PAD_SOURCE);
 
 	/* Input size clipping. */
@@ -339,9 +336,9 @@ static unsigned int uds_max_width(struct vsp1_entity *entity,
 	const struct v4l2_mbus_framefmt *input;
 	unsigned int hscale;
 
-	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
+	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
 					   UDS_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
+	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
 					    UDS_PAD_SOURCE);
 	hscale = output->width / input->width;
 
@@ -381,9 +378,9 @@ static void uds_partition(struct vsp1_entity *entity,
 	partition->uds_sink = *window;
 	partition->uds_source = *window;
 
-	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
+	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
 					   UDS_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
+	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
 					    UDS_PAD_SOURCE);
 
 	partition->uds_sink.width = window->width * input->width
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
index 83d7f17df80e..d84d10f35090 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
@@ -86,7 +86,7 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_uif *uif = to_uif(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
@@ -95,9 +95,8 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&uif->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&uif->entity, sd_state,
-					    sel->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&uif->entity, sd_state, sel->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
@@ -105,7 +104,7 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
-		format = vsp1_entity_get_pad_format(&uif->entity, config,
+		format = vsp1_entity_get_pad_format(&uif->entity, state,
 						    UIF_PAD_SINK);
 		sel->r.left = 0;
 		sel->r.top = 0;
@@ -114,7 +113,7 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
 		break;
 
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *vsp1_entity_get_pad_selection(&uif->entity, config,
+		sel->r = *vsp1_entity_get_pad_selection(&uif->entity, state,
 							sel->pad, sel->target);
 		break;
 
@@ -133,7 +132,7 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_uif *uif = to_uif(subdev);
-	struct v4l2_subdev_state *config;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *selection;
 	int ret = 0;
@@ -144,15 +143,14 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&uif->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&uif->entity, sd_state,
-					    sel->which);
-	if (!config) {
+	state = vsp1_entity_get_state(&uif->entity, sd_state, sel->which);
+	if (!state) {
 		ret = -EINVAL;
 		goto done;
 	}
 
 	/* The crop rectangle must be inside the input frame. */
-	format = vsp1_entity_get_pad_format(&uif->entity, config, UIF_PAD_SINK);
+	format = vsp1_entity_get_pad_format(&uif->entity, state, UIF_PAD_SINK);
 
 	sel->r.left = clamp_t(unsigned int, sel->r.left, 0, format->width - 1);
 	sel->r.top = clamp_t(unsigned int, sel->r.top, 0, format->height - 1);
@@ -162,7 +160,7 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
 				format->height - sel->r.top);
 
 	/* Store the crop rectangle. */
-	selection = vsp1_entity_get_pad_selection(&uif->entity, config,
+	selection = vsp1_entity_get_pad_selection(&uif->entity, state,
 						  sel->pad, V4L2_SEL_TGT_CROP);
 	*selection = sel->r;
 
@@ -206,7 +204,7 @@ static void uif_configure_stream(struct vsp1_entity *entity,
 	vsp1_uif_write(uif, dlb, VI6_UIF_DISCOM_DOCMPMR,
 		       VI6_UIF_DISCOM_DOCMPMR_SEL(9));
 
-	crop = vsp1_entity_get_pad_selection(entity, entity->config,
+	crop = vsp1_entity_get_pad_selection(entity, entity->state,
 					     UIF_PAD_SINK, V4L2_SEL_TGT_CROP);
 
 	left = crop->left;
-- 
Regards,

Laurent Pinchart

