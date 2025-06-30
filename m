Return-Path: <linux-media+bounces-36308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FFFAEE07D
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39C7A3AE23A
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867C828CF70;
	Mon, 30 Jun 2025 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jtE9OauB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAF228C030
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293232; cv=none; b=uFQ+3KIXMiaPCvrW+Hn0YV1vsfitlWipltFOFoxHCKwM61uHRt9139sH06bHTinlObZo/DcWnE2OUARaGvkiHaLH8UyiGgmTZepnPpraV+J0xROoRhBIg/qpzx7Uua1UlOHNQDDpAoPuk7YiB4Tmj+cjgF4zdafp7d2KWTVKE28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293232; c=relaxed/simple;
	bh=jhmtrOZynF97yPTl8KLNDy4e5vqCIcVcQhtc4QKka7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UoqH70aTJfg0ieC/hG+HLhuqOrwdlGvgbV6ReHUr1Wl8yxBgEmxQun3Yl75+M/u4TrdXYch+3pW7GYNAjOt2HAtArCNS6gDDnSZymWcbAUgKLFDiGJ9UVoHsmVTstNht1A+3vORpHC7Okb7+GugkKAnEJyu1GIuFGFC0s49g9x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jtE9OauB; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-555024588b0so4203836e87.3
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293229; x=1751898029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sXxnutuQNshAuN25MG1B9YNe5116VtrTWttVb+J9U0=;
        b=jtE9OauB0MsEkovMpZdAzt/njk0VSQjSeIPPTh30gkuTnExrcG+5QgXT0lGX7u8TjB
         49EBlpSI5p3QvLZAf2tSrYDLUoqz4mAeAQ4dRh/xstnlVxmJS4d9nIGhZ7k8Q7vh+Bq4
         AfO2DaJVIBdEz39Sv9Y2AgiZy3ngh+m9KZW48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293229; x=1751898029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sXxnutuQNshAuN25MG1B9YNe5116VtrTWttVb+J9U0=;
        b=C+ECFzymab1zWy9AXrS4j7mo7n4VAy6ZYdoQQgEjBiqwkEeBbesVWZzAnei3SDuApM
         zmxH7fGIxVEA0Bs3F17a/ohhtLjXBT692x81Tb+pzV+7JYmdY6FjVqhXdxom7U7eaS2R
         0U+4/2TJfvNzj36xJTWtDTbB3mjIZxiBpL+bZfZGbxgG1+nrmjoR+MTGwCZ6HJcijMEG
         LyTLTm5Ym4b9V0y1xsVtR8R3Q1w0t6YbECaOYMm6Cpoms5WXnX2RPiE6emML3l5oHoX6
         R3P0kgty/QRRHqWNRtfSiLW+aaoSQuNE0o56jhbMjZDQVbbGT/kPmZ5NY2vYym0F+TQm
         ncgA==
X-Gm-Message-State: AOJu0Yw/CyJjG6JkDwD0SJvAz/Oq66MfVfq4hxXiwBYHi1zKnagfmmWb
	MouXdsflXg51+da7jXeNuaVKrFu1Dn73ky404NYvepgkxDYrPIdpUixBVHtnPItP/A==
X-Gm-Gg: ASbGnctaiEyRYemVNb+bbUgrIiL3kwY4PWczs9JtBcobpco5rL04X3N0wGB7NvOfbIk
	0MAA17J6I/doo8U7Y2uA+LnOSytg/a5zRiY/EtH0wr8LKfXw7W7u+Pax7/eeCyMMoVAdqtDpS/d
	sAJrYBlzSIILXgiq7RyHJRA92T/eqa8gdX0tdSOFuVTu93PZ3Yksg0ze3QpjgeeBjOl9THNYn1y
	UTAOOHYHSP46Aibamg0gMdfTKsVBChK32D1T2EboS5PHy82kQ8P0wIQ815m9lvIat+tvw4q4x6H
	fwoJO1oe5R2QDqpOhpejGGdPgdkr+lSEhlHvEovmuNE7Is2ifEpyoPUiU40aiH1TpTaCK0wYtf8
	Obvm99k7osAOO4i+7iqcNolrUoYrkJN0WTBre/vsT5A==
X-Google-Smtp-Source: AGHT+IHbcAPXvePe30HSj85z7toWQIzqZIuNPLHXcAnug7hR/AjGTbBMUa+1SidzHEMD1ZaaRXRakA==
X-Received: by 2002:ac2:4c55:0:b0:553:2cfe:9f1f with SMTP id 2adb3069b0e04-5550b7e9dcbmr5357754e87.6.1751293229195;
        Mon, 30 Jun 2025 07:20:29 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 14:20:28 +0000
Subject: [PATCH v3 3/8] media: uvcvideo: Split uvc_stop_streaming()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-uvc-grannular-invert-v3-3-abd5cb5c45b7@chromium.org>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
In-Reply-To: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
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


