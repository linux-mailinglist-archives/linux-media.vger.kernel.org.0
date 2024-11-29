Return-Path: <linux-media+bounces-22365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D819DEC67
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 20:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86FF428175E
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 19:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17991A2567;
	Fri, 29 Nov 2024 19:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YMKiYfRV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9225F1A2543
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 19:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732908511; cv=none; b=aWKPfgOcvq8IovglKpDxXcnHwMjuswUzpN1yJeUdqb54PUBYEvfSEUyKYPcEdHT75P8WYlRbJnDJtDY656HbnPv3l2Dz+4JWO5sDlymFaMG4ZtwcLM4jDi1BNpeutYkbeXtoUyBKvqogFERZbIvNBmvgLeIKdStiiVvMreySGu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732908511; c=relaxed/simple;
	bh=Cgcbp6qez5SBKxJsZZNqx/40+s6dzeX0l7p170v6KME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NOXdfsgHbD92mvRGHShDlLOsk9E8KtFA7YUmXNH58OlqsEbAe0YYsfWZ8bq7q3t98wH0RQGgSeVYDc4IhklWJhSm7clkZKTFZxNeZemP9cGP5rANg1Fgp2MVmB4VTtQ6prq23SeOsz/CNxV162yiMPL8ef80dlmGzHbYsgGr7g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YMKiYfRV; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b66d5f6ec8so148902985a.0
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 11:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732908508; x=1733513308; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMjLrhak7emeEGQAr5hNiFOWhZ4QE7VyWOQvbrmhiU4=;
        b=YMKiYfRVo25q37THIG8MQj01vtYKTv5JYFpEn2vZO0yDw0Lq3JTA52CUdLaD/H5fKr
         LgWpKe5UvhH+rE9k5tlSDTmyDAnmn1ywJdPrS+Q7n4xgAKulT469JiMOnzjq3wO8XvZV
         0dw5YjOdb8BjZ6fyivW+/2qrNNUYpSPZ75XPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732908508; x=1733513308;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMjLrhak7emeEGQAr5hNiFOWhZ4QE7VyWOQvbrmhiU4=;
        b=FpcDqdvxUZyZwn51XtzhSz7xOnGh/UNNmeVDsQsTR4zbKjWAqBGsruMUe/WB5NR6xE
         FjU7QbOHiRzWtRlATTuKjW6skJItEuosEpJmg8qUp2oyYA9M5VgxBFfdcLZM7qsoJGBo
         zKde8eRXDBtYg00v0bU3EuiKEni0bwqOfeP+duk4lEdJYuoosrAvN1Tw7vtLhEQTnPMn
         mM0ypW93n57zK7ctdW1S8ctc8++g8e3qRIQ0dwVCcfFmtSHjMQxacVAKxNoXqOKKoRot
         DBWit/Zuix0siNxVCTyiHCkyIehDqRXSeeBLUUaZiyBUPyCKeUjB14DiB2ZNW00C3vYN
         gIEA==
X-Gm-Message-State: AOJu0YzVZBoxkmH1gNHnqrR6r9PLhi0Td9kGpg+oUrXZrhMfkq4oIjCj
	b8J/CNKgM2rnTjz47ypZN9DOq0YyzGl6vjd1l1rykQ4mFrEIXkJT2xNxgwFqAA==
X-Gm-Gg: ASbGncul5cicwS/vD54H/MrZRF31UZrdavHHoYTWniTF9QvOa2OKC9fAxyJozJr/O60
	FlT7wFhgOn3He5Qhfs7HA+r6TuVoXcLwHV68mF3ak2ORCUFMH9vPIcqiwdtQuvMUMUOrwN8XvbC
	W5Xr+g+lAAcbrs08z8fnvW2UBcDVgV5y0ymGNjLoELaQTXaQxhUAAV1aaCf/M3xhcIxv20I7o0c
	rUaEvBgXoGqihMOjmMF68IVOoh8cYOYy1g8VL8OtIhvpudnXV3AIo2z16IFrgFY1QDDp/SKOLGB
	d1mc4wVAXd1oAVT8KmBNuxvM
X-Google-Smtp-Source: AGHT+IGuCDNyzHI8S9pwqB2Ms7ffUr3w3ETlMCIDqHDQA3SZ/AAMCR53hhJ2/xIYpkwRNeRhRDlG+A==
X-Received: by 2002:a05:620a:2794:b0:7ae:310a:84e5 with SMTP id af79cd13be357-7b67c2525b8mr1853428585a.8.1732908508517;
        Fri, 29 Nov 2024 11:28:28 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6849b7275sm165318885a.105.2024.11.29.11.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 11:28:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 19:28:26 +0000
