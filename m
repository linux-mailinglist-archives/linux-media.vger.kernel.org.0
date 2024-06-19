Return-Path: <linux-media+bounces-13641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C24490E0B1
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D356BB212CC
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27050EAF9;
	Wed, 19 Jun 2024 00:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vGuIAzLc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0C0E545;
	Wed, 19 Jun 2024 00:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756299; cv=none; b=agBan5lkydHukHa3iYt0qLKDMQg6wPkykcxO1Nie/F8FWKkKFCBIMt8ZEadb9PX7sTarWWtSUgSnckFZIDF3tuGHAsiiaQZeW3BRE/pYOpS8HKagf8zWut57NqUWeIsWwQ3ZRQ3m+czpFfxufBaru3IfE6K/eAXG+BeI4vMtPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756299; c=relaxed/simple;
	bh=PenrlLNHJm8HgU4TMREB3Z0nOitLDIM329PsffczfZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQKEfzDX2K3uUfAn9yoNVullfMcgzSXjPK69Q0JNWtFPdamsz3/3AyCLjFbRx/kp8glQUwyEdF8oEf4yOo+9FughsBC8st1YkZ4McFQs5iDWFjr0ly2ypJ1diRSVhP4wwby5N3fgcC36caCkhJTuo96faBt4FIsq+0S+TN9QGxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vGuIAzLc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D15E1267;
	Wed, 19 Jun 2024 02:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756271;
	bh=PenrlLNHJm8HgU4TMREB3Z0nOitLDIM329PsffczfZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vGuIAzLcWzJXUg1NKNA8fb8jMBzLUxxNN0f7j7RBIvW9ebJjltERpVqiOpVsjCTxo
	 Yjoj53c2b/bV/j9bRCUmKUJWkS23KNpyPtPikhHj7Ez0QBj64H0ede73+zKWAbVFrp
	 Okahs/U6ywaj3Ovj/VcLo0VUEceuto+lGsBxcvXQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 18/19] media: renesas: vsp1: Switch to V4L2 subdev active state
Date: Wed, 19 Jun 2024 03:17:21 +0300
Message-ID: <20240619001722.9749-19-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the subdev state stored in the vsp1_entity structure with the
active state managed by the V4L2 subdev core. This simplifies both code
for individual subdevs and core VSP1 code, as shown by the diffstat. The
only piece of code whose complexity increases is the display pipeline
management, in vsp1_du_pipeline_configure(), which has to lock and
unlock states manually.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_brx.c    |  46 ++----
 .../media/platform/renesas/vsp1/vsp1_clu.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_drm.c    |  31 +++-
 .../media/platform/renesas/vsp1/vsp1_entity.c | 134 ++----------------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  18 +--
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |   2 +
 .../media/platform/renesas/vsp1/vsp1_hgt.c    |   2 +
 .../media/platform/renesas/vsp1/vsp1_histo.c  |  46 ++----
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  20 +--
 .../media/platform/renesas/vsp1/vsp1_lif.c    |   2 +-
 .../media/platform/renesas/vsp1/vsp1_lut.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  16 ++-
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |   6 +-
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  57 ++------
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  41 ++----
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  39 +----
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  39 +----
 .../media/platform/renesas/vsp1/vsp1_video.c  |  15 +-
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  11 +-
 19 files changed, 136 insertions(+), 397 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 5dee0490c593..849012b178f4 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -125,21 +125,11 @@ static void brx_try_format(struct vsp1_brx *brx,
 }
 
 static int brx_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_brx *brx = to_brx(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
-
-	mutex_lock(&brx->entity.lock);
-
-	state = vsp1_entity_get_state(&brx->entity, sd_state, fmt->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
 
 	brx_try_format(brx, state, fmt->pad, &fmt->format);
 
@@ -167,17 +157,14 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 		}
 	}
 
-done:
-	mutex_unlock(&brx->entity.lock);
-	return ret;
+	return 0;
 }
 
 static int brx_get_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_brx *brx = to_brx(subdev);
-	struct v4l2_subdev_state *state;
 
 	if (sel->pad == brx->entity.source_pad)
 		return -EINVAL;
@@ -191,14 +178,7 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 		return 0;
 
 	case V4L2_SEL_TGT_COMPOSE:
-		state = vsp1_entity_get_state(&brx->entity, sd_state,
-					      sel->which);
-		if (!state)
-			return -EINVAL;
-
-		mutex_lock(&brx->entity.lock);
 		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
-		mutex_unlock(&brx->entity.lock);
 		return 0;
 
 	default:
