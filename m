Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E7F1AE17
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2019 22:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfELUQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 May 2019 16:16:12 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44829 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbfELUQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 May 2019 16:16:11 -0400
Received: by mail-lf1-f66.google.com with SMTP id n134so7464098lfn.11;
        Sun, 12 May 2019 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=danRkZ9JKwXCg9PoO9hbEsKI44VYWoTAG9NK0/Sog+0=;
        b=vUALBzsjsntG1a5LzzWv+OJ0mIEP6tEDyFPzJ8noK77LbPra1FXsG2lGuzG1oDJ1hm
         Op0B+yHYZQeVEF6izQuuNhMvxJ24fuf/OQN2AfzITrplejoj3h52nX/mijqyaCz/JL2b
         N9V5OGHEjDxs8u6fO08ZE2Ab8uiQhQlWUS2wtfSNIkyXvIFxlDR9Vp8+daobZGce58dJ
         hHTvdpocAkhZx65NR0B1WgwA+fw8+I3ic57vJNQ15BMUcr4tRvouharBwJgIj0Y3hElq
         fj3xROptCiF9y1gOC7+0i/XJCVTomsUAkwfMcM0WBQ/EeIXk4bt5e6YyeafBvmlL+rCp
         dfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=danRkZ9JKwXCg9PoO9hbEsKI44VYWoTAG9NK0/Sog+0=;
        b=pcdDZoOwg3pHtbmogM16tIP2IFuzSYrPCFGTHfS+dnjjsGXlslJZ0iyV1uTL+V8y80
         UR6f4Q9iIwvsMpwAnvKhsSgn1c24zIU8CpE8sz+v3AWW0t0LeNFrUKKJfbKRLv2GeE6u
         6bL4nbqY0fsYheb1UkswpuiXmiHotUyqRQyKWhDPoL0owHB6I38SckWwaNNly3bBC4gS
         IkFcylIgYhycvodCU+hgSuH30qeBNuRbHB8o66EGQqCiZFwc92S7zl9nFdAvpLvikD+n
         b9fUgfLTaplt3cuEW50Vxg5JKZU/h/Y9gkgqeLjawkZXuvSyuQVnrCVxlOXgP3N83kan
         SP/g==
X-Gm-Message-State: APjAAAVmam+O5ejTH52rrx/WqRAnq5M7Z/q9toHZYlZJstRmvSshVdDu
        vsAsKktTrDK9bqFaeiSWgfE=
X-Google-Smtp-Source: APXvYqxioIKCAjoP3tt/AmaaeFEBUsmKUPMvmEa0JjIuFRrhekLHhobvcgqlpa3eQJsI1htsnW97sA==
X-Received: by 2002:ac2:514b:: with SMTP id q11mr11558243lfd.114.1557692168008;
        Sun, 12 May 2019 13:16:08 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id w20sm2360533ljd.39.2019.05.12.13.16.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 13:16:07 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v5 1/4] media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
Date:   Sun, 12 May 2019 22:15:48 +0200
Message-Id: <20190512201551.18724-2-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190512201551.18724-1-jmkrzyszt@gmail.com>
References: <20190512201551.18724-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Correctness of format type (try or active) and pad ID parameters passed
to subdevice operation callbacks is now verified only for IOCTL calls.
However, those callbacks are also used by drivers, e.g., V4L2 host
interfaces.

Since both subdev_do_ioctl() and drivers are using v4l2_subdev_call()
macro while calling subdevice operations, move those parameter checks
from subdev_do_ioctl() to v4l2_subdev_call() so we can avoid taking care
of those checks inside drivers.

