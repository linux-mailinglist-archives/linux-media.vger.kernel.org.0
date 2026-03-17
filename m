Return-Path: <linux-media+bounces-56112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP0MOwqVuWkJKwIAu9opvQ
	(envelope-from <linux-media+bounces-56112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:53:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9252B04D6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98F9332155F9
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99A733290F;
	Tue, 17 Mar 2026 17:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hm7iApr6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F8B3624BF
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768125; cv=none; b=KOtxSJA83H/ugnzsyhNkChtdF/0lfcoi1I15PYGXp3ivgpGFFDDoG3NQ9Ci0H0yJ7H1AkGdUJxuyUUnyKVMRoa3BOynihNUV4514/c6asHxsBLefzmVg06mW9jl5wWr6xEz7uPppi7YF3OI2LOvZEuOT3OfdclNDfCMF82C53Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768125; c=relaxed/simple;
	bh=kVu8V0tfTcg7/zwXLEA72sf21oRs9Dazt9SBXJYxuoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=efXggiG5Am3g91BfQEDoAOcuOxIlcUKkWf/a7T3BlOQIvr+HXJ4aMlWSbugPl7l6RQjWXgJyCmEgVajVSj9nVvd+U8jt99Cp7ZBgyDWMWGR6WcZZQtQ//pn9eJS8/I9E6yrxAeNHofOPgDIkGOptHh0AFyVvtNS4h62rnDQwojM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hm7iApr6; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c73e9e4cdf7so1959935a12.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768123; x=1774372923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLDFnLZxZRt9r2soPVpOYTQmBDwc/HqSXqOmk7Ap7oQ=;
        b=hm7iApr6Ab8XIXI74I2lwFP9ZgVmbOLmugWlw/BHt7p84hwJWL4Nc1uCI8GwihX2bA
         rVGVk26UnbStgyn+FrWDFvIaJzIRvHBWQD71p9yJFsOLUFTm6AG5F95NLO6kPe0VGyiM
         h+nxi1WCpixB1cZCi8lWK1lLT6Jxj1/pAi96MRPqjMo97KkXG3N1prv8yjPN2uzER37D
         Cx/hWo2vxHYXiLiA8xqiLjvwg8r304m+jy+o6vcVMG0myJ2q4vS4W82FcQ1Mjd+GpZnp
         Sxo1t+gZ/l26bH5uFO2VnNw1hF4o49SEnuhiL/CKHFpSve9ZMD5CBHgDzezHicUGAfra
         nGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768123; x=1774372923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HLDFnLZxZRt9r2soPVpOYTQmBDwc/HqSXqOmk7Ap7oQ=;
        b=JGcQ48cgZLlRxBwcfhYNFjWTVQmyaRu/W5Gp0auYMD7Sb950HvihHw+1hQc9+SnPKH
         +JDJSeWXVqaYkBp7OEUfO6s2EQzKrSYYGq+2koArJrFf76bsqz0Qti0YC40IiUGWgmZv
         lY+KNXJjS14UmyfqRALAjsE+sVkmasciX3y+Pv6mSr4T1QxT111kTXnEdpli16I/OxQo
         Du6GYZBVhd/6Xx+Ip6eHWXyK45BIy60pVF2xwtQtFiDFma+rbYhrTQSkl0iCu1S7QI2S
         Wy2ltS0O7F0iqS0I/s1aW936uZlf3CdtbUbxmEmvYUk9kfGL0bnJ6Nnd/UjmHn3gI/1j
         e8zA==
X-Gm-Message-State: AOJu0YxEYV9AW/aJBTZXy4fI5g+kWV5T8YT3nvoD4mTtiYHOtpIPAFw3
	bbGZhevXnebvuNCpFhHWKHh3gxGocDeUGnBLOkXYFXPPSBNFJ175ktdp
X-Gm-Gg: ATEYQzwYX1T8iFD7Rip+ZFxyvyKZJiHrKRvqfgJfMPxiCURuSd667Tq8U9Vgvt9gl2m
	J3hLs37/MmuT/9CwMxGv7mnHKmae1Uxg5AWK6N+pRibB3GUYFRlhzmHwkRYogLBxQ1Qovz9xJH5
	Hh+k2gl9yGzZKxT3i1Oeg/RI1VgEcVAaFiJDM/s4wdM1DNR2zHpbfrnm4Hp3Npb16C56L+sgifQ
	LfhcPfrjsJRd1xagA0biFr0GvNNz0zbQVvdK3+z9bvzO6aQKB4G3s1X53e4r9lsRkt2oswmiAYo
	ivIwqY+r4BG/9PqQdPkHvFsO33t+UuizXpzQmIw7Dq7RbexjrnjFRv4O/4vWnJEkQGx5obpUFjt
	NXEvKz9Fmly9nVFvuVC21FYRXeNZSeLnoZr77ZG1UpwKeY6WfgeclOZvUaC6ujdYD3P5aajZ9Jh
	B2pKt/l4eKHeTiCDSHMnS+6dCcp5Ati7uypgTs
X-Received: by 2002:a17:903:37c6:b0:2ae:7f28:124b with SMTP id d9443c01a7336-2b06e3554d7mr3267585ad.22.1773768122890;
        Tue, 17 Mar 2026 10:22:02 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e608a66sm934825ad.61.2026.03.17.10.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:22:02 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 18 Mar 2026 01:21:54 +0800
Subject: [PATCH 2/3] media: ti: vpe: Fix the error code of
 devm_request_irq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-vip-v1-2-5fdcdbd01829@gmail.com>
References: <20260318-vip-v1-0-5fdcdbd01829@gmail.com>
In-Reply-To: <20260318-vip-v1-0-5fdcdbd01829@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dale Farnsworth <dale@farnsworth.org>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sukrut Bellary <sbellary@baylibre.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773768115; l=835;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=kVu8V0tfTcg7/zwXLEA72sf21oRs9Dazt9SBXJYxuoQ=;
 b=iXIrjXBvrbpwa9s2w0WekxDWtpXwn1zCtfyIBLBNyHBMzbeY7e+k6mPDVZpO6Di45r/YcqWCj
 QQrTikep7DhCLjsPAHNfz4H3QtpzQkgdUaYFmISFArnRqIpo1BEa1R5
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56112-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D9252B04D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Return the actual error code from devm_request_irq() instead of
incorrectly returning -ENOMEM.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/media/platform/ti/vpe/vip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index 01d27769cd10..f0354b52048e 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -3472,7 +3472,7 @@ static int vip_probe_slice(struct platform_device *pdev, int slice)
 	ret = devm_request_irq(&pdev->dev, dev->irq, vip_irq,
 			       0, VIP_MODULE_NAME, dev);
 	if (ret < 0)
-		return -ENOMEM;
+		return ret;
 
 	spin_lock_init(&dev->slock);
 	mutex_init(&dev->mutex);

-- 
2.43.0


