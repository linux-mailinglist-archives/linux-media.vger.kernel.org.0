Return-Path: <linux-media+bounces-56243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIQuFfMJu2nbeQIAu9opvQ
	(envelope-from <linux-media+bounces-56243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:24:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C0A2C272C
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8FB7A301CA98
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EB636D4E1;
	Wed, 18 Mar 2026 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hBqdzf53"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56218330328
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773865440; cv=none; b=l2O7MsVExOuuJ5RFDV5apbzVsFAkDxZ/vb351rHsYyJxeCRe8+AhYpPLlOt7wAcTtjpKMWCkvferT1fQ76Z+UvSBqYVNLPyo45LPQftElJ+giTrCI2n94VgKdV42H9aufegQsuF2dBv6XlAG92w/FobkQd9lwQJjjHJGlR4fdcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773865440; c=relaxed/simple;
	bh=NEm/TKzAJPTuRgXu8BpOYexrmSgMICNIiEk67EjaDf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kA51ewLvRxtkBG6NiNA14xOdwPZA1D+kq1A58S49+HgCsP+1tI4s4xmma1ABg/PUPUuBVWrRDbMzWlcmJHFY2NdPqVxkDdvNd8OlgaQMfflpdAhjau39ETXHoA2uJj2iuqyQG9gzXSg9Z65iUdHJxp+Vkz21i8sgYo6lxEnfTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hBqdzf53; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a27b65a863so358965e87.0
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773865435; x=1774470235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+xHO5blJE+zF4h0uhf1u3z/t70Qd/4JVir1geZ2PM4=;
        b=hBqdzf534zqB/R0i8CWwEJrTtgTcD27LddskViSyyeKrxY7U1IV3aQN36xXpF6Oiey
         o7qegGtd5Bkvm0/oB3AQ5RqkLHYskpIDBRFitxL9tMCzjon429HK3GzafFp/rL/EpZXa
         dN70ak5waqmj63QTY2gb5hGGChMzTuMaOwIq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773865435; x=1774470235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C+xHO5blJE+zF4h0uhf1u3z/t70Qd/4JVir1geZ2PM4=;
        b=Bj+OHpTQq+YYm6hpn+Tf3N6v+cn1VHgTu7Dt0eARa04dIibz/c7u/laZeviHQLsfAD
         6QWmTcgmkX6X2Ca4pJ0pwhxFRQU0XGLVY/7T+4FGgH94E3JBowZVfc5QxjnycDX0V+vm
         gj04rIjwLmPoUFxhqCxaHWChjOWdGxT8SZV+oqza8EFFNIvkV3F7mFfS75YHpFHac174
         aw4tTXZjDRNzioD+c2yFX1X2OrEaFhVhZyNNDDHa2X+II49c17D6W6BpKz48030M5J5x
         PlYSq880AFzfZYBfmkkOB/ahROluDStjp9E2AF6JfegS4IJ0Upgt+hk/0yFbgGo/1KBf
         MOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfpf9xknzUa/qHe1ptHcPjP8ZmD6qOKcZBT1qBOILPcyDQtzQbPS8aCl5gNT95Nuu8GWuwcDHsza3BWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDqlZlOIW/tAR2fdDzsKVCa8wkS0pPIJ4fjIn3ktDb8agUpowE
	qMS1pE25Q57kQ0eYHIjTql3UMkOciNJZRzcULnlGbAPP1PN12XMCqH8j4nMHc73DNA==
X-Gm-Gg: ATEYQzy/N5pCg5Togzu2WmWmzN6Hf9WGYL+OvzuC9lmJwqQqiYzjQzK84X28RON+a4N
	PNCeSOxELWPazKf74rL/+Ez/VlAskYoGIRru/Y3lZXJn8IsFsItVQRc37CL6UBH/1cpdP68jLkp
	mLavtlhOdFjqu1wKcHK6EcjpjDgMW2wBBOFmSGcn7VA2eSKBsFe42t4apcMRjkxDkJ2V8oGJ6PJ
	ADmrMH8zhbaHYVKAAAfwQmr0cOg5wzzkeokE/ELHJHZaQTi2e+9ij4Qd2IzesKm6MEBKQFrhmln
	Zsd3PuYY+DLEOm0LhBrHfEHnmZ4+dIhW0hyglqKCpCu7xx8oOyiAjB5GbYnTY4jS+Q5NSSe1R78
	FR5/Q2b3G+LOqi7p72MHkRBxWZVa7x8lWcYyYzshPmG4oLIolNd1TnhnTiH43wH7n6h2jFJajp+
	+n3PhvdDSvyBlFFfyl1wh1quRvD6WuKbyPe+GBpbgRQrOIpvHc/a9Yt88S+HZQ1eemFm9W5WUZw
	/kfZm6W0USP
X-Received: by 2002:a05:6512:3c8f:b0:5a1:378c:11e5 with SMTP id 2adb3069b0e04-5a27969db57mr2133771e87.14.1773865435438;
        Wed, 18 Mar 2026 13:23:55 -0700 (PDT)
Received: from ribalda.c.googlers.com.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2fbbfsm765472e87.30.2026.03.18.13.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 13:23:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Add a stream backpointer in uvc_video_queue
Date: Wed, 18 Mar 2026 20:22:36 +0000
Message-ID: <20260318202352.1374443-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260318192357.GD718539@killaraus.ideasonboard.com>
References: <20260318192357.GD718539@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56243-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.995];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: 78C0A2C272C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It is less prone to errors if we add a backpointer to stream from
struct uvc_video_queue.

