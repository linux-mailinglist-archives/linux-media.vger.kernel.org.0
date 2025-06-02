Return-Path: <linux-media+bounces-33944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F6ACB94F
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 18:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C15BF7A9B32
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C474226D0A;
	Mon,  2 Jun 2025 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GNs+oMFL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68D9225A39
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 16:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880420; cv=none; b=kzEVyydpBjUH5SBPB15KDo2Y1JZFBxw6/hovLR8vA8jNzMNnouIR5v9qfYz6fc1ba4VQjd9022Ae69UsLvVN/UGdFo2MjptnsDhrFGPSjhrYdfY5W5Mg0hQJWi6Ddeh6IMTYzBeh0KB+VHIIZ5PptvF30ZhMUg5CqxG07WUfvus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880420; c=relaxed/simple;
	bh=x8ARRUfk9oLGkaOrxkaBCWajZYx1f7oGSGAHZC6eR3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UimWgNqMeePe1tABqW63nr4u7UnfnGmlHGPVEEhg4GMPPyeoPuE7+iaCr3wZsUR2SUUrvY+YxnbYSjUNpKt7xwL24u1QCBd8iaPXmLPAPf9CoMhW593ATjs41lca3YKiGehiRkE1f5iSV/e6nctFsLR4qRM0s3wIZjUA8awh+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GNs+oMFL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d98aa5981so6455780e87.0
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 09:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748880416; x=1749485216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tsl+7wQGk9ZntFAe3/W4dFK7sUDLARFjk/FGrlC2+fc=;
        b=GNs+oMFL9WBs5SHg1Jn/E3UWifROQyOe40NLvSthQjMU4G7cq/8ajIquarzAxVCnLA
         8o/n2TeJP4gIo44dnsY5I2ALcdDJt7KjoQItsPO4Ix16/obhq/2iqHH4qaT0I8B2hO81
         lpD+9h5GLA76/J8lVlHzW6vrTZPf89gvkCOGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748880416; x=1749485216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tsl+7wQGk9ZntFAe3/W4dFK7sUDLARFjk/FGrlC2+fc=;
        b=tamuAzkd9EEKexftXcNEimrtvd7OUY7VNsRM4Y9K1VxGdLs+GF/e0Gv2Ai2nrKc01o
         PN5oPgyzcQ7Ng8bDUR7bpCXBa5hCbhwbfWZyBYuwjKlBzv8oTpT13JsVnc4AVbPaRIFB
         Rzh3MnfyDR5q+ZSXA99eVs3JgRVwfhHgxqRC4cbP7cb1h+gDRJcOnXoNErRgO/ZoHOmG
         TyQYKK9cPcFN443g/BblEXVb9/8yHBsr2u81DFHlqTJsOqSjyA+D9PAoiAWWBocGlSB3
         Ao655rCVDFtgVEaxwSe7HUbhGKZeORmfsEHWr2d3P0amgTm668I/Wir7dilDH+wyiBQ3
         LxkQ==
X-Gm-Message-State: AOJu0Yy3ZR47dbz6MBeWYci2Yx9vvfeuLd4T/7EokYk7sLXwyQsIF1q+
	BOrAZj6EFBuyBF9r5oCJZagtwW08TLi9oV17QwDteFidy7Q7yUwoWDzTsU4BI5rJ3w==
X-Gm-Gg: ASbGncsHImgo3qmB6psxyE1hXOXaSNpb6/q2VD9s99mET63f4OuoYXHpU7mjGxf4aV9
	gfQ4qPeAe5fBXzZiDmEnqAqkgUiA9daxFN5igClC3eGlILMn4k7tHPtunaba7zo5iGOWp1Otosp
	7cQC5fN4rU9oAqY2F4cR27Zbdyz07tnXyeCLDH3z11nmP+o/qqFxHqyF5MszxXXKSTk+w1jqmsL
	LiYgZCtYySSZJu+wwaxRIwhD2BhnuiaHbfw70HhT6q3WoVb4YNWtXoGozSixp7nQtLyOX/mkQxW
	hAH/5BluFF5C5HOE/rVUcntch82Hy3qIEKIbVN1K12Ji85gA3QzSvRJHMeHh6J1rpZiOYCyJzdI
	VPS8w2B2UaRkbCKk68UcUp4MkzA==
X-Google-Smtp-Source: AGHT+IFxmyew38lXdFBjLeeHnHTb6UXZ5u/rUZYcQG2foqP1RSS/ATAS64OuLPvFoinn2xt7EIx0SQ==
X-Received: by 2002:a05:6512:3f26:b0:553:2a16:24fd with SMTP id 2adb3069b0e04-55343191677mr2358426e87.47.1748880415831;
        Mon, 02 Jun 2025 09:06:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533789ff59sm1685113e87.70.2025.06.02.09.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:06:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 16:06:47 +0000
Subject: [PATCH v3 4/5] media: uvcvideo: Split uvc_stop_streaming()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-fop-v3-4-a99e18f65640@chromium.org>
References: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
In-Reply-To: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

uvc_stop_streaming() is used for meta and video nodes. Split the function
in two to avoid confusion.

Use this opportunity to rename uvc_start_streaming() to
uvc_start_streaming_video(), as it is only called by the video nodes.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 8f9737ac729546683ca48f5e71ce3dfacbae2926..3f357c2d48cfd258c26f0342007d1d12f1e01007 100644
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
@@ -203,15 +211,15 @@ static const struct vb2_ops uvc_queue_qops = {
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
+	.stop_streaming = uvc_stop_streaming_meta,
 };
 
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)

-- 
2.49.0.1266.g31b7d2e469-goog


