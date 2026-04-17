Return-Path: <linux-media+bounces-58955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2II1OHnD4WmjxwAAu9opvQ
	(envelope-from <linux-media+bounces-58955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:22:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7FD4170DF
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EB253087742
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 05:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E3035FF58;
	Fri, 17 Apr 2026 05:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ekUM1iDH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7CB29B77C
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 05:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403177; cv=none; b=HnGM3Y6WqnsNPhRFi9I6ZVT7+1SBQZg1NI9GFW1fln538mmP4tPf/32KQji9enM3ghiityyy6W+ZJhuj9s3yjm4gUDfNwj/yiohXiuFBfne6Kn49haErPpT63WdGzjrBnH7YUxfsTG1BbmtL5+av08gPH4hmSmYEuDSE79XaNTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403177; c=relaxed/simple;
	bh=oEKc14CxgGlFPI6nZw4cLU9QkdurpHxJ3qF/ddAOaMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J03QsmfaDvEhybIbBmQFRUb/dhNYEg0JzW+wLpkx89++dugkKWqqGLfhIAPElAsb2ThV60Jm2AoXPQw4SA+v0ugL4jYsXC2eXA85DP9enKC968pzyjJbsYE+GPP/G4DqU2k68hkmj24MzfI0+NRdhTptlKBueVciD4qfJz+FJvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ekUM1iDH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so247490e87.2
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 22:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776403174; x=1777007974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRxW6zYvrwllE5hoDyZbEZrBdGGfgn7hvku3QZyKhhs=;
        b=ekUM1iDHvQcJ3RZH2FvjEjnwuXNa5Wi63SQPPLCxessIk+2wnQiR4JuYkt7aI3OC73
         56VGkgSs7E6i2jI10b+pVN+XBxun899YtF2KCm7sCtbaIow0/zuJNhS9rNZ7kbOHx+T3
         cESaLP4zhqiIcKTT6uQRO3xl19qIulKW5bHnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776403174; x=1777007974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wRxW6zYvrwllE5hoDyZbEZrBdGGfgn7hvku3QZyKhhs=;
        b=mMKbuqI4Ff9/mfapPse5EyFbUlaQy98aeOwbZPfL4pqGHQEtAQaZS/keYWiBBnPnsq
         6bk+vheS2u02yiGs9vrWfa0m2Xqg6lhMs+Ddyv0p+Yd1uU0Qi9nuaaRQ6X30R0GuQ231
         r8rUpYUbr/WPpw0mEVF7MFo2kpJpWjEPfaQSIO5NSL9xLs39rPxkO6AP+kKK7WhhswLr
         +I4+Gc55I5+RCX/pk3mquglsN57S8DEAc7RIMhowoqDt34xZ9oq/fGtsvEOq4ExMe+ZP
         xusJQfscXLqVDfcLqlHSzjNnCCZu5kVzB5UjPuzCmWxkyI4BlR3sdRRyhfCnkb7XqoE8
         3MFA==
X-Gm-Message-State: AOJu0YzbDaGe4KAhQZl8Rjy+i3l3YkSe5J5owFel7Jc1rqr+ES5rQUJz
	iTe7kWAEWaa0eksSFxe2HUIDKvORUbgVXaCzhTNcb7q+3Ew461L18QaFhZQOzKuptg==
X-Gm-Gg: AeBDievYq1KCDi7TDbOzI4jdDocLyYTU3x/JC0DsyhzcvAlSR1GXT+WHAngbOc0Q5AN
	OKV78RZKBWg8SfKHgjYXDJxW5j5TwgUujbW2/lQyReAv84BtmWyOV8F6s5hY+VuQYb0whNQllyB
	1D+ht5nHxEAZwXgW71pSiGWoWS9hgDjomhL8jWExxa/291rUlRrjzUCftN6aTle6TftgJ/3HeGR
	L5nDJrRHqotn442zRHlbazk1KzlMkdHzcJS9xV6bC6hlM9Gjz9cEzQXiq1+gtwy9hQWOT68jiNa
	JRT7aaOr0imMEKGJ+RuPuz8SBIwgE6mBIdW4hdrenry4bNR5+sCOGJN+RyMoHwJ4Fde6KDBPXEt
	1mJKTNirDuZRjpPnVTwrRVmLX3pgez3l6T12RhyT+Gi7y1jaeyHF2LredxMPZUJg/JHSy4OaYSq
	eX5CtSw6wjgK9OF9iDIl3MoZPtu5BTJetOgwUTtjxM1urxDpS6S5O6kpBVnE4/BTqRX/o7EZYAJ
	1jea65yoCvaKYSfjQ==
X-Received: by 2002:a05:6512:3b91:b0:5a4:9a7:7e66 with SMTP id 2adb3069b0e04-5a4172faa04mr362429e87.45.1776403174365;
        Thu, 16 Apr 2026 22:19:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5035sm1293491fa.4.2026.04.16.22.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:19:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 17 Apr 2026 05:19:28 +0000
Subject: [PATCH v2 1/2] media: uvcvideo: Do not open code
 uvc_queue_get_current_buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-uvc-meta-partial-v2-1-31d274af7d2d@chromium.org>
References: <20260417-uvc-meta-partial-v2-0-31d274af7d2d@chromium.org>
In-Reply-To: <20260417-uvc-meta-partial-v2-0-31d274af7d2d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58955-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,chromium.org:email,chromium.org:dkim,chromium.org:mid]
X-Rspamd-Queue-Id: 7A7FD4170DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Do not re-implement uvc_queue_get_current_buffer() logic inside
uvc_video_complete(), just call the function.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 271c246a02ea..5d45c74c6041 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1704,7 +1704,6 @@ static void uvc_video_complete(struct urb *urb)
 	struct vb2_queue *vb2_qmeta = stream->meta.queue.vdev.queue;
 	struct uvc_buffer *buf = NULL;
 	struct uvc_buffer *buf_meta = NULL;
-	unsigned long flags;
 	int ret;
 
 	switch (urb->status) {
@@ -1730,13 +1729,8 @@ static void uvc_video_complete(struct urb *urb)
 
 	buf = uvc_queue_get_current_buffer(queue);
 
-	if (vb2_qmeta) {
-		spin_lock_irqsave(&qmeta->irqlock, flags);
-		if (!list_empty(&qmeta->irqqueue))
-			buf_meta = list_first_entry(&qmeta->irqqueue,
-						    struct uvc_buffer, queue);
-		spin_unlock_irqrestore(&qmeta->irqlock, flags);
-	}
+	if (vb2_qmeta)
+		buf_meta = uvc_queue_get_current_buffer(qmeta);
 
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;

-- 
2.54.0.rc1.513.gad8abe7a5a-goog


