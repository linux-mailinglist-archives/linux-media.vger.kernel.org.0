Return-Path: <linux-media+bounces-64372-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kRiVKDcQKWoBPwMAu9opvQ
	(envelope-from <linux-media+bounces-64372-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:20:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B16C4666949
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:20:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=lxoC9Ba5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64372-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64372-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3F0C3190B40
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 07:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2CD386556;
	Wed, 10 Jun 2026 07:12:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585743839AF;
	Wed, 10 Jun 2026 07:12:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075539; cv=none; b=WEwZsvgvtKXrc38Is7PyLYhrjT83ruFECQYrDo5SQHGwUJfLKX10QOYJUBUxFN+ck+0snE/TfYjJPXmAFJysjYeGgY6Eu2+/nuHeQKDpu3aJTGWQg4+vsljkJ7LH695SKcKLOBIsWtyXxUaJZ0uMb80AlKEM4NFr+QV5/SODyaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075539; c=relaxed/simple;
	bh=Va/x2fqxUYV30kGVCxqH/tEstcHoycOGRwN8DJNv7CQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bdxtp2Z4M0VtvHF5OteP2aPFMQeNPikv4qP0G5qkEOQIuZXbq9LqOdPQLsRCxFHZ7Px1GK48cYHdRLJwD/NSMdoQcnkC+ufgIeg5RZH5sG9ZuRgp3VZOJwQTPt5Gfgpm3r8lJ/qDPQuW15ZxhmggVWd4GVVj3bfuNE72ubJmUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=lxoC9Ba5; arc=none smtp.client-ip=54.204.34.129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781075482;
	bh=Lz7tRcHhsQMSOJADDW7TXRw2/HZdu+zrYPBgdVPaoJ0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=lxoC9Ba5gdZVCGgoP21Tk4kTElzw7kh8mZhoCWjlZADl69kDfRwrG8DfQUD2NNoxZ
	 TWkQ/JfLg5gPy07a0bsCWaAbhlEIadlrOp54vUlcJEoGE0pYJdbMXwUCqMu3M8iCoM
	 dQg9VyytfZGnabcTS4oq8zE65SXW6VXXmUUq0DWE=
X-QQ-mid: esmtpsz20t1781075463tdf94633b
X-QQ-Originating-IP: u7bnKZCN2RIVwN7K432cgmAtncJafcjvuAwIW4UI9ss=
Received: from localhost.localdomain ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Jun 2026 15:11:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18434185685029258688
EX-QQ-RecipientCnt: 11
From: ZhaoJinming <zhaojinming@uniontech.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	ZhaoJinming <zhaojinming@uniontech.com>,
	stable@vger.kernel.org
Subject: [PATCH v6 2/2] accel/rocket: Fix iommu_group leak and unsafe IRQ register access
Date: Wed, 10 Jun 2026 15:10:45 +0800
Message-Id: <20260610071045.3414828-2-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260610071045.3414828-1-zhaojinming@uniontech.com>
References: <20260610061915.1CA281F00893@smtp.kernel.org>
 <20260610071045.3414828-1-zhaojinming@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NRaYAQcThOfQHS/M6CWXU1r/FUxQh0b6LxZ09Zc3ZxGh05Mzzmcp16ME
	tw3CHItjPoiD/3EYQHqYiuzdEdLnkneXhPuvv1xn9DhKn9ezirxBhdb0tBy9n3rXPaH+/FR
	AHjKoOi2gFpasAn/s1MrE+ExYqgyX8RqNFTNoLya6u2ebW4FdTjSdv9NpUvj3IGzHxgPk3m
	wX9YawW9y+N8HgS64TRhD4eeVwR5mZSdDefEoKUPu+If/KYfsIOCEUBbbBQ65NA5sdPCnQ3
	hGu6xJo5kZLIhLuBWnQh8jCwxS5Yt5QBBhFBiPuPVsbq3txBNe7Pltwqgqr2YYTFsXCSMGy
	5PYgztGJXSXciFa8pVL9WxmngHKCoE1f1Zau/gJy3pj41YlM4XVMa9Ksj5SGHLjGAvXOcXs
	yEav71TcBoOGR2D/Rww9c+X3H4UdnO3F6OeZY2HUgv4hPxV6av3F+EyA/G9zIIYVvy94b9n
	LU8Y5vY0MRWtjLiZwMNo91bUXAeE2SBzWwTJpDSUkt1wi3pDgEB0OMxvbdMqTXmhpIXfQoa
	N15PBAuy3JALOkfnth5Va/rwHH8+6fUgoscePceIcpGitIglYPPbLEG9LBCrgyAwd6RxAVn
	qjZT9Vkn892aTVmfvy/1DRR9Z662ngIAA2nmumCKuvKNWvu82PSEJe4fksrdONuDFTN1GIL
	+5GBv4RVMlbJ3AeUN78UAjZlp8bOKLDiGLTSPnM8bEcD+7ghTYPJ7O/1qz7Rc40kcY6jGIJ
	Wnwh46+DpveLuYYSClYEAHTS+s236maKXlMfCG+rDT+qfxJQnqCAydSu2ZnvzyL4cVKNvNe
	I+U61TNedif0/WutKQjAYsYdRxX1KwuKpaEaOPHuoXOUHacNmlf4VudLi6Uk8FayV87SjuT
	b9LTHZkLk1J+MFlz0fjdn9vRSwGeRJNorZpAJmr0yHWPoXRazM1srfnszDgiUm1DuIfL2ir
	iMHY9C8+/2hVJP8oZOuYWyrQA+Rq/58x3HGqdCNI6VqYTCc8sYWq+1LTLY5wZ/ExSW/rXHn
	8FzdCvFKYCLIHmS/W73Ymr1ae205QzKL9iAIVDQbW2KT6etzbafoRTeZzxl/e8iVf7dYUcF
	NlZoc2ewBHpnpm60X5b/asSZw0+ZEpJinL9gG4xmQtbnPO+RDmA3nP78a+Qzf6/jYGO2FxJ
	0Fv3kENyyw0h44A2Be+upcDR4g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64372-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jeff.hugo@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:zhaojinming@uniontech.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zhaojinming@uniontech.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhaojinming@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B16C4666949

Two bugs in the IRQ handling path:

1) iommu_group reference leak in rocket_job_handle_irq():
   iommu_group_get() increments the reference count but the returned
   pointer is passed directly to iommu_detach_group() which does not
   consume it. Since this runs on every completed job, the reference
   count accumulates and prevents the group from being freed. Use
   core->iommu_group instead, consistent with rocket_reset().

