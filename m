Return-Path: <linux-media+bounces-64350-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lZooCEf+KGpGOgMAu9opvQ
	(envelope-from <linux-media+bounces-64350-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:03:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A446E6660E3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:03:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=Q3vrav3p;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64350-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64350-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7540A307DE25
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 06:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE57372042;
	Wed, 10 Jun 2026 06:03:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99B175A6B;
	Wed, 10 Jun 2026 06:03:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781071392; cv=none; b=eQXxZfSDOtyd/cbeLHRngU/RO5uG1uStnNZcAfq2QUVajA7gYmU10Okg+QPKyo+5wELdmX62EoCFevQKZDYn457AoKyVeoJr46S3hFHI0WyCar+DQEku1SrnXgnwrpKzeFSS8kS2B61fRhAhIXOF/b834ocmOJWqpfKF1V1Gfu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781071392; c=relaxed/simple;
	bh=IQ5qnwT4g2xhg4kqwzMPjxzXKZ1mILqw3i821jwv+gg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZUAYl+OvL3rAD+QvDTKaB7ObUjKcIVVhwtFfJoYuQK62iBSEh3GbCWrFVLMDdG/jwhncnO7g6+4kP/Z4vwXeSeCcfMpyjDXzMyVcrXa71tfCDkhMAJpNA29hMqHP97fcjYkTlA/SuyDGwYdlBDKCwLRpzWsfAZGUlqRTTAGZlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Q3vrav3p; arc=none smtp.client-ip=18.194.254.142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781071331;
	bh=kfi9QQs1sSwBEx+EWPByMHmDQhMKagxQkR72o+z1MxU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Q3vrav3p2K3rIndpoalfPkjR3tbptoQGE0460gBJDktvHpgYr+qwWyMShs6/eayfe
	 cw26sDAS3sO6afKnl4zV6lMEh0jrKn77n2aOh7wDBnxseBn1ZGsGtp1Cw2oYkdzur0
	 jn7OB/NFsbz1qclZw0M8jHY2khqPxg4mNtSKZ/V0=
X-QQ-mid: esmtpsz18t1781071313t87eaabd4
X-QQ-Originating-IP: HzTryzSASr1kVugWO+zDD+LA0POeXIQkgLA7vapCPC0=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Jun 2026 14:01:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4142150529808979720
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
Subject: [PATCH v5 2/2] accel/rocket: Fix iommu_group leak and unsafe IRQ register access
Date: Wed, 10 Jun 2026 14:01:32 +0800
Message-Id: <20260610060132.3239648-2-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260610060132.3239648-1-zhaojinming@uniontech.com>
References: <20260610031431.E8EA71F00893@smtp.kernel.org>
 <20260610060132.3239648-1-zhaojinming@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: N9YbC0BvHDAbkCjuMZ1NwoUZFgpUVUCAqzsRZ3gvum4FTtXf4iU8FymF
	uW53nWRxEkGIJRiQj2mIB/yE2aFbrBGNnVOUCFL3xKpkP2GJC1UhBwjIjwZ/VDqZzcoBdcg
	J0LLr2WIomNApAxfDrOusE54FaOs0+kzDiXyI3S+baCdNgs2JlS29cy54V9+a6NuBo0+BZP
	WWkGa2KnHibtGA/ksmXXk7YGx7iIu1ETVJwk0xhM71sLClBDrcKL1IhiStC0Ljvy54BMKNt
	q0dIqLgREVyBsEEA8QLZAMz4K5pKfSyTb5Bg5xWshzO/4U6o8A5lMQsFekNVxQqmY+qH5ao
	mBOaTii/nbW8L12GJLhF0vUAxINwwQl8bUC6O/jolb3MniSpnyMmaWcGPI3bg3Jy4DsjDxV
	Tlsae97O0XsHwCLqqe9O+JO0nX6Us3ncJFV8txROEjtqnVgCTPVuuY9LfN+nd+L2z+BPb8e
	gtmXpc79vclmjVLq/uaxpW5mAbQAgejSRbDwL6vbR6Q7EWhCDi294ousgGp9neT0rKlVI58
	3AuL57y49fyy6QMy8BRTtVrrUGgsRln/W4U9Dw750hleUDrPNSMHpA7IL8zY2D3PxXkEy+A
	O1jIyVPmuGbl3GvcOuciGx7tDlr+03DBGLbS8vaMOnB8JnzVX+WbJ7qXaycdzIA4WQeUbjU
	/XCB2SG8PjWy2jH2reIIj+wkQ3yjLX46lea9Nfgb27jrz1bH5+hstA6eJ+D9FMjKSjTu7bL
	kYN3mr/7b1wexJggVox3qJFkqPbzKcmKlCPYVu0uNAOy2EBlajBuEr6Fhcb30vxQXbp7elC
	K4C231SkHUf3bsM/yZtdD5xtfigl6C/K5aft2CSCm3+H6BTvO5fweQUIB31Zz8a+Xw6AZwS
	nagmIvDV4wpXVQj7z10nmHndZ7lRB05Z9dO4stLg2DGJ0TPrWPkSU3xuh9HXZt1OOYxhNtc
	AHdImdEmJ8Z5MQWsA/3btrGzi8Gf5FbQxnlXdSmpRNOBH3szPHaapZxnQl2J9+fCYOYmoX5
	pMiL6d6qPb6O+CruXGGxyjQJoX3xysvhsu2uXGP4IHjt6AdPnYOTl7+o3aeADvnwgKDZlQd
	XHyy339WLBJ5NetmdOa/T7RBWrSTzG/Zuh9BarncIH8fPyr7Q5qthNAGDOX6FCdkrBvwDBb
	kWzIWrOZauWAPwk=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64350-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jeff.hugo@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:zhaojinming@uniontech.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zhaojinming@uniontech.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A446E6660E3

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
 drivers/accel/rocket/rocket_job.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index e8a073e22ac2..0ea3b3099704 100644
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
@@ -428,16 +431,24 @@ static irqreturn_t rocket_job_irq_handler_thread(int irq, void *data)
 static irqreturn_t rocket_job_irq_handler(int irq, void *data)
 {
 	struct rocket_core *core = data;
-	u32 raw_status = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
+	u32 raw_status;
+
+	if (pm_runtime_get_if_active(core->dev) != 1)
+		return IRQ_NONE;
+
+	raw_status = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
 
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR);
 
 	if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
-	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
+	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1)) {
+		pm_runtime_put(core->dev);
 		return IRQ_NONE;
+	}
 
 	rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
+	pm_runtime_put(core->dev);
 
 	return IRQ_WAKE_THREAD;
 }
-- 
2.20.1


