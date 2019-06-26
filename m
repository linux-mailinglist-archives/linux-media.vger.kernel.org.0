Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFDB956600
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 11:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbfFZJ6I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 05:58:08 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36491 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725379AbfFZJ6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 05:58:08 -0400
Received: from [IPv6:2001:420:44c1:2579:95e:6256:39de:52a6] ([IPv6:2001:420:44c1:2579:95e:6256:39de:52a6])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g4gkhWJg4SfvXg4gnhK3xq; Wed, 26 Jun 2019 11:58:05 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] drivers/media: don't set pix->priv = 0
Message-ID: <2269be5f-c57a-a63b-9603-63e02de6767e@xs4all.nl>
Date:   Wed, 26 Jun 2019 11:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBTR5mITZKXA4J6N7lWNtD8sjUJy1eUCtbt6/PKsteWuRqVx5twv/iFGKyo9EVTruyMAvitdQfDn3Q8TaW2ws0B5SXXQ5WMUDh/sMGE33t6OJAIXd4q7
 +TYOK7SpDXsy5A3Vfli3LvPtmtqjSZFFeMLrfx64EjAOYm0g33XZx4UHgTIn82jHeWwOE/RjkBCwSFWzlDbKvdpyLLiU+YRJPTuQ4Qzp9iW1JPHIgEncK60Y
 b8dxwnfNigMcFyEIEtbWTAMrIfjnrRbdjAETTttvdu+KDy9QD9lV9u2XrovoepGdIKwUUp9oU0UkaRZdnOls8oGwWkhrT/i7+ujqmXUJRhGYLfOynvfbklCQ
 VP4tZcP1QDSl+gp0MVBYCkEWJKS83w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The priv field of struct v4l2_pix_format shouldn't be set by drivers,
it's set by the v4l2 core instead to V4L2_PIX_FMT_PRIV_MAGIC.

Drop this from the few media drivers that still do this.

Note that the gspca patch is slightly more involved since some of the
sub-gspca drivers use the priv field internally.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index 39dabd4da60f..c8cd4c407540 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -788,7 +788,6 @@ static int cobalt_try_fmt_vid_cap(struct file *file, void *priv_fh,

 	pix->sizeimage = pix->bytesperline * pix->height;
 	pix->field = V4L2_FIELD_NONE;
-	pix->priv = 0;

 	return 0;
 }
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 609100a46ff8..88e0cb0bf592 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -886,7 +886,6 @@ static int solo_enc_try_fmt_cap(struct file *file, void *priv,
 	pix->colorspace = V4L2_COLORSPACE_SMPTE170M;
 	pix->sizeimage = FRAME_BUF_SIZE;
 	pix->bytesperline = 0;
-	pix->priv = 0;

 	return 0;
 }
@@ -941,7 +940,6 @@ static int solo_enc_get_fmt_cap(struct file *file, void *priv,
 		     V4L2_FIELD_NONE;
 	pix->sizeimage = FRAME_BUF_SIZE;
 	pix->colorspace = V4L2_COLORSPACE_SMPTE170M;
-	pix->priv = 0;

 	return 0;
 }
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
index a968f75920b5..a670fe8e4f9c 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
@@ -479,7 +479,6 @@ static int solo_try_fmt_cap(struct file *file, void *priv,
 	pix->field = V4L2_FIELD_INTERLACED;
 	pix->pixelformat = V4L2_PIX_FMT_UYVY;
 	pix->colorspace = V4L2_COLORSPACE_SMPTE170M;
-	pix->priv = 0;
 	return 0;
 }

@@ -509,7 +508,6 @@ static int solo_get_fmt_cap(struct file *file, void *priv,
 	pix->sizeimage = solo_image_size(solo_dev);
 	pix->colorspace = V4L2_COLORSPACE_SMPTE170M;
 	pix->bytesperline = solo_bytesperline(solo_dev);
-	pix->priv = 0;

 	return 0;
 }
diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 8e0952d65ad4..d0c2ec70f9cd 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -592,7 +592,6 @@ static int tw68_g_fmt_vid_cap(struct file *file, void *priv,
 	f->fmt.pix.sizeimage =
 		f->fmt.pix.height * f->fmt.pix.bytesperline;
 	f->fmt.pix.colorspace	= V4L2_COLORSPACE_SMPTE170M;
-	f->fmt.pix.priv = 0;
 	return 0;
 }

diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index f0f7ef638c56..21a2ba797d0a 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -979,7 +979,6 @@ static int vpif_try_fmt_vid_cap(struct file *file, void *priv,
 		pixfmt->bytesperline = common->fmt.fmt.pix.width * 2;
 		pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
 	}
