Return-Path: <linux-media+bounces-36746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8189AF84B9
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 02:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F82C7A657B
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1065BEAD7;
	Fri,  4 Jul 2025 00:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dGlQtTCX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298F17E4;
	Fri,  4 Jul 2025 00:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751588325; cv=none; b=mFVfILd+nLvqgWBYHpOJliFqzUdeKMoBsemshkhlXZeXYAhojm3A1vF73uQWNbPifIsvYHgOSNhxbpTurRbM9PnwySMdIPURh+h23+Y3Dk2h2igim39SsPr+zr/M1jT8y95H6Q6ce3FlGlUVn80u+pYJfMTJ4972ve9FgK3ryqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751588325; c=relaxed/simple;
	bh=XVTKM1JVtRM+jTlnnn/9kA+4P1+DvJUmBTf3pm7RhIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psakvbQCt1lkHTTbRQ9sKrn11o4kA5txe7q/VFgCIJ4B2I+0nSsgzlhy9774C/HR/LUoIQlN9XZFrQs/sXnerHygtdwk21x3U1cQiDzFmnxVOmLv9CLyWaYIlG0MFqKysXCM35ZC/AtumoVCxWae0K4n57CioeLcnxGWxsTfr1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dGlQtTCX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D444BE45;
	Fri,  4 Jul 2025 02:18:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751588297;
	bh=XVTKM1JVtRM+jTlnnn/9kA+4P1+DvJUmBTf3pm7RhIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dGlQtTCXYr8TgqNTU615blCeaOfMzCAHdREoPcVuwZlx7v9iJa/iAiOizWectvccl
	 YG2Gy0WoIPS8Cb90bZsVIubCNUXU7+WXNvCnEU5qxM4WYrBhJTP4S2wHMbCb68ywg7
	 vCJ0OpluEY3nexah9UyHgCdJHICzheNM0uI2JnWE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 1/8] media: renesas: vsp1: Store supported media bus codes in vsp1_entity
Date: Fri,  4 Jul 2025 03:18:05 +0300
Message-ID: <20250704001812.30064-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most entities use the vsp1_subdev_enum_mbus_code() and
vsp1_subdev_set_pad_format() helper functions to implement the
corresponding subdev operations. Both helpers are given the list of
supported media bus codes as arguments, requiring each entity to
implement a wrapper.

Replace the function arguments with storing the supported media bus
codes in the vsp1_entity structure. This allows dropping most of the
.enum_mbus_code() wrappers from entities.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes since v2:

- Fix build failure in IIF

Changes since v1:

- Address IIF entity
---
 .../media/platform/renesas/vsp1/vsp1_brx.c    | 22 +++++++----------
 .../media/platform/renesas/vsp1/vsp1_clu.c    | 20 +++++-----------
 .../media/platform/renesas/vsp1/vsp1_entity.c | 21 +++++++---------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  7 +++---
 .../media/platform/renesas/vsp1/vsp1_histo.c  | 18 ++++----------
 .../media/platform/renesas/vsp1/vsp1_histo.h  |  2 --
 .../media/platform/renesas/vsp1/vsp1_hsit.c   | 13 +++++++---
 .../media/platform/renesas/vsp1/vsp1_iif.c    | 15 ++++--------
 .../media/platform/renesas/vsp1/vsp1_lif.c    | 20 +++++-----------
 .../media/platform/renesas/vsp1/vsp1_lut.c    | 20 +++++-----------
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 24 ++++++++++---------
 .../media/platform/renesas/vsp1/vsp1_sru.c    | 20 ++++++----------
 .../media/platform/renesas/vsp1/vsp1_uds.c    | 20 ++++++----------
 .../media/platform/renesas/vsp1/vsp1_uif.c    | 20 +++++-----------
 14 files changed, 90 insertions(+), 152 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 5fc2e5a3bb30..3890adc8073e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -59,25 +59,17 @@ static const struct v4l2_ctrl_ops brx_ctrl_ops = {
  * V4L2 Subdevice Operations
  */
 
+static const unsigned int brx_codes[] = {
+	MEDIA_BUS_FMT_ARGB8888_1X32,
+	MEDIA_BUS_FMT_AYUV8_1X32,
+};
+
 /*
  * The BRx can't perform format conversion, all sink and source formats must be
  * identical. We pick the format on the first sink pad (pad 0) and propagate it
  * to all other pads.
  */
 
-static int brx_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_mbus_code_enum *code)
-{
-	static const unsigned int codes[] = {
-		MEDIA_BUS_FMT_ARGB8888_1X32,
-		MEDIA_BUS_FMT_AYUV8_1X32,
-	};
-
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
-					  ARRAY_SIZE(codes));
-}
-
 static int brx_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
