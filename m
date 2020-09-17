Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA7726E477
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 20:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgIQSt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 14:49:56 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:43985 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgIQQcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 12:32:55 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MwwqB-1kgGVF2t0F-00yQIY; Thu, 17 Sep 2020 17:28:26 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     hch@lst.de, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5/8] media: v4l2: allocate v4l2_clip objects early
Date:   Thu, 17 Sep 2020 17:28:20 +0200
Message-Id: <20200917152823.1241599-6-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917152823.1241599-1-arnd@arndb.de>
References: <20200917152823.1241599-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Wq1fCdRcFHZE3TDFnh8T0Vdh2pTDLIen4VbwT9TgfNKcdiRlp+K
 mWSzQA90fd1lmbh2NdwXg6GNCj/acRZbURMxBGlJxl9nE5ao2xRksyH03V2oHtKO0Up43HT
 UCynnspvF2tOuwXGVHAjYG7ZfHbXhOugD97QXuhmppnGsXErCQ8iEesuOrFDyLQw+86Bg4S
 gk/vxM4V+Q9u8dhMLxl8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z8NJpNL4+Dc=:B47wzkulHLd0XwajUEkZwt
 CNN9crb600qEJLHBfUP7mGUD0LXIZgxF6sIQr+YX8T3W7AIb6sCchvKhbKdvNaYM7hiDE1PUo
 bZf+gDFl+NmYTmHeKDkYQjZTOI26JyJDozODvcdSvSjfsf/iZc9xPsbo0FeTsR61mmINbcmfd
 xn/0iRHPmtmkZ7kFAfKhdvLJ0neZmaGq3IuQBmX2yXqjwy6pYRMYGZqvfPDNYtq9Ila6T7xGf
 rZsS2YBBmI+jS+je6IdlFR7HBrlMqMwhN8yldkstDf3hTNhbF97oM6RinxDql+4PQ4LLGNwnB
 oy8jyEzsZgGXA554+ebUQsTho9AoTEnPTXHtRHiXqNdVhn3SvHsi4Cotmkix9/q96xDCSaeYe
 FkfbHSTrEKKARnP2p3Bv1I1rvYk2j5UgeWiA7euXyhTZKCZnLUN2eJOsHW96iBPiqqE29K4PG
 Kcy/ZP8flNHSKfhJ7HHJA9nugaUMKTdNMKakpqYCNwQRlcDpdqQO1ShC99wFE/obVSAMzgQo9
 4U2PzRkqWxWdkbBPerb8+dT60y2U2LYgNT0FRMuR83po/r6ZjKBK52Urk9cuBwtDt9EA/Rd7q
 nI1TDcomI/lp4SveaXjpy68562uBkf9as4+PiCj6Kr5qNqn1oIo6pPFECL95OOmioHW7wqa2A
 ACEkeqStRpIWCyAjlnPKj1XSzRAKgFwd8Y7FAqxu0+X6EBpwxlIA0vFy3TlTJQYee6SmUMxif
 KIRunezNBtrBqfgqX9RX3pBMhJU/zDSYUyK7f0wqzPwbWkTwS0jjHh37D56R1XDaQ9P0jv8JU
 3LuV2WYJi4wOJ670kTHqBFwySKo7ecuY/2qxfzzDn9rV28tn74F1awqWIoIRRyPlx2a6Fsa
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
index 9144f795fb93..d32929f65507 100644
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
index a8ac94fadc14..4d11e3d47df9 100644
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
index e94beef008c8..a07bd796a9d7 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -1081,11 +1081,9 @@ int vidioc_g_fmt_vid_overlay(struct file *file, void *priv,
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
 
@@ -1115,9 +1113,8 @@ int vidioc_try_fmt_vid_overlay(struct file *file, void *priv,
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
 
@@ -1140,9 +1137,8 @@ int vidioc_try_fmt_vid_overlay(struct file *file, void *priv,
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
index 4e79cdac9a5f..93f75e5de746 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1584,7 +1584,7 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY: {
-		struct v4l2_clip __user *clips = p->fmt.win.clips;
+		struct v4l2_clip *clips = p->fmt.win.clips;
 		u32 clipcount = p->fmt.win.clipcount;
 		void __user *bitmap = p->fmt.win.bitmap;
 
@@ -3083,6 +3083,27 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
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
index c7b70ff53bc1..19f315abc69f 100644
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