Subject: [PATCH v2] media: uvcvideo: Remove duplicated cap/out code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-uvc-dup-cap-out-v2-1-596cb9bdd5e8@chromium.org>
X-B4-Tracking: v=1; b=H4sIANkVSmcC/3WNOw7CMBBErxJtzSJ/EEhU3AOl8I94i8TROrZAk
 e+OSY+meiPNmx1yYAoZ7sMOHCplSksHdRrARbNMAcl3BiXURUp1w1Id+rKiMyumsuHVCO2EDFo
 YDX21cnjR+zA+x86R8pb4cxxU+Wv/u6rEHuud8coba8XDRU4zlfmceIKxtfYFbddg9rEAAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The *_vid_cap and *_vid_out helpers seem to be identical:
- Remove all the cap/out duplicated code.
- Remove s/g_parm helpers
- Reorder uvc_ioctl_ops

And now that we are at it, fix a comment for uvc_acquire_privileges()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Unless I miss something, cap and out helpers are identical. So there is
no need to duplicate code
---
Changes in v2:
- Add missing acquire_privileges.
- Also remove helper for s/g_parm.
- Reorder callbacks.
- Link to v1: https://lore.kernel.org/r/20241127-uvc-dup-cap-out-v1-1-1bdcad2dabb0@chromium.org
---
 drivers/media/usb/uvc/uvc_v4l2.c | 162 +++++++++++----------------------------
 1 file changed, 43 insertions(+), 119 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 97c5407f6603..42f0f8a89865 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -26,6 +26,8 @@
 
 #include "uvcvideo.h"
 
+static int uvc_acquire_privileges(struct uvc_fh *handle);
+
 static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
 				      struct uvc_control_mapping *map,
 				      const struct uvc_xu_control_mapping *xmap)
@@ -361,9 +363,11 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	return ret;
 }
 
-static int uvc_v4l2_get_format(struct uvc_streaming *stream,
-	struct v4l2_format *fmt)
+static int uvc_ioctl_g_fmt(struct file *file, void *fh,
+			   struct v4l2_format *fmt)
 {
+	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format;
 	const struct uvc_frame *frame;
 	int ret = 0;
@@ -395,14 +399,20 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
 	return ret;
 }
 
