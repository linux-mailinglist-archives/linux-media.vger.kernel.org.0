Return-Path: <linux-media+bounces-13624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F30ED90E08F
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86B351F23492
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B704687;
	Wed, 19 Jun 2024 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BcDl9jIP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820A11869;
	Wed, 19 Jun 2024 00:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756273; cv=none; b=Cfmwj8OQd1n2+7xR1dsHXNirJC8QO0qn78xoQXLqvYPbDHM0gDmAIeMOqSD3qpfO+3ROQ2r1t+yChT6u0IFlokz+9Dkj0iHDh09LOxJiefLbnsdOrPIAtnixudccDXwyvcpvl5qmHbPUOD76gWPRRKwDJZsU4DhHPhbsC2OrfxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756273; c=relaxed/simple;
	bh=qxh0cmdGs8qU7xlN/5BhZwE7tuq+9Llv3sMeC1Cnxv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaOWZxFPG0obT2vLVyMbCoDl/ZM5sPgTXLX6Zd8J1eX8BhTqZEV27vDfpaQCsu/Jmqcsf4JbxMBWifnmTYBk6YhC/9kjonKIadcFtrQEnvcw7KOfWJ9yMD0SnqOGHSZYGA7HAXIKrDRtpJPRMcyKdhfDLzxOZPVdh8WhIMnO/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BcDl9jIP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7519A1030;
	Wed, 19 Jun 2024 02:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756249;
	bh=qxh0cmdGs8qU7xlN/5BhZwE7tuq+9Llv3sMeC1Cnxv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcDl9jIPhGllS828MmlqphECEd7O1DdwMHrJaaJnHGBOfEF1R5Vk1TLbBYCXjjtru
	 ZphLao2TjQxJtqvqiQ7YTi95sNmocMxHgnHPLvrJQGrMzbLuvv7wnFjV7Wm79iDjdC
	 DSiyxjFOQDAvNHtDMvWkH0t/c9s9HMKzIZzK1Bgw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 02/19] media: renesas: vsp1: Drop vsp1_entity_get_pad_selection() wrapper
Date: Wed, 19 Jun 2024 03:17:05 +0300
Message-ID: <20240619001722.9749-3-laurent.pinchart+renesas@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The vsp1_entity_get_pad_selection() function is just a wrapper around
v4l2_subdev_state_get_crop() or v4l2_subdev_state_get_compose() without
any added value. Drop it and call the functions it wraps directly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_entity.c | 32 ++-----------------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  4 ---
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |  7 ++--
 .../media/platform/renesas/vsp1/vsp1_hgt.c    |  7 ++--
 .../media/platform/renesas/vsp1/vsp1_histo.c  | 31 ++++++------------
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |  6 ++--
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  9 ++----
 7 files changed, 20 insertions(+), 76 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index fa748cf89d44..8d39f1ee00ab 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -127,32 +127,6 @@ vsp1_entity_get_state(struct vsp1_entity *entity,
 	}
 }
 
-/**
- * vsp1_entity_get_pad_selection - Get a pad selection from storage for entity
- * @entity: the entity
- * @sd_state: the state storage
- * @pad: the pad number
- * @target: the selection target
- *
- * Return the selection rectangle stored in the given configuration for an
- * entity's pad. The configuration can be an ACTIVE or TRY configuration. The
- * selection target can be COMPOSE or CROP.
- */
-struct v4l2_rect *
-vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
-			      struct v4l2_subdev_state *sd_state,
-			      unsigned int pad, unsigned int target)
-{
-	switch (target) {
-	case V4L2_SEL_TGT_COMPOSE:
-		return v4l2_subdev_state_get_compose(sd_state, pad);
-	case V4L2_SEL_TGT_CROP:
-		return v4l2_subdev_state_get_crop(sd_state, pad);
-	default:
-		return NULL;
-	}
-}
-
 /*
  * vsp1_subdev_get_pad_format - Subdev pad get_fmt handler
  * @subdev: V4L2 subdevice
@@ -361,15 +335,13 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 	*format = fmt->format;
 
 	/* Reset the crop and compose rectangles. */
