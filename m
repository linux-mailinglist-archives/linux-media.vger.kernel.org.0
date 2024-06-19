Return-Path: <linux-media+bounces-13623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA0D90E08C
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E201C2115C
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B13E1852;
	Wed, 19 Jun 2024 00:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s5XiQ+T6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458E9196;
	Wed, 19 Jun 2024 00:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756270; cv=none; b=UvWo26VnI6WEgcfL5kHsCJM6RK4PmjpJ8BgcihxwEocPcjIRE8jTWyWrPMIcUwsAi2YUx5xQhACpwGaAYj5EoOtR8Y95gz9rfGHdWv8Yv5iXmWt4q1qntGxGUr6NjABy8DW3r/TDh9ETxxYupxFtNGbl+pGqCPAKk6U13FhOjNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756270; c=relaxed/simple;
	bh=35rBV0tSZU31yWETzA3krY8AHpmw7ehjEFzsLPna14I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szbjW3/KZsx3O7lzlCirr6XWwGh8gpYtYR+poE0qO6cg2ygj010odDwiq+tPNFOE9sxOCV+121pXh74VjeTL+odzwAf81KfTFmbxd6+ATTWxdYiTHTCBg6dXWcwxnTbUj/xOS7fgdcEICgmHm4aqMLVg55gSsttnJd5UhdOYk08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s5XiQ+T6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA5311011;
	Wed, 19 Jun 2024 02:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756248;
	bh=35rBV0tSZU31yWETzA3krY8AHpmw7ehjEFzsLPna14I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s5XiQ+T6DXsmPoNR0+ZxEpLJFplYhrbQbHG5Ou707RKIexTayDLXZJa1sDY5gENvI
	 tXbEhoEO/IkiX7KxmnTk/c5xuy/f6YVUPgCIyctbT/1xVupOLHDxmoCq71r65fW4sD
	 dk/iatnBe93df3ln7hgUX3sDEXmTrXHljdm9cJPg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 01/19] media: renesas: vsp1: Drop vsp1_entity_get_pad_format() wrapper
Date: Wed, 19 Jun 2024 03:17:04 +0300
Message-ID: <20240619001722.9749-2-laurent.pinchart+renesas@ideasonboard.com>
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

The vsp1_entity_get_pad_format() function is just a wrapper around
v4l2_subdev_state_get_format() without any added value. Drop it and call
v4l2_subdev_state_get_format() directly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes since v1:

- Remove unneeded line breaks
---
 .../media/platform/renesas/vsp1/vsp1_brx.c    | 18 +++++-----
 .../media/platform/renesas/vsp1/vsp1_clu.c    |  3 +-
 .../media/platform/renesas/vsp1/vsp1_entity.c | 27 +++-----------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  4 ---
 .../media/platform/renesas/vsp1/vsp1_histo.c  |  6 ++--
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  5 ++-
 .../media/platform/renesas/vsp1/vsp1_lif.c    |  4 +--
 .../media/platform/renesas/vsp1/vsp1_rpf.c    | 10 +++---
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 14 +++-----
 .../media/platform/renesas/vsp1/vsp1_sru.c    | 31 +++++++---------
 .../media/platform/renesas/vsp1/vsp1_uds.c    | 35 ++++++++-----------
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  5 ++-
 .../media/platform/renesas/vsp1/vsp1_video.c  | 10 +++---
 .../media/platform/renesas/vsp1/vsp1_wpf.c    | 25 ++++++-------
 14 files changed, 73 insertions(+), 124 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index a8535c6e2c46..0eb4d8fe4285 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -119,8 +119,8 @@ static void brx_try_format(struct vsp1_brx *brx,
 
 	default:
 		/* The BRx can't perform format conversion. */
-		format = vsp1_entity_get_pad_format(&brx->entity, sd_state,
-						    BRX_PAD_SINK(0));
+		format = v4l2_subdev_state_get_format(sd_state,
+						      BRX_PAD_SINK(0));
 		fmt->code = format->code;
 		break;
 	}
@@ -150,7 +150,7 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 
 	brx_try_format(brx, state, fmt->pad, &fmt->format);
 
-	format = vsp1_entity_get_pad_format(&brx->entity, state, fmt->pad);
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
 	*format = fmt->format;
 
 	/* Reset the compose rectangle. */
