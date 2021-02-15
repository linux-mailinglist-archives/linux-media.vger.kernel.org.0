Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D99331B4AD
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhBOEfS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:35:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhBOEfR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:35:17 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09FCE1A80;
        Mon, 15 Feb 2021 05:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363317;
        bh=rKDnnSDAZxeHN9w+iHfkOCgcDtFV9Bz6xAURyM5cPvE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sMkOKkM32n3bGYzu42GitqkTCxJKmbWe7yHyLov/ElBrGkYwVpZJZCBvkGPSel2S+
         xaU2bCEYAMbnvYSBIWxivznTfngawmsG+0JKkpqEdxI/7ms0BOQxwfLL1GWHcLaFl6
         NASFuoq0XhrccdbGrjOOOw8yJuPWGpw0hJxsk2h4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 36/77] media: imx: imx7-media-csi: Reorganize code in sections
Date:   Mon, 15 Feb 2021 06:27:00 +0200
Message-Id: <20210215042741.28850-37-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for a major rework of the hardware initialization, and make
the code easier to read, reorder functions to group them in sections. No
functional change is included.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 496 +++++++++++----------
 1 file changed, 258 insertions(+), 238 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a5971b958b64..158b235476eb 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -197,6 +197,10 @@ imx7_csi_notifier_to_dev(struct v4l2_async_notifier *n)
 	return container_of(n, struct imx7_csi, notifier);
 }
 
+/* -----------------------------------------------------------------------------
+ * Hardware Configuration
+ */
+
 static u32 imx7_csi_reg_read(struct imx7_csi *csi, unsigned int offset)
 {
 	return readl(csi->regbase + offset);
@@ -387,122 +391,6 @@ static void imx7_csi_sw_reset(struct imx7_csi *csi)
 	imx7_csi_hw_enable(csi);
 }
 
-static void imx7_csi_error_recovery(struct imx7_csi *csi)
-{
-	imx7_csi_hw_disable(csi);
-
-	imx7_csi_rx_fifo_clear(csi);
-
-	imx7_csi_dma_reflash(csi);
-
-	imx7_csi_hw_enable(csi);
-}
-
-static int imx7_csi_init(struct imx7_csi *csi)
-{
-	int ret;
-
-	ret = clk_prepare_enable(csi->mclk);
-	if (ret < 0)
-		return ret;
-	imx7_csi_hw_reset(csi);
-	imx7_csi_init_interface(csi);
-	imx7_csi_dmareq_rff_enable(csi);
-
-	return 0;
-}
-
-static void imx7_csi_deinit(struct imx7_csi *csi)
-{
-	imx7_csi_hw_reset(csi);
-	imx7_csi_init_interface(csi);
-	imx7_csi_dmareq_rff_disable(csi);
-	clk_disable_unprepare(csi->mclk);
-}
-
-static int imx7_csi_link_setup(struct media_entity *entity,
-			       const struct media_pad *local,
-			       const struct media_pad *remote, u32 flags)
-{
-	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
-	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	struct v4l2_subdev *remote_sd;
-	int ret = 0;
-
-	dev_dbg(csi->dev, "link setup %s -> %s\n", remote->entity->name,
-		local->entity->name);
-
-	mutex_lock(&csi->lock);
-
-	if (local->flags & MEDIA_PAD_FL_SINK) {
-		if (!is_media_entity_v4l2_subdev(remote->entity)) {
-			ret = -EINVAL;
-			goto unlock;
-		}
-
-		remote_sd = media_entity_to_v4l2_subdev(remote->entity);
-
-		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (csi->src_sd) {
-				ret = -EBUSY;
-				goto unlock;
-			}
-			csi->src_sd = remote_sd;
-		} else {
-			csi->src_sd = NULL;
-		}
-	}
-
-unlock:
-	mutex_unlock(&csi->lock);
-
-	return ret;
-}
-
-static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
-				      struct media_link *link,
-				      struct v4l2_subdev_format *source_fmt,
-				      struct v4l2_subdev_format *sink_fmt)
-{
-	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	struct media_entity *src;
-	struct media_pad *pad;
-	int ret;
-
-	ret = v4l2_subdev_link_validate_default(sd, link, source_fmt, sink_fmt);
-	if (ret)
-		return ret;
-
-	if (!csi->src_sd)
-		return -EPIPE;
-
-	src = &csi->src_sd->entity;
-
-	/*
-	 * if the source is neither a CSI MUX or CSI-2 get the one directly
-	 * upstream from this CSI
-	 */
-	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
-	    src->function != MEDIA_ENT_F_VID_MUX)
-		src = &csi->sd.entity;
-
-	/*
-	 * find the entity that is selected by the source. This is needed
-	 * to distinguish between a parallel or CSI-2 pipeline.
-	 */
-	pad = imx_media_pipeline_pad(src, 0, 0, true);
-	if (!pad)
-		return -ENODEV;
-
-	mutex_lock(&csi->lock);
-
-	csi->is_csi2 = (pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE);
-
-	mutex_unlock(&csi->lock);
-
-	return 0;
-}
-
 static void imx7_csi_update_buf(struct imx7_csi *csi, dma_addr_t phys,
 				int buf_num)
 {
@@ -553,94 +441,6 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_csi *csi,
 	}
 }
 
