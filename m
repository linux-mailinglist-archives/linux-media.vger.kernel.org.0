Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21F3F52148A
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241383AbiEJMDZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241270AbiEJMDY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED757165AB
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:25 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6AD7B9A;
        Tue, 10 May 2022 13:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183959;
        bh=SW6QXUPRxmJIzxkMVklssylI/Qn6MNYwgfUhiDE5yfM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NSBTyVnjcwAvbtLROg0LGuOFOmTKsZ0TefcXXIoWZomt25hh7rNcClEwXqsr+Q7Um
         /fNoRV4uL9hFxmjGlcnuaVqrvTn0LBE1CKTXsIix85YmgkEFrI2TjtyHOobT9veH/g
         MU9PiiNLw/FqSl+8DEcA975EcEBLta7H6U4OOWzQ=
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
Subject: [PATCH 11/50] staging: media: imx: imx7-media-csi: Import video device helpers
Date:   Tue, 10 May 2022 14:58:20 +0300
Message-Id: <20220510115859.19777-12-laurent.pinchart@ideasonboard.com>
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

To prepare for code refactoring, copy the video device helper code used
by this driver verbatim from imx-media-capture. Rename some functions to
avoid name clashes, and leave the legacy ioctls out as they're not used
by the imx7-media-csi driver. No functional change included.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 712 ++++++++++++++++++++-
 1 file changed, 702 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index e7dcb602afae..63f291684e79 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -17,11 +17,15 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-dma-contig.h>
@@ -335,6 +339,9 @@ static void imx7_csi_update_buf(struct imx7_csi *csi, dma_addr_t phys,
 		imx7_csi_reg_write(csi, phys, CSI_CSIDMASA_FB1);
 }
 