@@ -169,8 +169,7 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 		unsigned int i;
 
 		for (i = 0; i <= brx->entity.source_pad; ++i) {
-			format = vsp1_entity_get_pad_format(&brx->entity,
-							    state, i);
+			format = v4l2_subdev_state_get_format(state, i);
 			format->code = fmt->format.code;
 		}
 	}
@@ -242,8 +241,7 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 	 * The compose rectangle top left corner must be inside the output
 	 * frame.
 	 */
-	format = vsp1_entity_get_pad_format(&brx->entity, state,
-					    brx->entity.source_pad);
+	format = v4l2_subdev_state_get_format(state, brx->entity.source_pad);
 	sel->r.left = clamp_t(unsigned int, sel->r.left, 0, format->width - 1);
 	sel->r.top = clamp_t(unsigned int, sel->r.top, 0, format->height - 1);
 
@@ -251,7 +249,7 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 	 * Scaling isn't supported, the compose rectangle size must be identical
 	 * to the sink format size.
 	 */
-	format = vsp1_entity_get_pad_format(&brx->entity, state, sel->pad);
+	format = v4l2_subdev_state_get_format(state, sel->pad);
 	sel->r.width = format->width;
 	sel->r.height = format->height;
 
@@ -290,8 +288,8 @@ static void brx_configure_stream(struct vsp1_entity *entity,
 	unsigned int flags;
 	unsigned int i;
 
-	format = vsp1_entity_get_pad_format(&brx->entity, brx->entity.state,
-					    brx->entity.source_pad);
+	format = v4l2_subdev_state_get_format(brx->entity.state,
+					      brx->entity.source_pad);
 
 	/*
 	 * The hardware is extremely flexible but we have no userspace API to
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
index 625776a9bda4..1e57676a420c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
@@ -181,8 +181,7 @@ static void clu_configure_stream(struct vsp1_entity *entity,
 	 * The yuv_mode can't be changed during streaming. Cache it internally
 	 * for future runtime configuration calls.
 	 */
-	format = vsp1_entity_get_pad_format(&clu->entity, clu->entity.state,
-					    CLU_PAD_SINK);
+	format = v4l2_subdev_state_get_format(clu->entity.state, CLU_PAD_SINK);
 	clu->yuv_mode = format->code == MEDIA_BUS_FMT_AYUV8_1X32;
 }
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 0a5a7f9cc870..fa748cf89d44 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -127,23 +127,6 @@ vsp1_entity_get_state(struct vsp1_entity *entity,
 	}
 }
 
-/**
- * vsp1_entity_get_pad_format - Get a pad format from storage for an entity
- * @entity: the entity
- * @sd_state: the state storage
- * @pad: the pad number
- *
- * Return the format stored in the given configuration for an entity's pad. The
- * configuration can be an ACTIVE or TRY configuration.
- */
-struct v4l2_mbus_framefmt *
-vsp1_entity_get_pad_format(struct vsp1_entity *entity,
-			   struct v4l2_subdev_state *sd_state,
-			   unsigned int pad)
-{
-	return v4l2_subdev_state_get_format(sd_state, pad);
-}
-
 /**
  * vsp1_entity_get_pad_selection - Get a pad selection from storage for entity
  * @entity: the entity
@@ -191,7 +174,7 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
 		return -EINVAL;
 
 	mutex_lock(&entity->lock);
-	fmt->format = *vsp1_entity_get_pad_format(entity, state, fmt->pad);
+	fmt->format = *v4l2_subdev_state_get_format(state, fmt->pad);
 	mutex_unlock(&entity->lock);
 
 	return 0;
@@ -238,7 +221,7 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 			return -EINVAL;
 
 		mutex_lock(&entity->lock);
-		format = vsp1_entity_get_pad_format(entity, state, 0);
+		format = v4l2_subdev_state_get_format(state, 0);
 		code->code = format->code;
 		mutex_unlock(&entity->lock);
 	}
@@ -276,7 +259,7 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
 	if (!state)
 		return -EINVAL;
 
-	format = vsp1_entity_get_pad_format(entity, state, fse->pad);
+	format = v4l2_subdev_state_get_format(state, fse->pad);
 
 	mutex_lock(&entity->lock);
 
@@ -346,7 +329,7 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 		goto done;
 	}
 
-	format = vsp1_entity_get_pad_format(entity, state, fmt->pad);
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	if (fmt->pad == entity->source_pad) {
 		/* The output format can't be modified. */
