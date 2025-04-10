Return-Path: <linux-media+bounces-29990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEB3A8502F
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 01:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 522AA19E3AA0
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 23:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0C01DED40;
	Thu, 10 Apr 2025 23:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SeW3htL9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8A213E94;
	Thu, 10 Apr 2025 23:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744328592; cv=none; b=VAi8p9VeK93ksRMpKN6jXTtpHdDXtMPQkDtD2R8q+wzACYj0EPSi7+gu+AIuz6/BMAZ3rBcfFziQnt23aUMQ9p7D5qwjuNSwwdf89gO3j0U8fZbZ7vA96JxJTljPGGwOlW3ZC0nnXQIbObbGSJwGJ7KEA6+av6aV8nvFAAKwJpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744328592; c=relaxed/simple;
	bh=n/ByvwRWyn3E0+OXF4ONfIzKFiaT4RPmzY9bLKKb7tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lo2H3KoO2fPmYNtrq8dHiUtYq5HlARxEEAq34n8F2GxKhqpZ+Sh6pc0B01yGIGoEJLSxC1hGW7QSIgtgqWiKVzCxDjB6p6S5h56DHkcfqQGEVSkVYYHE8PjlqcJTb0+k6D5A7MVY+w4pK1ja8flvRBVfCbfLxstEPUSIYW2LnbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SeW3htL9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A99AA57;
	Fri, 11 Apr 2025 01:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744328470;
	bh=n/ByvwRWyn3E0+OXF4ONfIzKFiaT4RPmzY9bLKKb7tE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SeW3htL94+3Y0CrkDnUK99+gUnwBbUmI+aU1tKDdvNSWKFAR1m+1fu1uXpEx8c3O6
	 ubHFKGnAfPR7jsmyOuxDhNTVDHAAuo1mlmF6oqNhvPFYPAHt4l5bcSV1T+Z74YGVx1
	 SHpAXRTfJW1lfnTSfiERpY1o3Q1pYn01m2Wp6HIw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 1/3] media: renesas: vsp1: Name nested structure in vsp1_drm
Date: Fri, 11 Apr 2025 02:42:39 +0300
Message-ID: <20250410234241.28123-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410234241.28123-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250410234241.28123-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsp1_drm structure defines an anonymous nested structure to store
per-input data. In preparation for extending that structure, give it a
name and is it through the driver. This improves code readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 18 +++++++++---------
 drivers/media/platform/renesas/vsp1/vsp1_drm.h |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index f8a575f6188a..e5339fda5941 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -118,24 +118,22 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 				      struct vsp1_entity *uif,
 				      unsigned int brx_input)
 {
+	const struct vsp1_drm_input *input = &vsp1->drm->inputs[rpf->entity.index];
 	struct v4l2_subdev_selection sel = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	const struct v4l2_rect *crop;
 	int ret;
 
 	/*
 	 * Configure the format on the RPF sink pad and propagate it up to the
 	 * BRx sink pad.
 	 */
-	crop = &vsp1->drm->inputs[rpf->entity.index].crop;
-
 	format.pad = RWPF_PAD_SINK;
-	format.format.width = crop->width + crop->left;
-	format.format.height = crop->height + crop->top;
+	format.format.width = input->crop.width + input->crop.left;
+	format.format.height = input->crop.height + input->crop.top;
 	format.format.code = rpf->fmtinfo->mbus;
 	format.format.field = V4L2_FIELD_NONE;
 
@@ -151,7 +149,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 
 	sel.pad = RWPF_PAD_SINK;
 	sel.target = V4L2_SEL_TGT_CROP;
-	sel.r = *crop;
+	sel.r = input->crop;
 
 	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_selection, NULL,
 			       &sel);
@@ -826,12 +824,14 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 	struct vsp1_drm_pipeline *drm_pipe = &vsp1->drm->pipe[pipe_index];
+	struct vsp1_drm_input *input;
 	struct vsp1_rwpf *rpf;
 	int ret;
 
 	if (rpf_index >= vsp1->info->rpf_count)
 		return -EINVAL;
 
+	input = &vsp1->drm->inputs[rpf_index];
 	rpf = vsp1->rpf[rpf_index];
 
 	if (!cfg) {
@@ -873,9 +873,9 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 
 	rpf->format.flags = cfg->premult ? V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;
 
-	vsp1->drm->inputs[rpf_index].crop = cfg->src;
-	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
-	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
+	input->crop = cfg->src;
+	input->compose = cfg->dst;
+	input->zpos = cfg->zpos;
 
 	drm_pipe->pipe.inputs[rpf_index] = rpf;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.h b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
index 3fd95b53f27e..7234737cc464 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
@@ -59,7 +59,7 @@ struct vsp1_drm {
 	struct vsp1_drm_pipeline pipe[VSP1_MAX_LIF];
 	struct mutex lock;
 
-	struct {
+	struct vsp1_drm_input {
 		struct v4l2_rect crop;
 		struct v4l2_rect compose;
 		unsigned int zpos;
-- 
Regards,

Laurent Pinchart


