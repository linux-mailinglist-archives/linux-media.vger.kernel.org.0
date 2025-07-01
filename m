Return-Path: <linux-media+bounces-36381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C22AEEF23
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC04B3BF3C6
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 06:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84E425F78F;
	Tue,  1 Jul 2025 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vm5mIpfV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D416E21323C
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 06:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352330; cv=none; b=PALooIlO3EYsD0+Wl8qsPwyp07A8WC7CRr0+BWGL14k7lbn8KXs0zltbzaThlruzhgRSveqOSSDUalydhDxrZYxgtZLhgXjLWTfNNsladznQ2vrts2fSajXuxbNFxMX9eVHwUQq9AXhkkv12x8NTnCjGyW9VEjYRd1ms5Vk3NHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352330; c=relaxed/simple;
	bh=jhmtrOZynF97yPTl8KLNDy4e5vqCIcVcQhtc4QKka7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jpc2gUTNyX1tdT65Obed34dRb+OJXnnapurs4TwstFuL1ad1Lb4lvSqmUSSdZXkHFWufvblJtiGMYZnsf8g8WJ5LjpJZliTiBeQ51S3aFqRQ7K8X2I3yWfCwdAX/cp34lden9gjE//KcAz1TxW5IHO3CqxUBxwZe7ZlseFXjEjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vm5mIpfV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5535652f42cso6298645e87.2
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 23:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352325; x=1751957125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sXxnutuQNshAuN25MG1B9YNe5116VtrTWttVb+J9U0=;
        b=Vm5mIpfVaz3rUdhYcQQRP92XWGAmyxL2SrEQWE15C/sj2HAgFX5bPZLiBb2WTL0X3R
         j4COTNY9FodlmoMyKPYGjdvXj1p429hmAt7W5PRIV15t8okmwxRPhxETo/lDLBYNPjkE
         k5pZ9qpNn/7kjDBRaPzxS9zGgQdc3bWBbXUm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352325; x=1751957125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sXxnutuQNshAuN25MG1B9YNe5116VtrTWttVb+J9U0=;
        b=SbPoj314QDfTESdYUO3RhjSlvVhrY9ESeEvlxcBcb219Av7sCYKouZH7ksie9UTw+w
         6C3LZKPAkJZ9zbbjT4thPm7C6jX0Abp8zb43tmVNTVy5P7f9JhJLJC+f5zEAvH8Qu+Xq
         Ey9xRqaaiSGt8jlPgVwQ6UgkXJqBiOGPPfs2lpmUm9HQcTzCgr7xKsPCbGAV1o5Yuxcj
         zuxzAtuccfOfNa4TVpl0UxSaIiuNq0GtAgUFIPSXwW2jEp+jxS4bwlF4BRu64LlGV1kW
         0p+OdPtFZxVZM30Q3nIQ79GKXax6h0BQuX6dNYWcM+1Okb/bQXbA251V39MCX+X1nq1L
         NyrQ==
X-Gm-Message-State: AOJu0YwPkSEbRDFIcYNQwtQqVLSaelIMO8OLmxZ/zK2eGFPG36eYxLqm
	UwnOCDh0FdgiRFzQZ0dM2Qe/GCEfNGKGJ2jemOw2xvopFXYFQvakQIsvcO/mTy9FX5UKgwPudkJ
	bgulj1g==
X-Gm-Gg: ASbGnct+jleK6+2WpmhCSl9B15gLJL4LRYxGRBOi9BWoM3lz5ot2RZvTEkXVA+7idzJ
	LmpRI8vIBhGg8FNpurcPn3Ma/7ncM2ITql3T7PQD3srjCgZS7ywiC7wlA1CT89rQO72acRhFw+6
	Y6X3i+SMMAL8obJq4TDlGxNrHuU7SAcz5YMvyZnWQri119wMNJy4ZrFSSRIe5LTgRblRnTyvMwL
	dUZ0v4RC69K1t6nSyzoettgjRatDBMf2vRozJg5w5AePSaF8onmZBV7u0p8B5hQnjn7jOfacZUV
	IOYNgmiZeNjAvCnC/xBukIFMkifAi4Bf8L0L730GviF3ZtWZgUc+tWP/VIWa8OOVEcySI3dXAqy
	ZO02uPPXvzTR/10iZzkqShwSd+evcV9KBBIZONj3sYU9UhUHK1EVL
X-Google-Smtp-Source: AGHT+IF1etfyT7/NUGPtPe6d6TgQJ1iZ8CgDGWZOhy283zZxe+7Pl5YxqqWScvwVSr2a+sYL6DYvnA==
X-Received: by 2002:a05:6512:ba1:b0:553:2869:3a5 with SMTP id 2adb3069b0e04-5550b8d00f2mr4123019e87.48.1751352325396;
        Mon, 30 Jun 2025 23:45:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:15 +0000
Subject: [PATCH v4 3/7] media: uvcvideo: Split uvc_stop_streaming()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-3-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

uvc_stop_streaming() is used for meta and video nodes. Split the function
in two to avoid confusion.

Use this opportunity to rename uvc_start_streaming() to
uvc_start_streaming_video(), as it is only called by the video nodes.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250616-uvc-fop-v4-3-250286570ee7@chromium.org
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 8f9737ac729546683ca48f5e71ce3dfacbae2926..b11f56d62ec0495a8610580367486dfaa31c450d 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -167,7 +167,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
 		uvc_video_clock_update(stream, vbuf, buf);
 }
 
-static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
+static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
 	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
@@ -186,14 +186,22 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return ret;
 }
 
-static void uvc_stop_streaming(struct vb2_queue *vq)
+static void uvc_stop_streaming_video(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
 
 	lockdep_assert_irqs_enabled();
 
-	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
-		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
+	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
+
+	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+}
+
+static void uvc_stop_streaming_meta(struct vb2_queue *vq)
+{
+	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+
+	lockdep_assert_irqs_enabled();
 
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 }
@@ -203,15 +211,20 @@ static const struct vb2_ops uvc_queue_qops = {
 	.buf_prepare = uvc_buffer_prepare,
 	.buf_queue = uvc_buffer_queue,
 	.buf_finish = uvc_buffer_finish,
-	.start_streaming = uvc_start_streaming,
-	.stop_streaming = uvc_stop_streaming,
+	.start_streaming = uvc_start_streaming_video,
+	.stop_streaming = uvc_stop_streaming_video,
 };
 
 static const struct vb2_ops uvc_meta_queue_qops = {
 	.queue_setup = uvc_queue_setup,
 	.buf_prepare = uvc_buffer_prepare,
 	.buf_queue = uvc_buffer_queue,
-	.stop_streaming = uvc_stop_streaming,
+	/*
+	 * .start_streaming is not provided here. Metadata relies on video
+	 * streaming being active. If video isn't streaming, then no metadata
+	 * will arrive either.
+	 */
+	.stop_streaming = uvc_stop_streaming_meta,
 };
 
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)

-- 
2.50.0.727.gbf7dc18ff4-goog


