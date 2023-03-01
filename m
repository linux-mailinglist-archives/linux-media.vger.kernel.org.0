Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A276A6B94
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 12:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjCALTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 06:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjCALTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 06:19:02 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5E7199E3
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 03:18:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3A699B80E05
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8E6C4339B;
        Wed,  1 Mar 2023 11:18:56 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 4/9] vivid: drop overlay support
Date:   Wed,  1 Mar 2023 12:18:45 +0100
Message-Id: <20230301111850.607515-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
References: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Destructive overlay support (i.e. where the video frame is DMA-ed
straight into a framebuffer) is effectively dead. It was a
necessary evil in the early days when computers were not fast enough
to copy SDTV video frames around, but today that's no longer a problem.

It requires access to the framebuffer memory, which is a bad idea and
very hard to do safely. In addition, in drm it is today almost
impossible to get hold of the framebuffer address.

So drop support for this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.c |  48 +---
 drivers/media/test-drivers/vivid/vivid-core.h |  13 -
 .../test-drivers/vivid/vivid-kthread-cap.c    | 108 -------
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 272 ------------------
 .../media/test-drivers/vivid/vivid-vid-cap.h  |   3 -
 5 files changed, 6 insertions(+), 438 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index f28440e6c9f8..31d8c34495cb 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -126,7 +126,7 @@ MODULE_PARM_DESC(node_types, " node types, default is 0xe1d3d. Bitmask with the
 			     "\t\t    bit 8: Video Output node\n"
 			     "\t\t    bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
 			     "\t\t    bit 12: Radio Transmitter node\n"
-			     "\t\t    bit 16: Framebuffer for testing overlays\n"
+			     "\t\t    bit 16: Framebuffer for testing output overlays\n"
 			     "\t\t    bit 17: Metadata Capture node\n"
 			     "\t\t    bit 18: Metadata Output node\n"
 			     "\t\t    bit 19: Touch Capture node\n");
@@ -326,7 +326,7 @@ static int vidioc_overlay(struct file *file, void *fh, unsigned i)
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_overlay(file, fh, i);
+		return -ENOTTY;
 	return vivid_vid_out_overlay(file, fh, i);
 }
 
@@ -335,38 +335,16 @@ static int vidioc_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *a
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_g_fbuf(file, fh, a);
+		return -ENOTTY;
 	return vivid_vid_out_g_fbuf(file, fh, a);
 }
 
-/*
- * Only support the framebuffer of one of the vivid instances.
- * Anything else is rejected.
- */
-bool vivid_validate_fb(const struct v4l2_framebuffer *a)
-{
-	struct vivid_dev *dev;
-	int i;
-
-	for (i = 0; i < n_devs; i++) {
-		dev = vivid_devs[i];
-		if (!dev || !dev->video_pbase)
-			continue;
-		if ((unsigned long)a->base == dev->video_pbase &&
-		    a->fmt.width <= dev->display_width &&
-		    a->fmt.height <= dev->display_height &&
-		    a->fmt.bytesperline <= dev->display_byte_stride)
-			return true;
-	}
-	return false;
-}
-
 static int vidioc_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffer *a)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_s_fbuf(file, fh, a);
+		return -ENOTTY;
 	return vivid_vid_out_s_fbuf(file, fh, a);
 }
 
@@ -651,8 +629,6 @@ static int vivid_fop_release(struct file *file)
 		vivid_reconnect(dev);
 	}
 	mutex_unlock(&dev->mutex);
