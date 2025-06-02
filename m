Return-Path: <linux-media+bounces-33943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EABDAACB94B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 18:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B00003A4B37
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6359C225A24;
	Mon,  2 Jun 2025 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JETXxFjx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6D225768
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880418; cv=none; b=B8iv7eYFdPh/9DzKajqwct/SwEomBA48LSoKPvSkgmtENC49ZYxZnM5ChlvlEUMbzzecU5GGWzuuql/qvRsZ4yWvir+JFPVsuc2TrKI2HLh4lAvI0M0dfmCRY6/KMfuZW//Xb4wDAvtzCOPaUExN57jos2AOzdRVa5IajMW8t/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880418; c=relaxed/simple;
	bh=bpEYln/8wFdT/ptVY7qi+97NkzepeIhBhRswFy5rIAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezUYww46PmlP1Z9mqbfEr6BIeoaYVHkqjCexPPXe9a6bZ1iU8PoUf8DaobuO80Dtp25K5G4HGerGYSf3nYJpNc5G40fpVuydLdOqI/FCzehDSRaKI9e/VpVpu6RvtoSN6SGVvNqT3AsoU2fks7NWCQ697hlHK76RKS533BM5xnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JETXxFjx; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5533c562608so3334049e87.3
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748880414; x=1749485214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efP3IxJ2OLjk9HTtbcsKFWKXCw7ZfZSVYKNc3/G7w2U=;
        b=JETXxFjxs3sP+TPlEuvAek/mrZ94FLvSvHUjAHjMrbmQNEajIMT9jvwxWmCG2TGx2g
         NVEBcRmoWmA6kv7eRvZM5FFF0PRIi0GWh5FAW7GdmpAdmfcP4y0DHIhZO2IcADTdnZjE
         eC/wYQQ/d1bcdG54PWSdumJxYJjt6QGYPcImg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748880414; x=1749485214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efP3IxJ2OLjk9HTtbcsKFWKXCw7ZfZSVYKNc3/G7w2U=;
        b=WNcT3YqyoMPPSlZSDS9V2CJjU/UuJukFLPVSz5pwpzNT1eV9OZAtNji7KmRWy74LYA
         XLrXq22aqT6BYX9XcURc7sQh2j7kaOMgxVIkIVeJ10QQHEvZWrNRSn0Ej5r+vhPtRL2L
         dfy09pjFFWew4jy357u/lHEpgU1vZ4HhsBJ1CDjAchNQ5NNIwX517TMqSvO+0RbXZ1AN
         LTYesXJ3hqsKBFdgDTTLp461YmfEtCoOHGUAGDe3gCJBxH4CoLhWiXqxdZG5Q0xJoR+Y
         633IEAawPIYGrX4LK738jqQ28ayxDxyaBuC6SF1bgZDXHpS44S4JyXuBl8cSnt2RM1kN
         8uag==
X-Gm-Message-State: AOJu0YxN7FtZIBIXgjbBWxpEtAzp3laLYsSzUbzCo8OD/GgkiZtclcCa
	aPY7JYoYqd8PLwEZ9Q/J1m9elxXImnaAHsyE7CioFESKn+puJ3e+WI6c1jFmA/L5zmMr7i+heo4
	S5EA=
X-Gm-Gg: ASbGnctXvlXEZWLplaEknZO+86+NA8jQwVNWDQZI5jUcZQJ6EH0HrY1UBLtCpY+OM2k
	VayVVX2j1VuFl0PuCv9UTZwSUg4fZTtDicj7zdL/bcdK/srgPu9NI8mHeWFPu6/R/FFPGhoAQo/
	A0NSbK6D243i25/yHd+kdxo06ydWkxbfVvwuPvbP0Q0RPtnsPUgzULnbQBnIAcSRdL6x7R/Z6u6
	qvAnuWfPlJXkAYh43/6V1i9bKWcEfVSgMbjxgRM9DQDBeuH1CCnhqC2DGBJWaFXETRxTv1XGFbK
	2Q0M27mXT6XDXev07+4dCkPQFXKqyrv/7p5k0PnTcPf1EKAP3qTK53BWlJERJ2beNeOVNCsf2we
	pzgwS21zsGyfWCTqdgoSa/aIQQQ==
X-Google-Smtp-Source: AGHT+IFQDTvJfIrCftEwU9zeJo4OFOcaIU2aCEdgUR2dSt6cy7LF8kw8+QhTXCXa1wdxZHtucUBDhw==
X-Received: by 2002:a05:6512:e9f:b0:553:2e3a:bae with SMTP id 2adb3069b0e04-5533d1b80edmr3477475e87.39.1748880414102;
        Mon, 02 Jun 2025 09:06:54 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533789ff59sm1685113e87.70.2025.06.02.09.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:06:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 16:06:46 +0000
Subject: [PATCH v3 3/5] media: uvcvideo: Handle locks in
 uvc_queue_return_buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-fop-v3-3-a99e18f65640@chromium.org>
References: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
In-Reply-To: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Most of the calls to uvc_queue_return_buffers() wrap the call with
spin_lock_irq()/spin_unlock_irq().

Rename uvc_queue_return_buffers to __uvc_queue_return_buffers to
indicate that this is the version that does not handle locks and create
a new version of the function that handles the lock.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 72c5494dee9f46ff61072e7d293bfaddda40e615..8f9737ac729546683ca48f5e71ce3dfacbae2926 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -42,13 +42,15 @@ static inline struct uvc_buffer *uvc_vbuf_to_buffer(struct vb2_v4l2_buffer *buf)
  *
  * This function must be called with the queue spinlock held.
  */
-static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
-			       enum uvc_buffer_state state)
+static void __uvc_queue_return_buffers(struct uvc_video_queue *queue,
+				       enum uvc_buffer_state state)
 {
 	enum vb2_buffer_state vb2_state = state == UVC_BUF_STATE_ERROR
 					? VB2_BUF_STATE_ERROR
 					: VB2_BUF_STATE_QUEUED;
 
+	lockdep_assert_held(&queue->irqlock);
+
 	while (!list_empty(&queue->irqqueue)) {
 		struct uvc_buffer *buf = list_first_entry(&queue->irqqueue,
 							  struct uvc_buffer,
@@ -59,6 +61,14 @@ static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
 	}
 }
 
+static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
+				     enum uvc_buffer_state state)
+{
+	spin_lock_irq(&queue->irqlock);
+	__uvc_queue_return_buffers(queue, state);
+	spin_unlock_irq(&queue->irqlock);
+}
+
 /* -----------------------------------------------------------------------------
  * videobuf2 queue operations
  */
@@ -171,9 +181,7 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret == 0)
 		return 0;
 
-	spin_lock_irq(&queue->irqlock);
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
-	spin_unlock_irq(&queue->irqlock);
 
 	return ret;
 }
@@ -187,9 +195,7 @@ static void uvc_stop_streaming(struct vb2_queue *vq)
 	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
 		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
 
-	spin_lock_irq(&queue->irqlock);
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
-	spin_unlock_irq(&queue->irqlock);
 }
 
 static const struct vb2_ops uvc_queue_qops = {
@@ -263,7 +269,7 @@ void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
 	unsigned long flags;
 
 	spin_lock_irqsave(&queue->irqlock, flags);
-	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+	__uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 	/*
 	 * This must be protected by the irqlock spinlock to avoid race
 	 * conditions between uvc_buffer_queue and the disconnection event that

-- 
2.49.0.1266.g31b7d2e469-goog


