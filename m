Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEB445B3BA0
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 17:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbiIIPOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 11:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbiIIPOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 11:14:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705272ED77
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 08:14:33 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWfiC-0002D8-9K; Fri, 09 Sep 2022 17:14:32 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWfiB-00077g-P0; Fri, 09 Sep 2022 17:14:31 +0200
Date:   Fri, 9 Sep 2022 17:14:31 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v13 5/6] usb: gadget: uvc: add VIDIOC hostside config
 feedback
Message-ID: <20220909151431.GC10416@pengutronix.de>
References: <20220908194750.3750310-1-m.grzeschik@pengutronix.de>
 <20220908194750.3750310-6-m.grzeschik@pengutronix.de>
 <eec615de-b44e-c34b-4d7a-0bcc0258af25@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline
In-Reply-To: <eec615de-b44e-c34b-4d7a-0bcc0258af25@ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
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


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2022 at 12:00:45PM +0100, Dan Scally wrote:
>Hello Michael - thanks for the set
>
>On 08/09/2022 20:47, Michael Grzeschik wrote:
>>This patch extends the v4l2 VIDIOCs for enum_format, enum_framesizes,
>>enum_frameintervals and set_fmt. The active host side configuration is
>>reported in these v4l2 interface functions. So the enum functions will
>>on set configuration return the currently set format/frmae/interval.
>>The set_format function has changed to be an noop since there is
>>no point for the kernel to set the currently decided format.
>>
>>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>
>I actually get problems in uvc-gadget with this patch applied, when I=20
>call v4l2-ctl --stream-mmap on the host side then on the gadget I get:
>
>
>/dev/video8: unable to queue buffer index 1/4 (22)
>[ =A0336.655157] vb2-v4l2: [00000000ba5171ac] vb2_fill_vb2_v4l2_buffer:=20
>plane parameters verification failed: -22
>
>
>And the reason for that verification failure is a mismatch in=20
>__verify_length() between length which is 460800 and b->bytesused=20
>which is 1843200. I set the format with v4l2-ctl --set-fmt-video=20
>width=3D1280,height=3D720,pixelformat=3DYUYV so I'm expecting a size of=20
>1843200. I'm setting the dwMaxVideoFrameBufferSize for that format to=20
>1843200, so that setting doesn't seem to be reflected everywhere it=20
>should be.

This is odd. I will look into this. For now, I am unsure where this
comes from.

I will work on patches 5/6 and 6/6 in a separate series. After this
series split, we can keep discussing solely about this new series in
question.

Thanks,
Michael

>>---
>>v1 -> v2:
>>    - fixed indentation of find_frame/format_by_index
>>    - fixed function name find_frm_by_size to find_frame_by_size
>>    - fixed indentation of _uvc_v4l2_try_fmt
>>    - fixed indentation in uvc_v4l2_enum_frameintervals
>>    - removed unneeded declaration of uvc_v4l2_get_bytesperline in uvc_v4=
l2.h
>>    - checked return values on config_group_find_item, handling refcount
>>    - fixed sizeof using variables instead of types
>>    - removed unsused def_format variable
>>    - wrting grp, hdr, fmt and frm in full
>>    - added proper ival handling
>>    - removed analyze_configfs function
>>    - added linked list of frames to uvcg_format
>>    - added functon find_frame_by_index
>>v2 -> v3:
>>    - fixed usage of u_uvc.h
>>    - removed unused variable i in _try_fmt
>>    - made uvc_v4l2_get_bytesperline static
>>v3 -> v4:
>>    - conditionally return current or all frames/formats/frameintervals o=
n enum
>>    - dropped setting format and frame with set_format
>>    - combined try and set format function to one call
>>v4 -> v5:
>>    - fixed uninitialized return values reported by kernel test robot
>>    - added local video variable to uvc_v4l2_enum_frameintervals
>>v5 -> v6:
>>    -
>>v6 -> v7:
>>    - fixed unlocking in f_uvc uvc_alloc function
>>    - add uvc_get_frame_size function for sizeimage calculation
>>    - add fallback to frame.dw_max_video_frame_buffer_size
>>v7 -> v12:
>>    - moved the enum callbacks to a separate patch
>>    - rephrased the commit message
>>v7 -> v13:
>>    - moved the try_format callback to a separate patch
>>
>>  drivers/usb/gadget/function/f_uvc.c     |   4 +
>>  drivers/usb/gadget/function/uvc.h       |  20 +++-
>>  drivers/usb/gadget/function/uvc_queue.c |   2 +-
>>  drivers/usb/gadget/function/uvc_v4l2.c  | 117 ++++++++++++------------
>>  drivers/usb/gadget/function/uvc_video.c |  61 +++++++++++-
>>  5 files changed, 132 insertions(+), 72 deletions(-)
>>
>>diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fun=
ction/f_uvc.c
>>index 7c416170b499e0..6f1138e819bdbf 100644
>>--- a/drivers/usb/gadget/function/f_uvc.c
>>+++ b/drivers/usb/gadget/function/f_uvc.c
>>@@ -327,6 +327,8 @@ uvc_function_set_alt(struct usb_function *f, unsigned=
 interface, unsigned alt)
