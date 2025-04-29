Return-Path: <linux-media+bounces-31354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9132AA3C40
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 01:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44BE217811A
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 23:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6AE2DCB73;
	Tue, 29 Apr 2025 23:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T47wRBAb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37DE2DCB4E;
	Tue, 29 Apr 2025 23:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969370; cv=none; b=cHhNd9cCt5jHHa2F+epslbe8NEjcT9hnY/BqMiL9cAV+566i0PR/C9NUW1xL82VJnPJz8aPUW2i0JI9zHiFUkxgqsjzRRT/SIr5/wfuBGQACoPCeIw1g4I+mE72mYcnS5V/zOexVY03vxfTCM+bhXmgUFsZulnjmeO8VMf1yzY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969370; c=relaxed/simple;
	bh=JW8R+ouKfZDbf21xsY26yAdEIf0xJhExWbz+oLvI4WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rri+AaRJxO0E707eO+8JVYyQQ5R0618b1nOi3eIMZy89xuolywpJ1jRYrir1KT/UljP0+WLfhmU/P4mQlhwk+3FlZxXdAQuj1C3AQBbz1XvkyGF2qqcyy+FntsGDQIdS+IqDoXmeMzNRvROIhc218hhmL6aeYcCu0rA57+jOA2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T47wRBAb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E68B1838;
	Wed, 30 Apr 2025 01:29:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745969357;
	bh=JW8R+ouKfZDbf21xsY26yAdEIf0xJhExWbz+oLvI4WA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T47wRBAbP7Ypwcizz/Vg/rKo/wPTA7G3Fv0aMQx1eGQeO7ubzgNxjXLYj5pEUenGE
	 Qxeh+yjwxoz3KoeCto5RhjHNN1gBTLyUdUY9X+T9egZ6uz2nTGk3UbO9Cev7BOOd5e
	 itMt+IM+/MNqcQXapAF4bBFFmZso4jY6Tj6IedP8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 8/9] media: renesas: vsp1: Expose color space through the DRM API
Date: Wed, 30 Apr 2025 02:29:03 +0300
Message-ID: <20250429232904.26413-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the VSP1 driver supports color spaces, expose them through the
API used by the DU driver. This allows configuring the YCbCr encoding
and quantization used by each plane, ensuring correct color rendering.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 4 ++++
 drivers/media/platform/renesas/vsp1/vsp1_drm.h | 6 ++++--
 include/media/vsp1.h                           | 4 ++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index e5339fda5941..fe55e8747b05 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -136,6 +136,8 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	format.format.height = input->crop.height + input->crop.top;
 	format.format.code = rpf->fmtinfo->mbus;
 	format.format.field = V4L2_FIELD_NONE;
+	format.format.ycbcr_enc = input->ycbcr_enc;
+	format.format.quantization = input->quantization;
 
 	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL,
 			       &format);
@@ -876,6 +878,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 	input->crop = cfg->src;
 	input->compose = cfg->dst;
 	input->zpos = cfg->zpos;
+	input->ycbcr_enc = cfg->color_encoding;
+	input->quantization = cfg->color_range;
 
 	drm_pipe->pipe.inputs[rpf_index] = rpf;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.h b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
index 7234737cc464..07a5d0adbd08 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
@@ -52,8 +52,8 @@ struct vsp1_drm_pipeline {
  * struct vsp1_drm - State for the API exposed to the DRM driver
  * @pipe: the VSP1 DRM pipeline used for display
  * @lock: protects the BRU and BRS allocation
- * @inputs: source crop rectangle, destination compose rectangle and z-order
- *	position for every input (indexed by RPF index)
+ * @inputs: source crop rectangle, destination compose rectangle, z-order
+ *	position and colorspace for every input (indexed by RPF index)
  */
 struct vsp1_drm {
 	struct vsp1_drm_pipeline pipe[VSP1_MAX_LIF];
@@ -63,6 +63,8 @@ struct vsp1_drm {
 		struct v4l2_rect crop;
 		struct v4l2_rect compose;
 		unsigned int zpos;
+		enum v4l2_ycbcr_encoding ycbcr_enc;
+		enum v4l2_quantization quantization;
 	} inputs[VSP1_MAX_RPF];
 };
 
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index 48f4a5023d81..4ea6352fd63f 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -52,6 +52,8 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
  * @alpha: alpha value (0: fully transparent, 255: fully opaque)
  * @zpos: Z position of the plane (from 0 to number of planes minus 1)
  * @premult: true for premultiplied alpha
+ * @color_encoding: color encoding (valid for YUV formats only)
+ * @color_range: color range (valid for YUV formats only)
  */
 struct vsp1_du_atomic_config {
 	u32 pixelformat;
@@ -62,6 +64,8 @@ struct vsp1_du_atomic_config {
 	unsigned int alpha;
 	unsigned int zpos;
 	bool premult;
+	enum v4l2_ycbcr_encoding color_encoding;
+	enum v4l2_quantization color_range;
 };
 
 /**
-- 
Regards,

Laurent Pinchart