-	if (file->private_data == dev->overlay_cap_owner)
-		dev->overlay_cap_owner = NULL;
 	if (file->private_data == dev->radio_rx_rds_owner) {
 		dev->radio_rx_rds_last_block = 0;
 		dev->radio_rx_rds_owner = NULL;
@@ -778,10 +754,6 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_g_parm			= vidioc_g_parm,
 	.vidioc_s_parm			= vidioc_s_parm,
 
-	.vidioc_enum_fmt_vid_overlay	= vidioc_enum_fmt_vid_overlay,
-	.vidioc_g_fmt_vid_overlay	= vidioc_g_fmt_vid_overlay,
-	.vidioc_try_fmt_vid_overlay	= vidioc_try_fmt_vid_overlay,
-	.vidioc_s_fmt_vid_overlay	= vidioc_s_fmt_vid_overlay,
 	.vidioc_g_fmt_vid_out_overlay	= vidioc_g_fmt_vid_out_overlay,
 	.vidioc_try_fmt_vid_out_overlay	= vidioc_try_fmt_vid_out_overlay,
 	.vidioc_s_fmt_vid_out_overlay	= vidioc_s_fmt_vid_out_overlay,
@@ -862,7 +834,6 @@ static void vivid_dev_release(struct v4l2_device *v4l2_dev)
 	vfree(dev->scaled_line);
 	vfree(dev->blended_line);
 	vfree(dev->edid);
-	vfree(dev->bitmap_cap);
 	vfree(dev->bitmap_out);
 	tpg_free(&dev->tpg);
 	kfree(dev->query_dv_timings_qmenu);
@@ -1107,7 +1078,7 @@ static void vivid_set_capabilities(struct vivid_dev *dev)
 		/* set up the capabilities of the video capture device */
 		dev->vid_cap_caps = dev->multiplanar ?
 			V4L2_CAP_VIDEO_CAPTURE_MPLANE :
-			V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY;
+			V4L2_CAP_VIDEO_CAPTURE;
 		dev->vid_cap_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
 		if (dev->has_audio_inputs)
 			dev->vid_cap_caps |= V4L2_CAP_AUDIO;
@@ -1396,7 +1367,7 @@ static int vivid_create_queues(struct vivid_dev *dev)
 	}
 
 	if (dev->has_fb) {
-		/* Create framebuffer for testing capture/output overlay */
+		/* Create framebuffer for testing output overlay */
 		ret = vivid_fb_init(dev);
 		if (ret)
 			return ret;
@@ -1892,13 +1863,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	vivid_update_format_cap(dev, false);
 	vivid_update_format_out(dev);
 
-	/* initialize overlay */
-	dev->fb_cap.fmt.width = dev->src_rect.width;
-	dev->fb_cap.fmt.height = dev->src_rect.height;
-	dev->fb_cap.fmt.pixelformat = dev->fmt_cap->fourcc;
-	dev->fb_cap.fmt.bytesperline = dev->src_rect.width * tpg_g_twopixelsize(&dev->tpg, 0) / 2;
-	dev->fb_cap.fmt.sizeimage = dev->src_rect.height * dev->fb_cap.fmt.bytesperline;
-
 	/* update touch configuration */
 	dev->timeperframe_tch_cap.numerator = 1;
 	dev->timeperframe_tch_cap.denominator = 10;
diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index 473f3598db5a..02a75d04ff8a 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -345,17 +345,6 @@ struct vivid_dev {
 
 	u32				power_present;
 
-	/* Capture Overlay */
-	struct v4l2_framebuffer		fb_cap;
-	struct v4l2_fh			*overlay_cap_owner;
-	void				*fb_vbase_cap;
-	int				overlay_cap_top, overlay_cap_left;
-	enum v4l2_field			overlay_cap_field;
-	void				*bitmap_cap;
-	struct v4l2_clip		clips_cap[MAX_CLIPS];
-	struct v4l2_clip		try_clips_cap[MAX_CLIPS];
-	unsigned			clipcount_cap;
-
 	/* Output */
 	unsigned			output;
 	v4l2_std_id			std_out;
@@ -613,6 +602,4 @@ static inline bool vivid_is_hdmi_out(const struct vivid_dev *dev)
 	return dev->output_type[dev->output] == HDMI;
 }
 
-bool vivid_validate_fb(const struct v4l2_framebuffer *a);
-
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index ee65d20314d3..177c73979325 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -554,109 +554,6 @@ static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
 	}
 }
 