@@ -207,14 +187,12 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int brx_set_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_brx *brx = to_brx(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *compose;
-	int ret = 0;
 
 	if (sel->pad == brx->entity.source_pad)
 		return -EINVAL;
@@ -222,14 +200,6 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 	if (sel->target != V4L2_SEL_TGT_COMPOSE)
 		return -EINVAL;
 
-	mutex_lock(&brx->entity.lock);
-
-	state = vsp1_entity_get_state(&brx->entity, sd_state, sel->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
-
 	/*
 	 * The compose rectangle top left corner must be inside the output
 	 * frame.
@@ -249,15 +219,13 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 	compose = v4l2_subdev_state_get_compose(state, sel->pad);
 	*compose = sel->r;
 
-done:
-	mutex_unlock(&brx->entity.lock);
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops brx_pad_ops = {
 	.enum_mbus_code = brx_enum_mbus_code,
 	.enum_frame_size = brx_enum_frame_size,
-	.get_fmt = vsp1_subdev_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = brx_set_format,
 	.get_selection = brx_get_selection,
 	.set_selection = brx_set_selection,
@@ -425,6 +393,8 @@ struct vsp1_brx *vsp1_brx_create(struct vsp1_device *vsp1,
 
 	/* Initialize the control handler. */
 	v4l2_ctrl_handler_init(&brx->ctrls, 1);
+	brx->ctrls.lock = &brx->entity.subdev.active_state->_lock;
+
 	v4l2_ctrl_new_std(&brx->ctrls, &brx_ctrl_ops, V4L2_CID_BG_COLOR,
 			  0, 0xffffff, 1, 0);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
index 98645bd2a983..d1340e3f3e69 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
@@ -157,7 +157,7 @@ static int clu_set_format(struct v4l2_subdev *subdev,
 static const struct v4l2_subdev_pad_ops clu_pad_ops = {
 	.enum_mbus_code = clu_enum_mbus_code,
 	.enum_frame_size = clu_enum_frame_size,
-	.get_fmt = vsp1_subdev_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = clu_set_format,
 };
 
@@ -266,6 +266,8 @@ struct vsp1_clu *vsp1_clu_create(struct vsp1_device *vsp1)
 
 	/* Initialize the control handler. */
 	v4l2_ctrl_handler_init(&clu->ctrls, 2);
+	clu->ctrls.lock = &clu->entity.subdev.active_state->_lock;
+
 	v4l2_ctrl_new_custom(&clu->ctrls, &clu_table_control, NULL);
 	v4l2_ctrl_new_custom(&clu->ctrls, &clu_mode_control, NULL);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index b5d1f238f7be..0884312da752 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -550,9 +550,6 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
 	struct vsp1_dl_body *dlb;
 	unsigned int dl_flags = 0;
 
-	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
-					  drm_pipe->width, 0);
-
 	if (drm_pipe->force_brx_release)
 		dl_flags |= VSP1_DL_FRAME_END_INTERNAL;
 	if (pipe->output->writeback)
@@ -561,8 +558,11 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
 	dl = vsp1_dl_list_get(pipe->output->dlm);
 	dlb = vsp1_dl_list_get_body0(dl);
 
+	/*
+	 * Lock the state for all entities in the pipeline, disconnecting
+	 * unused entities along the way.
+	 */
 	list_for_each_entry_safe(entity, next, &pipe->entities, list_pipe) {
-		/* Disconnect unused entities from the pipeline. */
 		if (!entity->pipe) {
 			vsp1_dl_body_write(dlb, entity->route->reg,
 					   VI6_DPR_NODE_UNUSED);
@@ -573,14 +573,33 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
 			continue;
 		}
 
+		v4l2_subdev_get_locked_active_state(&entity->subdev);
+	}
+
+	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
+					  drm_pipe->width, 0);
+
+	/* Configure the pipeline. */
+	list_for_each_entry(entity, &pipe->entities, list_pipe) {
+		struct v4l2_subdev_state *state;
+
+		state = v4l2_subdev_get_locked_active_state(&entity->subdev);
+
 		vsp1_entity_route_setup(entity, pipe, dlb);
-		vsp1_entity_configure_stream(entity, entity->state, pipe,
-					     dl, dlb);
+		vsp1_entity_configure_stream(entity, state, pipe, dl, dlb);
 		vsp1_entity_configure_frame(entity, pipe, dl, dlb);
 		vsp1_entity_configure_partition(entity, pipe,
 						&pipe->part_table[0], dl, dlb);
 	}
 
+	/* Unlock all states. */
+	list_for_each_entry_reverse(entity, &pipe->entities, list_pipe) {
+		struct v4l2_subdev_state *state;
+
+		state = v4l2_subdev_get_unlocked_active_state(&entity->subdev);
+		v4l2_subdev_unlock_state(state);
+	}
+
 	vsp1_dl_list_commit(dl, dl_flags);
 }
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 8b8945bd8f10..f4e6e2f27182 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -103,64 +103,10 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
  * V4L2 Subdevice Operations
  */
 
