Return-Path: <linux-media+bounces-61247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNQqOPweA2r10gEAu9opvQ
	(envelope-from <linux-media+bounces-61247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:37:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CF8520487
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F166309C38E
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9F93ACA6A;
	Tue, 12 May 2026 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eKgZh4P7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBDB388886
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589076; cv=none; b=SutQiPYaJH4+JvNW/YAfzhry1XOvPU0H5FNWuPu3KFKx7gxUuC17FAFQdD0hctSY1kiNVWwbBLqaF8iGF2uUrMwue9Su7dn4mmLa718J4ol2Yn6dBytrWyDvqQHACMqSqQzAsxGWjgc2CISHo/98Tl0Z3CrPOCelUxtoATmdx10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589076; c=relaxed/simple;
	bh=Da2xgNXyPA++qo4a3AVVh/CrbIYpXjUjeW3H+9Mq4SY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eqbjsm2dKupwicuc/ZU7MHsOg/TfxXJ4RCHhP0cscm1ws+hGk+e38Vlvva1N5/gp2T/AOk9BlUY7YzcQJB4MewAA25KT7giXfYV4Q+c3Lq5Y83rx7shhFg3/ELYtp2LfCDFdsgHCmACZlwugL5wrrSiVjmjQ0wIbhbEu6HzHeSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eKgZh4P7; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a865d1547aso5852908e87.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778589069; x=1779193869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cY1eLcRD4F4XK6/iq2cI2ENR4Yo5ocParDIUGJvyGEM=;
        b=eKgZh4P7Z+MDhnHyvFEO4ehSw6xxQlbOpOUNc/YWGaYdm4oAj4j315jKtL89LQ2Kw5
         kywprRPerNBpR2oFX6RjDSX3pNmdOHEdQiytXWvX8X3dFCQo/5VG6L/iKqbGXsi6emKD
         LbwXw4gA9EMV6plh9vIRnPT50k6Dr1MLR5hnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589069; x=1779193869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cY1eLcRD4F4XK6/iq2cI2ENR4Yo5ocParDIUGJvyGEM=;
        b=sQ078H4G7YTY19OdMC967fk3e4vpSlTEAGF1xBsWXQp3uU0I6opaWABrSJswJqUMTI
         3IjsDRpC8gEimnuEcxYQTQrZXEDSpGPo0zD+nYKcJLJkLAWdn9OITuTWprG9jz/02QKr
         Cj51Th7Y34bMICiRh4pntdQk/504GoewIInPbfoGvAQvkIdthHX0RYc3kmHMTh+iqcwB
         mKIE3u9wFZ5nX9G1OWpRvg96ukilfx+rwd0DX+okU73RU9w7ZCROYozKgF7/Vrj0QN/N
         uyJcX/9xqG6waXnrC0N5tIaGcCYwXKfFjP6HR/tpz8ehEWIs5OxFI9EFEV3E1hvh1Dsc
         3h3A==
X-Forwarded-Encrypted: i=1; AFNElJ+dMCbZU886OL8FXUjXXmEeTEKBs/yIauOKvXZezVt882p7WD2nAUyftymbOUR51By4UWBLoPuftclw3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDSrusjZS3o1TZrN5e6U/FxbqSk9rWjWLthj3Vkcqgr+0PObIX
	lUhPqBabMWc5RVM7PNKB6Q0qE2Ld/Pb6pe04VhASJwCLiKD/fNFuQmP0bWa4lLYu3w==
X-Gm-Gg: Acq92OH+XBFBVBgaUi+VcXmweJO8l2Oe2UZpX8FZDbAL4OuxMO2Ws0m5W3xfuOdEzbu
	uhNyMdqTO/jNnYfSN9yIj5E46oUyRFRAT6MLc0yFGkY6hr/wLoUKGEKjcSO3KTTA8Ey22XMivbO
	MsPik0IJtHIYliaWYvmzkQTQQitPap/6C4REkhO8sck4dYMzDWcuX9HC1+5Fk/jsxur7t3+6Xps
	Sq2T1NY4dv5EZ3h6IzeaGU4yyQO9mmTEaMYfkpRnMc1pagyE+Rg3w+nWBz1GquvTmhoWceqsBGx
	mfFIciW32hXPQ5zwibfbXzaBL+9iSA7ckfhjZgGUDsKX6l7g/swIbU3pW7Y6OQs83n9/gtuaRga
	k7N4yDdsJszvcEf88bTnscJjOh8t6qYvvObvp9hskENtXzT8/712uO7VlnG0dO+EbG/mWljWwme
	mCUVccBQ1vaGjGJ7ALQR3uAth1s3LxlfQd/eMvCn5RHkqqsGN8uEiAK4DcLFTKnC+YafGDiUALx
	0UhCwc39abG
X-Received: by 2002:a05:6512:22d5:b0:5a8:e129:af6f with SMTP id 2adb3069b0e04-5a8e129b003mr931546e87.23.1778589068566;
        Tue, 12 May 2026 05:31:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm1861344e87.22.2026.05.12.05.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:31:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 May 2026 12:30:58 +0000
Subject: [PATCH v2 4/5] media: uvcvideo: Do not add clock samples with
 small sof delta
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-uvc-hwtimestamp-v2-4-3c2905c733bb@chromium.org>
References: <20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org>
In-Reply-To: <20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 38CF8520487
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
	TAGGED_FROM(0.00)[bounces-61247-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,chromium.org:email,chromium.org:mid,chromium.org:dkim]
X-Rspamd-Action: no action

Some UVC 1.1 cameras running in fast isochronous mode tend to spam the
USB host with a lot of empty packets. These packets contain clock
information and are added to the clock buffer but do not add any
accuracy to the calculation. In fact, it is quite the opposite, in our
calculations, only the first and the last timestamp is used, and we only
have 32 slots.

Ignore the samples that will produce less than MIN_HW_TIMESTAMP_DIFF
data.

Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
Cc: stable@vger.kernel.org
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 093186308eac..8d0fd7003c62 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -544,6 +544,19 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
 	spin_unlock_irqrestore(&clock->lock, flags);
 }
 
+static inline u16 sof_diff(u16 a, u16 b)
+{
+	u32 aux;
+
+	a &= 2047;
+	b &= 2047;
+	if (a >= b)
+		return a - b;
+
+	aux = a + 2048;
+	return (u16)(aux - b);
+}
+
 static void
 uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 		       const u8 *data, int len)
@@ -664,12 +677,13 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
 
 	/*
-	 * To limit the amount of data, drop SCRs with an SOF identical to the
+	 * To limit the amount of data, drop SCRs with an SOF similar to the
 	 * previous one. This filtering is also needed to support UVC 1.5, where
 	 * all the data packets of the same frame contains the same SOF. In that
 	 * case only the first one will match the host_sof.
 	 */
-	if (sample.dev_sof == stream->clock.last_sof)
+	if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
+	    (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
 		return;
 
 	uvc_video_clock_add_sample(&stream->clock, &sample);

-- 
2.54.0.563.g4f69b47b94-goog


