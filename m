Return-Path: <linux-media+bounces-54960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLTHOCHhrmmoJgIAu9opvQ
	(envelope-from <linux-media+bounces-54960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:02:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EAE23B31D
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF8133027953
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8BD3D903D;
	Mon,  9 Mar 2026 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L1TKGnBr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C02C3D6CB0
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068525; cv=none; b=d6CwugG7ZqCRpq3K8c4O1t8zAQOxMS+Ybb2uqFT4lsCvh+04r4nLLWXN2CmIzmjqGKg08IkHJTQmypZ9bhmNc8PH5x9aIiPEBCutDLEacndvSfBzhnYfqsRsf0oRzTvZAS1DFnnO0bX2HLcxiCcmTFDR81KRKvh6F/SOIiZj3Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068525; c=relaxed/simple;
	bh=Mbnl3Jwma6KlozGox42tvgiZ/pjcufu4g8XidqPCjB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6mwOWWumwUZYOpFx6HPMYmujml7Ohn6UbeppqmrIDJ+U7A40ctbyLGNZioTqMeX3uVr+Y7GBUukUbvF9uUbfIcf5Jy1h2eOHxvixJHSDn0ic3EgvjuzZfb2eIzYYWzR+rQ66XNbsXjBqCP1nVxeYSpDw2Emot6ZXkTer0SHzn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L1TKGnBr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a133502accso4753844e87.3
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773068522; x=1773673322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Xis2x/y+lKGsadnAZDtI5Q0MzAKh0Sv2udI9oFCdCA=;
        b=L1TKGnBrwWKYVtv1l2Xq9Driew8ys+3lbs+BINcpmePlXQ+QGKgM0mFfOtWU25HHhl
         YoXgRc5l+72jraWmZsenSLN+HsJRhJoHFFwNs1zs+elNh9ffbRpl8bR+zaGO3S09QLRD
         tk58/qdZNs6GTVoGpMIJtnvQTmffqqF4TCfDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068522; x=1773673322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Xis2x/y+lKGsadnAZDtI5Q0MzAKh0Sv2udI9oFCdCA=;
        b=ogj8trhEgMjyUED7BnR/7UMXIeMRqilEmD0awIAcbzvODMKqyzWVwH7D9n8AajXXQO
         c5Ge3cV4bRJgiTc5eFtew3th+hxJ2vJQ/jFhqzJHMKb1rjKs4jQd1Eve5ssx1vXqcJcN
         yioJAgW0Uh+2jd3rL60RCjBMterRGfvHD3CpClhdKmAqdDxuV0eGgSxGPefDX4cAR0TC
         nSoWAmRItMIBWijav85I/ZGcR/DReFCuwiDMFMtSCfTgcWO+DezDtglT6i/KZhPHpoII
         sX+rcroirqe3HCfmIZBxhPhMcGZQgw03vbXsqCMIXJYHCZ+oy4u+5g+oLwh1GMjE2WZ8
         oDWw==
X-Gm-Message-State: AOJu0YxDD2jIiaCbKMp5/sqlU/Yjp5A24t5pR1B8vMXfp1EdXHGu6Gye
	kIwtRFVZZ+2H38o1jzuwUhbRYSy/ig31bKcefSsaNJJiaNOvt2wXnuApbchsFXpjLQ==
X-Gm-Gg: ATEYQzypzh/IyKQ4dMB3BzNUyNVy9HIGdMrra7n/T9uxzoifHMNGkT4NDUDjmzMKFcA
	zevzuXHZo/InVlU3+NmVDjeWF/oejGozUezmYPpPU4MFbffPrj/cXyXuB/K/tB0yqDpV9laPzWI
	40neFqP9uCLwxHsp9kEaBzz4XiQHfEY6KXwDdhViVKguRSkSv76JDkC5bLMH6mNRTmCKlxm7h4A
	Dccj7Nck/QaQt9TGfE4itNlJBQbf3RoZDQJPH5mCCQWBJczZwScGirUbPKIBf2hvnJjFDkd8h2N
	wUfja/Y+H+dXAoh0V2HqtzxBYAmSkHk7kW0KPWcSAnwAKCDOkGuuO9WfbByoh1ocQ3zcYAhLSPk
	QiwquH4K87G251Blpd/td60DQhEVYXpyTox1hVF5o9cz13B4r5TfyKeq/831zYAiHvzR3QwEsa/
	BH0z97QSWH9i9WZmHlArMnD7mub6rfRySuxUGLzJBuKWFRHabdYPZwu5mnf+Gn2vy4bNY1V67OL
	Txg7iakSrAJ
X-Received: by 2002:a05:6512:3d0c:b0:5a1:3d83:5253 with SMTP id 2adb3069b0e04-5a13d83544cmr3752809e87.25.1773068520612;
        Mon, 09 Mar 2026 08:02:00 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08cc0dsm2138003e87.80.2026.03.09.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:02:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Mar 2026 15:01:55 +0000
Subject: [PATCH 2/3] media: uvcvideo: uvc_queue_to_stream(): Support meta
 queues
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-uvc-metadata-dmabuf-v1-2-fc8b87bd29c5@chromium.org>
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
In-Reply-To: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: C5EAE23B31D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54960-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.931];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Action: no action

