Return-Path: <linux-media+bounces-13640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1F690E0B0
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C70C71C22C01
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99AD6FBE;
	Wed, 19 Jun 2024 00:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SyuBpWFu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37308E546;
	Wed, 19 Jun 2024 00:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756299; cv=none; b=dCzkiIUO1Ljko8jmB7E8h2uLRD7jm00NiLC92iOvMp+7xvtSB15zfUT3k1NTW3VcybhcxiTHx4Oy8wEoCXl/NsgnW7G2WMgVnRMfbORY6D7cceahLbVtlagoHbqqYfpiigNBp81v0jH+gTgmOQqsxc7P101X7Nifi9UqM5B1eG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756299; c=relaxed/simple;
	bh=fXLlkwxLJhD7oCJarVGNsZJ97VJEgQheBDFZodIH51M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqotgADEbaqZM97FUOaag4hLaCpmbqA0XWv7h8QE4uYUPILHIqgHoePH29CRo6fT9mu9ABFizNHqnixaI8iUr4sB2t2TiF6kz+wD2esQZJJR23923Ll7N2wVGYbFdwyM55TMwA9enPrSKBPg1/Brbxi7Uo1Qu77sDL6JMUF9D1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SyuBpWFu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAA521280;
	Wed, 19 Jun 2024 02:17:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756273;
	bh=fXLlkwxLJhD7oCJarVGNsZJ97VJEgQheBDFZodIH51M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SyuBpWFumBoMHhzhmN5qWvISiuTbVmeszt/kxAAyPMvHn+8Qg8PPlEVJ9vYt3BAIi
	 rTQmGoCNM5H3/r+Y7koI7IQjG5G8GwufLeTYhpjtP1wc+XXi33O6VFhEoFRexS0wzq
	 JopW0ONAzrWSwxSysCUAokkfApZyTM3TisMuUAY0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 19/19] media: renesas: vsp1: Rename all v4l2_subdev_state variables to 'state'
Date: Wed, 19 Jun 2024 03:17:22 +0300
Message-ID: <20240619001722.9749-20-laurent.pinchart+renesas@ideasonboard.com>
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

The driver names variables (including function parameters) of
struct *v4l2_subdev_state type either 'state' or 'sd_state'. Rename them
all to 'state' for consistency.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_brx.c    | 11 ++++----
 .../media/platform/renesas/vsp1/vsp1_clu.c    | 12 ++++-----
 .../media/platform/renesas/vsp1/vsp1_entity.c |  4 +--
 .../media/platform/renesas/vsp1/vsp1_histo.c  | 26 +++++++++----------
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  6 ++---
 .../media/platform/renesas/vsp1/vsp1_lif.c    | 12 ++++-----
 .../media/platform/renesas/vsp1/vsp1_lut.c    | 12 ++++-----
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  6 ++---
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  8 +++---
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  8 +++---
 .../media/platform/renesas/vsp1/vsp1_uif.c    | 12 ++++-----
 11 files changed, 58 insertions(+), 59 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 849012b178f4..53c97bef44c1 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -65,7 +65,7 @@ static const struct v4l2_ctrl_ops brx_ctrl_ops = {
  */
 
 static int brx_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	static const unsigned int codes[] = {
@@ -73,12 +73,12 @@ static int brx_enum_mbus_code(struct v4l2_subdev *subdev,
 		MEDIA_BUS_FMT_AYUV8_1X32,
 	};
 
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
+	return vsp1_subdev_enum_mbus_code(subdev, state, code, codes,
 					  ARRAY_SIZE(codes));
 }
 
 static int brx_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index)
@@ -97,7 +97,7 @@ static int brx_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static void brx_try_format(struct vsp1_brx *brx,
-			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_state *state,
 			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
 {
 	struct v4l2_mbus_framefmt *format;
@@ -112,8 +112,7 @@ static void brx_try_format(struct vsp1_brx *brx,
 
 	default:
 		/* The BRx can't perform format conversion. */
-		format = v4l2_subdev_state_get_format(sd_state,
-						      BRX_PAD_SINK(0));
+		format = v4l2_subdev_state_get_format(state, BRX_PAD_SINK(0));
 		fmt->code = format->code;
 		break;
 	}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
index d1340e3f3e69..bf88db8f4ff2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
@@ -123,28 +123,28 @@ static const unsigned int clu_codes[] = {
 };
 
 static int clu_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, clu_codes,
+	return vsp1_subdev_enum_mbus_code(subdev, state, code, clu_codes,
 					  ARRAY_SIZE(clu_codes));
 }
 
 static int clu_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
-	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+	return vsp1_subdev_enum_frame_size(subdev, state, fse,
 					   CLU_MIN_SIZE,
 					   CLU_MIN_SIZE, CLU_MAX_SIZE,
 					   CLU_MAX_SIZE);
 }
 
 static int clu_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, clu_codes,
