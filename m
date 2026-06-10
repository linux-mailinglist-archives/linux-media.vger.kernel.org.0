Return-Path: <linux-media+bounces-64346-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NKyAAFjUKGpBKgMAu9opvQ
	(envelope-from <linux-media+bounces-64346-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 05:04:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D3A6658B0
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 05:04:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=BuNSqgCZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64346-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64346-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CAF63020FE0
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 03:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB011343880;
	Wed, 10 Jun 2026 03:04:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5A12FC00D;
	Wed, 10 Jun 2026 03:04:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781060688; cv=none; b=KhbDvdDwC/jd7Ov7fHHvB6h2k6bkxSYMriJWvWXr3Jw7mo/NPFK777SB/OeRiR5AfUKClLyehBZnBnX4OqecXtivNx7AeQL2TZ8R4sa++DJdruTIXoANr78/Qa+HLw8ylPiYLAZ5DuEfWnHo3FUKjLRYlW7SJwM+olbWHAETtgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781060688; c=relaxed/simple;
	bh=QQLbQMF0b4ShlRkjcMzhLYepWY99zgCTJPmzcMaBRiY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VxWF2VpSE8O3zMNbvVyZ1M6+aLgCrHHE/SDOSl8WaOT+ZUJeQ9+mkbcP1eovBS31L3UnEWG7f74bytcNVMyu7kU4WRxH/r3R3L5eI9y6h3lhZyzJYVoBRZN/0p46GvtF36EWZJb/wsjnJqOJ+CkzEzeER9V6gNaGWIDgBaclmTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BuNSqgCZ; arc=none smtp.client-ip=54.254.200.92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781060642;
	bh=pPmroeQDHsA9ug2HnLTa8g6lPR2P7s9mi76pG8L8oJI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=BuNSqgCZlJmnGmMVd/iPKDirBsV/5/yYjnlkefASCAi6aMqzs/z/bcIcKmsQZigQD
	 Oma6S1YRLOeZUU8cMhU9ouyZMCreH0ySQ65XEzJ/n6P84VspTI36PMDGbshBBYzcbw
	 3LkNp0z4Bc/jbviZTM/Vg+xVdylj8pwN5wt6gfFI=
X-QQ-mid: esmtpgz13t1781060624tc1abae19
X-QQ-Originating-IP: cLg5X++iDCAXLdBCZBxzRSN4dV8URO0z6d3AWbklGOE=
Received: from localhost.localdomain ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Jun 2026 11:03:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2952194183593288770
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
Subject: [PATCH v4 2/2] accel/rocket: Fix iommu_group leak and unsafe IRQ register access
Date: Wed, 10 Jun 2026 11:03:22 +0800
Message-Id: <20260610030322.2802744-2-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260610030322.2802744-1-zhaojinming@uniontech.com>
References: <20260609094756.8DDFD1F00893@smtp.kernel.org>
 <20260610030322.2802744-1-zhaojinming@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: N7V5dvLk9gGfNKwaqmR804LFZSjywXn/11FfW7YtIkRsck2p2GyRkBHO
	WuA0sPIcwR9KbL04RkBSCFOUz2uA1pc1F2KVRN82piJsoDkgQdy2QzSRCe12UVcFTPnuAOF
	h41ba8t2XHLCCoyvUt3EzjcQpVSgKwgT5yuEgDQucmBTk2wXd2/Z38TgHQ0yz3NbfpZiE5M
	5u1pQI26lnRsyBlJ3VAA/swO0KnYwdKRCiJP4fF6lboxEcE+QE6BhIfuqF1hfSxt1X25mr2
	x+i0yPJLZVDwny5lLpxdzoW29blMqpdYemGqyDn0zuQ8bAFylHYpsY4Aik4MyuHJT//lfad
	rqy3ZDFkgxviLXNdxiDE7S5OlslS0t4Our6O1V7Xx+k/Jq8B6Q04GjkQ+M3vF3z+HMjDt6T
	eFU9QZFMYkhlsxkmT0Njs1hvSXt9OIddf8jFrwtKIXqAWPTxp8Z+qI6yxm/bkb4Z6l3+sYW
	ls/kXdGvK+dC4guOTOgZIL6DeLldEHtvbO/fa2KorAwzQX5uP7Ie0t/zZnSOqklUWTPcSqV
	nzLf4aC8zJySXhRD6LkioU8ljWr9mlmY+iktQ9YjZcq108FicZgJqyc4AWOrJm6X51pA8AV
	lSo8RIga64z0PevFHPTgSXFsqZHpz+kcNI8RWrPt9ltU0/xmhQ1+jYiOpSn4IuiH0YqFbXN
	fYfpOuseGXPsFWdBSAtUxCWxhIn6ivADa5wxFyHCO5G1buUIzmQ6pwNuWRdK1zUx1Pm5JN0
	6G+qF/pVAN9kZVMrZfBDVLMF5tygGpr6bpRyLfBU0Cwrn8//VI2x9Y+9g+VctmVC1GslYSt
	Uatp4AXtAEKadOdVxG1Rr0sBe2KW/eFa9A/ZfvhBzxxyw4hV/6FDJ8IlZsjM9z14SszeYg+
	yZURZpARso0Svup2hZyQsZ0DSEZfTDeK6Y71mMPE6dBD4KVc/h5RPXMOSx0FOq5IkXWEKy9
	MzNN4ZQyGQsGF4CfmXs8MVVX71Df335WUftB2RKBHSbkta/dhobKTojoSeNYffbLKWdJECG
	2g3WutyIdy5GXLzy7vPu73bUnal7hUSeHMGvmJrvzR9pezlO8btFmFql77us+rvfvsbXNnu
	UUfV1BplF7w
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64346-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jeff.hugo@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:zhaojinming@uniontech.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zhaojinming@uniontech.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2D3A6658B0

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
index e8a073e22ac2..f05043619169 100644
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
+	if (pm_runtime_get_if_active(core->dev)) {
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


