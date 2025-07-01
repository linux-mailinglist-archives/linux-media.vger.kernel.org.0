Return-Path: <linux-media+bounces-36383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F19DAEEF25
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 936B9189FD60
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 06:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399F325CC66;
	Tue,  1 Jul 2025 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a3Et2EUP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58467246789
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352330; cv=none; b=RISLhnwnSoIIS0cFSEmmWycsmYlhl2sYTn5p3I2Y31PiYtOTlKr5z/ejIxfpqQhXigl0tCLhMEEYH4fyZrtGMyNsJi92te3nf++vKMl/lEbvRs1ixLyBfTVQrZRKKTEkTGz8aZWY9M3DUZTen+icdlcT3ofudUjQFIbGHWn2dXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352330; c=relaxed/simple;
	bh=hUSTM0cz4lDmfgU98My5Gb8Nx4v9DP1TnSn7IZqRpUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwU7I19jqxxQ6GH/MlnZSkDXDjzrSveYj57aYw3Us9bLCHqhzT3+33biEQ/QMSOgIWG8RMiwofpvr997O6Gnt0Ya2qf2kM0LU37VkXGh3IXvjqScVxBJl9zTsB4B6SzVsCKXQ5eab99tMFp8mg1sgyKZ2Jhd1IZJU1OcKksc03k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a3Et2EUP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b3316160so3283460e87.2
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352326; x=1751957126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnt386dfMPODMMm6G8wrSthRtbiPhPkQSBX13EJa6EE=;
        b=a3Et2EUP5QXTMZZnaOz3ydsC/HEf7oGUzD/O15CmPBqjPixL+S5K54zH1+NLAcLPW/
         kpEuGMSNhg4CnAsbU/MbGvP4TblksbgtqP8T9RQMxyVR1cqaiGqmT3PHiG1yezUTCIIa
         nHsttCAHFS+LA1qYM0/AoKcITlsZtOoV0XOnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352326; x=1751957126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnt386dfMPODMMm6G8wrSthRtbiPhPkQSBX13EJa6EE=;
        b=xKVrzvoFk4ByASK3nduuN92F48PebvoyYs0Zh6Cfw9JsxfH0qoOhuqnFQssS2ID+qO
         PCORxZooOrfOmd1xjCSK+mF60HVFSYVM45DNSUOEzlySmNqcmM1tpOQMOu0tVN3IQogU
         PQM0sowx9YbSwg73UHWBMSeV+xeDvfP1VVsC+Kfmj5JG8/MvYNeIZXK4764gvJAmuxuh
         WXStymSqCY/qZ04zIHtBESwNL1QhAUOdKqAniA2D2q9ZpIv3aTPhpmVC4zh4RihUj/DT
         EqtEj+LvqhGAu7i4XGXjAMMSt9kSFFcXLwubHh+UJ3ZGFb6w0qyvCGmRTewMpdt+pAsX
         aUeg==
X-Gm-Message-State: AOJu0YxsnI5HUxFcwLKbOvExDBqf/RjBxFq8dC7MFX4Y1KLvxQt4EiF/
	chEam7km9EHsBY8U15tAGHiHb0U5X78gu2B0hn+lVTtCC3YMmwKGp8H0WPN+Ac1dL1GhcawmRmY
	17TdqcQ==
X-Gm-Gg: ASbGncuaYEEBgHOhgUJCM105DknrBP++usBK71YKqP6Q9TInANs/CnxXFaH5EtaRKb5
	08xWqsIwFpZvgM0F53ijuT9LHBCApii9GZR8m9lsn2TY3PytJPxyuPnueZWhuvJZIlvrh0fZYau
	oLnlH8PqtYnhDblsxkPV2yZiilALOMJhaiqyXzAG0ct8lToZzSFJB0qxBQ/xf9IDthvnp5tYQbZ
	XhICBU+lGSo0ileL5fJ9o58njfBIjkIPXYQZkU1ShNohJ3S/wqFjhcNYrydzKX1jB9iEg5wBxyM
	VfRO/E3EFyrVkcQUSrWgmZU+RmTo0jwFpOq88pDWOrZwTLFExy6lsH9fJK9fgtbJSAvmsJFK77M
	T4D+ATC+9FgngCU+ocFZro73RJ+CvJuiGKQ3jJ4ZkUw==
