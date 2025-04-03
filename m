Return-Path: <linux-media+bounces-29355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE5CA7B176
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 23:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA94D189FEEE
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 21:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC5E1FAC3D;
	Thu,  3 Apr 2025 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IY88jJEV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C761F12E7
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 21:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715891; cv=none; b=iTwPf/jIUUzAoNG1f+IYtsNxVTlsKaXHOf36VdPXAFvDSMh4dbqrqkELkR7YP4/w85wlSrN1lT86TIIZHPFFKhn2S4mvVTJOvI0sEMp+HihFD2knM86XEJ2G+Sx8csI97E+wdZ/Z6V7dPhIeq7mCzahnDYpZW5UOG7Pc3F4ZPmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715891; c=relaxed/simple;
	bh=LA7uZ6q3Sc7Jg4Eh7U3qdrnVOUP1fZHPRdVwZ90iFbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEBtMtQvV0kBHcP6RBdkUwaKy2tjHNwNBkH1kfcykpxTcObRIZ2CR0aqjpRamhMGVz7b9zhbQjUNKiBMkPGe0iYYWYdm9/AUj0SjSgS+XpoNw1tjHmikNu73uN1YVMciWfeJPmgCPfWzLGllDiQk75L5xhP0BsbvgYKAdorSg+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IY88jJEV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54963160818so1629335e87.2
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 14:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743715887; x=1744320687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptSauccsQCiihyTIqD40ILfoZlJ+Jkp9zzyDCujSkmg=;
        b=IY88jJEVVcMjS16BXc3JYSWqvTVkuMJ+eFVoAN4MqvNa+xgT2sgjUDRNTgK0xshgoU
         FfrvmPsg85f2/8n5co6bplEwQEwhecB42avY4tNTT8uDyv+U7+n6HFNWUj9iUEstvwUz
         Qa2ZelX3TlDAeYAkX3O2pFxyz78PDFY+lZHiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743715887; x=1744320687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptSauccsQCiihyTIqD40ILfoZlJ+Jkp9zzyDCujSkmg=;
        b=ndEaAYrTV0aIg/0xlr7W0+tck9YuNE/DZtVGjVKEQUTuBqtFPejeG1AYvaD6b0V8iG
         +klfmcaeeyuC/ZQQ2oJfSH3LWg0I40KQRBkAgpuiw9uXLSfDx+Di7/1cDyl7BaMW4iFC
         Yijrf+rD8/cAOIRc5dc6aqkmjmBvvpszkOkGb8BMd49s9TQwkrsXQ4rp9CeOv+YL/p1e
         zwxzIblQOBy/h7wRN5L+EspeSXakiAm3VrJTpyZbEc3YR3CEX0DJwsAxDh3KwCwPe58s
         pJsqrMjyfQygPgz7U1orKAiiqhzyW6KjOtruLiuotaRBhqQDxkytkjfPrG976KWQLx6I
         S10Q==
X-Gm-Message-State: AOJu0Yw5ikRd6TbmhxOIo+/+zmOeoNckQ1A40jVdmZbVK7QOly9hcPRz
	udy2TpNPHe6JhpR67TCAUgX1HW4z49D7mJixNDgTMa2SdmMfbCFSCK7vg68kog==
X-Gm-Gg: ASbGncvrTCwqFSXwDU2MwLqv/AvA+rfeVnJY7jLP5YGCQpy/vB+CJEVDEZaXGugKsRL
	mldEDgoFI1ftsRZZ7bPEJNMvxXBXE9knVdGnAxtUNeJHHs/D4MKac9ZvY97Pav6KKFPM/UVfamx
	AdRcwmd+dryeQDcOJ8KOpPJuhUleImaz7+8HVixu+Py7pahaJpMl/b+dIm1WkoIPTFsrLMX3YbV
	mu/SV7LfRvOL7nOTvVKv8FhLQJoKCgHKKUfqudTbYB/rIkdCi5/6jihL662E+Or4TPKZtzlAgoc
	7ZxcnQ1E262YYeeuJZzOHhcPEkXTnPWkYUruiqOjF1U7SXw1bXvY9qQXocpLsPP+ciPXGDXI5nZ
	WnMZp2Cp4jOQs7dfRFHc4+pVx
X-Google-Smtp-Source: AGHT+IHIzqGAEc7RpQLkJ1WXd/DNbrh96pu+9FFacP/jNhgNPL2Z9Mg7lblGijukf30AT3j8gNlUNg==
X-Received: by 2002:a05:6512:1092:b0:540:2fd2:6c87 with SMTP id 2adb3069b0e04-54c232dc08emr59772e87.16.1743715887457;
        Thu, 03 Apr 2025 14:31:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6d5sm252938e87.181.2025.04.03.14.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:31:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 21:31:24 +0000
Subject: [PATCH v4 1/4] media: uvcvideo: Do not mark valid metadata as
 invalid
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-meta-v4-1-877aa6475975@chromium.org>
References: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
In-Reply-To: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

Currently, the driver performs a length check of the metadata buffer
before the actual metadata size is known and before the metadata is
decided to be copied. This results in valid metadata buffers being
incorrectly marked as invalid.

Move the length check to occur after the metadata size is determined and
is decided to be copied.

Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007c1f0a766f331e4e744359e95a863..b113297dac61f1b2eecd72c36ea61ef2c1e7d28a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1433,12 +1433,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	if (!meta_buf || length == 2)
 		return;
 
-	if (meta_buf->length - meta_buf->bytesused <
-	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
-		meta_buf->error = 1;
-		return;
-	}
-
 	has_pts = mem[1] & UVC_STREAM_PTS;
 	has_scr = mem[1] & UVC_STREAM_SCR;
 
@@ -1459,6 +1453,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 				  !memcmp(scr, stream->clock.last_scr, 6)))
 		return;
 
+	if (meta_buf->length - meta_buf->bytesused <
+	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
+		meta_buf->error = 1;
+		return;
+	}
+
 	meta = (struct uvc_meta_buf *)((u8 *)meta_buf->mem + meta_buf->bytesused);
 	local_irq_save(flags);
 	time = uvc_video_get_time();

-- 
2.49.0.504.g3bcea36a83-goog


