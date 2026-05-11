Return-Path: <linux-media+bounces-61185-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GAtOIBtAmqosgEAu9opvQ
	(envelope-from <linux-media+bounces-61185-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 02:00:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB66517AED
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 02:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12235301D0C2
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB47363098;
	Mon, 11 May 2026 23:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="alYEbfja"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD9C36A378;
	Mon, 11 May 2026 23:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543805; cv=none; b=JEYM6mbxiraw5LDohzjJCrOQBjnBrLUOXvOt6jXJ6EiKnBk2zxVLuY6VAdBb/9akxl7ECnJIDpox9v5PCor+MtiwoMQ2jRMz3F2t0w5US8nfGodpxKT6I8AolqqOwcM8eZN7wgBBznmfK1HvqP7WwqzwzkttjwjOMlkr+eV7aEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543805; c=relaxed/simple;
	bh=VLHxI+wMEqNieCtOhiiJkWEW3TlZhh0hLK8jLY2Jh/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sA/Q9tdbm9ZfFNf+yjgSTWbartN6ZnxASTyxmi3VK5ghriNLeuj/Hg14E9CAC7Y86pA3NZGXjrdeIL9p7izO6v5RFSWwLDxbU25NkF60DkMsRf8+L5dCqRQ16BoqdPjkv8Jpw0Z3OYvaoiyany1IWP14P+ZgFynIvKbgVxtg3ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=alYEbfja; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3846CE0D;
	Tue, 12 May 2026 01:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778543794;
	bh=VLHxI+wMEqNieCtOhiiJkWEW3TlZhh0hLK8jLY2Jh/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=alYEbfja7wtMaxPHjtFeo0xJmEVdbMfKMcN0hw3BIkANPtbIT3d7zVetFdPdwEdNB
	 VZvLVtVh99xOLbuDPYCVitDn9rMAo/7e018jKNS7XZxmqCZZoeMTaiS4qFxiG8NcI5
	 D5dMa7l3vo79wMiSrL6oFduJbcXrM3hQ25opQD8U=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 02/11] media: renesas: vsp1: Split vsp1_du_setup_lif()
Date: Tue, 12 May 2026 02:56:26 +0300
Message-ID: <20260511235637.3468558-3-laurent.pinchart+renesas@ideasonboard.com>
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
X-Rspamd-Queue-Id: 2BB66517AED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61185-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

The vsp1_du_setup_lif() function is used to configure and enable a
pipeline, as well as disable it, depending on the cfg argument being a
valid pointer or NULL. This creates a confusing API. Improve it by
splitting the function in two, a vsp1_du_enable() function to configure
a pipeline, and a vsp1_du_disable() function to disaple it.

Keep vsp1_du_setup_lif() as an inline wrapper for existing callers in
the DRM subsystem, to simplify merging. The callers will be updated
separately and the old API will then be removed.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 140 ++++++++++--------
 include/media/vsp1.h                          |  14 +-
 2 files changed, 91 insertions(+), 63 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 79b85968b061..1f431874064d 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -629,14 +629,14 @@ int vsp1_du_init(struct device *dev)
 EXPORT_SYMBOL_GPL(vsp1_du_init);
 
 /**
- * vsp1_du_setup_lif - Setup the output part of the VSP pipeline
+ * vsp1_du_enable - Setup and enable a DU pipeline
  * @dev: the VSP device
  * @pipe_index: the DRM pipeline index
  * @cfg: the LIF configuration
  *
  * Configure the output part of VSP DRM pipeline for the given frame @cfg.width
  * and @cfg.height. This sets up formats on the BRx source pad, the WPF sink and
- * source pads, and the LIF sink pad.
+ * source pads, and the LIF sink pad, and then starts the pipeline.
  *
  * The @pipe_index argument selects which DRM pipeline to setup. The number of
  * available pipelines depend on the VSP instance.
@@ -649,14 +649,13 @@ EXPORT_SYMBOL_GPL(vsp1_du_init);
  *
  * Return 0 on success or a negative error code on failure.
  */
-int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
-		      const struct vsp1_du_lif_config *cfg)
+int vsp1_du_enable(struct device *dev, unsigned int pipe_index,
+		   const struct vsp1_du_lif_config *cfg)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 	struct vsp1_drm_pipeline *drm_pipe;
 	struct vsp1_pipeline *pipe;
 	unsigned long flags;
-	unsigned int i;
 	int ret;
 
 	if (pipe_index >= vsp1->info->lif_count)
@@ -665,60 +664,6 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 	drm_pipe = &vsp1->drm->pipe[pipe_index];
 	pipe = &drm_pipe->pipe;
 
