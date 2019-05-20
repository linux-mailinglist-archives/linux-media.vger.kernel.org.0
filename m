Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78610242DA
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 23:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfETV2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 17:28:09 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45292 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfETV2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 17:28:08 -0400
Received: by mail-lf1-f66.google.com with SMTP id n22so11366308lfe.12;
        Mon, 20 May 2019 14:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lR08DY1L7bP6d+QNfFl41i4c9Pb3NH1K7ntNIUXZcmI=;
        b=W8QOHjIdJROouGpykFenb6p3AjMSL/1T2xjUa/FI6ZBvW5DbDpUPqf1ACfoOeADPi2
         37AejTp6NKJsnINKYRrVUm7M6lvszhtrBbUOhc+Xe16q7s9OrOp2SnyqmTE3UQcg5i/t
         AdLIgvlYVKO22DkRmJOZoiKcwT9+1qiOA6RWUrpTCLapZ1JCLbUlVkmEUXF4n4A/S7hH
         29M3gOqI1Khx+dDg+XJ5norySKUCqFK+ynZiyWMMV0vQ57AbhYXMHQfYldYz8dl+pW1S
         85CmGeFUFl5QwDMRazj55RvYI7dAMG4AJ/G9WsyumkOhCuL2RKykMSlpLT99b4Qhna4q
         9Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lR08DY1L7bP6d+QNfFl41i4c9Pb3NH1K7ntNIUXZcmI=;
        b=DgG+xh2hREyc2uCStfxUS3op3Ns76y48lhf4GZk8l2C59Bjy8KlMX5jixlB002puOg
         9OcIzbCeB1R3gnTiT5ZoT+uNqNa9bUSZG99hsxRn8X0MnQPKKzE7h22t0WGoiPKXSCqi
         ST2z4MRSVgMK1STA6s9O3qIoKuOvTOd0AB3MIw/8su+KFzDvv5UNIjFLH6GCB8wSfp0o
         EcwI3MYgZ/tQQDGABEIsrpaWMqpZQAVdZ8J1CO3OfSi7n4+SsgaIiatLad/Q2PE0tZSh
         hn+eQU6BltVB9/a3d2lQY0xnnMWb0iRN67F48KGzkdtJJTqgA7Lhq9OeBkE4CFebahB8
         YdXw==
X-Gm-Message-State: APjAAAX6tHZHe9y4LV6g7qrk+k1R2pNJ6CUb53a4ozaO77a2DHVF2KLj
        SgyKndhZDQTBDNlGnGciKGxT+6JZWRg=
X-Google-Smtp-Source: APXvYqyUKQ7/ZB7C14PaltzVjZ6KKfrTCleE+zwLtawMJ1IdTqrPDVFMBkVdMHAYwdClhe9dp170IA==
X-Received: by 2002:a19:2390:: with SMTP id j138mr12079394lfj.33.1558387685244;
        Mon, 20 May 2019 14:28:05 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id q9sm4226813lfn.88.2019.05.20.14.28.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 14:28:04 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v7 1/3] media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
Date:   Mon, 20 May 2019 23:27:45 +0200
Message-Id: <20190520212747.368-2-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520212747.368-1-jmkrzyszt@gmail.com>
References: <20190520212747.368-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Correctness of format type (try or active) and pad number parameters
passed to subdevice operation callbacks is now verified only for IOCTL
calls.  However, those callbacks are also used by drivers, e.g., V4L2
host interfaces.

Since both subdev_do_ioctl() and drivers are using v4l2_subdev_call()
macro while calling subdevice operations, move those parameter checks
from subdev_do_ioctl() to v4l2_subdev_call() so we can avoid taking care
of those checks inside drivers.