Define a wrapper function for each operation callback in scope, then
gather those wrappers in a static v4l2_subdev_ops structure so the
v4l2_subdev_call() macro can find them easy if provided.  Move reusable
code to helpers.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 227 ++++++++++++++++----------
 include/media/v4l2-subdev.h           |   6 +
 2 files changed, 143 insertions(+), 90 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d75815ab0d7b..890916674d42 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -120,56 +120,168 @@ static int subdev_close(struct file *file)
 	return 0;
 }
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-static int check_format(struct v4l2_subdev *sd,
-			struct v4l2_subdev_format *format)
+static int check_which(__u32 which)
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
+static int check_pad(struct v4l2_subdev *sd, __u32 pad)
 {
-	if (crop->which != V4L2_SUBDEV_FORMAT_TRY &&
-	    crop->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	if (sd->entity.num_pads && pad >= sd->entity.num_pads)
 		return -EINVAL;
+#endif
+	return 0;
+}
 
-	if (crop->pad >= sd->entity.num_pads)
-		return -EINVAL;
+static int check_format(struct v4l2_subdev *sd,
+			struct v4l2_subdev_format *format)
+{
+	return check_which(format->which) ? : check_pad(sd, format->pad);
+}
 
-	return 0;
+static int check_get_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_format *format)
+{
+	return check_format(sd, format) ? :
+	       sd->ops->pad->get_fmt(sd, cfg, format);
+}
+
+static int check_set_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_format *format)
+{
+	return check_format(sd, format) ? :
+	       sd->ops->pad->set_fmt(sd, cfg, format);
+}
+
+static int check_enum_mbus_code(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_mbus_code_enum *code)
+{
+	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
+	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
+}
+
+static int check_enum_frame_size(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_frame_size_enum *fse)
+{
+	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
+	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
+}
+
+static int check_frame_interval(struct v4l2_subdev *sd,
+				struct v4l2_subdev_frame_interval *fi)
+{
+	return check_pad(sd, fi->pad);
+}
+
+static int check_g_frame_interval(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_frame_interval *fi)
+{
+	return check_frame_interval(sd, fi) ? :
+	       sd->ops->video->g_frame_interval(sd, fi);
+}
+
+static int check_s_frame_interval(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_frame_interval *fi)
+{
+	return check_frame_interval(sd, fi) ? :
+	       sd->ops->video->s_frame_interval(sd, fi);
+}
+
+static int check_enum_frame_interval(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_frame_interval_enum *fie)
+{
+	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
+	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
 }
 
 static int check_selection(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_selection *sel)
 {
-	if (sel->which != V4L2_SUBDEV_FORMAT_TRY &&
-	    sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	return check_which(sel->which) ? : check_pad(sd, sel->pad);
+}
 
-	if (sel->pad >= sd->entity.num_pads)
-		return -EINVAL;
+static int check_get_selection(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_selection *sel)
+{
+	return check_selection(sd, sel) ? :
+	       sd->ops->pad->get_selection(sd, cfg, sel);
+}
 
-	return 0;
+static int check_set_selection(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_selection *sel)
+{
+	return check_selection(sd, sel) ? :
+	       sd->ops->pad->set_selection(sd, cfg, sel);
 }
 
 static int check_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
 {
-	if (edid->pad >= sd->entity.num_pads)
-		return -EINVAL;
-
 	if (edid->blocks && edid->edid == NULL)
 		return -EINVAL;
 
-	return 0;
+	return check_pad(sd, edid->pad);
 }
-#endif
+
+static int check_get_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
+{
+	return check_edid(sd, edid) ? : sd->ops->pad->get_edid(sd, edid);
+}
+
+static int check_set_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
+{
+	return check_edid(sd, edid) ? : sd->ops->pad->set_edid(sd, edid);
+}
+
+static int check_dv_timings_cap(struct v4l2_subdev *sd,
+				struct v4l2_dv_timings_cap *cap)
+{
+	return check_pad(sd, cap->pad) ? :
+	       sd->ops->pad->dv_timings_cap(sd, cap);
+}
+
+static int check_enum_dv_timings(struct v4l2_subdev *sd,
+				 struct v4l2_enum_dv_timings *dvt)
+{
+	return check_pad(sd, dvt->pad) ? :
+	       sd->ops->pad->enum_dv_timings(sd, dvt);
+}
+
+static const struct v4l2_subdev_pad_ops v4l2_subdev_pad_chk_args = {
+	.get_fmt		= check_get_fmt,
+	.set_fmt		= check_set_fmt,
+	.enum_mbus_code		= check_enum_mbus_code,
+	.enum_frame_size	= check_enum_frame_size,
+	.enum_frame_interval	= check_enum_frame_interval,
+	.get_selection		= check_get_selection,
+	.set_selection		= check_set_selection,
+	.get_edid		= check_get_edid,
+	.set_edid		= check_set_edid,
+	.dv_timings_cap		= check_dv_timings_cap,
+	.enum_dv_timings	= check_enum_dv_timings,
+};
+
+static const struct v4l2_subdev_video_ops v4l2_subdev_video_chk_args = {
+	.g_frame_interval	= check_g_frame_interval,
+	.s_frame_interval	= check_s_frame_interval,
+};
+
+struct v4l2_subdev_ops v4l2_subdev_call_chk_args = {
+	.pad	= &v4l2_subdev_pad_chk_args,
+	.video	= &v4l2_subdev_video_chk_args,
+};
+EXPORT_SYMBOL(v4l2_subdev_call_chk_args);
 
 static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 {
@@ -292,10 +404,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
-		rval = check_format(sd, format);
-		if (rval)
-			return rval;
-
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
@@ -304,10 +412,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
-		rval = check_format(sd, format);
-		if (rval)
-			return rval;
-
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
@@ -317,10 +421,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_crop *crop = arg;
 		struct v4l2_subdev_selection sel;
 
-		rval = check_crop(sd, crop);
-		if (rval)
-			return rval;
-
 		memset(crop->reserved, 0, sizeof(crop->reserved));
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
@@ -340,10 +440,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_selection sel;
 
 		memset(crop->reserved, 0, sizeof(crop->reserved));
-		rval = check_crop(sd, crop);
-		if (rval)
-			return rval;
-
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
 		sel.pad = crop->pad;
@@ -361,13 +457,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
@@ -376,13 +465,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
@@ -391,9 +473,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (fi->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, g_frame_interval, arg);
 	}
@@ -401,9 +480,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (fi->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
 	}
@@ -411,13 +487,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
@@ -426,10 +495,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_SELECTION: {
 		struct v4l2_subdev_selection *sel = arg;
 
-		rval = check_selection(sd, sel);
-		if (rval)
-			return rval;
-
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, get_selection, subdev_fh->pad, sel);
@@ -438,10 +503,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_SELECTION: {
 		struct v4l2_subdev_selection *sel = arg;
 
-		rval = check_selection(sd, sel);
-		if (rval)
-			return rval;
-
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, set_selection, subdev_fh->pad, sel);
@@ -450,38 +511,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
index a7fa5b80915a..900f265fd950 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1091,6 +1091,8 @@ void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg);
 void v4l2_subdev_init(struct v4l2_subdev *sd,
 		      const struct v4l2_subdev_ops *ops);
 
+extern struct v4l2_subdev_ops v4l2_subdev_call_chk_args;
+
 /**
  * v4l2_subdev_call - call an operation of a v4l2_subdev.
  *
@@ -1112,6 +1114,10 @@ void v4l2_subdev_init(struct v4l2_subdev *sd,
 			__result = -ENODEV;				\
 		else if (!(__sd->ops->o && __sd->ops->o->f))		\
 			__result = -ENOIOCTLCMD;			\
+		else if (v4l2_subdev_call_chk_args.o &&			\
+			 v4l2_subdev_call_chk_args.o->f)		\
+			__result = v4l2_subdev_call_chk_args.o->f(	\
+							__sd, ##args);	\
 		else							\
 			__result = __sd->ops->o->f(__sd, ##args);	\
 		__result;						\
-- 
2.21.0

