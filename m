Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622B535AF9
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 13:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfFELQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 07:16:28 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51489 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727198AbfFELQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 07:16:28 -0400
Received: from [IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9] ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YTu2hknKX3qlsYTu5hfVgo; Wed, 05 Jun 2019 13:16:25 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cxusb: Revert "media: cxusb: add raw mode support for, Medion
 MD95700"
Message-ID: <6db67a7c-77ca-ac40-e72d-4d00109de228@xs4all.nl>
Date:   Wed, 5 Jun 2019 13:16:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNbP1c1p5tSV5a9w/ErYEdUSqYkqjnrurNruVNn8vH5TKHw2l7NPC80fIU3Yw1n0Crcpem+crZ8CTlOqPmZgXOW+NmKxFEiifBxl80Uk5QZlAnIaDuQz
 OOKtasFzRVyvmzsg5IhQ1rc7dwOxRaeFHm7t7gy387eQk1k4hc9yMJwESEapZwgMVH0uEla8gdvlBcEPu3/PEcVFpNyOMsFvvzjmUCAHbrpOIM4Ux6bO27zv
 hI8hOPXIzJSecvmfmVvnnq5irpn2dI3t0Gb/8p+ulmH3qvxR1X8Cbe1OkIUO+bddx4TCsQ0kFKqAmaLUIHuIrEGgs6JRtWnFobtb8jSpj8w=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch shouldn't have been included in the pull request as it adds
