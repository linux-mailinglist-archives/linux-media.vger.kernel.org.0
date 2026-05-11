Return-Path: <linux-media+bounces-61189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIMFNo1tAmqosgEAu9opvQ
	(envelope-from <linux-media+bounces-61189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 02:00:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F5B517AFC
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 02:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A3C8301FDE9
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEEE36A36C;
	Mon, 11 May 2026 23:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IRbNAg5A"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C203736D9F1;
	Mon, 11 May 2026 23:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543811; cv=none; b=QFd38n9i3rLL2YDnkGF9ANUd/s5LDC1ROWMMhf9DaybkXWWyUzsnjwPIJhOqA0q1JV5j7pbbS2UfFFBVhl+4LpDJx2P5ABG7FLbqD5SHGnjkItzyWiqz809kgk0gtOCLjR91Rkn8FFhj7TVyaIrSNuGF44N3xiD5VI2QElFFU4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543811; c=relaxed/simple;
	bh=eAGyuj56FKDZ7ti7OpQGSfgeYSr9imYtPcv2kvcd1Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZL6FdxxVLjKAfDYH9r8vQNdco3SKWncRaDZgnNF0j8tsbn804WpqzFDgsMPs+7KOJCxlqf00Q+SUZOlGahFhRNGcrPl9JSwdmjKH3VAMyk8pMnS2J0UhIbjYrtdhmamxA/+qwhpZkYG/Z0xYPO47ilCxJ+SzvIkIli81ux7FzY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IRbNAg5A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83119243E;
	Tue, 12 May 2026 01:56:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778543799;
	bh=eAGyuj56FKDZ7ti7OpQGSfgeYSr9imYtPcv2kvcd1Cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IRbNAg5AGDXfOSWJVDaOliKsoZ02gJc8wIXL/Bm+vJp9gEgSgsf15lQZ7ZhPjrDuL
	 jL2qAjzouzm1NJaFquZBVk8fzLURAQjx3Bk06yuZ1ZyJgmD4qr4VxgF/GUjqsxFUSY
	 ERrzLeGd7BDPqYObk2KmSwc/rEHM8RvPbX7kkjG8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 06/11] media: renesas: vsp1: Use mutex scoped guards
Date: Tue, 12 May 2026 02:56:30 +0300
Message-ID: <20260511235637.3468558-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 24F5B517AFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61189-lists,linux-media=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,bp.renesas.com,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Replace remaining manual mutex locking and unlocking with scoped
guards. This simplifies error paths and reduces the amount of code.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_brx.c    |   7 +-
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 117 ++++++++----------
 .../media/platform/renesas/vsp1/vsp1_entity.c |   8 +-
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |  10 +-
 .../media/platform/renesas/vsp1/vsp1_hgt.c    |  16 +--
 .../media/platform/renesas/vsp1/vsp1_video.c  |  60 ++++-----
 6 files changed, 102 insertions(+), 116 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index bd2672341386..325be30836d7 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -190,9 +190,10 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 		if (!state)
 			return -EINVAL;
 
-		mutex_lock(&brx->entity.lock);
-		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
-		mutex_unlock(&brx->entity.lock);
+		scoped_guard(mutex, &brx->entity.lock) {
+			sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
+		}
+
 		return 0;
 
 	default:
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 1439cf7bfb59..2b64d9b5a81c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -675,43 +675,37 @@ int vsp1_du_enable(struct device *dev, unsigned int pipe_index,
 		__func__, pipe_index, cfg->width, cfg->height,
 		pipe->interlaced ? "i" : "");
 
