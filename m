Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F30736A6B96
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 12:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjCALTE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 06:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjCALTD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 06:19:03 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6563393C6
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 03:19:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 4B1C5CE1CCC
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50457C433D2;
        Wed,  1 Mar 2023 11:18:58 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 6/9] v4l2-core: drop v4l2_window clipping and bitmap support
Date:   Wed,  1 Mar 2023 12:18:47 +0100
Message-Id: <20230301111850.607515-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
References: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are no longer any drivers that support clipping and bitmap
support for the capture or output overlay interfaces, so drop
this.

Always set the bitmap, clips and clipcount fields to 0, and
remove the compat32 support.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 78 +++----------------
 drivers/media/v4l2-core/v4l2-ioctl.c          | 65 ++++------------
 2 files changed, 25 insertions(+), 118 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 55c26e7d370e..e7baa2880eeb 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -38,18 +38,13 @@
  * data to the routine.
  */
 
-struct v4l2_clip32 {
-	struct v4l2_rect        c;
-	compat_caddr_t		next;
-};
-
 struct v4l2_window32 {
 	struct v4l2_rect        w;
 	__u32			field;	/* enum v4l2_field */
 	__u32			chromakey;
-	compat_caddr_t		clips; /* actually struct v4l2_clip32 * */
-	__u32			clipcount;
-	compat_caddr_t		bitmap;
+	compat_caddr_t		clips; /* always NULL */
+	__u32			clipcount; /* always 0 */
+	compat_caddr_t		bitmap; /* always NULL */
 	__u8                    global_alpha;
 };
 
@@ -65,17 +60,12 @@ static int get_v4l2_window32(struct v4l2_window *p64,
 		.w		= w32.w,
 		.field		= w32.field,
 		.chromakey	= w32.chromakey,
-		.clips		= (void __force *)compat_ptr(w32.clips),
-		.clipcount	= w32.clipcount,
-		.bitmap		= compat_ptr(w32.bitmap),
+		.clips		= NULL,
+		.clipcount	= 0,
+		.bitmap		= NULL,
 		.global_alpha	= w32.global_alpha,
 	};
 
-	if (p64->clipcount > 2048)
-		return -EINVAL;
-	if (!p64->clipcount)
-		p64->clips = NULL;
-
 	return 0;
 }
 
@@ -89,16 +79,13 @@ static int put_v4l2_window32(struct v4l2_window *p64,
 		.w		= p64->w,
 		.field		= p64->field,
 		.chromakey	= p64->chromakey,
-		.clips		= (uintptr_t)p64->clips,
-		.clipcount	= p64->clipcount,
-		.bitmap		= ptr_to_compat(p64->bitmap),
+		.clips		= 0,
+		.clipcount	= 0,
+		.bitmap		= 0,
 		.global_alpha	= p64->global_alpha,
 	};
 
-	/* copy everything except the clips pointer */
-	if (copy_to_user(p32, &w32, offsetof(struct v4l2_window32, clips)) ||
-	    copy_to_user(&p32->clipcount, &w32.clipcount,
-			 sizeof(w32) - offsetof(struct v4l2_window32, clipcount)))
+	if (copy_to_user(p32, &w32, sizeof(w32)))
 		return -EFAULT;
 
 	return 0;