The stream data structure has two queues: the metadata and the data
queues, but uvc_queue_to_stream() only supports the data queue. If we
pass the metadata queue the function will return an invalid pointer.

This patch add a parameter to the function to explicitly tell the
function which queue are we using.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_isight.c |  3 ++-
 drivers/media/usb/uvc/uvc_queue.c  | 13 ++++++-------
 drivers/media/usb/uvc/uvcvideo.h   |  4 +++-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_isight.c b/drivers/media/usb/uvc/uvc_isight.c
index 43cda5e760a3..ea9dc31dfbad 100644
--- a/drivers/media/usb/uvc/uvc_isight.c
+++ b/drivers/media/usb/uvc/uvc_isight.c
@@ -41,7 +41,8 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
 		0xde, 0xad, 0xfa, 0xce
 	};
 
-	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue,
+						V4L2_BUF_TYPE_VIDEO_CAPTURE);
 	unsigned int maxlen, nbytes;
 	u8 *mem;
 	int is_header = 0;
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 0eddd4f872ca..68ed2883edb2 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -78,7 +78,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 			   unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
-	struct uvc_streaming *stream;
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
 	unsigned int size;
 
 	switch (vq->type) {
@@ -87,7 +87,6 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 		break;
 
 	default:
-		stream = uvc_queue_to_stream(queue);
 		size = stream->ctrl.dwMaxVideoFrameSize;
 		break;
 	}
@@ -113,7 +112,7 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
 
 	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    vb2_get_plane_payload(vb, 0) > vb2_plane_size(vb, 0)) {
-		uvc_dbg(uvc_queue_to_stream(queue)->dev, CAPTURE,
+		uvc_dbg(uvc_queue_to_stream(queue, vb->type)->dev, CAPTURE,
 			"[E] Bytes used out of bounds\n");
 		return -EINVAL;
 	}
@@ -160,7 +159,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
-	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vb->type);
 	struct uvc_buffer *buf = uvc_vbuf_to_buffer(vbuf);
 
 	if (vb->state == VB2_BUF_STATE_DONE)
@@ -170,7 +169,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
 static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
-	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
 	int ret;
 
 	lockdep_assert_irqs_enabled();
@@ -197,11 +196,11 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 static void uvc_stop_streaming_video(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
-	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
 
 	lockdep_assert_irqs_enabled();
 
-	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
+	uvc_video_stop_streaming(stream);
 
 	uvc_pm_put(stream->dev);
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8480d65ecb85..9b4849fda12f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -703,8 +703,10 @@ static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
 }
 
 static inline struct uvc_streaming *
-uvc_queue_to_stream(struct uvc_video_queue *queue)
+uvc_queue_to_stream(struct uvc_video_queue *queue, unsigned int type)
 {
+	if (type == V4L2_BUF_TYPE_META_CAPTURE)
+		return container_of(queue, struct uvc_streaming, meta.queue);
 	return container_of(queue, struct uvc_streaming, queue);
 }
 

-- 
2.53.0.473.g4a7958ca14-goog