-	mutex_lock(&vsp1->drm->lock);
+	scoped_guard(mutex, &vsp1->drm->lock) {
+		/* Setup formats through the pipeline. */
+		ret = vsp1_du_pipeline_setup_inputs(vsp1, pipe);
+		if (ret < 0)
+			return ret;
 
-	/* Setup formats through the pipeline. */
-	ret = vsp1_du_pipeline_setup_inputs(vsp1, pipe);
-	if (ret < 0)
-		goto unlock;
+		ret = vsp1_du_pipeline_setup_output(vsp1, pipe);
+		if (ret < 0)
+			return ret;
 
-	ret = vsp1_du_pipeline_setup_output(vsp1, pipe);
-	if (ret < 0)
-		goto unlock;
+		vsp1_pipeline_dump(pipe, "DU enable");
 
-	vsp1_pipeline_dump(pipe, "DU enable");
+		/* Enable the VSP1. */
+		ret = vsp1_device_get(vsp1);
+		if (ret < 0)
+			return ret;
 
-	/* Enable the VSP1. */
-	ret = vsp1_device_get(vsp1);
-	if (ret < 0)
-		goto unlock;
+		/*
+		 * Register a callback to allow us to notify the DRM driver of frame
+		 * completion events.
+		 */
+		drm_pipe->du_complete = cfg->callback;
+		drm_pipe->du_private = cfg->callback_data;
 
-	/*
-	 * Register a callback to allow us to notify the DRM driver of frame
-	 * completion events.
-	 */
-	drm_pipe->du_complete = cfg->callback;
-	drm_pipe->du_private = cfg->callback_data;
+		/* Disable the display interrupts. */
+		vsp1_write(vsp1, VI6_DISP_IRQ_STA(pipe_index), 0);
+		vsp1_write(vsp1, VI6_DISP_IRQ_ENB(pipe_index), 0);
 
-	/* Disable the display interrupts. */
-	vsp1_write(vsp1, VI6_DISP_IRQ_STA(pipe_index), 0);
-	vsp1_write(vsp1, VI6_DISP_IRQ_ENB(pipe_index), 0);
-
-	/* Configure all entities in the pipeline. */
-	vsp1_du_pipeline_configure(pipe);
-
-unlock:
-	mutex_unlock(&vsp1->drm->lock);
-
-	if (ret < 0)
-		return ret;
+		/* Configure all entities in the pipeline. */
+		vsp1_du_pipeline_configure(pipe);
+	}
 
 	/* Start the pipeline. */
 	spin_lock_irqsave(&pipe->irqlock, flags);
@@ -739,7 +733,6 @@ int vsp1_du_disable(struct device *dev, unsigned int pipe_index)
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 	struct vsp1_drm_pipeline *drm_pipe;
 	struct vsp1_pipeline *pipe;
-	struct vsp1_brx *brx;
 	unsigned int i;
 	int ret;
 
@@ -749,45 +742,43 @@ int vsp1_du_disable(struct device *dev, unsigned int pipe_index)
 	drm_pipe = &vsp1->drm->pipe[pipe_index];
 	pipe = &drm_pipe->pipe;
 
-	mutex_lock(&vsp1->drm->lock);
+	scoped_guard(mutex, &vsp1->drm->lock) {
+		struct vsp1_brx *brx = to_brx(&pipe->brx->subdev);
 
-	brx = to_brx(&pipe->brx->subdev);
+		ret = vsp1_pipeline_stop(pipe);
+		if (ret == -ETIMEDOUT)
+			dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
 
-	ret = vsp1_pipeline_stop(pipe);
-	if (ret == -ETIMEDOUT)
-		dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
+		for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
+			struct vsp1_rwpf *rpf = pipe->inputs[i];
 
-	for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
-		struct vsp1_rwpf *rpf = pipe->inputs[i];
+			if (!rpf)
+				continue;
 
-		if (!rpf)
-			continue;
+			/*
+			 * Remove the RPF from the pipe and the list of BRx
+			 * inputs.
+			 */
+			WARN_ON(!rpf->entity.pipe);
+			rpf->entity.pipe = NULL;
+			list_del(&rpf->entity.list_pipe);
+			pipe->inputs[i] = NULL;
 
-		/*
-		 * Remove the RPF from the pipe and the list of BRx
-		 * inputs.
-		 */
-		WARN_ON(!rpf->entity.pipe);
-		rpf->entity.pipe = NULL;
-		list_del(&rpf->entity.list_pipe);
-		pipe->inputs[i] = NULL;
+			brx->inputs[rpf->brx_input].rpf = NULL;
+		}
 