-static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
-{
-	struct imx_media_video_dev *vdev = csi->vdev;
-	struct imx_media_buffer *done, *next;
-	struct vb2_buffer *vb;
-	dma_addr_t phys;
-
-	done = csi->active_vb2_buf[csi->buf_num];
-	if (done) {
-		done->vbuf.field = vdev->fmt.field;
-		done->vbuf.sequence = csi->frame_sequence;
-		vb = &done->vbuf.vb2_buf;
-		vb->timestamp = ktime_get_ns();
-		vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
-	}
-	csi->frame_sequence++;
-
-	/* get next queued buffer */
-	next = imx_media_capture_device_next_buf(vdev);
-	if (next) {
-		phys = vb2_dma_contig_plane_dma_addr(&next->vbuf.vb2_buf, 0);
-		csi->active_vb2_buf[csi->buf_num] = next;
-	} else {
-		phys = csi->underrun_buf.phys;
-		csi->active_vb2_buf[csi->buf_num] = NULL;
-	}
-
-	imx7_csi_update_buf(csi, phys, csi->buf_num);
-}
-
-static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
-{
-	struct imx7_csi *csi =  data;
-	u32 status;
-
-	spin_lock(&csi->irqlock);
-
-	status = imx7_csi_irq_clear(csi);
-
-	if (status & BIT_RFF_OR_INT) {
-		dev_warn(csi->dev, "Rx fifo overflow\n");
-		imx7_csi_error_recovery(csi);
-	}
-
-	if (status & BIT_HRESP_ERR_INT) {
-		dev_warn(csi->dev, "Hresponse error detected\n");
-		imx7_csi_error_recovery(csi);
-	}
-
-	if (status & BIT_ADDR_CH_ERR_INT) {
-		imx7_csi_hw_disable(csi);
-
-		imx7_csi_dma_reflash(csi);
-
-		imx7_csi_hw_enable(csi);
-	}
-
-	if ((status & BIT_DMA_TSF_DONE_FB1) &&
-	    (status & BIT_DMA_TSF_DONE_FB2)) {
-		/*
-		 * For both FB1 and FB2 interrupter bits set case,
-		 * CSI DMA is work in one of FB1 and FB2 buffer,
-		 * but software can not know the state.
-		 * Skip it to avoid base address updated
-		 * when csi work in field0 and field1 will write to
-		 * new base address.
-		 */
-	} else if (status & BIT_DMA_TSF_DONE_FB1) {
-		csi->buf_num = 0;
-	} else if (status & BIT_DMA_TSF_DONE_FB2) {
-		csi->buf_num = 1;
-	}
-
-	if ((status & BIT_DMA_TSF_DONE_FB1) ||
-	    (status & BIT_DMA_TSF_DONE_FB2)) {
-		imx7_csi_vb2_buf_done(csi);
-
-		if (csi->last_eof) {
-			complete(&csi->last_eof_completion);
-			csi->last_eof = false;
-		}
-	}
-
-	spin_unlock(&csi->irqlock);
-
-	return IRQ_HANDLED;
-}
-
 static int imx7_csi_dma_start(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = csi->vdev;
@@ -772,6 +572,28 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 	return 0;
 }
 
+static int imx7_csi_init(struct imx7_csi *csi)
+{
+	int ret;
+
+	ret = clk_prepare_enable(csi->mclk);
+	if (ret < 0)
+		return ret;
+	imx7_csi_hw_reset(csi);
+	imx7_csi_init_interface(csi);
+	imx7_csi_dmareq_rff_enable(csi);
+
+	return 0;
+}
+
+static void imx7_csi_deinit(struct imx7_csi *csi)
+{
+	imx7_csi_hw_reset(csi);
+	imx7_csi_init_interface(csi);
+	imx7_csi_dmareq_rff_disable(csi);
+	clk_disable_unprepare(csi->mclk);
+}
+
 static void imx7_csi_enable(struct imx7_csi *csi)
 {
 	imx7_csi_sw_reset(csi);
@@ -823,6 +645,113 @@ static int imx7_csi_streaming_stop(struct imx7_csi *csi)
 	return 0;
 }
 
