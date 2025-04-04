Return-Path: <linux-media+bounces-29370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 980F6A7B7DA
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 08:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3359A189B4AC
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 06:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC23418BC3D;
	Fri,  4 Apr 2025 06:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hZYMBiVr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5331624CE
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 06:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748662; cv=none; b=iDRSAsyvfH2LqSnA2R6lqkTJjqcakfmemN++m7AnL2mLnHZSkNLMInew7RzO6pX+s/sZhf5sDYY6WSjLEmxCe0lJ/XL2sZhoZKIcXUcjYcxPV9Lqses/w/pt0ZFgzbOQPMmYmZCBi/Mq6uMAaVpBTa2JtxcjsSR2o5I8/RAFV2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748662; c=relaxed/simple;
	bh=LA7uZ6q3Sc7Jg4Eh7U3qdrnVOUP1fZHPRdVwZ90iFbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYLbxJPMlX+JScEmhLH9WIXnheaDp8beaco7vb/P5ESoxKoqUY/sD7YKCQ6WwcxXCJF9dGtpy0IW9zlhaGJA8aapKxivjtesb386mLYddxe3MKCfavH9m1F7ouGaYxUUVD1rRXEAcc/FSg6gHsUiWPowY20Z77sJ7axi81iglEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hZYMBiVr; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54af20849adso1633128e87.1
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 23:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743748658; x=1744353458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptSauccsQCiihyTIqD40ILfoZlJ+Jkp9zzyDCujSkmg=;
        b=hZYMBiVrrwl2CFEk8rfiWYylTtD/p2JsPLOGY6mf6Q3UzPXvkOPtWIdwE/At620zTq
         fRM23lm5+R+RywGZn77dPzhbJJtAth1z+ef6DNYVmwPMCoaSgWZ6C7TX2AXYwtWrLoJy
         KDfabVhNO0ER34CsCT68BadegARW8jPrfy3UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748658; x=1744353458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptSauccsQCiihyTIqD40ILfoZlJ+Jkp9zzyDCujSkmg=;
        b=hbH8cI2tJklKiyqwcoD9xo4cU7CK3Gl+oWBt9f4+dke4j8L1DBLlA8vE2arNjxTsW3
         X5sbQ4Msqzbo+gCBQH3dsokACdH6pPUVdJvJiRs8aiybHpVyBuAoPibxYffavGV7+ltl
         jys10AuKeOwUMdjMC4/oOuw2GHZLVs3ztvvtvFbMR/WrdACPpdNTLrinV2Oc0Rz630FN
         h4TONCVnv6s5cFjnfpcZYH1klJyymlsSyXvHoaEYHzpXAKL5S62gp+phQ/rRq4F83L4W
         1qM7xt9UWwJ7WtmrHaGXbskvIzxo90SKm7GyTrYAeUVrnbNNYbNgK7s4IZWAKXlf1aXG
         Youw==
X-Gm-Message-State: AOJu0Yx8f9lu3XaUHBK1qh8X9HipPwRMuWSjR/DnwlSVedRr2QtF4rnk
	fxOwM1kwFQfVrlN4EyCXQM++AXsHn8F8YGR2IZzAPMw0B8vBJGkymzOySE+6bg==
X-Gm-Gg: ASbGncuFYT2Iaf164aXhKxpJDZfyaI9iK8j46wUYXvjhgrK1tRMWk4QLZF1S5ddF4+9
	/567Gzjxb1N7pzLvFJMMkoyQIiUjapCeoDeFTwHmdMsBy8+rVXkH28W9rdXTWcYXNg1xQEI1dnM
	8O28tb7C5maQAzCGQDfNjgaoHKRaI8Qbn9grP4PdPabwD4/iOQqFIU6EpNCHOae5nJRSYJvL90s
	rxKDJUIT6jWb53zWcQyU6EMIztDlYRKDkK7ZCYfUgP47bZfSMiyYZYgry2IZ0FHRalmZMyzNAI1
	NANkQ8aNy7ReyT5SX8e7g+uoM6ffMjzn6gUMHzZLHua6RXGt+RnBO8ZEXdGaTa/7TtblSZVPaHx
	56C/7N8Zux5mnfFhAZQhttQ9w
X-Google-Smtp-Source: AGHT+IFe0yc7cU3i1TuFDXhwgGxvVCCEnVSWjWSy8bq9xJ+B6v2LXYpgvddwkI0CUCf2TzgjhXvGGg==
X-Received: by 2002:a05:6512:1281:b0:545:a70:74c5 with SMTP id 2adb3069b0e04-54c225d560cmr612312e87.13.1743748658431;
        Thu, 03 Apr 2025 23:37:38 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672444sm338275e87.251.2025.04.03.23.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:37:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 04 Apr 2025 06:37:34 +0000
Subject: [PATCH v5 1/4] media: uvcvideo: Do not mark valid metadata as
 invalid
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-uvc-meta-v5-1-f79974fc2d20@chromium.org>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
In-Reply-To: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
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