-		brx->inputs[rpf->brx_input].rpf = NULL;
+		drm_pipe->du_complete = NULL;
+		pipe->num_inputs = 0;
+
+		dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n",
+			__func__, pipe->lif->index,
+			BRX_NAME(pipe->brx));
+
+		list_del(&pipe->brx->list_pipe);
+		pipe->brx->pipe = NULL;
+		pipe->brx = NULL;
 	}
 
-	drm_pipe->du_complete = NULL;
-	pipe->num_inputs = 0;
-
-	dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n",
-		__func__, pipe->lif->index,
-		BRX_NAME(pipe->brx));
-
-	list_del(&pipe->brx->list_pipe);
-	pipe->brx->pipe = NULL;
-	pipe->brx = NULL;
-
-	mutex_unlock(&vsp1->drm->lock);
-
 	vsp1_dlm_reset(pipe->output->dlm);
 	vsp1_device_put(vsp1);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 3820ba53b45f..2ae2a573f0de 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -216,10 +216,10 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 		if (!state)
 			return -EINVAL;
 
-		mutex_lock(&entity->lock);
-		format = v4l2_subdev_state_get_format(state, 0);
-		code->code = format->code;
-		mutex_unlock(&entity->lock);
+		scoped_guard(mutex, &entity->lock) {
+			format = v4l2_subdev_state_get_format(state, 0);
+			code->code = format->code;
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
index 2c8ce7175a4e..0ef512e3a94b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
@@ -153,11 +153,11 @@ static void hgo_configure_stream(struct vsp1_entity *entity,
 		       (crop->width << VI6_HGO_SIZE_HSIZE_SHIFT) |
 		       (crop->height << VI6_HGO_SIZE_VSIZE_SHIFT));
 
-	mutex_lock(hgo->ctrls.handler.lock);
-	hgo->max_rgb = hgo->ctrls.max_rgb->cur.val;
-	if (hgo->ctrls.num_bins)
-		hgo->num_bins = hgo_num_bins[hgo->ctrls.num_bins->cur.val];
-	mutex_unlock(hgo->ctrls.handler.lock);
+	scoped_guard(mutex, hgo->ctrls.handler.lock) {
+		hgo->max_rgb = hgo->ctrls.max_rgb->cur.val;
+		if (hgo->ctrls.num_bins)
+			hgo->num_bins = hgo_num_bins[hgo->ctrls.num_bins->cur.val];
+	}
 
 	hratio = crop->width * 2 / compose->width / 3;
 	vratio = crop->height * 2 / compose->height / 3;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
index 858f330d44fa..78b5a9201c70 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
@@ -152,15 +152,15 @@ static void hgt_configure_stream(struct vsp1_entity *entity,
 		       (crop->width << VI6_HGT_SIZE_HSIZE_SHIFT) |
 		       (crop->height << VI6_HGT_SIZE_VSIZE_SHIFT));
 
-	mutex_lock(hgt->ctrls.lock);
-	for (i = 0; i < HGT_NUM_HUE_AREAS; ++i) {
-		lower = hgt->hue_areas[i*2 + 0];
-		upper = hgt->hue_areas[i*2 + 1];
-		vsp1_hgt_write(hgt, dlb, VI6_HGT_HUE_AREA(i),
-			       (lower << VI6_HGT_HUE_AREA_LOWER_SHIFT) |
-			       (upper << VI6_HGT_HUE_AREA_UPPER_SHIFT));
+	scoped_guard(mutex, hgt->ctrls.lock) {
+		for (i = 0; i < HGT_NUM_HUE_AREAS; ++i) {
+			lower = hgt->hue_areas[i*2 + 0];
+			upper = hgt->hue_areas[i*2 + 1];
+			vsp1_hgt_write(hgt, dlb, VI6_HGT_HUE_AREA(i),
+				       (lower << VI6_HGT_HUE_AREA_LOWER_SHIFT) |
+				       (upper << VI6_HGT_HUE_AREA_UPPER_SHIFT));
+		}
 	}
-	mutex_unlock(hgt->ctrls.lock);
 
 	hratio = crop->width * 2 / compose->width / 3;
 	vratio = crop->height * 2 / compose->height / 3;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 4cf2cc370416..138d4e08eee9 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -810,22 +810,21 @@ static int vsp1_video_start_streaming(struct vb2_queue *vq, unsigned int count)
 	unsigned long flags;
 	int ret;
 
-	mutex_lock(&pipe->lock);
-	if (pipe->stream_count == pipe->num_inputs) {
-		ret = vsp1_video_setup_pipeline(pipe);
-		if (ret < 0) {
-			vsp1_video_release_buffers(video);
-			vsp1_video_cleanup_pipeline(pipe);
-			mutex_unlock(&pipe->lock);
-			return ret;
+	scoped_guard(mutex, &pipe->lock) {
+		if (pipe->stream_count == pipe->num_inputs) {
+			ret = vsp1_video_setup_pipeline(pipe);
+			if (ret < 0) {
+				vsp1_video_release_buffers(video);
+				vsp1_video_cleanup_pipeline(pipe);
+				return ret;
+			}
+
+			start_pipeline = true;
 		}
 
-		start_pipeline = true;
+		pipe->stream_count++;
 	}
 
-	pipe->stream_count++;
-	mutex_unlock(&pipe->lock);
-
 	/*
 	 * vsp1_pipeline_ready() is not sufficient to establish that all streams
 	 * are prepared and the pipeline is configured, as multiple streams
@@ -859,16 +858,17 @@ static void vsp1_video_stop_streaming(struct vb2_queue *vq)
 	pipe->buffers_ready &= ~(1 << video->pipe_index);
 	spin_unlock_irqrestore(&video->irqlock, flags);
 
-	mutex_lock(&pipe->lock);
-	if (--pipe->stream_count == pipe->num_inputs) {
-		/* Stop the pipeline. */
-		ret = vsp1_pipeline_stop(pipe);
-		if (ret == -ETIMEDOUT)
-			dev_err(video->vsp1->dev, "pipeline stop timeout\n");
+	scoped_guard(mutex, &pipe->lock) {
+		if (--pipe->stream_count == pipe->num_inputs) {
+			/* Stop the pipeline. */
+			ret = vsp1_pipeline_stop(pipe);
+			if (ret == -ETIMEDOUT)
+				dev_err(video->vsp1->dev,
+					"pipeline stop timeout\n");
 
-		vsp1_video_cleanup_pipeline(pipe);
+			vsp1_video_cleanup_pipeline(pipe);
+		}
 	}
-	mutex_unlock(&pipe->lock);
 
 	video_device_pipeline_stop(&video->video);
 	vsp1_video_release_buffers(video);
@@ -995,22 +995,16 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	 * touching an entity in the pipeline can be activated or deactivated
 	 * once streaming is started.
 	 */
-	mutex_lock(&mdev->graph_mutex);
+	scoped_guard(mutex, &mdev->graph_mutex) {
+		pipe = vsp1_video_pipeline_get(video);
+		if (IS_ERR(pipe))
+			return PTR_ERR(pipe);
 
-	pipe = vsp1_video_pipeline_get(video);
-	if (IS_ERR(pipe)) {
-		mutex_unlock(&mdev->graph_mutex);
-		return PTR_ERR(pipe);
+		ret = __video_device_pipeline_start(&video->video, &pipe->pipe);
+		if (ret < 0)
+			goto err_pipe;
 	}
 
-	ret = __video_device_pipeline_start(&video->video, &pipe->pipe);
-	if (ret < 0) {
-		mutex_unlock(&mdev->graph_mutex);
-		goto err_pipe;
-	}
-
-	mutex_unlock(&mdev->graph_mutex);
-
 	/*
 	 * Verify that the configured format matches the output of the connected
 	 * subdev.
-- 
Regards,

Laurent Pinchart


