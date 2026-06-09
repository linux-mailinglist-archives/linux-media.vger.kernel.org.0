Return-Path: <linux-media+bounces-64286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B+JMDxziJ2r83wIAu9opvQ
	(envelope-from <linux-media+bounces-64286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 11:51:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A06265E8DD
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 11:51:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=hrsS21lO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64286-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64286-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A0E630ABED8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 09:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E149A39F18F;
	Tue,  9 Jun 2026 09:36:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C22C39524E;
	Tue,  9 Jun 2026 09:36:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997767; cv=none; b=dKgJvEnQLUs1oMmHvr79M9AynPbel8KcA7EvqFRKdfla9eS2Htej30llLQc9tzKYaDUF0TqdehR17h1NGqeElMfMWAEUhcW7lNeUzNAhcsqK09Y8zMjuljdmRnL9QtLmUtHC3AbbBzhwbyfDDeZQd5MBE1cM1M6Pivg+0u8Jm28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997767; c=relaxed/simple;
	bh=ymnCTfqYvgzBgaDhzaXYJR5W3tPN8hdoubKglpjr8r0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H32snrDZ6KukjSxvXoq/z/vvgxxwdSlFPLQkMVrBG8RiB/C+CycIkrtyc4cSABcmRUtlRgMpwWW0EDK5pgKch2VYwL+odVhuqZNXIj7/woQdNvNp+MS0ydHYUFGfk3vuZjkKAdBW4RyPC3r19+QCQcPK7eV/BQsHa4bk6W/XG6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=hrsS21lO; arc=none smtp.client-ip=54.207.22.56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780997695;
	bh=F/ATENqeutHEFBLWCq5KxclWHjONItFaJGr0IzvOtgs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=hrsS21lOqN3i5+rw4GQJYsou/okEHaw8A3dvbW4xnGA8vjIFP26VfdlkkRIqrOuM0
	 Y0p0jG7oAkgAI8i1lHHCZ2gAguOMejMXAKJM0u4AQwwprNTBPxn45ALc8r5/BTyeWN
	 VPSaAt+GkDFqKEjNwRqHBb6XXSx3HlVQTNo9odGo=
X-QQ-mid: esmtpsz17t1780997677tad01d33d
X-QQ-Originating-IP: pIjK55WJPXl+Qs4jtZPT67LZr4pec0GM+rpziWhGDf4=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 09 Jun 2026 17:34:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3266297912186802098
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
Subject: [PATCH v3 2/2] accel/rocket: Fix iommu_group leak and unsafe IRQ register access
Date: Tue,  9 Jun 2026 17:33:46 +0800
Message-Id: <20260609093346.380396-2-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260609093346.380396-1-zhaojinming@uniontech.com>
References: <20260608103845.6F4AB1F00893@smtp.kernel.org>
 <20260609093346.380396-1-zhaojinming@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MaCc72GaN9m8qf291dVW5l5v6BjRZqqJqqnaoaqCSiXKnKE16TR8K2Lk
	cXCgpcdJ7ZJhdiFpGeECCRCl1gmn7Ihe6dfWjHTelziGAvHKk4S5SABhIo2Kn+Xl1o/CeQ5
	fUfmdwsANFcFqKHexaANoj9tDk82BzE+j6o+o3H4kkG9bl3YCddoVepHNFEDsbUmSViBIOy
	xiRoLoTDuAWz86rBtBD0XBiB4FjNTOGkNlsjG1idvR0BXScYFYF9BuWm1BcyWdFz6px3TJQ
	RhW05gxxPg1JBk7xGKJqKZq0Lvdq93kQ9Hufxp62PMWDHqSmVDRbWYK7NexmlQQBhKqqJ9l
	B9aYGTxvc431MPp8hfBdw15DtPVQSnxt+apmlW51o7AoUEGt9CWD2BqV5/1YzRvoekvJr37
	Ommy87BbXWVel2uoSKfXXJ19hXXywIUYp/WAkeasoCSQ88iJ+iEq9JnqEM3FIX+6+Zkl6+I
	6psOiqGO8PRdgnXK0uCixr8y6ehzrwCAGIUyJSkbVGYNJpBLOXW2rOgX0ZI9Qklua9W0v3j
	daSI5HWW6/OEe4a9LggxOFJAGWEgoYJC9prbPqAt5o3wn6XHggo4nwAQfRo4KZnRX+rs7Hp
	4+Eis0yzdigDf6/NTfGF98p4XEQ34gIUyuZctJuSXBslKlp9x6D2VgMbmyWgHxCQJFVnqNP
	urnsp+146OFRhGTYodqZIGmi+3rzBc6k6b36+Rk86pyZ2aWDI2H1J/t5QG5A0koO+jmXytW
	/49XXnYJMixmHMYjTViuSMPXw4o2XnT0gdjRwpIJtjE8KA4E6W0mfIZSw4mCgveErMKnmQL
	MH8KasKfckWy4ziaIthfa1lzcR37QsIeJBUTAKvwhvqDmyVZBW+/gkcMubEBvnUmf42+kSh
	vs09A0Wq1qwl+j/idZIO8xj/FraDKPNQz3tcY5/417iKhOnrdawmAdJlLz95bxTKsZvD98W
	dEjNkNNGl+ttw3qYIBfM3BUX4myvXM9OByxktke0ffJ8TC/078Y0S+kvMw/TPRPefLNJVZQ
	iGFQH/cib7D98XQQVzBMXVwgfZcD4x8A43rk6tdIPg6VVCHiz3/EkxvB5FSg6dHcc7BRh40
	g==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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
	TAGGED_FROM(0.00)[bounces-64286-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jeff.hugo@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:zhaojinming@uniontech.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A06265E8DD

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

   Replace with pm_runtime_get_if_active(), which atomically checks the
   device status under spinlock and increments the usage count to keep
   the device active during register access. Balance the extra reference:
   - If the interrupt is not for this device (raw_status does not match
     DPU_0/DPU_1), put in the hardirq handler before returning IRQ_NONE.
   - If the interrupt is for this device, the thread handler puts after
     completing register writes.

Cc: stable@vger.kernel.org
Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/accel/rocket/rocket_job.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index e8a073e22ac2..30c677952b64 100644
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
@@ -421,6 +421,7 @@ static irqreturn_t rocket_job_irq_handler_thread(int irq, void *data)
 	struct rocket_core *core = data;
 
 	rocket_job_handle_irq(core);
+	pm_runtime_put(core->dev);
 
 	return IRQ_HANDLED;
 }
@@ -428,14 +429,20 @@ static irqreturn_t rocket_job_irq_handler_thread(int irq, void *data)
 static irqreturn_t rocket_job_irq_handler(int irq, void *data)
 {
 	struct rocket_core *core = data;
+
+	if (!pm_runtime_get_if_active(core->dev))
+		return IRQ_NONE;
+
 	u32 raw_status = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
 
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR);
 
 	if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
-	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
+	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1)) {
+		pm_runtime_put(core->dev);
 		return IRQ_NONE;
+	}
 
 	rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
 
-- 
2.20.1


