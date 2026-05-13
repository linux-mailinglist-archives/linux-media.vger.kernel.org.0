Return-Path: <linux-media+bounces-61410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HUpBJ9lBGpVIAIAu9opvQ
	(envelope-from <linux-media+bounces-61410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:50:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C36E5328B7
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C9B430B4650
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2BB407582;
	Wed, 13 May 2026 11:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BOlT5w6F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A623402442
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672976; cv=none; b=mVlomEddIp2HiQyKbFzQRBdvfV+krJF6CwVQsYiqJthywEEWWNwGr1S9ZG1zh5sdGJwSAXV7DYLdBynt7xgYkcsmLMFJuuOSuBSP33e2fEumE+0zV7m3fOG1Z+2R2e3mSV+QiQu6durPHSnEJ5wwstj5SfGlZ6dvRmsXMt58uIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672976; c=relaxed/simple;
	bh=0DsXZoaDfXXbjyCKAKWk/McSEvrCl4LqpnbtmOy08v0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTA/7LObpU3pmV4Ri5w7wotrMUBWN3nhWOz4a4gG1jpefByuolUrK10y11aDUdlwkazvemmVL51zB2PfPT0dkXtH8PZnfvng97V9QBv/gxwzyoiDqWoqRSp8evHLCdwIAIneGjoS0CJi589rswVu3mxU973SvwJVw9pneoCifEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BOlT5w6F; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-393925cb1baso68110131fa.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778672971; x=1779277771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pE3CdveYrFhi2NESD3mYXm+51E27T6CYjOU3ktIZuZU=;
        b=BOlT5w6FCqQX0keKD8rfDiWS+OvLTeh3AOsI9qDcBHzSZsy549hRZZe/oSO3yU37f+
         40wgtLafkv7Q/A+o+Xrj7s8pCZh2mJXKB3jCaJaXlWKpZZ6SV/9Kz4MqIxF8f4qzabQe
         /Dpu//BvE6qiHaz+g5E+hvCJ8XlGDyPz+O6/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672971; x=1779277771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pE3CdveYrFhi2NESD3mYXm+51E27T6CYjOU3ktIZuZU=;
        b=HcMiDiGMp1G3/ndBe3pqRthpTAjXsd3i5B58i8CFHkMEoIYg/fwEKQT6zL70p8azL6
         8oc8PSitP7ZvlIjQh10ZLGtrO73Cg0xWjDUpaujOCwiKgonTcz4mZEmad75JyUsgMZkw
         dEb/ZmObomjmShY83IKSKtgQNe6dEdra5Y5MdNRLQFkLLapDMRL1RJkaqcP1oh5FuuaV
         Dsiq3qp8JOrxJDr8jzUx1PN5dHuIQAa8KkXCMcRL5EjL8KLcUiekL8BrwUFDI/NW0KJQ
         NB0wCuwwbwnz7exvrhFsB4pLF/Q3V3sci50JF4NpZDZaXOHK9CaEfLcrzzZMKhuLFjlI
         b5qA==
X-Forwarded-Encrypted: i=1; AFNElJ8E56phzpaCbnAKbHxmIspq3hF03zasb8Z1LjJicHmDbzSDMfqikjJK6mP2dIhVFYMX8B6J6UDx7d3rSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIA2zKYr91LoSufYUlFvZMQaGhJcDfFJF26HMRcKFF1wDEtJa3
	gX4X9bvnC6QF8AQmeIyrS2DxYQB0uTrfoRTqMAuicyehPIp4Nez159VP9znWfPm+lAZD3bSWq8+
	RcZ5Yj7g8
X-Gm-Gg: Acq92OGdMwb2PqALalRC8tPOOHVF705q9FPi4y/kwddOUGSt1tbvqZ+YtHUwMB45SH8
	t7rLHMaTzelr1pByv/jIXPUWnN42DJ74PPEa6aUXuY8lSbk4FGb1fhBoYDKUEhU/0YehfxdHDa/
	RlcdARXLrF1svEhBGWB7BXaEh+gvWduPg5+QAhpzU59alwWN+TzYDYjyi70/IpUDuomNXaQuOf7
	+JSdC/vTqlcscjV4UYUU65WB2syy6wcXCjB5iiHH9AiUKRle5wmwJW+Tt44tWz3u2gBRy5dGN1B
	wESzHjCY8WDt07b7lyFmZo33B9g2S3xQwsC0wV5nDo/TVrSeaQiAEOLELVEHkQRDngAx57JNUwU
	RJiJM4bYbTq2O9QZMydqVbV6VXgRwDfSg4g/1BnZdItRRpi1rBcrcF+R1DUscqwGJcfpmoho2pZ
	Ze1ErkFLd6ga7YeydilyW9KfpBwLqr5ov9hb2UhROCCkXt5C90brYrr/DUS1NeMWPKsyH26Sz1E
	Q==
X-Received: by 2002:a2e:bd13:0:b0:38a:45d6:c246 with SMTP id 38308e7fff4ca-3944e709c0dmr9086591fa.8.1778672971574;
        Wed, 13 May 2026 04:49:31 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db4f1sm40971071fa.27.2026.05.13.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:49:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 13 May 2026 11:49:25 +0000
Subject: [PATCH v3 6/6] media: uvcvideo: Only do uvc_video_get_time() if
 needed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-uvc-hwtimestamp-v3-6-7a64838b0b02@chromium.org>
References: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
In-Reply-To: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 7C36E5328B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61410-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,chromium.org:mid,chromium.org:dkim]
X-Rspamd-Action: no action

There is no need to calculate the current time if the sample is going to
be filtered.

Move the assignment close to uvc_video_clock_add_sample().

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 6794031cd0fb..1cc86a18b2bb 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -645,8 +645,6 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
 		sample.dev_sof = sample.host_sof;
 
-	sample.host_time = uvc_video_get_time();
-
 	/*
 	 * The UVC specification allows device implementations that can't obtain
 	 * the USB frame number to keep their own frame counters as long as they
@@ -687,6 +685,9 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	    (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
 		return;
 
+	/* This is expensive, only do it if the sample will be added. */
+	sample.host_time = uvc_video_get_time();
+
 	uvc_video_clock_add_sample(&stream->clock, &sample);
 	stream->clock.last_sof_processed = sample.dev_sof;
 }

-- 
2.54.0.563.g4f69b47b94-goog


