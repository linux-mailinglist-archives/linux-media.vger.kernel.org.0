Return-Path: <linux-media+bounces-7674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 680D088781B
	for <lists+linux-media@lfdr.de>; Sat, 23 Mar 2024 11:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E7A31C20F34
	for <lists+linux-media@lfdr.de>; Sat, 23 Mar 2024 10:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E9F17731;
	Sat, 23 Mar 2024 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HVyLjloh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8410618EB2
	for <linux-media@vger.kernel.org>; Sat, 23 Mar 2024 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711190890; cv=none; b=kyxF9MWrUkXRpi2mFEABZ96cs5QiaM6Hh6XkE5iXIylrfHFz/nLaf5Oz7mtYJ8CiRgP/MeH2p5mMp1V+6IcBHkQ7kYCVts7SvCfq/lHnTH8tp14yok6D+7FaUEswRHkYQE3pRoVrDJo6HtPuWqaHU4xVY6pN/XjGyM08MdjAlSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711190890; c=relaxed/simple;
	bh=OG7cqgYYJHmKhCVqrEDvi6pknnHix48HG0gMtSmw6ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2kgdR1mJYz6CQgFaVSMWByTOtMqIi/I7MT38F3/pgo6yJq3k+snfkvMPm0lknFqbzz6v1+VoWHq7av5svxc/SsGTReqi+bl7nUsPYDwKvSRtzensJLA6emMUCpgIyGCnodJ6l4hIv7D6KryVCaj0j00t9rZMppwsElRf1rINAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HVyLjloh; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-430c4e67d40so20358171cf.3
        for <linux-media@vger.kernel.org>; Sat, 23 Mar 2024 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711190887; x=1711795687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5G2djWTL13MD8rXHjsRG2jZyEe2Cc3TE16Y80waKos=;
        b=HVyLjlohv+ScpexbtjpiuJvVNuVFz9MCsSLdi5rp+mlOigfCmYoRLwIv7zxEeUL1ZN
         IR2UIJ+g8k8K0t++tiwTiV+1Key+Sl0Olp38+AXzH6kVj4TDG4oABXNiS4troUX7qzYO
         FXRR6ZJA92tIfbmuNgFqCSR1PANDQlhfhGmDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711190887; x=1711795687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5G2djWTL13MD8rXHjsRG2jZyEe2Cc3TE16Y80waKos=;
        b=KCWIULgyJwXJ809+teHZD6tD6Di1YSocj2iCDsF/ExBzoIhSlfCIJaeZGgA2WPHcbB
         IhPDNNACiwVfFVQOGj0aZGKGYzfciOqRh+bBNuVGsuau3CyAu/yt7OdGtDWkGUDSX6I/
         nnnud96Ea/7ytkhMvW81CjuaCxin7vc/PZompH/Ma4MWbyDHRTHNcjoJyzMkMg9lQGaF
         Zad41Ba/eXFkTQcw3dqS3U3F96ZpqfDWkDEjBlgp7AkrLGrats7MhIN5Izsp7Kk4LPry
         PjubnDbLSOZRBKKpjI3Q5Ctow/1SfbOA6KQ/103RQ7CrWLNPLPjQbSQfAKxfkC7N6ZB7
         Tk0w==
X-Gm-Message-State: AOJu0YyYFQMFTIarytO1p+UMBGnEiyZp1iLIdD0D3wvccQJ/7VmK8ksC
	vsyX5IHLqvtcGHCijg7I3ysOV5dcLglLjcUJTlYFn0LLTYyiFGeR4jBv/pFc/A==
X-Google-Smtp-Source: AGHT+IGV2xVcEtXv3Naga9cPOdOtYZ8nDLab0HgjSx57Ri1fvIE7ouxRMvuK5HgknCnei4ExDcNLwQ==
X-Received: by 2002:a05:622a:1716:b0:431:33ec:be16 with SMTP id h22-20020a05622a171600b0043133ecbe16mr2085146qtk.51.1711190887472;
        Sat, 23 Mar 2024 03:48:07 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id gd14-20020a05622a5c0e00b0042f21fe66f7sm697213qtb.73.2024.03.23.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 03:48:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 23 Mar 2024 10:48:05 +0000
Subject: [PATCH v10 4/6] media: uvcvideo: Allow hw clock updates with
 buffers not full
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-resend-hwtimestamp-v10-4-b08e590d97c7@chromium.org>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
In-Reply-To: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.12.4

With UVC 1.5 we get as little as one clock sample per frame. Which means
that it takes 32 frames to move from the software timestamp to the
hardware timestamp method.

This results in abrupt changes in the timestamping after 32 frames (~1
second), resulting in noticeable artifacts when used for encoding.

With this patch we modify the update algorithm to work with whatever
amount of values are available.

Tested-by: HungNien Chen <hn.chen@sunplusit.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index d6ca383f643e3..af25b9f1b53fe 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -768,10 +768,10 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 
 	spin_lock_irqsave(&clock->lock, flags);
 
-	if (clock->count < clock->size)
+	if (clock->count < 2)
 		goto done;
 
-	first = &clock->samples[clock->head];
+	first = &clock->samples[(clock->head - clock->count + clock->size) % clock->size];
 	last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
 
 	/* First step, PTS to SOF conversion. */
@@ -786,6 +786,18 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 	if (y2 < y1)
 		y2 += 2048 << 16;
 
+	/*
+	 * Have at least 1/4 of a second of timestamps before we
+	 * try to do any calculation. Otherwise we do not have enough
+	 * precision. This value was determined by running Android CTS
+	 * on different devices.
+	 *
+	 * dev_sof runs at 1KHz, and we have a fixed point precision of
+	 * 16 bits.
+	 */
+	if ((y2 - y1) < ((1000 / 4) << 16))
+		goto done;
+
 	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
 	  - (u64)y2 * (u64)x1;
 	y = div_u64(y, x2 - x1);

-- 
2.44.0.396.g6e790dbe36-goog


