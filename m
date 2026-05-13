Return-Path: <linux-media+bounces-61406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HMeNJRlBGpVIAIAu9opvQ
	(envelope-from <linux-media+bounces-61406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:50:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 328FC5328A7
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1508530E0FCB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0C24014AD;
	Wed, 13 May 2026 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XX0rtmSJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CBC3FF887
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672970; cv=none; b=D9WvBkMpk0drgsnP+X0e9MIvJ1OBmWLrZIfLAJBQkAXzH6l0t3C6JNDyTm59/E6NkZNc0oQUgtaZys3l0q5W87cUbe1rSTy6CERf4cV6+vaXWPg6HrtoYvlJj2LM1xKVjm3CiWyawhbDKv2Xm4w63dEiq+El/A+kWyNwatUiOoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672970; c=relaxed/simple;
	bh=BTavFQqvBL+LMmhch8FaEL/DUp0Dd0SD0+CSvzVTCiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LUcp6M/KKi1HkWMZGp7EBil1+Ih87vOwua3WQGTvKm3cnCuYBo2ObH4Dv2lXOJnUaitUc8Vjr7NgNLWjOUaSmQeagH1ma7SgPctFq2rms0oFC0CeLmEIHBDqHQ96ai3tn2BAt73KJqVn39NruMjevCZ6YBhW0Y0FEIZRtfVQO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XX0rtmSJ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39396f873adso81688721fa.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778672967; x=1779277767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeR0kpbZ0azLZa8HmN4tFEG0Uiamyb5RJeB0ZdUGKx4=;
        b=XX0rtmSJbCY6ljij8Ruck6wvvyiEjLF2v78CK6VwHKxcX92pjy6nl1pNWx7+RbRswO
         SH2nXVGIDJMFFSfMZSMtvy+BWnRc8qUAvMzrywEitA1IGS7AgHRL5IH0Tm/ppSR6kQvz
         TOLMyaQd6KXXmqX97F5y9y+uVSXgbeJ4xHK18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672967; x=1779277767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JeR0kpbZ0azLZa8HmN4tFEG0Uiamyb5RJeB0ZdUGKx4=;
        b=devhuph/EBIlHpvBIY2fusUduP327aeE8bDZJJkltZY4L+blr2lcwIp5m4kQp6rTfG
         6PnzHMu8j87gIJjMyLbRDWmeo1jYSexLhq7LoACJ67qqIEk9dMlQhhF2V5yhkQAUR4FM
         +dQyo1bHZ0bS0PS19su3zzAGZW/XCQZf/O53QvYpHSmMhcGWvylXVOw9jEjXxBzuKJhL
         9BjNyLTzz4pWzNl6rd5k1F/vHLlj2BBJd5GSoYGuOxFoGIEUsWop2IcF3VbjryVGIgjU
         AhLb1RHA1EW7CzKmSyfVCPq8gYiWsvpbep6mLVHIYBtN3C4UvkgShJUfJvYCqWvmcmVW
         TT7g==
X-Forwarded-Encrypted: i=1; AFNElJ85EuyixFiALORLEGBGQ1QJa8BzTV7o6DjYsYyc8n7Jl23ro0w/GFCT0aFOLVahXUZ8VW4AuGiXaW8Y8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwawB3/jfFWRbBUGrukEvTnbiyhJ4b5g4XQRnR9ALed6cm9hFhM
	S/ed515vef8vCQldqz+xDw68L5ePqtps28JiX0/M7BMfnEeOYwsCAidHpm5xu9wVbA==
X-Gm-Gg: Acq92OFTXT7OYxJwH/UOTqUzP+BapD6wOCDrFOf4NPslyqAtWRrhU7FCQo51iyL7V9c
	B/3DfveY8n2gp4wd8R+z9xrtxrc3wQqCq2ZiCRRii3DcjU/WCf4/SH7wg6i8z/exsIQPHopO/pe
	6L/LtKzJ7RtIBqjHep+VAXrRcaOo+3fsd3UE1WaMmYFcbRPWGT7H91fH2x1BxHzPH+gzA3UBfj/
	VNSmHN619ILSJTe+ZfIsSCjTUGU2LA0Zcc2ppYYtlZzYCzZ48r0FIZzCe7TVDWhbRKuL2nAL/8n
	sWhUqJE7LzKKl+xfsZGvMlDSu3FDVUxvBsRJmjfq4d7Ebpk5ZejpR+G2E7YZiMQDeMbd4vGCtB0
	5LZm33jjnDJJf4ECiWXSXNwVaT2BxLk9lLkbZJVLLP1YUhfT6D7+lD/jZqK/H1wDWXtCJwuXFpm
	8aDwjhys8kzX7FzKmJZtU0Yjyy88ykYy49BqWTT9uMVuEsouK0lvl3mHrGCs3prTeHx2g2mAk1p
	g==
X-Received: by 2002:a05:651c:553:b0:393:d776:bc89 with SMTP id 38308e7fff4ca-3944b584e57mr9347471fa.21.1778672967563;
        Wed, 13 May 2026 04:49:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db4f1sm40971071fa.27.2026.05.13.04.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:49:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 13 May 2026 11:49:21 +0000
Subject: [PATCH v3 2/6] media: uvcvideo: Use hw timestaming if the clock
 buffer is full
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-uvc-hwtimestamp-v3-2-7a64838b0b02@chromium.org>
References: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
In-Reply-To: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 328FC5328A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61406-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:mid,chromium.org:dkim]
X-Rspamd-Action: no action

In some situations, even with a full clock buffer, it does not contain
250msec of data. This results in the driver jumping back from software
to hardware timestapsing creating a nasty artifact in the video.

If the clock buffer is full, use it to calculate the timestamp instead
of defaulting to software stamps, the reduced accuracy is less visible
than jumping from one timestamping mechanism to the other.

Fixes: 6243c83be6ee8 ("media: uvcvideo: Allow hw clock updates with buffers not full")
Cc: stable@vger.kernel.org
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2ad36a1f4948..01dcb81d96fd 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -834,15 +834,22 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 		y2 += 2048 << 16;
 
 	/*
-	 * Have at least 1/4 of a second of timestamps before we
-	 * try to do any calculation. Otherwise we do not have enough
-	 * precision. This value was determined by running Android CTS
-	 * on different devices.
+	 * If the buffer is not full, we want to gather at least 1/4th of
+	 * timestamps before using HW timestamping. We do this to avoid jitter
+	 * on the initial frames.
+	 *
+	 * If the buffer is full we would use it regardless of how much data
+	 * it represents. This could be solved with an infinite big circular
+	 * buffer, but RAM is expensive these days, specially the infinitely
+	 * big.
+	 *
+	 * The value of 1/4th of a second was determined by running Android's
+	 * CTS on different devices.
 	 *
 	 * dev_sof runs at 1KHz, and we have a fixed point precision of
 	 * 16 bits.
 	 */
-	if ((y2 - y1) < ((1000 / 4) << 16))
+	if (clock->size != clock->count && (y2 - y1) < ((1000 / 4) << 16))
 		goto done;
 
 	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2

-- 
2.54.0.563.g4f69b47b94-goog


