Return-Path: <linux-media+bounces-49062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 65917CCB281
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 10:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D241D303417E
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 09:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944C9309EFE;
	Thu, 18 Dec 2025 09:24:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A85199920
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049851; cv=none; b=baka/asTXM0oNID00K9iiWqj6e/uh54LrjjcbBh8VtHDNrYIe0QN+0/sa06OSPwpZiF/HAsgKcQrFiq+6KVlLdhKOclPwtQqAVT97lUBSg0+wfGZcLSYiQkLBiVe0Fxj2a7fpIX16yPXvGXRO9ZJmyajxqcadNsccoXhro/BFnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049851; c=relaxed/simple;
	bh=vaUq1tSV0zuUGaK06Qs0CHIreYcp34yQU/RLQrp5cgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j6WgTZefCQ8OpEZCkXDcVqfOOkpC/SOM2yq/z8se645xRv2bcEPTJR5AFpCFZUCB1xmNYAdMWeK0JiULWfGr+KpCWgQi06xprqbpI/7D65dGA5ZcR7Y7piVwXHx17Xdz0WHVhn33hmqC0q5UDalcy54jo3fVgNWx/IAgIezDqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vWAEo-0002J4-Gp; Thu, 18 Dec 2025 10:23:58 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 18 Dec 2025 10:23:49 +0100
Subject: [PATCH v2 1/3] media: imx-csi: move media_pipeline to video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-media-imx-cleanup-v2-1-9e3e3c269f7f@pengutronix.de>
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
In-Reply-To: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-staging@lists.linux.dev, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

The imx-media driver has a single imx_media_device. Attaching the
media_pipeline to the imx_media_device prevents the execution of
multiple media pipelines on the device. This should be possible as long
as the media_pipelines don't use the same pads or pads that be
configured while the other media pipeline is streaming.

Move the media_pipeline to the imx_media_video_dev to be able to
construct media pipelines per imx capture device.

If different media pipelines in the media device conflict, the
validation will fail. Thus, the pipeline will fail to start and signal
an error to user space.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- none
---
 drivers/staging/media/imx/imx-media-capture.c | 8 ++++----
 drivers/staging/media/imx/imx-media-utils.c   | 3 ++-
 drivers/staging/media/imx/imx-media.h         | 7 ++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index e9cef7af000a..bfd71d25facc 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -722,8 +722,8 @@ static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto return_bufs;
 	}
 
-	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
-					    true);
+	ret = imx_media_pipeline_set_stream(priv->md, &priv->vdev,
+					    &priv->src_sd->entity, true);
 	if (ret) {
 		dev_err(priv->dev, "pipeline start failed with %d\n", ret);
 		goto return_bufs;
@@ -749,8 +749,8 @@ static void capture_stop_streaming(struct vb2_queue *vq)
 	unsigned long flags;
 	int ret;
 
-	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
-					    false);
+	ret = imx_media_pipeline_set_stream(priv->md, &priv->vdev,
+					    &priv->src_sd->entity, false);
 	if (ret)
 		dev_warn(priv->dev, "pipeline stop failed with %d\n", ret);
 
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 1b5af8945e6b..f520529a7cfe 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -749,6 +749,7 @@ EXPORT_SYMBOL_GPL(imx_media_pipeline_subdev);
  * Turn current pipeline streaming on/off starting from entity.
  */
 int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
+				  struct imx_media_video_dev *vdev,
 				  struct media_entity *entity,
 				  bool on)
 {
@@ -762,7 +763,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 	mutex_lock(&imxmd->md.graph_mutex);
 
 	if (on) {
-		ret = __media_pipeline_start(entity->pads, &imxmd->pipe);
+		ret = __media_pipeline_start(entity->pads, &vdev->pipe);
 		if (ret)
 			goto out;
 		ret = v4l2_subdev_call(sd, video, s_stream, 1);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f095d9134fee..8b65f79b125f 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -104,6 +104,9 @@ struct imx_media_buffer {
 struct imx_media_video_dev {
 	struct video_device *vfd;
 
+	/* the pipeline object */
+	struct media_pipeline pipe;
+
 	/* the user format */
 	struct v4l2_pix_format fmt;
 	/* the compose rectangle */
@@ -145,9 +148,6 @@ struct imx_media_dev {
 	struct media_device md;
 	struct v4l2_device  v4l2_dev;
 
-	/* the pipeline object */
-	struct media_pipeline pipe;
-
 	struct mutex mutex; /* protect elements below */
 
 	/* master video device list */
@@ -223,6 +223,7 @@ int imx_media_alloc_dma_buf(struct device *dev,
 			    int size);
 
 int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
+				  struct imx_media_video_dev *vdev,
 				  struct media_entity *entity,
 				  bool on);
 

-- 
2.47.3


