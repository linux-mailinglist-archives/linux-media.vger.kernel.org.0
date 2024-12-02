Return-Path: <linux-media+bounces-22437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA79E03AA
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F37FF16240B
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 13:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20991FF7A2;
	Mon,  2 Dec 2024 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PEleb1UO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0CE1FDE34
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733146661; cv=none; b=d4CFPtnduHWQCuAaI27JluV9IS4WRa4XMmTBMvrzvOhVNL02cVZTA1nw064eO8yrfiKafgfFba/mmwh13Lnx2ANcBFiq4FjIHlG6ao+U3SQ5u9ioF5yCjC86Z66oR6WMAz86IWUNVY4karJ+D+wrtp2rDRk9azCkszRQD+bpxV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733146661; c=relaxed/simple;
	bh=VyKkpNjsADOJHVSZNla4XwrnDWM11doucoORfUbRxuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lr+MFkaEiGDH3cxhrb4Tw3FhvIY7H399iNr2VRpbvtmTEX2TN3eJfmMnsu725Ia/uFx5o6DNuRDySiIhy+ijMZputngKlr5LMAym9NMP0ezcyY+T70K5VxV3xUGrntVk+6E161UuX/8ySE8OeIIw9yPS8IFFWoPyutmEFVWU1f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PEleb1UO; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85b92397fe2so498581241.3
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 05:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733146658; x=1733751458; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59RTK8C11LJEzab+Gh0E215x4JP+9VsYBet800s82fM=;
        b=PEleb1UOqM62WAeMK/lXkBN9IHRJaLhDBVAoxj0IV0+K5Kbge77HJMSoefEJjoL4AX
         yN6hIO0shak+xKykuOwJctvc1L9QYak4EAV2CJ7llx6OFs6nR+DZO01dDnDjDXefQIHD
         InQV0L2WCS4DHY8vvsFG/OGiU2ISITzH4I+Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733146658; x=1733751458;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59RTK8C11LJEzab+Gh0E215x4JP+9VsYBet800s82fM=;
        b=VZ/Xwk/kAJYbPLSpdVODWMW5TS/zF/16h1HRMd6dBiel7nuCFm7Wrjwgc1ii2wRlxs
         yzq1ye9O4tif2Eell6PfEezMIeftGykps7Qzd6gts3ylMZTKymwKTPBqi3P7kbJsKFin
         OmWuOuyOGevURCE1kI1ez/uEqab7e+if93vnsQ6pYxskT0mpb46Pqhf11qb+LlmrP50I
         yJcQL944syfRRnimplgrc/cFz/FSKImXKDiBuLZPEXPnETMjDlzuz+EXaY+ne/3oFUSC
         j0MdHTp+etUcoUK9J9XkPiqPPGWGUn7+EZ7GzIYxLRdttf5Z9qm+da+hMXyQEqJ4OBg2
         J+rQ==
X-Gm-Message-State: AOJu0YwKOWHAHgIMlAubHm37naOmApZVf/+IE7ozP15Sko3X1sF203WC
	R8IbIC/n6xWeQhbn2+Ve6Qb06nO+QgbT5bfEDN31yu0hRZwKChE2Avld4YIW9GHavp+cEisrJ3A
	=
X-Gm-Gg: ASbGnctBa6m6pxEoJs1jbhDrrgwxxkrulxgXyGxzwOFjJMymUdut3jvUa+043vYGPBl
	L7CGSdScQEMi2itbOHqjav+r0a/Beg63cyLoRmA27Y87WvthI8xZXL0NGZq7gr2NnRvAb6SaC1f
	AxYdv13RRpiA8ZNauxKO+qExaaduzh3i1PB+/5UqOEE2G/dyfV+qat6wgQZebD1W2zkVdF3R5/p
	IxvNmNyEZ6Sdatt6GLBsDGJoq/v/h9BR9Md4AZIhovHl6sATxJazq1Fgz2MLl6DXN4TjE0KrHZm
	LKO6AVXPXXCd8ZebrOl3gX5a
X-Google-Smtp-Source: AGHT+IHzreCMQHUkLn/G8ulPMHg9I6Dejtn84lvp9XHfg7h+EHwx9gJarXKLMA8Yl86/bJoOqTw/ow==
X-Received: by 2002:a05:6122:ca4:b0:50d:a577:dec0 with SMTP id 71dfb90a1353d-51556940f1fmr27352138e0c.5.1733146658117;
        Mon, 02 Dec 2024 05:37:38 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1134125e0c.49.2024.12.02.05.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:37:36 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 13:37:35 +0000
Subject: [PATCH v3] media: uvcvideo: Remove duplicated cap/out code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-uvc-dup-cap-out-v3-1-d40b11bb74b7@chromium.org>
X-B4-Tracking: v=1; b=H4sIAB64TWcC/3XNzQ6CMAzA8VcxPTuzD0Hx5HsYD1s7YQcY2diiI
 by7g5PRmJ7+TfrrDNEGZyNcdjMEm110fiih9jvATg+tZY5Kg+TyKIQ8sZSRURoZ6pH5NLFac4V
 cWMW1gnI1Bvtwz0283Ut3Lk4+vLYHWazb/1YWrIwh1CRJG8Ov2AXfu9QffGhh5bL8JJpfQhaia
 mo0jSGq7PmLWJblDWdT4YH0AAAA
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

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Unless I miss something, cap and out helpers are identical. So there is
no need to duplicate code
---
Changes in v3:
- if (ret < 0)
- Link to v2: https://lore.kernel.org/r/20241129-uvc-dup-cap-out-v2-1-596cb9bdd5e8@chromium.org

Changes in v2:
- Add missing acquire_privileges.
- Also remove helper for s/g_parm.
- Reorder callbacks.
- Link to v1: https://lore.kernel.org/r/20241127-uvc-dup-cap-out-v1-1-1bdcad2dabb0@chromium.org
---
 drivers/media/usb/uvc/uvc_v4l2.c | 162 +++++++++++----------------------------
 1 file changed, 43 insertions(+), 119 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 97c5407f6603..dee6feeba274 100644
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
+	if (ret < 0)
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