2) Unsafe hardware register access in shared IRQ handler:
   rocket_job_irq_handler() is registered with IRQF_SHARED but accesses
   hardware registers without checking runtime PM status. If another
   device on the same IRQ line triggers an interrupt while the NPU is
   suspended, register reads return 0xffffffff, spuriously triggering
   WARN_ON macros and falsely returning IRQ_WAKE_THREAD.

   Add pm_runtime_get_if_active() in the hardirq handler to atomically
   verify the device is active before accessing registers. Each handler
   (hardirq and threaded) independently acquires and releases its own
   runtime PM reference to avoid coalescing-related leaks when the
   IRQ core coalesces multiple wakeups into a single thread execution.

Cc: stable@vger.kernel.org
Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/accel/rocket/rocket_job.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index e8a073e22ac2..334bf01c3382 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -349,7 +349,7 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 				return;
 			}
 
-			iommu_detach_group(NULL, iommu_group_get(core->dev));
+			iommu_detach_group(NULL, core->iommu_group);
 			dma_fence_signal(core->in_flight_job->done_fence);
 			pm_runtime_put_autosuspend(core->dev);
 			core->in_flight_job = NULL;
@@ -420,7 +420,10 @@ static irqreturn_t rocket_job_irq_handler_thread(int irq, void *data)
 {
 	struct rocket_core *core = data;
 
-	rocket_job_handle_irq(core);
+	if (pm_runtime_get_if_active(core->dev) == 1) {
+		rocket_job_handle_irq(core);
+		pm_runtime_put(core->dev);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -428,16 +431,28 @@ static irqreturn_t rocket_job_irq_handler_thread(int irq, void *data)
 static irqreturn_t rocket_job_irq_handler(int irq, void *data)
 {
 	struct rocket_core *core = data;
-	u32 raw_status = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
+	u32 raw_status;
+	int ret;
+
+	ret = pm_runtime_get_if_active(core->dev);
+	if (ret == 0)
+		return IRQ_NONE;
+
+	raw_status = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
 
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR);
 
 	if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
-	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
+	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1)) {
+		if (ret > 0)
+			pm_runtime_put(core->dev);
 		return IRQ_NONE;
+	}
 
 	rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
+	if (ret > 0)
+		pm_runtime_put(core->dev);
 
 	return IRQ_WAKE_THREAD;
 }
-- 
2.20.1


