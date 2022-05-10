Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B87D52149C
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240993AbiEJMDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241405AbiEJMDb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB8646163
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:33 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FC14E0C;
        Tue, 10 May 2022 13:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183963;
        bh=ntJKLze6OrE+9OL6FEXItJoTrYmk7Yeef2Xythqg8GY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ugR72czBZyuO7ErrE56ITEwFumuKzs/LVfxdoviq4hgPfm6KG4rSAYoXIAZ5tznHM
         km2JUJf4z0jVMdHLArx3Zg2cTeVdGY6GMK/KuVoRDCDyPi6/SIOcWsgoHLcjDBaHXA
         2ZugrF0mT5VlPGPqMyfH8z3xary21w4oIbqQkQ9Y=
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
Subject: [PATCH 16/50] staging: media: imx: imx7-media-csi: Ensure consistent function prefix
Date:   Tue, 10 May 2022 14:58:25 +0300
Message-Id: <20220510115859.19777-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename all the functions and macros imported from imx-media-capture.c
with a consistent imx7_csi_video_ prefix. No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 164 ++++++++++-----------
 1 file changed, 80 insertions(+), 84 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 9b4463e456c2..80d666416d47 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -162,6 +162,10 @@
 #define CSI_CSICR18			0x48
 #define CSI_CSICR19			0x4c
 
