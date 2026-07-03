Return-Path: <linux-media+bounces-66519-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r2dqJojlR2r6hAAAu9opvQ
	(envelope-from <linux-media+bounces-66519-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 18:38:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9588D7044F7
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 18:38:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UmXZQVCJ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66519-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66519-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 953E130151A1
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 16:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72218307AF4;
	Fri,  3 Jul 2026 16:37:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E5E3002C8
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 16:37:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783096657; cv=none; b=g7fT6qhEhv4hcDO6y1zeg9hFW+gqTU3pWf8q+xXRKJSNKml9+ooy1v/hfu+mLPO7F4na7UF3r9cjlqjU3mDr7D7kuDXwYtYcLjeHTQAtLPsPONRbozagN2b3mzBd++cbt2hlqbbGo318OtH4D5bT5fhQIOBWOAlxeClu/vGeOEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783096657; c=relaxed/simple;
	bh=W3a6RocsYvmMd7TQgrnkf5Cabz8D/s1LPH2t4/oPovk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7/akF0WEY233+4nGneRhG5xnQsmCz1Zg7ukqO653mE7sdiW4EttNsrEe7Asa769w48496Xfzb2nvELKyLi0/xz+q5vT+5Ea/NimsVHJwjoQUIWGYEDtbRcnK7S/6EBB6KAiF0hFV5ewToWY5I5+sK5/ujMJL/0lfpWGwnm7hOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmXZQVCJ; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c83474ddso7199015e9.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783096655; x=1783701455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ExrdMjWEb1olxCB6ajDb+XGRteRP0J4HxD1YD52YLUI=;
        b=UmXZQVCJCIcF7sVMK4Px8vrgF44IEsNUQYuXqF6MH6UjH17edWzQOoRAdXm2Nnuj//
         p8ZYicOrxpQxEBgL6DhSrUsYkh+0zWZ95SzbSOhPttcFX+PRbYnsDhIDLBJaKKKezgzb
         AWdXlzSpHR93AhuegKFKJXDM7TmJ/eTnJLAYXVB1d6Mfp/VrT9LPHcZo9W+pWWOI+3Mk
         5V+DMWYBRatd5ioWMQedgssHpjMerSelhvM5nX4XwiAqv61cwjDd5gNKAX/XVeEqDF4f
         DmxifnCn7tn3Nyn+1z2XG4jvSYo5PXpxsqdBUC95g1Glr2+O4FS3mgDNM0KDawoDsAHL
         fOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783096655; x=1783701455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExrdMjWEb1olxCB6ajDb+XGRteRP0J4HxD1YD52YLUI=;
        b=NTRCjNRo5pYukCQEm+sjMpcgonXowLdgS5y36hd6gX2VrX+e8YRWryJ8c35+NROj/V
         ADWf6J3PAGoun8ApJg0okTNR1BXxgYOaeDHCdupmm6NOqpl8yr5TrmZ5baSzdXacz2Tm
         4PtYAQFXgMG1bptxtLwsNPMySOrw9O+Z95fgSivjg78E8T5dYzPlKXTFEWlM6yHd495r
         AhH8Lt7ZmKA8C+63nEuiQmQiXvN/wPQUNarvmVSlvn80SFaaAYqsnVWwZeUz81bkn/kt
         xic62uJImFOHtdTFkyBPh78FmVxjA+mZ+JD5bo36LlqpqDMr8aGbI3FtkMEkKwmfRsDX
         guWQ==
X-Gm-Message-State: AOJu0YyTsvkR7UgmxBuOxgBzljSsSh0oMayFTVib6BT+S5aVPPaKmz6J
	8O/LlfYsx2fa5HlJgSO2v95UecfQySQER/uZpz2MVBJylNvgsPyiwvcs
X-Gm-Gg: AfdE7ckFbVNbdl+xYjzu82hwoiIXXrq64/7Ox4Gpg7o32ZOJcFC37rdEF3tbioiekU5
	1NeZbRsl4eeZj9TEb733SDl1kSVjcHT4M4jqHyll1zONkq1e9+5X0d0nF8VyIpAxTRGY4epGLqD
	/Q8yaoelSNm4sYLqaAtLGklACDWFTgPcnStl0xiKqAdx11pVxSZcdTJqKV9hI5jYMh+tnraAk2C
	1mMoDwdVLlRe44C/2ag9uAQP1W9jZl19ee4hz7iRreMHyLXmLexW1LhvR8XMxaBXNNGWCFIkk6y
	jCtE7358ikzQF2YLPcnQRD75aHzmqsHGDHOiXPmpvbu32FyQK++EKq+BEfO+kavr1n6eox/w/xp
	FSNmzuODtQoRJoVXZQcET4Fx6Jfl0h1JFWDOpmSJS1LG2vw3ot6FXb2TsXWZzYZyxjOHxjTJ7yD
	ds1Wn/3zEjAW7hrT0fGEFO5pR6QD2aGy63AmE8sCsB0FQXZ7PK8JpptPFPfkGJcW4wL8hMRYhHz
	Fv9LI9jIzc=
X-Received: by 2002:a05:600c:4e11:b0:493:b549:3be0 with SMTP id 5b1f17b1804b1-493d11dd1d9mr588675e9.17.1783096654758;
        Fri, 03 Jul 2026 09:37:34 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef23feasm177372325e9.2.2026.07.03.09.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:37:34 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: mali-c55: Avoid unaligned access of AEC histogram zone weights
Date: Fri,  3 Jul 2026 17:35:06 +0100
Message-ID: <20260703163506.715627-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66519-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devnexen@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9588D7044F7

mali_c55_params_aexp_hist_weights() packs the 225 per-zone u8 weights
into the ISP registers four at a time by casting the zone_weights array
to u32 and dereferencing it. The array sits at offset 10 within the
parameter block, so it is only 2-byte aligned and the cast performs an
unaligned 32-bit read.

The Mali-C55 is only found on little-endian ARMv8 systems, where such an
access does not fault, so this is not a functional bug. Copy the four
bytes with memcpy() instead to avoid the unaligned access, which is a
little more efficient and drops the open-coded pointer cast.

No functional change intended.

Signed-off-by: David Carlier <devnexen@gmail.com>
---
v2:
 - Use memcpy() instead of get_unaligned_le32() to copy the weights.
 - Drop the Fixes: tag and Cc: stable; this is a cleanup, not a
   functional fix (the IP is little-endian ARMv8 only, where the
   unaligned access does not fault). Reword the commit message
   accordingly.
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index de0e9d898..832d8f49b 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -203,11 +203,11 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
 	 * of overwriting other registers.
 	 */
 	for (unsigned int i = 0; i < 56; i++) {
-		val = ((u32 *)params->zone_weights)[i]
-			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
+		memcpy(&val, &params->zone_weights[4 * i], 4);
 		addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
 
-		mali_c55_ctx_write(mali_c55, addr, val);
+		mali_c55_ctx_write(mali_c55, addr,
+				   val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
 	}
 
 	val = params->zone_weights[MALI_C55_MAX_ZONES - 1];
-- 
2.53.0


