Return-Path: <linux-media+bounces-37039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E4AFBACA
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 20:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797681AA801E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 18:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8906C272E42;
	Mon,  7 Jul 2025 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ReLbL6Ef"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EA2270EB0
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751913247; cv=none; b=FFYnN8F/9meMjT0vRk1ZXbD1veh0i5bVSrhg28iMCuKAEIPOJR4aDV67SmU8vsQCbWP2WiMiVThb7v7ypK4qZX2K0kT532C6Ut+SvS/uI+4HmBSiKBBo7bgOgezOU5rn34m+h0JjYIJWgN30AQC/sOW6SqbB3FnVlcp2TEzl0Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751913247; c=relaxed/simple;
	bh=RVxAqarkuhEy/QD/KmC40z7AIVmkZCTNthOhmweLPWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SG6FxGYaER4K2eWgbrKeKypt32flfixHdWborcmJGm4KbVFm2tG7icKozPTjMTLrx1k4mtdhbBf+fW+Fs+dNjRROmlHKIalx/qVWRtboA/g0mcO7gVyrLLkMNSoLoGq1b303tnygECFrFfxjGB1YKw2IYCVPXC/IweBipMUQSTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ReLbL6Ef; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b561a861fso29773891fa.0
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 11:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751913243; x=1752518043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEhoouKujX/9FWBm8EBjOLs/wPi+sCT2bfLGhUx3n5Y=;
        b=ReLbL6EfWBuUhA6aT/giSyaRRxVPOU+NwkQNz2WXqa+b0ldRYnDjtEz2ntC6s5O315
         fDt2+rmZR/OqpyNW3K4IA3JbgBnJOJXek4WEzrFwewdtJ9OUFT+ZvJeGVpRWzeAos1Jb
         oX5JhiKOlIv2I222P4u94m2/5ErN5h57U0skU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751913243; x=1752518043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEhoouKujX/9FWBm8EBjOLs/wPi+sCT2bfLGhUx3n5Y=;
        b=etHdwdsJZHJMC7ErGo+eviOkKiUOI+8SV1vywX4JsmiwxSlDGoexKgmC7PhVoEhmfY
         XijXQ1pfeARat3AA23T3cfkjR/jeaZAnQ7OPRrv92J0686jNrxuawwcrEt9XDgF5C98g
         Hq9QxJgJQVJmvsTqyBi8j88cJGrnneGOPb4s+5iiN6PilYZpAe6e0uJF2IYQez86++5K
         fkdCTtVnmsd/0jqvIDFjgVm4UXe8EAFTNaZiZfI+tiIBRWjbeFJ+ohYyXuaKw9Wm2eYP
         WsCe/1c6odrK8eJe4BupV2R1en8A7nt9up/z0zhyHpzu5ZFoQ5kUfSMMp2KjYQTwMTWi
         FX/A==
X-Gm-Message-State: AOJu0YwkzmpDfYxOiWSHF/vF3Z/DUiNLUS9odvk1AiWYPzkK31lBSq6I
	qbHvjV1ef4NL/F2hb3IjV20nk78TnOzHJzw7+lGrdLV4hEbIOHRCuNekb4NctINkWA==
X-Gm-Gg: ASbGncvk0MwvdOy3RDLuBIxVjwlMWm3RiP9v0w8+pdc8v4+8q1fxEa+QI0gtqeZKcqq
	6Sn0Qc9ih4qgquxcQAAzNiGLV8ciwhbW4B5aramrayItT3DeToNdJ6gjqyaJ8aQ4uWhueDnk1QI
	Epse9pjaSe9J8HMBfPUEYsJr8QVUJJHBc/0ejmr7ga5h4TceanYu6pU4GmiAu4PnU0B6f/auaWG
	W0z6NIq7VMw49W+x5dvKOfZzK3pzXWzcB10hdjjvd/+PQvcsUIo5V030VYXSLQhEwKI3uJJMZoL
	pMHtPZBk0rnrfI9D5MjZgguiYtis9kDAzfC1r4ibNYOZbGe9URuV2qumT1W9eBUis9ktIQ8jcR6
	D/AH3kU9bFsnM/jU0Z5Fca0sBMHtEkm/ib2jD84V0Ww==
X-Google-Smtp-Source: AGHT+IGKJuOX4Bg7R899m2AwcOsJNjoMYlKG41sbEd23b05icnKCcd071bRXekr5xYL9YnWZKX+jcw==
X-Received: by 2002:a05:6512:3c94:b0:553:aa32:4106 with SMTP id 2adb3069b0e04-557e5556e89mr2272305e87.23.1751913242985;
        Mon, 07 Jul 2025 11:34:02 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d31a6sm1417630e87.61.2025.07.07.11.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 11:34:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 07 Jul 2025 18:34:01 +0000
Subject: [PATCH v8 1/5] media: uvcvideo: Do not mark valid metadata as
 invalid
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-uvc-meta-v8-1-ed17f8b1218b@chromium.org>
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
In-Reply-To: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

Currently, the driver performs a length check of the metadata buffer
before the actual metadata size is known and before the metadata is
decided to be copied. This results in valid metadata buffers being
incorrectly marked as invalid.

Move the length check to occur after the metadata size is determined and
is decided to be copied.

Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 11769a1832d2ba9b3f9a50bcb10b0c4cdff71f09..2e377e7b9e81599aca19b800a171cc16a09c1e8a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1442,12 +1442,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
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
 
@@ -1468,6 +1462,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
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
2.50.0.727.gbf7dc18ff4-goog


