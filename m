Return-Path: <linux-media+bounces-66427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FzIEMilfR2rUXAAAu9opvQ
	(envelope-from <linux-media+bounces-66427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 09:05:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD06FF60E
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 09:05:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gHrPMxOE;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66427-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66427-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A20430A3E3C
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 07:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B17C38A729;
	Fri,  3 Jul 2026 07:00:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E44B389E02
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 07:00:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062038; cv=none; b=ZD4JfWEm5N3MJbztAroMRGIIKfJRmAjz2/7PZPyzroqfy/1pCTo24Rtkoa0KZgd58LwU7rLkfw0a6k+282MNfcc9OBGz8autDJXB84Bp70eD4DkZ9asNziG1pVK9agW8PxhAcmTRQJ69bGWrrbBmKOhQ1Cl1cCoeOdypmnFfzoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062038; c=relaxed/simple;
	bh=L9y5DexQuv03jYtpVOCSzo0lgkhaQ1mN9x0A1nQHY4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAKw2YYTL1ePzNSbAGKHSJg2Z6+awMXzSNffKgEx0nQ1HeoVgbctLp1KiGhewdA1LavYBQDVw3q/OQjv+A3cJ5uS89Sl6Nqu765JR6y/Yb+gLCuqbKVLvxZRCG5mha9gF7w0kQc2HXKZWT6nT3FEvrR+H0qsmVNgdiNdL+07Wsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHrPMxOE; arc=none smtp.client-ip=209.85.128.170
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8051ad12d23so2063727b3.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 00:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783062036; x=1783666836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IC/42R9bZxiRClrabOvKrVxjZUD+ryPvf4G6MHzrl48=;
        b=gHrPMxOEfm54dEmbkdieYVybodpPa4tvvYuGY0kc+tm/KqOqBH0iDC905RhMeiIBF2
         X6+Iwni7SCYbPBIgRwXrpiaoK6WQhw+vm0N3Ubv1rZrjztBUzPNBGQnOu+YyYovLU033
         6tfAilaWtKTktOXRM8FgKAMHgxCP06/H7eTRcAw0CmC8YETJLRBhW27l5rZ+t1B45/7/
         RupQp9h8GMeSefZRKTlf0PY34S637DvrZXuSCuzXmY7jX9vKy7tQcDKY/qa9B9+EQnor
         xqepjWzrPAlYbGN8f5OWDnhkGRC+hHFsplN3FeNgpJEviYkQfrZaNoV9h+FIzCQK17/Y
         D3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062036; x=1783666836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IC/42R9bZxiRClrabOvKrVxjZUD+ryPvf4G6MHzrl48=;
        b=Emqqo+C0viGA46BEp7ans2COw9jEifpI9H45Rf7vfE77JSB8uhSlAmPOqp3Eeiws3f
         oySkQk8PL4Ke/y7HV2dhJbYBMZ+3aigXC2mUKSpmlopvoeSsC+yyU6B7XLXU87nGuLK8
         fJSBrkMXLnwK2/t3eS2uSPi8g8+cMcslRdDEd5ghRsFpvz6LI8VPYtg/UV20Ru7Iorpv
         qY659HPR/O1B2dm+k2CQEbf11nzjsLTWCpmS+uCTzkfC/1p/oiLJ4GVVTzvOCON47TAp
         Qd0CgDTswMDCyH+xEohrXL8x+ZS2g5AhCOyFXC1zk8o40SIoRKTTBLblDiaoV+zV8bKr
         PkQA==
X-Gm-Message-State: AOJu0YyNVOz4GeOpcxAR639QQLOWGsxoMhKU1Lcizynn0g7WO1N4PPoM
	Kz4utdAlEcMmnQxAk9oM8tomxxiduY3/SbPzz4AywPYoloNcbgTFjq8UOob7FLI1
X-Gm-Gg: AfdE7cn5/br9q0rUxepOjcQdgEqE9pIeb0OTLdfPxIz4Ohh/yM2i4nCj3QbnkCYWors
	hhO5dr0ZWaYhUgaEbEuoxcpLSGfcpkk3q1RT9Phw7ixVB2QOZe8MOWoKzUpsZmarp0ZAY6AwCK6
	3rNFTa+C7154AguoffHCPX0bg+SUiCY3POxZvEGIbdlO0ppyQGe0XC6MwKTlpiA4Vq93BJ1pvPe
	bOluX7MBhPxWmEkE8HtZmHIVQaUO4wX18hH8rEJ11Km19hfQl4K+qQaq9G6smxhqVpux3GCspHL
	6I2YqaSqz+qz7iWpL5jQ9GRXxz0vZjGX1OnuI1/W8xjXoFyF5VGBg2o43s5gESR1Vw0jOIu+di6
	4G8t/btUHFyqWxa/I6bEteSc26+rRbAiJGDNMzXs4O/6Hse3dmGSLCcMEPWDw+2RYNV4lXg/kvl
	PuXYEPzixfs//9/Rtg6rtYnT3Y3O0XxV00aHXIqKc=
X-Received: by 2002:a05:690c:317:b0:80d:6405:d201 with SMTP id 00721157ae682-8138a891225mr84683267b3.36.1783062035952;
        Fri, 03 Jul 2026 00:00:35 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b631ff5sm21252157b3.36.2026.07.03.00.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:00:34 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Shreeya Patel <shreeya.patel@collabora.com>,
	Dingxian Wen <shawn.wen@rock-chips.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] media: synopsys: hdmirx: use request_any_context_irq() for 5V detection IRQ
Date: Fri,  3 Jul 2026 10:00:29 +0300
Message-ID: <20260703070029.1762457-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,rock-chips.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66427-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:dmitry.osipenko@collabora.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:shreeya.patel@collabora.com,m:shawn.wen@rock-chips.com,m:eagle.alexander923@gmail.com,m:eaglealexander923@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20DD06FF60E

Replace devm_request_irq() with devm_request_any_context_irq()
for the 5V detection interrupt handler. This allows the kernel
to choose the appropriate execution context (hardirq or threaded)
depending on the underlying interrupt controller. On some platforms,
the interrupt may be nested or require a threaded handler, and
using the fixed hardirq version can cause probe failures.
Switching to the more flexible function improves driver portability
without affecting functionality.

Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 4c8957505a50..fa9818705f42 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2609,10 +2609,11 @@ static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
 	irq_set_status_flags(irq, IRQ_NOAUTOEN);
 
 	hdmirx_dev->det_irq = irq;
-	ret = devm_request_irq(dev, irq, hdmirx_5v_det_irq_handler,
-			       IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
-			       "rk_hdmirx-5v", hdmirx_dev);
-	if (ret) {
+	ret = devm_request_any_context_irq(dev, irq, hdmirx_5v_det_irq_handler,
+					   IRQF_TRIGGER_FALLING |
+					   IRQF_TRIGGER_RISING,
+					   "rk_hdmirx-5v", hdmirx_dev);
+	if (ret < 0) {
 		dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
 		return ret;
 	}
-- 
2.52.0


