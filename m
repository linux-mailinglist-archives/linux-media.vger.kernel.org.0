Return-Path: <linux-media+bounces-37606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE7B03BCC
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 12:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E2D179E1D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 10:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22467244661;
	Mon, 14 Jul 2025 10:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GGiT+usd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A9221F29
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752488630; cv=none; b=pew6lH26t8h3tSvgCo3gj71qhXfgVsAXxxlWrMFIOfjhSFEPyVy5TaBBgkqr/xluAAWH1kxwwOmBw5D4JdCTcdaSxytnvB1759phIBpqtj5LIMH2FCuyYO7O1mlnEkGDOFzjHMGatxJ5y59LHdZMv8fVbjKjrAGttLUO8ucijL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752488630; c=relaxed/simple;
	bh=no35QV3vIyWeCdpJ8jJwT1KQPajrDYtHWGc2cil3q2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZokEujsnlPjujSmniqejco25gxIGsKoQ8aClKK47yB9ZLkm3CvL+Zx/R27/WkODucfomUM+2GdzWL3m6QKUKWtE+AJ+t1exJnXXt7XXj0ugeb4Ls7tSgHxubNgUpPTC14tXAemEbb0C/iSHVuuNahltsGTgTSdpSoZw+glymCIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GGiT+usd; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-555024588a8so3684887e87.0
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752488626; x=1753093426; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DavYUHOWvKzUM5lx4uFk3JOkCwZftAUgMq2nVE2s+k0=;
        b=GGiT+usdoUWe+/5LCF2npcFi+FUljJjgDWMy7OOxQHGllWktotshoMnV3O5LYEzK+s
         IhYTlnQSxoFhzTajcsmLPmD0si4k1SzB23Yz3o1B8UV4mP25oz8wE/qNKor5lud3lnWE
         mIShblwA2vf/efFRDwi4ROwKPHinnsMRHzbFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752488626; x=1753093426;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DavYUHOWvKzUM5lx4uFk3JOkCwZftAUgMq2nVE2s+k0=;
        b=ojXm+WBi579ejdwzZ8xSPHMggjPxRAn97SPFr4gIZyUJl7NJq1KkoWKokGMS0FPwRN
         72PU35UT1Na0NltSVgqLpOgeryQQpaHwZM4N88RODJEfRdU5WmoEKAs5TlPxhnC/o+d8
         +D80EJopc3MruisU2NMrt7UwnVdZD6DQlQxW8YbVS6zJYXPZp+ZtlMYDEc1ckkmmTibq
         7FYATqlLtlvenExJrV2HkwNEQNesHPCYwZzaIg0SfbLyjv+ns8MOYnYqLEsp9w0GLytw
         oNrItxoPyYuWNPIioW4jhNdDr9n7TYxfBtJu8uqrysn2WdY9qadEkk0SliCAKrub/Pkn
         VJkg==
X-Gm-Message-State: AOJu0Yw0rp6L2z1Jk/7hi9X1bneRNR9ajouRzLp0Mr73bILTk5f06v3+
	/3EFd2lSNLIexWqC9uk0vMt6T+6lWtxxKdJFszm6h97lXf8k8cAv4BXexHYf6x8dKw==
X-Gm-Gg: ASbGnctOlXmDZad+m6M0Sth5W2/vG92gYYspBYDtC+kHiSUB4i/QlpljJmPsUAM9zdm
	2vdxeqy+WBUwVqBpqXhJwnG2xSMjunP+hloonXEj1+wKWA3zw+14mMWz6tZi8vy/wqG9ey+B3c9
	xJt6D5N8Ml4A5fROI2SwSnzT54J6qN56nWjdwyUesgaZO0y1Cm5fGIitDDOrtjtpZePS7zn0X81
	p9A7fFbhGFrQVG/8pZnKKECwYoO20yzi9ZPWCG8ebSyc1DzYj+fZKlpIULQAxYEl42kMjoHuUb8
	UQ2xpQ6ZEoyLc4hFT/wolFR/B33wcJ4Jl1T8UwXWUHl8kbokk5PD0J756zdUERBDVaJHl3JuLOn
	PwYFepsC3blpwztHG/HUz1l4fc31FzgMwtzGQlqIVYU4YR+tO60U9viYXg/GosGwPvY/SRqsbG5
	8PhA==