+static struct imx_media_buffer *
+imx7_media_capture_device_next_buf(struct imx_media_video_dev *vdev);
+
 static void imx7_csi_setup_vb2_buf(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = csi->vdev;
@@ -344,7 +351,7 @@ static void imx7_csi_setup_vb2_buf(struct imx7_csi *csi)
 	int i;
 
 	for (i = 0; i < 2; i++) {
-		buf = imx_media_capture_device_next_buf(vdev);
+		buf = imx7_media_capture_device_next_buf(vdev);
 		if (buf) {
 			csi->active_vb2_buf[i] = buf;
 			vb2_buf = &buf->vbuf.vb2_buf;
@@ -646,7 +653,7 @@ static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
 	csi->frame_sequence++;
 
 	/* get next queued buffer */
-	next = imx_media_capture_device_next_buf(vdev);
+	next = imx7_media_capture_device_next_buf(vdev);
 	if (next) {
 		phys = vb2_dma_contig_plane_dma_addr(&next->vbuf.vb2_buf, 0);
 		csi->active_vb2_buf[csi->buf_num] = next;
@@ -716,6 +723,691 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/* -----------------------------------------------------------------------------
+ * Video Capture Device
+ */
+
+#define IMX_CAPTURE_NAME "imx-capture"
+
+struct capture_priv {
+	struct imx_media_dev *md;		/* Media device */
+	struct device *dev;			/* Physical device */
+
+	struct imx_media_video_dev vdev;	/* Video device */
+	struct media_pad vdev_pad;		/* Video device pad */
+
+	struct v4l2_subdev *src_sd;		/* Source subdev */
+	int src_sd_pad;				/* Source subdev pad */
+
+	struct mutex mutex;			/* Protect vdev operations */
+
+	struct vb2_queue q;			/* The videobuf2 queue */
+	struct list_head ready_q;		/* List of queued buffers */
+	spinlock_t q_lock;			/* Protect ready_q */
+
+	struct v4l2_ctrl_handler ctrl_hdlr;	/* Controls inherited from subdevs */
+
+	bool legacy_api;			/* Use the legacy (pre-MC) API */
+};
+
+#define to_capture_priv(v) container_of(v, struct capture_priv, vdev)
+
+/* In bytes, per queue */
+#define VID_MEM_LIMIT	SZ_64M
+
+/* -----------------------------------------------------------------------------
+ * Video Capture Device - IOCTLs
+ */
+
+static const struct imx_media_pixfmt *capture_find_format(u32 code, u32 fourcc)
+{
+	const struct imx_media_pixfmt *cc;
+
+	cc = imx_media_find_ipu_format(code, PIXFMT_SEL_YUV_RGB);
+	if (cc) {
+		enum imx_pixfmt_sel fmt_sel = cc->cs == IPUV3_COLORSPACE_YUV
+					    ? PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
+
+		cc = imx_media_find_pixel_format(fourcc, fmt_sel);
+		if (!cc) {
+			imx_media_enum_pixel_formats(&fourcc, 0, fmt_sel, 0);
+			cc = imx_media_find_pixel_format(fourcc, fmt_sel);
+		}
+
+		return cc;
+	}
+
+	return imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
+}
+
+static int capture_querycap(struct file *file, void *fh,
+			    struct v4l2_capability *cap)
+{
+	struct capture_priv *priv = video_drvdata(file);
+
+	strscpy(cap->driver, IMX_CAPTURE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, IMX_CAPTURE_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s", dev_name(priv->dev));
+
+	return 0;
+}
+
+static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
+				    struct v4l2_fmtdesc *f)
+{
+	return imx_media_enum_pixel_formats(&f->pixelformat, f->index,
+					    PIXFMT_SEL_ANY, f->mbus_code);
+}
+
+static int capture_enum_framesizes(struct file *file, void *fh,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	const struct imx_media_pixfmt *cc;
+
+	if (fsize->index > 0)
+		return -EINVAL;
+
+	cc = imx_media_find_pixel_format(fsize->pixel_format, PIXFMT_SEL_ANY);
+	if (!cc)
+		return -EINVAL;
+
+	/*
+	 * TODO: The constraints are hardware-specific and may depend on the
+	 * pixel format. This should come from the driver using
+	 * imx_media_capture.
+	 */
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = 1;
+	fsize->stepwise.max_width = 65535;
+	fsize->stepwise.min_height = 1;
+	fsize->stepwise.max_height = 65535;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
+static int capture_g_fmt_vid_cap(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct capture_priv *priv = video_drvdata(file);
+
+	f->fmt.pix = priv->vdev.fmt;
+
+	return 0;
+}
+
+static const struct imx_media_pixfmt *
+__capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compose)
+{
+	struct v4l2_mbus_framefmt fmt_src;
+	const struct imx_media_pixfmt *cc;
+
+	/*
+	 * Find the pixel format, default to the first supported format if not
+	 * found.
+	 */
+	cc = imx_media_find_pixel_format(pixfmt->pixelformat, PIXFMT_SEL_ANY);
+	if (!cc) {
+		imx_media_enum_pixel_formats(&pixfmt->pixelformat, 0,
+					     PIXFMT_SEL_ANY, 0);
+		cc = imx_media_find_pixel_format(pixfmt->pixelformat,
+						 PIXFMT_SEL_ANY);
+	}
+
+	/* Allow IDMAC interweave but enforce field order from source. */
+	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
+		switch (pixfmt->field) {
+		case V4L2_FIELD_SEQ_TB:
+			pixfmt->field = V4L2_FIELD_INTERLACED_TB;
+			break;
+		case V4L2_FIELD_SEQ_BT:
+			pixfmt->field = V4L2_FIELD_INTERLACED_BT;
+			break;
+		default:
+			break;
+		}
+	}
+
+	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
+	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
+
+	if (compose) {
+		compose->width = fmt_src.width;
+		compose->height = fmt_src.height;
+	}
+
+	return cc;
+}
+
+static int capture_try_fmt_vid_cap(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	__capture_try_fmt(&f->fmt.pix, NULL);
+	return 0;
+}
+
+static int capture_s_fmt_vid_cap(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct capture_priv *priv = video_drvdata(file);
+	const struct imx_media_pixfmt *cc;
+
+	if (vb2_is_busy(&priv->q)) {
+		dev_err(priv->dev, "%s queue busy\n", __func__);
+		return -EBUSY;
+	}
+
+	cc = __capture_try_fmt(&f->fmt.pix, &priv->vdev.compose);
+
+	priv->vdev.cc = cc;
+	priv->vdev.fmt = f->fmt.pix;
+
+	return 0;
+}
+
+static int capture_g_selection(struct file *file, void *fh,
+			       struct v4l2_selection *s)
+{
+	struct capture_priv *priv = video_drvdata(file);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_COMPOSE:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		/* The compose rectangle is fixed to the source format. */
+		s->r = priv->vdev.compose;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+		/*
+		 * The hardware writes with a configurable but fixed DMA burst
+		 * size. If the source format width is not burst size aligned,
+		 * the written frame contains padding to the right.
+		 */
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = priv->vdev.fmt.width;
+		s->r.height = priv->vdev.fmt.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int capture_subscribe_event(struct v4l2_fh *fh,
+				   const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ioctl_ops capture_ioctl_ops = {
+	.vidioc_querycap		= capture_querycap,
+
+	.vidioc_enum_fmt_vid_cap	= capture_enum_fmt_vid_cap,
+	.vidioc_enum_framesizes		= capture_enum_framesizes,
+
+	.vidioc_g_fmt_vid_cap		= capture_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap		= capture_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap		= capture_s_fmt_vid_cap,
+
+	.vidioc_g_selection		= capture_g_selection,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+
+	.vidioc_subscribe_event		= capture_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+/* -----------------------------------------------------------------------------
+ * Video Capture Device - Queue Operations
+ */
+
+static int capture_queue_setup(struct vb2_queue *vq,
+			       unsigned int *nbuffers,
+			       unsigned int *nplanes,
+			       unsigned int sizes[],
+			       struct device *alloc_devs[])
+{
+	struct capture_priv *priv = vb2_get_drv_priv(vq);
+	struct v4l2_pix_format *pix = &priv->vdev.fmt;
+	unsigned int count = *nbuffers;
+
+	if (vq->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	if (*nplanes) {
+		if (*nplanes != 1 || sizes[0] < pix->sizeimage)
+			return -EINVAL;
+		count += vq->num_buffers;
+	}
+
+	count = min_t(__u32, VID_MEM_LIMIT / pix->sizeimage, count);
+
+	if (*nplanes)
+		*nbuffers = (count < vq->num_buffers) ? 0 :
+			count - vq->num_buffers;
+	else
+		*nbuffers = count;
+
+	*nplanes = 1;
+	sizes[0] = pix->sizeimage;
+
+	return 0;
+}
+
+static int capture_buf_init(struct vb2_buffer *vb)
+{
+	struct imx_media_buffer *buf = to_imx_media_vb(vb);
+
+	INIT_LIST_HEAD(&buf->list);
+
+	return 0;
+}
+
+static int capture_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct capture_priv *priv = vb2_get_drv_priv(vq);
+	struct v4l2_pix_format *pix = &priv->vdev.fmt;
+
+	if (vb2_plane_size(vb, 0) < pix->sizeimage) {
+		dev_err(priv->dev,
+			"data will not fit into plane (%lu < %lu)\n",
+			vb2_plane_size(vb, 0), (long)pix->sizeimage);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, 0, pix->sizeimage);
+
+	return 0;
+}
+
+static void capture_buf_queue(struct vb2_buffer *vb)
+{
+	struct capture_priv *priv = vb2_get_drv_priv(vb->vb2_queue);
+	struct imx_media_buffer *buf = to_imx_media_vb(vb);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->q_lock, flags);
+
+	list_add_tail(&buf->list, &priv->ready_q);
+
+	spin_unlock_irqrestore(&priv->q_lock, flags);
+}
+
+static int capture_validate_fmt(struct capture_priv *priv)
+{
+	struct v4l2_subdev_format fmt_src;
+	const struct imx_media_pixfmt *cc;
+	int ret;
+
+	/* Retrieve the media bus format on the source subdev. */
+	fmt_src.pad = priv->src_sd_pad;
+	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
+	if (ret)
+		return ret;
+
+	/*
+	 * Verify that the media bus size matches the size set on the video
+	 * node. It is sufficient to check the compose rectangle size without
+	 * checking the rounded size from vdev.fmt, as the rounded size is
+	 * derived directly from the compose rectangle size, and will thus
+	 * always match if the compose rectangle matches.
+	 */
+	if (priv->vdev.compose.width != fmt_src.format.width ||
+	    priv->vdev.compose.height != fmt_src.format.height)
+		return -EPIPE;
+
+	/*
+	 * Verify that the media bus code is compatible with the pixel format
+	 * set on the video node.
+	 */
+	cc = capture_find_format(fmt_src.format.code, 0);
+	if (!cc || priv->vdev.cc->cs != cc->cs)
+		return -EPIPE;
+
+	return 0;
+}
+
+static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct capture_priv *priv = vb2_get_drv_priv(vq);
+	struct imx_media_buffer *buf, *tmp;
+	unsigned long flags;
+	int ret;
+
+	ret = capture_validate_fmt(priv);
+	if (ret) {
+		dev_err(priv->dev, "capture format not valid\n");
+		goto return_bufs;
+	}
+
+	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
+					    true);
+	if (ret) {
+		dev_err(priv->dev, "pipeline start failed with %d\n", ret);
+		goto return_bufs;
+	}
+
+	return 0;
+
+return_bufs:
+	spin_lock_irqsave(&priv->q_lock, flags);
+	list_for_each_entry_safe(buf, tmp, &priv->ready_q, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_QUEUED);
+	}
+	spin_unlock_irqrestore(&priv->q_lock, flags);
+	return ret;
+}
+
+static void capture_stop_streaming(struct vb2_queue *vq)
+{
+	struct capture_priv *priv = vb2_get_drv_priv(vq);
+	struct imx_media_buffer *frame;
+	struct imx_media_buffer *tmp;
+	unsigned long flags;
+	int ret;
+
+	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
+					    false);
+	if (ret)
+		dev_warn(priv->dev, "pipeline stop failed with %d\n", ret);
+
+	/* release all active buffers */
+	spin_lock_irqsave(&priv->q_lock, flags);
+	list_for_each_entry_safe(frame, tmp, &priv->ready_q, list) {
+		list_del(&frame->list);
+		vb2_buffer_done(&frame->vbuf.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	spin_unlock_irqrestore(&priv->q_lock, flags);
+}
+
+static const struct vb2_ops capture_qops = {
+	.queue_setup	 = capture_queue_setup,
+	.buf_init        = capture_buf_init,
+	.buf_prepare	 = capture_buf_prepare,
+	.buf_queue	 = capture_buf_queue,
+	.wait_prepare	 = vb2_ops_wait_prepare,
+	.wait_finish	 = vb2_ops_wait_finish,
+	.start_streaming = capture_start_streaming,
+	.stop_streaming  = capture_stop_streaming,
+};
+
+/* -----------------------------------------------------------------------------
+ * Video Capture Device - File Operations
+ */
+
+static int capture_open(struct file *file)
+{
+	struct capture_priv *priv = video_drvdata(file);
+	struct video_device *vfd = priv->vdev.vfd;
+	int ret;
+
+	if (mutex_lock_interruptible(&priv->mutex))
+		return -ERESTARTSYS;
+
+	ret = v4l2_fh_open(file);
+	if (ret) {
+		dev_err(priv->dev, "v4l2_fh_open failed\n");
+		goto out;
+	}
+
+	ret = v4l2_pipeline_pm_get(&vfd->entity);
+	if (ret)
+		v4l2_fh_release(file);
+
+out:
+	mutex_unlock(&priv->mutex);
+	return ret;
+}
+
+static int capture_release(struct file *file)
+{
+	struct capture_priv *priv = video_drvdata(file);
+	struct video_device *vfd = priv->vdev.vfd;
+	struct vb2_queue *vq = &priv->q;
+
+	mutex_lock(&priv->mutex);
+
+	if (file->private_data == vq->owner) {
+		vb2_queue_release(vq);
+		vq->owner = NULL;
+	}
+
+	v4l2_pipeline_pm_put(&vfd->entity);
+
+	v4l2_fh_release(file);
+	mutex_unlock(&priv->mutex);
+	return 0;
+}
+
+static const struct v4l2_file_operations capture_fops = {
+	.owner		= THIS_MODULE,
+	.open		= capture_open,
+	.release	= capture_release,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl	= video_ioctl2,
+	.mmap		= vb2_fop_mmap,
+};
+
+/* -----------------------------------------------------------------------------
+ * Video Capture Device - Init & Cleanup
+ */
+
+static struct imx_media_buffer *
+imx7_media_capture_device_next_buf(struct imx_media_video_dev *vdev)
+{
+	struct capture_priv *priv = to_capture_priv(vdev);
+	struct imx_media_buffer *buf = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->q_lock, flags);
+
+	/* get next queued buffer */
+	if (!list_empty(&priv->ready_q)) {
+		buf = list_entry(priv->ready_q.next, struct imx_media_buffer,
+				 list);
+		list_del(&buf->list);
+	}
+
+	spin_unlock_irqrestore(&priv->q_lock, flags);
+
+	return buf;
+}
+
+static int capture_init_format(struct capture_priv *priv)
+{
+	struct v4l2_subdev_format fmt_src = {
+		.pad = priv->src_sd_pad,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct imx_media_video_dev *vdev = &priv->vdev;
+	int ret;
+
+	if (priv->legacy_api) {
+		ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL,
+				       &fmt_src);
+		if (ret) {
+			dev_err(priv->dev, "failed to get source format\n");
+			return ret;
+		}
+	} else {
+		fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
+		fmt_src.format.width = IMX_MEDIA_DEF_PIX_WIDTH;
+		fmt_src.format.height = IMX_MEDIA_DEF_PIX_HEIGHT;
+	}
+
+	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
+	vdev->compose.width = fmt_src.format.width;
+	vdev->compose.height = fmt_src.format.height;
+
+	vdev->cc = imx_media_find_pixel_format(vdev->fmt.pixelformat,
+					       PIXFMT_SEL_ANY);
+
+	return 0;
+}
+
+static int imx7_media_capture_device_register(struct imx_media_video_dev *vdev,
+					      u32 link_flags)
+{
+	struct capture_priv *priv = to_capture_priv(vdev);
+	struct v4l2_subdev *sd = priv->src_sd;
+	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
+	struct video_device *vfd = vdev->vfd;
+	int ret;
+
+	/* get media device */
+	priv->md = container_of(v4l2_dev->mdev, struct imx_media_dev, md);
+
+	vfd->v4l2_dev = v4l2_dev;
+
+	/* Initialize the default format and compose rectangle. */
+	ret = capture_init_format(priv);
+	if (ret < 0)
+		return ret;
+
+	/* Register the video device. */
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(priv->dev, "Failed to register video device\n");
+		return ret;
+	}
+
+	dev_info(priv->dev, "Registered %s as /dev/%s\n", vfd->name,
+		 video_device_node_name(vfd));
+
+	/* Create the link from the src_sd devnode pad to device node. */
+	if (link_flags & MEDIA_LNK_FL_IMMUTABLE)
+		link_flags |= MEDIA_LNK_FL_ENABLED;
+	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
+				    &vfd->entity, 0, link_flags);
+	if (ret) {
+		dev_err(priv->dev, "failed to create link to device node\n");
+		video_unregister_device(vfd);
+		return ret;
+	}
+
+	/* Add vdev to the video devices list. */
+	imx_media_add_video_device(priv->md, vdev);
+
+	return 0;
+}
+
+static void imx7_media_capture_device_unregister(struct imx_media_video_dev *vdev)
+{
+	struct capture_priv *priv = to_capture_priv(vdev);
+	struct video_device *vfd = priv->vdev.vfd;
+
+	media_entity_cleanup(&vfd->entity);
+	video_unregister_device(vfd);
+}
+
+static struct imx_media_video_dev *
+imx7_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
+			       int pad, bool legacy_api)
+{
+	struct capture_priv *priv;
+	struct video_device *vfd;
+	struct vb2_queue *vq;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	priv->src_sd = src_sd;
+	priv->src_sd_pad = pad;
+	priv->dev = dev;
+	priv->legacy_api = legacy_api;
+
+	mutex_init(&priv->mutex);
+	INIT_LIST_HEAD(&priv->ready_q);
+	spin_lock_init(&priv->q_lock);
+
+	/* Allocate and initialize the video device. */
+	vfd = video_device_alloc();
+	if (!vfd)
+		return ERR_PTR(-ENOMEM);
+
+	vfd->fops = &capture_fops;
+	vfd->ioctl_ops = &capture_ioctl_ops;
+	vfd->minor = -1;
+	vfd->release = video_device_release;
+	vfd->vfl_dir = VFL_DIR_RX;
+	vfd->tvnorms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
+	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
+			 | (!legacy_api ? V4L2_CAP_IO_MC : 0);
+	vfd->lock = &priv->mutex;
+	vfd->queue = &priv->q;
+
+	snprintf(vfd->name, sizeof(vfd->name), "%s capture", src_sd->name);
+
+	video_set_drvdata(vfd, priv);
+	priv->vdev.vfd = vfd;
+	INIT_LIST_HEAD(&priv->vdev.list);
+
+	/* Initialize the video device pad. */
+	priv->vdev_pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vfd->entity, 1, &priv->vdev_pad);
+	if (ret) {
+		video_device_release(vfd);
+		return ERR_PTR(ret);
+	}
+
+	/* Initialize the vb2 queue. */
+	vq = &priv->q;
+	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	vq->drv_priv = priv;
+	vq->buf_struct_size = sizeof(struct imx_media_buffer);
+	vq->ops = &capture_qops;
+	vq->mem_ops = &vb2_dma_contig_memops;
+	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vq->lock = &priv->mutex;
+	vq->min_buffers_needed = 2;
+	vq->dev = priv->dev;
+
+	ret = vb2_queue_init(vq);
+	if (ret) {
+		dev_err(priv->dev, "vb2_queue_init failed\n");
+		video_device_release(vfd);
+		return ERR_PTR(ret);
+	}
+
+	if (legacy_api) {
+		/* Initialize the control handler. */
+		v4l2_ctrl_handler_init(&priv->ctrl_hdlr, 0);
+		vfd->ctrl_handler = &priv->ctrl_hdlr;
+	}
+
+	return &priv->vdev;
+}
+
+static void imx7_media_capture_device_remove(struct imx_media_video_dev *vdev)
+{
+	struct capture_priv *priv = to_capture_priv(vdev);
+
+	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
+}
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdev Operations
  */
