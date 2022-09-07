Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 127A05B0878
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 17:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbiIGPYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 11:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiIGPYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 11:24:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27140B8A52
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 08:23:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwuD-0001Gw-Nf; Wed, 07 Sep 2022 17:23:57 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwuA-004Sv8-Cl; Wed, 07 Sep 2022 17:23:56 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwuB-00Aq4p-HP; Wed, 07 Sep 2022 17:23:55 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v11 3/4] usb: gadget: uvc: add VIDIOC function
Date:   Wed,  7 Sep 2022 17:23:53 +0200
Message-Id: <20220907152354.2583258-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907152354.2583258-1-m.grzeschik@pengutronix.de>
References: <20220907152354.2583258-1-m.grzeschik@pengutronix.de>
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

This patch adds support to the v4l2 VIDIOC for enum_format,
enum_framesizes, enum_frameintervals and try_fmt. The linked/active
configfs userspace setup is used in the v4l2 interface functions.

With the v4l2 vidiocontrols the userspace can use the v4l2 api to
negotiate and allocate the data. It doesn't have to bring its own
configfs parser.

Also it only needs to be extended with subscription for streamon,
streamoff, connect and disconnect for stream handling and become able to
serve the uvc device.

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
v7 -> v11:
   -

 drivers/usb/gadget/function/f_uvc.c     |  33 +++
 drivers/usb/gadget/function/uvc.h       |  20 +-
 drivers/usb/gadget/function/uvc_queue.c |   3 +-
 drivers/usb/gadget/function/uvc_v4l2.c  | 346 +++++++++++++++++++++---
 drivers/usb/gadget/function/uvc_video.c |  61 ++++-
 5 files changed, 412 insertions(+), 51 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index f4f6cf75930beb..a8dcf5f01f16de 100644
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
@@ -888,6 +892,7 @@ static void uvc_free(struct usb_function *f)
 	struct uvc_device *uvc = to_uvc(f);
 	struct f_uvc_opts *opts = container_of(f->fi, struct f_uvc_opts,
 					       func_inst);
+	config_item_put(&uvc->header->item);
 	--opts->refcnt;
 	kfree(uvc);
 }
@@ -941,6 +946,7 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 	struct uvc_device *uvc;
 	struct f_uvc_opts *opts;
 	struct uvc_descriptor_header **strm_cls;
+	struct config_item *streaming, *header, *h;
 
 	uvc = kzalloc(sizeof(*uvc), GFP_KERNEL);
 	if (uvc == NULL)
@@ -973,6 +979,33 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 	uvc->desc.fs_streaming = opts->fs_streaming;
 	uvc->desc.hs_streaming = opts->hs_streaming;
 	uvc->desc.ss_streaming = opts->ss_streaming;