Refactor the code.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Tested in real hardware with yavta:
(console A) # yavta -c /dev/video1 
(console B) # yavta -c /dev/video0
It would be great if we add it as a follow-up patch to the already
merged series.

Thanks!

 drivers/media/usb/uvc/uvc_driver.c |  2 +-
 drivers/media/usb/uvc/uvc_isight.c |  3 +--
 drivers/media/usb/uvc/uvc_queue.c  | 15 ++++++++-------
 drivers/media/usb/uvc/uvcvideo.h   | 12 +++---------
 4 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b0ca81d924b6..017b1f4ae3ab 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2033,7 +2033,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 	int ret;
 
 	/* Initialize the video buffers queue. */
-	ret = uvc_queue_init(queue, type);
+	ret = uvc_queue_init(stream, queue, type);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/usb/uvc/uvc_isight.c b/drivers/media/usb/uvc/uvc_isight.c
index ea9dc31dfbad..bb3e13c0d5a6 100644
--- a/drivers/media/usb/uvc/uvc_isight.c
+++ b/drivers/media/usb/uvc/uvc_isight.c
@@ -41,8 +41,7 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
 		0xde, 0xad, 0xfa, 0xce
 	};
 
-	struct uvc_streaming *stream = uvc_queue_to_stream(queue,
-						V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	struct uvc_streaming *stream = queue->stream;
 	unsigned int maxlen, nbytes;
 	u8 *mem;
 	int is_header = 0;
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 89206f761006..3c002c8f442f 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -78,7 +78,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 			   unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
-	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
+	struct uvc_streaming *stream = queue->stream;
 	unsigned int size;
 
 	switch (vq->type) {
@@ -112,7 +112,7 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
 
 	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    vb2_get_plane_payload(vb, 0) > vb2_plane_size(vb, 0)) {
-		uvc_dbg(uvc_queue_to_stream(queue, vb->type)->dev, CAPTURE,
+		uvc_dbg(queue->stream->dev, CAPTURE,
 			"[E] Bytes used out of bounds\n");
 		return -EINVAL;
 	}
@@ -159,17 +159,16 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
-	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vb->type);
 	struct uvc_buffer *buf = uvc_vbuf_to_buffer(vbuf);
 
 	if (vb->state == VB2_BUF_STATE_DONE)
-		uvc_video_clock_update(stream, vbuf, buf);
+		uvc_video_clock_update(queue->stream, vbuf, buf);
 }
 
 static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
-	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
+	struct uvc_streaming *stream = queue->stream;
 	int ret;
 
 	lockdep_assert_irqs_enabled();
@@ -196,7 +195,7 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 static void uvc_stop_streaming_video(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
-	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
+	struct uvc_streaming *stream = queue->stream;
 
 	lockdep_assert_irqs_enabled();
 
@@ -237,10 +236,12 @@ static const struct vb2_ops uvc_meta_queue_qops = {
 	.stop_streaming = uvc_stop_streaming_meta,
 };
 
-int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
+int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
+		   enum v4l2_buf_type type)
 {
 	int ret;
 
+	queue->stream = stream;
 	queue->queue.type = type;
 	queue->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 	queue->queue.drv_priv = queue;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5ba698d2a23d..0a0c01b2420f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -331,6 +331,7 @@ struct uvc_buffer {
 #define UVC_QUEUE_DISCONNECTED		(1 << 0)
 
 struct uvc_video_queue {
+	struct uvc_streaming *stream;
 	struct video_device vdev;
 	struct vb2_queue queue;
 	struct mutex mutex;			/*
@@ -692,7 +693,8 @@ do {									\
 struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
 
 /* Video buffers queue management. */
-int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
+int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
+		   enum v4l2_buf_type type);
 void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect);
 struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
 					 struct uvc_buffer *buf);
@@ -703,14 +705,6 @@ static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
 	return vb2_is_streaming(&queue->queue);
 }
 
-static inline struct uvc_streaming *
-uvc_queue_to_stream(struct uvc_video_queue *queue, unsigned int type)
-{
-	if (type == V4L2_BUF_TYPE_META_CAPTURE)
-		return container_of(queue, struct uvc_streaming, meta.queue);
-	return container_of(queue, struct uvc_streaming, queue);
-}
-
 /* V4L2 interface */
 extern const struct v4l2_ioctl_ops uvc_ioctl_ops;
 extern const struct v4l2_file_operations uvc_fops;
-- 
2.53.0.983.g0bb29b3bc5-goog