-/**
- * vsp1_entity_get_state - Get the subdev state for an entity
- * @entity: the entity
- * @sd_state: the TRY state
- * @which: state selector (ACTIVE or TRY)
- *
- * When called with which set to V4L2_SUBDEV_FORMAT_ACTIVE the caller must hold
- * the entity lock to access the returned configuration.
- *
- * Return the subdev state requested by the which argument. The TRY state is
- * passed explicitly to the function through the sd_state argument and simply
- * returned when requested. The ACTIVE state comes from the entity structure.
- */
-struct v4l2_subdev_state *
-vsp1_entity_get_state(struct vsp1_entity *entity,
-		      struct v4l2_subdev_state *sd_state,
-		      enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return entity->state;
-	case V4L2_SUBDEV_FORMAT_TRY:
-	default:
-		return sd_state;
-	}
-}
-
-/*
- * vsp1_subdev_get_pad_format - Subdev pad get_fmt handler
- * @subdev: V4L2 subdevice
- * @sd_state: V4L2 subdev state
- * @fmt: V4L2 subdev format
- *
- * This function implements the subdev get_fmt pad operation. It can be used as
- * a direct drop-in for the operation handler.
- */
-int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_format *fmt)
-{
-	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-	struct v4l2_subdev_state *state;
-
-	state = vsp1_entity_get_state(entity, sd_state, fmt->which);
-	if (!state)
-		return -EINVAL;
-
-	mutex_lock(&entity->lock);
-	fmt->format = *v4l2_subdev_state_get_format(state, fmt->pad);
-	mutex_unlock(&entity->lock);
-
-	return 0;
-}
-
 /*
  * vsp1_subdev_enum_mbus_code - Subdev pad enum_mbus_code handler
  * @subdev: V4L2 subdevice
- * @sd_state: V4L2 subdev state
+ * @state: V4L2 subdev state
  * @code: Media bus code enumeration
  * @codes: Array of supported media bus codes
  * @ncodes: Number of supported media bus codes
@@ -171,19 +117,16 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
  * the sink pad.
  */
 int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_mbus_code_enum *code,
 			       const unsigned int *codes, unsigned int ncodes)
 {
-	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-
 	if (code->pad == 0) {
 		if (code->index >= ncodes)
 			return -EINVAL;
 
 		code->code = codes[code->index];
 	} else {
-		struct v4l2_subdev_state *state;
 		struct v4l2_mbus_framefmt *format;
 
 		/*
@@ -193,14 +136,8 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 		if (code->index)
 			return -EINVAL;
 
-		state = vsp1_entity_get_state(entity, sd_state, code->which);
-		if (!state)
-			return -EINVAL;
-
-		mutex_lock(&entity->lock);
 		format = v4l2_subdev_state_get_format(state, 0);
 		code->code = format->code;
-		mutex_unlock(&entity->lock);
 	}
 
 	return 0;
@@ -209,7 +146,7 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 /*
  * vsp1_subdev_enum_frame_size - Subdev pad enum_frame_size handler
  * @subdev: V4L2 subdevice
- * @sd_state: V4L2 subdev state
+ * @state: V4L2 subdev state
  * @fse: Frame size enumeration
  * @min_width: Minimum image width
  * @min_height: Minimum image height
@@ -222,28 +159,17 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
  * source pad size identical to the sink pad.
  */
 int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_frame_size_enum *fse,
 				unsigned int min_width, unsigned int min_height,
 				unsigned int max_width, unsigned int max_height)
 {
-	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
-
-	state = vsp1_entity_get_state(entity, sd_state, fse->which);
-	if (!state)
-		return -EINVAL;
 
 	format = v4l2_subdev_state_get_format(state, fse->pad);
 
-	mutex_lock(&entity->lock);
-
-	if (fse->index || fse->code != format->code) {
-		ret = -EINVAL;
-		goto done;
-	}
+	if (fse->index || fse->code != format->code)
+		return -EINVAL;
 
 	if (fse->pad == 0) {
 		fse->min_width = min_width;
@@ -261,15 +187,13 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
 		fse->max_height = format->height;
 	}
 
-done:
-	mutex_unlock(&entity->lock);
-	return ret;
+	return 0;
 }
 
 /*
  * vsp1_subdev_set_pad_format - Subdev pad set_fmt handler
  * @subdev: V4L2 subdevice
- * @sd_state: V4L2 subdev state
+ * @state: V4L2 subdev state
  * @fmt: V4L2 subdev format
  * @codes: Array of supported media bus codes
  * @ncodes: Number of supported media bus codes
@@ -285,33 +209,23 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
  * source pad.
  */
 int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *fmt,
 			       const unsigned int *codes, unsigned int ncodes,
 			       unsigned int min_width, unsigned int min_height,
 			       unsigned int max_width, unsigned int max_height)
 {
 	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *selection;
 	unsigned int i;
-	int ret = 0;
-
-	mutex_lock(&entity->lock);
-
-	state = vsp1_entity_get_state(entity, sd_state, fmt->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
 
 	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	if (fmt->pad == entity->source_pad) {
 		/* The output format can't be modified. */
 		fmt->format = *format;
-		goto done;
+		return 0;
 	}
 
 	/*
@@ -350,9 +264,7 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 	selection->width = format->width;
 	selection->height = format->height;
 
-done:
-	mutex_unlock(&entity->lock);
-	return ret;
+	return 0;
 }
 
 static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
@@ -364,8 +276,6 @@ static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
 	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
 		struct v4l2_subdev_format format = {
 			.pad = pad,
-			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-			       : V4L2_SUBDEV_FORMAT_ACTIVE,
 		};
 
 		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
@@ -563,7 +473,6 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 		     const char *name, unsigned int num_pads,
 		     const struct v4l2_subdev_ops *ops, u32 function)
 {
-	static struct lock_class_key key;
 	struct v4l2_subdev *subdev;
 	unsigned int i;
 	int ret;
@@ -579,8 +488,6 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	if (i == ARRAY_SIZE(vsp1_routes))
 		return -EINVAL;
 
-	mutex_init(&entity->lock);
-
 	entity->vsp1 = vsp1;
 	entity->source_pad = num_pads - 1;
 
@@ -621,21 +528,10 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	snprintf(subdev->name, sizeof(subdev->name), "%s %s",
 		 dev_name(vsp1->dev), name);
 
-	vsp1_entity_init_state(subdev, NULL);
-
-	/*
-	 * Allocate the subdev state to store formats and selection
-	 * rectangles.
-	 */
-	/*
-	 * FIXME: Drop this call, drivers are not supposed to use
-	 * __v4l2_subdev_state_alloc().
-	 */
-	entity->state = __v4l2_subdev_state_alloc(&entity->subdev,
-						  "vsp1:state->lock", &key);
-	if (IS_ERR(entity->state)) {
+	ret = v4l2_subdev_init_finalize(subdev);
+	if (ret) {
 		media_entity_cleanup(&entity->subdev.entity);
-		return PTR_ERR(entity->state);
+		return ret;
 	}
 
 	return 0;
@@ -647,6 +543,6 @@ void vsp1_entity_destroy(struct vsp1_entity *entity)
 		entity->ops->destroy(entity);
 	if (entity->subdev.ctrl_handler)
 		v4l2_ctrl_handler_free(entity->subdev.ctrl_handler);
-	__v4l2_subdev_state_free(entity->state);
+	v4l2_subdev_cleanup(&entity->subdev);
 	media_entity_cleanup(&entity->subdev.entity);
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index 1bcc9e27dfdc..411d264448d9 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -10,7 +10,6 @@
 #define __VSP1_ENTITY_H__
 
 #include <linux/list.h>
-#include <linux/mutex.h>
 
 #include <media/v4l2-subdev.h>
 
@@ -125,9 +124,6 @@ struct vsp1_entity {
 	unsigned int sink_pad;
 
 	struct v4l2_subdev subdev;
-	struct v4l2_subdev_state *state;
-
-	struct mutex lock;	/* Protects the state */
 };
 
 static inline struct vsp1_entity *to_vsp1_entity(struct v4l2_subdev *subdev)
@@ -144,11 +140,6 @@ int vsp1_entity_link_setup(struct media_entity *entity,
 			   const struct media_pad *local,
 			   const struct media_pad *remote, u32 flags);
 
-struct v4l2_subdev_state *
-vsp1_entity_get_state(struct vsp1_entity *entity,
-		      struct v4l2_subdev_state *sd_state,
-		      enum v4l2_subdev_format_whence which);
-
 void vsp1_entity_route_setup(struct vsp1_entity *entity,
 			     struct vsp1_pipeline *pipe,
 			     struct vsp1_dl_body *dlb);
@@ -172,21 +163,18 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
 
 struct media_pad *vsp1_entity_remote_pad(struct media_pad *pad);
 
-int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_format *fmt);
 int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *fmt,
 			       const unsigned int *codes, unsigned int ncodes,
 			       unsigned int min_width, unsigned int min_height,
 			       unsigned int max_width, unsigned int max_height);
 int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_mbus_code_enum *code,
 			       const unsigned int *codes, unsigned int ncodes);
 int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_frame_size_enum *fse,
 				unsigned int min_w, unsigned int min_h,
 				unsigned int max_w, unsigned int max_h);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
