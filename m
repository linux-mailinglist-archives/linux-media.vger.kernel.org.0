Return-Path: <linux-media+bounces-66080-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qh1iFje4Q2r8fgoAu9opvQ
	(envelope-from <linux-media+bounces-66080-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:36:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 158556E439B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:36:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="JH7z/JTe";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66080-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66080-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5210430917D8
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8F740DFB6;
	Tue, 30 Jun 2026 12:35:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F240757B
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:35:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822908; cv=none; b=lhubn119tlUnIkqZyZ/2kvoDtVX4gUw199/6XEkiN2NJAymLhgXsXoODczrhxuPyKLOnLYpp2IX6MP8ULpJl6li1Kvic0gaaOIa4CyJzGgCxU1aYFCmVqDkUms1L2xh+NseeRclYbw2hhiglOMr30QCdc7XeZc+epLYN0kUBGGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822908; c=relaxed/simple;
	bh=No2sIlthlFWFvymrSQXDt4GgnEeZ4l43hpMMLetr2Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQQcpDq7IqyRRELdATlght96aSEugCsFhMVMfXHafblUjTy/IkstlPL0X77dGVllwra9ajoaebQMrwFdxP2yh9kaKyiV2uROS2UnviJ0cABRuDCegU/dgx1oX6NnWWPdmlZnK/e3eSSQVDjY/j3uBaSujzCRZB1JEnc+LQBxqDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JH7z/JTe; arc=none smtp.client-ip=74.125.82.45
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13986d61b4fso6214767c88.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782822906; x=1783427706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dpeFXhV4Pw0wk1JPopUpgr4/oRK7CGjNZ/FePo/8uZw=;
        b=JH7z/JTe0rUaRyQ1bOCZ622hpQ6LOh0r902DWHkbsgunqy6l719QV52abjXszberhh
         fZQC93Dq8ohQms0/ib0h55a5Cp/FuVcwoPUxJFeyk3tPqyPA3amSABpTTz20yjWyq+Og
         j7cLUOUtMHSDQl6+cqMgKKDsT1DzZehmQ+YxySnd/hoXL4u7Mm6HkoNak7Wtf4cak8A5
         zAIjE8HWHxBBdTHmBXWoUXH3fwvF13YvPGM0EaSa5DWbLXqzYX0/Nu8QmEq4J0gmWkJm
         /CemQH/DCc1KX56ZYt4CKf2UO8qkgc7Smp280HU/YKEYxNBGpbjgpm1PAg0DTrslBldl
         y/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822906; x=1783427706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpeFXhV4Pw0wk1JPopUpgr4/oRK7CGjNZ/FePo/8uZw=;
        b=cii/Yan8264ok56pT/FGPC6R7TPMeZWckRXedi9hdnSZDTaBuv5Qf+Hc9OThW2GBoi
         +vQpX+rmeUDwCu7xWJzmo/DJOgC6naiIbSX+jiIZVpOxSB3W6yauG9tA1qhUBC2UF3rH
         a0VOY98CuGFzoVeDLwaGaHjeZr1GFeBB3IYuVHD3COCaC3sJ1DQG5yT+Yo8e7/BXhu74
         VarMqOKu7jRMaMSlx1ud/2JRKV/OO2R/gFC7JrpOZLuhIoPzZc7LS03GJCMfEyBusWQK
         FZhM9o3q9ZKbkcGrkMrClMvRliixWsdZaAY2vcY/wfnmJh8ecnFeoJakPXRWqvSs9wYJ
         4eoA==
X-Forwarded-Encrypted: i=1; AHgh+RrSSnNauCw3o3NYZXg9f4NpaFEtnFRq2+d0vJ1DinJgWEGEKUJ9ngVGmX1w9jOdVJCgvRSRk0Wc/31qhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztAZmIgSFA/cjF62ULnMGJ4bH+m/a7U9p24SXVNOt08bFnUaY9
	F/vG7kQ120lc6ecZnmSIMkpIv5qGQ03pPavIIRZy7c0MQL8D/n6fjHPO
X-Gm-Gg: AfdE7ckPQ72EOG9bgU0y8JVCULwrID/4zjZe8Hd3TRkiB5JsMlzHgiEFtCKEVdnGGh4
	IH66oCxx9PYVb31vRRIgmj857/5dq2qomWHOyEMzOMKz6OrfgHCtZyv+Z5+z8mNuIujgXgtJMjQ
	04kh6P1dfXFnZZLRgVYTjrT+TI+Lv+999i9T6O85ykJgbvnpK/dgidgpkEcU0y6bXzDnNTneQTe
	7VvvBsucu1BSXlLcCqSmPnpjAaTE3oLX2EctKY+OjLrwhSp4Ep+GwyPrsxAHJqRaDOBSVICEp/u
	8vscANxuZyIQQWH7R5SH1dkUpEpkGv72paBEkr4i9ZJHdbah06xN6CHO8W8hcXKKyLfuyNBMfaU
	OuKeMNwAWPdRgoHoaytfgJvbTOoxR/853/uw4EJgSejtUXmg6YXiwZtTZCRHs9A0KXcY2JNICbZ
	JnFZKCSHQp1UjXxj6Nvw==
X-Received: by 2002:a05:7300:724d:b0:30e:d6ca:61a2 with SMTP id 5a478bee46e88-30ef09f6f70mr235729eec.35.1782822905746;
        Tue, 30 Jun 2026 05:35:05 -0700 (PDT)
Received: from ahmi-PC.. ([2401:4900:88f6:ed7a:33b0:ccdb:e58a:b126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee327cea7sm8743218eec.31.2026.06.30.05.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:35:05 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH] media: pisp_be: Propagate platform_get_irq() errors
Date: Tue, 30 Jun 2026 18:04:52 +0530
Message-ID: <20260630123452.14226-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[raspberrypi.com,kernel.org,broadcom.com,vger.kernel.org,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66080-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ahmisaranrao@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ahmisaranrao@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmisaranrao@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 158556E439B

platform_get_irq() returns a non-zero IRQ number on success and a
negative error code on failure. The driver currently returns -EINVAL
for all failures, which loses useful errors such as -EPROBE_DEFER.

Return the error from platform_get_irq() directly.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index d60d92d2ffa1..06644d10ace0 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1703,8 +1703,8 @@ static int pispbe_probe(struct platform_device *pdev)
 	}
 
 	pispbe->irq = platform_get_irq(pdev, 0);
-	if (pispbe->irq <= 0)
-		return -EINVAL;
+	if (pispbe->irq < 0)
+		return pispbe->irq;
 
 	ret = devm_request_irq(&pdev->dev, pispbe->irq, pispbe_isr, 0,
 			       PISPBE_NAME, pispbe);
-- 
2.43.0