+#define IMX7_CSI_VIDEO_NAME		"imx-capture"
+/* In bytes, per queue */
+#define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_64M
+
 enum imx_csi_model {
 	IMX7_CSI_IMX7 = 0,
 	IMX7_CSI_IMX8MQ,
@@ -349,8 +353,7 @@ static void imx7_csi_update_buf(struct imx7_csi *csi, dma_addr_t phys,
 		imx7_csi_reg_write(csi, phys, CSI_CSIDMASA_FB1);
 }
 
-static struct imx_media_buffer *
-imx7_media_capture_device_next_buf(struct imx7_csi *csi);
+static struct imx_media_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi);
 
 static void imx7_csi_setup_vb2_buf(struct imx7_csi *csi)
 {
@@ -360,7 +363,7 @@ static void imx7_csi_setup_vb2_buf(struct imx7_csi *csi)
 	int i;
 
 	for (i = 0; i < 2; i++) {
-		buf = imx7_media_capture_device_next_buf(csi);
+		buf = imx7_csi_video_next_buf(csi);
 		if (buf) {
 			csi->active_vb2_buf[i] = buf;
 			vb2_buf = &buf->vbuf.vb2_buf;
@@ -662,7 +665,7 @@ static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
 	csi->frame_sequence++;
 
 	/* get next queued buffer */
-	next = imx7_media_capture_device_next_buf(csi);
+	next = imx7_csi_video_next_buf(csi);
 	if (next) {
 		phys = vb2_dma_contig_plane_dma_addr(&next->vbuf.vb2_buf, 0);
 		csi->active_vb2_buf[csi->buf_num] = next;
@@ -732,20 +735,12 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-/* -----------------------------------------------------------------------------
- * Video Capture Device
- */
-
-#define IMX_CAPTURE_NAME "imx-capture"
-
-/* In bytes, per queue */
-#define VID_MEM_LIMIT	SZ_64M
-
 /* -----------------------------------------------------------------------------
  * Video Capture Device - IOCTLs
  */
 
-static const struct imx_media_pixfmt *capture_find_format(u32 code, u32 fourcc)
+static const struct imx_media_pixfmt *
+imx7_csi_video_find_format(u32 code, u32 fourcc)
 {
 	const struct imx_media_pixfmt *cc;
 
@@ -766,28 +761,28 @@ static const struct imx_media_pixfmt *capture_find_format(u32 code, u32 fourcc)
 	return imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
 }
 
-static int capture_querycap(struct file *file, void *fh,
-			    struct v4l2_capability *cap)
+static int imx7_csi_video_querycap(struct file *file, void *fh,
+				   struct v4l2_capability *cap)
 {
 	struct imx7_csi *csi = video_drvdata(file);
 
-	strscpy(cap->driver, IMX_CAPTURE_NAME, sizeof(cap->driver));
-	strscpy(cap->card, IMX_CAPTURE_NAME, sizeof(cap->card));
+	strscpy(cap->driver, IMX7_CSI_VIDEO_NAME, sizeof(cap->driver));
+	strscpy(cap->card, IMX7_CSI_VIDEO_NAME, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
 		 "platform:%s", dev_name(csi->dev));
 
 	return 0;
 }
 
-static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
-				    struct v4l2_fmtdesc *f)
+static int imx7_csi_video_enum_fmt_vid_cap(struct file *file, void *fh,
+					   struct v4l2_fmtdesc *f)
 {
 	return imx_media_enum_pixel_formats(&f->pixelformat, f->index,
 					    PIXFMT_SEL_ANY, f->mbus_code);
 }
 
-static int capture_enum_framesizes(struct file *file, void *fh,
-				   struct v4l2_frmsizeenum *fsize)
+static int imx7_csi_video_enum_framesizes(struct file *file, void *fh,
+					  struct v4l2_frmsizeenum *fsize)
 {
 	const struct imx_media_pixfmt *cc;
 
@@ -814,8 +809,8 @@ static int capture_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_g_fmt_vid_cap(struct file *file, void *fh,
-				 struct v4l2_format *f)
+static int imx7_csi_video_g_fmt_vid_cap(struct file *file, void *fh,
+					struct v4l2_format *f)
 {
 	struct imx7_csi *csi = video_drvdata(file);
 
@@ -825,7 +820,8 @@ static int capture_g_fmt_vid_cap(struct file *file, void *fh,
 }
 
 static const struct imx_media_pixfmt *
-__capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compose)
+__imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
+			 struct v4l2_rect *compose)
 {
 	struct v4l2_mbus_framefmt fmt_src;
 	const struct imx_media_pixfmt *cc;
@@ -867,15 +863,15 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compose)
 	return cc;
 }
 
-static int capture_try_fmt_vid_cap(struct file *file, void *fh,
-				   struct v4l2_format *f)
+static int imx7_csi_video_try_fmt_vid_cap(struct file *file, void *fh,
+					  struct v4l2_format *f)
 {
-	__capture_try_fmt(&f->fmt.pix, NULL);
+	__imx7_csi_video_try_fmt(&f->fmt.pix, NULL);
 	return 0;
 }
 
-static int capture_s_fmt_vid_cap(struct file *file, void *fh,
-				 struct v4l2_format *f)
+static int imx7_csi_video_s_fmt_vid_cap(struct file *file, void *fh,
+					struct v4l2_format *f)
 {
 	struct imx7_csi *csi = video_drvdata(file);
 	const struct imx_media_pixfmt *cc;
@@ -885,7 +881,7 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 		return -EBUSY;
 	}
 
-	cc = __capture_try_fmt(&f->fmt.pix, &csi->vdev.compose);
+	cc = __imx7_csi_video_try_fmt(&f->fmt.pix, &csi->vdev.compose);
 
 	csi->vdev.cc = cc;
 	csi->vdev.fmt = f->fmt.pix;
@@ -893,8 +889,8 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_g_selection(struct file *file, void *fh,
-			       struct v4l2_selection *s)
+static int imx7_csi_video_g_selection(struct file *file, void *fh,
+				      struct v4l2_selection *s)
 {
 	struct imx7_csi *csi = video_drvdata(file);
 
@@ -923,8 +919,8 @@ static int capture_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_subscribe_event(struct v4l2_fh *fh,
-				   const struct v4l2_event_subscription *sub)
+static int imx7_csi_video_subscribe_event(struct v4l2_fh *fh,
+					  const struct v4l2_event_subscription *sub)
 {
 	switch (sub->type) {
 	case V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR:
@@ -934,17 +930,17 @@ static int capture_subscribe_event(struct v4l2_fh *fh,
 	}
 }
 
-static const struct v4l2_ioctl_ops capture_ioctl_ops = {
-	.vidioc_querycap		= capture_querycap,
+static const struct v4l2_ioctl_ops imx7_csi_video_ioctl_ops = {
+	.vidioc_querycap		= imx7_csi_video_querycap,
 
-	.vidioc_enum_fmt_vid_cap	= capture_enum_fmt_vid_cap,
-	.vidioc_enum_framesizes		= capture_enum_framesizes,
+	.vidioc_enum_fmt_vid_cap	= imx7_csi_video_enum_fmt_vid_cap,
+	.vidioc_enum_framesizes		= imx7_csi_video_enum_framesizes,
 
-	.vidioc_g_fmt_vid_cap		= capture_g_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap		= capture_try_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap		= capture_s_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap		= imx7_csi_video_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap		= imx7_csi_video_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap		= imx7_csi_video_s_fmt_vid_cap,
 
-	.vidioc_g_selection		= capture_g_selection,
+	.vidioc_g_selection		= imx7_csi_video_g_selection,
 
 	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
 	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
@@ -956,7 +952,7 @@ static const struct v4l2_ioctl_ops capture_ioctl_ops = {
 	.vidioc_streamon		= vb2_ioctl_streamon,
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
 
-	.vidioc_subscribe_event		= capture_subscribe_event,
+	.vidioc_subscribe_event		= imx7_csi_video_subscribe_event,
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 };
 
@@ -964,11 +960,11 @@ static const struct v4l2_ioctl_ops capture_ioctl_ops = {
  * Video Capture Device - Queue Operations
  */
 
-static int capture_queue_setup(struct vb2_queue *vq,
-			       unsigned int *nbuffers,
-			       unsigned int *nplanes,
-			       unsigned int sizes[],
-			       struct device *alloc_devs[])
+static int imx7_csi_video_queue_setup(struct vb2_queue *vq,
+				      unsigned int *nbuffers,
+				      unsigned int *nplanes,
+				      unsigned int sizes[],
+				      struct device *alloc_devs[])
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vq);
 	struct v4l2_pix_format *pix = &csi->vdev.fmt;
@@ -983,7 +979,7 @@ static int capture_queue_setup(struct vb2_queue *vq,
 		count += vq->num_buffers;
 	}
 
-	count = min_t(__u32, VID_MEM_LIMIT / pix->sizeimage, count);
+	count = min_t(__u32, IMX7_CSI_VIDEO_MEM_LIMIT / pix->sizeimage, count);
 
 	if (*nplanes)
 		*nbuffers = (count < vq->num_buffers) ? 0 :
@@ -997,7 +993,7 @@ static int capture_queue_setup(struct vb2_queue *vq,
 	return 0;
 }
 
-static int capture_buf_init(struct vb2_buffer *vb)
+static int imx7_csi_video_buf_init(struct vb2_buffer *vb)
 {
 	struct imx_media_buffer *buf = to_imx_media_vb(vb);
 
@@ -1006,7 +1002,7 @@ static int capture_buf_init(struct vb2_buffer *vb)
 	return 0;
 }
 
-static int capture_buf_prepare(struct vb2_buffer *vb)
+static int imx7_csi_video_buf_prepare(struct vb2_buffer *vb)
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vb->vb2_queue);
 	struct v4l2_pix_format *pix = &csi->vdev.fmt;
@@ -1023,7 +1019,7 @@ static int capture_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void capture_buf_queue(struct vb2_buffer *vb)
+static void imx7_csi_video_buf_queue(struct vb2_buffer *vb)
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vb->vb2_queue);
 	struct imx_media_buffer *buf = to_imx_media_vb(vb);
@@ -1036,7 +1032,7 @@ static void capture_buf_queue(struct vb2_buffer *vb)
 	spin_unlock_irqrestore(&csi->q_lock, flags);
 }
 
-static int capture_validate_fmt(struct imx7_csi *csi)
+static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 {
 	struct v4l2_subdev_format fmt_src;
 	const struct imx_media_pixfmt *cc;
@@ -1064,21 +1060,22 @@ static int capture_validate_fmt(struct imx7_csi *csi)
 	 * Verify that the media bus code is compatible with the pixel format
 	 * set on the video node.
 	 */
-	cc = capture_find_format(fmt_src.format.code, 0);
+	cc = imx7_csi_video_find_format(fmt_src.format.code, 0);
 	if (!cc || csi->vdev.cc->cs != cc->cs)
 		return -EPIPE;
 
 	return 0;
 }
 
-static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
+static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
+					  unsigned int count)
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vq);
 	struct imx_media_buffer *buf, *tmp;
 	unsigned long flags;
 	int ret;
 
-	ret = capture_validate_fmt(csi);
+	ret = imx7_csi_video_validate_fmt(csi);
 	if (ret) {
 		dev_err(csi->dev, "capture format not valid\n");
 		goto return_bufs;
@@ -1102,7 +1099,7 @@ static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return ret;
 }
 
-static void capture_stop_streaming(struct vb2_queue *vq)
+static void imx7_csi_video_stop_streaming(struct vb2_queue *vq)
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vq);
 	struct imx_media_buffer *frame;