+	return vsp1_subdev_set_pad_format(subdev, state, fmt, clu_codes,
 					  ARRAY_SIZE(clu_codes),
 					  CLU_MIN_SIZE, CLU_MIN_SIZE,
 					  CLU_MAX_SIZE, CLU_MAX_SIZE);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index f4e6e2f27182..66308659ffc0 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -268,7 +268,7 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_state *sd_state)
+				  struct v4l2_subdev_state *state)
 {
 	unsigned int pad;
 
@@ -278,7 +278,7 @@ static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
 			.pad = pad,
 		};
 
-		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
+		v4l2_subdev_call(subdev, pad, set_fmt, state, &format);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index d3bf7a281646..6cebd7055c5e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -166,7 +166,7 @@ static const struct vb2_ops histo_video_queue_qops = {
  */
 
 static int histo_enum_mbus_code(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
@@ -176,19 +176,19 @@ static int histo_enum_mbus_code(struct v4l2_subdev *subdev,
 		return 0;
 	}
 
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code,
+	return vsp1_subdev_enum_mbus_code(subdev, state, code,
 					  histo->formats,
 					  histo->num_formats);
 }
 
 static int histo_enum_frame_size(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->pad != HISTO_PAD_SINK)
 		return -EINVAL;
 
-	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+	return vsp1_subdev_enum_frame_size(subdev, state, fse,
 					   HISTO_MIN_SIZE,
 					   HISTO_MIN_SIZE, HISTO_MAX_SIZE,
 					   HISTO_MAX_SIZE);
@@ -239,13 +239,13 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_crop(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_selection *sel)
 {
 	struct v4l2_mbus_framefmt *format;
 
 	/* The crop rectangle must be inside the input frame. */
-	format = v4l2_subdev_state_get_format(sd_state, HISTO_PAD_SINK);
+	format = v4l2_subdev_state_get_format(state, HISTO_PAD_SINK);
 	sel->r.left = clamp_t(unsigned int, sel->r.left, 0, format->width - 1);
 	sel->r.top = clamp_t(unsigned int, sel->r.top, 0, format->height - 1);
 	sel->r.width = clamp_t(unsigned int, sel->r.width, HISTO_MIN_SIZE,
@@ -254,14 +254,14 @@ static int histo_set_crop(struct v4l2_subdev *subdev,
 				format->height - sel->r.top);
 
 	/* Set the crop rectangle and reset the compose rectangle. */
-	*v4l2_subdev_state_get_crop(sd_state, sel->pad) = sel->r;
-	*v4l2_subdev_state_get_compose(sd_state, sel->pad) = sel->r;
+	*v4l2_subdev_state_get_crop(state, sel->pad) = sel->r;
+	*v4l2_subdev_state_get_compose(state, sel->pad) = sel->r;
 
 	return 0;
 }
 
 static int histo_set_compose(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct v4l2_rect *compose;
@@ -276,7 +276,7 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 	sel->r.left = 0;
 	sel->r.top = 0;
 
-	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
+	crop = v4l2_subdev_state_get_crop(state, sel->pad);
 
 	/*
 	 * Clamp the width and height to acceptable values first and then
@@ -301,7 +301,7 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 	ratio = 1 << (crop->height * 2 / sel->r.height / 3);
 	sel->r.height = crop->height / ratio;
 
-	compose = v4l2_subdev_state_get_compose(sd_state, sel->pad);
+	compose = v4l2_subdev_state_get_compose(state, sel->pad);
 	*compose = sel->r;
 
 	return 0;
@@ -323,7 +323,7 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_format(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_state *sd_state,
+			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
@@ -338,7 +338,7 @@ static int histo_set_format(struct v4l2_subdev *subdev,
 		return 0;
 	}
 
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
+	return vsp1_subdev_set_pad_format(subdev, state, fmt,
 					  histo->formats, histo->num_formats,
 					  HISTO_MIN_SIZE, HISTO_MIN_SIZE,
 					  HISTO_MAX_SIZE, HISTO_MAX_SIZE);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
index 069d3de1797f..0aedaff58019 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
@@ -34,7 +34,7 @@ static inline void vsp1_hsit_write(struct vsp1_hsit *hsit,
  */
 
 static int hsit_enum_mbus_code(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct vsp1_hsit *hsit = to_hsit(subdev);
@@ -52,10 +52,10 @@ static int hsit_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int hsit_enum_frame_size(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
-	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+	return vsp1_subdev_enum_frame_size(subdev, state, fse,
 					   HSIT_MIN_SIZE,
 					   HSIT_MIN_SIZE, HSIT_MAX_SIZE,
 					   HSIT_MAX_SIZE);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
index f1fefa2817d4..271ee8fd2b91 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
@@ -40,28 +40,28 @@ static const unsigned int lif_codes[] = {
 };
 
 static int lif_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, lif_codes,
+	return vsp1_subdev_enum_mbus_code(subdev, state, code, lif_codes,
 					  ARRAY_SIZE(lif_codes));
 }
 
 static int lif_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
-	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+	return vsp1_subdev_enum_frame_size(subdev, state, fse,
 					   LIF_MIN_SIZE,
 					   LIF_MIN_SIZE, LIF_MAX_SIZE,
 					   LIF_MAX_SIZE);
 }
 
 static int lif_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, lif_codes,
+	return vsp1_subdev_set_pad_format(subdev, state, fmt, lif_codes,
 					  ARRAY_SIZE(lif_codes),
 					  LIF_MIN_SIZE, LIF_MIN_SIZE,
 					  LIF_MAX_SIZE, LIF_MAX_SIZE);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
index 1063076ad33f..ebe4cb03a7a8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
@@ -99,28 +99,28 @@ static const unsigned int lut_codes[] = {
 };
 
 static int lut_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, lut_codes,
+	return vsp1_subdev_enum_mbus_code(subdev, state, code, lut_codes,
 					  ARRAY_SIZE(lut_codes));
 }
 
 static int lut_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
-	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+	return vsp1_subdev_enum_frame_size(subdev, state, fse,
 					   LUT_MIN_SIZE,
 					   LUT_MIN_SIZE, LUT_MAX_SIZE,
 					   LUT_MAX_SIZE);
 }
 
 static int lut_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, lut_codes,
+	return vsp1_subdev_set_pad_format(subdev, state, fmt, lut_codes,
 					  ARRAY_SIZE(lut_codes),
 					  LUT_MIN_SIZE, LUT_MIN_SIZE,
 					  LUT_MAX_SIZE, LUT_MAX_SIZE);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index e4edce3bf584..1745e7d714f9 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -21,7 +21,7 @@
  */
 
 static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
 	static const unsigned int codes[] = {
@@ -39,12 +39,12 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
-				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_state *state,
 				     struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
 
-	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+	return vsp1_subdev_enum_frame_size(subdev, state, fse,
 					   RWPF_MIN_WIDTH,
 					   RWPF_MIN_HEIGHT, rwpf->max_width,
 					   rwpf->max_height);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index a5c839381b84..342ca8a28125 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -106,7 +106,7 @@ static const struct v4l2_ctrl_config sru_intensity_control = {
  */
 
 static int sru_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	static const unsigned int codes[] = {
@@ -114,7 +114,7 @@ static int sru_enum_mbus_code(struct v4l2_subdev *subdev,
 		MEDIA_BUS_FMT_AYUV8_1X32,
 	};
 
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
+	return vsp1_subdev_enum_mbus_code(subdev, state, code, codes,
 					  ARRAY_SIZE(codes));
 }
 
@@ -151,7 +151,7 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static void sru_try_format(struct vsp1_sru *sru,
-			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_state *state,
 			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
 {
 	struct v4l2_mbus_framefmt *format;
@@ -171,7 +171,7 @@ static void sru_try_format(struct vsp1_sru *sru,
 
 	case SRU_PAD_SOURCE:
 		/* The SRU can't perform format conversion. */
-		format = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
+		format = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
 		fmt->code = format->code;
 
 		/*
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index fd28504d3538..e36720c41143 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -111,7 +111,7 @@ static unsigned int uds_compute_ratio(unsigned int input, unsigned int output)
  */
 
 static int uds_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	static const unsigned int codes[] = {
@@ -119,7 +119,7 @@ static int uds_enum_mbus_code(struct v4l2_subdev *subdev,
 		MEDIA_BUS_FMT_AYUV8_1X32,
 	};
 
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
+	return vsp1_subdev_enum_mbus_code(subdev, state, code, codes,
 					  ARRAY_SIZE(codes));
 }
 
@@ -150,7 +150,7 @@ static int uds_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static void uds_try_format(struct vsp1_uds *uds,
-			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_state *state,
 			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
 {
 	struct v4l2_mbus_framefmt *format;
@@ -170,7 +170,7 @@ static void uds_try_format(struct vsp1_uds *uds,
 
 	case UDS_PAD_SOURCE:
 		/* The UDS scales but can't perform format conversion. */
-		format = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
+		format = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
 		fmt->code = format->code;
 
 		uds_output_limits(format->width, &minimum, &maximum);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
index 911543ee702b..9739fefa8260 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
@@ -54,28 +54,28 @@ static const unsigned int uif_codes[] = {
 };
 
 static int uif_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, uif_codes,
+	return vsp1_subdev_enum_mbus_code(subdev, state, code, uif_codes,
 					  ARRAY_SIZE(uif_codes));
 }
 
 static int uif_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
-	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+	return vsp1_subdev_enum_frame_size(subdev, state, fse,
 					   UIF_MIN_SIZE,
 					   UIF_MIN_SIZE, UIF_MAX_SIZE,
 					   UIF_MAX_SIZE);
 }
 
 static int uif_set_format(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_state *sd_state,
+			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, uif_codes,
+	return vsp1_subdev_set_pad_format(subdev, state, fmt, uif_codes,
 					  ARRAY_SIZE(uif_codes),
 					  UIF_MIN_SIZE, UIF_MIN_SIZE,
 					  UIF_MAX_SIZE, UIF_MAX_SIZE);
-- 
Regards,

Laurent Pinchart


