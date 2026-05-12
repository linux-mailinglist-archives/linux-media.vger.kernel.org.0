Return-Path: <linux-media+bounces-61250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gImEHEcfA2r10gEAu9opvQ
	(envelope-from <linux-media+bounces-61250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:38:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C719E5204C3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B755630BF0D3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC294E379B;
	Tue, 12 May 2026 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f5FTEE9e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8954B38D405
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589082; cv=none; b=mzn9XQWvj9t2SkgBnMf40BFwM8AO/6zXQDDorqJphza92Q89UH4TlsChY0RuHzN86g+nbrIJOGd6jEdwjf1WG/boqxoNILwG/ochDf2Yq+xF8obVvnawQKtikJui51twfiv9f44bkuJ4kq3g1pC2cC/xRi263qUxXuRks2FU5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589082; c=relaxed/simple;
	bh=l9FXCUw60GnCzKXcX5xUJTqEOuVJb0iD37iZBXVS9hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8Ut5+KODWDQwmk/Vh6BZqkMuluIm2yvi6Yy5k0FCm/IsFrdhL4YDLmlFL1algyFd2fbcE7N1+TYynlnvQhWMEWdsGlOYZcEKBJ4a/a20fdEONqVH732I7k3ra3oLLYb8YW1Nq7j3S5Xov4fyg/Ub0di9pGGkhklZQ7nJ+9lT+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f5FTEE9e; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so5499552e87.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778589071; x=1779193871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVh1akv6yDpLSRpVscSXtSxbkx56kM04oh1jXo8Wj6c=;
        b=f5FTEE9eR5usAZ/1GdkR9MRdOtbmKiWX5tDuG8PEoyNs9BEC+ckQwsHUB47mFz31jm
         0/lGwMusjf5Z99P4j+Incx92+pASr4Y6xJ1oSZrPya+ZnoK9h8iQ3lwj2oe8R/y4LS5h
         7piZHCsCwOEjqhP/TQVmNGZ55SHM+3/yhOp+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589071; x=1779193871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GVh1akv6yDpLSRpVscSXtSxbkx56kM04oh1jXo8Wj6c=;
        b=UMFR8V8twDRBizZbyxtdRMUvgb+U36TAuDiexFXrbdgYtL3jjUF13SexSyJK9kej2Z
         SULK6FcWZ0V1ls8RsPVnnVUIWZBe6BreU0x13LXT1SBDOy4ReBIGbNtkhTJYLNQ1foCe
         Km0dwoEg1vlkF0EZJC1x9GXc7wO1KkKd0FDeeu/NUzDZKiaN9EuVUBCXro7Y3wWAsP+/
         cfs6dPijungYkNhcx+9AiVZgUW4kIFSBPykvc8/TPTTxcR/ygflPs5Dpi1PGv41n9BJ2
         d3wn9HQ6a8idB1YuCw1VEdM3dW/1nHdEvPy3dmF9MENw3kl/gcrAE+ohtPlZEKGSLgQp
         ktrA==
X-Forwarded-Encrypted: i=1; AFNElJ83m6rAytwIw/fk9y0dy7Tmoh3tEC+EwAasRYXP+RWOVOXhtBVpD6SSbPfKjDpMpUEmqE3TzYxuYxp0Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK0aPQvfFKn5bJErxlQcqxk3MVF0+6uGfkuKpW4Sqaw+fFmDr8
	bAjxcB3EToKhTb2lZY4Z7qJppaatZEUhW1OxOvKdgnPzgskWgMLhRYllfPNbD4sNi/doSLmyUHa
	eVWIXvJWOyKs=
X-Gm-Gg: Acq92OEqTHtzsJjbF5MSk28lMva8LNamAVwqL56xrCDrK+8+Rzx5sNSdVYoAgSyz0qH
	H0pmf+gVe9fStD/gIjZconNU/kauypnWDNVU3WfGrdUdtPOJu0WasHJs/62Q4I1NUoK7gkLZnI9
	zBskiB7GreSYpSuWSIY8skDBW1bk3pFW87x4t8XeXwWiMMrhUQWyGSOconRI3DIfU9JR8VFiGVi
	2S4gMESDdKgGXvIKM4F/c5uaRYWXWMz6Oe9/sdkfv+WrPNwJ0LHg9BVWaLss4Od89ikoA42rVSJ
	jm8vdC3AWD7/WBk0Zj/pX0u/I1gGRVOdmxtJ5DPZWrGuXQ5KjwrLVm44swtlPbL1T1ZYInAOjKp
	kg93pd2t/hpjYC9su6yFRa2Coo37dvO4T3+S/Oo814RdJ+bB/UOkVRLt8+oVwGfjptPNlKq7okj
	qt38bVaZL3LgYKD6RTTyqh+nP7a9QfBRgPvgXDQYJl5Yf8+1YMbQGGRz/qnZUxtFraR6DxaATaf
	w==
X-Received: by 2002:a05:6512:1050:b0:5a8:87eb:b118 with SMTP id 2adb3069b0e04-5a8e31e7903mr1154240e87.22.1778589070750;
        Tue, 12 May 2026 05:31:10 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm1861344e87.22.2026.05.12.05.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:31:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 May 2026 12:30:59 +0000
Subject: [PATCH v2 5/5] media: uvcvideo: clock: Do not run expensive code
 if not needed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-uvc-hwtimestamp-v2-5-3c2905c733bb@chromium.org>
References: <20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org>
In-Reply-To: <20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: C719E5204C3
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
	TAGGED_FROM(0.00)[bounces-61250-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:mid,chromium.org:dkim,ideasonboard.com:email]
X-Rspamd-Action: no action

We only save relevant samples into the circular buffer.

If the data is very similar to the previous one, exit early.

If the data is not going to be added, do not calculate the wall time.

Suggested-by: Hans de Goede <hansg@kernel.org>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 20 ++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h  |  3 ++-
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 8d0fd7003c62..ea8a76f57963 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -524,7 +524,7 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
 
 	spin_lock_irqsave(&clock->lock, flags);
 
-	if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
+	if (clock->count > 0 && clock->last_sof_processed > sample->dev_sof) {
 		/*
 		 * Remove data from the circular buffer that is older than the
 		 * last SOF overflow. We only support one SOF overflow per
@@ -606,6 +606,12 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
 	sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
 
+	/* If the sample sof is very similar to the previous one quit early. */
+	if (stream->clock.last_sof_raw == sample.dev_sof)
+		return;
+
+	stream->clock.last_sof_raw = sample.dev_sof;
+
 	/*
 	 * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
 	 * standard states that it "must be captured when the first video data
@@ -644,8 +650,6 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
 		sample.dev_sof = sample.host_sof;
 
-	sample.host_time = uvc_video_get_time();
-
 	/*
 	 * The UVC specification allows device implementations that can't obtain
 	 * the USB frame number to keep their own frame counters as long as they
@@ -682,19 +686,23 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	 * all the data packets of the same frame contains the same SOF. In that
 	 * case only the first one will match the host_sof.
 	 */
-	if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
+	if (sof_diff(sample.dev_sof, stream->clock.last_sof_processed) <=
 	    (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
 		return;
 
+	/* This is expensive, only do it if needed */
+	sample.host_time = uvc_video_get_time();
+
 	uvc_video_clock_add_sample(&stream->clock, &sample);
-	stream->clock.last_sof = sample.dev_sof;
+	stream->clock.last_sof_processed = sample.dev_sof;
 }
 
 static void uvc_video_clock_reset(struct uvc_clock *clock)
 {
 	clock->head = 0;
 	clock->count = 0;
-	clock->last_sof = -1;
+	clock->last_sof_processed = -1;
+	clock->last_sof_raw = -1;
 	clock->last_sof_overflow = -1;
 	clock->sof_offset = -1;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 0a0c01b2420f..7b8477e5a0ba 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -522,7 +522,8 @@ struct uvc_streaming {
 		unsigned int size;
 		unsigned int last_sof_overflow;
 
-		u16 last_sof;
+		u16 last_sof_processed;
+		u16 last_sof_raw;
 		u16 sof_offset;
 
 		u8 last_scr[6];

-- 
2.54.0.563.g4f69b47b94-goog


