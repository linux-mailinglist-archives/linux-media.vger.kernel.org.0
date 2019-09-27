Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C83C068F
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 15:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfI0Nm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 09:42:57 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:37593 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725992AbfI0Nm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 09:42:56 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2577:2521:77be:ff76:8085])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DqWEiXoH9KKNGDqWHiE1yJ; Fri, 27 Sep 2019 15:42:50 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH] cx231xx: convert to the vb2 framework
Date:   Fri, 27 Sep 2019 15:42:45 +0200
Message-Id: <20190927134245.28092-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOmfhQcap8ROcSAGUxbhdzQxo9v7MDQV6KjEhf+fD6wWBF2kJgW/BiE7ckONE5S5OhuQz1RP8EQEXHV8f2pnzWz14EB5rd5i8muYp2mp7FgncUOW+vu9
 KCOj4VtGGTUxN8jiHyjZ+cZRxPam0n8YVjNzzOjbDEav3RpcsAXRHqp9g782fcF+bDohwxTpjVmYx1rxV0BOt3OUvb3UYtD26XdwSOWYBd+0FX6DM2316APG
 QS8XuAhL6Mt+gK/wmA7P+jrsTXO/NEedNaWtCXb3YQQ/N0sUHB1gkY2RAgV24qlnpXJfI2SN+7ZYZfdpEqUGnCNXibcB47SMlomOZx9O/Vc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch converts the cx231xx driver to the vb2 framework.
Since you can't do a partial conversion this is a big-bang patch,
i.e. large and hard to review. I never found a way around this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Co-Developed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/usb/cx231xx/Kconfig         |   2 +-
 drivers/media/usb/cx231xx/cx231xx-417.c   | 509 ++++----------
 drivers/media/usb/cx231xx/cx231xx-cards.c |   6 +-
 drivers/media/usb/cx231xx/cx231xx-vbi.c   | 172 ++---
 drivers/media/usb/cx231xx/cx231xx-vbi.h   |   2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c | 795 +++++-----------------
 drivers/media/usb/cx231xx/cx231xx.h       |  30 +-
 7 files changed, 407 insertions(+), 1109 deletions(-)

diff --git a/drivers/media/usb/cx231xx/Kconfig b/drivers/media/usb/cx231xx/Kconfig
index 74f3b29d9c60..2fe2b2d335ba 100644
--- a/drivers/media/usb/cx231xx/Kconfig
+++ b/drivers/media/usb/cx231xx/Kconfig
@@ -4,7 +4,7 @@ config VIDEO_CX231XX
 	depends on VIDEO_DEV && I2C && I2C_MUX
 	select VIDEO_TUNER
 	select VIDEO_TVEEPROM
-	select VIDEOBUF_VMALLOC
+	select VIDEOBUF2_VMALLOC
 	select VIDEO_CX25840
 	select VIDEO_CX2341X
 
diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 6d218a036966..46d0215deee6 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -22,6 +22,7 @@
 #include <linux/firmware.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/slab.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
@@ -60,10 +61,6 @@
 #define  MCI_MODE_MEMORY_READ           0x000
 #define  MCI_MODE_MEMORY_WRITE          0x4000
 
-static unsigned int mpegbufs = 8;
-module_param(mpegbufs, int, 0644);
-MODULE_PARM_DESC(mpegbufs, "number of mpeg buffers, range 2-32");
-
 static unsigned int mpeglines = 128;
 module_param(mpeglines, int, 0644);
 MODULE_PARM_DESC(mpeglines, "number of lines in an MPEG buffer, range 2-32");
@@ -1080,16 +1077,6 @@ static int cx231xx_load_firmware(struct cx231xx *dev)
 	return 0;
 }
 
-static void cx231xx_417_check_encoder(struct cx231xx *dev)
-{
-	u32 status, seq;
-
-	status = 0;
-	seq = 0;
-	cx231xx_api_cmd(dev, CX2341X_ENC_GET_SEQ_END, 0, 2, &status, &seq);
-	dprintk(1, "%s() status = %d, seq = %d\n", __func__, status, seq);
-}
-
 static void cx231xx_codec_settings(struct cx231xx *dev)
 {
 	dprintk(1, "%s()\n", __func__);
@@ -1227,40 +1214,25 @@ static int cx231xx_initialize_codec(struct cx231xx *dev)
 
 /* ------------------------------------------------------------------ */
 
-static int bb_buf_setup(struct videobuf_queue *q,
-	unsigned int *count, unsigned int *size)
+static int queue_setup(struct vb2_queue *vq,
+		       unsigned int *nbuffers, unsigned int *nplanes,
+		       unsigned int sizes[], struct device *alloc_devs[])
 {
-	struct cx231xx_fh *fh = q->priv_data;
+	struct cx231xx *dev = vb2_get_drv_priv(vq);
+	unsigned int size = mpeglinesize * mpeglines;
 
-	fh->dev->ts1.ts_packet_size  = mpeglinesize;
-	fh->dev->ts1.ts_packet_count = mpeglines;
+	dev->ts1.ts_packet_size  = mpeglinesize;
+	dev->ts1.ts_packet_count = mpeglines;
 
-	*size = fh->dev->ts1.ts_packet_size * fh->dev->ts1.ts_packet_count;
-	*count = mpegbufs;
-
-	return 0;
-}
-
-static void free_buffer(struct videobuf_queue *vq, struct cx231xx_buffer *buf)
-{
-	struct cx231xx_fh *fh = vq->priv_data;
-	struct cx231xx *dev = fh->dev;
-	unsigned long flags = 0;
+	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
+		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
 
-	BUG_ON(in_interrupt());
+	if (*nplanes)
+		return sizes[0] < size ? -EINVAL : 0;
+	*nplanes = 1;
+	sizes[0] = mpeglinesize * mpeglines;
 
-	spin_lock_irqsave(&dev->video_mode.slock, flags);
-	if (dev->USE_ISO) {
-		if (dev->video_mode.isoc_ctl.buf == buf)
-			dev->video_mode.isoc_ctl.buf = NULL;
-	} else {
-		if (dev->video_mode.bulk_ctl.buf == buf)
-			dev->video_mode.bulk_ctl.buf = NULL;
-	}
-	spin_unlock_irqrestore(&dev->video_mode.slock, flags);
-	videobuf_waiton(vq, &buf->vb, 0, 0);
-	videobuf_vmalloc_free(&buf->vb);
-	buf->vb.state = VIDEOBUF_NEEDS_INIT;
+	return 0;
 }
 
 static void buffer_copy(struct cx231xx *dev, char *data, int len, struct urb *urb,
@@ -1276,13 +1248,13 @@ static void buffer_copy(struct cx231xx *dev, char *data, int len, struct urb *ur
 			return;
 
 		buf = list_entry(dma_q->active.next,
-				struct cx231xx_buffer, vb.queue);
+				struct cx231xx_buffer, list);
 		dev->video_mode.isoc_ctl.buf = buf;
 		dma_q->mpeg_buffer_done = 1;
 	}
 	/* Fill buffer */
 	buf = dev->video_mode.isoc_ctl.buf;
-	vbuf = videobuf_to_vmalloc(&buf->vb);
+	vbuf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
 
 	if ((dma_q->mpeg_buffer_completed+len) <
 			mpeglines*mpeglinesize) {
@@ -1306,11 +1278,10 @@ static void buffer_copy(struct cx231xx *dev, char *data, int len, struct urb *ur
 		memcpy(vbuf+dma_q->mpeg_buffer_completed,
 				data, tail_data);
 
-		buf->vb.state = VIDEOBUF_DONE;
-		buf->vb.field_count++;
-		buf->vb.ts = ktime_get_ns();
-		list_del(&buf->vb.queue);
-		wake_up(&buf->vb.done);
+		buf->vb.vb2_buf.timestamp = ktime_get_ns();
+		buf->vb.sequence = dma_q->sequence++;
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 		dma_q->mpeg_buffer_completed = 0;
 
 		if (len - tail_data > 0) {
@@ -1331,17 +1302,15 @@ static void buffer_filled(char *data, int len, struct urb *urb,
 	if (list_empty(&dma_q->active))
 		return;
 
-	buf = list_entry(dma_q->active.next,
-			struct cx231xx_buffer, vb.queue);
+	buf = list_entry(dma_q->active.next, struct cx231xx_buffer, list);
 
 	/* Fill buffer */
-	vbuf = videobuf_to_vmalloc(&buf->vb);
+	vbuf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
 	memcpy(vbuf, data, len);
-	buf->vb.state = VIDEOBUF_DONE;
-	buf->vb.field_count++;
-	buf->vb.ts = ktime_get_ns();
-	list_del(&buf->vb.queue);
-	wake_up(&buf->vb.done);
+	buf->vb.sequence = dma_q->sequence++;
+	buf->vb.vb2_buf.timestamp = ktime_get_ns();
+	list_del(&buf->list);
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 }
 
 static int cx231xx_isoc_copy(struct cx231xx *dev, struct urb *urb)
@@ -1394,100 +1363,104 @@ static int cx231xx_bulk_copy(struct cx231xx *dev, struct urb *urb)
 	return 0;
 }
 
-static int bb_buf_prepare(struct videobuf_queue *q,
-	struct videobuf_buffer *vb, enum v4l2_field field)
+static void buffer_queue(struct vb2_buffer *vb)
 {
-	struct cx231xx_fh *fh = q->priv_data;
 	struct cx231xx_buffer *buf =
-	    container_of(vb, struct cx231xx_buffer, vb);
-	struct cx231xx *dev = fh->dev;
-	int rc = 0, urb_init = 0;
-	int size = fh->dev->ts1.ts_packet_size * fh->dev->ts1.ts_packet_count;
+	    container_of(vb, struct cx231xx_buffer, vb.vb2_buf);
+	struct cx231xx *dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct cx231xx_dmaqueue *vidq = &dev->video_mode.vidq;
+	unsigned long flags;
 
-	if (0 != buf->vb.baddr  &&  buf->vb.bsize < size)
-		return -EINVAL;
-	buf->vb.width = fh->dev->ts1.ts_packet_size;
-	buf->vb.height = fh->dev->ts1.ts_packet_count;
-	buf->vb.size = size;
-	buf->vb.field = field;
-
-	if (VIDEOBUF_NEEDS_INIT == buf->vb.state) {
-		rc = videobuf_iolock(q, &buf->vb, NULL);
-		if (rc < 0)
-			goto fail;
-	}
+	spin_lock_irqsave(&dev->video_mode.slock, flags);
+	list_add_tail(&buf->list, &vidq->active);
+	spin_unlock_irqrestore(&dev->video_mode.slock, flags);
+}
 
-	if (dev->USE_ISO) {
-		if (!dev->video_mode.isoc_ctl.num_bufs)
-			urb_init = 1;
-	} else {
-		if (!dev->video_mode.bulk_ctl.num_bufs)
-			urb_init = 1;
+static void return_all_buffers(struct cx231xx *dev,
+			       enum vb2_buffer_state state)
+{
+	struct cx231xx_dmaqueue *vidq = &dev->video_mode.vidq;
+	struct cx231xx_buffer *buf, *node;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->video_mode.slock, flags);
+	list_for_each_entry_safe(buf, node, &vidq->active, list) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->list);
 	}
-	dev_dbg(dev->dev,
-		"urb_init=%d dev->video_mode.max_pkt_size=%d\n",
-		urb_init, dev->video_mode.max_pkt_size);
+	spin_unlock_irqrestore(&dev->video_mode.slock, flags);
+}
+
+static int start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct cx231xx *dev = vb2_get_drv_priv(vq);
+	struct cx231xx_dmaqueue *vidq = &dev->video_mode.vidq;
+	int ret = 0;
+
+	vidq->sequence = 0;
 	dev->mode_tv = 1;
 
-	if (urb_init) {
-		rc = cx231xx_set_mode(dev, CX231XX_DIGITAL_MODE);
-		rc = cx231xx_unmute_audio(dev);
-		if (dev->USE_ISO) {
-			cx231xx_set_alt_setting(dev, INDEX_TS1, 4);
-			rc = cx231xx_init_isoc(dev, mpeglines,
-				       mpegbufs,
-				       dev->ts1_mode.max_pkt_size,
-				       cx231xx_isoc_copy);
-		} else {
-			cx231xx_set_alt_setting(dev, INDEX_TS1, 0);
-			rc = cx231xx_init_bulk(dev, mpeglines,
-				       mpegbufs,
-				       dev->ts1_mode.max_pkt_size,
-				       cx231xx_bulk_copy);
-		}
-		if (rc < 0)
-			goto fail;
-	}
+	cx231xx_set_alt_setting(dev, INDEX_VANC, 1);
+	cx231xx_set_gpio_value(dev, 2, 0);
 
-	buf->vb.state = VIDEOBUF_PREPARED;
-	return 0;
+	cx231xx_initialize_codec(dev);
+
+	cx231xx_start_TS1(dev);
 
-fail:
-	free_buffer(q, buf);
-	return rc;
+	cx231xx_set_alt_setting(dev, INDEX_TS1, 0);
+	cx231xx_set_mode(dev, CX231XX_DIGITAL_MODE);
+	if (dev->USE_ISO)
+		ret = cx231xx_init_isoc(dev, CX231XX_NUM_PACKETS,
+					CX231XX_NUM_BUFS,
+					dev->ts1_mode.max_pkt_size,
+					cx231xx_isoc_copy);
+	else
+		ret = cx231xx_init_bulk(dev, 320, 5,
+					dev->ts1_mode.max_pkt_size,
+					cx231xx_bulk_copy);
+	if (ret)
+		return_all_buffers(dev, VB2_BUF_STATE_QUEUED);
+
+	call_all(dev, video, s_stream, 1);
+	return ret;
 }
 
