Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FB82A0BE1
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbgJ3Qzv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:55:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:60862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727264AbgJ3Qzu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:55:50 -0400
Received: from localhost.localdomain (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B58EF208B6;
        Fri, 30 Oct 2020 16:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604076949;
        bh=dEREUX3pxpzvL1tLCjFym4TpPk2OqNcinSBxBhCK4bA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oqzz1gl6XTf/LNcF0UFfNeyH2C6JfjmU9rYaSM/bc8TKKSMDkfS4HFAtUkR3IcBZs
         fl12pC/IO9KjHKTl5ts81fOtcv8sGtnk+ApCbjhEPndF6oOx89Mfaq1/4XoOyzuWX0
         FAaGnSKNtgNEcGdLh2xsif0e0jr+clPR4ZtWFlds=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        mchehab@kernel.org, hch@lst.de, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] media: v4l2: allocate v4l2_clip objects early
Date:   Fri, 30 Oct 2020 17:55:26 +0100
Message-Id: <20201030165529.1255175-6-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030165529.1255175-1-arnd@kernel.org>
References: <20201030165529.1255175-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The v4l2_format based ioctls can have an indirect pointer to an array
of v4l2_clip structures for overlay mode, depending on the 'type' member.
There are only five drivers that use the overlay mode and copy the
data through the __user pointer.

Change the five drivers to use memcpy() instead, and copy the data
in common code using the check_array_args() helpers. This allows
for a subsequent patch that use the same mechanism for compat
ioctl handlers.

