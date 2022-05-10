Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D35C521495
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241412AbiEJMDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241409AbiEJMDa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F8646673
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:32 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75C3AD18;
        Tue, 10 May 2022 13:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183963;
        bh=8VldD6m7V1ArQbM/CUQB5R4nyIPDmBlDaODt8kryyMA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uoqROhSsBws0bvtr07t6YnwgdeX47QD+XK7Sdj/RTZbcO2XSbpseS2ASPXolf/E2R
         yay05BO/zFrndxiaKry/M1nBV01KXPp5LBd23Kdx66kJQwd/cxsrjU51eYmr1qqQqG
         44rJHvtBuprfujyENzTyjsxbfFW6KTuXSL5ZQ87Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 15/50] staging: media: imx: imx7-media-csi: Fold capture_priv into imx7_csi
Date:   Tue, 10 May 2022 14:58:24 +0300
Message-Id: <20220510115859.19777-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Merge the capture_priv fields in the imx7_csi structure as there's no
more need to have two separate structures. Update all the users
accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 271 +++++++++------------
 1 file changed, 117 insertions(+), 154 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index ad69c2e8dbc2..9b4463e456c2 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -193,7 +193,14 @@ struct imx7_csi {
 	const struct imx_media_pixfmt *cc[IMX7_CSI_PADS_NUM];
 
 	/* Video device */
-	struct imx_media_video_dev *vdev;
+	struct imx_media_video_dev vdev;	/* Video device */
+	struct media_pad vdev_pad;		/* Video device pad */
+
+	struct mutex vdev_mutex;		/* Protect vdev operations */
+
+	struct vb2_queue q;			/* The videobuf2 queue */
+	struct list_head ready_q;		/* List of queued buffers */
+	spinlock_t q_lock;			/* Protect ready_q */
 
 	/* Buffers and streaming state */
 	struct imx_media_buffer *active_vb2_buf[2];
@@ -343,18 +350,17 @@ static void imx7_csi_update_buf(struct imx7_csi *csi, dma_addr_t phys,
 }
 
 static struct imx_media_buffer *
-imx7_media_capture_device_next_buf(struct imx_media_video_dev *vdev);
+imx7_media_capture_device_next_buf(struct imx7_csi *csi);
 
 static void imx7_csi_setup_vb2_buf(struct imx7_csi *csi)
 {
-	struct imx_media_video_dev *vdev = csi->vdev;
 	struct imx_media_buffer *buf;
 	struct vb2_buffer *vb2_buf;
 	dma_addr_t phys[2];
 	int i;
 
 	for (i = 0; i < 2; i++) {
-		buf = imx7_media_capture_device_next_buf(vdev);
+		buf = imx7_media_capture_device_next_buf(csi);
 		if (buf) {
 			csi->active_vb2_buf[i] = buf;
 			vb2_buf = &buf->vbuf.vb2_buf;
@@ -389,7 +395,7 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_csi *csi,
 
 static int imx7_csi_dma_setup(struct imx7_csi *csi)
 {
-	struct imx_media_video_dev *vdev = csi->vdev;
+	struct imx_media_video_dev *vdev = &csi->vdev;
 	int ret;
 
 	ret = imx_media_alloc_dma_buf(csi->dev, &csi->underrun_buf,
@@ -440,7 +446,7 @@ static void imx7_csi_dma_stop(struct imx7_csi *csi)
 
 static void imx7_csi_configure(struct imx7_csi *csi)
 {
-	struct imx_media_video_dev *vdev = csi->vdev;
+	struct imx_media_video_dev *vdev = &csi->vdev;
 	struct v4l2_pix_format *out_pix = &vdev->fmt;
 	int width = out_pix->width;
 	u32 stride = 0;
@@ -640,7 +646,7 @@ static void imx7_csi_error_recovery(struct imx7_csi *csi)
 
 static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
 {
-	struct imx_media_video_dev *vdev = csi->vdev;
+	struct imx_media_video_dev *vdev = &csi->vdev;
 	struct imx_media_buffer *done, *next;
 	struct vb2_buffer *vb;
 	dma_addr_t phys;
@@ -656,7 +662,7 @@ static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
 	csi->frame_sequence++;
 
 	/* get next queued buffer */
-	next = imx7_media_capture_device_next_buf(vdev);
+	next = imx7_media_capture_device_next_buf(csi);
 	if (next) {
 		phys = vb2_dma_contig_plane_dma_addr(&next->vbuf.vb2_buf, 0);
 		csi->active_vb2_buf[csi->buf_num] = next;
@@ -732,25 +738,6 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 
 #define IMX_CAPTURE_NAME "imx-capture"
 
-struct capture_priv {
-	struct imx_media_dev *md;		/* Media device */
-	struct device *dev;			/* Physical device */
-
-	struct imx_media_video_dev vdev;	/* Video device */
-	struct media_pad vdev_pad;		/* Video device pad */
-
-	struct v4l2_subdev *src_sd;		/* Source subdev */
-	int src_sd_pad;				/* Source subdev pad */
-
-	struct mutex mutex;			/* Protect vdev operations */
-
-	struct vb2_queue q;			/* The videobuf2 queue */
-	struct list_head ready_q;		/* List of queued buffers */
-	spinlock_t q_lock;			/* Protect ready_q */
-};
-
-#define to_capture_priv(v) container_of(v, struct capture_priv, vdev)
-
 /* In bytes, per queue */
 #define VID_MEM_LIMIT	SZ_64M
 
@@ -782,12 +769,12 @@ static const struct imx_media_pixfmt *capture_find_format(u32 code, u32 fourcc)
 static int capture_querycap(struct file *file, void *fh,
 			    struct v4l2_capability *cap)
 {
-	struct capture_priv *priv = video_drvdata(file);
+	struct imx7_csi *csi = video_drvdata(file);
 
 	strscpy(cap->driver, IMX_CAPTURE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, IMX_CAPTURE_NAME, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", dev_name(priv->dev));
+		 "platform:%s", dev_name(csi->dev));
 
 	return 0;
 }
@@ -830,9 +817,9 @@ static int capture_enum_framesizes(struct file *file, void *fh,
 static int capture_g_fmt_vid_cap(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct capture_priv *priv = video_drvdata(file);
+	struct imx7_csi *csi = video_drvdata(file);
 
-	f->fmt.pix = priv->vdev.fmt;
+	f->fmt.pix = csi->vdev.fmt;
 
 	return 0;
 }
@@ -890,18 +877,18 @@ static int capture_try_fmt_vid_cap(struct file *file, void *fh,
 static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct capture_priv *priv = video_drvdata(file);
+	struct imx7_csi *csi = video_drvdata(file);
 	const struct imx_media_pixfmt *cc;
 
-	if (vb2_is_busy(&priv->q)) {
-		dev_err(priv->dev, "%s queue busy\n", __func__);
+	if (vb2_is_busy(&csi->q)) {
+		dev_err(csi->dev, "%s queue busy\n", __func__);
 		return -EBUSY;
 	}
 
-	cc = __capture_try_fmt(&f->fmt.pix, &priv->vdev.compose);
+	cc = __capture_try_fmt(&f->fmt.pix, &csi->vdev.compose);
 
-	priv->vdev.cc = cc;
-	priv->vdev.fmt = f->fmt.pix;
+	csi->vdev.cc = cc;
+	csi->vdev.fmt = f->fmt.pix;
 
 	return 0;
 }
@@ -909,14 +896,14 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 static int capture_g_selection(struct file *file, void *fh,
 			       struct v4l2_selection *s)
 {
-	struct capture_priv *priv = video_drvdata(file);
+	struct imx7_csi *csi = video_drvdata(file);
 
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE:
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 		/* The compose rectangle is fixed to the source format. */
-		s->r = priv->vdev.compose;
+		s->r = csi->vdev.compose;
 		break;
 	case V4L2_SEL_TGT_COMPOSE_PADDED:
 		/*
@@ -926,8 +913,8 @@ static int capture_g_selection(struct file *file, void *fh,
 		 */
 		s->r.left = 0;
 		s->r.top = 0;
-		s->r.width = priv->vdev.fmt.width;
-		s->r.height = priv->vdev.fmt.height;
+		s->r.width = csi->vdev.fmt.width;
+		s->r.height = csi->vdev.fmt.height;
 		break;
 	default:
 		return -EINVAL;
@@ -983,8 +970,8 @@ static int capture_queue_setup(struct vb2_queue *vq,
 			       unsigned int sizes[],
 			       struct device *alloc_devs[])
 {
-	struct capture_priv *priv = vb2_get_drv_priv(vq);
-	struct v4l2_pix_format *pix = &priv->vdev.fmt;
+	struct imx7_csi *csi = vb2_get_drv_priv(vq);
+	struct v4l2_pix_format *pix = &csi->vdev.fmt;
 	unsigned int count = *nbuffers;
 
 	if (vq->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -1021,12 +1008,11 @@ static int capture_buf_init(struct vb2_buffer *vb)
 
 static int capture_buf_prepare(struct vb2_buffer *vb)
 {
-	struct vb2_queue *vq = vb->vb2_queue;
-	struct capture_priv *priv = vb2_get_drv_priv(vq);
-	struct v4l2_pix_format *pix = &priv->vdev.fmt;
+	struct imx7_csi *csi = vb2_get_drv_priv(vb->vb2_queue);
+	struct v4l2_pix_format *pix = &csi->vdev.fmt;
 
 	if (vb2_plane_size(vb, 0) < pix->sizeimage) {
-		dev_err(priv->dev,
+		dev_err(csi->dev,
 			"data will not fit into plane (%lu < %lu)\n",
 			vb2_plane_size(vb, 0), (long)pix->sizeimage);
 		return -EINVAL;
@@ -1039,27 +1025,27 @@ static int capture_buf_prepare(struct vb2_buffer *vb)
 
 static void capture_buf_queue(struct vb2_buffer *vb)
 {
-	struct capture_priv *priv = vb2_get_drv_priv(vb->vb2_queue);
+	struct imx7_csi *csi = vb2_get_drv_priv(vb->vb2_queue);
 	struct imx_media_buffer *buf = to_imx_media_vb(vb);
 	unsigned long flags;
 
-	spin_lock_irqsave(&priv->q_lock, flags);
+	spin_lock_irqsave(&csi->q_lock, flags);
 
-	list_add_tail(&buf->list, &priv->ready_q);
+	list_add_tail(&buf->list, &csi->ready_q);
 
-	spin_unlock_irqrestore(&priv->q_lock, flags);
+	spin_unlock_irqrestore(&csi->q_lock, flags);
 }
 
-static int capture_validate_fmt(struct capture_priv *priv)
+static int capture_validate_fmt(struct imx7_csi *csi)
 {
 	struct v4l2_subdev_format fmt_src;
 	const struct imx_media_pixfmt *cc;
 	int ret;
 
 	/* Retrieve the media bus format on the source subdev. */
-	fmt_src.pad = priv->src_sd_pad;
+	fmt_src.pad = IMX7_CSI_PAD_SRC;
 	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
+	ret = v4l2_subdev_call(&csi->sd, pad, get_fmt, NULL, &fmt_src);
 	if (ret)
 		return ret;
 
@@ -1070,8 +1056,8 @@ static int capture_validate_fmt(struct capture_priv *priv)
 	 * derived directly from the compose rectangle size, and will thus
 	 * always match if the compose rectangle matches.
 	 */
-	if (priv->vdev.compose.width != fmt_src.format.width ||
-	    priv->vdev.compose.height != fmt_src.format.height)
+	if (csi->vdev.compose.width != fmt_src.format.width ||
+	    csi->vdev.compose.height != fmt_src.format.height)
 		return -EPIPE;
 
 	/*
@@ -1079,7 +1065,7 @@ static int capture_validate_fmt(struct capture_priv *priv)
 	 * set on the video node.
 	 */
 	cc = capture_find_format(fmt_src.format.code, 0);
-	if (!cc || priv->vdev.cc->cs != cc->cs)
+	if (!cc || csi->vdev.cc->cs != cc->cs)
 		return -EPIPE;
 
 	return 0;
@@ -1087,56 +1073,54 @@ static int capture_validate_fmt(struct capture_priv *priv)
 
 static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
-	struct capture_priv *priv = vb2_get_drv_priv(vq);
+	struct imx7_csi *csi = vb2_get_drv_priv(vq);
 	struct imx_media_buffer *buf, *tmp;
 	unsigned long flags;
 	int ret;
 
-	ret = capture_validate_fmt(priv);
+	ret = capture_validate_fmt(csi);
 	if (ret) {
-		dev_err(priv->dev, "capture format not valid\n");
+		dev_err(csi->dev, "capture format not valid\n");
 		goto return_bufs;
 	}
 
-	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
-					    true);
+	ret = imx_media_pipeline_set_stream(csi->imxmd, &csi->sd.entity, true);
 	if (ret) {
-		dev_err(priv->dev, "pipeline start failed with %d\n", ret);
+		dev_err(csi->dev, "pipeline start failed with %d\n", ret);
 		goto return_bufs;
 	}
 
 	return 0;
 
 return_bufs:
-	spin_lock_irqsave(&priv->q_lock, flags);
-	list_for_each_entry_safe(buf, tmp, &priv->ready_q, list) {
+	spin_lock_irqsave(&csi->q_lock, flags);
+	list_for_each_entry_safe(buf, tmp, &csi->ready_q, list) {
 		list_del(&buf->list);
 		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_QUEUED);
 	}
-	spin_unlock_irqrestore(&priv->q_lock, flags);
+	spin_unlock_irqrestore(&csi->q_lock, flags);
 	return ret;
 }
 
 static void capture_stop_streaming(struct vb2_queue *vq)
 {
-	struct capture_priv *priv = vb2_get_drv_priv(vq);
+	struct imx7_csi *csi = vb2_get_drv_priv(vq);
 	struct imx_media_buffer *frame;
 	struct imx_media_buffer *tmp;
 	unsigned long flags;
 	int ret;
 
-	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
-					    false);
+	ret = imx_media_pipeline_set_stream(csi->imxmd, &csi->sd.entity, false);
 	if (ret)
-		dev_warn(priv->dev, "pipeline stop failed with %d\n", ret);
+		dev_warn(csi->dev, "pipeline stop failed with %d\n", ret);
 
 	/* release all active buffers */
-	spin_lock_irqsave(&priv->q_lock, flags);
-	list_for_each_entry_safe(frame, tmp, &priv->ready_q, list) {
+	spin_lock_irqsave(&csi->q_lock, flags);
+	list_for_each_entry_safe(frame, tmp, &csi->ready_q, list) {
 		list_del(&frame->list);
 		vb2_buffer_done(&frame->vbuf.vb2_buf, VB2_BUF_STATE_ERROR);
 	}
-	spin_unlock_irqrestore(&priv->q_lock, flags);
+	spin_unlock_irqrestore(&csi->q_lock, flags);
 }
 
 static const struct vb2_ops capture_qops = {
@@ -1156,16 +1140,16 @@ static const struct vb2_ops capture_qops = {
 
 static int capture_open(struct file *file)
 {
-	struct capture_priv *priv = video_drvdata(file);
-	struct video_device *vfd = priv->vdev.vfd;
+	struct imx7_csi *csi = video_drvdata(file);
+	struct video_device *vfd = csi->vdev.vfd;
 	int ret;
 
-	if (mutex_lock_interruptible(&priv->mutex))
+	if (mutex_lock_interruptible(&csi->vdev_mutex))
 		return -ERESTARTSYS;
 
 	ret = v4l2_fh_open(file);
 	if (ret) {
-		dev_err(priv->dev, "v4l2_fh_open failed\n");
+		dev_err(csi->dev, "v4l2_fh_open failed\n");
 		goto out;
 	}
 
@@ -1174,17 +1158,17 @@ static int capture_open(struct file *file)
 		v4l2_fh_release(file);
 
 out:
-	mutex_unlock(&priv->mutex);
+	mutex_unlock(&csi->vdev_mutex);
 	return ret;
 }
 
 static int capture_release(struct file *file)
 {
-	struct capture_priv *priv = video_drvdata(file);
-	struct video_device *vfd = priv->vdev.vfd;
-	struct vb2_queue *vq = &priv->q;
+	struct imx7_csi *csi = video_drvdata(file);
+	struct video_device *vfd = csi->vdev.vfd;
+	struct vb2_queue *vq = &csi->q;
 
-	mutex_lock(&priv->mutex);
+	mutex_lock(&csi->vdev_mutex);
 
 	if (file->private_data == vq->owner) {
 		vb2_queue_release(vq);
@@ -1194,7 +1178,7 @@ static int capture_release(struct file *file)
 	v4l2_pipeline_pm_put(&vfd->entity);
 
 	v4l2_fh_release(file);
-	mutex_unlock(&priv->mutex);
+	mutex_unlock(&csi->vdev_mutex);
 	return 0;
 }
 
@@ -1212,33 +1196,32 @@ static const struct v4l2_file_operations capture_fops = {
  */
 
 static struct imx_media_buffer *
-imx7_media_capture_device_next_buf(struct imx_media_video_dev *vdev)
+imx7_media_capture_device_next_buf(struct imx7_csi *csi)
 {
-	struct capture_priv *priv = to_capture_priv(vdev);
 	struct imx_media_buffer *buf = NULL;
 	unsigned long flags;
 
-	spin_lock_irqsave(&priv->q_lock, flags);
+	spin_lock_irqsave(&csi->q_lock, flags);
 
 	/* get next queued buffer */
-	if (!list_empty(&priv->ready_q)) {
-		buf = list_entry(priv->ready_q.next, struct imx_media_buffer,
+	if (!list_empty(&csi->ready_q)) {
+		buf = list_entry(csi->ready_q.next, struct imx_media_buffer,
 				 list);
 		list_del(&buf->list);
 	}
 
-	spin_unlock_irqrestore(&priv->q_lock, flags);
+	spin_unlock_irqrestore(&csi->q_lock, flags);
 
 	return buf;
 }
 
-static int capture_init_format(struct capture_priv *priv)
+static int capture_init_format(struct imx7_csi *csi)
 {
 	struct v4l2_subdev_format fmt_src = {
-		.pad = priv->src_sd_pad,
+		.pad = IMX7_CSI_PAD_SRC,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	struct imx_media_video_dev *vdev = &priv->vdev;
+	struct imx_media_video_dev *vdev = &csi->vdev;
 
 	fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
 	fmt_src.format.width = IMX_MEDIA_DEF_PIX_WIDTH;
@@ -1254,86 +1237,68 @@ static int capture_init_format(struct capture_priv *priv)
 	return 0;
 }
 
-static int imx7_media_capture_device_register(struct imx_media_video_dev *vdev,
-					      u32 link_flags)
+static int imx7_media_capture_device_register(struct imx7_csi *csi)
 {
-	struct capture_priv *priv = to_capture_priv(vdev);
-	struct v4l2_subdev *sd = priv->src_sd;
+	struct v4l2_subdev *sd = &csi->sd;
 	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
-	struct video_device *vfd = vdev->vfd;
+	struct video_device *vfd = csi->vdev.vfd;
 	int ret;
 
-	/* get media device */
-	priv->md = container_of(v4l2_dev->mdev, struct imx_media_dev, md);
-
 	vfd->v4l2_dev = v4l2_dev;
 
 	/* Initialize the default format and compose rectangle. */
-	ret = capture_init_format(priv);
+	ret = capture_init_format(csi);
 	if (ret < 0)
 		return ret;
 
 	/* Register the video device. */
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
-		dev_err(priv->dev, "Failed to register video device\n");
+		dev_err(csi->dev, "Failed to register video device\n");
 		return ret;
 	}
 
-	dev_info(priv->dev, "Registered %s as /dev/%s\n", vfd->name,
+	dev_info(csi->dev, "Registered %s as /dev/%s\n", vfd->name,
 		 video_device_node_name(vfd));
 
-	/* Create the link from the src_sd devnode pad to device node. */
-	if (link_flags & MEDIA_LNK_FL_IMMUTABLE)
-		link_flags |= MEDIA_LNK_FL_ENABLED;
-	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
-				    &vfd->entity, 0, link_flags);
+	/* Create the link from the CSI subdev to the video device. */
+	ret = media_create_pad_link(&sd->entity, IMX7_CSI_PAD_SRC, &vfd->entity,
+				    0, MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
 	if (ret) {
-		dev_err(priv->dev, "failed to create link to device node\n");
+		dev_err(csi->dev, "failed to create link to device node\n");
 		video_unregister_device(vfd);
 		return ret;
 	}
 
 	/* Add vdev to the video devices list. */
-	imx_media_add_video_device(priv->md, vdev);
+	imx_media_add_video_device(csi->imxmd, &csi->vdev);
 
 	return 0;
 }
 
-static void imx7_media_capture_device_unregister(struct imx_media_video_dev *vdev)
+static void imx7_media_capture_device_unregister(struct imx7_csi *csi)
 {
-	struct capture_priv *priv = to_capture_priv(vdev);
-	struct video_device *vfd = priv->vdev.vfd;
+	struct video_device *vfd = csi->vdev.vfd;
 
 	media_entity_cleanup(&vfd->entity);
 	video_unregister_device(vfd);
 }
 
-static struct imx_media_video_dev *
-imx7_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
-			       int pad)
+static int imx7_media_capture_device_init(struct imx7_csi *csi)
 {
-	struct capture_priv *priv;
 	struct video_device *vfd;
 	struct vb2_queue *vq;
 	int ret;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return ERR_PTR(-ENOMEM);
-
-	priv->src_sd = src_sd;
-	priv->src_sd_pad = pad;
-	priv->dev = dev;
-
-	mutex_init(&priv->mutex);
-	INIT_LIST_HEAD(&priv->ready_q);
-	spin_lock_init(&priv->q_lock);
+	mutex_init(&csi->vdev_mutex);
+	INIT_LIST_HEAD(&csi->ready_q);
+	spin_lock_init(&csi->q_lock);
 
 	/* Allocate and initialize the video device. */
 	vfd = video_device_alloc();
 	if (!vfd)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	vfd->fops = &capture_fops;
 	vfd->ioctl_ops = &capture_ioctl_ops;
@@ -1343,44 +1308,44 @@ imx7_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	vfd->tvnorms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
 	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
 			 | V4L2_CAP_IO_MC;
-	vfd->lock = &priv->mutex;
-	vfd->queue = &priv->q;
+	vfd->lock = &csi->vdev_mutex;
+	vfd->queue = &csi->q;
 
-	snprintf(vfd->name, sizeof(vfd->name), "%s capture", src_sd->name);
+	snprintf(vfd->name, sizeof(vfd->name), "%s capture", csi->sd.name);
 
-	video_set_drvdata(vfd, priv);
-	priv->vdev.vfd = vfd;
-	INIT_LIST_HEAD(&priv->vdev.list);
+	video_set_drvdata(vfd, csi);
+	csi->vdev.vfd = vfd;
+	INIT_LIST_HEAD(&csi->vdev.list);
 
 	/* Initialize the video device pad. */
-	priv->vdev_pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&vfd->entity, 1, &priv->vdev_pad);
+	csi->vdev_pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vfd->entity, 1, &csi->vdev_pad);
 	if (ret) {
 		video_device_release(vfd);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
 	/* Initialize the vb2 queue. */
-	vq = &priv->q;
+	vq = &csi->q;
 	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	vq->io_modes = VB2_MMAP | VB2_DMABUF;
-	vq->drv_priv = priv;
+	vq->drv_priv = csi;
 	vq->buf_struct_size = sizeof(struct imx_media_buffer);
 	vq->ops = &capture_qops;
 	vq->mem_ops = &vb2_dma_contig_memops;
 	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vq->lock = &priv->mutex;
+	vq->lock = &csi->vdev_mutex;
 	vq->min_buffers_needed = 2;
-	vq->dev = priv->dev;
+	vq->dev = csi->dev;
 
 	ret = vb2_queue_init(vq);
 	if (ret) {
-		dev_err(priv->dev, "vb2_queue_init failed\n");
+		dev_err(csi->dev, "vb2_queue_init failed\n");
 		video_device_release(vfd);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
-	return &priv->vdev;
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------
@@ -1645,7 +1610,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_format *sink_fmt)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	struct imx_media_video_dev *vdev = csi->vdev;
+	struct imx_media_video_dev *vdev = &csi->vdev;
 	const struct v4l2_pix_format *out_pix = &vdev->fmt;
 	struct media_pad *pad;
 	int ret;
@@ -1716,13 +1681,11 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 	int ret;
 
-	csi->vdev = imx7_media_capture_device_init(csi->sd.dev, &csi->sd,
-						   IMX7_CSI_PAD_SRC);
-	if (IS_ERR(csi->vdev))
-		return PTR_ERR(csi->vdev);
+	ret = imx7_media_capture_device_init(csi);
+	if (ret)
+		return ret;
 
-	ret = imx7_media_capture_device_register(csi->vdev,
-						 MEDIA_LNK_FL_IMMUTABLE);
+	ret = imx7_media_capture_device_register(csi);
 	if (ret)
 		return ret;
 
@@ -1737,7 +1700,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	return 0;
 
 err_unreg:
-	imx7_media_capture_device_unregister(csi->vdev);
+	imx7_media_capture_device_unregister(csi);
 	return ret;
 }
 
@@ -1745,7 +1708,7 @@ static void imx7_csi_unregistered(struct v4l2_subdev *sd)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 
-	imx7_media_capture_device_unregister(csi->vdev);
+	imx7_media_capture_device_unregister(csi);
 }
 
 static const struct v4l2_subdev_video_ops imx7_csi_video_ops = {
-- 
Regards,

Laurent Pinchart

