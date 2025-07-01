Return-Path: <linux-media+bounces-36380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624A6AEEF20
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBAB13BE5C3
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 06:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116B325D209;
	Tue,  1 Jul 2025 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SQ4I4m+6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B36D1E51FB
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 06:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352329; cv=none; b=BwMhc6z2duA/J7L9RvsRDRVJ5V6qpqL/AifOOFTAXLMckIWhLQFEfR+akQVrqsx+SZ234hijmZuob1fPrc64gd57wfYnNkrUnNd85VKl4Wu73ojNozDiDllERBCpv95SB8DVXtLerWYIwWTgjrr95jLa/WZmQEI0tnVsXP4oYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352329; c=relaxed/simple;
	bh=yqUXUVprqc4Kpn+kWKnhx6hx/ZsxT0W1igC+YxtmoeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pr3VDFaexa7dYbe7gvvrTQnKti7Qyid+Uv5aaeYTVezhx0KIi5Bk2x/NHJS7bzxXavTnbAyHTouVE7xXY7LClN1s9MECopZqhNWXFyb9OfV+Ts/LfS7eIcAnS569ZP5H7U5BzDKStsm0AnzDuaxa46b/Mrns7UbMUT/4GMWNvIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SQ4I4m+6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b3316160so3283447e87.2
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352325; x=1751957125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrE6GNKbVHGpnk0TTosO+XCb4jgeJmiva3zLbz/vTGo=;
        b=SQ4I4m+62UjAXXXbkoJ0BDJxo4teoFxgg2PHJ0GiP+3Y5TFdFKqwGnaaX7r7zs+ZI0
         WoWo/1FEUI4n1qjIIK4/q4XSXkxqHzlyhpFPVZQx2JsGQmFKAPKd8CEkiGFbY3a0ICsK
         +i2aKOtX5vJUOhwKb0ag0iYZXNUYkQl6KC/ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352325; x=1751957125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrE6GNKbVHGpnk0TTosO+XCb4jgeJmiva3zLbz/vTGo=;
        b=Pb9YnzEMabCxtG3Akcjqen0t/3sDzMfb7h7jRLNVe1JIQsGQlThoiuESMZexmNoULU
         Td/4JyFbAceM3X6PJVJAByhc6zcNPqScR3RIAFu5jHc8Q1mlaatKugPkradZMY+Gz5d4
         cppNilvBvLg5AJJZyKjFPGpAemNkOz4EyuX9Ej5VktDR16rPNiIjOVqx/4UR53cHvE1G
         3hqdPEgRz/RTWImHu8FQAXrWQT3Ec2ercoaM8PTanKJk8oEEtDFBN/4oa/lELTDHP2CY
         tCJ0fK2gdQJXuCESqmaSNyZOpycDaN+RoDW9U/p/4fd/G6iO3xLx7YFQ24+g+zl8o2JL
         TukQ==
X-Gm-Message-State: AOJu0YwGVBMqkeE40xRWix270fBMNSDJexQ6KkXvHsAURqfuLy1vTl2G
	EVL8RdRWqykUPysURJPKhf+HbtsGgquI8c3OQIWEsA/VoHSWPcQMfAw5ghr7AUmpcBcQ5tYSN8G
	gGBxjKw==
X-Gm-Gg: ASbGnct6FrqWWNZwTJOi7l8KhbmVUt/Wqitd4qf2ElWelYFmw5itO3cQ6frLkR8KTHz
	hwF+ekqxiC+ygEGqIdP3owR4VpWlHRQMH75M2Mt37JDyXnBD9vdmYyMsjwo8v9Jkc06eAz7CzX7
	O1y2WrJv1vZL7fft9EVkuZ+luliaOfTFvn6uc5+NA/4C7B0pC8vksnzx81/xtv4n9ZnBrFffzTM
	KKxgXDXOP9Jlxu/pQz/EgAiOsBsqxhtWsMd3Xb2Z2419lI1kVeqqaKwME5vn72gGahdjwp+SvQx
	6JAO/N8qSnLchPQjSUOahbrPIA5K59vTd6vSeq3uF9nllnI1uZz0Nyor6pyEjWVkmTWQiV2T3tv
	4wQieZiqPFiHN5944k4Wdc+O78W+Oc3wPN/cNH9CdJ/2m9hMl5v37
X-Google-Smtp-Source: AGHT+IHY76y/ZDISkpxUl6amnEu/t94jj6fApWTdAJWcSYw0wJUfwh4U1PILUm61fBldVaiwf60NWw==
X-Received: by 2002:a05:6512:3d22:b0:553:2e59:a104 with SMTP id 2adb3069b0e04-5550b8cfec0mr5233484e87.37.1751352324890;
        Mon, 30 Jun 2025 23:45:24 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:14 +0000
Subject: [PATCH v4 2/7] media: uvcvideo: Handle locks in
 uvc_queue_return_buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-2-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Most of the calls to uvc_queue_return_buffers() wrap the call with
spin_lock_irq()/spin_unlock_irq().

Rename uvc_queue_return_buffers to __uvc_queue_return_buffers to
indicate that this is the version that does not handle locks and create
a new version of the function that handles the lock.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250616-uvc-fop-v4-2-250286570ee7@chromium.org
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Hans de Goede <hansg@kernel.org>
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
2.50.0.727.gbf7dc18ff4-goog


