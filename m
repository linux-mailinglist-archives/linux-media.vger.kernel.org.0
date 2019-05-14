Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20B021E551
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 00:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfENWut (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 18:50:49 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38491 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbfENWus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 18:50:48 -0400
Received: by mail-lf1-f67.google.com with SMTP id y19so447979lfy.5;
        Tue, 14 May 2019 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dcnd8w4/FwhNltp/dtU3SYX5HTO8WeleMrMuq0LDXB4=;
        b=PZ0hgjTGi16DBf4J7/7OE9zlunOhNg/aiNHgm9L84R1hhPnIDUDZR42MPy+PxUU1Rz
         fmhvr4oipOtFV/G+WJ0Xgu50s5OAA4N8s1qiYvtXLrofH1B2J69J6/4VK6Ns2C7hqj9t
         xVsTe2wzpGqp++cBvJNOr8DNH7GFAsFTgiplKou0GDwBqp39LYumk63LFB5BgknMbhtR
         U8HFlFlw0MZJv45Oak5fw8ODKj7apY2oHxwWcNQlsK84pVVNd90ZPQ0EtMRRJoGd68oi
         TROooLLlF8yJUAxXrKIZVwoRsac1qkPy4U/p4vWMt5ygS/V9NFBlANbhn9JIYpqB+6iP
         ggHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dcnd8w4/FwhNltp/dtU3SYX5HTO8WeleMrMuq0LDXB4=;
        b=FvcKeyLZ0C3uQyWc/xK4lNCFx+7oCLzE/mBECs6T+WKFQd453lv/AMlEDt82eX1dm+
         rxIYnrqGKwN2MyktzX8t7mjpkwZDqgScriz+k3gKdbf2FRVWRHzOB1U4SBiXZAw3WbFY
         JI/PO4tw4BbTeNqJOrtAgCFu9x//scrqv4rvh0qtTuYgcMTS9Wv1mByznGwG/ajrLP6k
         m3Fwas9toqYux3J3sm+OVXa7phEZZwEcsPnRCqpdNmA+p11yb7KlfEyG540c42nHjKdh
         BwhCtXXjf+woHnD0gRX6IoiKC3a/Rng8Vl5b6dbbOH9tSrziZlBDcmZ1hIVKWirm1Gee
         XxYA==
X-Gm-Message-State: APjAAAWiek2uIg9vuaKnDoMTa1Nx5euJ22kJuQQiXaUyvwfveSbc+4va
        PJOfWLCQgjX5US7ILsqRiN0=
X-Google-Smtp-Source: APXvYqw3Oxw/0SLn+M6zooE9/Tk+Omrr1rJU4JsteL7kAWaRnZCIQzcdmbWUeIcJsfUNDU6LdPHlNA==
X-Received: by 2002:ac2:518b:: with SMTP id u11mr17787419lfi.30.1557874242508;
        Tue, 14 May 2019 15:50:42 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id s6sm50190lje.89.2019.05.14.15.50.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 15:50:41 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v6 1/3] media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
Date:   Wed, 15 May 2019 00:48:21 +0200
Message-Id: <20190514224823.11564-2-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514224823.11564-1-jmkrzyszt@gmail.com>
References: <20190514224823.11564-1-jmkrzyszt@gmail.com>
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
 drivers/media/v4l2-core/v4l2-subdev.c | 232 ++++++++++++++++----------
 include/media/v4l2-subdev.h           |   6 +
 2 files changed, 146 insertions(+), 92 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d75815ab0d7b..c61c95007d89 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -120,56 +120,169 @@ static int subdev_close(struct file *file)
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
+	if (sd->entity.num_pads && pad >= sd->entity.num_pads)
 		return -EINVAL;
+#endif
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
@@ -292,10 +405,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
-		rval = check_format(sd, format);
-		if (rval)
-			return rval;
-
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
@@ -304,10 +413,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
-		rval = check_format(sd, format);
-		if (rval)
-			return rval;
-
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
@@ -317,10 +422,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_crop *crop = arg;
 		struct v4l2_subdev_selection sel;
 
-		rval = check_crop(sd, crop);
-		if (rval)
-			return rval;
-
 		memset(crop->reserved, 0, sizeof(crop->reserved));
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
@@ -340,10 +441,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_selection sel;
 
 		memset(crop->reserved, 0, sizeof(crop->reserved));
-		rval = check_crop(sd, crop);
-		if (rval)
-			return rval;
-
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
 		sel.pad = crop->pad;
@@ -361,13 +458,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
@@ -376,13 +466,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
@@ -391,9 +474,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (fi->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, g_frame_interval, arg);
 	}
@@ -401,9 +481,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (fi->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
 	}
@@ -411,13 +488,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
@@ -426,10 +496,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_SELECTION: {
 		struct v4l2_subdev_selection *sel = arg;
 
-		rval = check_selection(sd, sel);
-		if (rval)
-			return rval;
-
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, get_selection, subdev_fh->pad, sel);
@@ -438,10 +504,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_SELECTION: {
 		struct v4l2_subdev_selection *sel = arg;
 
-		rval = check_selection(sd, sel);
-		if (rval)
-			return rval;
-
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, set_selection, subdev_fh->pad, sel);
@@ -450,38 +512,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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