X-Google-Smtp-Source: AGHT+IFafPg+eFbYD4mcM+qAx7qhf8GHwHgp1n94L56Kb8GD3q/u7xCeUYTyYlkKC/sfFohQd4Zlow==
X-Received: by 2002:a05:6512:3ca6:b0:553:2ce7:a1f3 with SMTP id 2adb3069b0e04-55a0462ce94mr3811441e87.43.1752488626360;
        Mon, 14 Jul 2025 03:23:46 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d323csm1884487e87.119.2025.07.14.03.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 03:23:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 10:23:45 +0000
Subject: [PATCH] media: uvcvideo: Fix race condition for meta buffer list
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-uvc-racemeta-v1-1-360de2e15a9a@chromium.org>
X-B4-Tracking: v=1; b=H4sIALDadGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0MT3dKyZN2ixOTU3NSSRN201FSjVDPLpKS05BQloJaCotS0zAqwcdG
 xtbUAtBiARl4AAAA=
X-Change-ID: 20250714-uvc-racemeta-fee2e69bbfcd
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

queue->irqueue contains a list of the buffers owned by the driver. The
list is protected by queue->irqlock. uvc_queue_get_current_buffer()
returns a pointer to the current buffer in that list, but does not
remove the buffer from it. This can lead to race conditions.

Inspecting the code, it seems that the candidate for such race is
uvc_queue_return_buffers(). For the capture queue, that function is
called with the device streamoff, so no race can occur. On the other
hand, the metadata queue, could trigger a race condition, because
stop_streaming can be called with the device in any streaming state.

We can solve this issue modifying the way the metadata buffer
lifetime works. We can keep the queue->irqlock while the use the current
metadata buffer.

The core of this change is uvc_video_decode_meta(), it now obtains the
buffer and holds the spinlock instead of getting the buffer as an
argument.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Closes: https://lore.kernel.org/linux-media/20250630141707.GG20333@pendragon.ideasonboard.com/
Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_isight.c |  3 +-
 drivers/media/usb/uvc/uvc_queue.c  |  4 +-
 drivers/media/usb/uvc/uvc_video.c  | 92 ++++++++++++++++++++++----------------
 drivers/media/usb/uvc/uvcvideo.h   |  8 ++--
 4 files changed, 62 insertions(+), 45 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_isight.c b/drivers/media/usb/uvc/uvc_isight.c
index 43cda5e760a345af56186603e2f0594b814cdbcb..f0e71744d25cab98184335b46569b31ba1346e12 100644
--- a/drivers/media/usb/uvc/uvc_isight.c
+++ b/drivers/media/usb/uvc/uvc_isight.c
@@ -98,8 +98,7 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
 	return 0;
 }
 
