Return-Path: <linux-media+bounces-56724-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMAMAWo+wWk9RwQAu9opvQ
	(envelope-from <linux-media+bounces-56724-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:21:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1F2F2C8D
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A9013076ACE
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12FA3AC0FC;
	Mon, 23 Mar 2026 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W4FNoOAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BF73AC0D7
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271446; cv=none; b=XZo0AZzCd5Z1HeH6kfAJy4HH6okkvhB2IOHo3fA6l4+amKV8rE+WiwSz/LwWwhnCQ6pdmEkmnmM2qKKuW3gE+rwwInYLbF3JrOegFIsEnXswHrGTkdsvy+1zchr24Q1mJ73aGO7HGZxDS3HBP0CYXtzrRTdeL/ons7cSD5zhPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271446; c=relaxed/simple;
	bh=F309xMOsoYAt3en3fSULuoIwejw2mSILjG/RfAGmen4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAWa/FbFIo5cdyAZYkyeDgzUsfmiYpP2/wZNQOBh98aAZPmTo2WDGWqKhKFmF/+4ewTDEKo/n7ca7+36Mznbv7T6I5khN5XQScpPgD2zhhc0BDWCjxz21Gf2itQLfm+n9QGX6KPxRFUFSgnjrx8swDUcBZX5zFRiMVYB9nZ+kDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W4FNoOAJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso2828342e87.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 06:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774271443; x=1774876243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HU1BwRIgJwIonvocfX7YrDLQqPhrL3H19ZNgFff0aO0=;
        b=W4FNoOAJ/P0Lqq2IBz7ZOYmRaw0OnlX+2bnVbZuT/rz/SQJcXnvcfGUD8juIyFrFk/
         pyB+TI2yaLKYEuSzlpaNnIixlGchvsF/Dk2S5JCfPAtKQ25ZE0qDsuaXBfuuCvjdu9VI
         THwN41llnsIXDmr42wpnsjWFSPKkC9XhFyFsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271443; x=1774876243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HU1BwRIgJwIonvocfX7YrDLQqPhrL3H19ZNgFff0aO0=;
        b=Q19YNRib9hK1BQGQnWKoFeBmcYpMsDmfCbs455Uq9vxJlJOsMm9M906yjDE1IHYC4d
         9u4AjvMJNSKEhO/GQYs0VfgGkTkRwTCYVjfUklCcVWkrK1VhvngTNQjqsy1zgQc6Iuty
         2VR5RPkc+KJ3N1876JHpMvZ3GE0utDn0YltB9XecNx6MUZwiBuBott+DicN14zJeoxWo
         JX6Z7CNeHH9FYvtRn1I/lH4KFxTUcnwRJ+XIMN58su3ZXv3XBuBu/xgrSSSg7r2NO+xz
         hYKyDrldQaY299paWzivRReuhXc0Cvx5Dxtd7Zwfj9dvLCagrCKr6XoTI3rVS0OjpIQx
         VxeA==
X-Forwarded-Encrypted: i=1; AJvYcCWydwBj1F/lFU6F4phyIHSyBJvEPA9RZeWhpp+JohAkaA96tIbDmiswfQ/TkknQj/jAFrBJv8m0PB85xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHm9nFnmym4JI/nyyIqecJiERCIAbgQc+JYfaB9Ocn7JS8qstN
	TRpjvcchUUQJm9jZn/quQdyCMmBCOMDV0QdgkMYgkhqIvrpzpYOxVwwequLbuLIIFg==
X-Gm-Gg: ATEYQzx3pEKciEeKtyYaftDEgrPRWLYdJxL/4hj/u5y3NrJ46pZdfMfFSYP1S/gFyYB
	wBmnWgI/D9yGDr/ufXlhNFDVk5smMW64/BaAjG4RP9HariRgMZ39EJ+QbYho2/FpI2XAguz46CZ
	YtpmOMNnQkvhKmmAoZtszIxlAZnHeuzl6x+4NGGW/PJwOx6PsvB9a+wq1NA7cifTb4zoJh7lb9x
	Jtn33++hRAI0nV4jkorx5IvmvLdhlF6JYqQx6h6db0E9bwb8zafiHRMhU6q0jiAszGYT0lOpgoy
	Y4HsVpu6+1Vn6DCwPPkLpwkndQ5miLzZvOzUsb7V7Yox1ONtE3B5+QLOsqV9uYUt7njkG1AatbH
	5xs+C6STXUa3T2xr1nUtdIUG2zkf5PG6Qj23FoPLcgMAA+Hyy+MZvcIpWWDrb0tSeYn3sEMTPJK
	pZUoULAUVdSwiPkNK7oZFmOUl/qtiowmwGqenHT04U4MJCMTQfQMV5stunDqS9dpnOTGr3ZaCVg
	zJ/WiQ=
X-Received: by 2002:a05:6512:3781:20b0:5a2:8637:8189 with SMTP id 2adb3069b0e04-5a2863781a0mr2777613e87.23.1774271443002;
        Mon, 23 Mar 2026 06:10:43 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e07sm2515904e87.66.2026.03.23.06.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:10:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Mar 2026 13:10:31 +0000
Subject: [PATCH 4/4] media: uvcvideo: Do not add clock samples with small
 sof delta
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-uvc-hwtimestamp-v1-4-aa42e3865204@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56724-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4E1F2F2C8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index dcbc0941ffe6..e1a4e84d6841 100644
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
+	    (MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
 		return;
 
 	uvc_video_clock_add_sample(&stream->clock, &sample);

-- 
2.53.0.959.g497ff81fa9-goog


