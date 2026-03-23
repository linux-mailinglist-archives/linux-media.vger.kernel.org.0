Return-Path: <linux-media+bounces-56723-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCPSOfY9wWk9RwQAu9opvQ
	(envelope-from <linux-media+bounces-56723-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:19:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1C62F2B75
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E5D23063B4C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EE03AB27D;
	Mon, 23 Mar 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bA2XrGdr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7853A5E73
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271443; cv=none; b=WeBkcOexjTL9kWW+a/I5Z5+T9f9T1lPh18bzBB1ZMrqTi52+uUpNHzl+SqhaxuhIzD1WLhQhWK3SmhIaMdDeySRP2e98T7r7pvyn09wCoLOKIzaEeIorOVZUDuDLrFNLCophRtFUrTNieuDef/mBUoeBfCmawDSL0pU/wdBpklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271443; c=relaxed/simple;
	bh=+sjG9Y89xiTyAd2WtTGciLIS9T6N5GSrKMdc4XxAA04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5Uk+9+VbvA+AIu1cNXsMy08reuIUGZEXwWAmy/0kTYkruVaxj8yiDB3R/nX7zWlS9g5utsT8sPRtA17LQ9QAYVJCi8eMlXzLxWZULq0zoiwVG9qLXGVAghfX3nrSrUGwvRLsCVWW6O60PCrtLerEPl9FC4TKG5GAtx/AYdBWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bA2XrGdr; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a27a7f711eso73185e87.2
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 06:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774271441; x=1774876241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHX78l0IWaFY465sZIyem0S3+5Hdcjbh+Os+s15sjNo=;
        b=bA2XrGdrfDhmPW1AYucVq1zKukGlv+tLHJrTtpwiclAGIlPMd8r+blfM4Gb7drR5xB
         djgI+RQsCyANMam/LsDsAwVK3fSpPcmmD/ds9xJwa1NOGOp7QcwiYHZShpI4r/k/p7zA
         k6uAvqlz9WSSKGBKdeH/jDVr0OLqii36rkEJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271441; x=1774876241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OHX78l0IWaFY465sZIyem0S3+5Hdcjbh+Os+s15sjNo=;
        b=Kkwy5N8JqyG/Y0h9zZJulpmcRcCZq4Fs0JAigPwoFY9Ndh/3H/fXQKdiJ3E1dC36Nx
         JD48sgk/roU+wxK5ahd9TJF6TPL4QihMcg7AuC1x2y93pONDEVwnXrljZ/Kh5GcWF9mt
         zzyUReqGY9XsOJtyFClfNA236qeAVKJPo7pPtHqwykEDtl4aUKVYodhWzwLH+DmBg0U7
         yDaUihEh96iNeXPJXry1jo1vjB+2CKupZCeUiwMDmj6E9eXy+b3i5UfTsZx76yJ+nnwv
         1fVPliHbohSAVbg9oJdqI937N02fVRHzyOJbcndnOQF3x9CWWknx+xdrTcQOa7dtYbqX
         9qTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoU0FUvwJ9sF4oOnjtK8JjDFrTJgzeN6pw776lv2bBzoIxUVTv3fg8g/VVlLZcIPDlEgqtalS45cGTaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO3Fs2S8RRlnOvjuKHo9v/m/ReAHihu1lWdnaNpbGj20vpLbxy
	G4qwMevs6OHpBLqDAS++X5qK+Uv05DV4v0/gStmbN5IjnxFl6rsKA/u85bPfU4GQmQ==
X-Gm-Gg: ATEYQzwpOc5tUBecJOUtQ/rnVjdMwJFw800xxsKj6KSKYqCT/bUQm7mDjWzjTSBnhGG
	iEiSxwh703tD0I1Jyvkm4wYxZmt0cMueUyk2ZcWyjEZ+iEDSmdfB7A91ZEgQo8Aj/Sawpa5tb2f
	n10CKijtCPnCv2ir/fXmOW80LjriLvzP9R4y2nAUDk6XBC/fQ3Zl8N9UfRzpByiwLXgy4KT4rEj
	U0S2RpL3Ej69tEABo1/fsCu+kSpOrSav6QfWfJjsJJu8q9hbGeiQFzO42oI6f+hfAKZ3BCfk5wE
	UzNfLHpeuj340R1fkZeNHHba8SxT1nzZBLpRgoy5EQH0oD8GaYCDZA8XZPjw0kw/fvXJZBuOekc
	sAKAZ10xNsKuOAW6BJCbPcFfoT3QbcBdwLVL55JpQsuvM/TzwNyb3vSeGoSDlMuGKFXZ1NdbeZl
	Ykhq1Vm+M8DzQnoEtfpFtjD6W9LopyTIi33C0FFom4HMqCB91y9rUY9vSQpKT6KWMz8vMhEg2bi
	kNj8p7Re1UpXp8YAQ==
X-Received: by 2002:a05:6512:1294:b0:5a2:777f:8323 with SMTP id 2adb3069b0e04-5a285b3150cmr3866798e87.18.1774271440713;
        Mon, 23 Mar 2026 06:10:40 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e07sm2515904e87.66.2026.03.23.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:10:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Mar 2026 13:10:30 +0000
Subject: [PATCH 3/4] media: uvcvideo: Relax the constrains for
 interpolating the hw clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-uvc-hwtimestamp-v1-3-aa42e3865204@chromium.org>
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
In-Reply-To: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56723-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: 6F1C62F2B75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In the initial version we set the min value to 250msec. Looks like
100msec can also provide a good value.

Now that we are at it, refactor a bit the code to make it cleaner.

Fixes: 6243c83be6ee8 ("media: uvcvideo: Allow hw clock updates with buffers not full")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index c7ebedb3450f..dcbc0941ffe6 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -494,6 +494,13 @@ static int uvc_commit_video(struct uvc_streaming *stream,
  * Clocks and timestamps
  */
 
+/*
+ * The accuracy of the hardware timestamping depends on having enough data to
+ * interpolate between the different clock domains. This value is sof cycles,
+ * this is, milliseconds.
+ */
+#define MIN_HW_TIMESTAMP_DIFF 100
+
 static inline ktime_t uvc_video_get_time(void)
 {
 	if (uvc_clock_param == CLOCK_MONOTONIC)
@@ -834,15 +841,12 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 		y2 += 2048 << 16;
 
 	/*
-	 * Have at least 1/4 of a second of timestamps before we
-	 * try to do any calculation. Otherwise we do not have enough
-	 * precision. This value was determined by running Android CTS
-	 * on different devices.
+	 * Check that we have enough data to do the interpolation.
 	 *
-	 * dev_sof runs at 1KHz, and we have a fixed point precision of
-	 * 16 bits.
+	 * y1 and y2 are dev_sof with a fixed point precision of 16 bits.
 	 */
-	if (clock->size != clock->count && (y2 - y1) < ((1000 / 4) << 16))
+	if (clock->size != clock->count &&
+	    (y2 - y1) < (MIN_HW_TIMESTAMP_DIFF << 16))
 		goto done;
 
 	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2

-- 
2.53.0.959.g497ff81fa9-goog