@@ -1049,13 +1741,13 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 	int ret;
 
-	csi->vdev = imx_media_capture_device_init(csi->sd.dev, &csi->sd,
-						  IMX7_CSI_PAD_SRC, false);
+	csi->vdev = imx7_media_capture_device_init(csi->sd.dev, &csi->sd,
+						   IMX7_CSI_PAD_SRC, false);
 	if (IS_ERR(csi->vdev))
 		return PTR_ERR(csi->vdev);
 
-	ret = imx_media_capture_device_register(csi->vdev,
-						MEDIA_LNK_FL_IMMUTABLE);
+	ret = imx7_media_capture_device_register(csi->vdev,
+						 MEDIA_LNK_FL_IMMUTABLE);
 	if (ret)
 		goto err_remove;
 
@@ -1070,9 +1762,9 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	return 0;
 
 err_unreg:
-	imx_media_capture_device_unregister(csi->vdev);
+	imx7_media_capture_device_unregister(csi->vdev);
 err_remove:
-	imx_media_capture_device_remove(csi->vdev);
+	imx7_media_capture_device_remove(csi->vdev);
 	return ret;
 }
 
@@ -1080,8 +1772,8 @@ static void imx7_csi_unregistered(struct v4l2_subdev *sd)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 
-	imx_media_capture_device_unregister(csi->vdev);
-	imx_media_capture_device_remove(csi->vdev);
+	imx7_media_capture_device_unregister(csi->vdev);
+	imx7_media_capture_device_remove(csi->vdev);
 }
 
 static const struct v4l2_subdev_video_ops imx7_csi_video_ops = {
-- 
Regards,

Laurent Pinchart

