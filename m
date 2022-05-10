Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470BE52148E
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241451AbiEJMDq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241453AbiEJMDp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343EE46163
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:48 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CCF019AD;
        Tue, 10 May 2022 13:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183974;
        bh=dOIuG8WAkRVjS+sir4i0rbt/c2SmHOREKpWNSEMUE7c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Io0ytnxWf/YpJRuaXAu6+O4ekTaxjifKSuBFW3OiCPNJdbxksUCqbmMoX1skbCh7D
         OTmgDyTndFEvYve6E3s7Apy4woDhh1QrOtI0ymDeexDlsPC52viFQPRsDwUCy98lSo
         WktKxONHNJ1D/yKV8rXQdf7YFCeCjADkFYVA5gfk=
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
Subject: [PATCH 28/50] staging: media: imx: imx7-media-csi: Fold imx_media_video_dev into imx7_csi
Date:   Tue, 10 May 2022 14:58:37 +0300
Message-Id: <20220510115859.19777-29-laurent.pinchart@ideasonboard.com>
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

Now that the driver doesn't use any helper that relies on the
imx_media_video_dev structure anymore, merge its fields directly in the
imx7_csi structure. Update all the users accordingly, and drop the list
field that isn't used by the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 121 ++++++++++-----------
 1 file changed, 57 insertions(+), 64 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index bd1bc3fada2e..14683a15e003 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -212,9 +212,13 @@ struct imx7_csi {
 	const struct imx_media_pixfmt *cc[IMX7_CSI_PADS_NUM];
 
 	/* Video device */
-	struct imx_media_video_dev vdev;	/* Video device */
+	struct video_device *vdev;		/* Video device */
 	struct media_pad vdev_pad;		/* Video device pad */
 
+	struct v4l2_pix_format vdev_fmt;	/* The user format */
+	const struct imx_media_pixfmt *vdev_cc;
+	struct v4l2_rect vdev_compose;		/* The compose rectangle */
+
 	struct mutex vdev_mutex;		/* Protect vdev operations */
 
 	struct vb2_queue q;			/* The videobuf2 queue */
@@ -413,11 +417,10 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_csi *csi,
 
 static int imx7_csi_dma_setup(struct imx7_csi *csi)
 {
-	struct imx_media_video_dev *vdev = &csi->vdev;
 	int ret;
 
 	ret = imx_media_alloc_dma_buf(csi->dev, &csi->underrun_buf,
-				      vdev->fmt.sizeimage);
+				      csi->vdev_fmt.sizeimage);
 	if (ret < 0) {
 		v4l2_warn(&csi->sd, "consider increasing the CMA area\n");
 		return ret;
@@ -464,8 +467,7 @@ static void imx7_csi_dma_stop(struct imx7_csi *csi)
 
 static void imx7_csi_configure(struct imx7_csi *csi)
 {
-	struct imx_media_video_dev *vdev = &csi->vdev;
-	struct v4l2_pix_format *out_pix = &vdev->fmt;
+	struct v4l2_pix_format *out_pix = &csi->vdev_fmt;
 	int width = out_pix->width;
 	u32 stride = 0;
 	u32 cr3 = BIT_FRMCNT_RST;
@@ -664,14 +666,13 @@ static void imx7_csi_error_recovery(struct imx7_csi *csi)
 
 static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
 {
-	struct imx_media_video_dev *vdev = &csi->vdev;
 	struct imx7_csi_vb2_buffer *done, *next;
 	struct vb2_buffer *vb;
 	dma_addr_t phys;
 
 	done = csi->active_vb2_buf[csi->buf_num];
 	if (done) {
-		done->vbuf.field = vdev->fmt.field;
+		done->vbuf.field = csi->vdev_fmt.field;
 		done->vbuf.sequence = csi->frame_sequence;
 		vb = &done->vbuf.vb2_buf;
 		vb->timestamp = ktime_get_ns();
@@ -829,7 +830,7 @@ static int imx7_csi_video_g_fmt_vid_cap(struct file *file, void *fh,
 {
 	struct imx7_csi *csi = video_drvdata(file);
 
-	f->fmt.pix = csi->vdev.fmt;
+	f->fmt.pix = csi->vdev_fmt;
 
 	return 0;
 }
@@ -896,10 +897,10 @@ static int imx7_csi_video_s_fmt_vid_cap(struct file *file, void *fh,
 		return -EBUSY;
 	}
 
-	cc = __imx7_csi_video_try_fmt(&f->fmt.pix, &csi->vdev.compose);
+	cc = __imx7_csi_video_try_fmt(&f->fmt.pix, &csi->vdev_compose);
 
-	csi->vdev.cc = cc;
-	csi->vdev.fmt = f->fmt.pix;
+	csi->vdev_cc = cc;
+	csi->vdev_fmt = f->fmt.pix;
 
 	return 0;
 }
@@ -914,7 +915,7 @@ static int imx7_csi_video_g_selection(struct file *file, void *fh,
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 		/* The compose rectangle is fixed to the source format. */
-		s->r = csi->vdev.compose;
+		s->r = csi->vdev_compose;
 		break;
 	case V4L2_SEL_TGT_COMPOSE_PADDED:
 		/*
@@ -924,8 +925,8 @@ static int imx7_csi_video_g_selection(struct file *file, void *fh,
 		 */
 		s->r.left = 0;
 		s->r.top = 0;
-		s->r.width = csi->vdev.fmt.width;
-		s->r.height = csi->vdev.fmt.height;
+		s->r.width = csi->vdev_fmt.width;
+		s->r.height = csi->vdev_fmt.height;
 		break;
 	default:
 		return -EINVAL;
@@ -982,7 +983,7 @@ static int imx7_csi_video_queue_setup(struct vb2_queue *vq,
 				      struct device *alloc_devs[])
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vq);
-	struct v4l2_pix_format *pix = &csi->vdev.fmt;
+	struct v4l2_pix_format *pix = &csi->vdev_fmt;
 	unsigned int count = *nbuffers;
 
 	if (vq->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -1020,7 +1021,7 @@ static int imx7_csi_video_buf_init(struct vb2_buffer *vb)
 static int imx7_csi_video_buf_prepare(struct vb2_buffer *vb)
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vb->vb2_queue);
-	struct v4l2_pix_format *pix = &csi->vdev.fmt;
+	struct v4l2_pix_format *pix = &csi->vdev_fmt;
 
 	if (vb2_plane_size(vb, 0) < pix->sizeimage) {
 		dev_err(csi->dev,
@@ -1063,12 +1064,12 @@ static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 	/*
 	 * Verify that the media bus size matches the size set on the video
 	 * node. It is sufficient to check the compose rectangle size without
-	 * checking the rounded size from vdev.fmt, as the rounded size is
+	 * checking the rounded size from pix_fmt, as the rounded size is
 	 * derived directly from the compose rectangle size, and will thus
 	 * always match if the compose rectangle matches.
 	 */
-	if (csi->vdev.compose.width != fmt_src.format.width ||
-	    csi->vdev.compose.height != fmt_src.format.height)
+	if (csi->vdev_compose.width != fmt_src.format.width ||
+	    csi->vdev_compose.height != fmt_src.format.height)
 		return -EPIPE;
 
 	/*
@@ -1076,7 +1077,7 @@ static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 	 * set on the video node.
 	 */
 	cc = imx7_csi_video_find_format(fmt_src.format.code, 0);
-	if (!cc || csi->vdev.cc->cs != cc->cs)
+	if (!cc || csi->vdev_cc->cs != cc->cs)
 		return -EPIPE;
 
 	return 0;
@@ -1164,7 +1165,6 @@ static const struct vb2_ops imx7_csi_video_qops = {
 static int imx7_csi_video_open(struct file *file)
 {
 	struct imx7_csi *csi = video_drvdata(file);
-	struct video_device *vfd = csi->vdev.vfd;
 	int ret;
 
 	if (mutex_lock_interruptible(&csi->vdev_mutex))
@@ -1176,7 +1176,7 @@ static int imx7_csi_video_open(struct file *file)
 		goto out;
 	}
 
-	ret = v4l2_pipeline_pm_get(&vfd->entity);
+	ret = v4l2_pipeline_pm_get(&csi->vdev->entity);
 	if (ret)
 		v4l2_fh_release(file);
 
@@ -1188,7 +1188,6 @@ static int imx7_csi_video_open(struct file *file)
 static int imx7_csi_video_release(struct file *file)
 {
 	struct imx7_csi *csi = video_drvdata(file);
-	struct video_device *vfd = csi->vdev.vfd;
 	struct vb2_queue *vq = &csi->q;
 
 	mutex_lock(&csi->vdev_mutex);
@@ -1198,7 +1197,7 @@ static int imx7_csi_video_release(struct file *file)
 		vq->owner = NULL;
 	}
 
-	v4l2_pipeline_pm_put(&vfd->entity);
+	v4l2_pipeline_pm_put(&csi->vdev->entity);
 
 	v4l2_fh_release(file);
 	mutex_unlock(&csi->vdev_mutex);
@@ -1243,18 +1242,16 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
 		.pad = IMX7_CSI_PAD_SRC,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	struct imx_media_video_dev *vdev = &csi->vdev;
-
 	fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
 	fmt_src.format.width = IMX_MEDIA_DEF_PIX_WIDTH;
 	fmt_src.format.height = IMX_MEDIA_DEF_PIX_HEIGHT;
 
-	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
-	vdev->compose.width = fmt_src.format.width;
-	vdev->compose.height = fmt_src.format.height;
+	imx_media_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &fmt_src.format, NULL);
+	csi->vdev_compose.width = fmt_src.format.width;
+	csi->vdev_compose.height = fmt_src.format.height;
 
-	vdev->cc = imx_media_find_pixel_format(vdev->fmt.pixelformat,
-					       PIXFMT_SEL_ANY);
+	csi->vdev_cc = imx_media_find_pixel_format(csi->vdev_fmt.pixelformat,
+						   PIXFMT_SEL_ANY);
 
 	return 0;
 }
@@ -1263,10 +1260,10 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 {
 	struct v4l2_subdev *sd = &csi->sd;
 	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
-	struct video_device *vfd = csi->vdev.vfd;
+	struct video_device *vdev = csi->vdev;
 	int ret;
 
-	vfd->v4l2_dev = v4l2_dev;
+	vdev->v4l2_dev = v4l2_dev;
 
 	/* Initialize the default format and compose rectangle. */
 	ret = imx7_csi_video_init_format(csi);
@@ -1274,22 +1271,22 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 		return ret;
 
 	/* Register the video device. */
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(csi->dev, "Failed to register video device\n");
 		return ret;
 	}
 
-	dev_info(csi->dev, "Registered %s as /dev/%s\n", vfd->name,
-		 video_device_node_name(vfd));
+	dev_info(csi->dev, "Registered %s as /dev/%s\n", vdev->name,
+		 video_device_node_name(vdev));
 
 	/* Create the link from the CSI subdev to the video device. */
-	ret = media_create_pad_link(&sd->entity, IMX7_CSI_PAD_SRC, &vfd->entity,
-				    0, MEDIA_LNK_FL_IMMUTABLE |
+	ret = media_create_pad_link(&sd->entity, IMX7_CSI_PAD_SRC,
+				    &vdev->entity, 0, MEDIA_LNK_FL_IMMUTABLE |
 				    MEDIA_LNK_FL_ENABLED);
 	if (ret) {
 		dev_err(csi->dev, "failed to create link to device node\n");
-		video_unregister_device(vfd);
+		video_unregister_device(vdev);
 		return ret;
 	}
 
@@ -1298,15 +1295,13 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 
 static void imx7_csi_video_unregister(struct imx7_csi *csi)
 {
-	struct video_device *vfd = csi->vdev.vfd;
-
-	media_entity_cleanup(&vfd->entity);
-	video_unregister_device(vfd);
+	media_entity_cleanup(&csi->vdev->entity);
+	video_unregister_device(csi->vdev);
 }
 
 static int imx7_csi_video_init(struct imx7_csi *csi)
 {
-	struct video_device *vfd;
+	struct video_device *vdev;
 	struct vb2_queue *vq;
 	int ret;
 
@@ -1315,32 +1310,31 @@ static int imx7_csi_video_init(struct imx7_csi *csi)
 	spin_lock_init(&csi->q_lock);
 
 	/* Allocate and initialize the video device. */
-	vfd = video_device_alloc();
-	if (!vfd)
+	vdev = video_device_alloc();
+	if (!vdev)
 		return -ENOMEM;
 
-	vfd->fops = &imx7_csi_video_fops;
-	vfd->ioctl_ops = &imx7_csi_video_ioctl_ops;
-	vfd->minor = -1;
-	vfd->release = video_device_release;
-	vfd->vfl_dir = VFL_DIR_RX;
-	vfd->tvnorms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
-	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
+	vdev->fops = &imx7_csi_video_fops;
+	vdev->ioctl_ops = &imx7_csi_video_ioctl_ops;
+	vdev->minor = -1;
+	vdev->release = video_device_release;
+	vdev->vfl_dir = VFL_DIR_RX;
+	vdev->tvnorms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
 			 | V4L2_CAP_IO_MC;
-	vfd->lock = &csi->vdev_mutex;
-	vfd->queue = &csi->q;
+	vdev->lock = &csi->vdev_mutex;
+	vdev->queue = &csi->q;
 
-	snprintf(vfd->name, sizeof(vfd->name), "%s capture", csi->sd.name);
+	snprintf(vdev->name, sizeof(vdev->name), "%s capture", csi->sd.name);
 
-	video_set_drvdata(vfd, csi);
-	csi->vdev.vfd = vfd;
-	INIT_LIST_HEAD(&csi->vdev.list);
+	video_set_drvdata(vdev, csi);
+	csi->vdev = vdev;
 
 	/* Initialize the video device pad. */
 	csi->vdev_pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&vfd->entity, 1, &csi->vdev_pad);
+	ret = media_entity_pads_init(&vdev->entity, 1, &csi->vdev_pad);
 	if (ret) {
-		video_device_release(vfd);
+		video_device_release(vdev);
 		return ret;
 	}
 
@@ -1360,7 +1354,7 @@ static int imx7_csi_video_init(struct imx7_csi *csi)
 	ret = vb2_queue_init(vq);
 	if (ret) {
 		dev_err(csi->dev, "vb2_queue_init failed\n");
-		video_device_release(vfd);
+		video_device_release(vdev);
 		return ret;
 	}
 
@@ -1629,8 +1623,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_format *sink_fmt)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	struct imx_media_video_dev *vdev = &csi->vdev;
-	const struct v4l2_pix_format *out_pix = &vdev->fmt;
+	const struct v4l2_pix_format *out_pix = &csi->vdev_fmt;
 	struct media_pad *pad = NULL;
 	unsigned int i;
 	int ret;
-- 
Regards,

Laurent Pinchart

