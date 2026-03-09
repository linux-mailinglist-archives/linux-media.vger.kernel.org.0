Return-Path: <linux-media+bounces-54961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGWHGtDirmmoJgIAu9opvQ
	(envelope-from <linux-media+bounces-54961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:10:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A2623B52B
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80A5F30377B3
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3544D3D9058;
	Mon,  9 Mar 2026 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="URtOH1lS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1103D9041
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068528; cv=none; b=S0nm4e6lLzaD1KqbGGLsvW2eIqsbFxhHYLeUPPShr48G+i6L3finhBEvOl86DD6ksCQYqRN8ESaKq0wga7vKoNrPaMkcwZNMiw/Y9VFKFa7l3rCk4aC+Fj+JKgH8vG3DE5hMcyLbf72LWKXsvggoopBcOKkxdMOq8NSWCi/QnZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068528; c=relaxed/simple;
	bh=6LoRF89adZl3+0KVlBqmiPP6LmyEY1jYDGy+QTcVaRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqM71ij1c9HbFBEp45jXFd/nT8EC3IailX9lvUUDsmK5Yh9q3If6phfZjGVLVZh+QvjA6gdQGo2IK1RhH9D3y5HvUaNUjdUhkJ0R6UYiz7+RW0Bu17IS+Y0eB1eoiLSwrFOrYvEknoAN22CMD2iqfL+4a3/Wp5mssOFxN8ePQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=URtOH1lS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so7638775e87.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773068524; x=1773673324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIDXL9V6/SrviwhwYQrzl7fDB/7gN0o280/N3Q4UFFk=;
        b=URtOH1lSDO8C//dKcBwPGfajes4bd1Slrh24uLrV+C/uZTLuf850GGmRRX7iUyOkM6
         1anFUIBX7lJjcb0hVH99ZN/bd7VbYLgvy3yVa0XtG1k6VS42b8xPsYX1KftvYNk/D0WP
         52fl5DXzd6rzv4/cVNwb2nGXrannrnOyufk0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068524; x=1773673324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JIDXL9V6/SrviwhwYQrzl7fDB/7gN0o280/N3Q4UFFk=;
        b=O6TYD0aEVuF05D0Xdfc2AeKCDuUSypedW6rTbYCLPSSUVUwzwSzwXADY0SGJ09/jYt
         xp+bXr8xGcJ95Mvwd6ke710RaJVqC8pvgTb/OyKu53f4oloZuL8NBzlM3vW1R4MQOloC
         zJU0lwa75IJ7tMaTj0pS4e4k78aSTbjoO1qPE43XbNh5UFdZWE5MHmkB2EGIPIv+eCDQ
         aRAXYLeFltcn477jT/3bSwmuA1+fW2kYAiHiy8tfNyJmTFeYEUuHwWos4qfJhST0wD3D
         vl9aNf5NaU9SKyQOaT7vb3e54A8mde7O9c3A5YxuaqC3QV3ztsEltcFwL4c2P7BTSeZJ
         eHpA==
X-Gm-Message-State: AOJu0YzmS7hHI78mc8HWKc1eOW2oxRDiG4FUi6MXJlYCk5S+2/XWRNQj
	OKj8T5ZoLLtt1HmxB5OFbGN5AT9UchLql0wWhW5KbcQZVqIYU0k5uP9jSbNMnRFpXQ==
X-Gm-Gg: ATEYQzxo4qwxROjspuqN1/EFxcYwCmSwR01hOkgr9X61vfWTub8HOtYCpAOTIe5ElV7
	2y5qrynuMF/2K7mjJNrfp24/udR57tyFHC1MSWONiR5te3Wwcg5MGWCoP6IefiV4KO8gbWJtEKv
	Ue9eeihHkFJz788Yn3/MCKbY18A+qtJmRhIsCKB8W7gHHpobYdPNHHR16H3Pejy4eU6l1f70GPU
	EG3hLHc/LFOg4gKKGMjZfo5Pda5wpKIGq/Ulv205flDttD5ZXcATGLonfmF7VdzmJFFATNfvP8y
	NEMKvehrAlZH/iNMCWV6R3KrObcUp1gqGmF7ezZiPTxDfvYlbvtlWCQbKoNm2FRbxBtsD+FfzDe
	YDIpc5UPjdNBnbrsTVxyyo/Qpce+xHW4s4zRZi/hMuSjN4RAinr/n/XW67nXXVhkWIaFoS9f8Gt
	afodiw6xBQKPvdNCIHyIKZP5/fptjeazFPerCZS6Rq65gYnDxVj/Trre/kEOoNsrh/C1x0TQDzk
	g==
X-Received: by 2002:a05:6512:3048:b0:5a1:3fff:5e91 with SMTP id 2adb3069b0e04-5a13fff5ff9mr2566909e87.20.1773068522497;
        Mon, 09 Mar 2026 08:02:02 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08cc0dsm2138003e87.80.2026.03.09.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:02:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Mar 2026 15:01:56 +0000
Subject: [PATCH 3/3] media: uvcvideo: Allow userspace to increase the meta
 buffersize
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-uvc-metadata-dmabuf-v1-3-fc8b87bd29c5@chromium.org>
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
In-Reply-To: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: D5A2623B52B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54961-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.937];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Now we have the metadata size hardcoded to 10 KiB, this is a value that
works fine for bulk cameras or frames with no extra metadata. But not
for all usecases.