X-Google-Smtp-Source: AGHT+IH4VAWYadnkTABTwlDViNU8+AGBugAzVXxKx8UY3xTvmveCwSD8omN9bv03frtrJgumJ0kdLA==
X-Received: by 2002:a05:6512:104f:b0:553:2450:5895 with SMTP id 2adb3069b0e04-5550b81161amr6427078e87.4.1751352325958;
        Mon, 30 Jun 2025 23:45:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:16 +0000
Subject: [PATCH v4 4/7] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-4-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The is_streaming field is used by modular PM to know if the device is
currently streaming or not.

With the transition to vb2 and fop helpers, we can use vb2 functions for
the same functionality. The great benefit is that vb2 already tracks the
streaming state for us.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250616-uvc-fop-v4-4-250286570ee7@chromium.org
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/usb/uvc/uvc_queue.c |  9 +++++++
 drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
 drivers/media/usb/uvc/uvcvideo.h  |  1 -
 3 files changed, 11 insertions(+), 50 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index b11f56d62ec0495a8610580367486dfaa31c450d..790184c9843d211d34fa7d66801631d5a07450bd 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -175,12 +175,18 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 
 	lockdep_assert_irqs_enabled();
 
+	ret = uvc_pm_get(stream->dev);
+	if (ret)
+		return ret;
+
 	queue->buf_used = 0;
 
 	ret = uvc_video_start_streaming(stream);
 	if (ret == 0)
 		return 0;
 
+	uvc_pm_put(stream->dev);
+
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
 
 	return ret;
@@ -189,11 +195,14 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 static void uvc_stop_streaming_video(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
 
 	lockdep_assert_irqs_enabled();
 
 	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
 
+	uvc_pm_put(stream->dev);
+
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 }
 
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index d06ecf3418a988152c6c413568ce32e60040fd87..7ab1bdcfb493fe9f47dbdc86da23cba98d7d10ff 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -617,9 +617,6 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_ctrl_cleanup_fh(handle);
 
-	if (handle->is_streaming)
-		uvc_pm_put(stream->dev);
-
 	/* Release the file handle. */
 	vb2_fop_release(file);
 
@@ -676,50 +673,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
 	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
 }
 
-static int uvc_ioctl_streamon(struct file *file, void *fh,
-			      enum v4l2_buf_type type)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	if (handle->is_streaming)
-		return 0;
-
-	ret = uvc_pm_get(stream->dev);
-	if (ret)
-		return ret;
-
-	ret = vb2_ioctl_streamon(file, fh, type);
-	if (ret) {
-		uvc_pm_put(stream->dev);
-		return ret;
-	}
-
-	handle->is_streaming = true;
-
-	return 0;
-}
-
-static int uvc_ioctl_streamoff(struct file *file, void *fh,
-			       enum v4l2_buf_type type)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = vb2_ioctl_streamoff(file, fh, type);
-	if (ret)
-		return ret;
-
-	if (handle->is_streaming) {
-		handle->is_streaming = false;
-		uvc_pm_put(stream->dev);
-	}
-
-	return 0;
-}
-
 static int uvc_ioctl_enum_input(struct file *file, void *fh,
 				struct v4l2_input *input)
 {
@@ -1320,8 +1273,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_expbuf = vb2_ioctl_expbuf,
 	.vidioc_dqbuf = vb2_ioctl_dqbuf,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
-	.vidioc_streamon = uvc_ioctl_streamon,
-	.vidioc_streamoff = uvc_ioctl_streamoff,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
 	.vidioc_enum_input = uvc_ioctl_enum_input,
 	.vidioc_g_input = uvc_ioctl_g_input,
 	.vidioc_s_input = uvc_ioctl_s_input,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b300487e6ec9163ac8236803b9e819814233f419..3e6d2d912f3a1cfcf63b2bc8edd3f86f3da305db 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -629,7 +629,6 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	unsigned int pending_async_ctrls;
-	bool is_streaming;
 };
 
 /* ------------------------------------------------------------------------

-- 
2.50.0.727.gbf7dc18ff4-goog


