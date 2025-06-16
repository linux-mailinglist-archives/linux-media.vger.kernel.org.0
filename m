Return-Path: <linux-media+bounces-34960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C2ADB539
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AF0D169D33
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99A625A33A;
	Mon, 16 Jun 2025 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RhPPWsqH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CEE21B9FC
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087494; cv=none; b=IBD2gD6gdcV7nqmObOXcMEUnGDtcCLIScvUIxrGcnw8qaV6NxBp5PSx8ScVE39CTbMm8Tq1Z5wp5KCFSo8q5o1Gc9ymiC79CeXfo0A3/Ess0mQyfEUziCCoq5nIAViN4EEZkLAfzBlsfDT/bP0NjnhowVXXAQOS8gDhKNydAAjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087494; c=relaxed/simple;
	bh=VGZlRj6/JcwGJbMiaypib+l9NN/rmQAaBEPvRRaTVBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BsWl059SmuVpkTSv0IIK6XguXVqY1s0QOsIcr+9Aj0heqCwpJTQxJqttiAf74XjZ2N1EODOy77wFY84qZqyr+RIXGuQvVgRDQ5px7eHemAEyzYLN4RPUm/DFKaMQIL3w9fkEoPlifb+JTDyRH2DJ+QcKegBD4ipXGh/kcM8sueI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RhPPWsqH; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54d98aa5981so5856192e87.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087490; x=1750692290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFtgHVBVDAiEdle9lZJFG2R1x3eYipPxmgDmF+7JNFQ=;
        b=RhPPWsqHxtq4+OqHpsdDShBiAe/MEic2koNEHS6RVs70VkrOdN56IHyH2sMtEvA1kS
         MTqs3uRNncTkTaKUpyBWP0e5UJ8kSia8cjqbM2pC3j/cDMODQ2pHCl/XcBVVoWgNZPlG
         IAySsrf5eAhA/Tm3fKqRRlDxGvhmAi4OY6dkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087490; x=1750692290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFtgHVBVDAiEdle9lZJFG2R1x3eYipPxmgDmF+7JNFQ=;
        b=JIXAEYeYNF6fuvtKtvMKndri47dg7DLfhj1wXVkanLYvUQZ5R8Sa1uLLa7fpQKmSiX
         7WGwUNfCpEVXs+mMNPyw/8R66JTh6C6+bHSjsRW0yLcA24DpHacsLw6c/Nb25J5si8yZ
         U+mw9BSLbh3DXp23pWSLgzDeroLiKZ6RE+wYMYj7ZhA3aUn/ezPFrQV9lSXoAwitYi8k
         asG2iGIJ4Vbg7IqfcU2Uq47apW7cnGaqX96PQOpfMmuH2TkofOl/rTUMmAPpFrh1sx35
         0vp5QIX6E/wOU2yEmyOWrxio1hre6Id+UWE0AMOB8JP9yb43IUtVqZZFsMdQ9o1gNMOw
         y/DA==
X-Gm-Message-State: AOJu0YwVzHFGFhq9bA2dPTr8CkILiwOU6fxTnVedwVuZTBuYBpWYfcfE
	5ga+CVZDCZHLSscokJJGhWKmcj5f+8ErXr+IhQdGQacRGVBP01xPqNPMFx+CAjzDPg==
X-Gm-Gg: ASbGncvFDC/nANV7odtnMbnchJEOo7ge8m4hNfAjB4UZ+RZlLTOxK2l/rWiTrxRjBiA
	74BUSn41jCeMmn69SRGMNzfeGlNmc9b4rnXS2b9yHd3B8DXn/Z+phopAKttdLsMeJ/yoUb9UZlK
	6f/BE+5gz77qCffzY3vYPobPJRk1B5pU7tCLlDgA3Fr0Rkh1va89neNDAQ653paDJ/rEfS3R5dM
	B4TDEF9wCRr3W2IATkvQFJF/IE5fOxVi/gAJeCkcpM+/2fWrwz6/zgOz/CqmnpGWwWXusjgd13i
	S1bIvBfLdUjGBKP5cgjzRHcUFDleurEv8CAZ5WzRDda0+qt3bJ0xjO9WItIgT5XaBj/RvamiSlo
	skMa6cvFjYgz7jOw6Diy1VFEtrwG3tzrREHdZw8aa5A==
X-Google-Smtp-Source: AGHT+IE/FVVFHkk8r0qUiuV09HgPvz9c2KwY2zvYctVzIMzTqcOZ9wglaIh2OnOY2oJ7FgI4vkXuLg==
X-Received: by 2002:a05:6512:3090:b0:553:a4a8:b860 with SMTP id 2adb3069b0e04-553b6da30fdmr2585034e87.0.1750087490428;
        Mon, 16 Jun 2025 08:24:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1dbcf5sm1564271e87.190.2025.06.16.08.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:24:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:24:39 +0000
Subject: [PATCH v4 2/5] media: uvcvideo: Handle locks in
 uvc_queue_return_buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-uvc-fop-v4-2-250286570ee7@chromium.org>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
In-Reply-To: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

Most of the calls to uvc_queue_return_buffers() wrap the call with
spin_lock_irq()/spin_unlock_irq().

Rename uvc_queue_return_buffers to __uvc_queue_return_buffers to
indicate that this is the version that does not handle locks and create
a new version of the function that handles the lock.

Reviewed-by: Hans de Goede <hansg@kernel.org>
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
2.50.0.rc1.591.g9c95f17f64-goog