We have seen some cameras that produce more metadata per frame. Eg:
Frame 1 captured (Bytes: 11154)
Frame 2 captured (Bytes: 11616)
Frame 3 captured (Bytes: 11374)
Frame 4 captured (Bytes: 11132)
Frame 5 captured (Bytes: 11594)
Frame 6 captured (Bytes: 11352)
Frame 7 captured (Bytes: 11110)
Frame 8 captured (Bytes: 11572)
Frame 9 captured (Bytes: 11308)

When this happens, the driver (correctly) marks the metadata as ERROR.

This patch let userspace set bigger buffersize via S_FMT.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 9 +++++++--
 drivers/media/usb/uvc/uvc_queue.c    | 2 +-
 drivers/media/usb/uvc/uvcvideo.h     | 3 ++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 0a906ae3f971..9de8aba1229e 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -50,7 +50,7 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *priv,
 		return -EINVAL;
 
 	fmt->dataformat = stream->meta.format;
-	fmt->buffersize = UVC_METADATA_BUF_SIZE;
+	fmt->buffersize = stream->meta.buffersize;
 
 	return 0;
 }
@@ -63,6 +63,7 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
 	struct uvc_device *dev = stream->dev;
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
 	u32 fmeta = V4L2_META_FMT_UVC;
+	u32 buffersize;
 
 	if (format->type != vfh->vdev->queue->type)
 		return -EINVAL;
@@ -74,10 +75,12 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
 		}
 	}
 
+	buffersize = max(UVC_METADATA_BUF_MIN_SIZE, fmt->buffersize);
+
 	memset(fmt, 0, sizeof(*fmt));
 
 	fmt->dataformat = fmeta;
-	fmt->buffersize = UVC_METADATA_BUF_SIZE;
+	fmt->buffersize = buffersize;
 
 	return 0;
 }
@@ -103,6 +106,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *priv,
 		return -EBUSY;
 
 	stream->meta.format = fmt->dataformat;
+	stream->meta.buffersize = fmt->buffersize;
 
 	return 0;
 }
@@ -229,6 +233,7 @@ int uvc_meta_register(struct uvc_streaming *stream)
 	struct uvc_video_queue *queue = &stream->meta.queue;
 
 	stream->meta.format = V4L2_META_FMT_UVC;
+	stream->meta.buffersize = UVC_METADATA_BUF_MIN_SIZE;
 
 	return uvc_register_video_device(dev, stream, queue,
 					 V4L2_BUF_TYPE_META_CAPTURE,
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 68ed2883edb2..89206f761006 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -83,7 +83,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 
 	switch (vq->type) {
 	case V4L2_BUF_TYPE_META_CAPTURE:
-		size = UVC_METADATA_BUF_SIZE;
+		size = stream->meta.buffersize;
 		break;
 
 	default:
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9b4849fda12f..5ba698d2a23d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -409,7 +409,7 @@ struct uvc_stats_stream {
 	unsigned int max_sof;		/* Maximum STC.SOF value */
 };
 
-#define UVC_METADATA_BUF_SIZE 10240
+#define UVC_METADATA_BUF_MIN_SIZE 10240
 
 /**
  * struct uvc_copy_op: Context structure to schedule asynchronous memcpy
@@ -482,6 +482,7 @@ struct uvc_streaming {
 	struct {
 		struct uvc_video_queue queue;
 		u32 format;
+		u32 buffersize;
 	} meta;
 
 	/* Context data used by the bulk completion handler. */

-- 
2.53.0.473.g4a7958ca14-goog