-	selection = vsp1_entity_get_pad_selection(entity, state, fmt->pad,
-						  V4L2_SEL_TGT_CROP);
+	selection = v4l2_subdev_state_get_crop(state, fmt->pad);
 	selection->left = 0;
 	selection->top = 0;
 	selection->width = format->width;
 	selection->height = format->height;
 
-	selection = vsp1_entity_get_pad_selection(entity, state, fmt->pad,
-						  V4L2_SEL_TGT_COMPOSE);
+	selection = v4l2_subdev_state_get_compose(state, fmt->pad);
 	selection->left = 0;
 	selection->top = 0;
 	selection->width = format->width;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index e913befe7fc8..802c0c2acab0 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -138,10 +138,6 @@ struct v4l2_subdev_state *
 vsp1_entity_get_state(struct vsp1_entity *entity,
 		      struct v4l2_subdev_state *sd_state,
 		      enum v4l2_subdev_format_whence which);
-struct v4l2_rect *
-vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
-			      struct v4l2_subdev_state *sd_state,
-			      unsigned int pad, unsigned int target);
 
 void vsp1_entity_route_setup(struct vsp1_entity *entity,
 			     struct vsp1_pipeline *pipe,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
index 40c571a987ef..4ee5f0e5e9c3 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
@@ -140,11 +140,8 @@ static void hgo_configure_stream(struct vsp1_entity *entity,
 	unsigned int hratio;
 	unsigned int vratio;
 
-	crop = vsp1_entity_get_pad_selection(entity, entity->state,
-					     HISTO_PAD_SINK, V4L2_SEL_TGT_CROP);
-	compose = vsp1_entity_get_pad_selection(entity, entity->state,
-						HISTO_PAD_SINK,
-						V4L2_SEL_TGT_COMPOSE);
+	crop = v4l2_subdev_state_get_crop(entity->state, HISTO_PAD_SINK);
+	compose = v4l2_subdev_state_get_compose(entity->state, HISTO_PAD_SINK);
 
 	vsp1_hgo_write(hgo, dlb, VI6_HGO_REGRST, VI6_HGO_REGRST_RCLEA);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
index 8281b86874ab..b739d8045576 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
@@ -139,11 +139,8 @@ static void hgt_configure_stream(struct vsp1_entity *entity,
 	u8 upper;
 	unsigned int i;
 
-	crop = vsp1_entity_get_pad_selection(entity, entity->state,
-					     HISTO_PAD_SINK, V4L2_SEL_TGT_CROP);
-	compose = vsp1_entity_get_pad_selection(entity, entity->state,
-						HISTO_PAD_SINK,
-						V4L2_SEL_TGT_COMPOSE);
+	crop = v4l2_subdev_state_get_crop(entity->state, HISTO_PAD_SINK);
+	compose = v4l2_subdev_state_get_compose(entity->state, HISTO_PAD_SINK);
 
 	vsp1_hgt_write(hgt, dlb, VI6_HGT_REGRST, VI6_HGT_REGRST_RCLEA);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index 0d7e4afae0f8..85d2fc538327 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -218,9 +218,7 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 	switch (sel->target) {
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
-		crop = vsp1_entity_get_pad_selection(&histo->entity, state,
-						     HISTO_PAD_SINK,
-						     V4L2_SEL_TGT_CROP);
+		crop = v4l2_subdev_state_get_crop(state, HISTO_PAD_SINK);
 		sel->r.left = 0;
 		sel->r.top = 0;
 		sel->r.width = crop->width;
@@ -237,9 +235,11 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 		break;
 
 	case V4L2_SEL_TGT_COMPOSE:
+		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
+		break;
+
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *vsp1_entity_get_pad_selection(&histo->entity, state,
-							sel->pad, sel->target);
+		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
 		break;
 
 	default:
@@ -256,9 +256,7 @@ static int histo_set_crop(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_selection *sel)
 {
-	struct vsp1_histogram *histo = subdev_to_histo(subdev);
 	struct v4l2_mbus_framefmt *format;
-	struct v4l2_rect *selection;
 
 	/* The crop rectangle must be inside the input frame. */
 	format = v4l2_subdev_state_get_format(sd_state, HISTO_PAD_SINK);
@@ -270,14 +268,8 @@ static int histo_set_crop(struct v4l2_subdev *subdev,
 				format->height - sel->r.top);
 
 	/* Set the crop rectangle and reset the compose rectangle. */
-	selection = vsp1_entity_get_pad_selection(&histo->entity, sd_state,
-						  sel->pad, V4L2_SEL_TGT_CROP);
-	*selection = sel->r;
-
-	selection = vsp1_entity_get_pad_selection(&histo->entity, sd_state,
-						  sel->pad,
-						  V4L2_SEL_TGT_COMPOSE);
-	*selection = sel->r;
+	*v4l2_subdev_state_get_crop(sd_state, sel->pad) = sel->r;
+	*v4l2_subdev_state_get_compose(sd_state, sel->pad) = sel->r;
 
 	return 0;
 }
@@ -286,7 +278,6 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
-	struct vsp1_histogram *histo = subdev_to_histo(subdev);
 	struct v4l2_rect *compose;
 	struct v4l2_rect *crop;
 	unsigned int ratio;
@@ -299,9 +290,7 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 	sel->r.left = 0;
 	sel->r.top = 0;
 
-	crop = vsp1_entity_get_pad_selection(&histo->entity, sd_state,
-					     sel->pad,
-					     V4L2_SEL_TGT_CROP);
+	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
 
 	/*
 	 * Clamp the width and height to acceptable values first and then
@@ -326,9 +315,7 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 	ratio = 1 << (crop->height * 2 / sel->r.height / 3);
 	sel->r.height = crop->height / ratio;
 
-	compose = vsp1_entity_get_pad_selection(&histo->entity, sd_state,
-						sel->pad,
-						V4L2_SEL_TGT_COMPOSE);
+	compose = v4l2_subdev_state_get_compose(sd_state, sel->pad);
 	*compose = sel->r;
 
 	return 0;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 19d9f078748c..4efcec5253d6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -155,10 +155,8 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	if (pipe->brx) {
 		const struct v4l2_rect *compose;
 
-		compose = vsp1_entity_get_pad_selection(pipe->brx,
-							pipe->brx->state,
-							rpf->brx_input,
-							V4L2_SEL_TGT_COMPOSE);
+		compose = v4l2_subdev_state_get_compose(pipe->brx->state,
+							rpf->brx_input);
 		left = compose->left;
 		top = compose->top;
 	}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
index ee5b6ba22898..cecd2f7024f4 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
@@ -112,8 +112,7 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
 		break;
 
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *vsp1_entity_get_pad_selection(&uif->entity, state,
-							sel->pad, sel->target);
+		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
 		break;
 
 	default:
@@ -159,8 +158,7 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
 				format->height - sel->r.top);
 
 	/* Store the crop rectangle. */
-	selection = vsp1_entity_get_pad_selection(&uif->entity, state,
-						  sel->pad, V4L2_SEL_TGT_CROP);
+	selection = v4l2_subdev_state_get_crop(state, sel->pad);
 	*selection = sel->r;
 
 done:
@@ -202,8 +200,7 @@ static void uif_configure_stream(struct vsp1_entity *entity,
 	vsp1_uif_write(uif, dlb, VI6_UIF_DISCOM_DOCMPMR,
 		       VI6_UIF_DISCOM_DOCMPMR_SEL(9));
 
-	crop = vsp1_entity_get_pad_selection(entity, entity->state,
-					     UIF_PAD_SINK, V4L2_SEL_TGT_CROP);
+	crop = v4l2_subdev_state_get_crop(entity->state, UIF_PAD_SINK);
 
 	left = crop->left;
 	width = crop->width;
-- 
Regards,

Laurent Pinchart


