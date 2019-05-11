Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5CD1A5DE
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2019 02:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfEKAhw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 20:37:52 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34732 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbfEKAhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 20:37:51 -0400
Received: by mail-lj1-f193.google.com with SMTP id j24so5697175ljg.1;
        Fri, 10 May 2019 17:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SoENxojZ1w/kzXXTcjonW1d0cOOtTjQQz9POaMTb07Y=;
        b=doo8poFVncJmlaeOJU+4+oVBCthxgC7jMWW4/wZdcVcs233s7iSyKjiJyYnmM/2NxE
         P6a67kh4YyZxe6AaMOxl8Re90DJwSWm5DqmFc+oNzAcbprAzEtbuE9RmZT10GA/46wRJ
         v9VNjrgfLkz8+vl0jh5BmUdhGa1Ld/txZJqqT9wXwFMWBt/u33War2vOAJp7HYAGb+DL
         +QRlt9H8QwREF6naBA5e3IdG+gH8b/aDUnhCNqSYCJP0v1yslUercwfgdjnJ7w1tcfuM
         2CokEnEKY02nVNpyKej3hq6IeTsEeSgtVNJejf9xwAkafsR0YOA4k64Dwyh4LYaakl/y
         XH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SoENxojZ1w/kzXXTcjonW1d0cOOtTjQQz9POaMTb07Y=;
        b=s1fPh7Xv4k+N87A8XuRcrI2Qq7hJafZ/aqN/KXRi6REnrpg9LSffwtK68Fp3VJjgNi
         R1kDzXuleTxOUEs504b6xTrzhK9zMy0XxCAxe3z5N7Zg4QoScfcaxq0uezzpbH7deA2h
         A3IEVuM6X4upeew1YSLLPEI0wrDp37FukbzECx0MovhEhp60Ua+5/I7Jeq9L3KFEDo7x
         1rv+R3H87zJqmHittGkTurFrBW7VZzGpGOBVXBouglX3k+BGwOIcgeOzzDYuTu+Fi8nm
         68n8PNzVie6K6HrkBNRQJH73Gup9KBlTQa965tCCSZwpjh0GxCSYZOA64qllARgRFXrg
         vJhA==
X-Gm-Message-State: APjAAAXC0hjpmxtgwqbkbqVvkHgFqBEzKDaxp/yI7TdZ29FZVOXyoR8b
        hAJ3jOpKvS/yhDy3sQNIrJE=
X-Google-Smtp-Source: APXvYqynOiq7QA4YHEuKtFye3TOnnCyYfAWy5+VEEcuk71719wf8LrK0kHCmzwNCLCUAA7rMfstgJg==
X-Received: by 2002:a2e:3604:: with SMTP id d4mr7055837lja.157.1557535068770;
        Fri, 10 May 2019 17:37:48 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id y19sm1899179lfl.40.2019.05.10.17.37.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 17:37:47 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2] media: v4l2-subdev: Verify arguments of v4l2_subdev_call()
Date:   Sat, 11 May 2019 02:37:20 +0200
Message-Id: <20190511003720.10984-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
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
from subdev_do_ioctl() to v4l2_subdev_call() so we can avoid
reimplementing those checks inside drivers.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changelog:
v1->v2:
- replace the horrible macro with a structure of wrapper functions;
  inspired by Hans' and Sakari's comments - thanks!
 
drivers/media/v4l2-core/v4l2-subdev.c | 222 +++++++++++++++-----------
 include/media/v4l2-subdev.h           |   6 +
 2 files changed, 139 insertions(+), 89 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d75815ab0d7b..213194660d52 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -120,56 +120,165 @@ static int subdev_close(struct file *file)
 	return 0;
 }
 