-static void bb_buf_queue(struct videobuf_queue *q,
-	struct videobuf_buffer *vb)
+static void stop_streaming(struct vb2_queue *vq)
 {
-	struct cx231xx_fh *fh = q->priv_data;
+	struct cx231xx *dev = vb2_get_drv_priv(vq);
+	unsigned long flags;
 
-	struct cx231xx_buffer *buf =
-	    container_of(vb, struct cx231xx_buffer, vb);
-	struct cx231xx *dev = fh->dev;
-	struct cx231xx_dmaqueue *vidq = &dev->video_mode.vidq;
+	call_all(dev, video, s_stream, 0);
 
-	buf->vb.state = VIDEOBUF_QUEUED;
-	list_add_tail(&buf->vb.queue, &vidq->active);
+	cx231xx_stop_TS1(dev);
 
-}
+	/* do this before setting alternate! */
+	if (dev->USE_ISO)
+		cx231xx_uninit_isoc(dev);
+	else
+		cx231xx_uninit_bulk(dev);
+	cx231xx_set_mode(dev, CX231XX_SUSPEND);
 
-static void bb_buf_release(struct videobuf_queue *q,
-	struct videobuf_buffer *vb)
-{
-	struct cx231xx_buffer *buf =
-	    container_of(vb, struct cx231xx_buffer, vb);
-	/*struct cx231xx_fh *fh = q->priv_data;*/
-	/*struct cx231xx *dev = (struct cx231xx *)fh->dev;*/
+	cx231xx_api_cmd(dev, CX2341X_ENC_STOP_CAPTURE, 3, 0,
+			CX231xx_END_NOW, CX231xx_MPEG_CAPTURE,
+			CX231xx_RAW_BITS_NONE);
 
-	free_buffer(q, buf);
+	spin_lock_irqsave(&dev->video_mode.slock, flags);
+	if (dev->USE_ISO)
+		dev->video_mode.isoc_ctl.buf = NULL;
+	else
+		dev->video_mode.bulk_ctl.buf = NULL;
+	spin_unlock_irqrestore(&dev->video_mode.slock, flags);
+	return_all_buffers(dev, VB2_BUF_STATE_ERROR);
 }
 