index 2c8ce7175a4e..561c86e889a9 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
@@ -205,6 +205,8 @@ struct vsp1_hgo *vsp1_hgo_create(struct vsp1_device *vsp1)
 	/* Initialize the control handler. */
 	v4l2_ctrl_handler_init(&hgo->ctrls.handler,
 			       vsp1->info->gen >= 3 ? 2 : 1);
+	hgo->ctrls.handler.lock = &hgo->histo.entity.subdev.active_state->_lock;
+
 	hgo->ctrls.max_rgb = v4l2_ctrl_new_custom(&hgo->ctrls.handler,
 						  &hgo_max_rgb_control, NULL);
 	if (vsp1->info->gen >= 3)
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
index 858f330d44fa..d26433fe54c6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
@@ -203,6 +203,8 @@ struct vsp1_hgt *vsp1_hgt_create(struct vsp1_device *vsp1)
 
 	/* Initialize the control handler. */
 	v4l2_ctrl_handler_init(&hgt->ctrls, 1);
+	hgt->ctrls.lock = &hgt->histo.entity.subdev.active_state->_lock;
+
 	v4l2_ctrl_new_custom(&hgt->ctrls, &hgt_hue_areas, NULL);
 
 	hgt->histo.entity.subdev.ctrl_handler = &hgt->ctrls;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index 9c2d4c91bfad..d3bf7a281646 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -195,26 +195,15 @@ static int histo_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int histo_get_selection(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_selection *sel)
 {
-	struct vsp1_histogram *histo = subdev_to_histo(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
-	int ret = 0;
 
 	if (sel->pad != HISTO_PAD_SINK)
 		return -EINVAL;
 
-	mutex_lock(&histo->entity.lock);
-
-	state = vsp1_entity_get_state(&histo->entity, sd_state, sel->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
-
 	switch (sel->target) {
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
@@ -243,13 +232,10 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 		break;
 
 	default:
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
 
-done:
-	mutex_unlock(&histo->entity.lock);
-	return ret;
+	return 0;
 }
 
 static int histo_set_crop(struct v4l2_subdev *subdev,
@@ -322,34 +308,18 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_selection(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_selection *sel)
 {
-	struct vsp1_histogram *histo = subdev_to_histo(subdev);
-	struct v4l2_subdev_state *state;
-	int ret;
-
 	if (sel->pad != HISTO_PAD_SINK)
 		return -EINVAL;
 
-	mutex_lock(&histo->entity.lock);
-
-	state = vsp1_entity_get_state(&histo->entity, sd_state, sel->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
-
 	if (sel->target == V4L2_SEL_TGT_CROP)
-		ret = histo_set_crop(subdev, state, sel);
+		return histo_set_crop(subdev, state, sel);
 	else if (sel->target == V4L2_SEL_TGT_COMPOSE)
-		ret = histo_set_compose(subdev, state, sel);
+		return histo_set_compose(subdev, state, sel);
 	else
-		ret = -EINVAL;
-
-done:
-	mutex_unlock(&histo->entity.lock);
-	return ret;
+		return -EINVAL;
 }
 
 static int histo_set_format(struct v4l2_subdev *subdev,
@@ -377,7 +347,7 @@ static int histo_set_format(struct v4l2_subdev *subdev,
 static const struct v4l2_subdev_pad_ops histo_pad_ops = {
 	.enum_mbus_code = histo_enum_mbus_code,
 	.enum_frame_size = histo_enum_frame_size,
-	.get_fmt = vsp1_subdev_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = histo_set_format,
 	.get_selection = histo_get_selection,
 	.set_selection = histo_set_selection,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
index 8ba2a7c7305c..069d3de1797f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
@@ -62,21 +62,11 @@ static int hsit_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int hsit_set_format(struct v4l2_subdev *subdev,
-			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_state *state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_hsit *hsit = to_hsit(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
-
-	mutex_lock(&hsit->entity.lock);
-
-	state = vsp1_entity_get_state(&hsit->entity, sd_state, fmt->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
 
 	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
@@ -86,7 +76,7 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
 		 * modified.
 		 */
 		fmt->format = *format;
-		goto done;
+		return 0;
 	}
 
 	format->code = hsit->inverse ? MEDIA_BUS_FMT_AHSV8888_1X32
@@ -106,15 +96,13 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
 	format->code = hsit->inverse ? MEDIA_BUS_FMT_ARGB8888_1X32
 		     : MEDIA_BUS_FMT_AHSV8888_1X32;
 
-done:
-	mutex_unlock(&hsit->entity.lock);
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops hsit_pad_ops = {
 	.enum_mbus_code = hsit_enum_mbus_code,
 	.enum_frame_size = hsit_enum_frame_size,
-	.get_fmt = vsp1_subdev_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = hsit_set_format,
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
index b3d83d1c5306..f1fefa2817d4 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
@@ -70,7 +70,7 @@ static int lif_set_format(struct v4l2_subdev *subdev,
 static const struct v4l2_subdev_pad_ops lif_pad_ops = {
 	.enum_mbus_code = lif_enum_mbus_code,
 	.enum_frame_size = lif_enum_frame_size,
-	.get_fmt = vsp1_subdev_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = lif_set_format,
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
index dd264e6532e0..1063076ad33f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
@@ -133,7 +133,7 @@ static int lut_set_format(struct v4l2_subdev *subdev,
 static const struct v4l2_subdev_pad_ops lut_pad_ops = {
 	.enum_mbus_code = lut_enum_mbus_code,
 	.enum_frame_size = lut_enum_frame_size,
-	.get_fmt = vsp1_subdev_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = lut_set_format,
 };
 
@@ -225,6 +225,8 @@ struct vsp1_lut *vsp1_lut_create(struct vsp1_device *vsp1)
 
 	/* Initialize the control handler. */
 	v4l2_ctrl_handler_init(&lut->ctrls, 1);
+	lut->ctrls.lock = &lut->entity.subdev.active_state->_lock;
+
 	v4l2_ctrl_new_custom(&lut->ctrls, &lut_table_control, NULL);
 
 	lut->entity.subdev.ctrl_handler = &lut->ctrls;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index b392115595f2..5c5b9835c74b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -486,9 +486,14 @@ static void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
 	struct vsp1_entity *entity;
 
 	list_for_each_entry_reverse(entity, &pipe->entities, list_pipe) {
-		if (entity->ops->partition)
-			entity->ops->partition(entity, entity->state, pipe,
-					       partition, index, window);
+		struct v4l2_subdev_state *state;
+
+		if (!entity->ops->partition)
+			continue;
+
+		state = v4l2_subdev_get_locked_active_state(&entity->subdev);
+		entity->ops->partition(entity, state, pipe, partition, index,
+				       window);
 	}
 }
 
@@ -507,6 +512,7 @@ void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
 				       unsigned int index)
 {
 	const struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
 	struct v4l2_rect window;
 	unsigned int modulus;
 
@@ -514,8 +520,8 @@ void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
 	 * Partitions are computed on the size before rotation, use the format
 	 * at the WPF sink.
 	 */
-	format = v4l2_subdev_state_get_format(pipe->output->entity.state,
-					      RWPF_PAD_SINK);
+	state = v4l2_subdev_get_locked_active_state(&pipe->output->entity.subdev);
+	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 
 	/* Initialise the partition with sane starting conditions. */
 	window.left = index * div_size;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 5c8b3ba1bd3c..66a6f2eb2ae3 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -152,9 +152,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 
 	/* Output location. */
 	if (pipe->brx) {
+		struct v4l2_subdev *brx_subdev = &pipe->brx->subdev;
+		struct v4l2_subdev_state *brx_state;
 		const struct v4l2_rect *compose;
 
-		compose = v4l2_subdev_state_get_compose(pipe->brx->state,
+		brx_state = v4l2_subdev_get_locked_active_state(brx_subdev);
+
+		compose = v4l2_subdev_state_get_compose(brx_state,
 							rpf->brx_input);
 		left = compose->left;
 		top = compose->top;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 9d38203e73d0..e4edce3bf584 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -51,21 +51,11 @@ static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
-
-	mutex_lock(&rwpf->entity.lock);
-
-	state = vsp1_entity_get_state(&rwpf->entity, sd_state, fmt->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
 
 	/* Default to YUV if the requested format is not supported. */
 	if (fmt->format.code != MEDIA_BUS_FMT_ARGB8888_1X32 &&
@@ -82,7 +72,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 		 */
 		format->code = fmt->format.code;
 		fmt->format = *format;
-		goto done;
+		return 0;
 	}
 
 	format->code = fmt->format.code;
@@ -115,19 +105,15 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 		format->height = fmt->format.width;
 	}
 
-done:
-	mutex_unlock(&rwpf->entity.lock);
-	return ret;
+	return 0;
 }
 
 static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
 
 	/*
 	 * Cropping is only supported on the RPF and is implemented on the sink
@@ -136,14 +122,6 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
 	if (rwpf->entity.type == VSP1_ENTITY_WPF || sel->pad != RWPF_PAD_SINK)
 		return -EINVAL;
 
-	mutex_lock(&rwpf->entity.lock);
-
-	state = vsp1_entity_get_state(&rwpf->entity, sd_state, sel->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
-
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
 		sel->r = *v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
@@ -158,24 +136,19 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
 		break;
 
 	default:
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
 
-done:
-	mutex_unlock(&rwpf->entity.lock);
-	return ret;
+	return 0;
 }
 
 static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
-	int ret = 0;
 
 	/*
 	 * Cropping is only supported on the RPF and is implemented on the sink
@@ -187,14 +160,6 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	mutex_lock(&rwpf->entity.lock);
-
-	state = vsp1_entity_get_state(&rwpf->entity, sd_state, sel->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
-
 	/* Make sure the crop rectangle is entirely contained in the image. */
 	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 
@@ -224,15 +189,13 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	format->width = crop->width;
 	format->height = crop->height;
 
-done:
-	mutex_unlock(&rwpf->entity.lock);
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
 	.enum_mbus_code = vsp1_rwpf_enum_mbus_code,
 	.enum_frame_size = vsp1_rwpf_enum_frame_size,
-	.get_fmt = vsp1_subdev_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = vsp1_rwpf_set_format,
 	.get_selection = vsp1_rwpf_get_selection,
 	.set_selection = vsp1_rwpf_set_selection,
@@ -267,6 +230,8 @@ static const struct v4l2_ctrl_ops vsp1_rwpf_ctrl_ops = {
 int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols)
 {
 	v4l2_ctrl_handler_init(&rwpf->ctrls, ncontrols + 1);
+	rwpf->ctrls.lock = &rwpf->entity.subdev.active_state->_lock;
+
 	v4l2_ctrl_new_std(&rwpf->ctrls, &vsp1_rwpf_ctrl_ops,
 			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index 1759ce642e6e..a5c839381b84 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -119,26 +119,15 @@ static int sru_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int sru_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
-	struct vsp1_sru *sru = to_sru(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
-
-	state = vsp1_entity_get_state(&sru->entity, sd_state, fse->which);
-	if (!state)
-		return -EINVAL;
 
 	format = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
 
-	mutex_lock(&sru->entity.lock);
-
-	if (fse->index || fse->code != format->code) {
-		ret = -EINVAL;
-		goto done;
-	}
+	if (fse->index || fse->code != format->code)
+		return -EINVAL;
 
 	if (fse->pad == SRU_PAD_SINK) {
 		fse->min_width = SRU_MIN_SIZE;
@@ -158,9 +147,7 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
 		}
 	}
 
-done:
-	mutex_unlock(&sru->entity.lock);
-	return ret;
+	return 0;
 }
 
 static void sru_try_format(struct vsp1_sru *sru,
@@ -215,21 +202,11 @@ static void sru_try_format(struct vsp1_sru *sru,
 }
 
 static int sru_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_sru *sru = to_sru(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
-
-	mutex_lock(&sru->entity.lock);
-
-	state = vsp1_entity_get_state(&sru->entity, sd_state, fmt->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
 
 	sru_try_format(sru, state, fmt->pad, &fmt->format);
 
@@ -244,15 +221,13 @@ static int sru_set_format(struct v4l2_subdev *subdev,
 		sru_try_format(sru, state, SRU_PAD_SOURCE, format);
 	}
 
-done:
-	mutex_unlock(&sru->entity.lock);
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops sru_pad_ops = {
 	.enum_mbus_code = sru_enum_mbus_code,
 	.enum_frame_size = sru_enum_frame_size,
-	.get_fmt = vsp1_subdev_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = sru_set_format,
 };
 
@@ -371,6 +346,8 @@ struct vsp1_sru *vsp1_sru_create(struct vsp1_device *vsp1)
 
 	/* Initialize the control handler. */
 	v4l2_ctrl_handler_init(&sru->ctrls, 1);
+	sru->ctrls.lock = &sru->entity.subdev.active_state->_lock;
+
 	v4l2_ctrl_new_custom(&sru->ctrls, &sru_intensity_control, NULL);
 
 	sru->intensity = 1;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index c5a38478cf8c..fd28504d3538 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -124,26 +124,15 @@ static int uds_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int uds_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
-	struct vsp1_uds *uds = to_uds(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
-
-	state = vsp1_entity_get_state(&uds->entity, sd_state, fse->which);
-	if (!state)
-		return -EINVAL;
 
 	format = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
 
-	mutex_lock(&uds->entity.lock);
-
-	if (fse->index || fse->code != format->code) {
-		ret = -EINVAL;
-		goto done;
-	}
+	if (fse->index || fse->code != format->code)
+		return -EINVAL;
 
 	if (fse->pad == UDS_PAD_SINK) {
 		fse->min_width = UDS_MIN_SIZE;
@@ -157,9 +146,7 @@ static int uds_enum_frame_size(struct v4l2_subdev *subdev,
 				  &fse->max_height);
 	}
 
-done:
-	mutex_unlock(&uds->entity.lock);
-	return ret;
+	return 0;
 }
 
 static void uds_try_format(struct vsp1_uds *uds,
@@ -198,21 +185,11 @@ static void uds_try_format(struct vsp1_uds *uds,
 }
 
 static int uds_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_uds *uds = to_uds(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
-
-	mutex_lock(&uds->entity.lock);
-
-	state = vsp1_entity_get_state(&uds->entity, sd_state, fmt->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
 
 	uds_try_format(uds, state, fmt->pad, &fmt->format);
 
@@ -227,9 +204,7 @@ static int uds_set_format(struct v4l2_subdev *subdev,
 		uds_try_format(uds, state, UDS_PAD_SOURCE, format);
 	}
 
-done:
-	mutex_unlock(&uds->entity.lock);
-	return ret;
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------
@@ -239,7 +214,7 @@ static int uds_set_format(struct v4l2_subdev *subdev,
 static const struct v4l2_subdev_pad_ops uds_pad_ops = {
 	.enum_mbus_code = uds_enum_mbus_code,
 	.enum_frame_size = uds_enum_frame_size,
-	.get_fmt = vsp1_subdev_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = uds_set_format,
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
index edaf28b544d2..911543ee702b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
@@ -82,25 +82,14 @@ static int uif_set_format(struct v4l2_subdev *subdev,
 }
 
 static int uif_get_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel)
 {
-	struct vsp1_uif *uif = to_uif(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
 
 	if (sel->pad != UIF_PAD_SINK)
 		return -EINVAL;
 
-	mutex_lock(&uif->entity.lock);
-
-	state = vsp1_entity_get_state(&uif->entity, sd_state, sel->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
-
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
@@ -116,37 +105,23 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
 		break;
 
 	default:
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
 
-done:
-	mutex_unlock(&uif->entity.lock);
-	return ret;
+	return 0;
 }
 
 static int uif_set_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel)
 {
-	struct vsp1_uif *uif = to_uif(subdev);
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *selection;
-	int ret = 0;
 
 	if (sel->pad != UIF_PAD_SINK ||
 	    sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	mutex_lock(&uif->entity.lock);
-
-	state = vsp1_entity_get_state(&uif->entity, sd_state, sel->which);
-	if (!state) {
-		ret = -EINVAL;
-		goto done;
-	}
-
 	/* The crop rectangle must be inside the input frame. */
 	format = v4l2_subdev_state_get_format(state, UIF_PAD_SINK);
 
@@ -161,9 +136,7 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
 	selection = v4l2_subdev_state_get_crop(state, sel->pad);
 	*selection = sel->r;
 
-done:
-	mutex_unlock(&uif->entity.lock);
-	return ret;
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------
@@ -173,7 +146,7 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
 static const struct v4l2_subdev_pad_ops uif_pad_ops = {
 	.enum_mbus_code = uif_enum_mbus_code,
 	.enum_frame_size = uif_enum_frame_size,
-	.get_fmt = vsp1_subdev_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = uif_set_format,
 	.get_selection = uif_get_selection,
 	.set_selection = uif_set_selection,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index c3dd246e707b..4e3f0adb5b08 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -676,6 +676,7 @@ static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
 {
 	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
 	const struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
 	struct vsp1_entity *entity;
 	unsigned int div_size;
 	unsigned int i;
@@ -684,8 +685,8 @@ static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
 	 * Partitions are computed on the size before rotation, use the format
 	 * at the WPF sink.
 	 */
-	format = v4l2_subdev_state_get_format(pipe->output->entity.state,
-					      RWPF_PAD_SINK);
+	state = v4l2_subdev_get_locked_active_state(&pipe->output->entity.subdev);
+	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 	div_size = format->width;
 
 	/*
@@ -699,9 +700,8 @@ static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
 			if (!entity->ops->max_width)
 				continue;
 
-			entity_max = entity->ops->max_width(entity,
-							    entity->state,
-							    pipe);
+			state = v4l2_subdev_get_locked_active_state(&entity->subdev);
+			entity_max = entity->ops->max_width(entity, state, pipe);
 			if (entity_max)
 				div_size = min(div_size, entity_max);
 		}
@@ -761,8 +761,11 @@ static int vsp1_video_setup_pipeline(struct vsp1_pipeline *pipe)
 		return -ENOMEM;
 
 	list_for_each_entry(entity, &pipe->entities, list_pipe) {
+		struct v4l2_subdev_state *state;
+
+		state = v4l2_subdev_get_locked_active_state(&entity->subdev);
 		vsp1_entity_route_setup(entity, pipe, pipe->stream_config);
-		vsp1_entity_configure_stream(entity, entity->state, pipe, NULL,
+		vsp1_entity_configure_stream(entity, state, pipe, NULL,
 					     pipe->stream_config);
 	}
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index f176750ccd98..8792b41f307a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -44,6 +44,7 @@ enum wpf_flip_ctrl {
 static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
 {
 	struct vsp1_video *video = wpf->video;
+	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *sink_format;
 	struct v4l2_mbus_framefmt *source_format;
 	bool rotate;
@@ -65,12 +66,10 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
 		goto done;
 	}
 
-	sink_format = v4l2_subdev_state_get_format(wpf->entity.state,
-						   RWPF_PAD_SINK);
-	source_format = v4l2_subdev_state_get_format(wpf->entity.state,
-						     RWPF_PAD_SOURCE);
+	state = v4l2_subdev_get_locked_active_state(&wpf->entity.subdev);
 
-	mutex_lock(&wpf->entity.lock);
+	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
+	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
 
 	if (rotate) {
 		source_format->width = sink_format->height;
@@ -82,8 +81,6 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
 
 	wpf->flip.rotate = rotate;
 
-	mutex_unlock(&wpf->entity.lock);
-
 done:
 	mutex_unlock(&video->lock);
 	return ret;
-- 
Regards,

Laurent Pinchart