+static inline int check_which(__u32 which)
+{
+	return which != V4L2_SUBDEV_FORMAT_TRY &&
+	       which != V4L2_SUBDEV_FORMAT_ACTIVE ? -EINVAL : 0;
+}
+
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
+static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
+{
+	return pad >= sd->entity.num_pads ? -EINVAL : 0;
+}
+#else
+#define check_pad(...) 0
+#endif
+
 static int check_format(struct v4l2_subdev *sd,
 			struct v4l2_subdev_format *format)
 {
-	if (format->which != V4L2_SUBDEV_FORMAT_TRY &&
-	    format->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	return check_which(format->which) ? : check_pad(sd, format->pad);
+}
 
-	if (format->pad >= sd->entity.num_pads)
-		return -EINVAL;
+static int check_get_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_format *format)
+{
+	return check_format(sd, format) ? :
+			sd->ops->pad->get_fmt(sd, cfg, format);
+}
 
-	return 0;
+static int check_set_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_format *format)
+{
+	return check_format(sd, format) ? :
+			sd->ops->pad->set_fmt(sd, cfg, format);
 }
 
-static int check_crop(struct v4l2_subdev *sd, struct v4l2_subdev_crop *crop)
+static int check_enum_mbus_code(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (crop->which != V4L2_SUBDEV_FORMAT_TRY &&
-	    crop->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
+			sd->ops->pad->enum_mbus_code(sd, cfg, code);
+}
 
-	if (crop->pad >= sd->entity.num_pads)
-		return -EINVAL;
+static int check_enum_frame_size(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_frame_size_enum *fse)
+{
+	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
+			sd->ops->pad->enum_frame_size(sd, cfg, fse);
+}
 
-	return 0;
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
+			sd->ops->video->g_frame_interval(sd, fi);
+}
+
+static int check_s_frame_interval(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_frame_interval *fi)
+{
+	return check_frame_interval(sd, fi) ? :
+			sd->ops->video->s_frame_interval(sd, fi);
+}
+
+static int check_enum_frame_interval(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_frame_interval_enum *fie)
+{
+	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
+			sd->ops->pad->enum_frame_interval(sd, cfg, fie);
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
+			sd->ops->pad->get_selection(sd, cfg, sel);
+}
 
-	return 0;
+static int check_set_selection(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_selection *sel)
+{
+	return check_selection(sd, sel) ? :
+			sd->ops->pad->set_selection(sd, cfg, sel);
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
+}
+
+static int check_get_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
+{
+	return check_edid(sd, edid) ? : sd->ops->pad->get_edid(sd, edid);
 }
-#endif
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
+			sd->ops->pad->dv_timings_cap(sd, cap);
+}
+
+static int check_enum_dv_timings(struct v4l2_subdev *sd,
+				 struct v4l2_enum_dv_timings *dvt)
+{
+	return check_pad(sd, dvt->pad) ? :
+			sd->ops->pad->enum_dv_timings(sd, dvt);
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
@@ -292,10 +401,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
-		rval = check_format(sd, format);
-		if (rval)
-			return rval;
-
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
@@ -304,10 +409,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
-		rval = check_format(sd, format);
-		if (rval)
-			return rval;
-
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
@@ -317,10 +418,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_crop *crop = arg;
 		struct v4l2_subdev_selection sel;
 
-		rval = check_crop(sd, crop);
-		if (rval)
-			return rval;
-
 		memset(crop->reserved, 0, sizeof(crop->reserved));
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
@@ -340,10 +437,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_selection sel;
 
 		memset(crop->reserved, 0, sizeof(crop->reserved));
-		rval = check_crop(sd, crop);
-		if (rval)
-			return rval;
-
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
 		sel.pad = crop->pad;
@@ -361,13 +454,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
@@ -376,13 +462,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
@@ -391,9 +470,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (fi->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, g_frame_interval, arg);
 	}
@@ -401,9 +477,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (fi->pad >= sd->entity.num_pads)
-			return -EINVAL;
-
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
 	}
@@ -411,13 +484,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
@@ -426,10 +492,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_G_SELECTION: {
 		struct v4l2_subdev_selection *sel = arg;
 
-		rval = check_selection(sd, sel);
-		if (rval)
-			return rval;
-
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, get_selection, subdev_fh->pad, sel);
@@ -438,10 +500,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_SELECTION: {
 		struct v4l2_subdev_selection *sel = arg;
 
-		rval = check_selection(sd, sel);
-		if (rval)
-			return rval;
-
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, set_selection, subdev_fh->pad, sel);
@@ -450,38 +508,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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