a non-standard raw mode that is for debugging only. So revert
commit ead14a70754f8d7f5dbcb0553c7f11eb0fc4a6ac.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/dvb-usb/cxusb-analog.c | 190 ++++-------------------
 drivers/media/usb/dvb-usb/cxusb.h        |   4 -
 drivers/media/v4l2-core/v4l2-ioctl.c     |   3 +-
 3 files changed, 34 insertions(+), 163 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index 9b4f17ec63d3..0699f718d052 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -44,9 +44,7 @@ static int cxusb_medion_v_queue_setup(struct vb2_queue *q,
 {
 	struct dvb_usb_device *dvbdev = vb2_get_drv_priv(q);
 	struct cxusb_medion_dev *cxdev = dvbdev->priv;
-	unsigned int size = cxdev->raw_mode ?
-		CXUSB_VIDEO_MAX_FRAME_SIZE :
-		cxdev->width * cxdev->height * 2;
+	unsigned int size = cxdev->width * cxdev->height * 2;

 	if (*num_planes > 0) {
 		if (*num_planes != 1)
@@ -69,13 +67,8 @@ static int cxusb_medion_v_buf_init(struct vb2_buffer *vb)

 	cxusb_vprintk(dvbdev, OPS, "buffer init\n");

-	if (cxdev->raw_mode) {
-		if (vb2_plane_size(vb, 0) < CXUSB_VIDEO_MAX_FRAME_SIZE)
-			return -ENOMEM;
-	} else {
-		if (vb2_plane_size(vb, 0) < cxdev->width * cxdev->height * 2)
-			return -ENOMEM;
-	}
+	if (vb2_plane_size(vb, 0) < cxdev->width * cxdev->height * 2)
+		return -ENOMEM;

 	cxusb_vprintk(dvbdev, OPS, "buffer OK\n");

@@ -449,45 +442,6 @@ static bool cxusb_medion_copy_field(struct dvb_usb_device *dvbdev,
 	return true;
 }

-static void cxusb_medion_v_process_urb_raw(struct cxusb_medion_dev *cxdev,
-					   struct urb *urb)
-{
-	struct dvb_usb_device *dvbdev = cxdev->dvbdev;
-	u8 *buf;
-	struct cxusb_medion_vbuffer *vbuf;
-	int i;
-	unsigned long len;
-
-	if (list_empty(&cxdev->buflist)) {
-		dev_warn(&dvbdev->udev->dev, "no free buffers\n");
-		cxdev->vbuf_sequence++;
-		return;
-	}
-
-	vbuf = list_first_entry(&cxdev->buflist, struct cxusb_medion_vbuffer,
-				list);
-	list_del(&vbuf->list);
-
-	vbuf->vb2.field = V4L2_FIELD_NONE;
-	vbuf->vb2.sequence = cxdev->vbuf_sequence++;
-	vbuf->vb2.vb2_buf.timestamp = ktime_get_ns();
-
-	buf = vb2_plane_vaddr(&vbuf->vb2.vb2_buf, 0);
-
-	for (i = 0, len = 0; i < urb->number_of_packets; i++) {
-		memcpy(buf, urb->transfer_buffer +
-		       urb->iso_frame_desc[i].offset,
-		       urb->iso_frame_desc[i].actual_length);
-
-		buf += urb->iso_frame_desc[i].actual_length;
-		len += urb->iso_frame_desc[i].actual_length;
-	}
-
-	vb2_set_plane_payload(&vbuf->vb2.vb2_buf, 0, len);
-
-	vb2_buffer_done(&vbuf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
-}
-
 static bool cxusb_medion_v_process_auxbuf(struct cxusb_medion_dev *cxdev,
 					  bool reset)
 {
@@ -610,26 +564,22 @@ static bool cxusb_medion_v_complete_handle_urb(struct cxusb_medion_dev *cxdev,
 			      len);

 		if (len > 0) {
-			if (cxdev->raw_mode) {
-				cxusb_medion_v_process_urb_raw(cxdev, urb);
-			} else {
-				cxusb_vprintk(dvbdev, URB, "appending URB\n");
-
-				/*
-				 * append new data to auxbuf while
-				 * overwriting old data if necessary
-				 *
-				 * if any overwrite happens then we can no
-				 * longer rely on consistency of the whole
-				 * data so let's start again the current
-				 * auxbuf frame assembling process from
-				 * the beginning
-				 */
-				*auxbuf_reset =
-					!cxusb_auxbuf_append_urb(dvbdev,
-								 &cxdev->auxbuf,
-								 urb);
-			}
+			cxusb_vprintk(dvbdev, URB, "appending URB\n");
+
+			/*
+			 * append new data to auxbuf while
+			 * overwriting old data if necessary
+			 *
+			 * if any overwrite happens then we can no
+			 * longer rely on consistency of the whole
+			 * data so let's start again the current
+			 * auxbuf frame assembling process from
+			 * the beginning
+			 */
+			*auxbuf_reset =
+				!cxusb_auxbuf_append_urb(dvbdev,
+							 &cxdev->auxbuf,
+							 urb);
 		}
 	}

@@ -664,8 +614,7 @@ static void cxusb_medion_v_complete_work(struct work_struct *work)

 	reschedule = cxusb_medion_v_complete_handle_urb(cxdev, &auxbuf_reset);

-	if (!cxdev->raw_mode && cxusb_medion_v_process_auxbuf(cxdev,
-							      auxbuf_reset))
+	if (cxusb_medion_v_process_auxbuf(cxdev, auxbuf_reset))
 		/* reschedule us until auxbuf no longer can produce any frame */
 		reschedule = true;

@@ -854,13 +803,9 @@ static int cxusb_medion_v_start_streaming(struct vb2_queue *q,
 		goto ret_unstream_cx;
 	}

-	if (cxdev->raw_mode) {
-		npackets = CXUSB_VIDEO_MAX_FRAME_PKTS;
-	} else {
-		ret = cxusb_medion_v_ss_auxbuf_alloc(cxdev, &npackets);
-		if (ret != 0)
-			goto ret_unstream_md;
-	}
+	ret = cxusb_medion_v_ss_auxbuf_alloc(cxdev, &npackets);
+	if (ret != 0)
+		goto ret_unstream_md;

 	for (i = 0; i < CXUSB_VIDEO_URBS; i++) {
 		int framen;
@@ -916,11 +861,9 @@ static int cxusb_medion_v_start_streaming(struct vb2_queue *q,
 	cxdev->nexturb = 0;
 	cxdev->vbuf_sequence = 0;

-	if (!cxdev->raw_mode) {
-		cxdev->vbuf = NULL;
-		cxdev->bt656.mode = NEW_FRAME;
-		cxdev->bt656.buf = NULL;
-	}
+	cxdev->vbuf = NULL;
+	cxdev->bt656.mode = NEW_FRAME;
+	cxdev->bt656.buf = NULL;

 	for (i = 0; i < CXUSB_VIDEO_URBS; i++)
 		if (cxdev->streamurbs[i]) {
@@ -938,8 +881,7 @@ static int cxusb_medion_v_start_streaming(struct vb2_queue *q,
 	cxusb_medion_urbs_free(cxdev);

 ret_freeab:
-	if (!cxdev->raw_mode)
-		vfree(cxdev->auxbuf.buf);
+	vfree(cxdev->auxbuf.buf);

 ret_unstream_md:
 	cxusb_ctrl_msg(dvbdev, CMD_STREAMING_OFF, NULL, 0, NULL, 0);
@@ -986,8 +928,7 @@ static void cxusb_medion_v_stop_streaming(struct vb2_queue *q)
 	mutex_lock(cxdev->videodev->lock);

 	/* free transfer buffer and URB */
-	if (!cxdev->raw_mode)
-		vfree(cxdev->auxbuf.buf);
+	vfree(cxdev->auxbuf.buf);

 	cxusb_medion_urbs_free(cxdev);

@@ -1060,11 +1001,9 @@ static int cxusb_medion_g_fmt_vid_cap(struct file *file, void *fh,
 	f->fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
 	f->fmt.pix.field = vb2_start_streaming_called(&cxdev->videoqueue) ?
 		cxdev->field_order : cxusb_medion_field_order(cxdev);
-	f->fmt.pix.bytesperline = cxdev->raw_mode ? 0 : cxdev->width * 2;
+	f->fmt.pix.bytesperline = cxdev->width * 2;
 	f->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
-	f->fmt.pix.sizeimage =
-		cxdev->raw_mode ? CXUSB_VIDEO_MAX_FRAME_SIZE :
-		f->fmt.pix.bytesperline * f->fmt.pix.height;
+	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline * f->fmt.pix.height;

 	return 0;
 }
@@ -1102,10 +1041,8 @@ static int cxusb_medion_try_s_fmt_vid_cap(struct file *file,
 	f->fmt.pix.height = subfmt.format.height;
 	f->fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
 	f->fmt.pix.field = field;
-	f->fmt.pix.bytesperline = cxdev->raw_mode ? 0 : f->fmt.pix.width * 2;
-	f->fmt.pix.sizeimage =
-		cxdev->raw_mode ? CXUSB_VIDEO_MAX_FRAME_SIZE :
-		f->fmt.pix.bytesperline * f->fmt.pix.height;
+	f->fmt.pix.bytesperline = f->fmt.pix.width * 2;
+	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline * f->fmt.pix.height;
 	f->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;

 	if (isset) {
@@ -1461,67 +1398,6 @@ static int cxusb_medion_querystd(struct file *file, void *fh,
 	return 0;
 }

-static int cxusb_medion_g_s_parm(struct file *file, void *fh,
-				 struct v4l2_streamparm *param)
-{
-	v4l2_std_id std;
-
-	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return -EINVAL;
-
-	param->parm.capture.readbuffers = 2;
-
-	if (cxusb_medion_g_std(file, fh, &std) == 0)
-		v4l2_video_std_frame_period(std,
-					    &param->parm.capture.timeperframe);
-
-	return 0;
-}
-
-static int cxusb_medion_g_parm(struct file *file, void *fh,
-			       struct v4l2_streamparm *param)
-{
-	struct dvb_usb_device *dvbdev = video_drvdata(file);
-	struct cxusb_medion_dev *cxdev = dvbdev->priv;
-	int ret;
-
-	ret = cxusb_medion_g_s_parm(file, fh, param);
-	if (ret != 0)
-		return ret;
-
-	if (cxdev->raw_mode)
-		param->parm.capture.extendedmode |=
-			CXUSB_EXTENDEDMODE_CAPTURE_RAW;
-
-	return 0;
-}
-
-static int cxusb_medion_s_parm(struct file *file, void *fh,
-			       struct v4l2_streamparm *param)
-{
-	struct dvb_usb_device *dvbdev = video_drvdata(file);
-	struct cxusb_medion_dev *cxdev = dvbdev->priv;
-	int ret;
-	bool want_raw;
-
-	ret = cxusb_medion_g_s_parm(file, fh, param);
-	if (ret != 0)
-		return ret;
-
-	want_raw = param->parm.capture.extendedmode &
-		CXUSB_EXTENDEDMODE_CAPTURE_RAW;
-
-	if (want_raw != cxdev->raw_mode) {
-		if (vb2_start_streaming_called(&cxdev->videoqueue) ||
-		    cxdev->stop_streaming)
-			return -EBUSY;
-
-		cxdev->raw_mode = want_raw;
-	}
-
-	return 0;
-}
-
 static int cxusb_medion_log_status(struct file *file, void *fh)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1541,8 +1417,6 @@ static const struct v4l2_ioctl_ops cxusb_video_ioctl = {
 	.vidioc_enum_input = cxusb_medion_enum_input,
 	.vidioc_g_input = cxusb_medion_g_input,
 	.vidioc_s_input = cxusb_medion_s_input,
-	.vidioc_g_parm = cxusb_medion_g_parm,
-	.vidioc_s_parm = cxusb_medion_s_parm,
 	.vidioc_g_tuner = cxusb_medion_g_tuner,
 	.vidioc_s_tuner = cxusb_medion_s_tuner,
 	.vidioc_g_frequency = cxusb_medion_g_frequency,
diff --git a/drivers/media/usb/dvb-usb/cxusb.h b/drivers/media/usb/dvb-usb/cxusb.h
index eb70fbb02680..9e374e53125b 100644
--- a/drivers/media/usb/dvb-usb/cxusb.h
+++ b/drivers/media/usb/dvb-usb/cxusb.h
@@ -133,7 +133,6 @@ struct cxusb_medion_dev {
 	bool stop_streaming;
 	u32 width, height;
 	u32 field_order;
-	bool raw_mode;
 	struct cxusb_medion_auxbuf auxbuf;
 	v4l2_std_id norm;

@@ -157,9 +156,6 @@ struct cxusb_medion_vbuffer {
 	struct list_head list;
 };

-/* Capture streaming parameters extendedmode field flags */
-#define CXUSB_EXTENDEDMODE_CAPTURE_RAW 1
-
 /* defines for "debug" module parameter */
 #define CXUSB_DBG_RC BIT(0)
 #define CXUSB_DBG_I2C BIT(1)
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b4c73e8f23c5..14596e8ad2c6 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2025,7 +2025,7 @@ static int v4l_s_parm(const struct v4l2_ioctl_ops *ops,
 	if (ret)
 		return ret;

-	/* Note: extendedmode is never used in output drivers */
+	/* Note: extendedmode is never used in drivers */
 	if (V4L2_TYPE_IS_OUTPUT(p->type)) {
 		memset(p->parm.output.reserved, 0,
 		       sizeof(p->parm.output.reserved));
@@ -2034,6 +2034,7 @@ static int v4l_s_parm(const struct v4l2_ioctl_ops *ops,
 	} else {
 		memset(p->parm.capture.reserved, 0,
 		       sizeof(p->parm.capture.reserved));
+		p->parm.capture.extendedmode = 0;
 		p->parm.capture.capturemode &= V4L2_MODE_HIGHQUALITY;
 	}
 	return ops->vidioc_s_parm(file, fh, p);
-- 
2.20.1