@@ -262,7 +254,7 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops brx_pad_ops = {
-	.enum_mbus_code = brx_enum_mbus_code,
+	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
 	.enum_frame_size = brx_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = brx_set_format,
@@ -416,6 +408,8 @@ struct vsp1_brx *vsp1_brx_create(struct vsp1_device *vsp1,
 	brx->base = type == VSP1_ENTITY_BRU ? VI6_BRU_BASE : VI6_BRS_BASE;
 	brx->entity.ops = &brx_entity_ops;
 	brx->entity.type = type;
+	brx->entity.codes = brx_codes;
+	brx->entity.num_codes = ARRAY_SIZE(brx_codes);
 
 	if (type == VSP1_ENTITY_BRU) {
 		num_pads = vsp1->info->num_bru_inputs + 1;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
index 98645bd2a983..a16c9c941512 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
@@ -122,30 +122,20 @@ static const unsigned int clu_codes[] = {
 	MEDIA_BUS_FMT_AYUV8_1X32,
 };
 
-static int clu_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_mbus_code_enum *code)
-{
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, clu_codes,
-					  ARRAY_SIZE(clu_codes));
-}
-
 static int clu_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
-					   CLU_MIN_SIZE,
-					   CLU_MIN_SIZE, CLU_MAX_SIZE,
-					   CLU_MAX_SIZE);
+					   CLU_MIN_SIZE, CLU_MIN_SIZE,
+					   CLU_MAX_SIZE, CLU_MAX_SIZE);
 }
 
 static int clu_set_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, clu_codes,
-					  ARRAY_SIZE(clu_codes),
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
 					  CLU_MIN_SIZE, CLU_MIN_SIZE,
 					  CLU_MAX_SIZE, CLU_MAX_SIZE);
 }
