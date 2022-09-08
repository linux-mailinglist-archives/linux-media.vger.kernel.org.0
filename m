Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D67D5B271F
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 21:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiIHTsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 15:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiIHTsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 15:48:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97599F4112
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 12:47:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWNVF-0001NT-LX; Thu, 08 Sep 2022 21:47:57 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWNVC-004gYR-VY; Thu, 08 Sep 2022 21:47:56 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWNVC-00Fjp8-9n; Thu, 08 Sep 2022 21:47:54 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v13 5/6] usb: gadget: uvc: add VIDIOC hostside config feedback
Date:   Thu,  8 Sep 2022 21:47:49 +0200
Message-Id: <20220908194750.3750310-6-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908194750.3750310-1-m.grzeschik@pengutronix.de>
References: <20220908194750.3750310-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch extends the v4l2 VIDIOCs for enum_format, enum_framesizes,
enum_frameintervals and set_fmt. The active host side configuration is
reported in these v4l2 interface functions. So the enum functions will
on set configuration return the currently set format/frmae/interval.
The set_format function has changed to be an noop since there is
no point for the kernel to set the currently decided format.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2:
   - fixed indentation of find_frame/format_by_index
   - fixed function name find_frm_by_size to find_frame_by_size
   - fixed indentation of _uvc_v4l2_try_fmt
   - fixed indentation in uvc_v4l2_enum_frameintervals
   - removed unneeded declaration of uvc_v4l2_get_bytesperline in uvc_v4l2.h
   - checked return values on config_group_find_item, handling refcount
   - fixed sizeof using variables instead of types
   - removed unsused def_format variable
   - wrting grp, hdr, fmt and frm in full
   - added proper ival handling
   - removed analyze_configfs function
   - added linked list of frames to uvcg_format
   - added functon find_frame_by_index
v2 -> v3:
   - fixed usage of u_uvc.h
   - removed unused variable i in _try_fmt
   - made uvc_v4l2_get_bytesperline static
v3 -> v4:
   - conditionally return current or all frames/formats/frameintervals on enum
   - dropped setting format and frame with set_format
   - combined try and set format function to one call
v4 -> v5:
   - fixed uninitialized return values reported by kernel test robot
   - added local video variable to uvc_v4l2_enum_frameintervals
v5 -> v6:
   -
v6 -> v7:
   - fixed unlocking in f_uvc uvc_alloc function
   - add uvc_get_frame_size function for sizeimage calculation
   - add fallback to frame.dw_max_video_frame_buffer_size
v7 -> v12:
   - moved the enum callbacks to a separate patch
   - rephrased the commit message
v7 -> v13:
   - moved the try_format callback to a separate patch

 drivers/usb/gadget/function/f_uvc.c     |   4 +
 drivers/usb/gadget/function/uvc.h       |  20 +++-
 drivers/usb/gadget/function/uvc_queue.c |   2 +-
 drivers/usb/gadget/function/uvc_v4l2.c  | 117 ++++++++++++------------
 drivers/usb/gadget/function/uvc_video.c |  61 +++++++++++-
 5 files changed, 132 insertions(+), 72 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 7c416170b499e0..6f1138e819bdbf 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -327,6 +327,8 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 		if (uvc->video.ep)
 			usb_ep_disable(uvc->video.ep);
 
+		uvc->streamon = 0;
+
 		memset(&v4l2_event, 0, sizeof(v4l2_event));
 		v4l2_event.type = UVC_EVENT_STREAMOFF;
 		v4l2_event_queue(&uvc->vdev, &v4l2_event);
@@ -350,6 +352,8 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 			return ret;
 		usb_ep_enable(uvc->video.ep);
 
+		uvc->streamon = 1;
+
 		memset(&v4l2_event, 0, sizeof(v4l2_event));
 		v4l2_event.type = UVC_EVENT_STREAMON;
 		v4l2_event_queue(&uvc->vdev, &v4l2_event);
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 641cf2e7afaf6e..d32f34a7dbc423 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -90,11 +90,10 @@ struct uvc_video {
 	struct work_struct pump;
 
 	/* Frame parameters */
-	u8 bpp;
-	u32 fcc;
-	unsigned int width;
-	unsigned int height;
-	unsigned int imagesize;
+	struct uvcg_format *cur_format;
+	struct uvcg_frame *cur_frame;
+	unsigned int cur_ival;
+
 	struct mutex mutex;	/* protects frame parameters */
 
 	unsigned int uvc_num_requests;
@@ -144,6 +143,8 @@ struct uvc_device {
 		const struct uvc_descriptor_header * const *ss_streaming;
 	} desc;
 
+	bool streamon;
+
 	unsigned int control_intf;
 	struct usb_ep *control_ep;
 	struct usb_request *control_req;
@@ -180,4 +181,13 @@ extern void uvc_endpoint_stream(struct uvc_device *dev);
 extern void uvc_function_connect(struct uvc_device *uvc);
 extern void uvc_function_disconnect(struct uvc_device *uvc);
 
+extern int uvc_get_frame_size(struct uvcg_format *uformat,
+		       struct uvcg_frame *uframe);
+
+extern struct uvcg_format *find_format_by_index(struct uvc_device *uvc,
+						int index);
+extern struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
+					      struct uvcg_format *uformat,
+					      int index);
+
 #endif /* _UVC_GADGET_H_ */
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index ec500ee499eed1..3353d0566a59d5 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -52,7 +52,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 
 	*nplanes = 1;
 