Note that there is another pointer for a 'bitmap' that is only
used in the 'vivid' driver and nowhere else. There is no easy
way to use the same trick without adding complexity to the
common code, so this remains a __user pointer.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/common/saa7146/saa7146_video.c  |  6 ++---
 drivers/media/pci/bt8xx/bttv-driver.c         |  8 ++-----
 drivers/media/pci/saa7134/saa7134-video.c     | 19 ++++++---------
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 18 ++++++---------
 .../media/test-drivers/vivid/vivid-vid-out.c  | 18 ++++++---------
 drivers/media/v4l2-core/v4l2-ioctl.c          | 23 ++++++++++++++++++-
 include/uapi/linux/videodev2.h                |  2 +-
 7 files changed, 48 insertions(+), 46 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index ccd15b4d4920..7b8795eca589 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -771,10 +771,8 @@ static int vidioc_s_fmt_vid_overlay(struct file *file, void *__fh, struct v4l2_f
 	vv->ov.nclips = f->fmt.win.clipcount;
 	if (vv->ov.nclips > 16)
 		vv->ov.nclips = 16;
-	if (copy_from_user(vv->ov.clips, f->fmt.win.clips,
-				sizeof(struct v4l2_clip) * vv->ov.nclips)) {
-		return -EFAULT;
-	}
+	memcpy(vv->ov.clips, f->fmt.win.clips,
+	       sizeof(struct v4l2_clip) * vv->ov.nclips);
 
 	/* vv->ov.fh is used to indicate that we have valid overlay information, too */
 	vv->ov.fh = fh;
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 8824dd0fb331..b2fab7d96207 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2143,12 +2143,8 @@ static int setup_window_lock(struct bttv_fh *fh, struct bttv *btv,
 	clips = kmalloc(size,GFP_KERNEL);
 	if (NULL == clips)
 		return -ENOMEM;
-	if (n > 0) {
-		if (copy_from_user(clips,win->clips,sizeof(struct v4l2_clip)*n)) {
-			kfree(clips);
-			return -EFAULT;
-		}
-	}
+	if (n > 0)
+		memcpy(clips, win->clips, sizeof(struct v4l2_clip)*n);
 
 	/* clip against screen */
 	if (NULL != btv->fbuf.base)
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 9a6a6b68f8e3..7f35f8672f7c 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -1265,9 +1265,7 @@ static int saa7134_g_fmt_vid_overlay(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
-	struct v4l2_clip __user *clips = f->fmt.win.clips;
 	u32 clipcount = f->fmt.win.clipcount;
-	int err = 0;
 	int i;
 
 	if (saa7134_no_overlay > 0) {
@@ -1275,20 +1273,18 @@ static int saa7134_g_fmt_vid_overlay(struct file *file, void *priv,
 		return -EINVAL;
 	}
 	f->fmt.win = dev->win;
-	f->fmt.win.clips = clips;
-	if (clips == NULL)
+	if (!f->fmt.win.clips)
 		clipcount = 0;
 	if (dev->nclips < clipcount)
 		clipcount = dev->nclips;
 	f->fmt.win.clipcount = clipcount;
 
-	for (i = 0; !err && i < clipcount; i++) {
-		if (copy_to_user(&f->fmt.win.clips[i].c, &dev->clips[i].c,
-					sizeof(struct v4l2_rect)))
-			err = -EFAULT;
+	for (i = 0; i < clipcount; i++) {
+		memcpy(&f->fmt.win.clips[i].c, &dev->clips[i].c,
+					sizeof(struct v4l2_rect));
 	}
 
-	return err;
+	return 0;
 }
 
 static int saa7134_try_fmt_vid_cap(struct file *file, void *priv,
@@ -1396,9 +1392,8 @@ static int saa7134_s_fmt_vid_overlay(struct file *file, void *priv,
 	dev->win    = f->fmt.win;
 	dev->nclips = f->fmt.win.clipcount;
 
-	if (copy_from_user(dev->clips, f->fmt.win.clips,
-			   sizeof(struct v4l2_clip) * dev->nclips))
-		return -EFAULT;
+	memcpy(dev->clips, f->fmt.win.clips,
+	       sizeof(struct v4l2_clip) * dev->nclips);
 
 	if (priv == dev->overlay_owner) {
 		spin_lock_irqsave(&dev->slock, flags);
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index eadf28ab1e39..b9caa4b26209 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -1107,11 +1107,9 @@ int vidioc_g_fmt_vid_overlay(struct file *file, void *priv,
 		    ((compose->width + 7) / 8) * compose->height))
 			return -EFAULT;
 	}
-	if (clipcount && win->clips) {
-		if (copy_to_user(win->clips, dev->clips_cap,
-				 clipcount * sizeof(dev->clips_cap[0])))
-			return -EFAULT;
-	}
+	if (clipcount && win->clips)
+		memcpy(win->clips, dev->clips_cap,
+		       clipcount * sizeof(dev->clips_cap[0]));
 	return 0;
 }
 
@@ -1141,9 +1139,8 @@ int vidioc_try_fmt_vid_overlay(struct file *file, void *priv,
 	if (win->clipcount > MAX_CLIPS)
 		win->clipcount = MAX_CLIPS;
 	if (win->clipcount) {
-		if (copy_from_user(dev->try_clips_cap, win->clips,
-				   win->clipcount * sizeof(dev->clips_cap[0])))
-			return -EFAULT;
+		memcpy(dev->try_clips_cap, win->clips,
+		       win->clipcount * sizeof(dev->clips_cap[0]));
 		for (i = 0; i < win->clipcount; i++) {
 			struct v4l2_rect *r = &dev->try_clips_cap[i].c;
 
@@ -1166,9 +1163,8 @@ int vidioc_try_fmt_vid_overlay(struct file *file, void *priv,
 					return -EINVAL;
 			}
 		}
-		if (copy_to_user(win->clips, dev->try_clips_cap,
-				 win->clipcount * sizeof(dev->clips_cap[0])))
-			return -EFAULT;
+		memcpy(win->clips, dev->try_clips_cap,
+		       win->clipcount * sizeof(dev->clips_cap[0]));
 	}
 	return 0;
 }
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index ee3446e3217c..ac1e981e8342 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -857,11 +857,9 @@ int vidioc_g_fmt_vid_out_overlay(struct file *file, void *priv,
 		    ((dev->compose_out.width + 7) / 8) * dev->compose_out.height))
 			return -EFAULT;
 	}
-	if (clipcount && win->clips) {
-		if (copy_to_user(win->clips, dev->clips_out,
-				 clipcount * sizeof(dev->clips_out[0])))
-			return -EFAULT;
-	}
+	if (clipcount && win->clips)
+		memcpy(win->clips, dev->clips_out,
+		       clipcount * sizeof(dev->clips_out[0]));
 	return 0;
 }
 
@@ -891,9 +889,8 @@ int vidioc_try_fmt_vid_out_overlay(struct file *file, void *priv,
 	if (win->clipcount > MAX_CLIPS)
 		win->clipcount = MAX_CLIPS;
 	if (win->clipcount) {
-		if (copy_from_user(dev->try_clips_out, win->clips,
-				   win->clipcount * sizeof(dev->clips_out[0])))
-			return -EFAULT;
+		memcpy(dev->try_clips_out, win->clips,
+		       win->clipcount * sizeof(dev->clips_out[0]));
 		for (i = 0; i < win->clipcount; i++) {
 			struct v4l2_rect *r = &dev->try_clips_out[i].c;
 
@@ -916,9 +913,8 @@ int vidioc_try_fmt_vid_out_overlay(struct file *file, void *priv,
 					return -EINVAL;
 			}
 		}
-		if (copy_to_user(win->clips, dev->try_clips_out,
-				 win->clipcount * sizeof(dev->clips_out[0])))
-			return -EFAULT;
+		memcpy(win->clips, dev->try_clips_out,
+		       win->clipcount * sizeof(dev->clips_out[0]));
 	}
 	return 0;
 }
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b8be61a09776..f0f6906a879d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1582,7 +1582,7 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY: {
-		struct v4l2_clip __user *clips = p->fmt.win.clips;
+		struct v4l2_clip *clips = p->fmt.win.clips;
 		u32 clipcount = p->fmt.win.clipcount;
 		void __user *bitmap = p->fmt.win.bitmap;
 
@@ -3084,6 +3084,27 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 		}
 		break;
 	}
+	case VIDIOC_G_FMT:
+	case VIDIOC_S_FMT:
+	case VIDIOC_TRY_FMT: {
+		struct v4l2_format *fmt = parg;
+
+		if (fmt->type != V4L2_BUF_TYPE_VIDEO_OVERLAY &&
+		    fmt->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY)
+			break;
+		if (fmt->fmt.win.clipcount > 2048)
+			return -EINVAL;
+		if (!fmt->fmt.win.clipcount)
+			break;
+
+		*user_ptr = (void __user *)fmt->fmt.win.clips;
+		*kernel_ptr = (void **)&fmt->fmt.win.clips;
+		*array_size = sizeof(struct v4l2_clip)
+				* fmt->fmt.win.clipcount;
+
+		ret = 1;
+		break;
+	}
 	}
 
 	return ret;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 534eaa4d39bc..b10f102bbf6f 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1185,7 +1185,7 @@ struct v4l2_window {
 	struct v4l2_rect        w;
 	__u32			field;	 /* enum v4l2_field */
 	__u32			chromakey;
-	struct v4l2_clip	__user *clips;
+	struct v4l2_clip	*clips;
 	__u32			clipcount;
 	void			__user *bitmap;
 	__u8                    global_alpha;
-- 
2.27.0

