Return-Path: <linux-media+bounces-63755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NmTxML0pIWq4/wAAu9opvQ
	(envelope-from <linux-media+bounces-63755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 09:31:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1EF63DA45
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 09:31:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JJSXRrni;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63755-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63755-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4ACF306048A
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 07:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0856D397E8D;
	Thu,  4 Jun 2026 07:28:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8AB3BE17E
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 07:28:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558126; cv=none; b=uYAaij3Je0wSB1rcjc9bQltYgmOTC6l5Zw090DjX7qbXM3yKzlGGhw+TgVTRU5m93wKKRqZNspLvQEAjlJIsb0Rvlon8GYJqzvNtXqcZJY5h6NSDrscDuwvceKoPU9h+C5Tq0Qy4ELp3qZDljAu63hEcqfS6bXuhIN/XVPvusWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558126; c=relaxed/simple;
	bh=vEj8EI5oExPm7tMbsZS/Ju8S071XB3QnI2EedtVwxa0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bAUGYZIwlF5EfOsmd9OTxjHsjr+6M4GGdQl0G/z4tCG0FbW0O0o3naV6EeR5yTsIRYvb111IVFr6UlKLxGy6Oso80/KuEL9kOSCgdcPNPqPGMCRwFIWZgVD7MYI27kjQ3O2NpmYdJHx0LGdQI/7goE2LuH5yRssNnJr2hlLUx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJSXRrni; arc=none smtp.client-ip=74.125.82.194
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-304545f5206so443347eec.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 00:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780558124; x=1781162924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUjaUGFNcoZHdC3YZeiMHCy05kdsPltvsJJXov2Ftec=;
        b=JJSXRrniQd7Xp1fx6hze/t/bk2uZ6xnRSlNTRU1EiAT283ysYfAF+D0xckGmTrOzkP
         eXb1V5Qm2S1P8s6LV8bWAANThiJGPBSRvwYgJsN01SBj74Lnbu2Bc/xhMhvwgq+yyVu2
         K/4V7o6WuaDN0OFhNdYYMegdnW7cra6wO9/1gJ1tVDJLjD6HBN64rfTR5Qaig9+LVpZr
         k0HUsFY3cwd7RAApzdBT5gcZOCnO21o1RtzAcdLxbRAr+ZMAbgQ7xa21KK1mlec6uPal
         WycN5f1MtQ6xtGEQAiOcAcS+M3QFuoQjx8bdMJG/i4Nqs32aD0KW+ImWkbqsrzaSTqvN
         UGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780558124; x=1781162924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUjaUGFNcoZHdC3YZeiMHCy05kdsPltvsJJXov2Ftec=;
        b=eDnEcWes+XHHo2WfiAkJB1wNPURNpHCgHjAMZol1zsCi46PkaE1kExIzv0n7T8Sf1l
         0uoisR/GNbQYIaIYp0BvfUp/WW1+thDij1q1SEfwYW55WQ6c8IrG/mx1KIBCl6Tba+bi
         /h+ZZAfuDm2h0T2A3vG2eBfqyHeX/V/+wmd253Y7wE3nmjomSLedsENf5exfx5EI9QM0
         p7ZmcTUq1OESMCg//mPaBZdvYAIsiNziXGRUquzDaWgZ1EKRIZtzZ9fN0zfc2j58VNAt
         mETOcjpM1Rrm3JPrBvXrwTZl3ZcUw3UopWrw2cU3Md2izlULTTcWp2n1icwAjGahaW+0
         p8og==
X-Forwarded-Encrypted: i=1; AFNElJ/REurWBbaOLKbVYMMfrQIfVcM1UX3g9+LO8qaH+oLJ0fZiI+lkCy1i/wcBul4jiiOgN/6jNN7jramg7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIUmnfKLvzPpMJPyS96znO+R1aHPWof4RlVSPUor2SGcuTSS/0
	Duek1hCUvjErMnZx7Ww4+YuZ0VCMjf76S6b70RyrdIYomdjPxGh1SQ17P8Fn2EXa
X-Gm-Gg: Acq92OG9DiJAOSrbC94qRMNdJmW/mVg+ND48UhfVgkSoqRV+3cLAtUJs+qCmhCmZuXX
	sfM+LLGLCCe0DA7NCM6nNY+KVQ5pZpT3hPzEfg23gmxyra8Lg/bQlKBCCcIJMAhdftEnsQNNEJ2
	YqfkCwQ7+i3JGKNwAEyUJu0LtHTMYfisCpoOf8QXeCuicKOIpTzyTbxSbNIhGcPb6Ft0mLSofRs
	D+H2scklqH6MR6xZPMH4fCawNhroHgCDkM9y7dSZbXFrbdUbp9LBim7iuzVnLe8VeABvLQCgOAX
	0deSTzbb7uZHVQJBOUBwo+nWX6U1BBxK9gScz/ehSvYUmkKK9uJJNok7XF0M76+L1p5UGkSmvIs
	Fayf7peIhdcjedlO5LpE5XQ/Wyn+4tr5NndQ0AEYR0pN9lGONIk1SUhhKsCxtoQyKjEd08XfVKw
	wQ0W0ZjKYMVmz4CXB7QYsVYvJrb5MTU6ZpxmdAnOu4KZ3nnsofPzd7WQ7TDsMD4Kxifg==
X-Received: by 2002:a05:7301:6787:b0:303:a1af:5042 with SMTP id 5a478bee46e88-3074f703362mr4245372eec.0.1780558124494;
        Thu, 04 Jun 2026 00:28:44 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db55f60sm5797164eec.6.2026.06.04.00.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:28:44 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] media: qcom: iris: guard IRQ handler with runtime PM check
Date: Thu,  4 Jun 2026 07:28:24 +0000
Message-Id: <20260604072824.45448-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63755-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D1EF63DA45

Use pm_runtime_get_if_active() before accessing hardware
registers in the threaded IRQ handler. Skip interrupt processing
when the device is not active.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
- Use pm_runtime_get_if_active() instead of pm_runtime_get_if_in_use()
- Handle negative runtime PM return values correctly
- Return IRQ_NONE when interrupt processing is skipped

 drivers/media/platform/qcom/iris/iris_hfi_common.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 621c66593d88..1c05f83986fe 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -100,10 +100,17 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
 irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 {
 	struct iris_core *core = data;
+	int ret;
 
 	if (!core)
 		return IRQ_NONE;
 
+	ret = pm_runtime_get_if_active(core->dev);
+	if (ret <= 0) {
+		enable_irq(irq);
+		return IRQ_NONE;
+	}
+
 	mutex_lock(&core->lock);
 	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
@@ -111,6 +118,8 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 
 	core->hfi_response_ops->hfi_response_handler(core);
 
+	pm_runtime_put_autosuspend(core->dev);
+
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		enable_irq(irq);
 
-- 
2.34.1