+
+	streaming = config_group_find_item(&opts->func_inst.group, "streaming");
+	if (!streaming) {
+		config_item_put(streaming);
+		mutex_unlock(&opts->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+	header = config_group_find_item(to_config_group(streaming), "header");
+	config_item_put(streaming);
+	if (!header) {
+		config_item_put(header);
+		mutex_unlock(&opts->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+	h = config_group_find_item(to_config_group(header), "h");
+	config_item_put(header);
+	if (!h) {
+		config_item_put(h);
+		mutex_unlock(&opts->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+	uvc->header = to_uvcg_streaming_header(h);
+	if (!uvc->header->linked) {
+		mutex_unlock(&opts->lock);
+		return ERR_PTR(-EBUSY);
+	}
+
 	++opts->refcnt;
 	mutex_unlock(&opts->lock);
 
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 58e383afdd4406..8a71d0c4abbcd5 100644
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
@@ -133,6 +132,8 @@ struct uvc_device {
 	bool func_connected;
 	wait_queue_head_t func_connected_queue;
 
+	struct uvcg_streaming_header *header;
+
 	/* Descriptors */
 	struct {
 		const struct uvc_descriptor_header * const *fs_control;
@@ -142,6 +143,8 @@ struct uvc_device {
 		const struct uvc_descriptor_header * const *ss_streaming;
 	} desc;
 
+	bool streamon;
+
 	unsigned int control_intf;
 	struct usb_ep *control_ep;
 	struct usb_request *control_req;
@@ -178,4 +181,11 @@ extern void uvc_endpoint_stream(struct uvc_device *dev);
 extern void uvc_function_connect(struct uvc_device *uvc);
 extern void uvc_function_disconnect(struct uvc_device *uvc);
 
+extern int uvc_get_frame_size(struct uvc_video *video);
+extern struct uvcg_format *find_format_by_index(struct uvc_device *uvc,
+						int index);
+extern struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
+					      struct uvcg_format *uformat,
+					      int index);
+
 #endif /* _UVC_GADGET_H_ */
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index ec500ee499eed1..7ac6b54ee14e94 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -21,6 +21,7 @@
 #include <media/videobuf2-vmalloc.h>
 
 #include "uvc.h"
+#include "uvc_configfs.h"
 
 /* ------------------------------------------------------------------------
  * Video buffers queue management.
@@ -52,7 +53,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 
 	*nplanes = 1;
 
-	sizes[0] = video->imagesize;
+	sizes[0] = uvc_get_frame_size(video);
 
 	req_size = video->ep->maxpacket
 		 * max_t(unsigned int, video->ep->maxburst, 1)
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 511f106f984375..1ae72ba72f38cd 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -18,12 +18,161 @@
 #include <media/v4l2-dev.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-uvc.h>
 
 #include "f_uvc.h"
 #include "uvc.h"
 #include "uvc_queue.h"
 #include "uvc_video.h"
 #include "uvc_v4l2.h"
+#include "uvc_configfs.h"
+
+static struct uvc_format_desc *to_uvc_format(struct uvcg_format *uformat)
+{
+	char guid[16] = UVC_GUID_FORMAT_MJPEG;
+	struct uvc_format_desc *format;
+	struct uvcg_uncompressed *unc;
+
+	if (uformat->type == UVCG_UNCOMPRESSED) {
+		unc = to_uvcg_uncompressed(&uformat->group.cg_item);
+		if (!unc)
+			return ERR_PTR(-EINVAL);
+
+		memcpy(guid, unc->desc.guidFormat, sizeof(guid));
+	}
+
+	format = uvc_format_by_guid(guid);
+	if (!format)
+		return ERR_PTR(-EINVAL);
+
+	return format;
+}
+
+static int uvc_v4l2_get_bytesperline(struct uvcg_format *uformat,
+			      struct uvcg_frame *uframe)
+{
+	struct uvcg_uncompressed *u;
+
+	if (uformat->type == UVCG_UNCOMPRESSED) {
+		u = to_uvcg_uncompressed(&uformat->group.cg_item);
+		if (!u)
+			return 0;
+
+		return u->desc.bBitsPerPixel * uframe->frame.w_width / 8;
+	}
+
+	return 0;
+}
+
+int uvc_get_frame_size(struct uvc_video *video)
+{
+	unsigned int bpl = uvc_v4l2_get_bytesperline(video->cur_format,
+			                    video->cur_frame);
+
+	return bpl ? bpl * video->cur_frame->frame.w_height :
+		video->cur_frame->frame.dw_max_video_frame_buffer_size;
+}
+
+struct uvcg_format *find_format_by_index(struct uvc_device *uvc, int index)
+{
+	struct uvcg_format_ptr *format;
+	struct uvcg_format *uformat = NULL;
+	int i = 1;
+
+	list_for_each_entry(format, &uvc->header->formats, entry) {
+		if (index == i) {
+			uformat = format->fmt;
+			break;
+		}
+		i++;
+	}
+
+	return uformat;
+}
+
+struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
+				       struct uvcg_format *uformat,
+				       int index)
+{
+	struct uvcg_format_ptr *format;
+	struct uvcg_frame_ptr *frame;
+	struct uvcg_frame *uframe = NULL;
+
+	list_for_each_entry(format, &uvc->header->formats, entry) {
+		if (format->fmt->type != uformat->type)
+			continue;
+		list_for_each_entry(frame, &format->fmt->frames, entry) {
+			if (index == frame->frm->frame.b_frame_index) {
+				uframe = frame->frm;
+				break;
+			}
+		}
+	}
+
+	return uframe;
+}
+
+static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
+					      u32 pixelformat)
+{
+	struct uvcg_format_ptr *format;
+	struct uvcg_format *uformat = NULL;
+
+	list_for_each_entry(format, &uvc->header->formats, entry) {
+		struct uvc_format_desc *fmtdesc = to_uvc_format(format->fmt);
+
+		if (fmtdesc->fcc == pixelformat) {
+			uformat = format->fmt;
+			break;
+		}
+	}
+
+	return uformat;
+}
+
+static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
+					   struct uvcg_format *uformat,
+					   u16 rw, u16 rh)
+{
+	struct uvc_video *video = &uvc->video;
+	struct uvcg_format_ptr *format;
+	struct uvcg_frame_ptr *frame;
+	struct uvcg_frame *uframe = NULL;
+	unsigned int d, maxd;
+
+	/* Find the closest image size. The distance between image sizes is
+	 * the size in pixels of the non-overlapping regions between the
+	 * requested size and the frame-specified size.
+	 */
+	maxd = (unsigned int)-1;
+
+	list_for_each_entry(format, &uvc->header->formats, entry) {
+		if (format->fmt->type != uformat->type)
+			continue;
+
+		list_for_each_entry(frame, &format->fmt->frames, entry) {
+			u16 w, h;
+
+			w = frame->frm->frame.w_width;
+			h = frame->frm->frame.w_height;
+
+			d = min(w, rw) * min(h, rh);
+			d = w*h + rw*rh - 2*d;
+			if (d < maxd) {
+				maxd = d;
+				uframe = frame->frm;
+			}
+
+			if (maxd == 0)
+				break;
+		}
+	}
+
+	if (!uframe)
+		uvcg_dbg(&video->uvc->func, "Unsupported size %ux%u\n", rw, rh);
+
+	return uframe;
+}
 
 /* --------------------------------------------------------------------------
  * Requests handling
@@ -50,16 +199,6 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
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
@@ -80,13 +219,17 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
+	struct uvc_format_desc *fmtdesc;
+
+	fmtdesc = to_uvc_format(video->cur_format);
 
-	fmt->fmt.pix.pixelformat = video->fcc;
-	fmt->fmt.pix.width = video->width;
-	fmt->fmt.pix.height = video->height;
+	fmt->fmt.pix.pixelformat = fmtdesc->fcc;
+	fmt->fmt.pix.width = video->cur_frame->frame.w_width;
+	fmt->fmt.pix.height = video->cur_frame->frame.w_height;
 	fmt->fmt.pix.field = V4L2_FIELD_NONE;
-	fmt->fmt.pix.bytesperline = video->bpp * video->width / 8;
-	fmt->fmt.pix.sizeimage = video->imagesize;
+	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(video->cur_format,
+							      video->cur_frame);
+	fmt->fmt.pix.sizeimage = uvc_get_frame_size(video);
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
 	fmt->fmt.pix.priv = 0;
 
@@ -94,46 +237,165 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
 }
 
 static int
-uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
+uvc_v4l2_try_set_fmt(struct file *file, void *fh, struct v4l2_format *fmt)
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
+	struct uvcg_format *uformat;
+	struct uvcg_frame *uframe;
+	u8 *fcc;
 
-	if (i == ARRAY_SIZE(uvc_formats)) {
-		uvcg_info(&uvc->func, "Unsupported format 0x%08x.\n",
-			  fmt->fmt.pix.pixelformat);
+	if (fmt->type != video->queue.queue.type)
 		return -EINVAL;
-	}
 
-	bpl = format->bpp * fmt->fmt.pix.width / 8;
-	imagesize = bpl ? bpl * fmt->fmt.pix.height : fmt->fmt.pix.sizeimage;
+	fcc = (u8 *)&fmt->fmt.pix.pixelformat;
+	uvcg_dbg(&uvc->func, "Trying format 0x%08x (%c%c%c%c): %ux%u\n",
+		fmt->fmt.pix.pixelformat,
+		fcc[0], fcc[1], fcc[2], fcc[3],
+		fmt->fmt.pix.width, fmt->fmt.pix.height);
+
+	uformat = find_format_by_pix(uvc, fmt->fmt.pix.pixelformat);
+	if (!uformat)
+		return -EINVAL;
 
-	video->fcc = format->fcc;
-	video->bpp = format->bpp;
-	video->width = fmt->fmt.pix.width;
-	video->height = fmt->fmt.pix.height;
-	video->imagesize = imagesize;
+	uframe = find_closest_frame_by_size(uvc, uformat,
+				fmt->fmt.pix.width, fmt->fmt.pix.height);
+	if (!uframe)
+		return -EINVAL;
 
+	fmt->fmt.pix.width = uframe->frame.w_width;
+	fmt->fmt.pix.height = uframe->frame.w_height;
 	fmt->fmt.pix.field = V4L2_FIELD_NONE;
-	fmt->fmt.pix.bytesperline = bpl;
-	fmt->fmt.pix.sizeimage = imagesize;
+	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(uformat, uframe);
+	fmt->fmt.pix.sizeimage = uvc_get_frame_size(video);
+	fmt->fmt.pix.pixelformat = to_uvc_format(uformat)->fcc;
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
 	fmt->fmt.pix.priv = 0;
 
 	return 0;
 }
 
+static int
+uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
+		struct v4l2_frmivalenum *fival)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
+	struct uvcg_format *uformat = NULL;
+	struct uvcg_frame *uframe = NULL;
+	struct uvcg_frame_ptr *frame;
+
+	uformat = find_format_by_pix(uvc, fival->pixel_format);
+	if (!uformat)
+		return -EINVAL;
+
+	list_for_each_entry(frame, &uformat->frames, entry) {
+		if (frame->frm->frame.w_width == fival->width &&
+		    frame->frm->frame.w_height == fival->height) {
+			uframe = frame->frm;
+			break;
+		}
+	}
+	if (!uframe)
+		return -EINVAL;
+
+	if (uvc->streamon) {
+		if (fival->index >= 1)
+			return -EINVAL;
+
+		fival->discrete.numerator =
+			uframe->dw_frame_interval[video->cur_ival - 1];
+	} else {
+		if (fival->index >= uframe->frame.b_frame_interval_type)
+			return -EINVAL;
+
+		fival->discrete.numerator =
+			uframe->dw_frame_interval[fival->index];
+	}
+
+	/* TODO: handle V4L2_FRMIVAL_TYPE_STEPWISE */
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete.denominator = 10000000;
+	v4l2_simplify_fraction(&fival->discrete.numerator,
+		&fival->discrete.denominator, 8, 333);
+
+	return 0;
+}
+
+static int
+uvc_v4l2_enum_framesizes(struct file *file, void *fh,
+		struct v4l2_frmsizeenum *fsize)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
+	struct uvcg_format *uformat = NULL;
+	struct uvcg_frame *uframe = NULL;
+
+	if (uvc->streamon) {
+		if (fsize->index >= 1)
+			return -EINVAL;
+
+		uformat = video->cur_format;
+		uframe = video->cur_frame;
+	} else {
+		uformat = find_format_by_pix(uvc, fsize->pixel_format);
+		if (!uformat)
+			return -EINVAL;
+
+		if (fsize->index >= uformat->num_frames)
+			return -EINVAL;
+
+		uframe = find_frame_by_index(uvc, uformat, fsize->index + 1);
+		if (!uframe)
+			return -EINVAL;
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	fsize->discrete.width = uframe->frame.w_width;
+	fsize->discrete.height = uframe->frame.w_height;
+
+	return 0;
+}
+
+static int
+uvc_v4l2_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
+	struct uvc_format_desc *fmtdesc;
+	struct uvcg_format *uformat;
+
+	if (uvc->streamon) {
+		if (f->index >= 1)
+			return -EINVAL;
+
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
+
+	if (uformat->type != UVCG_UNCOMPRESSED)
+		f->flags |= V4L2_FMT_FLAG_COMPRESSED;
+
+	fmtdesc = to_uvc_format(uformat);
+	f->pixelformat = fmtdesc->fcc;
+
+	strscpy(f->description, fmtdesc->name, sizeof(f->description));
+	f->description[strlen(fmtdesc->name) - 1] = 0;
+
+	return 0;
+}
+
 static int
 uvc_v4l2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *b)
 {
@@ -298,8 +560,12 @@ uvc_v4l2_ioctl_default(struct file *file, void *fh, bool valid_prio,
 
 const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
 	.vidioc_querycap = uvc_v4l2_querycap,
+	.vidioc_try_fmt_vid_out = uvc_v4l2_try_set_fmt,
 	.vidioc_g_fmt_vid_out = uvc_v4l2_get_format,
-	.vidioc_s_fmt_vid_out = uvc_v4l2_set_format,
+	.vidioc_s_fmt_vid_out = uvc_v4l2_try_set_fmt,
+	.vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
+	.vidioc_enum_framesizes = uvc_v4l2_enum_framesizes,
+	.vidioc_enum_fmt_vid_out = uvc_v4l2_enum_fmt,
 	.vidioc_reqbufs = uvc_v4l2_reqbufs,
 	.vidioc_querybuf = uvc_v4l2_querybuf,
 	.vidioc_qbuf = uvc_v4l2_qbuf,
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