-static const struct videobuf_queue_ops cx231xx_qops = {
-	.buf_setup    = bb_buf_setup,
-	.buf_prepare  = bb_buf_prepare,
-	.buf_queue    = bb_buf_queue,
-	.buf_release  = bb_buf_release,
+static struct vb2_ops cx231xx_video_qops = {
+	.queue_setup		= queue_setup,
+	.buf_queue		= buffer_queue,
+	.start_streaming	= start_streaming,
+	.stop_streaming		= stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /* ------------------------------------------------------------------ */
@@ -1495,8 +1468,7 @@ static const struct videobuf_queue_ops cx231xx_qops = {
 static int vidioc_g_pixelaspect(struct file *file, void *priv,
 				int type, struct v4l2_fract *f)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 	bool is_50hz = dev->encodernorm.id & V4L2_STD_625_50;
 
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -1511,8 +1483,7 @@ static int vidioc_g_pixelaspect(struct file *file, void *priv,
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -1533,8 +1504,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 
 static int vidioc_g_std(struct file *file, void *fh0, v4l2_std_id *norm)
 {
-	struct cx231xx_fh  *fh  = file->private_data;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	*norm = dev->encodernorm.id;
 	return 0;
@@ -1542,8 +1512,7 @@ static int vidioc_g_std(struct file *file, void *fh0, v4l2_std_id *norm)
 
 static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 {
-	struct cx231xx_fh  *fh  = file->private_data;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(cx231xx_tvnorms); i++)
@@ -1575,8 +1544,7 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 static int vidioc_s_ctrl(struct file *file, void *priv,
 				struct v4l2_control *ctl)
 {
-	struct cx231xx_fh  *fh  = file->private_data;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 	struct v4l2_subdev *sd;
 
 	dprintk(3, "enter vidioc_s_ctrl()\n");
@@ -1601,8 +1569,7 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct cx231xx_fh  *fh  = file->private_data;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	dprintk(3, "enter vidioc_g_fmt_vid_cap()\n");
 	f->fmt.pix.pixelformat = V4L2_PIX_FMT_MPEG;
@@ -1621,8 +1588,7 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct cx231xx_fh  *fh  = file->private_data;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	dprintk(3, "enter vidioc_try_fmt_vid_cap()\n");
 	f->fmt.pix.pixelformat = V4L2_PIX_FMT_MPEG;
@@ -1636,230 +1602,21 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_reqbufs(struct file *file, void *priv,
-				struct v4l2_requestbuffers *p)
-{
-	struct cx231xx_fh  *fh  = file->private_data;
-
-	return videobuf_reqbufs(&fh->vidq, p);
-}
-
-static int vidioc_querybuf(struct file *file, void *priv,
-				struct v4l2_buffer *p)
-{
-	struct cx231xx_fh  *fh  = file->private_data;
-
-	return videobuf_querybuf(&fh->vidq, p);
-}
-
-static int vidioc_qbuf(struct file *file, void *priv,
-				struct v4l2_buffer *p)
-{
-	struct cx231xx_fh  *fh  = file->private_data;
-
-	return videobuf_qbuf(&fh->vidq, p);
-}
-
-static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *b)
-{
-	struct cx231xx_fh  *fh  = priv;
-
-	return videobuf_dqbuf(&fh->vidq, b, file->f_flags & O_NONBLOCK);
-}
-
-
-static int vidioc_streamon(struct file *file, void *priv,
-				enum v4l2_buf_type i)
-{
-	struct cx231xx_fh  *fh  = file->private_data;
-	struct cx231xx *dev = fh->dev;
-
-	dprintk(3, "enter vidioc_streamon()\n");
-	cx231xx_set_alt_setting(dev, INDEX_TS1, 0);
-	cx231xx_set_mode(dev, CX231XX_DIGITAL_MODE);
-	if (dev->USE_ISO)
-		cx231xx_init_isoc(dev, CX231XX_NUM_PACKETS,
-				CX231XX_NUM_BUFS,
-				dev->video_mode.max_pkt_size,
-				cx231xx_isoc_copy);
-	else {
-		cx231xx_init_bulk(dev, 320,
-				5,
-				dev->ts1_mode.max_pkt_size,
-				cx231xx_bulk_copy);
-	}
-	dprintk(3, "exit vidioc_streamon()\n");
-	return videobuf_streamon(&fh->vidq);
-}
-
-static int vidioc_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
-{
-	struct cx231xx_fh  *fh  = file->private_data;
-
-	return videobuf_streamoff(&fh->vidq);
-}
-
 static int vidioc_log_status(struct file *file, void *priv)
 {
-	struct cx231xx_fh  *fh  = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	call_all(dev, core, log_status);
 	return v4l2_ctrl_log_status(file, priv);
 }
 
-static int mpeg_open(struct file *file)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct cx231xx *dev = video_drvdata(file);
-	struct cx231xx_fh *fh;
-
-	dprintk(2, "%s()\n", __func__);
-
-	if (mutex_lock_interruptible(&dev->lock))
-		return -ERESTARTSYS;
-
-	/* allocate + initialize per filehandle data */
-	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
-	if (NULL == fh) {
-		mutex_unlock(&dev->lock);
-		return -ENOMEM;
-	}
-
-	file->private_data = fh;
-	v4l2_fh_init(&fh->fh, vdev);
-	fh->dev = dev;
-
-
-	videobuf_queue_vmalloc_init(&fh->vidq, &cx231xx_qops,
-			    NULL, &dev->video_mode.slock,
-			    V4L2_BUF_TYPE_VIDEO_CAPTURE, V4L2_FIELD_INTERLACED,
-			    sizeof(struct cx231xx_buffer), fh, &dev->lock);
-/*
-	videobuf_queue_sg_init(&fh->vidq, &cx231xx_qops,
-			    dev->dev, &dev->ts1.slock,
-			    V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			    V4L2_FIELD_INTERLACED,
-			    sizeof(struct cx231xx_buffer),
-			    fh, &dev->lock);
-*/
-
-	cx231xx_set_alt_setting(dev, INDEX_VANC, 1);
-	cx231xx_set_gpio_value(dev, 2, 0);
-
-	cx231xx_initialize_codec(dev);
-
-	mutex_unlock(&dev->lock);
-	v4l2_fh_add(&fh->fh);
-	cx231xx_start_TS1(dev);
-
-	return 0;
-}
-
-static int mpeg_release(struct file *file)
-{
-	struct cx231xx_fh  *fh  = file->private_data;
-	struct cx231xx *dev = fh->dev;
-
-	dprintk(3, "mpeg_release()! dev=0x%p\n", dev);
-
-	mutex_lock(&dev->lock);
-
-	cx231xx_stop_TS1(dev);
-
-	/* do this before setting alternate! */
-	if (dev->USE_ISO)
-		cx231xx_uninit_isoc(dev);
-	else
-		cx231xx_uninit_bulk(dev);
-	cx231xx_set_mode(dev, CX231XX_SUSPEND);
-
-	cx231xx_api_cmd(fh->dev, CX2341X_ENC_STOP_CAPTURE, 3, 0,
-			CX231xx_END_NOW, CX231xx_MPEG_CAPTURE,
-			CX231xx_RAW_BITS_NONE);
-
-	/* FIXME: Review this crap */
-	/* Shut device down on last close */
-	if (atomic_cmpxchg(&fh->v4l_reading, 1, 0) == 1) {
-		if (atomic_dec_return(&dev->v4l_reader_count) == 0) {
-			/* stop mpeg capture */
-
-			msleep(500);
-			cx231xx_417_check_encoder(dev);
-
-		}
-	}
-
-	if (fh->vidq.streaming)
-		videobuf_streamoff(&fh->vidq);
-	if (fh->vidq.reading)
-		videobuf_read_stop(&fh->vidq);
-
-	videobuf_mmap_free(&fh->vidq);
-	v4l2_fh_del(&fh->fh);
-	v4l2_fh_exit(&fh->fh);
-	kfree(fh);
-	mutex_unlock(&dev->lock);
-	return 0;
-}
-
-static ssize_t mpeg_read(struct file *file, char __user *data,
-	size_t count, loff_t *ppos)
-{
-	struct cx231xx_fh *fh = file->private_data;
-	struct cx231xx *dev = fh->dev;
-
-	/* Deal w/ A/V decoder * and mpeg encoder sync issues. */
-	/* Start mpeg encoder on first read. */
-	if (atomic_cmpxchg(&fh->v4l_reading, 0, 1) == 0) {
-		if (atomic_inc_return(&dev->v4l_reader_count) == 1) {
-			if (cx231xx_initialize_codec(dev) < 0)
-				return -EINVAL;
-		}
-	}
-
-	return videobuf_read_stream(&fh->vidq, data, count, ppos, 0,
-				    file->f_flags & O_NONBLOCK);
-}
-
-static __poll_t mpeg_poll(struct file *file,
-	struct poll_table_struct *wait)
-{
-	__poll_t req_events = poll_requested_events(wait);
-	struct cx231xx_fh *fh = file->private_data;
-	struct cx231xx *dev = fh->dev;
-	__poll_t res = 0;
-
-	if (v4l2_event_pending(&fh->fh))
-		res |= EPOLLPRI;
-	else
-		poll_wait(file, &fh->fh.wait, wait);
-
-	if (!(req_events & (EPOLLIN | EPOLLRDNORM)))
-		return res;
-
-	mutex_lock(&dev->lock);
-	res |= videobuf_poll_stream(file, &fh->vidq, wait);
-	mutex_unlock(&dev->lock);
-	return res;
-}
-
-static int mpeg_mmap(struct file *file, struct vm_area_struct *vma)
-{
-	struct cx231xx_fh *fh = file->private_data;
-
-	dprintk(2, "%s()\n", __func__);
-
-	return videobuf_mmap_mapper(&fh->vidq, vma);
-}
-
 static const struct v4l2_file_operations mpeg_fops = {
 	.owner	       = THIS_MODULE,
-	.open	       = mpeg_open,
-	.release       = mpeg_release,
-	.read	       = mpeg_read,
-	.poll          = mpeg_poll,
-	.mmap	       = mpeg_mmap,
+	.open	       = v4l2_fh_open,
+	.release       = vb2_fop_release,
+	.read	       = vb2_fop_read,
+	.poll          = vb2_fop_poll,
+	.mmap	       = vb2_fop_mmap,
 	.unlocked_ioctl = video_ioctl2,
 };
 
@@ -1881,12 +1638,12 @@ static const struct v4l2_ioctl_ops mpeg_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap	 = vidioc_g_fmt_vid_cap,
 	.vidioc_try_fmt_vid_cap	 = vidioc_try_fmt_vid_cap,
 	.vidioc_s_fmt_vid_cap	 = vidioc_try_fmt_vid_cap,
-	.vidioc_reqbufs		 = vidioc_reqbufs,
-	.vidioc_querybuf	 = vidioc_querybuf,
-	.vidioc_qbuf		 = vidioc_qbuf,
-	.vidioc_dqbuf		 = vidioc_dqbuf,
-	.vidioc_streamon	 = vidioc_streamon,
-	.vidioc_streamoff	 = vidioc_streamoff,
+	.vidioc_reqbufs		 = vb2_ioctl_reqbufs,
+	.vidioc_querybuf	 = vb2_ioctl_querybuf,
+	.vidioc_qbuf		 = vb2_ioctl_qbuf,
+	.vidioc_dqbuf		 = vb2_ioctl_dqbuf,
+	.vidioc_streamon	 = vb2_ioctl_streamon,
+	.vidioc_streamoff	 = vb2_ioctl_streamoff,
 	.vidioc_log_status	 = vidioc_log_status,
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	.vidioc_g_register	 = cx231xx_g_register,
@@ -1980,6 +1737,7 @@ int cx231xx_417_register(struct cx231xx *dev)
 	/* FIXME: Port1 hardcoded here */
 	int err = -ENODEV;
 	struct cx231xx_tsport *tsport = &dev->ts1;
+	struct vb2_queue *q;
 
 	dprintk(1, "%s()\n", __func__);
 
@@ -2017,6 +1775,21 @@ int cx231xx_417_register(struct cx231xx *dev)
 	/* Allocate and initialize V4L video device */
 	cx231xx_video_dev_init(dev, dev->udev,
 			&dev->v4l_device, &cx231xx_mpeg_template, "mpeg");
+	q = &dev->mpegq;
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_USERPTR | VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->drv_priv = dev;
+	q->buf_struct_size = sizeof(struct cx231xx_buffer);
+	q->ops = &cx231xx_video_qops;
+	q->mem_ops = &vb2_vmalloc_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->min_buffers_needed = 1;
+	q->lock = &dev->lock;
+	err = vb2_queue_init(q);
+	if (err)
+		return err;
+	dev->v4l_device.queue = q;
+
 	err = video_register_device(&dev->v4l_device,
 		VFL_TYPE_GRABBER, -1);
 	if (err < 0) {
diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index e123e74c549e..92efe6c1f47b 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1479,13 +1479,11 @@ static int cx231xx_init_dev(struct cx231xx *dev, struct usb_device *udev,
 		goto err_dev_init;
 	}
 
-	/* init video dma queues */
+	/* init video dma queue */
 	INIT_LIST_HEAD(&dev->video_mode.vidq.active);
-	INIT_LIST_HEAD(&dev->video_mode.vidq.queued);
 
-	/* init vbi dma queues */
+	/* init vbi dma queue */
 	INIT_LIST_HEAD(&dev->vbi_mode.vidq.active);
-	INIT_LIST_HEAD(&dev->vbi_mode.vidq.queued);
 
 	/* Reset other chips required if they are tied up with GPIO pins */
 	cx231xx_add_into_devlist(dev);
diff --git a/drivers/media/usb/cx231xx/cx231xx-vbi.c b/drivers/media/usb/cx231xx/cx231xx-vbi.c
index fba7ccdf5a25..d2f143a096d1 100644
--- a/drivers/media/usb/cx231xx/cx231xx-vbi.c
+++ b/drivers/media/usb/cx231xx/cx231xx-vbi.c
@@ -153,131 +153,98 @@ static inline int cx231xx_isoc_vbi_copy(struct cx231xx *dev, struct urb *urb)
 	Vbi buf operations
    ------------------------------------------------------------------*/
 
-static int
-vbi_buffer_setup(struct videobuf_queue *vq, unsigned int *count,
-		 unsigned int *size)
+static int vbi_queue_setup(struct vb2_queue *vq,
+			   unsigned int *nbuffers, unsigned int *nplanes,
+			   unsigned int sizes[], struct device *alloc_devs[])
 {
-	struct cx231xx_fh *fh = vq->priv_data;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = vb2_get_drv_priv(vq);
 	u32 height = 0;
 
 	height = ((dev->norm & V4L2_STD_625_50) ?
 		  PAL_VBI_LINES : NTSC_VBI_LINES);
 
-	*size = (dev->width * height * 2 * 2);
-	if (0 == *count)
-		*count = CX231XX_DEF_VBI_BUF;
-
-	if (*count < CX231XX_MIN_BUF)
-		*count = CX231XX_MIN_BUF;
-
+	*nplanes = 1;
+	sizes[0] = (dev->width * height * 2 * 2);
 	return 0;
 }
 
 /* This is called *without* dev->slock held; please keep it that way */
-static void free_buffer(struct videobuf_queue *vq, struct cx231xx_buffer *buf)
-{
-	struct cx231xx_fh *fh = vq->priv_data;
-	struct cx231xx *dev = fh->dev;
-	unsigned long flags = 0;
-	BUG_ON(in_interrupt());
-
-	/* We used to wait for the buffer to finish here, but this didn't work
-	   because, as we were keeping the state as VIDEOBUF_QUEUED,
-	   videobuf_queue_cancel marked it as finished for us.
-	   (Also, it could wedge forever if the hardware was misconfigured.)
-
-	   This should be safe; by the time we get here, the buffer isn't
-	   queued anymore. If we ever start marking the buffers as
-	   VIDEOBUF_ACTIVE, it won't be, though.
-	 */
-	spin_lock_irqsave(&dev->vbi_mode.slock, flags);
-	if (dev->vbi_mode.bulk_ctl.buf == buf)
-		dev->vbi_mode.bulk_ctl.buf = NULL;
-	spin_unlock_irqrestore(&dev->vbi_mode.slock, flags);
-
-	videobuf_vmalloc_free(&buf->vb);
-	buf->vb.state = VIDEOBUF_NEEDS_INIT;
-}
-
-static int
-vbi_buffer_prepare(struct videobuf_queue *vq, struct videobuf_buffer *vb,
-		   enum v4l2_field field)
+static int vbi_buf_prepare(struct vb2_buffer *vb)
 {
-	struct cx231xx_fh *fh = vq->priv_data;
-	struct cx231xx_buffer *buf =
-	    container_of(vb, struct cx231xx_buffer, vb);
-	struct cx231xx *dev = fh->dev;
-	int rc = 0, urb_init = 0;
+	struct cx231xx *dev = vb2_get_drv_priv(vb->vb2_queue);
 	u32 height = 0;
+	u32 size;
 
 	height = ((dev->norm & V4L2_STD_625_50) ?
 		  PAL_VBI_LINES : NTSC_VBI_LINES);
-	buf->vb.size = ((dev->width << 1) * height * 2);
+	size = ((dev->width << 1) * height * 2);
 
-	if (0 != buf->vb.baddr && buf->vb.bsize < buf->vb.size)
+	if (vb2_plane_size(vb, 0) < size)
 		return -EINVAL;
-
-	buf->vb.width = dev->width;
-	buf->vb.height = height;
-	buf->vb.field = field;
-	buf->vb.field = V4L2_FIELD_SEQ_TB;
-
-	if (VIDEOBUF_NEEDS_INIT == buf->vb.state) {
-		rc = videobuf_iolock(vq, &buf->vb, NULL);
-		if (rc < 0)
-			goto fail;
-	}
-
-	if (!dev->vbi_mode.bulk_ctl.num_bufs)
-		urb_init = 1;
-
-	if (urb_init) {
-		rc = cx231xx_init_vbi_isoc(dev, CX231XX_NUM_VBI_PACKETS,
-					   CX231XX_NUM_VBI_BUFS,
-					   dev->vbi_mode.alt_max_pkt_size[0],
-					   cx231xx_isoc_vbi_copy);
-		if (rc < 0)
-			goto fail;
-	}
-
-	buf->vb.state = VIDEOBUF_PREPARED;
+	vb2_set_plane_payload(vb, 0, size);
 	return 0;
-
-fail:
-	free_buffer(vq, buf);
-	return rc;
 }
 
-static void
-vbi_buffer_queue(struct videobuf_queue *vq, struct videobuf_buffer *vb)
+static void vbi_buf_queue(struct vb2_buffer *vb)
 {
+	struct cx231xx *dev = vb2_get_drv_priv(vb->vb2_queue);
 	struct cx231xx_buffer *buf =
-	    container_of(vb, struct cx231xx_buffer, vb);
-	struct cx231xx_fh *fh = vq->priv_data;
-	struct cx231xx *dev = fh->dev;
+	    container_of(vb, struct cx231xx_buffer, vb.vb2_buf);
 	struct cx231xx_dmaqueue *vidq = &dev->vbi_mode.vidq;
+	unsigned long flags;
 
-	buf->vb.state = VIDEOBUF_QUEUED;
-	list_add_tail(&buf->vb.queue, &vidq->active);
+	spin_lock_irqsave(&dev->vbi_mode.slock, flags);
+	list_add_tail(&buf->list, &vidq->active);
+	spin_unlock_irqrestore(&dev->vbi_mode.slock, flags);
+}
+
+static void return_all_buffers(struct cx231xx *dev,
+			       enum vb2_buffer_state state)
+{
+	struct cx231xx_dmaqueue *vidq = &dev->vbi_mode.vidq;
+	struct cx231xx_buffer *buf, *node;
+	unsigned long flags;
 
+	spin_lock_irqsave(&dev->vbi_mode.slock, flags);
+	dev->vbi_mode.bulk_ctl.buf = NULL;
+	list_for_each_entry_safe(buf, node, &vidq->active, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+	spin_unlock_irqrestore(&dev->vbi_mode.slock, flags);
 }
 
-static void vbi_buffer_release(struct videobuf_queue *vq,
-			       struct videobuf_buffer *vb)
+static int vbi_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
-	struct cx231xx_buffer *buf =
-	    container_of(vb, struct cx231xx_buffer, vb);
+	struct cx231xx *dev = vb2_get_drv_priv(vq);
+	struct cx231xx_dmaqueue *vidq = &dev->vbi_mode.vidq;
+	int ret;
+
+	vidq->sequence = 0;
+	ret = cx231xx_init_vbi_isoc(dev, CX231XX_NUM_VBI_PACKETS,
+				    CX231XX_NUM_VBI_BUFS,
+				    dev->vbi_mode.alt_max_pkt_size[0],
+				    cx231xx_isoc_vbi_copy);
+	if (ret)
+		return_all_buffers(dev, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
 
+static void vbi_stop_streaming(struct vb2_queue *vq)
+{
+	struct cx231xx *dev = vb2_get_drv_priv(vq);
 
-	free_buffer(vq, buf);
+	return_all_buffers(dev, VB2_BUF_STATE_ERROR);
 }
 
-const struct videobuf_queue_ops cx231xx_vbi_qops = {
-	.buf_setup   = vbi_buffer_setup,
-	.buf_prepare = vbi_buffer_prepare,
-	.buf_queue   = vbi_buffer_queue,
-	.buf_release = vbi_buffer_release,
+struct vb2_ops cx231xx_vbi_qops = {
+	.queue_setup = vbi_queue_setup,
+	.buf_prepare = vbi_buf_prepare,
+	.buf_queue = vbi_buf_queue,
+	.start_streaming = vbi_start_streaming,
+	.stop_streaming = vbi_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
 };
 
 /* ------------------------------------------------------------------
@@ -512,16 +479,15 @@ static inline void vbi_buffer_filled(struct cx231xx *dev,
 				     struct cx231xx_buffer *buf)
 {
 	/* Advice that buffer was filled */
-	/* dev_dbg(dev->dev, "[%p/%d] wakeup\n", buf, buf->vb.i); */
+	/* dev_dbg(dev->dev, "[%p/%d] wakeup\n", buf, buf->vb.index); */
 
-	buf->vb.state = VIDEOBUF_DONE;
-	buf->vb.field_count++;
-	buf->vb.ts = ktime_get_ns();
+	buf->vb.sequence = dma_q->sequence++;
+	buf->vb.vb2_buf.timestamp = ktime_get_ns();
 
 	dev->vbi_mode.bulk_ctl.buf = NULL;
 
-	list_del(&buf->vb.queue);
-	wake_up(&buf->vb.done);
+	list_del(&buf->list);
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 }
 
 u32 cx231xx_copy_vbi_line(struct cx231xx *dev, struct cx231xx_dmaqueue *dma_q,
@@ -611,11 +577,11 @@ static inline void get_next_vbi_buf(struct cx231xx_dmaqueue *dma_q,
 	}
 
 	/* Get the next buffer */
-	*buf = list_entry(dma_q->active.next, struct cx231xx_buffer, vb.queue);
+	*buf = list_entry(dma_q->active.next, struct cx231xx_buffer, list);
 
 	/* Cleans up buffer - Useful for testing for frame/URB loss */
-	outp = videobuf_to_vmalloc(&(*buf)->vb);
-	memset(outp, 0, (*buf)->vb.size);
+	outp = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
+	memset(outp, 0, vb2_plane_size(&(*buf)->vb.vb2_buf, 0));
 
 	dev->vbi_mode.bulk_ctl.buf = *buf;
 
@@ -656,7 +622,7 @@ int cx231xx_do_vbi_copy(struct cx231xx *dev, struct cx231xx_dmaqueue *dma_q,
 	if (buf == NULL)
 		return -EINVAL;
 
-	p_out_buffer = videobuf_to_vmalloc(&buf->vb);
+	p_out_buffer = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
 
 	if (dma_q->bytes_left_in_line != _line_size) {
 		current_line_bytes_copied =
diff --git a/drivers/media/usb/cx231xx/cx231xx-vbi.h b/drivers/media/usb/cx231xx/cx231xx-vbi.h
index 7cddd629fbfc..0b21bee5fa30 100644
--- a/drivers/media/usb/cx231xx/cx231xx-vbi.h
+++ b/drivers/media/usb/cx231xx/cx231xx-vbi.h
@@ -10,7 +10,7 @@
 #ifndef _CX231XX_VBI_H
 #define _CX231XX_VBI_H
 
-extern const struct videobuf_queue_ops cx231xx_vbi_qops;
+extern struct vb2_ops cx231xx_vbi_qops;
 
 #define   NTSC_VBI_START_LINE 10	/* line 10 - 21 */
 #define   NTSC_VBI_END_LINE   21
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 9b51f07a729e..69abafaebbf3 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -58,10 +58,10 @@ MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
 MODULE_VERSION(CX231XX_VERSION);
 
-static unsigned int card[]     = {[0 ... (CX231XX_MAXBOARDS - 1)] = UNSET };
-static unsigned int video_nr[] = {[0 ... (CX231XX_MAXBOARDS - 1)] = UNSET };
-static unsigned int vbi_nr[]   = {[0 ... (CX231XX_MAXBOARDS - 1)] = UNSET };
-static unsigned int radio_nr[] = {[0 ... (CX231XX_MAXBOARDS - 1)] = UNSET };
+static unsigned int card[]     = {[0 ... (CX231XX_MAXBOARDS - 1)] = -1U };
+static unsigned int video_nr[] = {[0 ... (CX231XX_MAXBOARDS - 1)] = -1U };
+static unsigned int vbi_nr[]   = {[0 ... (CX231XX_MAXBOARDS - 1)] = -1U };
+static unsigned int radio_nr[] = {[0 ... (CX231XX_MAXBOARDS - 1)] = -1U };
 
 module_param_array(card, int, NULL, 0444);
 module_param_array(video_nr, int, NULL, 0444);
@@ -166,18 +166,19 @@ static inline void buffer_filled(struct cx231xx *dev,
 				 struct cx231xx_buffer *buf)
 {
 	/* Advice that buffer was filled */
-	cx231xx_isocdbg("[%p/%d] wakeup\n", buf, buf->vb.i);
-	buf->vb.state = VIDEOBUF_DONE;
-	buf->vb.field_count++;
-	buf->vb.ts = ktime_get_ns();
+	cx231xx_isocdbg("[%p/%d] wakeup\n", buf, buf->vb.vb2_buf.index);
+	buf->vb.sequence = dma_q->sequence++;
+	buf->vb.field = V4L2_FIELD_INTERLACED;
+	buf->vb.vb2_buf.timestamp = ktime_get_ns();
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, dev->size);
 
 	if (dev->USE_ISO)
 		dev->video_mode.isoc_ctl.buf = NULL;
 	else
 		dev->video_mode.bulk_ctl.buf = NULL;
 
-	list_del(&buf->vb.queue);
-	wake_up(&buf->vb.done);
+	list_del(&buf->list);
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 }
 
 static inline void print_err_status(struct cx231xx *dev, int packet, int status)
@@ -241,11 +242,11 @@ static inline void get_next_buf(struct cx231xx_dmaqueue *dma_q,
 	}
 
 	/* Get the next buffer */
-	*buf = list_entry(dma_q->active.next, struct cx231xx_buffer, vb.queue);
+	*buf = list_entry(dma_q->active.next, struct cx231xx_buffer, list);
 
 	/* Cleans up buffer - Useful for testing for frame/URB loss */
-	outp = videobuf_to_vmalloc(&(*buf)->vb);
-	memset(outp, 0, (*buf)->vb.size);
+	outp = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
+	memset(outp, 0, dev->size);
 
 	if (dev->USE_ISO)
 		dev->video_mode.isoc_ctl.buf = *buf;
@@ -653,7 +654,7 @@ int cx231xx_do_copy(struct cx231xx *dev, struct cx231xx_dmaqueue *dma_q,
 	if (buf == NULL)
 		return -1;
 
-	p_out_buffer = videobuf_to_vmalloc(&buf->vb);
+	p_out_buffer = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
 
 	current_line_bytes_copied = _line_size - dma_q->bytes_left_in_line;
 
@@ -672,7 +673,7 @@ int cx231xx_do_copy(struct cx231xx *dev, struct cx231xx_dmaqueue *dma_q,
 	lencopy = dma_q->bytes_left_in_line > bytes_to_copy ?
 		  bytes_to_copy : dma_q->bytes_left_in_line;
 
-	if ((u8 *)(startwrite + lencopy) > (u8 *)(p_out_buffer + buf->vb.size))
+	if ((u8 *)(startwrite + lencopy) > (u8 *)(p_out_buffer + dev->size))
 		return 0;
 
 	/* The below copies the UYVY data straight into video buffer */
@@ -708,149 +709,98 @@ u8 cx231xx_is_buffer_done(struct cx231xx *dev, struct cx231xx_dmaqueue *dma_q)
 	Videobuf operations
    ------------------------------------------------------------------*/
 
-static int
-buffer_setup(struct videobuf_queue *vq, unsigned int *count, unsigned int *size)
+static int queue_setup(struct vb2_queue *vq,
+		       unsigned int *nbuffers, unsigned int *nplanes,
+		       unsigned int sizes[], struct device *alloc_devs[])
 {
-	struct cx231xx_fh *fh = vq->priv_data;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = vb2_get_drv_priv(vq);
 
-	*size = (fh->dev->width * fh->dev->height * dev->format->depth + 7)>>3;
-	if (0 == *count)
-		*count = CX231XX_DEF_BUF;
+	dev->size = (dev->width * dev->height * dev->format->depth + 7) >> 3;
 
-	if (*count < CX231XX_MIN_BUF)
-		*count = CX231XX_MIN_BUF;
+	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
+		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
 
-
-	cx231xx_enable_analog_tuner(dev);
+	if (*nplanes)
+		return sizes[0] < dev->size ? -EINVAL : 0;
+	*nplanes = 1;
+	sizes[0] = dev->size;
 
 	return 0;
 }
 
-/* This is called *without* dev->slock held; please keep it that way */
-static void free_buffer(struct videobuf_queue *vq, struct cx231xx_buffer *buf)
+static void buffer_queue(struct vb2_buffer *vb)
 {
-	struct cx231xx_fh *fh = vq->priv_data;
-	struct cx231xx *dev = fh->dev;
-	unsigned long flags = 0;
-
-	BUG_ON(in_interrupt());
-
-	/* We used to wait for the buffer to finish here, but this didn't work
-	   because, as we were keeping the state as VIDEOBUF_QUEUED,
-	   videobuf_queue_cancel marked it as finished for us.
-	   (Also, it could wedge forever if the hardware was misconfigured.)
+	struct cx231xx_buffer *buf =
+	    container_of(vb, struct cx231xx_buffer, vb.vb2_buf);
+	struct cx231xx *dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct cx231xx_dmaqueue *vidq = &dev->video_mode.vidq;
+	unsigned long flags;
 
-	   This should be safe; by the time we get here, the buffer isn't
-	   queued anymore. If we ever start marking the buffers as
-	   VIDEOBUF_ACTIVE, it won't be, though.
-	 */
 	spin_lock_irqsave(&dev->video_mode.slock, flags);
-	if (dev->USE_ISO) {
-		if (dev->video_mode.isoc_ctl.buf == buf)
-			dev->video_mode.isoc_ctl.buf = NULL;
-	} else {
-		if (dev->video_mode.bulk_ctl.buf == buf)
-			dev->video_mode.bulk_ctl.buf = NULL;
-	}
+	list_add_tail(&buf->list, &vidq->active);
 	spin_unlock_irqrestore(&dev->video_mode.slock, flags);
-
-	videobuf_vmalloc_free(&buf->vb);
-	buf->vb.state = VIDEOBUF_NEEDS_INIT;
 }
 
-static int
-buffer_prepare(struct videobuf_queue *vq, struct videobuf_buffer *vb,
-	       enum v4l2_field field)
+static void return_all_buffers(struct cx231xx *dev,
+			       enum vb2_buffer_state state)
 {
-	struct cx231xx_fh *fh = vq->priv_data;
-	struct cx231xx_buffer *buf =
-	    container_of(vb, struct cx231xx_buffer, vb);
-	struct cx231xx *dev = fh->dev;
-	int rc = 0, urb_init = 0;
-
-	/* The only currently supported format is 16 bits/pixel */
-	buf->vb.size = (fh->dev->width * fh->dev->height * dev->format->depth
-			+ 7) >> 3;
-	if (0 != buf->vb.baddr && buf->vb.bsize < buf->vb.size)
-		return -EINVAL;
-
-	buf->vb.width = dev->width;
-	buf->vb.height = dev->height;
-	buf->vb.field = field;
-
-	if (VIDEOBUF_NEEDS_INIT == buf->vb.state) {
-		rc = videobuf_iolock(vq, &buf->vb, NULL);
-		if (rc < 0)
-			goto fail;
-	}
+	struct cx231xx_dmaqueue *vidq = &dev->video_mode.vidq;
+	struct cx231xx_buffer *buf, *node;
+	unsigned long flags;
 
-	if (dev->USE_ISO) {
-		if (!dev->video_mode.isoc_ctl.num_bufs)
-			urb_init = 1;
-	} else {
-		if (!dev->video_mode.bulk_ctl.num_bufs)
-			urb_init = 1;
-	}
-	dev_dbg(dev->dev,
-		"urb_init=%d dev->video_mode.max_pkt_size=%d\n",
-		urb_init, dev->video_mode.max_pkt_size);
-	if (urb_init) {
-		dev->mode_tv = 0;
-		if (dev->USE_ISO)
-			rc = cx231xx_init_isoc(dev, CX231XX_NUM_PACKETS,
-				       CX231XX_NUM_BUFS,
-				       dev->video_mode.max_pkt_size,
-				       cx231xx_isoc_copy);
-		else
-			rc = cx231xx_init_bulk(dev, CX231XX_NUM_PACKETS,
-				       CX231XX_NUM_BUFS,
-				       dev->video_mode.max_pkt_size,
-				       cx231xx_bulk_copy);
-		if (rc < 0)
-			goto fail;
+	spin_lock_irqsave(&dev->video_mode.slock, flags);
+	if (dev->USE_ISO)
+		dev->video_mode.isoc_ctl.buf = NULL;
+	else
+		dev->video_mode.bulk_ctl.buf = NULL;
+	list_for_each_entry_safe(buf, node, &vidq->active, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
-
-	buf->vb.state = VIDEOBUF_PREPARED;
-
-	return 0;
-
-fail:
-	free_buffer(vq, buf);
-	return rc;
+	spin_unlock_irqrestore(&dev->video_mode.slock, flags);
 }
 
-static void buffer_queue(struct videobuf_queue *vq, struct videobuf_buffer *vb)
+static int start_streaming(struct vb2_queue *vq, unsigned int count)
 {
-	struct cx231xx_buffer *buf =
-	    container_of(vb, struct cx231xx_buffer, vb);
-	struct cx231xx_fh *fh = vq->priv_data;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = vb2_get_drv_priv(vq);
 	struct cx231xx_dmaqueue *vidq = &dev->video_mode.vidq;
+	int ret = 0;
 
-	buf->vb.state = VIDEOBUF_QUEUED;
-	list_add_tail(&buf->vb.queue, &vidq->active);
+	vidq->sequence = 0;
+	dev->mode_tv = 0;
 
+	cx231xx_enable_analog_tuner(dev);
+	if (dev->USE_ISO)
+		ret = cx231xx_init_isoc(dev, CX231XX_NUM_PACKETS,
+					CX231XX_NUM_BUFS,
+					dev->video_mode.max_pkt_size,
+					cx231xx_isoc_copy);
+	else
+		ret = cx231xx_init_bulk(dev, CX231XX_NUM_PACKETS,
+					CX231XX_NUM_BUFS,
+					dev->video_mode.max_pkt_size,
+					cx231xx_bulk_copy);
+	if (ret)
+		return_all_buffers(dev, VB2_BUF_STATE_QUEUED);
+	call_all(dev, video, s_stream, 1);
+	return ret;
 }
 
-static void buffer_release(struct videobuf_queue *vq,
-			   struct videobuf_buffer *vb)
+static void stop_streaming(struct vb2_queue *vq)
 {
-	struct cx231xx_buffer *buf =
-	    container_of(vb, struct cx231xx_buffer, vb);
-	struct cx231xx_fh *fh = vq->priv_data;
-	struct cx231xx *dev = (struct cx231xx *)fh->dev;
-
-	cx231xx_isocdbg("cx231xx: called buffer_release\n");
+	struct cx231xx *dev = vb2_get_drv_priv(vq);
 
-	free_buffer(vq, buf);
+	call_all(dev, video, s_stream, 0);
+	return_all_buffers(dev, VB2_BUF_STATE_ERROR);
 }
 
-static const struct videobuf_queue_ops cx231xx_video_qops = {
-	.buf_setup = buffer_setup,
-	.buf_prepare = buffer_prepare,
-	.buf_queue = buffer_queue,
-	.buf_release = buffer_release,
+static struct vb2_ops cx231xx_video_qops = {
+	.queue_setup		= queue_setup,
+	.buf_queue		= buffer_queue,
+	.start_streaming	= start_streaming,
+	.stop_streaming		= stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /*********************  v4l2 interface  **************************************/
@@ -872,58 +822,6 @@ void video_mux(struct cx231xx *dev, int index)
 	cx231xx_do_mode_ctrl_overrides(dev);
 }
 
-/* Usage lock check functions */
-static int res_get(struct cx231xx_fh *fh)
-{
-	struct cx231xx *dev = fh->dev;
-	int rc = 0;
-
-	/* This instance already has stream_on */
-	if (fh->stream_on)
-		return rc;
-
-	if (fh->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-		if (dev->stream_on)
-			return -EBUSY;
-		dev->stream_on = 1;
-	} else if (fh->type == V4L2_BUF_TYPE_VBI_CAPTURE) {
-		if (dev->vbi_stream_on)
-			return -EBUSY;
-		dev->vbi_stream_on = 1;
-	} else
-		return -EINVAL;
-
-	fh->stream_on = 1;
-
-	return rc;
-}
-
-static int res_check(struct cx231xx_fh *fh)
-{
-	return fh->stream_on;
-}
-
-static void res_free(struct cx231xx_fh *fh)
-{
-	struct cx231xx *dev = fh->dev;
-
-	fh->stream_on = 0;
-
-	if (fh->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		dev->stream_on = 0;
-	if (fh->type == V4L2_BUF_TYPE_VBI_CAPTURE)
-		dev->vbi_stream_on = 0;
-}
-
-static int check_dev(struct cx231xx *dev)
-{
-	if (dev->state & DEV_DISCONNECTED) {
-		dev_err(dev->dev, "v4l2 ioctl: device not present\n");
-		return -ENODEV;
-	}
-	return 0;
-}
-
 /* ------------------------------------------------------------------
 	IOCTL vidioc handling
    ------------------------------------------------------------------*/
@@ -931,8 +829,7 @@ static int check_dev(struct cx231xx *dev)
 static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	f->fmt.pix.width = dev->width;
 	f->fmt.pix.height = dev->height;
@@ -960,8 +857,7 @@ static struct cx231xx_fmt *format_by_fourcc(unsigned int fourcc)
 static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 	unsigned int width = f->fmt.pix.width;
 	unsigned int height = f->fmt.pix.height;
 	unsigned int maxw = norm_maxw(dev);
@@ -993,39 +889,25 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-	struct cx231xx_fmt *fmt;
+	struct cx231xx *dev = video_drvdata(file);
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
+	int rc;
 
-	rc = check_dev(dev);
-	if (rc < 0)
+	rc = vidioc_try_fmt_vid_cap(file, priv, f);
+	if (rc)
 		return rc;
 
-	vidioc_try_fmt_vid_cap(file, priv, f);
-
-	fmt = format_by_fourcc(f->fmt.pix.pixelformat);
-	if (!fmt)
-		return -EINVAL;
-
-	if (videobuf_queue_is_busy(&fh->vb_vidq)) {
+	if (vb2_is_busy(&dev->vidq)) {
 		dev_err(dev->dev, "%s: queue busy\n", __func__);
 		return -EBUSY;
 	}
 
-	if (dev->stream_on && !fh->stream_on) {
-		dev_err(dev->dev,
-			"%s: device in use by another fh\n", __func__);
-		return -EBUSY;
-	}
-
 	/* set new image size */
 	dev->width = f->fmt.pix.width;
 	dev->height = f->fmt.pix.height;
-	dev->format = fmt;
+	dev->format = format_by_fourcc(f->fmt.pix.pixelformat);
 
 	v4l2_fill_mbus_format(&format.format, &f->fmt.pix, MEDIA_BUS_FMT_FIXED);
 	call_all(dev, pad, set_fmt, NULL, &format);
@@ -1036,8 +918,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 
 static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	*id = dev->norm;
 	return 0;
@@ -1045,21 +926,15 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 
 static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
 
 	if (dev->norm == norm)
 		return 0;
 
-	if (videobuf_queue_is_busy(&fh->vb_vidq))
+	if (vb2_is_busy(&dev->vidq))
 		return -EBUSY;
 
 	dev->norm = norm;
@@ -1141,8 +1016,7 @@ void cx231xx_v4l2_create_entities(struct cx231xx *dev)
 int cx231xx_enum_input(struct file *file, void *priv,
 			     struct v4l2_input *i)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 	u32 gen_stat;
 	unsigned int n;
 	int ret;
@@ -1181,8 +1055,7 @@ int cx231xx_enum_input(struct file *file, void *priv,
 
 int cx231xx_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	*i = dev->video_input;
 
@@ -1191,14 +1064,9 @@ int cx231xx_g_input(struct file *file, void *priv, unsigned int *i)
 
 int cx231xx_s_input(struct file *file, void *priv, unsigned int i)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-	int rc;
+	struct cx231xx *dev = video_drvdata(file);
 
 	dev->mode_tv = 0;
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
 
 	if (i >= MAX_CX231XX_INPUT)
 		return -EINVAL;
@@ -1220,13 +1088,7 @@ int cx231xx_s_input(struct file *file, void *priv, unsigned int i)
 
 int cx231xx_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
+	struct cx231xx *dev = video_drvdata(file);
 
 	if (0 != t->index)
 		return -EINVAL;
@@ -1244,27 +1106,15 @@ int cx231xx_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 
 int cx231xx_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *t)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
-
 	if (0 != t->index)
 		return -EINVAL;
-#if 0
-	call_all(dev, tuner, s_tuner, t);
-#endif
 	return 0;
 }
 
 int cx231xx_g_frequency(struct file *file, void *priv,
 			      struct v4l2_frequency *f)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	if (f->tuner)
 		return -EINVAL;
@@ -1277,8 +1127,7 @@ int cx231xx_g_frequency(struct file *file, void *priv,
 int cx231xx_s_frequency(struct file *file, void *priv,
 			      const struct v4l2_frequency *f)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 	struct v4l2_frequency new_freq = *f;
 	int rc;
 	u32 if_frequency = 5400000;
@@ -1287,10 +1136,6 @@ int cx231xx_s_frequency(struct file *file, void *priv,
 		"Enter vidioc_s_frequency()f->frequency=%d;f->type=%d\n",
 		f->frequency, f->type);
 
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
-
 	if (0 != f->tuner)
 		return -EINVAL;
 
@@ -1365,8 +1210,7 @@ int cx231xx_g_chip_info(struct file *file, void *fh,
 int cx231xx_g_register(struct file *file, void *priv,
 			     struct v4l2_dbg_register *reg)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 	int ret;
 	u8 value[4] = { 0, 0, 0, 0 };
 	u32 data = 0;
@@ -1424,8 +1268,7 @@ int cx231xx_g_register(struct file *file, void *priv,
 int cx231xx_s_register(struct file *file, void *priv,
 			     const struct v4l2_dbg_register *reg)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 	int ret;
 	u8 data[4] = { 0, 0, 0, 0 };
 
@@ -1472,8 +1315,7 @@ int cx231xx_s_register(struct file *file, void *priv,
 static int vidioc_g_pixelaspect(struct file *file, void *priv,
 				int type, struct v4l2_fract *f)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 	bool is_50hz = dev->norm & V4L2_STD_625_50;
 
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -1488,8 +1330,7 @@ static int vidioc_g_pixelaspect(struct file *file, void *priv,
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -1508,54 +1349,10 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_streamon(struct file *file, void *priv,
-			   enum v4l2_buf_type type)
-{
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
-
-	rc = res_get(fh);
-
-	if (likely(rc >= 0))
-		rc = videobuf_streamon(&fh->vb_vidq);
-
-	call_all(dev, video, s_stream, 1);
-
-	return rc;
-}
-
-static int vidioc_streamoff(struct file *file, void *priv,
-			    enum v4l2_buf_type type)
-{
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
-
-	if (type != fh->type)
-		return -EINVAL;
-
-	cx25840_call(dev, video, s_stream, 0);
-
-	videobuf_streamoff(&fh->vb_vidq);
-	res_free(fh);
-
-	return 0;
-}
-
 int cx231xx_querycap(struct file *file, void *priv,
 			   struct v4l2_capability *cap)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	strscpy(cap->driver, "cx231xx", sizeof(cap->driver));
 	strscpy(cap->card, cx231xx_boards[dev->model].name, sizeof(cap->card));
@@ -1587,8 +1384,7 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 static int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	f->fmt.vbi.sampling_rate = 6750000 * 4;
 	f->fmt.vbi.samples_per_line = VBI_LINE_LENGTH;
@@ -1610,8 +1406,7 @@ static int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
 static int vidioc_try_fmt_vbi_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	f->fmt.vbi.sampling_rate = 6750000 * 4;
 	f->fmt.vbi.samples_per_line = VBI_LINE_LENGTH;
@@ -1634,77 +1429,16 @@ static int vidioc_try_fmt_vbi_cap(struct file *file, void *priv,
 static int vidioc_s_fmt_vbi_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-
-	if (dev->vbi_stream_on && !fh->stream_on) {
-		dev_err(dev->dev,
-			"%s device in use by another fh\n", __func__);
-		return -EBUSY;
-	}
 	return vidioc_try_fmt_vbi_cap(file, priv, f);
 }
 
-static int vidioc_reqbufs(struct file *file, void *priv,
-			  struct v4l2_requestbuffers *rb)
-{
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
-
-	return videobuf_reqbufs(&fh->vb_vidq, rb);
-}
-
-static int vidioc_querybuf(struct file *file, void *priv, struct v4l2_buffer *b)
-{
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
-
-	return videobuf_querybuf(&fh->vb_vidq, b);
-}
-
-static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *b)
-{
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
-
-	return videobuf_qbuf(&fh->vb_vidq, b);
-}
-
-static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *b)
-{
-	struct cx231xx_fh *fh = priv;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
-
-	return videobuf_dqbuf(&fh->vb_vidq, b, file->f_flags & O_NONBLOCK);
-}
-
 /* ----------------------------------------------------------- */
 /* RADIO ESPECIFIC IOCTLS                                      */
 /* ----------------------------------------------------------- */
 
 static int radio_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 {
-	struct cx231xx *dev = ((struct cx231xx_fh *)priv)->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	if (t->index)
 		return -EINVAL;
@@ -1717,7 +1451,7 @@ static int radio_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 }
 static int radio_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *t)
 {
-	struct cx231xx *dev = ((struct cx231xx_fh *)priv)->dev;
+	struct cx231xx *dev = video_drvdata(file);
 
 	if (t->index)
 		return -EINVAL;
@@ -1733,52 +1467,20 @@ static int radio_s_tuner(struct file *file, void *priv, const struct v4l2_tuner
  */
 static int cx231xx_v4l2_open(struct file *filp)
 {
-	int radio = 0;
 	struct video_device *vdev = video_devdata(filp);
 	struct cx231xx *dev = video_drvdata(filp);
-	struct cx231xx_fh *fh;
-	enum v4l2_buf_type fh_type = 0;
-
-	switch (vdev->vfl_type) {
-	case VFL_TYPE_GRABBER:
-		fh_type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-		break;
-	case VFL_TYPE_VBI:
-		fh_type = V4L2_BUF_TYPE_VBI_CAPTURE;
-		break;
-	case VFL_TYPE_RADIO:
-		radio = 1;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	cx231xx_videodbg("open dev=%s type=%s users=%d\n",
-			 video_device_node_name(vdev), v4l2_type_names[fh_type],
-			 dev->users);
-
-#if 0
-	errCode = cx231xx_set_mode(dev, CX231XX_ANALOG_MODE);
-	if (errCode < 0) {
-		dev_err(dev->dev,
-			"Device locked on digital mode. Can't open analog\n");
-		return -EBUSY;
-	}
-#endif
+	int ret;
 
-	fh = kzalloc(sizeof(struct cx231xx_fh), GFP_KERNEL);
-	if (!fh)
-		return -ENOMEM;
-	if (mutex_lock_interruptible(&dev->lock)) {
-		kfree(fh);
+	if (mutex_lock_interruptible(&dev->lock))
 		return -ERESTARTSYS;
+
+	ret = v4l2_fh_open(filp);
+	if (ret) {
+		mutex_unlock(&dev->lock);
+		return ret;
 	}
-	fh->dev = dev;
-	fh->type = fh_type;
-	filp->private_data = fh;
-	v4l2_fh_init(&fh->fh, vdev);
 
-	if (fh->type == V4L2_BUF_TYPE_VIDEO_CAPTURE && dev->users == 0) {
+	if (dev->users++ == 0) {
 		/* Power up in Analog TV mode */
 		if (dev->board.external_av)
 			cx231xx_set_power_mode(dev,
@@ -1786,10 +1488,6 @@ static int cx231xx_v4l2_open(struct file *filp)
 		else
 			cx231xx_set_power_mode(dev, POLARIS_AVMODE_ANALOGT_TV);
 
-#if 0
-		cx231xx_set_mode(dev, CX231XX_ANALOG_MODE);
-#endif
-
 		/* set video alternate setting */
 		cx231xx_set_video_alternate(dev);
 
@@ -1799,38 +1497,21 @@ static int cx231xx_v4l2_open(struct file *filp)
 
 		/* device needs to be initialized before isoc transfer */
 		dev->video_input = dev->video_input > 2 ? 2 : dev->video_input;
-
 	}
-	if (radio) {
+
+	if (vdev->vfl_type == VFL_TYPE_RADIO) {
 		cx231xx_videodbg("video_open: setting radio device\n");
 
 		/* cx231xx_start_radio(dev); */
 
 		call_all(dev, tuner, s_radio);
 	}
-
-	dev->users++;
-
-	if (fh->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		videobuf_queue_vmalloc_init(&fh->vb_vidq, &cx231xx_video_qops,
-					    NULL, &dev->video_mode.slock,
-					    fh->type, V4L2_FIELD_INTERLACED,
-					    sizeof(struct cx231xx_buffer),
-					    fh, &dev->lock);
-	if (fh->type == V4L2_BUF_TYPE_VBI_CAPTURE) {
+	if (vdev->vfl_type == VFL_TYPE_VBI) {
 		/* Set the required alternate setting  VBI interface works in
 		   Bulk mode only */
 		cx231xx_set_alt_setting(dev, INDEX_VANC, 0);
-
-		videobuf_queue_vmalloc_init(&fh->vb_vidq, &cx231xx_vbi_qops,
-					    NULL, &dev->vbi_mode.slock,
-					    fh->type, V4L2_FIELD_SEQ_TB,
-					    sizeof(struct cx231xx_buffer),
-					    fh, &dev->lock);
 	}
 	mutex_unlock(&dev->lock);
-	v4l2_fh_add(&fh->fh);
-
 	return 0;
 }
 
@@ -1871,68 +1552,12 @@ void cx231xx_release_analog_resources(struct cx231xx *dev)
  */
 static int cx231xx_close(struct file *filp)
 {
-	struct cx231xx_fh *fh = filp->private_data;
-	struct cx231xx *dev = fh->dev;
-
-	cx231xx_videodbg("users=%d\n", dev->users);
-
-	cx231xx_videodbg("users=%d\n", dev->users);
-	if (res_check(fh))
-		res_free(fh);
-
-	/*
-	 * To workaround error number=-71 on EP0 for VideoGrabber,
-	 *	 need exclude following.
-	 * FIXME: It is probably safe to remove most of these, as we're
-	 * now avoiding the alternate setting for INDEX_VANC
-	 */
-	if (!dev->board.no_alt_vanc)
-		if (fh->type == V4L2_BUF_TYPE_VBI_CAPTURE) {
-			videobuf_stop(&fh->vb_vidq);
-			videobuf_mmap_free(&fh->vb_vidq);
-
-			/* the device is already disconnect,
-			   free the remaining resources */
-			if (dev->state & DEV_DISCONNECTED) {
-				if (atomic_read(&dev->devlist_count) > 0) {
-					cx231xx_release_resources(dev);
-					fh->dev = NULL;
-					return 0;
-				}
-				return 0;
-			}
-
-			/* do this before setting alternate! */
-			cx231xx_uninit_vbi_isoc(dev);
-
-			/* set alternate 0 */
-			if (!dev->vbi_or_sliced_cc_mode)
-				cx231xx_set_alt_setting(dev, INDEX_VANC, 0);
-			else
-				cx231xx_set_alt_setting(dev, INDEX_HANC, 0);
-
-			v4l2_fh_del(&fh->fh);
-			v4l2_fh_exit(&fh->fh);
-			kfree(fh);
-			dev->users--;
-			wake_up_interruptible(&dev->open);
-			return 0;
-		}
+	struct cx231xx *dev = video_drvdata(filp);
+	struct video_device *vdev = video_devdata(filp);
 
-	v4l2_fh_del(&fh->fh);
-	dev->users--;
-	if (!dev->users) {
-		videobuf_stop(&fh->vb_vidq);
-		videobuf_mmap_free(&fh->vb_vidq);
-
-		/* the device is already disconnect,
-		   free the remaining resources */
-		if (dev->state & DEV_DISCONNECTED) {
-			cx231xx_release_resources(dev);
-			fh->dev = NULL;
-			return 0;
-		}
+	_vb2_fop_release(filp, NULL);
 
+	if (--dev->users == 0) {
 		/* Save some power by putting tuner to sleep */
 		call_all(dev, tuner, standby);
 
@@ -1942,20 +1567,40 @@ static int cx231xx_close(struct file *filp)
 		else
 			cx231xx_uninit_bulk(dev);
 		cx231xx_set_mode(dev, CX231XX_SUSPEND);
+	}
+
+	/*
+	 * To workaround error number=-71 on EP0 for VideoGrabber,
+	 *	 need exclude following.
+	 * FIXME: It is probably safe to remove most of these, as we're
+	 * now avoiding the alternate setting for INDEX_VANC
+	 */
+	if (!dev->board.no_alt_vanc && vdev->vfl_type == VFL_TYPE_VBI) {
+		/* do this before setting alternate! */
+		cx231xx_uninit_vbi_isoc(dev);
 
+		/* set alternate 0 */
+		if (!dev->vbi_or_sliced_cc_mode)
+			cx231xx_set_alt_setting(dev, INDEX_VANC, 0);
+		else
+			cx231xx_set_alt_setting(dev, INDEX_HANC, 0);
+
+		wake_up_interruptible_nr(&dev->open, 1);
+		return 0;
+	}
+
+	if (dev->users == 0) {
 		/* set alternate 0 */
 		cx231xx_set_alt_setting(dev, INDEX_VIDEO, 0);
 	}
-	v4l2_fh_exit(&fh->fh);
-	kfree(fh);
+
 	wake_up_interruptible(&dev->open);
 	return 0;
 }
 
 static int cx231xx_v4l2_close(struct file *filp)
 {
-	struct cx231xx_fh *fh = filp->private_data;
-	struct cx231xx *dev = fh->dev;
+	struct cx231xx *dev = video_drvdata(filp);
 	int rc;
 
 	mutex_lock(&dev->lock);
@@ -1964,116 +1609,13 @@ static int cx231xx_v4l2_close(struct file *filp)
 	return rc;
 }
 
-/*
- * cx231xx_v4l2_read()
- * will allocate buffers when called for the first time
- */
-static ssize_t
-cx231xx_v4l2_read(struct file *filp, char __user *buf, size_t count,
-		  loff_t *pos)
-{
-	struct cx231xx_fh *fh = filp->private_data;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
-
-	if ((fh->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
-	    (fh->type == V4L2_BUF_TYPE_VBI_CAPTURE)) {
-		rc = res_get(fh);
-
-		if (unlikely(rc < 0))
-			return rc;
-
-		if (mutex_lock_interruptible(&dev->lock))
-			return -ERESTARTSYS;
-		rc = videobuf_read_stream(&fh->vb_vidq, buf, count, pos, 0,
-					    filp->f_flags & O_NONBLOCK);
-		mutex_unlock(&dev->lock);
-		return rc;
-	}
-	return 0;
-}
-
-/*
- * cx231xx_v4l2_poll()
- * will allocate buffers when called for the first time
- */
-static __poll_t cx231xx_v4l2_poll(struct file *filp, poll_table *wait)
-{
-	__poll_t req_events = poll_requested_events(wait);
-	struct cx231xx_fh *fh = filp->private_data;
-	struct cx231xx *dev = fh->dev;
-	__poll_t res = 0;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return EPOLLERR;
-
-	rc = res_get(fh);
-
-	if (unlikely(rc < 0))
-		return EPOLLERR;
-
-	if (v4l2_event_pending(&fh->fh))
-		res |= EPOLLPRI;
-	else
-		poll_wait(filp, &fh->fh.wait, wait);
-
-	if (!(req_events & (EPOLLIN | EPOLLRDNORM)))
-		return res;
-
-	if ((V4L2_BUF_TYPE_VIDEO_CAPTURE == fh->type) ||
-	    (V4L2_BUF_TYPE_VBI_CAPTURE == fh->type)) {
-		mutex_lock(&dev->lock);
-		res |= videobuf_poll_stream(filp, &fh->vb_vidq, wait);
-		mutex_unlock(&dev->lock);
-		return res;
-	}
-	return res | EPOLLERR;
-}
-
-/*
- * cx231xx_v4l2_mmap()
- */
-static int cx231xx_v4l2_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct cx231xx_fh *fh = filp->private_data;
-	struct cx231xx *dev = fh->dev;
-	int rc;
-
-	rc = check_dev(dev);
-	if (rc < 0)
-		return rc;
-
-	rc = res_get(fh);
-
-	if (unlikely(rc < 0))
-		return rc;
-
-	if (mutex_lock_interruptible(&dev->lock))
-		return -ERESTARTSYS;
-	rc = videobuf_mmap_mapper(&fh->vb_vidq, vma);
-	mutex_unlock(&dev->lock);
-
-	cx231xx_videodbg("vma start=0x%08lx, size=%ld, ret=%d\n",
-			 (unsigned long)vma->vm_start,
-			 (unsigned long)vma->vm_end -
-			 (unsigned long)vma->vm_start, rc);
-
-	return rc;
-}
-
 static const struct v4l2_file_operations cx231xx_v4l_fops = {
 	.owner   = THIS_MODULE,
 	.open    = cx231xx_v4l2_open,
 	.release = cx231xx_v4l2_close,
-	.read    = cx231xx_v4l2_read,
-	.poll    = cx231xx_v4l2_poll,
-	.mmap    = cx231xx_v4l2_mmap,
+	.read    = vb2_fop_read,
+	.poll    = vb2_fop_poll,
+	.mmap    = vb2_fop_mmap,
 	.unlocked_ioctl   = video_ioctl2,
 };
 
@@ -2088,17 +1630,17 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
 	.vidioc_s_fmt_vbi_cap          = vidioc_s_fmt_vbi_cap,
 	.vidioc_g_pixelaspect          = vidioc_g_pixelaspect,
 	.vidioc_g_selection            = vidioc_g_selection,
-	.vidioc_reqbufs                = vidioc_reqbufs,
-	.vidioc_querybuf               = vidioc_querybuf,
-	.vidioc_qbuf                   = vidioc_qbuf,
-	.vidioc_dqbuf                  = vidioc_dqbuf,
+	.vidioc_reqbufs                = vb2_ioctl_reqbufs,
+	.vidioc_querybuf               = vb2_ioctl_querybuf,
+	.vidioc_qbuf                   = vb2_ioctl_qbuf,
+	.vidioc_dqbuf                  = vb2_ioctl_dqbuf,
 	.vidioc_s_std                  = vidioc_s_std,
 	.vidioc_g_std                  = vidioc_g_std,
 	.vidioc_enum_input             = cx231xx_enum_input,
 	.vidioc_g_input                = cx231xx_g_input,
 	.vidioc_s_input                = cx231xx_s_input,
-	.vidioc_streamon               = vidioc_streamon,
-	.vidioc_streamoff              = vidioc_streamoff,
+	.vidioc_streamon               = vb2_ioctl_streamon,
+	.vidioc_streamoff              = vb2_ioctl_streamoff,
 	.vidioc_g_tuner                = cx231xx_g_tuner,
 	.vidioc_s_tuner                = cx231xx_s_tuner,
 	.vidioc_g_frequency            = cx231xx_g_frequency,
@@ -2175,6 +1717,7 @@ static void cx231xx_vdev_init(struct cx231xx *dev,
 
 int cx231xx_register_analog_devices(struct cx231xx *dev)
 {
+	struct vb2_queue *q;
 	int ret;
 
 	dev_info(dev->dev, "v4l2 driver version %s\n", CX231XX_VERSION);
@@ -2221,6 +1764,21 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 		dev_err(dev->dev, "failed to initialize video media entity!\n");
 #endif
 	dev->vdev.ctrl_handler = &dev->ctrl_handler;
+
+	q = &dev->vidq;
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_USERPTR | VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->drv_priv = dev;
+	q->buf_struct_size = sizeof(struct cx231xx_buffer);
+	q->ops = &cx231xx_video_qops;
+	q->mem_ops = &vb2_vmalloc_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->min_buffers_needed = 1;
+	q->lock = &dev->lock;
+	ret = vb2_queue_init(q);
+	if (ret)
+		return ret;
+	dev->vdev.queue = q;
 	dev->vdev.device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 				V4L2_CAP_VIDEO_CAPTURE;
 	if (dev->tuner_type != TUNER_ABSENT)
@@ -2254,6 +1812,21 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 		dev_err(dev->dev, "failed to initialize vbi media entity!\n");
 #endif
 	dev->vbi_dev.ctrl_handler = &dev->ctrl_handler;
+
+	q = &dev->vbiq;
+	q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
+	q->io_modes = VB2_USERPTR | VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->drv_priv = dev;
+	q->buf_struct_size = sizeof(struct cx231xx_buffer);
+	q->ops = &cx231xx_vbi_qops;
+	q->mem_ops = &vb2_vmalloc_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->min_buffers_needed = 1;
+	q->lock = &dev->lock;
+	ret = vb2_queue_init(q);
+	if (ret)
+		return ret;
+	dev->vbi_dev.queue = q;
 	dev->vbi_dev.device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 				   V4L2_CAP_VBI_CAPTURE;
 	if (dev->tuner_type != TUNER_ABSENT)
diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index b007611abc37..b32eab641793 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -20,7 +20,7 @@
 
 #include <media/drv-intf/cx2341x.h>
 
-#include <media/videobuf-vmalloc.h>
+#include <media/videobuf2-vmalloc.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fh.h>
@@ -223,8 +223,8 @@ struct cx231xx_fmt {
 /* buffer for one video frame */
 struct cx231xx_buffer {
 	/* common v4l buffer stuff -- must be first */
-	struct videobuf_buffer vb;
-
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
 	struct list_head frame;
 	int top_field;
 	int receiving;
@@ -237,7 +237,6 @@ enum ps_package_head {
 
 struct cx231xx_dmaqueue {
 	struct list_head active;
-	struct list_head queued;
 
 	wait_queue_head_t wq;
 
@@ -251,6 +250,7 @@ struct cx231xx_dmaqueue {
 	u32 lines_completed;
 	u8 field1_done;
 	u32 lines_per_field;
+	u32 sequence;
 
 	/*Mpeg2 control buffer*/
 	u8 *p_left_data;
@@ -427,23 +427,6 @@ struct cx231xx_audio {
 
 struct cx231xx;
 
-struct cx231xx_fh {
-	struct v4l2_fh fh;
-	struct cx231xx *dev;
-	unsigned int stream_on:1;	/* Locks streams */
-	enum v4l2_buf_type type;
-
-	struct videobuf_queue vb_vidq;
-
-	/* vbi capture */
-	struct videobuf_queue      vidq;
-	struct videobuf_queue      vbiq;
-
-	/* MPEG Encoder specifics ONLY */
-
-	atomic_t                   v4l_reading;
-};
-
 /*****************************************************************/
 /* set/get i2c */
 /* 00--1Mb/s, 01-400kb/s, 10--100kb/s, 11--5Mb/s */
@@ -634,6 +617,7 @@ struct cx231xx {
 	int width;		/* current frame width */
 	int height;		/* current frame height */
 	int interlaced;		/* 1=interlace fields, 0=just top fields */
+	unsigned int size;
 
 	struct cx231xx_audio adev;
 
@@ -657,6 +641,9 @@ struct cx231xx {
 	struct media_pad input_pad[MAX_CX231XX_INPUT];
 #endif
 
+	struct vb2_queue vidq;
+	struct vb2_queue vbiq;
+
 	unsigned char eedata[256];
 
 	struct cx231xx_video_mode video_mode;
@@ -717,6 +704,7 @@ struct cx231xx {
 	u8 USE_ISO;
 	struct cx231xx_tvnorm      encodernorm;
 	struct cx231xx_tsport      ts1, ts2;
+	struct vb2_queue	   mpegq;
 	struct video_device        v4l_device;
 	atomic_t                   v4l_reader_count;
 	u32                        freq;
-- 
2.23.0.rc1

