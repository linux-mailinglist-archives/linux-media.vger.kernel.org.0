Return-Path: <linux-media+bounces-22103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2881F9D9B4C
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D800B282EF6
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A161DB52D;
	Tue, 26 Nov 2024 16:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BhwTGNUp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191241DDC2B
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638036; cv=none; b=uytBiQiBvGfzDXNfE/lBFqcX9JKkU6n8eaPixdfA19b+XWAwsMcqaH2oHJDeqZbCQ07RWUQtmaWsBkVYQLRddaaitd4QY2KO+vMKW6vcoyBbZQ0ykFMRF3nnYIndKg/0JY3PCubtKnbsZTcJqBReAaacNy+R4xQ7aelMq/NeKxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638036; c=relaxed/simple;
	bh=x5kYRVcSK4regsPtlTEktgdS6fXUdjiyw9Jv/VfqSKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lbxt4zdfW5yEWjY5OpC+5za0SGHux6B5R6HdWE5LHJb06+uzcX/IwqDnL9G1FCPeHgwbv1Y6NI+SAsL3kIh/8JmH+2e9yHTeoOM8lqvTYByuYL9mePPlb9VCgssjjkB3ircmXGqIyb0oZKjF2BGbKmboZuNIftnfPE8A/yPa85Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BhwTGNUp; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5f1e79c2f81so1082678eaf.2
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732638033; x=1733242833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxOLHw2VBQB5L41d2F/BZfaylw/KjmpdZ2BT3uiOSdE=;
        b=BhwTGNUporFl25ZPpR1NvU06BawTuoW47fC+3eZQpOZVhREAMB029UbplE7PMG0lTB
         Gbu0rWMp6oZyb15A3wnbi+hYJqtF1SXdOm4at+dXs3Vsxaj/yGgU+52W9V0XdRQTPJfM
         YGLYZDdy2O5GdW7O9mJlwGvu3nCZO5dEQ60VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638033; x=1733242833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxOLHw2VBQB5L41d2F/BZfaylw/KjmpdZ2BT3uiOSdE=;
        b=mYRKweYbA97mzE4WWwN1ZM3bkAGE8Sro5KVPdCrSEmptAtPW2jKHkB7+Gx0EHa7sHy
         +UGvFxpNj8HSAc8gylhaVNpsuDkjG2Wok7dpiNo+FdrZ0IDiKA1+3mNc9nrKw62/iT1z
         yjHxISlzG5WSFhOoB3exVIHzMXMXfruR5T/Bjt4k5N54Jeyl+Xz5/K0vKE4iPtIq4yU0
         rAaHk94/aWvCE39sruGpcF2MWLiLGFBE9mtxn1RmW6yIQSZP8FR0PmXIr/Xb8DM8caf2
         nolqj1omwnjCf8Wgz6neZlC/MHCHm03IKiqshwvs0xYivTmg6yzq5X3Tg669hekXaZwz
         maaw==
X-Gm-Message-State: AOJu0YxPZK/GPrb8Ld0MJny/oxWBrtSoGD/cjqBu24m6Bg0RT9ezJm69
	lDF4miLea4Cg3jP59cYQhDp3N2wOfyiZrinwCS7KlcBdzW5zQlHjZSctGVBDNlKjl78fQB5uRsE
	=
X-Gm-Gg: ASbGncvLVouRhFrMWmojxWWaXK9UUFIWIMxGTxpOA3WuLgCKU0Yp9ILrzIvOjTd96yW
	RrHGSgEW1hDeQSG41g6NouL+bTNnvncAG5XFROEzxrGOHCle9zptEyM+h/RzB+zTdKw1o0imTSD
	d2PquTED1Ro+kkaTmlHitUZPAHCzUJGkKh1YIMV/qyCb21nIAkPHaxJOEg4kQnfnLmtprLn9Fxv
	qE5hhhBWPouCV6u4ftt3RxOnCR6glgWavv+rDpIBN26GlmB/vmiAupc1XHxNeA7Cn+xFq+xULDk
	k2AssnSt8i+x+b2R96PgaTLC
X-Google-Smtp-Source: AGHT+IH9UXCX+Ay1aMbd9HmFc/mZX4tEK6BZIIou4isklRZcLG+NWhVRDKABiscK2ZTOUwj4/Pc5Ow==
X-Received: by 2002:a05:6358:52c7:b0:1ca:adf1:2e98 with SMTP id e5c5f4694b2df-1caadf1307bmr111624355d.1.1732638033244;
        Tue, 26 Nov 2024 08:20:33 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e8205fdsm346532241.1.2024.11.26.08.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:20:32 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Nov 2024 16:18:59 +0000
Subject: [PATCH 9/9] media: uvcvideo: Remove duplicated cap/out code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-uvc-granpower-ng-v1-9-6312bf26549c@chromium.org>
References: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
In-Reply-To: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The *_vid_cap and *_vid_out helpers seem to be identical. Remove all the
duplicated code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 112 ++++++++-------------------------------
 1 file changed, 22 insertions(+), 90 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0a058798d075..cc32ce3275da 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -361,9 +361,11 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
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
@@ -395,9 +397,11 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
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
@@ -673,11 +677,13 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
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
@@ -695,82 +701,8 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
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
@@ -1576,14 +1508,14 @@ static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
 
 const struct v4l2_ioctl_ops uvc_ioctl_ops = {
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
+	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
+	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
+	.vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt,
+	.vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt,
+	.vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
+	.vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
 	.vidioc_reqbufs = uvc_ioctl_reqbufs,
 	.vidioc_querybuf = uvc_ioctl_querybuf,
 	.vidioc_qbuf = uvc_ioctl_qbuf,

-- 
2.47.0.338.g60cca15819-goog