+/* -----------------------------------------------------------------------------
+ * Interrupt Handling
+ */
+
+static void imx7_csi_error_recovery(struct imx7_csi *csi)
+{
+	imx7_csi_hw_disable(csi);
+
+	imx7_csi_rx_fifo_clear(csi);
+
+	imx7_csi_dma_reflash(csi);
+
+	imx7_csi_hw_enable(csi);
+}
+
+static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
+{
+	struct imx_media_video_dev *vdev = csi->vdev;
+	struct imx_media_buffer *done, *next;
+	struct vb2_buffer *vb;
+	dma_addr_t phys;
+
+	done = csi->active_vb2_buf[csi->buf_num];
+	if (done) {
+		done->vbuf.field = vdev->fmt.field;
+		done->vbuf.sequence = csi->frame_sequence;
+		vb = &done->vbuf.vb2_buf;
+		vb->timestamp = ktime_get_ns();
+		vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
+	}
+	csi->frame_sequence++;
+
+	/* get next queued buffer */
+	next = imx_media_capture_device_next_buf(vdev);
+	if (next) {
+		phys = vb2_dma_contig_plane_dma_addr(&next->vbuf.vb2_buf, 0);
+		csi->active_vb2_buf[csi->buf_num] = next;
+	} else {
+		phys = csi->underrun_buf.phys;
+		csi->active_vb2_buf[csi->buf_num] = NULL;
+	}
+
+	imx7_csi_update_buf(csi, phys, csi->buf_num);
+}
+
+static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
+{
+	struct imx7_csi *csi =  data;
+	u32 status;
+
+	spin_lock(&csi->irqlock);
+
+	status = imx7_csi_irq_clear(csi);
+
+	if (status & BIT_RFF_OR_INT) {
+		dev_warn(csi->dev, "Rx fifo overflow\n");
+		imx7_csi_error_recovery(csi);
+	}
+
+	if (status & BIT_HRESP_ERR_INT) {
+		dev_warn(csi->dev, "Hresponse error detected\n");
+		imx7_csi_error_recovery(csi);
+	}
+
+	if (status & BIT_ADDR_CH_ERR_INT) {
+		imx7_csi_hw_disable(csi);
+
+		imx7_csi_dma_reflash(csi);
+
+		imx7_csi_hw_enable(csi);
+	}
+
+	if ((status & BIT_DMA_TSF_DONE_FB1) &&
+	    (status & BIT_DMA_TSF_DONE_FB2)) {
+		/*
+		 * For both FB1 and FB2 interrupter bits set case,
+		 * CSI DMA is work in one of FB1 and FB2 buffer,
+		 * but software can not know the state.
+		 * Skip it to avoid base address updated
+		 * when csi work in field0 and field1 will write to
+		 * new base address.
+		 */
+	} else if (status & BIT_DMA_TSF_DONE_FB1) {
+		csi->buf_num = 0;
+	} else if (status & BIT_DMA_TSF_DONE_FB2) {
+		csi->buf_num = 1;
+	}
+
+	if ((status & BIT_DMA_TSF_DONE_FB1) ||
+	    (status & BIT_DMA_TSF_DONE_FB2)) {
+		imx7_csi_vb2_buf_done(csi);
+
+		if (csi->last_eof) {
+			complete(&csi->last_eof_completion);
+			csi->last_eof = false;
+		}
+	}
+
+	spin_unlock(&csi->irqlock);
+
+	return IRQ_HANDLED;
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Subdev Operations
+ */
+
 static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
@@ -871,6 +800,26 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_pad_config *cfg)
+{
+	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *mf;
+	int ret;
+	int i;
+
+	for (i = 0; i < IMX7_CSI_PADS_NUM; i++) {
+		mf = v4l2_subdev_get_try_format(sd, cfg, i);
+
+		ret = imx_media_init_mbus_fmt(mf, 800, 600, 0, V4L2_FIELD_NONE,
+					      &csi->cc[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static struct v4l2_mbus_framefmt *
 imx7_csi_get_format(struct imx7_csi *csi,
 		    struct v4l2_subdev_pad_config *cfg,
@@ -1055,6 +1004,50 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
+				      struct media_link *link,
+				      struct v4l2_subdev_format *source_fmt,
+				      struct v4l2_subdev_format *sink_fmt)
+{
+	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
+	struct media_entity *src;
+	struct media_pad *pad;
+	int ret;
+
+	ret = v4l2_subdev_link_validate_default(sd, link, source_fmt, sink_fmt);
+	if (ret)
+		return ret;
+
+	if (!csi->src_sd)
+		return -EPIPE;
+
+	src = &csi->src_sd->entity;
+
+	/*
+	 * if the source is neither a CSI MUX or CSI-2 get the one directly
+	 * upstream from this CSI
+	 */
+	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
+	    src->function != MEDIA_ENT_F_VID_MUX)
+		src = &csi->sd.entity;
+
+	/*
+	 * find the entity that is selected by the source. This is needed
+	 * to distinguish between a parallel or CSI-2 pipeline.
+	 */
+	pad = imx_media_pipeline_pad(src, 0, 0, true);
+	if (!pad)
+		return -ENODEV;
+
+	mutex_lock(&csi->lock);
+
+	csi->is_csi2 = (pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE);
+
+	mutex_unlock(&csi->lock);
+
+	return 0;
+}
+
 static int imx7_csi_registered(struct v4l2_subdev *sd)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
@@ -1095,47 +1088,21 @@ static void imx7_csi_unregistered(struct v4l2_subdev *sd)
 	imx_media_capture_device_remove(csi->vdev);
 }
 
-static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg)
-{
-	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	struct v4l2_mbus_framefmt *mf;
-	int ret;
-	int i;
-
-	for (i = 0; i < IMX7_CSI_PADS_NUM; i++) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, i);
-
-		ret = imx_media_init_mbus_fmt(mf, 800, 600, 0, V4L2_FIELD_NONE,
-					      &csi->cc[i]);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-static const struct media_entity_operations imx7_csi_entity_ops = {
-	.link_setup	= imx7_csi_link_setup,
-	.link_validate	= v4l2_subdev_link_validate,
-	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
-};
-
 static const struct v4l2_subdev_video_ops imx7_csi_video_ops = {
-	.s_stream		= imx7_csi_s_stream,
+	.s_stream	= imx7_csi_s_stream,
 };
 
 static const struct v4l2_subdev_pad_ops imx7_csi_pad_ops = {
-	.init_cfg =		imx7_csi_init_cfg,
-	.enum_mbus_code =	imx7_csi_enum_mbus_code,
-	.get_fmt =		imx7_csi_get_fmt,
-	.set_fmt =		imx7_csi_set_fmt,
-	.link_validate =	imx7_csi_pad_link_validate,
+	.init_cfg	= imx7_csi_init_cfg,
+	.enum_mbus_code	= imx7_csi_enum_mbus_code,
+	.get_fmt	= imx7_csi_get_fmt,
+	.set_fmt	= imx7_csi_set_fmt,
+	.link_validate	= imx7_csi_pad_link_validate,
 };
 
 static const struct v4l2_subdev_ops imx7_csi_subdev_ops = {
-	.video =	&imx7_csi_video_ops,
-	.pad =		&imx7_csi_pad_ops,
+	.video		= &imx7_csi_video_ops,
+	.pad		= &imx7_csi_pad_ops,
 };
 
 static const struct v4l2_subdev_internal_ops imx7_csi_internal_ops = {
@@ -1143,6 +1110,59 @@ static const struct v4l2_subdev_internal_ops imx7_csi_internal_ops = {
 	.unregistered	= imx7_csi_unregistered,
 };
 
+/* -----------------------------------------------------------------------------
+ * Media Entity Operations
+ */
+
+static int imx7_csi_link_setup(struct media_entity *entity,
+			       const struct media_pad *local,
+			       const struct media_pad *remote, u32 flags)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev *remote_sd;
+	int ret = 0;
+
+	dev_dbg(csi->dev, "link setup %s -> %s\n", remote->entity->name,
+		local->entity->name);
+
+	mutex_lock(&csi->lock);
+
+	if (local->flags & MEDIA_PAD_FL_SINK) {
+		if (!is_media_entity_v4l2_subdev(remote->entity)) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+
+		remote_sd = media_entity_to_v4l2_subdev(remote->entity);
+
+		if (flags & MEDIA_LNK_FL_ENABLED) {
+			if (csi->src_sd) {
+				ret = -EBUSY;
+				goto unlock;
+			}
+			csi->src_sd = remote_sd;
+		} else {
+			csi->src_sd = NULL;
+		}
+	}
+
+unlock:
+	mutex_unlock(&csi->lock);
+
+	return ret;
+}
+
+static const struct media_entity_operations imx7_csi_entity_ops = {
+	.link_setup	= imx7_csi_link_setup,
+	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
 static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
 				 struct v4l2_subdev *sd,
 				 struct v4l2_async_subdev *asd)
-- 
Regards,

Laurent Pinchart