-	pixfmt->priv = 0;

 	dev_dbg(vpif_dev, "%s: %d x %d; pitch=%d pixelformat=0x%08x, field=%d, size=%d\n", __func__,
 		pixfmt->width, pixfmt->height,
diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 5e00019bce8a..37acfcb56822 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -1153,7 +1153,6 @@ static int au0828_set_format(struct au0828_dev *dev, unsigned int cmd,
 	format->fmt.pix.sizeimage = width * height * 2;
 	format->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
 	format->fmt.pix.field = V4L2_FIELD_INTERLACED;
-	format->fmt.pix.priv = 0;

 	if (cmd == VIDIOC_TRY_FMT)
 		return 0;
@@ -1231,7 +1230,6 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	f->fmt.pix.sizeimage = dev->frame_size;
 	f->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M; /* NTSC/PAL */
 	f->fmt.pix.field = V4L2_FIELD_INTERLACED;
-	f->fmt.pix.priv = 0;
 	return 0;
 }

diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
index 0feae825cebb..9232461669c8 100644
--- a/drivers/media/usb/cpia2/cpia2_v4l.c
+++ b/drivers/media/usb/cpia2/cpia2_v4l.c
@@ -338,7 +338,6 @@ static int cpia2_try_fmt_vid_cap(struct file *file, void *fh,
 	f->fmt.pix.bytesperline = 0;
 	f->fmt.pix.sizeimage = cam->frame_size;
 	f->fmt.pix.colorspace = V4L2_COLORSPACE_JPEG;
-	f->fmt.pix.priv = 0;

 	switch (cpia2_match_video_size(f->fmt.pix.width, f->fmt.pix.height)) {
 	case VIDEOSIZE_VGA:
@@ -449,7 +448,6 @@ static int cpia2_g_fmt_vid_cap(struct file *file, void *fh,
 	f->fmt.pix.bytesperline = 0;
 	f->fmt.pix.sizeimage = cam->frame_size;
 	f->fmt.pix.colorspace = V4L2_COLORSPACE_JPEG;
-	f->fmt.pix.priv = 0;

 	return 0;
 }
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 0512e1959394..9a6956813259 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1517,7 +1517,6 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	else
 		f->fmt.pix.field = v4l2->interlaced_fieldmode ?
 			   V4L2_FIELD_INTERLACED : V4L2_FIELD_TOP;
-	f->fmt.pix.priv = 0;

 	return 0;
 }
diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index be11f7830bca..072d280c1824 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1040,11 +1040,11 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 			    struct v4l2_format *fmt)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
+	u32 priv = fmt->fmt.pix.priv;

 	fmt->fmt.pix = gspca_dev->pixfmt;
-	/* some drivers use priv internally, zero it before giving it back to
-	   the core */
-	fmt->fmt.pix.priv = 0;
+	/* some drivers use priv internally, so keep the original value */
+	fmt->fmt.pix.priv = priv;
 	return 0;
 }

@@ -1079,9 +1079,6 @@ static int try_fmt_vid_cap(struct gspca_dev *gspca_dev,
 		fmt->fmt.pix.height = h;
 		gspca_dev->sd_desc->try_fmt(gspca_dev, fmt);
 	}
-	/* some drivers use priv internally, zero it before giving it back to
-	   the core */
-	fmt->fmt.pix.priv = 0;
 	return mode;			/* used when s_fmt */
 }

@@ -1090,9 +1087,12 @@ static int vidioc_try_fmt_vid_cap(struct file *file,
 			      struct v4l2_format *fmt)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
+	u32 priv = fmt->fmt.pix.priv;

 	if (try_fmt_vid_cap(gspca_dev, fmt) < 0)
 		return -EINVAL;
+	/* some drivers use priv internally, so keep the original value */
+	fmt->fmt.pix.priv = priv;
 	return 0;
 }

@@ -1100,6 +1100,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 			    struct v4l2_format *fmt)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
+	u32 priv = fmt->fmt.pix.priv;
 	int mode;

 	if (vb2_is_busy(&gspca_dev->queue))
@@ -1115,6 +1116,8 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 		gspca_dev->pixfmt = fmt->fmt.pix;
 	else
 		gspca_dev->pixfmt = gspca_dev->cam.cam_mode[mode];
+	/* some drivers use priv internally, so keep the original value */
+	fmt->fmt.pix.priv = priv;
 	return 0;
 }

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index aa90558479f7..1a5b46c6992b 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -759,7 +759,6 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	f->fmt.pix.bytesperline = f->fmt.pix.width * (vc->fmt->depth >> 3);
 	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
 	f->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
-	f->fmt.pix.priv = 0;
 	return 0;
 }

@@ -811,7 +810,6 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	f->fmt.pix.bytesperline = (f->fmt.pix.width * fmt->depth) >> 3;
 	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
 	f->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
-	f->fmt.pix.priv = 0;
 	dprintk(vc->dev, 50, "%s: set width %d height %d field %d\n", __func__,
 		f->fmt.pix.width, f->fmt.pix.height, f->fmt.pix.field);
 	return 0;
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 203329cadbc4..0335e69b70ab 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -253,7 +253,6 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
 	fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
 	fmt->fmt.pix.colorspace = format->colorspace;
-	fmt->fmt.pix.priv = 0;

 	if (uvc_format != NULL)
 		*uvc_format = format;
@@ -290,7 +289,6 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
 	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
 	fmt->fmt.pix.sizeimage = stream->ctrl.dwMaxVideoFrameSize;
 	fmt->fmt.pix.colorspace = format->colorspace;
-	fmt->fmt.pix.priv = 0;

 done:
 	mutex_unlock(&stream->mutex);