Define a wrapper function for each operation callback in scope, then
gather those wrappers in a static v4l2_subdev_ops structure so the
v4l2_subdev_call() macro can find them easy if provided.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 238 ++++++++++++++++----------
 include/media/v4l2-subdev.h           |   6 +
 2 files changed, 152 insertions(+), 92 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d75815ab0d7b..59fdc0f08870 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -120,56 +120,175 @@ static int subdev_close(struct file *file)
 	return 0;
 }
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-static int check_format(struct v4l2_subdev *sd,
-			struct v4l2_subdev_format *format)
+static inline int check_which(__u32 which)
 {
-	if (format->which != V4L2_SUBDEV_FORMAT_TRY &&
-	    format->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
-
-	if (format->pad >= sd->entity.num_pads)
+	if (which != V4L2_SUBDEV_FORMAT_TRY &&
+	    which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
 	return 0;
 }
 
-static int check_crop(struct v4l2_subdev *sd, struct v4l2_subdev_crop *crop)
+static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
 {
-	if (crop->which != V4L2_SUBDEV_FORMAT_TRY &&
-	    crop->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	if (sd->entity.graph_obj.mdev) {
+		if (pad >= sd->entity.num_pads)
+			return -EINVAL;
+		return 0;
+	}
+#endif
+	/* allow pad 0 on subdevices not registered as media entities */
+	if (pad > 0)
 		return -EINVAL;
+	return 0;
+}
 
-	if (crop->pad >= sd->entity.num_pads)
-		return -EINVAL;
+static inline int check_format(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_format *format)
+{
+	return check_which(format->which) ? : check_pad(sd, format->pad);
+}
 
-	return 0;
+static int call_get_fmt(struct v4l2_subdev *sd,
+			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_format *format)
+{
+	return check_format(sd, format) ? :
+	       sd->ops->pad->get_fmt(sd, cfg, format);
 }
 
-static int check_selection(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_selection *sel)
+static int call_set_fmt(struct v4l2_subdev *sd,
+			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_format *format)
 {
-	if (sel->which != V4L2_SUBDEV_FORMAT_TRY &&
-	    sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	return check_format(sd, format) ? :
+	       sd->ops->pad->set_fmt(sd, cfg, format);
+}
 
-	if (sel->pad >= sd->entity.num_pads)
-		return -EINVAL;
+static int call_enum_mbus_code(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_mbus_code_enum *code)
+{
+	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
+	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
+}
 
-	return 0;
+static int call_enum_frame_size(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_frame_size_enum *fse)
+{
+	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
+	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
 }
 
-static int check_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
+static inline int check_frame_interval(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_frame_interval *fi)
 {
-	if (edid->pad >= sd->entity.num_pads)
-		return -EINVAL;
+	return check_pad(sd, fi->pad);
+}
+
+static int call_g_frame_interval(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_frame_interval *fi)
+{
+	return check_frame_interval(sd, fi) ? :
+	       sd->ops->video->g_frame_interval(sd, fi);
+}
+
+static int call_s_frame_interval(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_frame_interval *fi)
+{
+	return check_frame_interval(sd, fi) ? :
+	       sd->ops->video->s_frame_interval(sd, fi);
+}
+
+static int call_enum_frame_interval(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_frame_interval_enum *fie)
+{
+	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
+	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
+}
 
+static inline int check_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_selection *sel)
+{
+	return check_which(sel->which) ? : check_pad(sd, sel->pad);
+}
+
+static int call_get_selection(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_selection *sel)
+{
+	return check_selection(sd, sel) ? :
+	       sd->ops->pad->get_selection(sd, cfg, sel);
+}
+
+static int call_set_selection(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_selection *sel)
+{
+	return check_selection(sd, sel) ? :
+	       sd->ops->pad->set_selection(sd, cfg, sel);
+}
+
+static inline int check_edid(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_edid *edid)
+{
 	if (edid->blocks && edid->edid == NULL)
 		return -EINVAL;
 
-	return 0;
+	return check_pad(sd, edid->pad);
 }
-#endif
+
+static int call_get_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
+{
+	return check_edid(sd, edid) ? : sd->ops->pad->get_edid(sd, edid);
+}
+
+static int call_set_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
+{
+	return check_edid(sd, edid) ? : sd->ops->pad->set_edid(sd, edid);
+}
+
+static int call_dv_timings_cap(struct v4l2_subdev *sd,
+			       struct v4l2_dv_timings_cap *cap)
+{
+	return check_pad(sd, cap->pad) ? :
+	       sd->ops->pad->dv_timings_cap(sd, cap);
+}
+
+static int call_enum_dv_timings(struct v4l2_subdev *sd,
+				struct v4l2_enum_dv_timings *dvt)
+{
+	return check_pad(sd, dvt->pad) ? :
+	       sd->ops->pad->enum_dv_timings(sd, dvt);
+}
+
+static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
+	.get_fmt		= call_get_fmt,
+	.set_fmt		= call_set_fmt,
+	.enum_mbus_code		= call_enum_mbus_code,
+	.enum_frame_size	= call_enum_frame_size,
+	.enum_frame_interval	= call_enum_frame_interval,
+	.get_selection		= call_get_selection,
+	.set_selection		= call_set_selection,
+	.get_edid		= call_get_edid,
+	.set_edid		= call_set_edid,
+	.dv_timings_cap		= call_dv_timings_cap,
+	.enum_dv_timings	= call_enum_dv_timings,
+};
+
+static const struct v4l2_subdev_video_ops v4l2_subdev_call_video_wrappers = {
+	.g_frame_interval	= call_g_frame_interval,
+	.s_frame_interval	= call_s_frame_interval,
+};
+
+const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
+	.pad	= &v4l2_subdev_call_pad_wrappers,
+	.video	= &v4l2_subdev_call_video_wrappers,
+};
+EXPORT_SYMBOL(v4l2_subdev_call_wrappers);
 
 static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 {
@@ -292,10 +411,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
-		rval = check_format(sd, format);
-		if (rval)
-			return rval;
-
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
@@ -304,10 +419,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
-		rval = check_format(sd, format);
-		if (rval)
-			return rval;
-
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
@@ -317,10 +428,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_crop *crop = arg;
 		struct v4l2_subdev_selection sel;
 
-		rval = check_crop(sd, crop);
-		if (rval)
-			return rval;
-
 		memset(crop->reserved, 0, sizeof(crop->reserved));
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
@@ -340,10 +447,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_selection sel;
 
 		memset(crop->reserved, 0, sizeof(crop->reserved));
-		rval = check_crop(sd, crop);
-		if (rval)
-			return rval;
-
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
 		sel.pad = crop->pad;
@@ -361,13 +464,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
 		struct v4l2_subdev_mbus_code_enum *code = arg;
 
-		if (code->which != V4L2_SUBDEV_FORMAT_TRY &&
-		    code->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-			return -EINVAL;
-
-		if (code->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(code->reserved, 0, sizeof(code->reserved));
 		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->pad,
 					code);
@@ -376,13 +472,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
 		struct v4l2_subdev_frame_size_enum *fse = arg;
 
-		if (fse->which != V4L2_SUBDEV_FORMAT_TRY &&
-		    fse->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-			return -EINVAL;
-
-		if (fse->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(fse->reserved, 0, sizeof(fse->reserved));
 		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->pad,
 					fse);
@@ -391,9 +480,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (fi->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, g_frame_interval, arg);
 	}
@@ -401,9 +487,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (fi->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
 	}
@@ -411,13 +494,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval_enum *fie = arg;
 
-		if (fie->which != V4L2_SUBDEV_FORMAT_TRY &&
-		    fie->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-			return -EINVAL;
-
-		if (fie->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(fie->reserved, 0, sizeof(fie->reserved));
 		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->pad,
 					fie);
@@ -426,10 +502,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_SELECTION: {
 		struct v4l2_subdev_selection *sel = arg;
 
-		rval = check_selection(sd, sel);
-		if (rval)
-			return rval;
-
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, get_selection, subdev_fh->pad, sel);
@@ -438,10 +510,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_SELECTION: {
 		struct v4l2_subdev_selection *sel = arg;
 
-		rval = check_selection(sd, sel);
-		if (rval)
-			return rval;
-
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, set_selection, subdev_fh->pad, sel);
@@ -450,38 +518,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_G_EDID: {
 		struct v4l2_subdev_edid *edid = arg;
 
-		rval = check_edid(sd, edid);
-		if (rval)
-			return rval;
-
 		return v4l2_subdev_call(sd, pad, get_edid, edid);
 	}
 
 	case VIDIOC_S_EDID: {
 		struct v4l2_subdev_edid *edid = arg;
 
-		rval = check_edid(sd, edid);
-		if (rval)
-			return rval;
-
 		return v4l2_subdev_call(sd, pad, set_edid, edid);
 	}
 
 	case VIDIOC_SUBDEV_DV_TIMINGS_CAP: {
 		struct v4l2_dv_timings_cap *cap = arg;
 
-		if (cap->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		return v4l2_subdev_call(sd, pad, dv_timings_cap, cap);
 	}
 
 	case VIDIOC_SUBDEV_ENUM_DV_TIMINGS: {
 		struct v4l2_enum_dv_timings *dvt = arg;
 
-		if (dvt->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		return v4l2_subdev_call(sd, pad, enum_dv_timings, dvt);
 	}
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a7fa5b80915a..e1e3c18c3fd6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1091,6 +1091,8 @@ void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg);
 void v4l2_subdev_init(struct v4l2_subdev *sd,
 		      const struct v4l2_subdev_ops *ops);
 
+extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
+
 /**
  * v4l2_subdev_call - call an operation of a v4l2_subdev.
  *
@@ -1112,6 +1114,10 @@ void v4l2_subdev_init(struct v4l2_subdev *sd,
 			__result = -ENODEV;				\
 		else if (!(__sd->ops->o && __sd->ops->o->f))		\
 			__result = -ENOIOCTLCMD;			\
+		else if (v4l2_subdev_call_wrappers.o &&			\
+			 v4l2_subdev_call_wrappers.o->f)		\
+			__result = v4l2_subdev_call_wrappers.o->f(	\
+							__sd, ##args);	\
 		else							\
 			__result = __sd->ops->o->f(__sd, ##args);	\
 		__result;						\
-- 
2.21.0