@@ -374,7 +357,7 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 	fmt->format = *format;
 
 	/* Propagate the format to the source pad. */
-	format = vsp1_entity_get_pad_format(entity, state, entity->source_pad);
+	format = v4l2_subdev_state_get_format(state, entity->source_pad);
 	*format = fmt->format;
 
 	/* Reset the crop and compose rectangles. */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index 735f32dde4b5..e913befe7fc8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -138,10 +138,6 @@ struct v4l2_subdev_state *
 vsp1_entity_get_state(struct vsp1_entity *entity,
 		      struct v4l2_subdev_state *sd_state,
 		      enum v4l2_subdev_format_whence which);
-struct v4l2_mbus_framefmt *
-vsp1_entity_get_pad_format(struct vsp1_entity *entity,
-			   struct v4l2_subdev_state *sd_state,
-			   unsigned int pad);
 struct v4l2_rect *
 vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
 			      struct v4l2_subdev_state *sd_state,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index cd1c8778662e..0d7e4afae0f8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -229,8 +229,7 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
-		format = vsp1_entity_get_pad_format(&histo->entity, state,
-						    HISTO_PAD_SINK);
+		format = v4l2_subdev_state_get_format(state, HISTO_PAD_SINK);
 		sel->r.left = 0;
 		sel->r.top = 0;
 		sel->r.width = format->width;