@@ -1123,22 +1120,22 @@ static void capture_stop_streaming(struct vb2_queue *vq)
 	spin_unlock_irqrestore(&csi->q_lock, flags);
 }
 
-static const struct vb2_ops capture_qops = {
-	.queue_setup	 = capture_queue_setup,
-	.buf_init        = capture_buf_init,
-	.buf_prepare	 = capture_buf_prepare,
-	.buf_queue	 = capture_buf_queue,
+static const struct vb2_ops imx7_csi_video_qops = {
+	.queue_setup	 = imx7_csi_video_queue_setup,
+	.buf_init        = imx7_csi_video_buf_init,
+	.buf_prepare	 = imx7_csi_video_buf_prepare,
+	.buf_queue	 = imx7_csi_video_buf_queue,
 	.wait_prepare	 = vb2_ops_wait_prepare,
 	.wait_finish	 = vb2_ops_wait_finish,
-	.start_streaming = capture_start_streaming,
-	.stop_streaming  = capture_stop_streaming,
+	.start_streaming = imx7_csi_video_start_streaming,
+	.stop_streaming  = imx7_csi_video_stop_streaming,
 };
 
 /* -----------------------------------------------------------------------------
  * Video Capture Device - File Operations
  */
 
-static int capture_open(struct file *file)
+static int imx7_csi_video_open(struct file *file)
 {
 	struct imx7_csi *csi = video_drvdata(file);
 	struct video_device *vfd = csi->vdev.vfd;
@@ -1162,7 +1159,7 @@ static int capture_open(struct file *file)
 	return ret;
 }
 
-static int capture_release(struct file *file)
+static int imx7_csi_video_release(struct file *file)
 {
 	struct imx7_csi *csi = video_drvdata(file);
 	struct video_device *vfd = csi->vdev.vfd;
@@ -1182,10 +1179,10 @@ static int capture_release(struct file *file)
 	return 0;
 }
 
-static const struct v4l2_file_operations capture_fops = {
+static const struct v4l2_file_operations imx7_csi_video_fops = {
 	.owner		= THIS_MODULE,
-	.open		= capture_open,
-	.release	= capture_release,
+	.open		= imx7_csi_video_open,
+	.release	= imx7_csi_video_release,
 	.poll		= vb2_fop_poll,
 	.unlocked_ioctl	= video_ioctl2,
 	.mmap		= vb2_fop_mmap,
@@ -1195,8 +1192,7 @@ static const struct v4l2_file_operations capture_fops = {
  * Video Capture Device - Init & Cleanup
  */
 
-static struct imx_media_buffer *
-imx7_media_capture_device_next_buf(struct imx7_csi *csi)
+static struct imx_media_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi)
 {
 	struct imx_media_buffer *buf = NULL;
 	unsigned long flags;
@@ -1215,7 +1211,7 @@ imx7_media_capture_device_next_buf(struct imx7_csi *csi)
 	return buf;
 }
 
-static int capture_init_format(struct imx7_csi *csi)
+static int imx7_csi_video_init_format(struct imx7_csi *csi)
 {
 	struct v4l2_subdev_format fmt_src = {
 		.pad = IMX7_CSI_PAD_SRC,
@@ -1237,7 +1233,7 @@ static int capture_init_format(struct imx7_csi *csi)
 	return 0;
 }
 
-static int imx7_media_capture_device_register(struct imx7_csi *csi)
+static int imx7_csi_video_register(struct imx7_csi *csi)
 {
 	struct v4l2_subdev *sd = &csi->sd;
 	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
@@ -1247,7 +1243,7 @@ static int imx7_media_capture_device_register(struct imx7_csi *csi)
 	vfd->v4l2_dev = v4l2_dev;
 
 	/* Initialize the default format and compose rectangle. */
-	ret = capture_init_format(csi);
+	ret = imx7_csi_video_init_format(csi);
 	if (ret < 0)
 		return ret;
 
@@ -1277,7 +1273,7 @@ static int imx7_media_capture_device_register(struct imx7_csi *csi)
 	return 0;
 }
 
-static void imx7_media_capture_device_unregister(struct imx7_csi *csi)
+static void imx7_csi_video_unregister(struct imx7_csi *csi)
 {
 	struct video_device *vfd = csi->vdev.vfd;
 
@@ -1285,7 +1281,7 @@ static void imx7_media_capture_device_unregister(struct imx7_csi *csi)
 	video_unregister_device(vfd);
 }
 
-static int imx7_media_capture_device_init(struct imx7_csi *csi)
+static int imx7_csi_video_init(struct imx7_csi *csi)
 {
 	struct video_device *vfd;
 	struct vb2_queue *vq;
@@ -1300,8 +1296,8 @@ static int imx7_media_capture_device_init(struct imx7_csi *csi)
 	if (!vfd)
 		return -ENOMEM;
 
-	vfd->fops = &capture_fops;
-	vfd->ioctl_ops = &capture_ioctl_ops;
+	vfd->fops = &imx7_csi_video_fops;
+	vfd->ioctl_ops = &imx7_csi_video_ioctl_ops;
 	vfd->minor = -1;
 	vfd->release = video_device_release;
 	vfd->vfl_dir = VFL_DIR_RX;
@@ -1331,7 +1327,7 @@ static int imx7_media_capture_device_init(struct imx7_csi *csi)
 	vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	vq->drv_priv = csi;
 	vq->buf_struct_size = sizeof(struct imx_media_buffer);
-	vq->ops = &capture_qops;
+	vq->ops = &imx7_csi_video_qops;
 	vq->mem_ops = &vb2_dma_contig_memops;
 	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	vq->lock = &csi->vdev_mutex;
@@ -1681,11 +1677,11 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 	int ret;
 
-	ret = imx7_media_capture_device_init(csi);
+	ret = imx7_csi_video_init(csi);
 	if (ret)
 		return ret;
 
-	ret = imx7_media_capture_device_register(csi);
+	ret = imx7_csi_video_register(csi);
 	if (ret)
 		return ret;
 
@@ -1700,7 +1696,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	return 0;
 
 err_unreg:
-	imx7_media_capture_device_unregister(csi);
+	imx7_csi_video_unregister(csi);
 	return ret;
 }
 
@@ -1708,7 +1704,7 @@ static void imx7_csi_unregistered(struct v4l2_subdev *sd)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 
-	imx7_media_capture_device_unregister(csi);
+	imx7_csi_video_unregister(csi);
 }
 
 static const struct v4l2_subdev_video_ops imx7_csi_video_ops = {
-- 
Regards,

Laurent Pinchart