@@ -155,7 +145,7 @@ static int clu_set_format(struct v4l2_subdev *subdev,
  */
 
 static const struct v4l2_subdev_pad_ops clu_pad_ops = {
-	.enum_mbus_code = clu_enum_mbus_code,
+	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
 	.enum_frame_size = clu_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = clu_set_format,
@@ -247,6 +237,8 @@ struct vsp1_clu *vsp1_clu_create(struct vsp1_device *vsp1)
 
 	clu->entity.ops = &clu_entity_ops;
 	clu->entity.type = VSP1_ENTITY_CLU;
+	clu->entity.codes = clu_codes;
+	clu->entity.num_codes = ARRAY_SIZE(clu_codes);
 
 	ret = vsp1_entity_init(vsp1, &clu->entity, "clu", 2, &clu_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_LUT);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index a6680d531872..7ae1e5ab1af6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -181,8 +181,6 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
  * @subdev: V4L2 subdevice
  * @sd_state: V4L2 subdev state
  * @code: Media bus code enumeration
- * @codes: Array of supported media bus codes
- * @ncodes: Number of supported media bus codes
  *
  * This function implements the subdev enum_mbus_code pad operation for entities
  * that do not support format conversion. It enumerates the given supported
@@ -191,16 +189,15 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
  */
 int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_mbus_code_enum *code,
-			       const unsigned int *codes, unsigned int ncodes)
+			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct vsp1_entity *entity = to_vsp1_entity(subdev);
 
 	if (code->pad == 0) {
-		if (code->index >= ncodes)
+		if (code->index >= entity->num_codes)
 			return -EINVAL;
 
-		code->code = codes[code->index];
+		code->code = entity->codes[code->index];
 	} else {
 		struct v4l2_subdev_state *state;
 		struct v4l2_mbus_framefmt *format;
@@ -290,15 +287,13 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
  * @subdev: V4L2 subdevice
  * @sd_state: V4L2 subdev state
  * @fmt: V4L2 subdev format
- * @codes: Array of supported media bus codes
- * @ncodes: Number of supported media bus codes
  * @min_width: Minimum image width
  * @min_height: Minimum image height
  * @max_width: Maximum image width
  * @max_height: Maximum image height
  *
  * This function implements the subdev set_fmt pad operation for entities that
- * do not support scaling or cropping. It defaults to the first supplied media
+ * do not support scaling or cropping. It defaults to the first supported media
  * bus code if the requested code isn't supported, clamps the size to the
  * supplied minimum and maximum, and propagates the sink pad format to the
  * source pad.
@@ -306,7 +301,6 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
 int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt,
-			       const unsigned int *codes, unsigned int ncodes,
 			       unsigned int min_width, unsigned int min_height,
 			       unsigned int max_width, unsigned int max_height)
 {
@@ -337,12 +331,13 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 	 * Default to the first media bus code if the requested format is not
 	 * supported.
 	 */
-	for (i = 0; i < ncodes; ++i) {
-		if (fmt->format.code == codes[i])
+	for (i = 0; i < entity->num_codes; ++i) {
+		if (fmt->format.code == entity->codes[i])
 			break;
 	}
 
-	format->code = i < ncodes ? codes[i] : codes[0];
+	format->code = i < entity->num_codes
+		     ? entity->codes[i] : entity->codes[0];
 	format->width = clamp_t(unsigned int, fmt->format.width,
 				min_width, max_width);
 	format->height = clamp_t(unsigned int, fmt->format.height,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index b7c72d0b7f8e..13ee95402234 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -113,6 +113,9 @@ struct vsp1_entity {
 	unsigned int index;
 	const struct vsp1_route *route;
 
+	const u32 *codes;
+	unsigned int num_codes;
+
 	struct vsp1_pipeline *pipe;
 
 	struct list_head list_dev;
@@ -181,13 +184,11 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
 int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt,
-			       const unsigned int *codes, unsigned int ncodes,
 			       unsigned int min_width, unsigned int min_height,
 			       unsigned int max_width, unsigned int max_height);
 int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_mbus_code_enum *code,
-			       const unsigned int *codes, unsigned int ncodes);
+			       struct v4l2_subdev_mbus_code_enum *code);
 int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_size_enum *fse,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index c762202877ba..631751dbc6d3 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -167,16 +167,12 @@ static int histo_enum_mbus_code(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct vsp1_histogram *histo = subdev_to_histo(subdev);
-
 	if (code->pad == HISTO_PAD_SOURCE) {
 		code->code = MEDIA_BUS_FMT_FIXED;
 		return 0;
 	}
 
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code,
-					  histo->formats,
-					  histo->num_formats);
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code);
 }
 
 static int histo_enum_frame_size(struct v4l2_subdev *subdev,
@@ -187,9 +183,8 @@ static int histo_enum_frame_size(struct v4l2_subdev *subdev,
 		return -EINVAL;
 
 	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
-					   HISTO_MIN_SIZE,
-					   HISTO_MIN_SIZE, HISTO_MAX_SIZE,
-					   HISTO_MAX_SIZE);
+					   HISTO_MIN_SIZE, HISTO_MIN_SIZE,
+					   HISTO_MAX_SIZE, HISTO_MAX_SIZE);
 }
 
 static int histo_get_selection(struct v4l2_subdev *subdev,
@@ -354,8 +349,6 @@ static int histo_set_format(struct v4l2_subdev *subdev,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
-	struct vsp1_histogram *histo = subdev_to_histo(subdev);
-
 	if (fmt->pad == HISTO_PAD_SOURCE) {
 		fmt->format.code = MEDIA_BUS_FMT_FIXED;
 		fmt->format.width = 0;
@@ -367,7 +360,6 @@ static int histo_set_format(struct v4l2_subdev *subdev,
 	}
 
 	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
-					  histo->formats, histo->num_formats,
 					  HISTO_MIN_SIZE, HISTO_MIN_SIZE,
 					  HISTO_MAX_SIZE, HISTO_MAX_SIZE);
 }
@@ -490,8 +482,6 @@ int vsp1_histogram_init(struct vsp1_device *vsp1, struct vsp1_histogram *histo,
 {
 	int ret;
 
-	histo->formats = formats;
-	histo->num_formats = num_formats;
 	histo->data_size = data_size;
 	histo->meta_format = meta_format;
 
@@ -506,6 +496,8 @@ int vsp1_histogram_init(struct vsp1_device *vsp1, struct vsp1_histogram *histo,
 	/* Initialize the VSP entity... */
 	histo->entity.ops = ops;
 	histo->entity.type = type;
+	histo->entity.codes = formats;
+	histo->entity.num_codes = num_formats;
 
 	ret = vsp1_entity_init(vsp1, &histo->entity, name, 2, &histo_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_STATISTICS);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.h b/drivers/media/platform/renesas/vsp1/vsp1_histo.h
index 06f029846244..227db810da52 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.h
@@ -36,8 +36,6 @@ struct vsp1_histogram {
 	struct video_device video;
 	struct media_pad pad;
 
-	const u32 *formats;
-	unsigned int num_formats;
 	size_t data_size;
 	u32 meta_format;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
index 1fcd1967d3b2..927dc185b8f7 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
@@ -34,6 +34,11 @@ static inline void vsp1_hsit_write(struct vsp1_hsit *hsit,
  * V4L2 Subdevice Operations
  */
 
+static const unsigned int hsit_codes[] = {
+	MEDIA_BUS_FMT_ARGB8888_1X32,
+	MEDIA_BUS_FMT_AHSV8888_1X32,
+};
+
 static int hsit_enum_mbus_code(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_mbus_code_enum *code)
@@ -57,9 +62,8 @@ static int hsit_enum_frame_size(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
 	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
-					   HSIT_MIN_SIZE,
-					   HSIT_MIN_SIZE, HSIT_MAX_SIZE,
-					   HSIT_MAX_SIZE);
+					   HSIT_MIN_SIZE, HSIT_MIN_SIZE,
+					   HSIT_MAX_SIZE, HSIT_MAX_SIZE);
 }
 
 static int hsit_set_format(struct v4l2_subdev *subdev,
@@ -175,6 +179,9 @@ struct vsp1_hsit *vsp1_hsit_create(struct vsp1_device *vsp1, bool inverse)
 	else
 		hsit->entity.type = VSP1_ENTITY_HST;
 
+	hsit->entity.codes = hsit_codes;
+	hsit->entity.num_codes = ARRAY_SIZE(hsit_codes);
+
 	ret = vsp1_entity_init(vsp1, &hsit->entity, inverse ? "hsi" : "hst",
 			       2, &hsit_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_iif.c b/drivers/media/platform/renesas/vsp1/vsp1_iif.c
index 5dd62bebbe8c..7ba792892373 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_iif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_iif.c
@@ -36,14 +36,6 @@ static const unsigned int iif_codes[] = {
 	MEDIA_BUS_FMT_METADATA_FIXED
 };
 
-static int iif_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_mbus_code_enum *code)
-{
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, iif_codes,
-					  ARRAY_SIZE(iif_codes));
-}
-
 static int iif_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
@@ -57,14 +49,13 @@ static int iif_set_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, iif_codes,
-					  ARRAY_SIZE(iif_codes),
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
 					  IIF_MIN_WIDTH, IIF_MIN_HEIGHT,
 					  IIF_MAX_WIDTH, IIF_MAX_HEIGHT);
 }
 
 static const struct v4l2_subdev_pad_ops iif_pad_ops = {
-	.enum_mbus_code = iif_enum_mbus_code,
+	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
 	.enum_frame_size = iif_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = iif_set_format,
@@ -106,6 +97,8 @@ struct vsp1_iif *vsp1_iif_create(struct vsp1_device *vsp1)
 
 	iif->entity.ops = &iif_entity_ops;
 	iif->entity.type = VSP1_ENTITY_IIF;
+	iif->entity.codes = iif_codes;
+	iif->entity.num_codes = ARRAY_SIZE(iif_codes);
 
 	/*
 	 * The IIF is never exposed to userspace, but media entity registration
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
index b3d83d1c5306..6c1cbe2d8524 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
@@ -39,36 +39,26 @@ static const unsigned int lif_codes[] = {
 	MEDIA_BUS_FMT_AYUV8_1X32,
 };
 
-static int lif_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_mbus_code_enum *code)
-{
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, lif_codes,
-					  ARRAY_SIZE(lif_codes));
-}
-
 static int lif_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
-					   LIF_MIN_SIZE,
-					   LIF_MIN_SIZE, LIF_MAX_SIZE,
-					   LIF_MAX_SIZE);
+					   LIF_MIN_SIZE, LIF_MIN_SIZE,
+					   LIF_MAX_SIZE, LIF_MAX_SIZE);
 }
 
 static int lif_set_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, lif_codes,
-					  ARRAY_SIZE(lif_codes),
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
 					  LIF_MIN_SIZE, LIF_MIN_SIZE,
 					  LIF_MAX_SIZE, LIF_MAX_SIZE);
 }
 
 static const struct v4l2_subdev_pad_ops lif_pad_ops = {
-	.enum_mbus_code = lif_enum_mbus_code,
+	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
 	.enum_frame_size = lif_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = lif_set_format,
@@ -162,6 +152,8 @@ struct vsp1_lif *vsp1_lif_create(struct vsp1_device *vsp1, unsigned int index)
 	lif->entity.ops = &lif_entity_ops;
 	lif->entity.type = VSP1_ENTITY_LIF;
 	lif->entity.index = index;
+	lif->entity.codes = lif_codes;
+	lif->entity.num_codes = ARRAY_SIZE(lif_codes);
 
 	/*
 	 * The LIF is never exposed to userspace, but media entity registration
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
index dd264e6532e0..46c79cdccd69 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
@@ -98,30 +98,20 @@ static const unsigned int lut_codes[] = {
 	MEDIA_BUS_FMT_AYUV8_1X32,
 };
 
-static int lut_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_mbus_code_enum *code)
-{
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, lut_codes,
-					  ARRAY_SIZE(lut_codes));
-}
-
 static int lut_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
-					   LUT_MIN_SIZE,
-					   LUT_MIN_SIZE, LUT_MAX_SIZE,
-					   LUT_MAX_SIZE);
+					   LUT_MIN_SIZE, LUT_MIN_SIZE,
+					   LUT_MAX_SIZE, LUT_MAX_SIZE);
 }
 
 static int lut_set_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, lut_codes,
-					  ARRAY_SIZE(lut_codes),
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
 					  LUT_MIN_SIZE, LUT_MIN_SIZE,
 					  LUT_MAX_SIZE, LUT_MAX_SIZE);
 }
@@ -131,7 +121,7 @@ static int lut_set_format(struct v4l2_subdev *subdev,
  */
 
 static const struct v4l2_subdev_pad_ops lut_pad_ops = {
-	.enum_mbus_code = lut_enum_mbus_code,
+	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
 	.enum_frame_size = lut_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = lut_set_format,
@@ -208,6 +198,8 @@ struct vsp1_lut *vsp1_lut_create(struct vsp1_device *vsp1)
 
 	lut->entity.ops = &lut_entity_ops;
 	lut->entity.type = VSP1_ENTITY_LUT;
+	lut->entity.codes = lut_codes;
+	lut->entity.num_codes = ARRAY_SIZE(lut_codes);
 
 	ret = vsp1_entity_init(vsp1, &lut->entity, "lut", 2, &lut_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_LUT);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 9c8085d5d306..304a2f618777 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -21,20 +21,20 @@
  * V4L2 Subdevice Operations
  */
 
+static const unsigned int rwpf_codes[] = {
+	MEDIA_BUS_FMT_ARGB8888_1X32,
+	MEDIA_BUS_FMT_AHSV8888_1X32,
+	MEDIA_BUS_FMT_AYUV8_1X32,
+};
+
 static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	static const unsigned int codes[] = {
-		MEDIA_BUS_FMT_ARGB8888_1X32,
-		MEDIA_BUS_FMT_AHSV8888_1X32,
-		MEDIA_BUS_FMT_AYUV8_1X32,
-	};
-
-	if (code->index >= ARRAY_SIZE(codes))
+	if (code->index >= ARRAY_SIZE(rwpf_codes))
 		return -EINVAL;
 
-	code->code = codes[code->index];
+	code->code = rwpf_codes[code->index];
 
 	if (code->pad == RWPF_PAD_SOURCE &&
 	    code->code == MEDIA_BUS_FMT_AYUV8_1X32)
@@ -51,9 +51,8 @@ static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
 
 	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
-					   RWPF_MIN_WIDTH,
-					   RWPF_MIN_HEIGHT, rwpf->max_width,
-					   rwpf->max_height);
+					   RWPF_MIN_WIDTH, RWPF_MIN_HEIGHT,
+					   rwpf->max_width, rwpf->max_height);
 }
 
 static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
@@ -311,6 +310,9 @@ static const struct v4l2_ctrl_ops vsp1_rwpf_ctrl_ops = {
 
 int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols)
 {
+	rwpf->entity.codes = rwpf_codes;
+	rwpf->entity.num_codes = ARRAY_SIZE(rwpf_codes);
+
 	v4l2_ctrl_handler_init(&rwpf->ctrls, ncontrols + 1);
 	v4l2_ctrl_new_std(&rwpf->ctrls, &vsp1_rwpf_ctrl_ops,
 			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index bba2872afaf2..8e587efc0dc2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -106,18 +106,10 @@ static const struct v4l2_ctrl_config sru_intensity_control = {
  * V4L2 Subdevice Operations
  */
 
-static int sru_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_mbus_code_enum *code)
-{
-	static const unsigned int codes[] = {
-		MEDIA_BUS_FMT_ARGB8888_1X32,
-		MEDIA_BUS_FMT_AYUV8_1X32,
-	};
-
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
-					  ARRAY_SIZE(codes));
-}
+static const unsigned int sru_codes[] = {
+	MEDIA_BUS_FMT_ARGB8888_1X32,
+	MEDIA_BUS_FMT_AYUV8_1X32,
+};
 
 static int sru_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
@@ -257,7 +249,7 @@ static int sru_set_format(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops sru_pad_ops = {
-	.enum_mbus_code = sru_enum_mbus_code,
+	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
 	.enum_frame_size = sru_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = sru_set_format,
@@ -370,6 +362,8 @@ struct vsp1_sru *vsp1_sru_create(struct vsp1_device *vsp1)
 
 	sru->entity.ops = &sru_entity_ops;
 	sru->entity.type = VSP1_ENTITY_SRU;
+	sru->entity.codes = sru_codes;
+	sru->entity.num_codes = ARRAY_SIZE(sru_codes);
 
 	ret = vsp1_entity_init(vsp1, &sru->entity, "sru", 2, &sru_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_SCALER);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index 2db473b6f83c..928b09e20add 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -111,18 +111,10 @@ static unsigned int uds_compute_ratio(unsigned int input, unsigned int output)
  * V4L2 Subdevice Pad Operations
  */
 
-static int uds_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_mbus_code_enum *code)
-{
-	static const unsigned int codes[] = {
-		MEDIA_BUS_FMT_ARGB8888_1X32,
-		MEDIA_BUS_FMT_AYUV8_1X32,
-	};
-
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
-					  ARRAY_SIZE(codes));
-}
+static const unsigned int uds_codes[] = {
+	MEDIA_BUS_FMT_ARGB8888_1X32,
+	MEDIA_BUS_FMT_AYUV8_1X32,
+};
 
 static int uds_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
@@ -244,7 +236,7 @@ static int uds_set_format(struct v4l2_subdev *subdev,
  */
 
 static const struct v4l2_subdev_pad_ops uds_pad_ops = {
-	.enum_mbus_code = uds_enum_mbus_code,
+	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
 	.enum_frame_size = uds_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = uds_set_format,
@@ -410,6 +402,8 @@ struct vsp1_uds *vsp1_uds_create(struct vsp1_device *vsp1, unsigned int index)
 	uds->entity.ops = &uds_entity_ops;
 	uds->entity.type = VSP1_ENTITY_UDS;
 	uds->entity.index = index;
+	uds->entity.codes = uds_codes;
+	uds->entity.num_codes = ARRAY_SIZE(uds_codes);
 
 	sprintf(name, "uds.%u", index);
 	ret = vsp1_entity_init(vsp1, &uds->entity, name, 2, &uds_ops,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
index edaf28b544d2..e1bb6c709721 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
@@ -53,30 +53,20 @@ static const unsigned int uif_codes[] = {
 	MEDIA_BUS_FMT_AYUV8_1X32,
 };
 
-static int uif_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_mbus_code_enum *code)
-{
-	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, uif_codes,
-					  ARRAY_SIZE(uif_codes));
-}
-
 static int uif_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
-					   UIF_MIN_SIZE,
-					   UIF_MIN_SIZE, UIF_MAX_SIZE,
-					   UIF_MAX_SIZE);
+					   UIF_MIN_SIZE, UIF_MIN_SIZE,
+					   UIF_MAX_SIZE, UIF_MAX_SIZE);
 }
 
 static int uif_set_format(struct v4l2_subdev *subdev,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, uif_codes,
-					  ARRAY_SIZE(uif_codes),
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
 					  UIF_MIN_SIZE, UIF_MIN_SIZE,
 					  UIF_MAX_SIZE, UIF_MAX_SIZE);
 }
@@ -171,7 +161,7 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
  */
 
 static const struct v4l2_subdev_pad_ops uif_pad_ops = {
-	.enum_mbus_code = uif_enum_mbus_code,
+	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
 	.enum_frame_size = uif_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = uif_set_format,
@@ -250,6 +240,8 @@ struct vsp1_uif *vsp1_uif_create(struct vsp1_device *vsp1, unsigned int index)
 	uif->entity.ops = &uif_entity_ops;
 	uif->entity.type = VSP1_ENTITY_UIF;
 	uif->entity.index = index;
+	uif->entity.codes = uif_codes;
+	uif->entity.num_codes = ARRAY_SIZE(uif_codes);
 
 	/* The datasheet names the two UIF instances UIF4 and UIF5. */
 	sprintf(name, "uif.%u", index + 4);
-- 
Regards,

Laurent Pinchart