-/*
- * Return true if this pixel coordinate is a valid video pixel.
- */
-static bool valid_pix(struct vivid_dev *dev, int win_y, int win_x, int fb_y, int fb_x)
-{
-	int i;
-
-	if (dev->bitmap_cap) {
-		/*
-		 * Only if the corresponding bit in the bitmap is set can
-		 * the video pixel be shown. Coordinates are relative to
-		 * the overlay window set by VIDIOC_S_FMT.
-		 */
-		const u8 *p = dev->bitmap_cap;
-		unsigned stride = (dev->compose_cap.width + 7) / 8;
-
-		if (!(p[stride * win_y + win_x / 8] & (1 << (win_x & 7))))
-			return false;
-	}
-
-	for (i = 0; i < dev->clipcount_cap; i++) {
-		/*
-		 * Only if the framebuffer coordinate is not in any of the
-		 * clip rectangles will be video pixel be shown.
-		 */
-		struct v4l2_rect *r = &dev->clips_cap[i].c;
-
-		if (fb_y >= r->top && fb_y < r->top + r->height &&
-		    fb_x >= r->left && fb_x < r->left + r->width)
-			return false;
-	}
-	return true;
-}
-
-/*
- * Draw the image into the overlay buffer.
- * Note that the combination of overlay and multiplanar is not supported.
- */
-static void vivid_overlay(struct vivid_dev *dev, struct vivid_buffer *buf)
-{
-	struct tpg_data *tpg = &dev->tpg;
-	unsigned pixsize = tpg_g_twopixelsize(tpg, 0) / 2;
-	void *vbase = dev->fb_vbase_cap;
-	void *vbuf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
-	unsigned img_width = dev->compose_cap.width;
-	unsigned img_height = dev->compose_cap.height;
-	unsigned stride = tpg->bytesperline[0];
-	/* if quick is true, then valid_pix() doesn't have to be called */
-	bool quick = dev->bitmap_cap == NULL && dev->clipcount_cap == 0;
-	int x, y, w, out_x = 0;
-
-	/*
-	 * Overlay support is only supported for formats that have a twopixelsize
-	 * that's >= 2. Warn and bail out if that's not the case.
-	 */
-	if (WARN_ON(pixsize == 0))
-		return;
-	if ((dev->overlay_cap_field == V4L2_FIELD_TOP ||
-	     dev->overlay_cap_field == V4L2_FIELD_BOTTOM) &&
-	    dev->overlay_cap_field != buf->vb.field)
-		return;
-
-	vbuf += dev->compose_cap.left * pixsize + dev->compose_cap.top * stride;
-	x = dev->overlay_cap_left;
-	w = img_width;
-	if (x < 0) {
-		out_x = -x;
-		w = w - out_x;
-		x = 0;
-	} else {
-		w = dev->fb_cap.fmt.width - x;
-		if (w > img_width)
-			w = img_width;
-	}
-	if (w <= 0)
-		return;
-	if (dev->overlay_cap_top >= 0)
-		vbase += dev->overlay_cap_top * dev->fb_cap.fmt.bytesperline;
-	for (y = dev->overlay_cap_top;
-	     y < dev->overlay_cap_top + (int)img_height;
-	     y++, vbuf += stride) {
-		int px;
-
-		if (y < 0 || y > dev->fb_cap.fmt.height)
-			continue;
-		if (quick) {
-			memcpy(vbase + x * pixsize,
-			       vbuf + out_x * pixsize, w * pixsize);
-			vbase += dev->fb_cap.fmt.bytesperline;
-			continue;
-		}
-		for (px = 0; px < w; px++) {
-			if (!valid_pix(dev, y - dev->overlay_cap_top,
-				       px + out_x, y, px + x))
-				continue;
-			memcpy(vbase + (px + x) * pixsize,
-			       vbuf + (px + out_x) * pixsize,
-			       pixsize);
-		}
-		vbase += dev->fb_cap.fmt.bytesperline;
-	}
-}
-
 static void vivid_cap_update_frame_period(struct vivid_dev *dev)
 {
 	u64 f_period;
@@ -730,11 +627,6 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
 		dprintk(dev, 1, "filled buffer %d\n",
 			vid_cap_buf->vb.vb2_buf.index);
 
-		/* Handle overlay */
-		if (dev->overlay_cap_owner && dev->fb_cap.base &&
-			dev->fb_cap.fmt.pixelformat == dev->fmt_cap->fourcc)
-			vivid_overlay(dev, vid_cap_buf);
-
 		v4l2_ctrl_request_complete(vid_cap_buf->vb.vb2_buf.req_obj.req,
 					   &dev->ctrl_hdl_vid_cap);
 		vb2_buffer_done(&vid_cap_buf->vb.vb2_buf, dev->dqbuf_error ?
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index c0999581c599..801286dc1448 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -21,30 +21,6 @@
 #include "vivid-kthread-cap.h"
 #include "vivid-vid-cap.h"
 
-static const struct vivid_fmt formats_ovl[] = {
-	{
-		.fourcc   = V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
-		.vdownsampling = { 1 },
-		.bit_depth = { 16 },
-		.planes   = 1,
-		.buffers = 1,
-	},
-	{
-		.fourcc   = V4L2_PIX_FMT_XRGB555, /* gggbbbbb arrrrrgg */
-		.vdownsampling = { 1 },
-		.bit_depth = { 16 },
-		.planes   = 1,
-		.buffers = 1,
-	},
-	{
-		.fourcc   = V4L2_PIX_FMT_ARGB555, /* gggbbbbb arrrrrgg */
-		.vdownsampling = { 1 },
-		.bit_depth = { 16 },
-		.planes   = 1,
-		.buffers = 1,
-	},
-};
-
 /* The number of discrete webcam framesizes */
 #define VIVID_WEBCAM_SIZES 6
 /* The number of discrete webcam frameintervals */
@@ -447,18 +423,10 @@ void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 		tpg_s_rgb_range(&dev->tpg, v4l2_ctrl_g_ctrl(dev->rgb_range_cap));
 		break;
 	}
-	vfree(dev->bitmap_cap);
-	dev->bitmap_cap = NULL;
 	vivid_update_quality(dev);
 	tpg_reset_source(&dev->tpg, dev->src_rect.width, dev->src_rect.height, dev->field_cap);
 	dev->crop_cap = dev->src_rect;
 	dev->crop_bounds_cap = dev->src_rect;
-	if (dev->bitmap_cap &&
-	    (dev->compose_cap.width != dev->crop_cap.width ||
-	     dev->compose_cap.height != dev->crop_cap.height)) {
-		vfree(dev->bitmap_cap);
-		dev->bitmap_cap = NULL;
-	}
 	dev->compose_cap = dev->crop_cap;
 	if (V4L2_FIELD_HAS_T_OR_B(dev->field_cap))
 		dev->compose_cap.height /= 2;
@@ -701,11 +669,6 @@ int vivid_s_fmt_vid_cap(struct file *file, void *priv,
 		return -EBUSY;
 	}
 
-	if (dev->overlay_cap_owner && dev->fb_cap.fmt.pixelformat != mp->pixelformat) {
-		dprintk(dev, 1, "overlay is active, can't change pixelformat\n");
-		return -EBUSY;
-	}
-
 	dev->fmt_cap = vivid_get_format(dev, mp->pixelformat);
 	if (V4L2_FIELD_HAS_T_OR_B(mp->field))
 		factor = 2;
@@ -927,8 +890,6 @@ int vivid_vid_cap_s_selection(struct file *file, void *fh, struct v4l2_selection
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_rect *crop = &dev->crop_cap;
 	struct v4l2_rect *compose = &dev->compose_cap;
-	unsigned orig_compose_w = compose->width;
-	unsigned orig_compose_h = compose->height;
 	unsigned factor = V4L2_FIELD_HAS_T_OR_B(dev->field_cap) ? 2 : 1;
 	int ret;
 
@@ -1052,11 +1013,6 @@ int vivid_vid_cap_s_selection(struct file *file, void *fh, struct v4l2_selection
 		return -EINVAL;
 	}
 
-	if (dev->bitmap_cap && (compose->width != orig_compose_w ||
-				compose->height != orig_compose_h)) {
-		vfree(dev->bitmap_cap);
-		dev->bitmap_cap = NULL;
-	}
 	tpg_s_crop_compose(&dev->tpg, crop, compose);
 	return 0;
 }
@@ -1084,234 +1040,6 @@ int vivid_vid_cap_g_pixelaspect(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_enum_fmt_vid_overlay(struct file *file, void  *priv,
-					struct v4l2_fmtdesc *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-	const struct vivid_fmt *fmt;
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-
-	if (f->index >= ARRAY_SIZE(formats_ovl))
-		return -EINVAL;
-
-	fmt = &formats_ovl[f->index];
-
-	f->pixelformat = fmt->fourcc;
-	return 0;
-}
-
-int vidioc_g_fmt_vid_overlay(struct file *file, void *priv,
-					struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-	const struct v4l2_rect *compose = &dev->compose_cap;
-	struct v4l2_window *win = &f->fmt.win;
-	unsigned clipcount = win->clipcount;
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-
-	win->w.top = dev->overlay_cap_top;
-	win->w.left = dev->overlay_cap_left;
-	win->w.width = compose->width;
-	win->w.height = compose->height;
-	win->field = dev->overlay_cap_field;
-	win->clipcount = dev->clipcount_cap;
-	if (clipcount > dev->clipcount_cap)
-		clipcount = dev->clipcount_cap;
-	if (dev->bitmap_cap == NULL)
-		win->bitmap = NULL;
-	else if (win->bitmap) {
-		if (copy_to_user(win->bitmap, dev->bitmap_cap,
-		    ((compose->width + 7) / 8) * compose->height))
-			return -EFAULT;
-	}
-	if (clipcount && win->clips)
-		memcpy(win->clips, dev->clips_cap,
-		       clipcount * sizeof(dev->clips_cap[0]));
-	return 0;
-}
-
-int vidioc_try_fmt_vid_overlay(struct file *file, void *priv,
-					struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-	const struct v4l2_rect *compose = &dev->compose_cap;
-	struct v4l2_window *win = &f->fmt.win;
-	int i, j;
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-
-	win->w.left = clamp_t(int, win->w.left,
-			      -dev->fb_cap.fmt.width, dev->fb_cap.fmt.width);
-	win->w.top = clamp_t(int, win->w.top,
-			     -dev->fb_cap.fmt.height, dev->fb_cap.fmt.height);
-	win->w.width = compose->width;
-	win->w.height = compose->height;
-	if (win->field != V4L2_FIELD_BOTTOM && win->field != V4L2_FIELD_TOP)
-		win->field = V4L2_FIELD_ANY;
-	win->chromakey = 0;
-	win->global_alpha = 0;
-	if (win->clipcount && !win->clips)
-		win->clipcount = 0;
-	if (win->clipcount > MAX_CLIPS)
-		win->clipcount = MAX_CLIPS;
-	if (win->clipcount) {
-		memcpy(dev->try_clips_cap, win->clips,
-		       win->clipcount * sizeof(dev->clips_cap[0]));
-		for (i = 0; i < win->clipcount; i++) {
-			struct v4l2_rect *r = &dev->try_clips_cap[i].c;
-
-			r->top = clamp_t(s32, r->top, 0, dev->fb_cap.fmt.height - 1);
-			r->height = clamp_t(s32, r->height, 1, dev->fb_cap.fmt.height - r->top);
-			r->left = clamp_t(u32, r->left, 0, dev->fb_cap.fmt.width - 1);
-			r->width = clamp_t(u32, r->width, 1, dev->fb_cap.fmt.width - r->left);
-		}
-		/*
-		 * Yeah, so sue me, it's an O(n^2) algorithm. But n is a small
-		 * number and it's typically a one-time deal.
-		 */
-		for (i = 0; i < win->clipcount - 1; i++) {
-			struct v4l2_rect *r1 = &dev->try_clips_cap[i].c;
-
-			for (j = i + 1; j < win->clipcount; j++) {
-				struct v4l2_rect *r2 = &dev->try_clips_cap[j].c;
-
-				if (v4l2_rect_overlap(r1, r2))
-					return -EINVAL;
-			}
-		}
-		memcpy(win->clips, dev->try_clips_cap,
-		       win->clipcount * sizeof(dev->clips_cap[0]));
-	}
-	return 0;
-}
-
-int vidioc_s_fmt_vid_overlay(struct file *file, void *priv,
-					struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-	const struct v4l2_rect *compose = &dev->compose_cap;
-	struct v4l2_window *win = &f->fmt.win;
-	int ret = vidioc_try_fmt_vid_overlay(file, priv, f);
-	unsigned bitmap_size = ((compose->width + 7) / 8) * compose->height;
-	unsigned clips_size = win->clipcount * sizeof(dev->clips_cap[0]);
-	void *new_bitmap = NULL;
-
-	if (ret)
-		return ret;
-
-	if (win->bitmap) {
-		new_bitmap = vzalloc(bitmap_size);
-
-		if (new_bitmap == NULL)
-			return -ENOMEM;
-		if (copy_from_user(new_bitmap, win->bitmap, bitmap_size)) {
-			vfree(new_bitmap);
-			return -EFAULT;
-		}
-	}
-
-	dev->overlay_cap_top = win->w.top;
-	dev->overlay_cap_left = win->w.left;
-	dev->overlay_cap_field = win->field;
-	vfree(dev->bitmap_cap);
-	dev->bitmap_cap = new_bitmap;
-	dev->clipcount_cap = win->clipcount;
-	if (dev->clipcount_cap)
-		memcpy(dev->clips_cap, dev->try_clips_cap, clips_size);
-	return 0;
-}
-
-int vivid_vid_cap_overlay(struct file *file, void *fh, unsigned i)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-
-	if (i && dev->fb_vbase_cap == NULL)
-		return -EINVAL;
-
-	if (i && dev->fb_cap.fmt.pixelformat != dev->fmt_cap->fourcc) {
-		dprintk(dev, 1, "mismatch between overlay and video capture pixelformats\n");
-		return -EINVAL;
-	}
-
-	if (dev->overlay_cap_owner && dev->overlay_cap_owner != fh)
-		return -EBUSY;
-	dev->overlay_cap_owner = i ? fh : NULL;
-	return 0;
-}
-
-int vivid_vid_cap_g_fbuf(struct file *file, void *fh,
-				struct v4l2_framebuffer *a)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-
-	*a = dev->fb_cap;
-	a->capability = V4L2_FBUF_CAP_BITMAP_CLIPPING |
-			V4L2_FBUF_CAP_LIST_CLIPPING;
-	a->flags = V4L2_FBUF_FLAG_PRIMARY;
-	a->fmt.field = V4L2_FIELD_NONE;
-	a->fmt.colorspace = V4L2_COLORSPACE_SRGB;
-	a->fmt.priv = 0;
-	return 0;
-}
-
-int vivid_vid_cap_s_fbuf(struct file *file, void *fh,
-				const struct v4l2_framebuffer *a)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-	const struct vivid_fmt *fmt;
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-
-	if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_RAWIO))
-		return -EPERM;
-
-	if (dev->overlay_cap_owner)
-		return -EBUSY;
-
-	if (a->base == NULL) {
-		dev->fb_cap.base = NULL;
-		dev->fb_vbase_cap = NULL;
-		return 0;
-	}
-
-	if (a->fmt.width < 48 || a->fmt.height < 32)
-		return -EINVAL;
-	fmt = vivid_get_format(dev, a->fmt.pixelformat);
-	if (!fmt || !fmt->can_do_overlay)
-		return -EINVAL;
-	if (a->fmt.bytesperline < (a->fmt.width * fmt->bit_depth[0]) / 8)
-		return -EINVAL;
-	if (a->fmt.bytesperline > a->fmt.sizeimage / a->fmt.height)
-		return -EINVAL;
-
-	/*
-	 * Only support the framebuffer of one of the vivid instances.
-	 * Anything else is rejected.
-	 */
-	if (!vivid_validate_fb(a))
-		return -EINVAL;
-
-	dev->fb_vbase_cap = phys_to_virt((unsigned long)a->base);
-	dev->fb_cap = *a;
-	dev->overlay_cap_left = clamp_t(int, dev->overlay_cap_left,
-				    -dev->fb_cap.fmt.width, dev->fb_cap.fmt.width);
-	dev->overlay_cap_top = clamp_t(int, dev->overlay_cap_top,
-				   -dev->fb_cap.fmt.height, dev->fb_cap.fmt.height);
-	return 0;
-}
-
 static const struct v4l2_audio vivid_audio_inputs[] = {
 	{ 0, "TV", V4L2_AUDCAP_STEREO },
 	{ 1, "Line-In", V4L2_AUDCAP_STEREO },
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.h b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
index 1e422a59eeab..949768652d38 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
@@ -33,9 +33,6 @@ int vidioc_enum_fmt_vid_overlay(struct file *file, void  *priv, struct v4l2_fmtd
 int vidioc_g_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_try_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_s_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_vid_cap_overlay(struct file *file, void *fh, unsigned i);
-int vivid_vid_cap_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *a);
-int vivid_vid_cap_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffer *a);
 int vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *inp);
 int vidioc_g_input(struct file *file, void *priv, unsigned *i);
 int vidioc_s_input(struct file *file, void *priv, unsigned i);
-- 
2.39.1

