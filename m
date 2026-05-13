Return-Path: <linux-media+bounces-61332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO9/KC4kBGoZEwIAu9opvQ
	(envelope-from <linux-media+bounces-61332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:11:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4D152E720
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05F8D3036C38
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D20138B130;
	Wed, 13 May 2026 07:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkqUwRsc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1A3D413F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656285; cv=none; b=GcMb490HjDd3ezMRhi+F9jdQ+2RrwFbktfveE71oHnzUxM17G2AiMLvSrzxLWvn+ypPSeMippbjeF20A6OYZRGi2je8VXvmGyGlIXv2ZEVk5TvoUX/LBmJPzlqfDnwPq12nDxw9qMrDPnzyiyf+o2uSmzM9mNpv9gAZYMlcznaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656285; c=relaxed/simple;
	bh=h207wMrvvV1Ldhg9nEqnfEuJuI1hYIKUwGDHp11u7W0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Td4IpEUbF5XzU+gzNjT3xJLiXWM1SalLSjOTz1GYHtZqePHFlpy+CvzivLUWJrgEVbSoUElrqdZ2Y7OOFJmKmykFjnwOhEnlaUn4XBQAM7IJDlVsZJhupFSHJaID5mG+XQjw9HZ9kIsNdUBlJJ3titir4O8og9fPTJaapw9JPNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkqUwRsc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bcd3ac3307so17239845ad.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656283; x=1779261083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAUm05/737IqhRNlo9FHhqv1K5HUvIKv2GcQLIvOcf0=;
        b=fkqUwRscrIpiH5S4k59HNWP6tdm9p4fhLeZqKE6uwF9QcRdWlPXOlzsKYCqQQi50s6
         cYtGGmgRZ7S2vnArXNH+pAVC2hiO7+xCW8qo25t1bivGduMMsu9KLXMoCMRlY4iyKzvq
         jJ8sgwFtg79lqFWArqsmL+dVcQzRnbXzYZfZsxUWEAdnSTWliY9sOlJV2iY5teS9usig
         9gq+W08qB1vH+tkBDBDz5iHO9qrK9GjWfMGJYkE8BtG06k3dRpk9BMevHmHBH9g0/aVj
         8t0RxuXTYY9s4IlnSm8Mj+VtC8VdTJ0k6O5i+bVfDAL0I7gtGmxLzPW+YEApWbPOh/vi
         GyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656283; x=1779261083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAUm05/737IqhRNlo9FHhqv1K5HUvIKv2GcQLIvOcf0=;
        b=IKc+DP9u3Hm+dXcQI6+8urSy12MMrRvTPdegDInAJejEuPkUgmCDc2YntHcgjB/2Ea
         0SKQQ7l02hG4O3y0I0ChzKsiOsLjAK9AcrSBq40inD6YvQCL4yc0pUaF/AeK4DQ6SISf
         NKkwJwDEGHD0xsPmFCYtN1J2YMLd049Z4lP6JVJQ+qrY3VRjMGu1C6iqNSfd2L++p2na
         sR63nJtb14K3J+vuh7YYNsmhIJuRud1V8IiuQKOX+veEAJFukGCugFTRwXhgW5wi28W1
         oCCE0NKJvc+ru09sMAzMN9kgaE74NAYDGJYFofEGU6uJSiBLANkJziATmka4DDyI2PFb
         njLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eGBaNQhUI3HJKY11UloHZHDUWZGtd7km/2tfCFqkABBaMmplmX21LQMSDHeyc6aOR+rRVtoKTnI9jcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzupD3I1B5p7Q560Sq4zH0IRznIVpARFFfjyZLxuuI/ub5bG85x
	q7BYcIWBjOUIA1DAHoYGc3JyJ7nC0HP4wbsHSC/IHI+DuOCN1IxbPS4=
X-Gm-Gg: Acq92OHOjCb+DUgm1SA4AEGVoaoYLJB8l8jxwfP0aXPFUCLY3bd7+Jn4/RwZGqaIHAE
	NGLfoKuoVrhOndNFdXfmOEqVU2E9kyx2YvVSTrFERVaU/RDJ9F7gfYT6LnffLmpEZS6x8Ji9uih
	gsZaq8jluta4IHiUaO4T9HvPM5EvZkLoYjbif0oNutfnvk3oTlB6/IzHCHU4/xcGAsu2Doz3A2L
	nG8PQZ7bPLb791jHyk8bLvT5kvvtA5wZUJiI2DSO2ZaubPkoogXEqZ9+AnBWayXSMMpa8w/Eny1
	Rprq0bo78WxdI740usD1ExPlSfTNruXxJZeGFeZFvdL/1aU8hYesaqVGDPsOfEraw3CJ8olS41T
	kXfBLy2wdfBqv8kkjoCNhnjDjNH9MWUXyCMjPFyKB+ELohYBU3eRfhzQSdptbmdPHhIXBCmy6di
	reHaBxMGGdvzYJ2WPn3lVJmKV2srMR4QwRR8vWxaIytwJvGzXIc9sr+kX7pfeJYnG454Z1B99nM
	xLjZjvypJbEgah0wo7TW7tgI2vd8ox1BDC3LkU=
X-Received: by 2002:a17:903:1448:b0:2bd:2458:50d4 with SMTP id d9443c01a7336-2bd27706be2mr20525425ad.41.1778656282606;
        Wed, 13 May 2026 00:11:22 -0700 (PDT)
Received: from localhost.localdomain ([211.198.234.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405efsm165677855ad.23.2026.05.13.00.11.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 May 2026 00:11:22 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: rc: sunxi-cir: unregister rc device on probe failure
Date: Wed, 13 May 2026 16:11:03 +0900
Message-ID: <20260424000000.558-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AE4D152E720
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-61332-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Myeonghun Pak <mhun512@gmail.com>

After rc_register_device() succeeds, later probe failures must undo the
registration with rc_unregister_device(). The current error path jumps to
the allocation cleanup label and only calls rc_free_device(), leaving the
rc device registration and resources created by rc_register_device()
behind.

Add a registered-device unwind label for the IRQ lookup, IRQ request, and
hardware initialization failure paths. Keep rc_free_device() for failures
before rc_register_device() succeeds.

Fixes: b4e3e59fb59c ("[media] rc: add sunxi-ir driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/rc/sunxi-cir.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 92ef4e7c6f..cc64a68dfe 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -344,22 +344,26 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->irq = platform_get_irq(pdev, 0);
 	if (ir->irq < 0) {
 		ret = ir->irq;
-		goto exit_free_dev;
+		goto exit_unregister_dev;
 	}
 
 	ret = devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, ir);
 	if (ret) {
 		dev_err(dev, "failed request irq\n");
-		goto exit_free_dev;
+		goto exit_unregister_dev;
 	}
 
 	ret = sunxi_ir_hw_init(dev);
 	if (ret)
-		goto exit_free_dev;
+		goto exit_unregister_dev;
 
 	dev_info(dev, "initialized sunXi IR driver\n");
 	return 0;
 
+exit_unregister_dev:
+	rc_unregister_device(ir->rc);
+	return ret;
+
 exit_free_dev:
 	rc_free_device(ir->rc);
 
-- 
2.50.1