-void uvc_video_decode_isight(struct uvc_urb *uvc_urb, struct uvc_buffer *buf,
-			struct uvc_buffer *meta_buf)
+void uvc_video_decode_isight(struct uvc_urb *uvc_urb, struct uvc_buffer *buf)
 {
 	struct urb *urb = uvc_urb->urb;
 	struct uvc_streaming *stream = uvc_urb->stream;
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 790184c9843d211d34fa7d66801631d5a07450bd..e184e3ae0f59f142a683263168724bca64509628 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -310,9 +310,11 @@ void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
  * Buffers may span multiple packets, and even URBs, therefore the active buffer
  * remains on the queue until the EOF marker.
  */
-static struct uvc_buffer *
+struct uvc_buffer *
 __uvc_queue_get_current_buffer(struct uvc_video_queue *queue)
 {
+	lockdep_assert_held(&queue->irqlock);
+
 	if (list_empty(&queue->irqqueue))
 		return NULL;
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2e377e7b9e81599aca19b800a171cc16a09c1e8a..d6777090d0f892ffe93696c915acd4ec171ca798 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1428,9 +1428,11 @@ static int uvc_video_encode_data(struct uvc_streaming *stream,
  * previous header.
  */
 static void uvc_video_decode_meta(struct uvc_streaming *stream,
-				  struct uvc_buffer *meta_buf,
 				  const u8 *mem, unsigned int length)
 {
+	struct vb2_queue *vb2_qmeta = stream->meta.vdev.queue;
+	struct uvc_video_queue *qmeta = &stream->meta.queue;
+	struct uvc_buffer *meta_buf;
 	struct uvc_meta_buf *meta;
 	size_t len_std = 2;
 	bool has_pts, has_scr;
@@ -1439,7 +1441,13 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	ktime_t time;
 	const u8 *scr;
 
-	if (!meta_buf || length == 2)
+	if (!vb2_qmeta || length <= 2)
+		return;
+
+	guard(spinlock_irqsave)(&qmeta->irqlock);
+
+	meta_buf = __uvc_queue_get_current_buffer(qmeta);
+	if (!meta_buf)
 		return;
 
 	has_pts = mem[1] & UVC_STREAM_PTS;
@@ -1512,30 +1520,48 @@ static void uvc_video_validate_buffer(const struct uvc_streaming *stream,
  * Completion handler for video URBs.
  */
 
-static void uvc_video_next_buffers(struct uvc_streaming *stream,
-		struct uvc_buffer **video_buf, struct uvc_buffer **meta_buf)
+static void uvc_video_next_meta(struct uvc_streaming *stream,
+				struct uvc_buffer *video_buf)
 {
-	uvc_video_validate_buffer(stream, *video_buf);
+	struct vb2_queue *vb2_qmeta = stream->meta.vdev.queue;
+	struct uvc_video_queue *qmeta = &stream->meta.queue;
+	struct uvc_buffer *meta_buf;
+	struct vb2_v4l2_buffer *vb2_meta;
+	const struct vb2_v4l2_buffer *vb2_video;
 
-	if (*meta_buf) {
-		struct vb2_v4l2_buffer *vb2_meta = &(*meta_buf)->buf;
-		const struct vb2_v4l2_buffer *vb2_video = &(*video_buf)->buf;
+	if (!vb2_qmeta)
+		return;
 
-		vb2_meta->sequence = vb2_video->sequence;
-		vb2_meta->field = vb2_video->field;
-		vb2_meta->vb2_buf.timestamp = vb2_video->vb2_buf.timestamp;
+	guard(spinlock_irqsave)(&qmeta->irqlock);
 
-		(*meta_buf)->state = UVC_BUF_STATE_READY;
-		if (!(*meta_buf)->error)
-			(*meta_buf)->error = (*video_buf)->error;
-		*meta_buf = uvc_queue_next_buffer(&stream->meta.queue,
-						  *meta_buf);
-	}
-	*video_buf = uvc_queue_next_buffer(&stream->queue, *video_buf);
+	meta_buf = __uvc_queue_get_current_buffer(qmeta);
+	if (!meta_buf)
+		return;
+	list_del(&meta_buf->queue);
+
+	vb2_meta = &meta_buf->buf;
+	vb2_video = &video_buf->buf;
+
+	vb2_meta->sequence = vb2_video->sequence;
+	vb2_meta->field = vb2_video->field;
+	vb2_meta->vb2_buf.timestamp = vb2_video->vb2_buf.timestamp;
+	meta_buf->state = UVC_BUF_STATE_READY;
+	if (!meta_buf->error)
+		meta_buf->error = video_buf->error;
+
+	uvc_queue_buffer_release(meta_buf);
+}
+
+static struct uvc_buffer *uvc_video_next_buffer(struct uvc_streaming *stream,
+						struct uvc_buffer *video_buf)
+{
+	uvc_video_validate_buffer(stream, video_buf);
+	uvc_video_next_meta(stream, video_buf);
+	return uvc_queue_next_buffer(&stream->queue, video_buf);
 }
 
 static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
-			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+				  struct uvc_buffer *buf)
 {
 	struct urb *urb = uvc_urb->urb;
 	struct uvc_streaming *stream = uvc_urb->stream;
@@ -1559,13 +1585,13 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
 			ret = uvc_video_decode_start(stream, buf, mem,
 				urb->iso_frame_desc[i].actual_length);
 			if (ret == -EAGAIN)
-				uvc_video_next_buffers(stream, &buf, &meta_buf);
+				buf = uvc_video_next_buffer(stream, buf);
 		} while (ret == -EAGAIN);
 
 		if (ret < 0)
 			continue;
 
-		uvc_video_decode_meta(stream, meta_buf, mem, ret);
+		uvc_video_decode_meta(stream, mem, ret);
 
 		/* Decode the payload data. */
 		uvc_video_decode_data(uvc_urb, buf, mem + ret,
@@ -1576,12 +1602,12 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
 			urb->iso_frame_desc[i].actual_length);
 
 		if (buf->state == UVC_BUF_STATE_READY)
-			uvc_video_next_buffers(stream, &buf, &meta_buf);
+			buf = uvc_video_next_buffer(stream, buf);
 	}
 }
 
 static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
-			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+				  struct uvc_buffer *buf)
 {
 	struct urb *urb = uvc_urb->urb;
 	struct uvc_streaming *stream = uvc_urb->stream;
@@ -1607,7 +1633,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 		do {
 			ret = uvc_video_decode_start(stream, buf, mem, len);
 			if (ret == -EAGAIN)
-				uvc_video_next_buffers(stream, &buf, &meta_buf);
+				buf = uvc_video_next_buffer(stream, buf);
 		} while (ret == -EAGAIN);
 
 		/* If an error occurred skip the rest of the payload. */
@@ -1617,7 +1643,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 			memcpy(stream->bulk.header, mem, ret);
 			stream->bulk.header_size = ret;
 
-			uvc_video_decode_meta(stream, meta_buf, mem, ret);
+			uvc_video_decode_meta(stream, mem, ret);
 
 			mem += ret;
 			len -= ret;
@@ -1644,7 +1670,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 			uvc_video_decode_end(stream, buf, stream->bulk.header,
 				stream->bulk.payload_size);
 			if (buf->state == UVC_BUF_STATE_READY)
-				uvc_video_next_buffers(stream, &buf, &meta_buf);
+				buf = uvc_video_next_buffer(stream, buf);
 		}
 
 		stream->bulk.header_size = 0;
@@ -1654,7 +1680,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 }
 
 static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
