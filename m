Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7426A82FA
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 13:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjCBM6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 07:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjCBM63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 07:58:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D4E4E5ED
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 04:57:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A1EE7615C5
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 12:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52911C433EF;
        Thu,  2 Mar 2023 12:57:39 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/9] vivid: drop bitmap and clipping output overlay support
Date:   Thu,  2 Mar 2023 13:57:27 +0100
Message-Id: <20230302125731.1124945-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302125731.1124945-1-hverkuil-cisco@xs4all.nl>
References: <20230302125731.1124945-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This test driver is the only remaining driver still using
the clipping and bitmap method. Drop support for this so
we can remove this in the V4L2 API as well.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.c |  1 -
 drivers/media/test-drivers/vivid/vivid-core.h |  6 --
 .../test-drivers/vivid/vivid-kthread-cap.c    | 23 +-----
 .../media/test-drivers/vivid/vivid-vid-out.c  | 74 -------------------
 4 files changed, 1 insertion(+), 103 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 31d8c34495cb..bdabf7671011 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -834,7 +834,6 @@ static void vivid_dev_release(struct v4l2_device *v4l2_dev)
 	vfree(dev->scaled_line);
 	vfree(dev->blended_line);
 	vfree(dev->edid);
-	vfree(dev->bitmap_out);
 	tpg_free(&dev->tpg);
 	kfree(dev->query_dv_timings_qmenu);
 	kfree(dev->query_dv_timings_qmenu_strings);
diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index 02a75d04ff8a..cfb8e66083f6 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -22,8 +22,6 @@
 #define dprintk(dev, level, fmt, arg...) \
 	v4l2_dbg(level, vivid_debug, &dev->v4l2_dev, fmt, ## arg)
 
-/* The maximum number of clip rectangles */
-#define MAX_CLIPS  16
 /* The maximum number of inputs */
 #define MAX_INPUTS 16
 /* The maximum number of outputs */
@@ -372,10 +370,6 @@ struct vivid_dev {
 	void				*fb_vbase_out;
 	bool				overlay_out_enabled;
 	int				overlay_out_top, overlay_out_left;
-	void				*bitmap_out;
-	struct v4l2_clip		clips_out[MAX_CLIPS];
-	struct v4l2_clip		try_clips_out[MAX_CLIPS];
-	unsigned			clipcount_out;
 	unsigned			fbuf_out_flags;
 	u32				chromakey_out;
 	u8				global_alpha_out;
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 177c73979325..42048727d7ff 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -53,31 +53,10 @@ static void copy_pix(struct vivid_dev *dev, int win_y, int win_x,
 			u16 *cap, const u16 *osd)
 {
 	u16 out;
-	int left = dev->overlay_out_left;
-	int top = dev->overlay_out_top;
-	int fb_x = win_x + left;
-	int fb_y = win_y + top;
-	int i;
 
 	out = *cap;
 	*cap = *osd;
-	if (dev->bitmap_out) {
-		const u8 *p = dev->bitmap_out;
-		unsigned stride = (dev->compose_out.width + 7) / 8;
 
-		win_x -= dev->compose_out.left;
-		win_y -= dev->compose_out.top;
-		if (!(p[stride * win_y + win_x / 8] & (1 << (win_x & 7))))
-			return;
-	}
-
-	for (i = 0; i < dev->clipcount_out; i++) {
-		struct v4l2_rect *r = &dev->clips_out[i].c;
-
-		if (fb_y >= r->top && fb_y < r->top + r->height &&
-		    fb_x >= r->left && fb_x < r->left + r->width)
-			return;
-	}
 	if ((dev->fbuf_out_flags & V4L2_FBUF_FLAG_CHROMAKEY) &&
 	    *osd != dev->chromakey_out)
 		return;
@@ -251,7 +230,7 @@ static noinline_for_stack int vivid_copy_buffer(struct vivid_dev *dev, unsigned
 	u8 *voutbuf;
 	u8 *vosdbuf = NULL;
 	unsigned y;
-	bool blend = dev->bitmap_out || dev->clipcount_out || dev->fbuf_out_flags;
+	bool blend = dev->fbuf_out_flags;
 	/* Coarse scaling with Bresenham */
 	unsigned vid_out_int_part;
 	unsigned vid_out_fract_part;
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index 9f731f085179..184a6df2c29f 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -793,11 +793,6 @@ int vivid_vid_out_s_selection(struct file *file, void *fh, struct v4l2_selection
 		}
 		s->r.top *= factor;
 		s->r.height *= factor;
-		if (dev->bitmap_out && (compose->width != s->r.width ||
-					compose->height != s->r.height)) {
-			vfree(dev->bitmap_out);
-			dev->bitmap_out = NULL;
-		}
 		*compose = s->r;
 		break;
 	default:
@@ -836,7 +831,6 @@ int vidioc_g_fmt_vid_out_overlay(struct file *file, void *priv,
 	struct vivid_dev *dev = video_drvdata(file);
 	const struct v4l2_rect *compose = &dev->compose_out;
 	struct v4l2_window *win = &f->fmt.win;
-	unsigned clipcount = win->clipcount;
 
 	if (!dev->has_fb)
 		return -EINVAL;
@@ -844,22 +838,9 @@ int vidioc_g_fmt_vid_out_overlay(struct file *file, void *priv,
 	win->w.left = dev->overlay_out_left;
 	win->w.width = compose->width;
 	win->w.height = compose->height;
-	win->clipcount = dev->clipcount_out;
 	win->field = V4L2_FIELD_ANY;
 	win->chromakey = dev->chromakey_out;
 	win->global_alpha = dev->global_alpha_out;
-	if (clipcount > dev->clipcount_out)
-		clipcount = dev->clipcount_out;
-	if (dev->bitmap_out == NULL)
-		win->bitmap = NULL;
-	else if (win->bitmap) {
-		if (copy_to_user(win->bitmap, dev->bitmap_out,
-		    ((dev->compose_out.width + 7) / 8) * dev->compose_out.height))
-			return -EFAULT;
-	}
-	if (clipcount && win->clips)
-		memcpy(win->clips, dev->clips_out,
-		       clipcount * sizeof(dev->clips_out[0]));
 	return 0;
 }
 
@@ -869,7 +850,6 @@ int vidioc_try_fmt_vid_out_overlay(struct file *file, void *priv,
 	struct vivid_dev *dev = video_drvdata(file);
 	const struct v4l2_rect *compose = &dev->compose_out;
 	struct v4l2_window *win = &f->fmt.win;
-	int i, j;
 
 	if (!dev->has_fb)
 		return -EINVAL;
@@ -884,38 +864,6 @@ int vidioc_try_fmt_vid_out_overlay(struct file *file, void *priv,
 	 * so always set this to ANY.
 	 */
 	win->field = V4L2_FIELD_ANY;
-	if (win->clipcount && !win->clips)
-		win->clipcount = 0;
-	if (win->clipcount > MAX_CLIPS)
-		win->clipcount = MAX_CLIPS;
-	if (win->clipcount) {
-		memcpy(dev->try_clips_out, win->clips,
-		       win->clipcount * sizeof(dev->clips_out[0]));
-		for (i = 0; i < win->clipcount; i++) {
-			struct v4l2_rect *r = &dev->try_clips_out[i].c;
-
-			r->top = clamp_t(s32, r->top, 0, dev->display_height - 1);
-			r->height = clamp_t(s32, r->height, 1, dev->display_height - r->top);
-			r->left = clamp_t(u32, r->left, 0, dev->display_width - 1);
-			r->width = clamp_t(u32, r->width, 1, dev->display_width - r->left);
-		}
-		/*
-		 * Yeah, so sue me, it's an O(n^2) algorithm. But n is a small
-		 * number and it's typically a one-time deal.
-		 */
-		for (i = 0; i < win->clipcount - 1; i++) {
-			struct v4l2_rect *r1 = &dev->try_clips_out[i].c;
-
-			for (j = i + 1; j < win->clipcount; j++) {
-				struct v4l2_rect *r2 = &dev->try_clips_out[j].c;
-
-				if (v4l2_rect_overlap(r1, r2))
-					return -EINVAL;
-			}
-		}
-		memcpy(win->clips, dev->try_clips_out,
-		       win->clipcount * sizeof(dev->clips_out[0]));
-	}
 	return 0;
 }
 
@@ -923,34 +871,14 @@ int vidioc_s_fmt_vid_out_overlay(struct file *file, void *priv,
 					struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
-	const struct v4l2_rect *compose = &dev->compose_out;
 	struct v4l2_window *win = &f->fmt.win;
 	int ret = vidioc_try_fmt_vid_out_overlay(file, priv, f);
-	unsigned bitmap_size = ((compose->width + 7) / 8) * compose->height;
-	unsigned clips_size = win->clipcount * sizeof(dev->clips_out[0]);
-	void *new_bitmap = NULL;
 
 	if (ret)
 		return ret;
 
-	if (win->bitmap) {
-		new_bitmap = vzalloc(bitmap_size);
-
-		if (!new_bitmap)
-			return -ENOMEM;
-		if (copy_from_user(new_bitmap, win->bitmap, bitmap_size)) {
-			vfree(new_bitmap);
-			return -EFAULT;
-		}
-	}
-
 	dev->overlay_out_top = win->w.top;
 	dev->overlay_out_left = win->w.left;
-	vfree(dev->bitmap_out);
-	dev->bitmap_out = new_bitmap;
-	dev->clipcount_out = win->clipcount;
-	if (dev->clipcount_out)
-		memcpy(dev->clips_out, dev->try_clips_out, clips_size);
 	dev->chromakey_out = win->chromakey;
 	dev->global_alpha_out = win->global_alpha;
 	return ret;
@@ -975,8 +903,6 @@ int vivid_vid_out_g_fbuf(struct file *file, void *fh,
 	struct vivid_dev *dev = video_drvdata(file);
 
 	a->capability = V4L2_FBUF_CAP_EXTERNOVERLAY |
-			V4L2_FBUF_CAP_BITMAP_CLIPPING |
-			V4L2_FBUF_CAP_LIST_CLIPPING |
 			V4L2_FBUF_CAP_CHROMAKEY |
 			V4L2_FBUF_CAP_SRC_CHROMAKEY |
 			V4L2_FBUF_CAP_GLOBAL_ALPHA |
-- 
2.39.1

