Return-Path: <linux-media+bounces-64521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VrfOJMvdKWp0egMAu9opvQ
	(envelope-from <linux-media+bounces-64521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 23:57:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC43266D225
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 23:57:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="S+NQzn3/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64521-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64521-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F020305992A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 21:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D88C3546D1;
	Wed, 10 Jun 2026 21:56:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D86D3233F4
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 21:56:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781128615; cv=none; b=I0Q38WHhFWPOlB7039HrDsswv2Gl5813Qghf7DaRQchBivHk/E70K7tvtaqxpET8oEqx+29o9D17mFC/M8pAhQaeDo/fBFSxulVanNDA8rDDV13F2y/ID0tH0g0DiILZA7NQ5IArVCDGvkv1B3RciejWA9g9YRAcVHT5a5mbXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781128615; c=relaxed/simple;
	bh=7j+dNQOA13yRH4BVPpXE0SQ8gv7p+/ml66i5E7IgQsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJZRosUHDaHnTfWcR6P6co3wM0VfAYO7veXheB4pDiZU3r1rTEsIq1Jj1AMRltPQE4Gqgn1+8itPfQuiBri+apkAmeM97K7tBN4ziBM4brz6Kl4iR5MHKuVOd8iMITUGEKcAIOjPnOHMBppRGV9nwz2JN7rbUeDNu8BCxPNlwHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+NQzn3/; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eee266c6cso5904173f8f.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 14:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781128613; x=1781733413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yD6ITlqzgHastXjegJzEESG+cmrbmOcZAzF3fxOvMuk=;
        b=S+NQzn3/TkMMHfxVC5Hma3R0uNrAvMpzLy/LsUiBazyCLm9wUaOSLJq6CIhldE1HrF
         C30HB7Yetvh50VdSXuaGLtnSy1FGixNsCEbcJH+mluUWOJ2X3s6vfniWA3FmTOvC5RN4
         3h7UVz4vjpHU8msPrL/Cpfx6pBqoWveIKAL3YyKn/04mLu/SiZA7Ie5bGiMuBIvtEcTE
         lLtJen3j/KVnyUtqF4erhl3g8070W8x1uH4UwRO9O/Dp9uiuBCMdRvBnVQxo9WfvTyB1
         rMFRfgz3SKWHUs7mQPTptAknQlAHTg2oEdNptMSCjJfmsaarQqBLUcHqDl46L6SpPtWP
         4fDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781128613; x=1781733413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yD6ITlqzgHastXjegJzEESG+cmrbmOcZAzF3fxOvMuk=;
        b=HFEHO/JqQZLV5lA0hsGxtaxCW+/dp5txz2aouWPf+p5sUH4GV+MIig0ndELbcfa+ac
         Hl9fmtbnyzZZEislXzWBr9XMtJ/ca76wERookpg9Fx1ysor5kRTULJPZtDPOG4MTi0Vv
         /hk3QIuHVuzXcg4AxbDUtlKDmAhhZyBiKRy66fuurb4NnEa2pK/YpTTpFSkRfvMv2Ndl
         5nvzO5lmItxH9F+LWZaP6uMbvnlpotZuoGqiGeeWwg+cyf3XjwhUUCcD3Nslt9djE6mM
         gMQKzbExuR6aZsoeHKe7zKxruAx0rEKOd6k2GUeMXWindsIwLQThF3Pk8QMQLdpi+pzt
         P91A==
X-Forwarded-Encrypted: i=1; AFNElJ972UCaXGSn+uWR2ys0ihopwcfypdVeOKbWtV/e9ez6cEY7kcYIXZrTYOjFjT1rvS9zLfigI7U7uCyUXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvBZA+R5GQxVKR5AGss/mzh0DmsHgRqXoZUbVY3WYbnH7eDm75
	R58ShfuzQXlXMWPIGmAwajeDYdBpkt3CgxsV+qjKqa4KZhhiUbkoOlMQ
X-Gm-Gg: Acq92OEytGBS+ZFs+KnHcum4YEWFpKcORFCHcRfTiAfzgKSs+JMqWYPusiQxH1j8xM4
	xfX0usHh1ENH5SWzTV/VUzOevGMxveIvaTzTIpxFyT+54oZcDXBtWhApStxYjwhg9QVtlS6LEaQ
	7M3Q/0Y/eBbgiVUstBjuNa7aOVGUj6MAgT8aJ/WDnq1oilixaS7brTRQte+22rhNQ3Iw6WyyJML
	ecpb33UvbaIXQFma8xg+mgfD81Q6vU0UNasGB5+TBY5x4UobLECuu4ki9q4lHRZW3zCbhcNyoBH
	nD7LRIgEeLGi5dptgG9C/ZSyJp8ehsNxnN5YND18vmzELsXewgWtPqKI6yLjGi9Dma00/c/6+CY
	PWHiranEjn0SH7+vVLbeKIg4XP4y+zvJmnMs8tThfuDQgI6MuSsvVTkNfLWngxYXr4flMBJHJg0
	KRt5pUu3h5SPEdX02qnRk6f+/n305AgM0CJ4nMJnvJVjnZyDuK9BCCJlNaEzPLWFrO6HqRPPDct
	Hc8+ARJX+Uc+p3XjrAiEw==
X-Received: by 2002:a5d:64cf:0:b0:45e:f29d:d438 with SMTP id ffacd0b85a97d-460677ce9d6mr55947f8f.28.1781128612832;
        Wed, 10 Jun 2026 14:56:52 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fd33sm81407452f8f.35.2026.06.10.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:56:52 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mali-c55: Fix scaler factor overflow for large crop sizes
Date: Wed, 10 Jun 2026 22:56:48 +0100
Message-ID: <20260610215649.98274-1-devnexen@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64521-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devnexen@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC43266D225

The horizontal and vertical scaling factors multiply the crop dimensions
by MALI_C55_RSZ_SCALER_FACTOR, a Q4.20 factor of (1 << 20). Both operands
are 32-bit, so the multiplication wraps before the result is stored in
the u64 scale variables. For any crop dimension of 4096 or more (the
maximum is 8192) the value overflows; an 8192 to 4096 downscale yields a
TINC of zero, so the scaler never advances and the output is corrupted.

Cast the crop dimensions to u64 before the multiplication.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
index c4f46651d..0713e7d43 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
@@ -422,8 +422,8 @@ static int mali_c55_rsz_program_resizer(struct mali_c55_resizer *rsz,
 	mali_c55_resizer_program_coefficients(rsz);
 
 	/* Program the V/H scaling factor in Q4.20 format. */
-	h_scale = crop->width * MALI_C55_RSZ_SCALER_FACTOR;
-	v_scale = crop->height * MALI_C55_RSZ_SCALER_FACTOR;
+	h_scale = (u64)crop->width * MALI_C55_RSZ_SCALER_FACTOR;
+	v_scale = (u64)crop->height * MALI_C55_RSZ_SCALER_FACTOR;
 
 	do_div(h_scale, scale->width);
 	do_div(v_scale, scale->height);
-- 
2.53.0


