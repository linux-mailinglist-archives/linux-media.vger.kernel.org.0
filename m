Return-Path: <linux-media+bounces-57463-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JEzFBoKyGnMgQUAu9opvQ
	(envelope-from <linux-media+bounces-57463-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 18:04:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCE834F40A
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 18:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C964730098A7
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 17:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575913A542A;
	Sat, 28 Mar 2026 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFtDGD5K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BC7239E80
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774717458; cv=none; b=h2hXC7uNgkwNVvGMEi3JvkuntrKJph0g93qPIe+XGQ2HDtqcyiJZjT1AqV2UfrKuY+9htQLIbIB2ZTxcOsTabGWcJIE/LgTDP7yi00BygCeccZd4L8ULG7ouQvprjo1HojODP/bdPpfe+T1eoey/LcC0abAePt8ndDkHaiVYv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774717458; c=relaxed/simple;
	bh=EMTPNJ8N+1fObdxaQsuaJLSYvN4YE9jy1yRmL3OYKQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nS0VFgKN6eYeDkTzi+8CCvAHOuYH/JCq/iTCZMKC3xsH0vYCuNUGP/oY63iEOUsGiRQ60Om+J3mBDh3K0pk/QzcyK/FJFqdkTfEQEZgkxNzvaSv15nauhwufZdA1jjIPevTj5Yd8BqIKrI/X8tfwW2jHjxEkBJugW1DoZGqCawo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFtDGD5K; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-487012ce896so18973845e9.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774717455; x=1775322255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQA7psx/VKD33NfOkJOqgJYIdfAgqaAWVjeqv5CQCXs=;
        b=GFtDGD5KTWJEMyViYOTJutzO6ptwHJeMOCbCvo/3kmCl/dgCTPRnYu3K2oWORxUgfL
         LyUnV06mDPd/Hb+EdB7AmsmYa+pEb7y0fILaKDpqwi30t+sH6pRdtQbCAZLiuyGniOjz
         9RFktHS6WoeQ1LZxSQSXUFyFGrrl950zPk0yJj7JZI1N0OCLCQMeSE+2nQA7iUT28b3G
         7ClT4u50Zs+4FpQHVI9KfmqDW1kXWnbQ1SZAy37tEJn4OrrdRG75F363eJ9fMzjs9svk
         M00r3AjtSmOpNNhG1vwFr+H4iX6sB9sqVbOJq2SpziX/dyQCOmfrur0DzSepH8PNLQGZ
         YT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774717455; x=1775322255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQA7psx/VKD33NfOkJOqgJYIdfAgqaAWVjeqv5CQCXs=;
        b=h0/VRAdusGVi4iqlhkcOkqkgVJ0lepBBCZ53UVFz1i1upD8BtI2Y5DRzwP74qvzsE1
         /NPJ2qZgLZvoWCcNT5pk6/jSmNQ76FCa4ntbU1l4P166ormJqzKAM3piCS2jyfIC7rBj
         QVv58m7oPi2fRMUKJKRngRcWIqWCeQ2pGsyW2DzpWl7aTzLAk0i6ZsiFpN7rqgCwmUIs
         AlZJx7QTgaYiL5a7oHzC4zV4fNSGUehlTcnqWHDKKu644CgXNcg6vlHFVCIv/bc3IdJ2
         NwbkU7EXjI1CsDqDOYKKTMUReDA/MS9g3hlGmRGuL1vviS6YJw35yfVZn8nYFHuBs/OX
         rWPA==
X-Forwarded-Encrypted: i=1; AJvYcCUUSWKy2pPb9vKYwoN5zDL720MkXpReRq16NGjKrku3Ss7Yrj7VHfG7aNOBXTdc0a0bg4tiLGiIDMiWfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxus1Xjrb0Ft2zXAByjehg+3DELHz3HPycl2euTKPl4gPpqn6fP
	Ko1Y/V6ki+DyILEGeX/6M2nUYpQEdNNvyAWX4Ibax4LhMIVKaIrNaMjS
X-Gm-Gg: ATEYQzwLfrEaMhzbpb3lkjKHkqMGCvAit8O0KpNjYNHcb1e2UobYzjDJDlVbmAzKTuk
	HNOfkEd0rPjeahJlurN0r4XAQDsifDJj5jkYUKr0X3ODb2GVT9G8Anz/J6EEWLAJqYxMfWcb65N
	ZkH2ykJ/oSZuFR80kRnOAEQWaeNJ+rELypfQjr5Ozjdpun5XCHLjfVYkL4PWjD5OdG2H+MjwPXD
	sU4qxSsu4LB1HMmZLgVk5h32UwjHiZshzEaHSAwfviJ1M8uvIYd2oYdd/Y0DPEMdE1QlYlLTMFA
	ACWhLdsKvrlUWqlKMyny7AaJteXRThh7NGnIs5Xc879KDei40ItsLmzOC3ff+BblvHoW05yA7zZ
	q053yKsYcZPDFbX7umNSwsz5P2PoQ5l3h6RsEJX9FKKBab5DGKrr8biiZddQlGVu0mdNvabaZe6
	7Nlhv9refxo35mGtnkhRSEbhcU4+gbXReddCFcdNvqdUQpD5cV94pl0iGsuPhS9nwRfvIbuAd0d
	8eeUMSM3rqi
X-Received: by 2002:a05:600c:4e48:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-48727d73c26mr119842945e9.9.1774717454369;
        Sat, 28 Mar 2026 10:04:14 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b105sm331466875e9.1.2026.03.28.10.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:04:14 -0700 (PDT)
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
Date: Sat, 28 Mar 2026 17:04:11 +0000
Message-ID: <20260328170411.186973-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328151452.148901-1-devnexen@gmail.co>
References: <20260328151452.148901-1-devnexen@gmail.co>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57463-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DDCE834F40A
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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


