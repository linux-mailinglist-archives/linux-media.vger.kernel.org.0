Return-Path: <linux-media+bounces-66007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vtmCD1evQmrG/gkAu9opvQ
	(envelope-from <linux-media+bounces-66007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:45:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 344536DDDB2
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:45:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=jTlX55oS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66007-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66007-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49827302C28B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26E63806B0;
	Mon, 29 Jun 2026 17:31:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA427368D7C
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 17:31:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754308; cv=none; b=hSOg5oe5LTdisiqW3h2CC/1VShmICyeH9rWVyCBx9ZNwvB0fadoPpB/wNTKgCEfkCgAPQzvaFVm7sZ3zXBTtfFdRLQZlo80mgdz1epGy3iy70wjUgc+I9OwWsm6ktSePO8v8ez3trDzqY+oFw5pT2F4Dkc8Y/v6gnPIaq3yQPds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754308; c=relaxed/simple;
	bh=FXwZQn2oGObT0gtqNm0T5nh3tM5DS7sD3j5gEb5CzpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfW5Gjou9+lBH1hgkdgA+wfkj2yl1YcxEaF8nA46aXWb9lh0W6jacJynWEqB8JeDsvhh4+8YjyqUQJ5r8g4iwKKLztEpRJ4jUjnT0dExUEdt+oHKIXp/du/dsVitD5WhDafHbwA8UcejxhlRu2+pIrfk5XwFP2TUnr+UHrboMiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jTlX55oS; arc=none smtp.client-ip=209.85.167.50
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb36ed873so1434154e87.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 10:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782754305; x=1783359105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ub6cmXr21/KBDzFtT9pGKtoYiZcfRLiOmpX1+fKWDJg=;
        b=jTlX55oSeNGfP6iH3JVucF2NteAM7kkhpI+gr0aF21jBmqIlSH81MC30o+kfplquno
         4cYj5kCrDztIDYkkCGi2KHD+3d921UCWRJN8YcuDR993lBaL/OLfcqQwicIp2MV3VfEA
         VNG1JxwVsQkoVo4hTW6yqnbeqAvPsW15nsaTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782754305; x=1783359105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ub6cmXr21/KBDzFtT9pGKtoYiZcfRLiOmpX1+fKWDJg=;
        b=j+adAysYxPhfp+AMesvVdVdXEazrYMMVkvk2O5wrT0FwsjJxYv3D/r/hzqeWpUx/DP
         7b8WwY3shruP3oJmW4w4cjFryOeghBhcc2fzz0G5vqGkxbmtOV4he29tGjhK+wzN/NoU
         NhvAuOKU2fmaHRc0HPf3kjVd/bZwDAmr6eWPoK86llOz4WJ2iNJRvD/shWHRXR9ItbT5
         igGekO7N9pO9wv5UCUWnV5x1h/g7ZvPO/BisbS9DKRsWkXt33SwcupewZ1WFzd4IkIUO
         4KQmHNwg+G1ROpBYFnXGk/SB/qa0YFUXu8J1rCre2+igwYIFez8IJGwqWUwH5go14K2M
         F2zA==
X-Gm-Message-State: AOJu0Yx61FFKochJGwL8wy+Lrfc65H/y6zbRh7MZFqtDQ6iSzFnyQTw5
	n0sqKF42tAD0JboqWx/dyB6gXI4/hpqIGhV6EiDc3kdf/7CJanP8Y4PfOuVgqfXW2dW3wojWMCX
	zt8wDOihb
X-Gm-Gg: AfdE7ckMb2TRrOF+QtLeRnQI903jKHns372zT6SbOHonWzl7oDEc5Yb8hlBiHfm+wJj
	mTIB2VwkS7MeXXHK1o4c4yhpIxGkJLdejUfiNQv+EnqrgZccM81Og5QnlWz89l1h7x5odiArxRu
	EnNre0XCaDeR7axhtCnu4clkoEuf43lOMRSJ4acuLzFG9YEVHcFqBtFplHXHj9JP9oQfXXs1AyG
	UxFUKVucQK1WL3ErU7lniMoxeN5cZeSlu0mtnz3vC9A+Xuv7nZfwrtQA+yKPEN51GG/fcsGwBnJ
	RkPuSMYmlZPqyAVmOPkWe7ZPYC+CWaydgqhIB5seC9A6xdwuqMZNzN8fHPEb7IgbVbvnR8Tllb9
	XN6qLZlhDLkVRdusaWY1K/9lDkXZdZFqrq4sy3FrGPXJ9EJCkAwjKuHtxLoMfGVq2GrFjXuGZcM
	qSfLsW5x7Q3HDTJ2aSIrCN7aoxkYmTgi/RUVzxV5otwGnmPxYYZSNDwKI0k9r5Dn2VUVCDfboEL
	AnmZeo=
X-Received: by 2002:ac2:5683:0:b0:5ae:a348:1292 with SMTP id 2adb3069b0e04-5aebdba2df9mr49810e87.38.1782754305092;
        Mon, 29 Jun 2026 10:31:45 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea237d2e7sm3973868e87.28.2026.06.29.10.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 10:31:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 17:31:41 +0000
Subject: [PATCH v2 2/2] media: uvcvideo: Use wait queue for metadata
 streamoff
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-uvc-racemeta-v2-2-10e91d2afba0@chromium.org>
References: <20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org>
In-Reply-To: <20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66007-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:guennadi.liakhovetski@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 344536DDDB2

We are now using a schedule()/loop to wait for in-flight buffers. This
works, but it is not beautiful. Instead we can use wait queues.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 7 ++-----
 drivers/media/usb/uvc/uvc_video.c | 2 ++
 drivers/media/usb/uvc/uvcvideo.h  | 1 +
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index af9dbfcf6f53..266a75862f0a 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -214,11 +214,8 @@ static void uvc_stop_streaming_meta(struct vb2_queue *vq)
 	lockdep_assert_irqs_enabled();
 
 	spin_lock_irq(&stream->meta.irqlock);
-	while (stream->meta.in_flight) {
-		spin_unlock_irq(&stream->meta.irqlock);
-		schedule();
-		spin_lock_irq(&stream->meta.irqlock);
-	}
+	wait_event_lock_irq(stream->meta.wq, !stream->meta.in_flight,
+			    stream->meta.irqlock);
 	stream->meta.in_flight = true;
 	spin_unlock_irq(&stream->meta.irqlock);
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f6b55b3a3308..735080d40862 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1802,6 +1802,7 @@ static void uvc_video_complete(struct urb *urb)
 		scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
 			stream->meta.in_flight = false;
 		}
+		wake_up(&stream->meta.wq);
 	}
 
 	/* If no async work is needed, resubmit the URB immediately. */
@@ -2357,6 +2358,7 @@ int uvc_video_init(struct uvc_streaming *stream)
 		INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
 
 	spin_lock_init(&stream->meta.irqlock);
+	init_waitqueue_head(&stream->meta.wq);
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6f1a3381d392..b28f418c6543 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -486,6 +486,7 @@ struct uvc_streaming {
 		u32 buffersize;
 		bool in_flight;
 		spinlock_t irqlock; /* Protects in_flight. */
+		wait_queue_head_t wq;
 	} meta;
 
 	/* Context data used by the bulk completion handler. */

-- 
2.55.0.rc0.799.gd6f94ed593-goog