@@ -1043,29 +1030,6 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
 	memset(mbuf, 0, array_size);
 
 	switch (cmd) {
-	case VIDIOC_G_FMT32:
-	case VIDIOC_S_FMT32:
-	case VIDIOC_TRY_FMT32: {
-		struct v4l2_format *f64 = arg;
-		struct v4l2_clip *c64 = mbuf;
-		struct v4l2_clip32 __user *c32 = user_ptr;
-		u32 clipcount = f64->fmt.win.clipcount;
-
-		if ((f64->type != V4L2_BUF_TYPE_VIDEO_OVERLAY &&
-		     f64->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY) ||
-		    clipcount == 0)
-			return 0;
-		if (clipcount > 2048)
-			return -EINVAL;
-		while (clipcount--) {
-			if (copy_from_user(c64, c32, sizeof(c64->c)))
-				return -EFAULT;
-			c64->next = NULL;
-			c64++;
-			c32++;
-		}
-		break;
-	}
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_QUERYBUF32_TIME32:
 	case VIDIOC_QBUF32_TIME32:
@@ -1136,28 +1100,6 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 	int err = 0;
 
 	switch (cmd) {
-	case VIDIOC_G_FMT32:
-	case VIDIOC_S_FMT32:
-	case VIDIOC_TRY_FMT32: {
-		struct v4l2_format *f64 = arg;
-		struct v4l2_clip *c64 = mbuf;
-		struct v4l2_clip32 __user *c32 = user_ptr;
-		u32 clipcount = f64->fmt.win.clipcount;
-
-		if ((f64->type != V4L2_BUF_TYPE_VIDEO_OVERLAY &&
-		     f64->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY) ||
-		    clipcount == 0)
-			return 0;
-		if (clipcount > 2048)
-			return -EINVAL;
-		while (clipcount--) {
-			if (copy_to_user(c32, c64, sizeof(c64->c)))
-				return -EFAULT;
-			c64++;
-			c32++;
-		}
-		break;
-	}
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_QUERYBUF32_TIME32:
 	case VIDIOC_QBUF32_TIME32:
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b26da2650289..ed595c450278 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -310,14 +310,10 @@ static void v4l_print_format(const void *arg, bool write_only)
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
 		win = &p->fmt.win;
-		/* Note: we can't print the clip list here since the clips
-		 * pointer is a userspace pointer, not a kernelspace
-		 * pointer. */
-		pr_cont(", wxh=%dx%d, x,y=%d,%d, field=%s, chromakey=0x%08x, clipcount=%u, clips=%p, bitmap=%p, global_alpha=0x%02x\n",
+		pr_cont(", wxh=%dx%d, x,y=%d,%d, field=%s, chromakey=0x%08x, global_alpha=0x%02x\n",
 			win->w.width, win->w.height, win->w.left, win->w.top,
 			prt_names(win->field, v4l2_field_names),
-			win->chromakey, win->clipcount, win->clips,
-			win->bitmap, win->global_alpha);
+			win->chromakey, win->global_alpha);
 		break;
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
@@ -1612,29 +1608,7 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 	if (ret)
 		return ret;
 
-	/*
-	 * fmt can't be cleared for these overlay types due to the 'clips'
-	 * 'clipcount' and 'bitmap' pointers in struct v4l2_window.
-	 * Those are provided by the user. So handle these two overlay types
-	 * first, and then just do a simple memset for the other types.
-	 */
-	switch (p->type) {
-	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY: {
-		struct v4l2_clip *clips = p->fmt.win.clips;
-		u32 clipcount = p->fmt.win.clipcount;
-		void __user *bitmap = p->fmt.win.bitmap;
-
-		memset(&p->fmt, 0, sizeof(p->fmt));
-		p->fmt.win.clips = clips;
-		p->fmt.win.clipcount = clipcount;
-		p->fmt.win.bitmap = bitmap;
-		break;
-	}
-	default:
-		memset(&p->fmt, 0, sizeof(p->fmt));
-		break;
-	}
+	memset(&p->fmt, 0, sizeof(p->fmt));
 
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
@@ -1722,6 +1696,9 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 		if (unlikely(!ops->vidioc_s_fmt_vid_overlay))
 			break;
 		memset_after(p, 0, fmt.win);
+		p->fmt.win.clips = NULL;
+		p->fmt.win.clipcount = 0;
+		p->fmt.win.bitmap = NULL;
 		return ops->vidioc_s_fmt_vid_overlay(file, fh, arg);
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 		if (unlikely(!ops->vidioc_s_fmt_vbi_cap))
@@ -1753,6 +1730,9 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 		if (unlikely(!ops->vidioc_s_fmt_vid_out_overlay))
 			break;
 		memset_after(p, 0, fmt.win);
+		p->fmt.win.clips = NULL;
+		p->fmt.win.clipcount = 0;
+		p->fmt.win.bitmap = NULL;
 		return ops->vidioc_s_fmt_vid_out_overlay(file, fh, arg);
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
 		if (unlikely(!ops->vidioc_s_fmt_vbi_out))
@@ -1824,6 +1804,9 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 		if (unlikely(!ops->vidioc_try_fmt_vid_overlay))
 			break;
 		memset_after(p, 0, fmt.win);
+		p->fmt.win.clips = NULL;
+		p->fmt.win.clipcount = 0;
+		p->fmt.win.bitmap = NULL;
 		return ops->vidioc_try_fmt_vid_overlay(file, fh, arg);
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 		if (unlikely(!ops->vidioc_try_fmt_vbi_cap))
@@ -1855,6 +1838,9 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 		if (unlikely(!ops->vidioc_try_fmt_vid_out_overlay))
 			break;
 		memset_after(p, 0, fmt.win);
+		p->fmt.win.clips = NULL;
+		p->fmt.win.clipcount = 0;
+		p->fmt.win.bitmap = NULL;
 		return ops->vidioc_try_fmt_vid_out_overlay(file, fh, arg);
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
 		if (unlikely(!ops->vidioc_try_fmt_vbi_out))
@@ -3128,27 +3114,6 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 		}
 		break;
 	}
-	case VIDIOC_G_FMT:
-	case VIDIOC_S_FMT:
-	case VIDIOC_TRY_FMT: {
-		struct v4l2_format *fmt = parg;
-
-		if (fmt->type != V4L2_BUF_TYPE_VIDEO_OVERLAY &&
-		    fmt->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY)
-			break;
-		if (fmt->fmt.win.clipcount > 2048)
-			return -EINVAL;
-		if (!fmt->fmt.win.clipcount)
-			break;
-
-		*user_ptr = (void __user *)fmt->fmt.win.clips;
-		*kernel_ptr = (void **)&fmt->fmt.win.clips;
-		*array_size = sizeof(struct v4l2_clip)
-				* fmt->fmt.win.clipcount;
-
-		ret = 1;
-		break;
-	}
 
 	case VIDIOC_SUBDEV_G_ROUTING:
 	case VIDIOC_SUBDEV_S_ROUTING: {
-- 
2.39.1