-	if (!cfg) {
-		struct vsp1_brx *brx;
-
-		mutex_lock(&vsp1->drm->lock);
-
-		brx = to_brx(&pipe->brx->subdev);
-
-		/*
-		 * NULL configuration means the CRTC is being disabled, stop
-		 * the pipeline and turn the light off.
-		 */
-		ret = vsp1_pipeline_stop(pipe);
-		if (ret == -ETIMEDOUT)
-			dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
-
-		for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
-			struct vsp1_rwpf *rpf = pipe->inputs[i];
-
-			if (!rpf)
-				continue;
-
-			/*
-			 * Remove the RPF from the pipe and the list of BRx
-			 * inputs.
-			 */
-			WARN_ON(!rpf->entity.pipe);
-			rpf->entity.pipe = NULL;
-			list_del(&rpf->entity.list_pipe);
-			pipe->inputs[i] = NULL;
-
-			brx->inputs[rpf->brx_input].rpf = NULL;
-		}
-
-		drm_pipe->du_complete = NULL;
-		pipe->num_inputs = 0;
-
-		dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n",
-			__func__, pipe->lif->index,
-			BRX_NAME(pipe->brx));
-
-		list_del(&pipe->brx->list_pipe);
-		pipe->brx->pipe = NULL;
-		pipe->brx = NULL;
-
-		mutex_unlock(&vsp1->drm->lock);
-
-		vsp1_dlm_reset(pipe->output->dlm);
-		vsp1_device_put(vsp1);
-
-		dev_dbg(vsp1->dev, "%s: pipeline disabled\n", __func__);
-
-		return 0;
-	}
-
 	/* Reset the underrun counter */
 	pipe->underrun_count = 0;
 
@@ -741,7 +686,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 	if (ret < 0)
 		goto unlock;
 
-	vsp1_pipeline_dump(pipe, "LIF setup");
+	vsp1_pipeline_dump(pipe, "DU enable");
 
 	/* Enable the VSP1. */
 	ret = vsp1_device_get(vsp1);
@@ -777,7 +722,80 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(vsp1_du_setup_lif);
+EXPORT_SYMBOL_GPL(vsp1_du_enable);
+
+/**
+ * vsp1_du_disable - Disable and stop a DU pipeline
+ * @dev: the VSP device
+ * @pipe_index: the DRM pipeline index
+ *
+ * The @pipe_index argument selects which DRM pipeline to disable. The number
+ * of available pipelines depend on the VSP instance.
+ *
+ * Return 0 on success or a negative error code on failure.
+ */
+int vsp1_du_disable(struct device *dev, unsigned int pipe_index)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_drm_pipeline *drm_pipe;
+	struct vsp1_pipeline *pipe;
+	struct vsp1_brx *brx;
+	unsigned int i;
+	int ret;
+
+	if (pipe_index >= vsp1->info->lif_count)
+		return -EINVAL;
+
+	drm_pipe = &vsp1->drm->pipe[pipe_index];
+	pipe = &drm_pipe->pipe;
+
+	mutex_lock(&vsp1->drm->lock);
+
+	brx = to_brx(&pipe->brx->subdev);
+
+	ret = vsp1_pipeline_stop(pipe);
+	if (ret == -ETIMEDOUT)
+		dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
+
+	for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
+		struct vsp1_rwpf *rpf = pipe->inputs[i];
+
+		if (!rpf)
+			continue;
+
+		/*
+		 * Remove the RPF from the pipe and the list of BRx
+		 * inputs.
+		 */
+		WARN_ON(!rpf->entity.pipe);
+		rpf->entity.pipe = NULL;
+		list_del(&rpf->entity.list_pipe);
+		pipe->inputs[i] = NULL;
+
+		brx->inputs[rpf->brx_input].rpf = NULL;
+	}
+
+	drm_pipe->du_complete = NULL;
+	pipe->num_inputs = 0;
+
+	dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n",
+		__func__, pipe->lif->index,
+		BRX_NAME(pipe->brx));
+
+	list_del(&pipe->brx->list_pipe);
+	pipe->brx->pipe = NULL;
+	pipe->brx = NULL;
+
+	mutex_unlock(&vsp1->drm->lock);
+
+	vsp1_dlm_reset(pipe->output->dlm);
+	vsp1_device_put(vsp1);
+
+	dev_dbg(vsp1->dev, "%s: pipeline disabled\n", __func__);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vsp1_du_disable);
 
 /**
  * vsp1_du_atomic_begin - Prepare for an atomic update
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index d9b91ff02761..d2085cdb7fcb 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -44,8 +44,18 @@ struct vsp1_du_lif_config {
 	void *callback_data;
 };
 
-int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
-		      const struct vsp1_du_lif_config *cfg);
+int vsp1_du_enable(struct device *dev, unsigned int pipe_index,
+		   const struct vsp1_du_lif_config *cfg);
+int vsp1_du_disable(struct device *dev, unsigned int pipe_index);
+
+static inline int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
+				    const struct vsp1_du_lif_config *cfg)
+{
+	if (cfg)
+		return vsp1_du_enable(dev, pipe_index, cfg);
+	else
+		return vsp1_du_disable(dev, pipe_index);
+}
 
 /**
  * struct vsp1_du_atomic_config - VSP atomic configuration parameters
-- 
Regards,

Laurent Pinchart