-	sizes[0] = video->imagesize;
+	sizes[0] = uvc_get_frame_size(video->cur_format, video->cur_frame);
 
 	req_size = video->ep->maxpacket
 		 * max_t(unsigned int, video->ep->maxburst, 1)
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 761bc833d1e54f..bc5e2076c6b7e4 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -199,16 +199,6 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
  * V4L2 ioctls
  */
 
-struct uvc_format {
-	u8 bpp;
-	u32 fcc;
-};
-
-static struct uvc_format uvc_formats[] = {
-	{ 16, V4L2_PIX_FMT_YUYV  },
-	{ 0,  V4L2_PIX_FMT_MJPEG },
-};
-
 static int
 uvc_v4l2_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
@@ -229,56 +219,34 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
+	struct uvc_format_desc *fmtdesc;
 
-	fmt->fmt.pix.pixelformat = video->fcc;
-	fmt->fmt.pix.width = video->width;
-	fmt->fmt.pix.height = video->height;
+	fmtdesc = to_uvc_format(video->cur_format);
+
+	fmt->fmt.pix.pixelformat = fmtdesc->fcc;
+	fmt->fmt.pix.width = video->cur_frame->frame.w_width;
+	fmt->fmt.pix.height = video->cur_frame->frame.w_height;
 	fmt->fmt.pix.field = V4L2_FIELD_NONE;
-	fmt->fmt.pix.bytesperline = video->bpp * video->width / 8;
-	fmt->fmt.pix.sizeimage = video->imagesize;
+	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(video->cur_format,
+							      video->cur_frame);
+	fmt->fmt.pix.sizeimage = uvc_get_frame_size(video->cur_format,
+						    video->cur_frame);
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
 	fmt->fmt.pix.priv = 0;
 
 	return 0;
 }
 
+/* set_format is only allowed by the host side, so this is a noop */
 static int
 uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
-	struct uvc_format *format;
-	unsigned int imagesize;
-	unsigned int bpl;
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(uvc_formats); ++i) {
-		format = &uvc_formats[i];
-		if (format->fcc == fmt->fmt.pix.pixelformat)
-			break;
-	}
 
-	if (i == ARRAY_SIZE(uvc_formats)) {
-		uvcg_info(&uvc->func, "Unsupported format 0x%08x.\n",
-			  fmt->fmt.pix.pixelformat);
+	if (fmt->type != video->queue.queue.type)
 		return -EINVAL;
-	}
-
-	bpl = format->bpp * fmt->fmt.pix.width / 8;
-	imagesize = bpl ? bpl * fmt->fmt.pix.height : fmt->fmt.pix.sizeimage;
-
-	video->fcc = format->fcc;
-	video->bpp = format->bpp;
-	video->width = fmt->fmt.pix.width;
-	video->height = fmt->fmt.pix.height;
-	video->imagesize = imagesize;
-
-	fmt->fmt.pix.field = V4L2_FIELD_NONE;
-	fmt->fmt.pix.bytesperline = bpl;
-	fmt->fmt.pix.sizeimage = imagesize;
-	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
-	fmt->fmt.pix.priv = 0;
 
 	return 0;
 }
@@ -329,6 +297,7 @@ uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
 	struct uvcg_format *uformat = NULL;
 	struct uvcg_frame *uframe = NULL;
 	struct uvcg_frame_ptr *frame;
@@ -347,11 +316,19 @@ uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
 	if (!uframe)
 		return -EINVAL;
 
-	if (fival->index >= uframe->frame.b_frame_interval_type)
-		return -EINVAL;
+	if (uvc->streamon) {
+		if (fival->index >= 1)
+			return -EINVAL;
 
-	fival->discrete.numerator =
-		uframe->dw_frame_interval[fival->index];
+		fival->discrete.numerator =
+			uframe->dw_frame_interval[video->cur_ival - 1];
+	} else {
+		if (fival->index >= uframe->frame.b_frame_interval_type)
+			return -EINVAL;
+
+		fival->discrete.numerator =
+			uframe->dw_frame_interval[fival->index];
+	}
 
 	/* TODO: handle V4L2_FRMIVAL_TYPE_STEPWISE */
 	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
