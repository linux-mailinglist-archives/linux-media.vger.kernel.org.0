Return-Path: <linux-media+bounces-57448-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHh3Hnzwx2lMfQUAu9opvQ
	(envelope-from <linux-media+bounces-57448-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:15:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3DF34ECEA
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E7C8301571E
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C8E345753;
	Sat, 28 Mar 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaVMmzuC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B714221257E
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 15:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774710901; cv=none; b=ruwpwbAYEqo4s3CZm9psly8bvjVYpiwCtj4D2sor37w3I/EUhArQmDAsKqWKNio9+V9skRd4VmSRD55TvZ59N6dNytsI5jZB+wXYFfOfGrArqEzfNvVP4KTnCrf5EV9A5HeLWnm1PznCb2ZwVoxwaD654s2sJhHslSZQdBLocuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774710901; c=relaxed/simple;
	bh=QT1ktfNmN1UcDS1rLtjBYoZjSUgMc025Oyaz/fGFc7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e1e00tlckRhESPYcopRQwYizF33A2uVlEdlnfnc/OWSziEv6dYzRKGYi+GeqErf0Npg8T2LjXWvn/9O434wP1DzQYnfdH2XnsnFGGKoG5DEFKnITeIA0nHPr4P+C1pE8N4uN7NniswYXJgwLvNrQs8sg0j5q2Ug4/WZInFe3pQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaVMmzuC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486507134e4so35038615e9.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774710898; x=1775315698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nd5Xli4czy19zxhELaWrbYsp5OrzbC0MTbSXRE2sw1A=;
        b=GaVMmzuCRbjXb8jGHYIP/GpuMDOmRJL4kg0wvnJaS1WOTEUyP+Z/3SHGNc6dIHqyO2
         8GqSt5zjEUzYtyTzAPvmWk2rDhm6z2GSV6ugf/j0DnhcsMpMjBKBj1E7HrWK7dMmoTMM
         QPMx4wcu0O3Mlo1L3KaJE3IykfUW6gp2xDLfSUxqV5wht/UhG3WT+Z8L70bF2FDoOni+
         ZwmOBDt7INOXwXAjk5zJrFDfgEUZ0J/2LnkoKDoMEXDTookIXzf/AyLBoCU0UvLRzH7k
         oBcx44zOUgnET6DSSU3xsHHm8x6eMB2CwBbSnAeNJk1SUG7vwF2R6617fA0YwY+SKKsF
         DXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774710898; x=1775315698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nd5Xli4czy19zxhELaWrbYsp5OrzbC0MTbSXRE2sw1A=;
        b=MDYBRREW1w0l2oTBQtzkNBd11kxICW8KnIugOhU1GKIxQx2YH8C6ejYp/kPrH6Dlk/
         tc+o2jsFKSKBQUz6MW4N8rpfZFSDBpK4XWkuphAo2l/fdyZOWz/JeDYuhwFy2b54n7dt
         KrB4Aol53i+zLBW2W0IcAB/oMprWiR2tPR1ty5e6nWmh67VOHuK2k3Z7KJ//pqlXeBzP
         ZyaaSBx04c7//XwKXQvuzgXwCkvoG860uOLcStmNJtmOs6d0ucaC+yebRcrKtY2FfZGp
         DqD3SFWqNbiJL+Z34i5Eg5wUfbDSgbYy4tBzUcqbQxM5noWZRy9Bb9G07/wOiIPP/rjJ
         M6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXk9A0fNXXCwJN5HBymTJ0LdJbjh+Afs5hWU/KsYPxNXbIL9xozzGgwgFRoqeYPqG5qr53kLMqZ17EWyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrjkbA3pv0wcKpXXJanMdPT4F0rYsDyHKTJ4l8cyaiXeEng5jS
	5PGE/XbaZViSx+/5UouUCw5SPiJ4M0ZQtE9vRXVRKkfPR8cuqu9pmaHv
X-Gm-Gg: ATEYQzxoxalA+1C9pMHgn1C2E1U0Whq5xrIgxmPyD5HcE/XDEjCEh4/tWEt/t6KjVf+
	n4wHlw8eyLVz8bBr1py+7jEUsSg9yFWOzwy3ZI/RmKbrLzbsTni8+5TwdesgvBiznrSkHPCI7iS
	SABDVGoTwCcarxblksX2TutSIyVdyQZHpKiTEZd7FTMdLjZmdh7AXHtm/EPY1B+XVA3msZSXrP6
	uBUESyyR/ABs6iwZrIk9wONizn18H2QwFEQN+MI8+2nqMxo9+p7Xrq8c3GFZjIK9Y/6F6r4Nge5
	q/AFpSlu17hXwpVOgBMYh/9Llx7jIqQNFmUS5b4myRtXvY4T46H2sfb0zN+zadoUn1Xq5l+DXMK
	uijvSPVMHqzJImuYsxR3P8kMcmfvuXvMTbjqP3FOQ8ZNOAjY5EOc61BMSc+w/hcoPUs/Il2WImS
	cLBjfTS79Wkg9T3kSvFcgSYf488vblHyhoA0VeRU0RwIDpv8O9purKXuq5sqQh1U7gh9jKaOZGy
	+ClPXQ+Mb4W8eJAbwMH1U4=
X-Received: by 2002:a05:600c:6094:b0:486:fd71:e609 with SMTP id 5b1f17b1804b1-48727f1fc05mr100679925e9.25.1774710897912;
        Sat, 28 Mar 2026 08:14:57 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873069961esm51573795e9.12.2026.03.28.08.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:14:57 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: nayden.kanchev@arm.com,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v4 1/3] media: mali-c55: add missing of_reserved_mem_device_release()
Date: Sat, 28 Mar 2026 15:14:50 +0000
Message-ID: <20260328151452.148901-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57448-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB3DF34ECEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mali_c55_probe() calls of_reserved_mem_device_init() to associate
reserved memory regions with the device. This function allocates a
struct rmem_assigned_device and adds it to a global linked list, which
must be explicitly released via of_reserved_mem_device_release() — there
is no devm variant of this API.

However, neither the probe error paths nor mali_c55_remove() called
of_reserved_mem_device_release(). Any probe failure after the
of_reserved_mem_device_init() call, as well as every normal device
removal, leaked the reserved memory association on the global list.

Fix this by adding an err_release_mem label at the end of the probe
error chain and calling of_reserved_mem_device_release() in
mali_c55_remove(). The remove teardown order is also corrected to call
mali_c55_media_frameworks_deinit() before kfree(), mirroring the probe
init order in reverse.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index c1a562cd214e..5cb59c70ffc9 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -806,8 +806,10 @@ static int mali_c55_probe(struct platform_device *pdev)
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to power on\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to power on\n");
+		goto err_release_mem;
+	}
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -846,6 +848,8 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
+err_release_mem:
+	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -854,8 +858,9 @@ static void mali_c55_remove(struct platform_device *pdev)
 {
 	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
 
-	kfree(mali_c55->context.registers);
 	mali_c55_media_frameworks_deinit(mali_c55);
+	kfree(mali_c55->context.registers);
+	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.53.0