>>  		if (uvc->video.ep)
>>  			usb_ep_disable(uvc->video.ep);
>>+		uvc->streamon =3D 0;
>>+
>>  		memset(&v4l2_event, 0, sizeof(v4l2_event));
>>  		v4l2_event.type =3D UVC_EVENT_STREAMOFF;
>>  		v4l2_event_queue(&uvc->vdev, &v4l2_event);
>>@@ -350,6 +352,8 @@ uvc_function_set_alt(struct usb_function *f, unsigned=
 interface, unsigned alt)
>>  			return ret;
>>  		usb_ep_enable(uvc->video.ep);
>>+		uvc->streamon =3D 1;
>>+
>>  		memset(&v4l2_event, 0, sizeof(v4l2_event));
>>  		v4l2_event.type =3D UVC_EVENT_STREAMON;
>>  		v4l2_event_queue(&uvc->vdev, &v4l2_event);
>>diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/funct=
ion/uvc.h
>>index 641cf2e7afaf6e..d32f34a7dbc423 100644
>>--- a/drivers/usb/gadget/function/uvc.h
>>+++ b/drivers/usb/gadget/function/uvc.h
>>@@ -90,11 +90,10 @@ struct uvc_video {
>>  	struct work_struct pump;
>>  	/* Frame parameters */
>>-	u8 bpp;
>>-	u32 fcc;
>>-	unsigned int width;
>>-	unsigned int height;
>>-	unsigned int imagesize;
>>+	struct uvcg_format *cur_format;
>>+	struct uvcg_frame *cur_frame;
>>+	unsigned int cur_ival;
>>+
>>  	struct mutex mutex;	/* protects frame parameters */
>>  	unsigned int uvc_num_requests;
>>@@ -144,6 +143,8 @@ struct uvc_device {
>>  		const struct uvc_descriptor_header * const *ss_streaming;
>>  	} desc;
>>+	bool streamon;
>>+
>>  	unsigned int control_intf;
>>  	struct usb_ep *control_ep;
>>  	struct usb_request *control_req;
>>@@ -180,4 +181,13 @@ extern void uvc_endpoint_stream(struct uvc_device *d=
ev);
>>  extern void uvc_function_connect(struct uvc_device *uvc);
>>  extern void uvc_function_disconnect(struct uvc_device *uvc);
>>+extern int uvc_get_frame_size(struct uvcg_format *uformat,
>>+		       struct uvcg_frame *uframe);
>>+
>>+extern struct uvcg_format *find_format_by_index(struct uvc_device *uvc,
>>+						int index);
>>+extern struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
>>+					      struct uvcg_format *uformat,
>>+					      int index);
>>+
>>  #endif /* _UVC_GADGET_H_ */
>>diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget=
/function/uvc_queue.c
>>index ec500ee499eed1..3353d0566a59d5 100644
>>--- a/drivers/usb/gadget/function/uvc_queue.c
>>+++ b/drivers/usb/gadget/function/uvc_queue.c
>>@@ -52,7 +52,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>>  	*nplanes =3D 1;
>>-	sizes[0] =3D video->imagesize;
>>+	sizes[0] =3D uvc_get_frame_size(video->cur_format, video->cur_frame);
>>  	req_size =3D video->ep->maxpacket
>>  		 * max_t(unsigned int, video->ep->maxburst, 1)
>>diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/=
function/uvc_v4l2.c
>>index 761bc833d1e54f..bc5e2076c6b7e4 100644
>>--- a/drivers/usb/gadget/function/uvc_v4l2.c
>>+++ b/drivers/usb/gadget/function/uvc_v4l2.c
>>@@ -199,16 +199,6 @@ uvc_send_response(struct uvc_device *uvc, struct uvc=
_request_data *data)
>>   * V4L2 ioctls
>>   */
>>-struct uvc_format {
>>-	u8 bpp;
>>-	u32 fcc;
>>-};
>>-
>>-static struct uvc_format uvc_formats[] =3D {
>>-	{ 16, V4L2_PIX_FMT_YUYV  },
>>-	{ 0,  V4L2_PIX_FMT_MJPEG },
>>-};
>>-
>>  static int
>>  uvc_v4l2_querycap(struct file *file, void *fh, struct v4l2_capability *=
cap)
>>  {
>>@@ -229,56 +219,34 @@ uvc_v4l2_get_format(struct file *file, void *fh, st=
ruct v4l2_format *fmt)
>>  	struct video_device *vdev =3D video_devdata(file);
>>  	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>>  	struct uvc_video *video =3D &uvc->video;
>>+	struct uvc_format_desc *fmtdesc;
>>-	fmt->fmt.pix.pixelformat =3D video->fcc;
>>-	fmt->fmt.pix.width =3D video->width;
>>-	fmt->fmt.pix.height =3D video->height;
>>+	fmtdesc =3D to_uvc_format(video->cur_format);
>>+
>>+	fmt->fmt.pix.pixelformat =3D fmtdesc->fcc;
>>+	fmt->fmt.pix.width =3D video->cur_frame->frame.w_width;
>>+	fmt->fmt.pix.height =3D video->cur_frame->frame.w_height;
>>  	fmt->fmt.pix.field =3D V4L2_FIELD_NONE;
>>-	fmt->fmt.pix.bytesperline =3D video->bpp * video->width / 8;
>>-	fmt->fmt.pix.sizeimage =3D video->imagesize;
>>+	fmt->fmt.pix.bytesperline =3D uvc_v4l2_get_bytesperline(video->cur_form=
at,
>>+							      video->cur_frame);
>>+	fmt->fmt.pix.sizeimage =3D uvc_get_frame_size(video->cur_format,
>>+						    video->cur_frame);
>>  	fmt->fmt.pix.colorspace =3D V4L2_COLORSPACE_SRGB;
>>  	fmt->fmt.pix.priv =3D 0;
>>  	return 0;
>>  }
>>+/* set_format is only allowed by the host side, so this is a noop */
>>  static int
>>  uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fm=
t)
>>  {
>>  	struct video_device *vdev =3D video_devdata(file);
>>  	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>>  	struct uvc_video *video =3D &uvc->video;
>>-	struct uvc_format *format;
>>-	unsigned int imagesize;
>>-	unsigned int bpl;
>>-	unsigned int i;
>>-
>>-	for (i =3D 0; i < ARRAY_SIZE(uvc_formats); ++i) {
>>-		format =3D &uvc_formats[i];
>>-		if (format->fcc =3D=3D fmt->fmt.pix.pixelformat)
>>-			break;
>>-	}
>>-	if (i =3D=3D ARRAY_SIZE(uvc_formats)) {
>>-		uvcg_info(&uvc->func, "Unsupported format 0x%08x.\n",
>>-			  fmt->fmt.pix.pixelformat);
>>+	if (fmt->type !=3D video->queue.queue.type)
>>  		return -EINVAL;
>>-	}
>>-
>>-	bpl =3D format->bpp * fmt->fmt.pix.width / 8;
>>-	imagesize =3D bpl ? bpl * fmt->fmt.pix.height : fmt->fmt.pix.sizeimage;
>>-
>>-	video->fcc =3D format->fcc;
>>-	video->bpp =3D format->bpp;
>>-	video->width =3D fmt->fmt.pix.width;
>>-	video->height =3D fmt->fmt.pix.height;
>>-	video->imagesize =3D imagesize;
>>-
>>-	fmt->fmt.pix.field =3D V4L2_FIELD_NONE;
>>-	fmt->fmt.pix.bytesperline =3D bpl;
>>-	fmt->fmt.pix.sizeimage =3D imagesize;
>>-	fmt->fmt.pix.colorspace =3D V4L2_COLORSPACE_SRGB;
>>-	fmt->fmt.pix.priv =3D 0;
>>  	return 0;
>>  }
>>@@ -329,6 +297,7 @@ uvc_v4l2_enum_frameintervals(struct file *file, void =
*fh,
>>  {
>>  	struct video_device *vdev =3D video_devdata(file);
>>  	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>>+	struct uvc_video *video =3D &uvc->video;
>>  	struct uvcg_format *uformat =3D NULL;
>>  	struct uvcg_frame *uframe =3D NULL;
>>  	struct uvcg_frame_ptr *frame;
>>@@ -347,11 +316,19 @@ uvc_v4l2_enum_frameintervals(struct file *file, voi=
d *fh,
>>  	if (!uframe)
>>  		return -EINVAL;
>>-	if (fival->index >=3D uframe->frame.b_frame_interval_type)
>>-		return -EINVAL;
>>+	if (uvc->streamon) {
>>+		if (fival->index >=3D 1)
>>+			return -EINVAL;
>>-	fival->discrete.numerator =3D
>>-		uframe->dw_frame_interval[fival->index];
>>+		fival->discrete.numerator =3D
>>+			uframe->dw_frame_interval[video->cur_ival - 1];
>>+	} else {
>>+		if (fival->index >=3D uframe->frame.b_frame_interval_type)
>>+			return -EINVAL;
>>+
>>+		fival->discrete.numerator =3D
>>+			uframe->dw_frame_interval[fival->index];
>>+	}
>>  	/* TODO: handle V4L2_FRMIVAL_TYPE_STEPWISE */
>>  	fival->type =3D V4L2_FRMIVAL_TYPE_DISCRETE;
>>@@ -368,19 +345,28 @@ uvc_v4l2_enum_framesizes(struct file *file, void *f=
h,
>>  {
>>  	struct video_device *vdev =3D video_devdata(file);
>>  	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>>+	struct uvc_video *video =3D &uvc->video;
>>  	struct uvcg_format *uformat =3D NULL;
>>  	struct uvcg_frame *uframe =3D NULL;
>>-	uformat =3D find_format_by_pix(uvc, fsize->pixel_format);
>>-	if (!uformat)
>>-		return -EINVAL;
>>+	if (uvc->streamon) {
>>+		if (fsize->index >=3D 1)
>>+			return -EINVAL;
>>-	if (fsize->index >=3D uformat->num_frames)
>>-		return -EINVAL;
>>+		uformat =3D video->cur_format;
>>+		uframe =3D video->cur_frame;
>>+	} else {
>>+		uformat =3D find_format_by_pix(uvc, fsize->pixel_format);
>>+		if (!uformat)
>>+			return -EINVAL;
>>-	uframe =3D find_frame_by_index(uvc, uformat, fsize->index + 1);
>>-	if (!uframe)
>>-		return -EINVAL;
>>+		if (fsize->index >=3D uformat->num_frames)
>>+			return -EINVAL;
>>+
>>+		uframe =3D find_frame_by_index(uvc, uformat, fsize->index + 1);
>>+		if (!uframe)
>>+			return -EINVAL;
>>+	}
>>  	fsize->type =3D V4L2_FRMSIZE_TYPE_DISCRETE;
>>  	fsize->discrete.width =3D uframe->frame.w_width;
>>@@ -394,15 +380,24 @@ uvc_v4l2_enum_format(struct file *file, void *fh, s=
truct v4l2_fmtdesc *f)
>>  {
>>  	struct video_device *vdev =3D video_devdata(file);
>>  	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>>+	struct uvc_video *video =3D &uvc->video;
>>  	struct uvc_format_desc *fmtdesc;
>>  	struct uvcg_format *uformat;
>>-	if (f->index >=3D uvc->header->num_fmt)
>>-		return -EINVAL;
>>+	if (uvc->streamon) {
>>+		if (f->index >=3D 1)
>>+			return -EINVAL;
>>-	uformat =3D find_format_by_index(uvc, f->index + 1);
>>-	if (!uformat)
>>-		return -EINVAL;
>>+		uformat =3D video->cur_format;
>>+	} else {
>>+		if (f->index >=3D uvc->header->num_fmt)
>>+			return -EINVAL;
>>+
>>+		uformat =3D find_format_by_index(uvc, f->index + 1);
>>+		if (!uformat)
>>+			return -EINVAL;
>>+
>>+	}
>>  	if (uformat->type !=3D UVCG_UNCOMPRESSED)
>>  		f->flags |=3D V4L2_FMT_FLAG_COMPRESSED;
>>diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget=
/function/uvc_video.c
>>index c00ce0e91f5d5c..37867c93073418 100644
>>--- a/drivers/usb/gadget/function/uvc_video.c
>>+++ b/drivers/usb/gadget/function/uvc_video.c
>>@@ -19,6 +19,7 @@
>>  #include "uvc.h"
>>  #include "uvc_queue.h"
>>  #include "uvc_video.h"
>>+#include "uvc_configfs.h"
>>  /* --------------------------------------------------------------------=
------
>>   * Video codecs
>>@@ -490,21 +491,71 @@ int uvcg_video_enable(struct uvc_video *video, int =
enable)
>>  	return ret;
>>  }
>>+static int uvc_frame_default(struct uvcg_format *uformat)
>>+{
>>+	struct uvcg_uncompressed *u;
>>+	struct uvcg_mjpeg *m;
>>+
>>+	switch (uformat->type) {
>>+	case UVCG_UNCOMPRESSED:
>>+		u =3D to_uvcg_uncompressed(&uformat->group.cg_item);
>>+		if (u)
>>+			return u->desc.bDefaultFrameIndex;
>>+		break;
>>+	case UVCG_MJPEG:
>>+		m =3D to_uvcg_mjpeg(&uformat->group.cg_item);
>>+		if (m)
>>+			return m->desc.bDefaultFrameIndex;
>>+		break;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int uvc_default_frame_interval(struct uvc_video *video)
>>+{
>>+	int i;
>>+
>>+	for (i =3D 0; i < video->cur_frame->frame.b_frame_interval_type; i++) {
>>+		if (video->cur_frame->frame.dw_default_frame_interval =3D=3D
>>+			video->cur_frame->dw_frame_interval[i]) {
>>+			video->cur_ival =3D i + 1;
>>+			return i + 1;
>>+		}
>>+	}
>>+
>>+	/* fallback */
>>+	return 1;
>>+}
>>+
>>  /*
>>   * Initialize the UVC video stream.
>>   */
>>  int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>>  {
>>+	int iframe;
>>+
>>  	INIT_LIST_HEAD(&video->req_free);
>>  	spin_lock_init(&video->req_lock);
>>  	INIT_WORK(&video->pump, uvcg_video_pump);
>>+	if (list_empty(&uvc->header->formats))
>>+		return -EINVAL;
>>+
>>  	video->uvc =3D uvc;
>>-	video->fcc =3D V4L2_PIX_FMT_YUYV;
>>-	video->bpp =3D 16;
>>-	video->width =3D 320;
>>-	video->height =3D 240;
>>-	video->imagesize =3D 320 * 240 * 2;
>>+	video->cur_format =3D find_format_by_index(uvc, 1);
>>+	if (!video->cur_format)
>>+		return -EINVAL;
>>+
>>+	iframe =3D uvc_frame_default(video->cur_format);
>>+	if (!iframe)
>>+		return -EINVAL;
>>+
>>+	video->cur_frame =3D find_frame_by_index(uvc, video->cur_format, iframe=
);
>>+	if (!video->cur_frame)
>>+		return -EINVAL;
>>+
>>+	video->cur_ival =3D uvc_default_frame_interval(video);
>>  	/* Initialize the video buffers queue. */
>>  	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmMbWFcACgkQC+njFXoe
LGSHfBAAkKGCjrDfeDeH2f3Q+W8OXVWh31Q9IOKnFoIizvZPW3ecaCjt+DJyw8pG
fIGWtwjkfVf6tSgxDOY7MdTBLzHZs5KvyyB1Cj98ry6sP9mAqp0+K5FiSCaXs030
RVm0iDb7DOn3d47yVgXtpe2ItcupyjSEt0U0bCYMslyy2P5ukVSosPtafvoXAFxU
q4Vcry7rW6CgeyjioYaEhM3PniYWLbo1xYQS8xfVZEtZFfJKkTg51xz2yYldoBYx
ONbHlqBxtJiAmGORH+EtPUL94T4/BBQO/CgAwX3Edi5ukuOWTtbjAjeTfQDnQ0S6
5f0+nYMgLgMu/UcsvLHXxl5j7WlB08ad4rWKdCu9yRYxwG42zCQn67r0B9pYKX6h
2/MzIV73o8uCtXUh81ylF+JB5/Qv3Hvwdj3WDvX1R5aGqRN0SqNdhZySMKfafLO/
1vstbTHMYa+RZ3GkDBMRef3VgRBNki+43WRqH047trp2DKl9mnaTwoBETVELmA+b
UBilFOfhis2MosIeWm+FQWVtDgYOsg7MVFuaBfKiYuOJKWoLEz/0wUGDug6UEbtc
d0JHBE/wnyLOjfyiuH2m9c51ph/HgLQkQjHRlDqjS09SMbNEQcWhvWtWWFuPz+PJ
vi7KOAxz5FFFbbvDyKnqJFNUIPjn2VOMtUN5OyYMqoclIMbK72w=
=Kw0y
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--