-static int uvc_v4l2_set_format(struct uvc_streaming *stream,
-	struct v4l2_format *fmt)
+static int uvc_ioctl_s_fmt(struct file *file, void *fh,
+			   struct v4l2_format *fmt)
 {
+	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 	const struct uvc_format *format;
 	const struct uvc_frame *frame;
 	int ret;
 
+	ret = uvc_acquire_privileges(handle);
+	if (ret)
+		return ret;
+
 	if (fmt->type != stream->type)
 		return -EINVAL;
 
@@ -426,10 +436,12 @@ static int uvc_v4l2_set_format(struct uvc_streaming *stream,
 	return ret;
 }
 
-static int uvc_v4l2_get_streamparm(struct uvc_streaming *stream,
-		struct v4l2_streamparm *parm)
+static int uvc_ioctl_g_parm(struct file *file, void *fh,
+			    struct v4l2_streamparm *parm)
 {
 	u32 numerator, denominator;
+	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
 
 	if (parm->type != stream->type)
 		return -EINVAL;
@@ -461,9 +473,11 @@ static int uvc_v4l2_get_streamparm(struct uvc_streaming *stream,
 	return 0;
 }
 
-static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
-		struct v4l2_streamparm *parm)
+static int uvc_ioctl_s_parm(struct file *file, void *fh,
+			    struct v4l2_streamparm *parm)
 {
+	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 	struct v4l2_fract timeperframe;
 	const struct uvc_format *format;
@@ -472,6 +486,10 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
 	unsigned int i;
 	int ret;
 
+	ret = uvc_acquire_privileges(handle);
+	if (ret < 0)
+		return ret;
+
 	if (parm->type != stream->type)
 		return -EINVAL;
 
@@ -573,6 +591,7 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
  * - VIDIOC_S_INPUT
  * - VIDIOC_S_PARM
  * - VIDIOC_S_FMT
+ * - VIDIOC_CREATE_BUFS
  * - VIDIOC_REQBUFS
  */
 static int uvc_acquire_privileges(struct uvc_fh *handle)
@@ -685,11 +704,13 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
+static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
 			      struct v4l2_fmtdesc *fmt)
 {
-	const struct uvc_format *format;
+	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
 	enum v4l2_buf_type type = fmt->type;
+	const struct uvc_format *format;
 	u32 index = fmt->index;
 
 	if (fmt->type != stream->type || fmt->index >= stream->nformats)
@@ -707,82 +728,8 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
 	return 0;
 }
 
-static int uvc_ioctl_enum_fmt_vid_cap(struct file *file, void *fh,
-				      struct v4l2_fmtdesc *fmt)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-
-	return uvc_ioctl_enum_fmt(stream, fmt);
-}
-
-static int uvc_ioctl_enum_fmt_vid_out(struct file *file, void *fh,
-				      struct v4l2_fmtdesc *fmt)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-
-	return uvc_ioctl_enum_fmt(stream, fmt);
-}
-
-static int uvc_ioctl_g_fmt_vid_cap(struct file *file, void *fh,
-				   struct v4l2_format *fmt)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-
-	return uvc_v4l2_get_format(stream, fmt);
-}
-
-static int uvc_ioctl_g_fmt_vid_out(struct file *file, void *fh,
-				   struct v4l2_format *fmt)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-
-	return uvc_v4l2_get_format(stream, fmt);
-}
-
-static int uvc_ioctl_s_fmt_vid_cap(struct file *file, void *fh,
-				   struct v4l2_format *fmt)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
-
-	return uvc_v4l2_set_format(stream, fmt);
-}
-
-static int uvc_ioctl_s_fmt_vid_out(struct file *file, void *fh,
-				   struct v4l2_format *fmt)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
-
-	return uvc_v4l2_set_format(stream, fmt);
-}
-
-static int uvc_ioctl_try_fmt_vid_cap(struct file *file, void *fh,
-				     struct v4l2_format *fmt)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	struct uvc_streaming_control probe;
-
-	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
-}
-
-static int uvc_ioctl_try_fmt_vid_out(struct file *file, void *fh,
-				     struct v4l2_format *fmt)
+static int uvc_ioctl_try_fmt(struct file *file, void *fh,
+			     struct v4l2_format *fmt)
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
@@ -1212,29 +1159,6 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_ioctl_g_parm(struct file *file, void *fh,
-			    struct v4l2_streamparm *parm)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-
-	return uvc_v4l2_get_streamparm(stream, parm);
-}
-
-static int uvc_ioctl_s_parm(struct file *file, void *fh,
-			    struct v4l2_streamparm *parm)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
-
-	return uvc_v4l2_set_streamparm(stream, parm);
-}
-
 static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
 				     struct v4l2_frmsizeenum *fsize)
 {
@@ -1543,15 +1467,17 @@ static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
 #endif
 
 const struct v4l2_ioctl_ops uvc_ioctl_ops = {
+	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
+	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
+	.vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt,
+	.vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt,
+	.vidioc_g_parm = uvc_ioctl_g_parm,
+	.vidioc_s_parm = uvc_ioctl_s_parm,
 	.vidioc_querycap = uvc_ioctl_querycap,
-	.vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt_vid_cap,
-	.vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt_vid_out,
-	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt_vid_cap,
-	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt_vid_out,
-	.vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt_vid_cap,
-	.vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt_vid_out,
-	.vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt_vid_cap,
-	.vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt_vid_out,
+	.vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt,
+	.vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt,
+	.vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
+	.vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
 	.vidioc_reqbufs = uvc_ioctl_reqbufs,
 	.vidioc_querybuf = uvc_ioctl_querybuf,
 	.vidioc_qbuf = uvc_ioctl_qbuf,
@@ -1570,8 +1496,6 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,
 	.vidioc_querymenu = uvc_ioctl_querymenu,
 	.vidioc_g_selection = uvc_ioctl_g_selection,
-	.vidioc_g_parm = uvc_ioctl_g_parm,
-	.vidioc_s_parm = uvc_ioctl_s_parm,
 	.vidioc_enum_framesizes = uvc_ioctl_enum_framesizes,
 	.vidioc_enum_frameintervals = uvc_ioctl_enum_frameintervals,
 	.vidioc_subscribe_event = uvc_ioctl_subscribe_event,

---
base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
change-id: 20241127-uvc-dup-cap-out-6a03c01e30a3

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


