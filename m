Return-Path: <linux-media+bounces-66006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N9AcNSusQmoT/gkAu9opvQ
	(envelope-from <linux-media+bounces-66006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:32:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 471626DDC14
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:32:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=WHuvkSWb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66006-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66006-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09E7E303B19F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7626C37F8B1;
	Mon, 29 Jun 2026 17:31:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828CD321445
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 17:31:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754307; cv=none; b=jooYEhj1GjNQdFYkwJIhFo0yFRss3nTikaGtrLIDVfsvWeycz7TpXFb5QZFG7Hzi/R2Y58gPtdBA8CAKg2bBtqG8ZnA3AOxBVL44xT7rc2/tk0tYavU3D+f9IKq+/3ph3iPKXI3NBFbDzO27Nq4vkDgdpc9KZi09+HSdDP7fpqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754307; c=relaxed/simple;
	bh=hV6yRbK2467vGWi8u/kz/QELon4l9EmKSX+FP3y6X7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R60tzKY4lxgR3Nx6rCNPqFe2pGmEUulMx9TIIAQ/wV4HInWwf25jMGEf2pBhU8AlzcgmxSjITgBdks1v+5pux6TtZ/UzeYqa20WUHbHvSODZHs9kWoX8tCantJ/xIF5I00UHoXcsGA9Rb3FZRErV3ahOF+VSF4mxBqlvy+i/Og4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WHuvkSWb; arc=none smtp.client-ip=209.85.167.44
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb91c003eso1152619e87.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 10:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782754304; x=1783359104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zAVInwpKbrIbwGCCm712zoSGUq4vsfLClxgHW2en+4=;
        b=WHuvkSWbrWVLsO1/9O9t++4zNt3inUhU0ZUqtriLXLTe/UoakjwWoxBlNOxRqgjSdX
         KF4lynT/xrSDz1obnCbDW/wv+6w9SvS5QUzXgRBQUkHn216q/Zn8YaoejGdUprXQEwSW
         edQzqh6uC2xMWaxEtYyLk5vFYgAtbJ3hqtUB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782754304; x=1783359104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/zAVInwpKbrIbwGCCm712zoSGUq4vsfLClxgHW2en+4=;
        b=i5S2WJPtdyPd3sG069aOyPO6bQFo4KrImJrSYk6P1WRk+mSOt7J+WaJKqPDXBiQDYg
         6TGscoAnmCROYTuITaCBGaZzOpbHmJQc886HAcVDeMDkJAbxfcBTyFfWv0VOwhjsUQJB
         i+7yppB/a0Tj6K/7nTB2r+izLmv3yXhT9XoLp4iDmFYtAcNGOpkYNHmUgDdneh9a8Mep
         NxJAHqQbMMAleiPsqpJeF6/WzFdWAlxOH89AVEu5xatLEID+dr9Guo6pqq0ACljMeejd
         0rpYDtU3NzezoGa8DgfZIrvEnO92fn40o2msqCaxXbvpYzSuH9CdAsxC9t038XloSTw8
         BhNg==
X-Gm-Message-State: AOJu0YzyvNgcD3W4W/J/5sTCNQjkYUImUY5eI1W4L4UReA9e7FSmv+ef
	R5p5FL0RPnr2Nl8CzkiyzhYoYRhH5O8XuBSMU38YVPQWNgNij+WJHFsu8FjzS0NAcg==
X-Gm-Gg: AfdE7cnPlxiLZ+tKkG36NgVkgWAd7jWtZkWYdkHoaTvzJGhCPpStAGh+tZcXmZaopzC
	90/NzQer2oyGrL+LpwmlCtz47lrdt4Z3OGb0orlVfxSFKPpI5CVjiL2HlCU0FZOO2qcdpUuxZE1
	XCOGfZWLLv6yGHhkxvknfZkxIiYJQ2cN3aPQZuO7wRiXYFVPR7/vLQFgsMEicI83/g1heyGQpeR
	H6lB2df0Kgka8jTeLtXcBWRpc9HTVvkXtQGotjDZUux2REj+8SitPwd5rJ3W4BDtpJvvL4zHzES
	ONiQRZwa8nxKgOhN9cwWJgFxTDmGODM5uBo1/iG5/KCSvU8jrsvGHmZV5xFyxls+AU/iU+rOBia
	GiANNBH5XWZOXmSUfyg4RQbT7fyNuSGdhEV2UYacGIDmTX+mH0RpEDY4UXwVoXlFvhMqU6OPG/l
	TJ13UJf89ZorLcKKl5ybGD7VEEIxoBuNvlBYLuXNbL8tPBzH/OrVUCR61PLI6FkV368d0D
X-Received: by 2002:ac2:51c9:0:b0:5ae:bd53:70f8 with SMTP id 2adb3069b0e04-5aebdbd0f47mr49607e87.47.1782754303842;
        Mon, 29 Jun 2026 10:31:43 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea237d2e7sm3973868e87.28.2026.06.29.10.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 10:31:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 17:31:40 +0000
Subject: [PATCH v2 1/2] media: uvcvideo: Fix race condition for meta buffer
 list
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-uvc-racemeta-v2-1-10e91d2afba0@chromium.org>
References: <20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org>
In-Reply-To: <20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66006-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:guennadi.liakhovetski@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ribalda@chromium.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 471626DDC14

queue->irqueue contains a list of the buffers owned by the driver. The
list is protected by queue->irqlock. uvc_queue_get_current_buffer()
returns a pointer to the current buffer in that list, but does not
remove the buffer from it. This can lead to race conditions.

Inspecting the code, it seems that the candidate for such race is
uvc_queue_return_buffers(). For the capture queue, that function is
called with the device streamoff, so no race can occur. On the other
hand, the metadata queue, could trigger a race condition, because
stop_streaming can be called with the device in any streaming state.

We can solve this issue introducing a flag, stream->meta.in_flight,
protected with a spinlock. When there is a buffer in flight that can
write into metadata the flag is raised, notifying the stop streaming
that it needs to wait.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Closes: https://lore.kernel.org/linux-media/20250630141707.GG20333@pendragon.ideasonboard.com/
Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 14 ++++++++++++++
 drivers/media/usb/uvc/uvc_video.c | 30 +++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h  |  2 ++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f442f..af9dbfcf6f53 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -209,10 +209,24 @@ static void uvc_stop_streaming_video(struct vb2_queue *vq)
 static void uvc_stop_streaming_meta(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+	struct uvc_streaming *stream = queue->stream;
 
 	lockdep_assert_irqs_enabled();
 
+	spin_lock_irq(&stream->meta.irqlock);
+	while (stream->meta.in_flight) {
+		spin_unlock_irq(&stream->meta.irqlock);
+		schedule();
+		spin_lock_irq(&stream->meta.irqlock);
+	}
+	stream->meta.in_flight = true;
+	spin_unlock_irq(&stream->meta.irqlock);
+
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+
+	scoped_guard(spinlock_irq, &stream->meta.irqlock) {
+		stream->meta.in_flight = false;
+	}
 }
 
 static const struct vb2_ops uvc_queue_qops = {
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index fc3536a4399f..f6b55b3a3308 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1732,6 +1732,26 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
 	urb->transfer_buffer_length = stream->urb_size - len;
 }
 
+static struct uvc_buffer *
+uvc_video_get_current_meta_buffer(struct uvc_streaming *stream)
+{
+	struct uvc_video_queue *queue = &stream->meta.queue;
+	struct uvc_buffer *buf;
+
+	buf = uvc_queue_get_current_buffer(queue);
+	if (!buf)
+		return NULL;
+
+	guard(spinlock_irqsave)(&stream->meta.irqlock);
+
+	if (stream->meta.in_flight)
+		return NULL;
+
+	stream->meta.in_flight = true;
+
+	return buf;
+}
+
 static void uvc_video_complete(struct urb *urb)
 {
 	struct uvc_urb *uvc_urb = urb->context;
@@ -1767,7 +1787,7 @@ static void uvc_video_complete(struct urb *urb)
 	buf = uvc_queue_get_current_buffer(queue);
 
 	if (vb2_qmeta)
-		buf_meta = uvc_queue_get_current_buffer(qmeta);
+		buf_meta = uvc_video_get_current_meta_buffer(stream);
 
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;
@@ -1778,6 +1798,12 @@ static void uvc_video_complete(struct urb *urb)
 	 */
 	stream->decode(uvc_urb, buf, buf_meta);
 
+	if (buf_meta) {
+		scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
+			stream->meta.in_flight = false;
+		}
+	}
+
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
 		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
@@ -2330,6 +2356,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 	for_each_uvc_urb(uvc_urb, stream)
 		INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
 
+	spin_lock_init(&stream->meta.irqlock);
+
 	return 0;
 }
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b6bcee4a222f..6f1a3381d392 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -484,6 +484,8 @@ struct uvc_streaming {
 		struct uvc_video_queue queue;
 		u32 format;
 		u32 buffersize;
+		bool in_flight;
+		spinlock_t irqlock; /* Protects in_flight. */
 	} meta;
 
 	/* Context data used by the bulk completion handler. */

-- 
2.55.0.rc0.799.gd6f94ed593-goog