@@ -368,19 +345,28 @@ uvc_v4l2_enum_framesizes(struct file *file, void *fh,
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
 	struct uvcg_format *uformat = NULL;
 	struct uvcg_frame *uframe = NULL;
 
-	uformat = find_format_by_pix(uvc, fsize->pixel_format);
-	if (!uformat)
-		return -EINVAL;
+	if (uvc->streamon) {
+		if (fsize->index >= 1)
+			return -EINVAL;
 
-	if (fsize->index >= uformat->num_frames)
-		return -EINVAL;
+		uformat = video->cur_format;
+		uframe = video->cur_frame;
+	} else {
+		uformat = find_format_by_pix(uvc, fsize->pixel_format);
+		if (!uformat)
+			return -EINVAL;
 
-	uframe = find_frame_by_index(uvc, uformat, fsize->index + 1);
-	if (!uframe)
-		return -EINVAL;
+		if (fsize->index >= uformat->num_frames)
+			return -EINVAL;
+
+		uframe = find_frame_by_index(uvc, uformat, fsize->index + 1);
+		if (!uframe)
+			return -EINVAL;
+	}
 
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
 	fsize->discrete.width = uframe->frame.w_width;
@@ -394,15 +380,24 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
 	struct uvc_format_desc *fmtdesc;
 	struct uvcg_format *uformat;
 
-	if (f->index >= uvc->header->num_fmt)
-		return -EINVAL;
+	if (uvc->streamon) {
+		if (f->index >= 1)
+			return -EINVAL;
 
-	uformat = find_format_by_index(uvc, f->index + 1);
-	if (!uformat)
-		return -EINVAL;
+		uformat = video->cur_format;
+	} else {
+		if (f->index >= uvc->header->num_fmt)
+			return -EINVAL;
+
+		uformat = find_format_by_index(uvc, f->index + 1);
+		if (!uformat)
+			return -EINVAL;
+
+	}
 
 	if (uformat->type != UVCG_UNCOMPRESSED)
 		f->flags |= V4L2_FMT_FLAG_COMPRESSED;
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index c00ce0e91f5d5c..37867c93073418 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -19,6 +19,7 @@
 #include "uvc.h"
 #include "uvc_queue.h"
 #include "uvc_video.h"
+#include "uvc_configfs.h"
 
 /* --------------------------------------------------------------------------
  * Video codecs
@@ -490,21 +491,71 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 	return ret;
 }
 
+static int uvc_frame_default(struct uvcg_format *uformat)
+{
+	struct uvcg_uncompressed *u;
+	struct uvcg_mjpeg *m;
+
+	switch (uformat->type) {
+	case UVCG_UNCOMPRESSED:
+		u = to_uvcg_uncompressed(&uformat->group.cg_item);
+		if (u)
+			return u->desc.bDefaultFrameIndex;
+		break;
+	case UVCG_MJPEG:
+		m = to_uvcg_mjpeg(&uformat->group.cg_item);
+		if (m)
+			return m->desc.bDefaultFrameIndex;
+		break;
+	}
+
+	return 0;
+}
+
+static int uvc_default_frame_interval(struct uvc_video *video)
+{
+	int i;
+
+	for (i = 0; i < video->cur_frame->frame.b_frame_interval_type; i++) {
+		if (video->cur_frame->frame.dw_default_frame_interval ==
+			video->cur_frame->dw_frame_interval[i]) {
+			video->cur_ival = i + 1;
+			return i + 1;
+		}
+	}
+
+	/* fallback */
+	return 1;
+}
+
 /*
  * Initialize the UVC video stream.
  */
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 {
+	int iframe;
+
 	INIT_LIST_HEAD(&video->req_free);
 	spin_lock_init(&video->req_lock);
 	INIT_WORK(&video->pump, uvcg_video_pump);
 
+	if (list_empty(&uvc->header->formats))
+		return -EINVAL;
+
 	video->uvc = uvc;
-	video->fcc = V4L2_PIX_FMT_YUYV;
-	video->bpp = 16;
-	video->width = 320;
-	video->height = 240;
-	video->imagesize = 320 * 240 * 2;
+	video->cur_format = find_format_by_index(uvc, 1);
+	if (!video->cur_format)
+		return -EINVAL;
+
+	iframe = uvc_frame_default(video->cur_format);
+	if (!iframe)
+		return -EINVAL;
+
+	video->cur_frame = find_frame_by_index(uvc, video->cur_format, iframe);
+	if (!video->cur_frame)
+		return -EINVAL;
+
+	video->cur_ival = uvc_default_frame_interval(video);
 
 	/* Initialize the video buffers queue. */
 	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
-- 
2.30.2

