Return-Path: <linux-media+bounces-66334-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XxCyF5BLRmrvNwsAu9opvQ
	(envelope-from <linux-media+bounces-66334-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:29:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C66F6B4A
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:29:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pTIkwMRA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66334-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66334-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8563318E74C
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 10:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BE2390614;
	Thu,  2 Jul 2026 10:34:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D25F35F165
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 10:34:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988498; cv=none; b=XawmHSpYcXB9Xq7No3Pbq1yJzIxOzvHf6pgSIJZMqMlEyd7ZrTOzFpXxS3x1Z1ui1A27WmXs460zLQHG6uG6XomntJjwTKBxpVvGaAAfiB0WpD6jq0S4m1ZHt/4BovBYvWTdlsv8FZC7ANPKwQMZN5zJ8622Lh1xlo02lzeLQ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988498; c=relaxed/simple;
	bh=TwrDbLi1pC9WUNSqUhhC59vYbXMRR3WpZnF2BmH1AvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B0o5pFaBu6nxU3uqLriXF+mdrUpAjcySqxXHdyIuxxl8LD3m/EpQltF17rarC08V5HYr/pVPd6Z1juqGPoA4ZOm4AnOKzVMA3dwejB7QB3nfTnoRIJTKEX3gVpythF/jPdYaziQ3ITDiuBCU2LqEpBOTfvDKLWQc0Qggct2x//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTIkwMRA; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso5893035e9.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782988495; x=1783593295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+pjaQR7lTb4k2svNO+Lg3ruGFNjqRCr8CkNWwxNNeQ=;
        b=pTIkwMRAdzIb/f6vG5X4dlyERtkuS1TVl7bcSCBz1/wYtAsfF7i7dw4Bux6VVMZzrc
         JwUwMxCkqwQhiRiIN0bdBQgCj7PSOKMIHuux8VNi3Pmi7iWvKTgigZiQXzJ5RUOGRV80
         SZQhV9zZSMc8jNh4skkl8xguGdjX6mwTc5zC2E7cfP/UOnOnbVs3ZDxIbos9+qyJ5t8d
         JzbpjdH3SoCF/t+H9hr/ERwc9yoLBDw///g+asyBgY1HLHFzH5XkJdNrJNx9bp+/ZKR9
         JQkDIUD+8ZqkpzbDSwUSz4B7zuYUI2kv6QilXb3O+eJJ7CLZQbTObfILqibgNYoeKcMh
         A9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988495; x=1783593295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+pjaQR7lTb4k2svNO+Lg3ruGFNjqRCr8CkNWwxNNeQ=;
        b=n5C3ilKOWh6ozxsErstqPK4jmH/FTk7l7PNYVwxfGEiRSCgDB4D2mDJWKHR2a0F/at
         q2+PurfcEIDkg0+Bn0OyZWYYJx90mXbw3fb0JbtrdhtSduidpFU/BlORbW+hcn/2onrA
         o5bHVIliXJN2OggxGe0O8ZDQwe1gYNWdNq4OboAHiJVe6ngHI22csLlXUuj0YOW5khEf
         yX5SozOpq+n1ge5YZJwuCc1Hn0DjuB8LqC6G9DLW2qpUpTPn9ssjOncqbLPiZm/a22AB
         DFoT+HwxIjaRx5rkSgcLgZkjdkFViSfFFQu3AtvsdXMM5LTd6oTfpw0vRbfVKpBoVJLF
         x3GA==
X-Gm-Message-State: AOJu0Yx+ES4tzhDTx9znPYlXGGMHFENVC7RKaYE2unTbxOvlYgLQNcZZ
	o84qGsUxwAIgkKoaIwLs571vGW5wJqToCtaXzFSbYj07zJ3Gd9DHSQrH
X-Gm-Gg: AfdE7cnIDiGOdj9FUagEv/IPvQGQ/DyAswCRozHsvfiK/g4Bh97YZ6wsRDqyV2LZI3B
	qpV+yaerL0/xzy1yn+vdzjX5W2V89aJAHzoJ9Bkw9dQ0hLYEC3vyVbCljGe9d+6DybYr87l5189
	oLTD2KidEUVg0iZlOOlyk0AnKtjsr5Q0wOGdygjM5nob20m871YQ60QdciOgeMp6dJVDHPcpqMb
	dzkKPnnigZVD+OWZnR33f+5DF1Y/nTz+SiHyQNTmLMq+yHEu+ZpEW2o7ZPmoRqZ5EtYQcaEnPzc
	WAlP3C1oJ9gR8nBep/lnvsCwIZVfqV8SzrswNydt13AHoKzHc1P3S0+T3BOrmbv3cEjnRqYSu0N
	7oVHnijl8+j8LIEU69ZkJcmcWtr63BpdSpGbXfuLxZY9feLIESzneX5XLnvFf2JgHM5oAJkB7zV
	0OHgO1UEe8pHm8LHOmJMdfLe4bNtcxUKiYgU4VP4/jvDiKFYqgMa//rVRXeirLG+1+Ahh3k76j
X-Received: by 2002:a05:600c:4f48:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493c2b5400amr95863795e9.15.1782988495335;
        Thu, 02 Jul 2026 03:34:55 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm39551155e9.10.2026.07.02.03.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:34:54 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mali-c55: Fix unaligned access of AEC histogram zone weights
Date: Thu,  2 Jul 2026 11:34:53 +0100
Message-ID: <20260702103453.348056-1-devnexen@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66334-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devnexen@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C6C66F6B4A

mali_c55_params_aexp_hist_weights() packs the 225 per-zone u8 weights
into the ISP registers four at a time by casting the zone_weights array
to u32 and dereferencing it. The array sits at offset 10 within the
parameter block, so it is only 2-byte aligned: the u32 access is
unaligned, which is undefined behaviour and can fault on strict-align
configurations or once the loop is auto-vectorised.

The cast also reads the four weights in host byte order before they are
written to the little-endian register, so on big-endian hosts the four
weights packed into each register end up in the wrong byte lanes.

Read the weights with get_unaligned_le32() instead, which is both
alignment-safe and fixes the byte order regardless of host endianness.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index de0e9d898..1aaf64dde 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -6,6 +6,7 @@
  */
 #include <linux/media/arm/mali-c55-config.h>
 #include <linux/pm_runtime.h>
+#include <linux/unaligned.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-dev.h>
@@ -203,7 +204,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
 	 * of overwriting other registers.
 	 */
 	for (unsigned int i = 0; i < 56; i++) {
-		val = ((u32 *)params->zone_weights)[i]
+		val = get_unaligned_le32(&params->zone_weights[i * 4])
 			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
 		addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
 
-- 
2.53.0