-	struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+				  struct uvc_buffer *buf)
 {
 	struct urb *urb = uvc_urb->urb;
 	struct uvc_streaming *stream = uvc_urb->stream;
@@ -1707,8 +1733,6 @@ static void uvc_video_complete(struct urb *urb)
 	struct uvc_video_queue *qmeta = &stream->meta.queue;
 	struct vb2_queue *vb2_qmeta = stream->meta.vdev.queue;
 	struct uvc_buffer *buf = NULL;
-	struct uvc_buffer *buf_meta = NULL;
-	unsigned long flags;
 	int ret;
 
 	switch (urb->status) {
@@ -1734,14 +1758,6 @@ static void uvc_video_complete(struct urb *urb)
 
 	buf = uvc_queue_get_current_buffer(queue);
 
-	if (vb2_qmeta) {
-		spin_lock_irqsave(&qmeta->irqlock, flags);
-		if (!list_empty(&qmeta->irqqueue))
-			buf_meta = list_first_entry(&qmeta->irqqueue,
-						    struct uvc_buffer, queue);
-		spin_unlock_irqrestore(&qmeta->irqlock, flags);
-	}
-
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;
 
@@ -1755,7 +1771,7 @@ static void uvc_video_complete(struct urb *urb)
 	 * Process the URB headers, and optionally queue expensive memcpy tasks
 	 * to be deferred to a work queue.
 	 */
-	stream->decode(uvc_urb, buf, buf_meta);
+	stream->decode(uvc_urb, buf);
 
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 757254fc4fe930ae61c9d0425f04d4cd074a617e..bb41477ce4ff5cdbf27bc9d830b63a60645e3fa1 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -479,8 +479,7 @@ struct uvc_streaming {
 	unsigned int frozen : 1;
 	struct uvc_video_queue queue;
 	struct workqueue_struct *async_wq;
-	void (*decode)(struct uvc_urb *uvc_urb, struct uvc_buffer *buf,
-		       struct uvc_buffer *meta_buf);
+	void (*decode)(struct uvc_urb *uvc_urb, struct uvc_buffer *buf);
 
 	struct {
 		struct video_device vdev;
@@ -694,6 +693,8 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
 void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect);
 struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
 					 struct uvc_buffer *buf);
+struct uvc_buffer *
+__uvc_queue_get_current_buffer(struct uvc_video_queue *queue);
 struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue);
 void uvc_queue_buffer_release(struct uvc_buffer *buf);
 static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
@@ -802,8 +803,7 @@ u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
 
 /* Quirks support */
 void uvc_video_decode_isight(struct uvc_urb *uvc_urb,
-			     struct uvc_buffer *buf,
-			     struct uvc_buffer *meta_buf);
+			     struct uvc_buffer *buf);
 
 /* debugfs and statistics */
 void uvc_debugfs_init(void);

---
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
change-id: 20250714-uvc-racemeta-fee2e69bbfcd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