@@ -262,8 +261,7 @@ static int histo_set_crop(struct v4l2_subdev *subdev,
 	struct v4l2_rect *selection;
 
 	/* The crop rectangle must be inside the input frame. */
-	format = vsp1_entity_get_pad_format(&histo->entity, sd_state,
-					    HISTO_PAD_SINK);
+	format = v4l2_subdev_state_get_format(sd_state, HISTO_PAD_SINK);
 	sel->r.left = clamp_t(unsigned int, sel->r.left, 0, format->width - 1);
 	sel->r.top = clamp_t(unsigned int, sel->r.top, 0, format->height - 1);
 	sel->r.width = clamp_t(unsigned int, sel->r.width, HISTO_MIN_SIZE,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
index bc1299c29ac9..4a8cce808c93 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
@@ -78,7 +78,7 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
 		goto done;
 	}
 
-	format = vsp1_entity_get_pad_format(&hsit->entity, state, fmt->pad);
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	if (fmt->pad == HSIT_PAD_SOURCE) {
 		/*
@@ -101,8 +101,7 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
 	fmt->format = *format;
 
 	/* Propagate the format to the source pad. */
-	format = vsp1_entity_get_pad_format(&hsit->entity, state,
-					    HSIT_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, HSIT_PAD_SOURCE);
 	*format = fmt->format;
 	format->code = hsit->inverse ? MEDIA_BUS_FMT_ARGB8888_1X32
 		     : MEDIA_BUS_FMT_AHSV8888_1X32;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
index b1d21a54837b..29d4c1521e6a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
@@ -93,8 +93,8 @@ static void lif_configure_stream(struct vsp1_entity *entity,
 	unsigned int obth;
 	unsigned int lbth;
 
-	format = vsp1_entity_get_pad_format(&lif->entity, lif->entity.state,
-					    LIF_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(lif->entity.state,
+					      LIF_PAD_SOURCE);
 
 	switch (entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) {
 	case VI6_IP_VERSION_MODEL_VSPD_GEN2:
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index c47579efc65f..19d9f078748c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -80,12 +80,10 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_PSTRIDE, pstride);
 
 	/* Format */
-	sink_format = vsp1_entity_get_pad_format(&rpf->entity,
-						 rpf->entity.state,
-						 RWPF_PAD_SINK);
-	source_format = vsp1_entity_get_pad_format(&rpf->entity,
-						   rpf->entity.state,
-						   RWPF_PAD_SOURCE);
+	sink_format = v4l2_subdev_state_get_format(rpf->entity.state,
+						   RWPF_PAD_SINK);
+	source_format = v4l2_subdev_state_get_format(rpf->entity.state,
+						     RWPF_PAD_SOURCE);
 
 	infmt = VI6_RPF_INFMT_CIPM
 	      | (fmtinfo->hwfmt << VI6_RPF_INFMT_RDFMT_SHIFT);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 09fb6ffa14e2..574623a48a3d 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -79,7 +79,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	    fmt->format.code != MEDIA_BUS_FMT_AYUV8_1X32)
 		fmt->format.code = MEDIA_BUS_FMT_AYUV8_1X32;
 
-	format = vsp1_entity_get_pad_format(&rwpf->entity, state, fmt->pad);
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	if (fmt->pad == RWPF_PAD_SOURCE) {
 		/*
@@ -113,8 +113,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	}
 
 	/* Propagate the format to the source pad. */
-	format = vsp1_entity_get_pad_format(&rwpf->entity, state,
-					    RWPF_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
 	*format = fmt->format;
 
 	if (rwpf->flip.rotate) {
@@ -157,8 +156,7 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
 		break;
 
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		format = vsp1_entity_get_pad_format(&rwpf->entity, state,
-						    RWPF_PAD_SINK);
+		format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 		sel->r.left = 0;
 		sel->r.top = 0;
 		sel->r.width = format->width;
@@ -204,8 +202,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	}
 
 	/* Make sure the crop rectangle is entirely contained in the image. */
-	format = vsp1_entity_get_pad_format(&rwpf->entity, state,
-					    RWPF_PAD_SINK);
+	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 
 	/*
 	 * Restrict the crop rectangle coordinates to multiples of 2 to avoid
@@ -229,8 +226,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	*crop = sel->r;
 
 	/* Propagate the format to the source pad. */
-	format = vsp1_entity_get_pad_format(&rwpf->entity, state,
-					    RWPF_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
 	format->width = crop->width;
 	format->height = crop->height;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index 11e008aa9f20..749ba7705000 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -131,7 +131,7 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
 	if (!state)
 		return -EINVAL;
 
-	format = vsp1_entity_get_pad_format(&sru->entity, state, SRU_PAD_SINK);
+	format = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
 
 	mutex_lock(&sru->entity.lock);
 
@@ -184,8 +184,7 @@ static void sru_try_format(struct vsp1_sru *sru,
 
 	case SRU_PAD_SOURCE:
 		/* The SRU can't perform format conversion. */
-		format = vsp1_entity_get_pad_format(&sru->entity, sd_state,
-						    SRU_PAD_SINK);
+		format = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
 		fmt->code = format->code;
 
 		/*
@@ -234,13 +233,12 @@ static int sru_set_format(struct v4l2_subdev *subdev,
 
 	sru_try_format(sru, state, fmt->pad, &fmt->format);
 
-	format = vsp1_entity_get_pad_format(&sru->entity, state, fmt->pad);
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
 	*format = fmt->format;
 
 	if (fmt->pad == SRU_PAD_SINK) {
 		/* Propagate the format to the source pad. */
-		format = vsp1_entity_get_pad_format(&sru->entity, state,
-						    SRU_PAD_SOURCE);
+		format = v4l2_subdev_state_get_format(state, SRU_PAD_SOURCE);
 		*format = fmt->format;
 
 		sru_try_format(sru, state, SRU_PAD_SOURCE, format);
@@ -277,10 +275,9 @@ static void sru_configure_stream(struct vsp1_entity *entity,
 	struct v4l2_mbus_framefmt *output;
 	u32 ctrl0;
 
-	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
-					   SRU_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
-					    SRU_PAD_SOURCE);
+	input = v4l2_subdev_state_get_format(sru->entity.state, SRU_PAD_SINK);
+	output = v4l2_subdev_state_get_format(sru->entity.state,
+					      SRU_PAD_SOURCE);
 
 	if (input->code == MEDIA_BUS_FMT_ARGB8888_1X32)
 		ctrl0 = VI6_SRU_CTRL0_PARAM2 | VI6_SRU_CTRL0_PARAM3
@@ -307,10 +304,9 @@ static unsigned int sru_max_width(struct vsp1_entity *entity,
 	struct v4l2_mbus_framefmt *input;
 	struct v4l2_mbus_framefmt *output;
 
-	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
-					   SRU_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
-					    SRU_PAD_SOURCE);
+	input = v4l2_subdev_state_get_format(sru->entity.state, SRU_PAD_SINK);
+	output = v4l2_subdev_state_get_format(sru->entity.state,
+					      SRU_PAD_SOURCE);
 
 	/*
 	 * The maximum input width of the SRU is 288 input pixels, but 32
@@ -333,10 +329,9 @@ static void sru_partition(struct vsp1_entity *entity,
 	struct v4l2_mbus_framefmt *input;
 	struct v4l2_mbus_framefmt *output;
 
-	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
-					   SRU_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.state,
-					    SRU_PAD_SOURCE);
+	input = v4l2_subdev_state_get_format(sru->entity.state, SRU_PAD_SINK);
+	output = v4l2_subdev_state_get_format(sru->entity.state,
+					      SRU_PAD_SOURCE);
 
 	/* Adapt if SRUx2 is enabled. */
 	if (input->width != output->width) {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index d89f1197b86c..887b1f70611a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -136,7 +136,7 @@ static int uds_enum_frame_size(struct v4l2_subdev *subdev,
 	if (!state)
 		return -EINVAL;
 
-	format = vsp1_entity_get_pad_format(&uds->entity, state, UDS_PAD_SINK);
+	format = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
 
 	mutex_lock(&uds->entity.lock);
 
@@ -183,8 +183,7 @@ static void uds_try_format(struct vsp1_uds *uds,
 
 	case UDS_PAD_SOURCE:
 		/* The UDS scales but can't perform format conversion. */
-		format = vsp1_entity_get_pad_format(&uds->entity, sd_state,
-						    UDS_PAD_SINK);
+		format = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
 		fmt->code = format->code;
 
 		uds_output_limits(format->width, &minimum, &maximum);
@@ -217,13 +216,12 @@ static int uds_set_format(struct v4l2_subdev *subdev,
 
 	uds_try_format(uds, state, fmt->pad, &fmt->format);
 
-	format = vsp1_entity_get_pad_format(&uds->entity, state, fmt->pad);
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
 	*format = fmt->format;
 
 	if (fmt->pad == UDS_PAD_SINK) {
 		/* Propagate the format to the source pad. */
-		format = vsp1_entity_get_pad_format(&uds->entity, state,
-						    UDS_PAD_SOURCE);
+		format = v4l2_subdev_state_get_format(state, UDS_PAD_SOURCE);
 		*format = fmt->format;
 
 		uds_try_format(uds, state, UDS_PAD_SOURCE, format);
@@ -265,10 +263,9 @@ static void uds_configure_stream(struct vsp1_entity *entity,
 	unsigned int vscale;
 	bool multitap;
 
-	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
-					   UDS_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
-					    UDS_PAD_SOURCE);
+	input = v4l2_subdev_state_get_format(uds->entity.state, UDS_PAD_SINK);
+	output = v4l2_subdev_state_get_format(uds->entity.state,
+					      UDS_PAD_SOURCE);
 
 	hscale = uds_compute_ratio(input->width, output->width);
 	vscale = uds_compute_ratio(input->height, output->height);
@@ -310,8 +307,8 @@ static void uds_configure_partition(struct vsp1_entity *entity,
 	struct vsp1_partition *partition = pipe->partition;
 	const struct v4l2_mbus_framefmt *output;
 
-	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
-					    UDS_PAD_SOURCE);
+	output = v4l2_subdev_state_get_format(uds->entity.state,
+					      UDS_PAD_SOURCE);
 
 	/* Input size clipping. */
 	vsp1_uds_write(uds, dlb, VI6_UDS_HSZCLIP, VI6_UDS_HSZCLIP_HCEN |
@@ -335,10 +332,9 @@ static unsigned int uds_max_width(struct vsp1_entity *entity,
 	const struct v4l2_mbus_framefmt *input;
 	unsigned int hscale;
 
-	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
-					   UDS_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
-					    UDS_PAD_SOURCE);
+	input = v4l2_subdev_state_get_format(uds->entity.state, UDS_PAD_SINK);
+	output = v4l2_subdev_state_get_format(uds->entity.state,
+					      UDS_PAD_SOURCE);
 	hscale = output->width / input->width;
 
 	/*
@@ -377,10 +373,9 @@ static void uds_partition(struct vsp1_entity *entity,
 	partition->uds_sink = *window;
 	partition->uds_source = *window;
 
-	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
-					   UDS_PAD_SINK);
-	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.state,
-					    UDS_PAD_SOURCE);
+	input = v4l2_subdev_state_get_format(uds->entity.state, UDS_PAD_SINK);
+	output = v4l2_subdev_state_get_format(uds->entity.state,
+					      UDS_PAD_SOURCE);
 
 	partition->uds_sink.width = window->width * input->width
 				  / output->width;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
index f66936a28a2a..ee5b6ba22898 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
@@ -104,8 +104,7 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
-		format = vsp1_entity_get_pad_format(&uif->entity, state,
-						    UIF_PAD_SINK);
+		format = v4l2_subdev_state_get_format(state, UIF_PAD_SINK);
 		sel->r.left = 0;
 		sel->r.top = 0;
 		sel->r.width = format->width;
@@ -150,7 +149,7 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
 	}
 
 	/* The crop rectangle must be inside the input frame. */
-	format = vsp1_entity_get_pad_format(&uif->entity, state, UIF_PAD_SINK);
+	format = v4l2_subdev_state_get_format(state, UIF_PAD_SINK);
 
 	sel->r.left = clamp_t(unsigned int, sel->r.left, 0, format->width - 1);
 	sel->r.top = clamp_t(unsigned int, sel->r.top, 0, format->height - 1);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index d6f2739456bf..813699d372f6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -203,9 +203,8 @@ static void vsp1_video_calculate_partition(struct vsp1_pipeline *pipe,
 	 * Partitions are computed on the size before rotation, use the format
 	 * at the WPF sink.
 	 */
-	format = vsp1_entity_get_pad_format(&pipe->output->entity,
-					    pipe->output->entity.state,
-					    RWPF_PAD_SINK);
+	format = v4l2_subdev_state_get_format(pipe->output->entity.state,
+					      RWPF_PAD_SINK);
 
 	/* A single partition simply processes the output size in full. */
 	if (pipe->partitions <= 1) {
@@ -268,9 +267,8 @@ static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
 	 * Partitions are computed on the size before rotation, use the format
 	 * at the WPF sink.
 	 */
-	format = vsp1_entity_get_pad_format(&pipe->output->entity,
-					    pipe->output->entity.state,
-					    RWPF_PAD_SINK);
+	format = v4l2_subdev_state_get_format(pipe->output->entity.state,
+					      RWPF_PAD_SINK);
 	div_size = format->width;
 
 	/*
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index 9693aeab1cac..5129181b8217 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -65,12 +65,10 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
 		goto done;
 	}
 
-	sink_format = vsp1_entity_get_pad_format(&wpf->entity,
-						 wpf->entity.state,
-						 RWPF_PAD_SINK);
-	source_format = vsp1_entity_get_pad_format(&wpf->entity,
-						   wpf->entity.state,
-						   RWPF_PAD_SOURCE);
+	sink_format = v4l2_subdev_state_get_format(wpf->entity.state,
+						   RWPF_PAD_SINK);
+	source_format = v4l2_subdev_state_get_format(wpf->entity.state,
+						     RWPF_PAD_SOURCE);
 
 	mutex_lock(&wpf->entity.lock);
 
@@ -245,12 +243,10 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	u32 srcrpf = 0;
 	int ret;
 
-	sink_format = vsp1_entity_get_pad_format(&wpf->entity,
-						 wpf->entity.state,
-						 RWPF_PAD_SINK);
-	source_format = vsp1_entity_get_pad_format(&wpf->entity,
-						   wpf->entity.state,
-						   RWPF_PAD_SOURCE);
+	sink_format = v4l2_subdev_state_get_format(wpf->entity.state,
+						   RWPF_PAD_SINK);
+	source_format = v4l2_subdev_state_get_format(wpf->entity.state,
+						     RWPF_PAD_SOURCE);
 
 	/* Format */
 	if (!pipe->lif || wpf->writeback) {
@@ -383,9 +379,8 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
 	unsigned int flip;
 	unsigned int i;
 
-	sink_format = vsp1_entity_get_pad_format(&wpf->entity,
-						 wpf->entity.state,
-						 RWPF_PAD_SINK);
+	sink_format = v4l2_subdev_state_get_format(wpf->entity.state,
+						   RWPF_PAD_SINK);
 	width = sink_format->width;
 	height = sink_format->height;
 	left = 0;
-- 
Regards,

Laurent Pinchart


