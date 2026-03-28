Return-Path: <linux-media+bounces-57453-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CChlGvLyx2lMfQUAu9opvQ
	(envelope-from <linux-media+bounces-57453-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:25:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5934EDF3
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79BBE306BD07
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE67734A790;
	Sat, 28 Mar 2026 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXs/R/5N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3C9349AFC
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 15:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711351; cv=none; b=ExNhKNOUTiC0is+RC1MPuIhWxNrYBZeqZPi1kg9a8SLr86eCBPwLAsivT3UAjvjjut9w/POXQVM35F/gATZAu3wyqk5kA5YrSYI9VCttfYeeJDk6BP4xMYO9rSeVHJrDvxrQSPsX6QRT7UR2iQ+ElFjAUlQU8DbVqn6wrtCK+ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711351; c=relaxed/simple;
	bh=YHJ1Q9r2nFzI40oj0hLyuUwDuuKsB5TRZDY4YRqCeQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0CSk8bsW7JvAYrq2a5zeYRW2PEfEJCKZnMe7K7/zmBLvdz2J0SVa0cHbAwk4xWDZOVPd2GSJIPUqNdmmoU9RsCuadOkvbAjvHUCbPPgSbt/LDDhcSRcfnMVbYG/n5i4IN1pHuH+bIY7NKlMuFHpRBGTVjq7mxa6CiEKNX7JG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXs/R/5N; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c56e822eso3314731f8f.2
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774711348; x=1775316148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sT0vAeKWbNcBHjzXmZNOmFDiqgcHVu5KL+cg6ECaM0=;
        b=aXs/R/5NtIbMv69Xv7uvV4cpXrqEv3M+ugcY/zKHLIXRcCjY7JmB4gZpfbeCDqFspg
         dtKIYl743bondh0ZKCvxusisNSIACwMusOtMuz4OnHxTHvkIX8wkQpTmAhmhw6OP6yQU
         OgyG7pe+c/WQTDBVG/XxnoyFJAsywJKBK7+NVvQaXNpHQgA5L85t+8x1rvJ6YtxKU444
         T/BLFzQ9WAvIE0T3jfwUm/mmG8MJiiPiaZjE3LN/9+JqRfV6KdXNbpD5OCHL8aPqEcg/
         JFeHM3ElsbDgLVxRfu/n9ykYIbslfYnUD/5Y9jpWBwF7/pIz3VoDZ6TKQKq8H+NGULYj
         wBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774711348; x=1775316148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0sT0vAeKWbNcBHjzXmZNOmFDiqgcHVu5KL+cg6ECaM0=;
        b=NOMzwqLH1/A5Tdph3MK+kCJE9bi6xurgF+G363id7pagmE5qpXdIlsKvvG4ijKDnkV
         u2hFeB4r26lfUHOCkqNOMlJZ8BkeT2bX27yQuRID38JONMXHh4DZc5KA/ydktbmfA3DF
         +t97NRbXVC424wYVWyPJ7vnH/VmjixAtYQkcU+E5AC7nyhxwRxntO17kxq6sm8OE0LLU
         V4Cb7of2pr7oJ8CMVYHNQSHfvHq2CJmnUzyq8o8EcsJbADfFyqdDcFFWc3ck0vsIz67o
         82UtgjfUJ26Mb5ceZB0qwaYqJQDYkjXfUGSm9mhlZqNuGbv22zddllY9aFlKkSpPG6Fz
         be2w==
X-Forwarded-Encrypted: i=1; AJvYcCXWZfgQPdjw1PqP/5QiOglMt26cvUcktlCNUQerfhQkLkjw1JiN1ZbzGgCuGsBn95ygV63HsKrSv9FS2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPsHwEaZF1FhzLzsSA5ygyAy/Bkmvi1SCev7KpI+pabMf2TK8t
	6Uy3MuHff8F9s2WuqWix2VB6NnE/66+iJOMQrljElAheAFzKkPMKj/Wl00Tt9kvDjnA=
X-Gm-Gg: ATEYQzySXNFqClP+QBRIdZh5Q2ddeBczsrOLCzWsE/GiIf/0CwFYcf+R79NlBCxBn8m
	j9+OF7UDboY8r0B9tfArFNKxcuNNeaCp1LCkIO7L7qFnRHmu0uvuoSRtJP3Bob6KdgMKfjR/V9z
	AOx6gNaQIQeY032CryNHGhYjKxQhYK79k30lcczgIycIrT7zL3bXBYl3kxNfiHJ9CEYuHX3yap1
	EJc9dnP0/PU0AfbNfkwjodPjP3I5mOdDLYSc6j//46DPKdT6yyuMY3vfLaRPaDtxkKHSxSEHuOh
	ttTlqL0nK2N9qimqyFmV7AT6x/7Yrra8wftLqWqnJP3SWmJO/JgWQ+Dt80R2MdYJySieKtkFNdG
	+6xWs/S2U0apI5UcxNcJaDiII8a+fj/kgAosjeMvkZLaK0xGQvOOu7+mNbnU9x21Y+VXmbxSa1n
	wF6uoga2iFQ0Bb/UUlk2sVssKLE9yqHcI57gI1kLQ1Jq4IN9fzJ8W4OWIt/0nLmSC9odyL7j+qD
	0n/nCrMxy7miN1teofAZH8=
X-Received: by 2002:a05:600c:c086:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-48727d7355fmr86777215e9.11.1774710899496;
        Sat, 28 Mar 2026 08:14:59 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873069961esm51573795e9.12.2026.03.28.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:14:59 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: nayden.kanchev@arm.com,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v4 3/3] media: mali-c55: fix probe error path skipping pm_runtime_disable()
Date: Sat, 28 Mar 2026 15:14:52 +0000
Message-ID: <20260328151452.148901-3-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328151452.148901-1-devnexen@gmail.com>
References: <20260328151452.148901-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57453-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BEC5934EDF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When mali_c55_media_frameworks_init() fails, the goto target jumps to
err_free_context_registers, skipping pm_runtime_disable() despite
pm_runtime having already been enabled earlier in the function.

Fix this by adding an err_pm_runtime_disable label and redirecting the
frameworks init failure to it, so pm_runtime is properly unwound on
that error path. The runtime PM status is also set back to suspended
before disabling, to undo the pm_runtime_set_active() from probe.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index cf238bdf65c8..0f0043927cfa 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -828,7 +828,7 @@ static int mali_c55_probe(struct platform_device *pdev)
 
 	ret = mali_c55_media_frameworks_init(mali_c55);
 	if (ret)
-		goto err_free_context_registers;
+		goto err_pm_runtime_disable;
 
 	pm_runtime_idle(&pdev->dev);
 
@@ -843,8 +843,9 @@ static int mali_c55_probe(struct platform_device *pdev)
 
 err_deinit_media_frameworks:
 	mali_c55_media_frameworks_deinit(mali_c55);
+err_pm_runtime_disable:
+	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-err_free_context_registers:
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-- 
2.53.0


