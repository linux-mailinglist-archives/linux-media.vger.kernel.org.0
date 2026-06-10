Return-Path: <linux-media+bounces-64373-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7nMSGCcPKWprPgMAu9opvQ
	(envelope-from <linux-media+bounces-64373-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:15:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F406668AA
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:15:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=cm+3lfIO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64373-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64373-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C1EB304A18B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 07:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C12382370;
	Wed, 10 Jun 2026 07:12:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F368383334;
	Wed, 10 Jun 2026 07:12:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075550; cv=none; b=AAtI4/yaClbDF2vpGpkk/1FuJ+7LQf80+7T4dZAAiD7JjoOSrxWOC/vb/XyW3T70wLCCXHECgdSP5BaP6UUMDL3tjqMc7hd6ClwdrKRj23lN2GmgzCMI/DR2lAMhnzP49ivsBcPNKEaMewlx4dcSrxUuLALkxlHxcXviIK4QqQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075550; c=relaxed/simple;
	bh=OJgck8vcQ4MGVpurBxcbyHOd3yjxdbhWfjRQGMPyK5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UUODFo3kye+g/ljkMC5JakoP+HiIlgN0EdNMwmkGhlAu9Xl1iPL4qT9vcqvzDopOqGzUuU77bK/BsMShwXLhq1Up2fIw6Qqwok63WXsM0fhjbiTfMGYS8c5CRu4YuQ4c5zrCB1N8LVKPZknDrZpOjpPtyqsAvgICcVdtsK/GCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=cm+3lfIO; arc=none smtp.client-ip=54.207.22.56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781075476;
	bh=FjDzXjUTCA7PwSwSBXMojIa1RoXXpb1tpWd5EIt2Ab4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=cm+3lfIOqU7zG8hTZLroEdDH/jU9TjGQJFfqssEBBqwKVliJvdKrBpj5QelQT8iun
	 8opzyMZpnaDknmqucip2xriPMdp3gK5RcCJvNxH5PEkOfWrGTUfcqfVIQO9mJTrtfC
	 J0VofpfJsbtxsar4yQVHBDmEFqU9WcdBYr6yB0Hk=
X-QQ-mid: esmtpsz20t1781075457tb0623c5e
X-QQ-Originating-IP: 9w9119h/pi2NtSaFq8NvVC5uvLHbf8Bnd7PYZkuQcAQ=
Received: from localhost.localdomain ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Jun 2026 15:10:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16958495345642707546
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
Subject: [PATCH v6 1/2] accel/rocket: Fix error path handling in rocket_job_run()
Date: Wed, 10 Jun 2026 15:10:44 +0800
Message-Id: <20260610071045.3414828-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260610061915.1CA281F00893@smtp.kernel.org>
References: <20260610061915.1CA281F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MhWaMTxgikzcEseUwhScMwKj1uvHXyIQadEREZTD4v/yhebL0peP8Dlz
	vRQeEJdIATTrfX1CFaoq+tajdOMDoYC+kj+Xs3eghl7htp4cdQci4PwUtW1OjuWGLDDI245
	7tImIbYK/W5w70agxHYBVNTNxX4sdbskc/cEYY1ZOMgJripyNr9xhPCZ2kH8fVm/Qh2Mw5z
	7If1J0zSU2Iom+56uU+078RTvR22RUdeTQ0Lud1ILPon9QaijFOTw4d5dBTM6IdOmMrxFtK
	1M6krdfcXiKIPV8vdU2pNe0v/dSBLBJTqde/7kmcUvwxn52fADJL3DHQW+4FCTFntZfTa+f
	flD2Nc1jqpZlU8dJ2IT+fNsDGFXp34Ul37e0wHlqH/gv1qgS+xHYX79UWtxKVSqpAdBcOdG
	gvttsuaKltpieYYu03mr8eL3KR62j/R6gEu9whE4q/QClMwp40VTsuO/77gBuCVJ62FC4KO
	UhMYDoGB1+nFYdH5O/lf40GlFJrxb6SYHLiJNqWPhFgwqeVLptZc6UAKMu9OCJJpmphSxIy
	jXML3DWTfgvCmbzvRhed28ggUz5dAxflqE93aqm+3fFj36R3iyHwmZ2SSq8ejY8BNGTjtbL
	T9ALXe+QqgDS+dzHPwZvSzAdpR3BaoIaTeqIWv/3JeXFJklGFA5VO2pW4TTUu4SPgk+Sknp
	HGvTuXjyMdNfQ2qpV38/CCuFllSHBIdRjyHBRN+MYmzz+TTfkxxpJPTvVmMbMt5Iu7yp4p2
	aJ9eUhb0Pmr42jT3uiOLXLcR7fhgeGYzOpmf//rcgB1w81Q3Gozztpx6Yg0SpqTpI85YeW0
	k8QmolWUYxpczXBI24bpgtGCDjM3kjL+7HEarmGUFbTftRrEz3gSDC0Sf/YToPULLxEHwoJ
	f51vADU2u7xr/xyZAi318Sjt+HzTr9WGc0YZyV5HHR+ur7Ezl4K9sg95P0eAmkhTk1f3Yfi
	8+j6NqC1QBlQ1WWm8vrM4BsStTr/GpxKPSSN2MmBKFlZbB04iZ+S2dLwieDFD6vcOzljNiE
	0w/q/ugDMk3GoMaYXJ8Gw5Kgxu9TeLCUZre0Dli1pVIxjo0KAw9sTgAcxyppck0CoYTbmPM
	w==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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
	TAGGED_FROM(0.00)[bounces-64373-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 92F406668AA

In rocket_job_run(), after taking an extra fence reference for
job->done_fence via dma_fence_get(), the error paths have three bugs:

- The dma_fence reference held by job->done_fence is never released,
  causing a reference leak.
- pm_runtime_get_sync() increments the usage counter even on failure,
  but the error path does not decrement it, leaking the runtime PM
  reference and preventing the NPU from suspending.
- A valid but unsignaled fence is returned to the DRM scheduler,
  which triggers WARN("Fence ... released with pending signals!")
  when the scheduler drops its reference.

Fix by replacing pm_runtime_get_sync() with pm_runtime_resume_and_get()
which auto-balances the usage counter on failure, releasing both fence
references on error, and returning ERR_PTR(ret) instead of the
unsignaled fence.

Cc: stable@vger.kernel.org
Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/accel/rocket/rocket_job.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index ac51bff39833..e8a073e22ac2 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -310,13 +310,22 @@ static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
 		dma_fence_put(job->done_fence);
 	job->done_fence = dma_fence_get(fence);
 
-	ret = pm_runtime_get_sync(core->dev);
-	if (ret < 0)
-		return fence;
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret < 0) {
+		dma_fence_put(job->done_fence);
+		job->done_fence = NULL;
+		dma_fence_put(fence);
+		return ERR_PTR(ret);
+	}
 
 	ret = iommu_attach_group(job->domain->domain, core->iommu_group);
-	if (ret < 0)
-		return fence;
+	if (ret < 0) {
+		pm_runtime_put(core->dev);
+		dma_fence_put(job->done_fence);
+		job->done_fence = NULL;
+		dma_fence_put(fence);
+		return ERR_PTR(ret);
+	}
 
 	scoped_guard(mutex, &core->job_lock) {
 		core->in_flight_job = job;
-- 
2.20.1


