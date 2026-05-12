Return-Path: <linux-media+bounces-61248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LVTFwUfA2r10gEAu9opvQ
	(envelope-from <linux-media+bounces-61248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:37:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFC252048F
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 152323048DE6
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF980383C6E;
	Tue, 12 May 2026 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DWKZPVYu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B6E4C6F0D
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589078; cv=none; b=nkmahX3ZSsqg7AXSsW+KnK3B2DW01L5NzlWWDKhoDQdnifKfXvE/aHyTvQiV4o9vv0rGebo+XEFV3IAM7vYCEknLtztG8AYAHWs7hHwR7hXyl4KrsWM4zHsFwnvkAZ0DGWLlgv/OGuzPCBzYuoWrbjgscvcSt5WQP0J41dwjSUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589078; c=relaxed/simple;
	bh=PyPstSDPnSS7go2Eeoifto3b0yR6kerSh2wHnfrgQC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BleV3zgNX88cj5q0jWngMUPdoqw0FIoAh2SWp6qVN6ucEA7JSkOusNiUeNPq3QFTWfed4hpznr3vqjysO/DvbtLH0axTdbM+GHZkLyffHB/8I3XawcR/vq/2B1eEdS+R/9Eq2VFwus1v7vuHuCJoC+Hac2NrBDyJzegnwN/GMP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DWKZPVYu; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so5190454e87.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778589066; x=1779193866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tn8yR9axPkcG+PDvfr1W0s/qaLqZqhB6pcQAbzPTKls=;
        b=DWKZPVYuipI5YjoJWvErpuVrVH+RQ3HKWEZlL9o7QygdYY5/0lmuC2NIbFa0yUPuSg
         R9TdzCaeKAodbc5z8Z4KXXZ+OTkSCHNgjw45kLDh2ze19sH+vNmd4M7sY1+S1wUAI7vQ
         9diag2lx/ra+l5UoEApLcJP02XDCDhTzhzkDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589066; x=1779193866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tn8yR9axPkcG+PDvfr1W0s/qaLqZqhB6pcQAbzPTKls=;
        b=MDM7NSj0GkWMFv8KXE6DIBsDc2ENQwHYuna7jZWt/oo+pDce5Sko9UN6Hin4tx85aM
         0czeBWS1/AD68BbdIAhA7c37WIufF3rszrPR1TT7N7hYUYagnaFeAZSTOzWvxerqK6nH
         PXcVi5eyOmWqpfbPLOflT6e/X8jQLshI1Ah0ujtUQrPAhOeqOLwA4K3KLI+Rv0kGuLIh
         XEa6w5Ds5mwDJCHauY7VtnrMg1lYwm6xqfgRycFA7Z4+cWszmo0wJGg7AMWst2fhwgH2
         5piepgtzTESO7yUOs/X2/7z4I4zOi8s6HQMxSLOgUSVH0rLgsbpL+y2tcnw210C5PBAQ
         +knw==
X-Forwarded-Encrypted: i=1; AFNElJ9HD676Xfq/QkVfTLIlcj2jLTCvv++Lqv4uS+oRqF356srTAUiihV/tRsgT3UC/iulIgUsKeOe1+ZjWSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzenlL82m21x6286Y4Jc9CzxABzsrzto8DSBdrifcahhOTC6NNO
	U5o8aNBEl7S0frN+sWLt6mxHevzXWibdqTsk6aXZh3u/PkCy5qsazkQEJZvBpfcPSQ==
X-Gm-Gg: Acq92OGwJLbp/aifvk/z41aIwe60WvhDgeRYzLRWWGv+x/aj12Hex28gO7Drhwp6d2L
	u4Rz5khh0yrjRqW893Yk/WyNk6El80cXvqcTOak9VhgK3IkOgem6tbNunU8NZS/TKnrxQyLGZCP
	gPYl2uuTnLvo36MNyy/6kI1Fp33CXrhvP16R75lh5vyBNOaXK1uSKwxy5UgPHs9DOQVlII6ctRV
	o/AZtt6vMaKg6P0RBDmYjVvvZ2dvn2O4/tAHqGwCUL0CRAE6OB4nZ2xV8WcgbgSlJrYIM2PxpOv
	cO+g3d7L89Jmx63RARPNuZ5Hr6pHI7mQvXNiNAbMREgBDl+7whf50LEMABJIa75ZITECiXaydNJ
	ilZiOEhPU37v3HvSctp1avVaAKm5RUeanNb5EhAPeeO/fq61Jdmb+FgwVNy+RyVZDs/e6dGP+QL
	8V5tTEf7pE3rCo5Ldilijgk7Yktzpd9B7NqksnFSUSGRzn3k24b4g20rbWCNUMJDyL2DRTnX4YE
	w==
X-Received: by 2002:a05:6512:23aa:b0:5a8:9135:128a with SMTP id 2adb3069b0e04-5a891351b9bmr7594663e87.15.1778589065945;
        Tue, 12 May 2026 05:31:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm1861344e87.22.2026.05.12.05.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:31:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 May 2026 12:30:56 +0000
Subject: [PATCH v2 2/5] media: uvcvideo: Use hw timestaming if the clock
 buffer is full
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-uvc-hwtimestamp-v2-2-3c2905c733bb@chromium.org>
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
X-Rspamd-Queue-Id: AFFC252048F
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
	TAGGED_FROM(0.00)[bounces-61248-lists,linux-media=lfdr.de];
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
index cbf67c17a49a..19a2880e0dc9 100644
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


