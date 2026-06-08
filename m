Return-Path: <linux-media+bounces-64170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WLSeBKaVJmp5ZAIAu9opvQ
	(envelope-from <linux-media+bounces-64170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 12:12:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CA4654E6E
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 12:12:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=Cj6UgT0u;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64170-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64170-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BE92308431E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 10:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DBB3CDBBF;
	Mon,  8 Jun 2026 10:02:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB3B2E7F0A;
	Mon,  8 Jun 2026 10:02:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912952; cv=none; b=GlPCa3oAthUhkfv3l8S++HxPww1LVSXUq6jO5+cuywO1MAem0C4escPsjQ7Gi3dn4IoXBBgk1HUjFyvWD8lqn5WCEGGbam0ibegYUaPd6sJ1J2E3K7p+Av4ZcD1V5e0cHzpYhxn3wnw02agg2eEFDDAssLVngVrY50XE51NkZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912952; c=relaxed/simple;
	bh=pdGFzKrUBk946S/n5bevKh1Q1UI/o0CEXK2FVjN3ZPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VKDAWlXbfNagkj54yl+YKJ2CCqxOLZuSN6bIKiP5qoJhEwI4tef7odWzncQJ1lSVFPlQWqi0dGRTBBFvVHAGHOef2qzOfPORT7LjGgQ7pJnIamvy7I5M9nPmNSVvdyeekSJxZoHpGHbuv4LAvowBgbGWv1tesCewqQ2DTQaRjS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Cj6UgT0u; arc=none smtp.client-ip=18.132.163.193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780912874;
	bh=xjnPQf7GAoyFUyGY5zxvgjv4eM33qSIDMbKW2dSfDqo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Cj6UgT0up/7NZ2IOzesleYJhlJ1X3Cu6q2AI5LsYpwSZnNnajV2G0OZe6nFfTjMxg
	 XiRZKBtNQI1oD22oATXNi2T83SCgzTPw9MVd1ehki6rsRGsoGr71fZlXbgSd7LJRvf
	 Z8g69AAHiardvDCT20kVck1C4abozYNW/KiK8vbw=
X-QQ-mid: zesmtpgz3t1780912854tae9d0c57
X-QQ-Originating-IP: 4E4RYRX91c4laM26UrRIuLa53EZJzKOeKvUr8D6DNiU=
Received: from localhost.localdomain ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Jun 2026 18:00:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 280074594800750850
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
Subject: [PATCH v2] accel/rocket: Fix fence leak, runtime PM leak and WARN in rocket_job_run() error paths
Date: Mon,  8 Jun 2026 18:00:40 +0800
Message-Id: <20260608100040.985526-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260608085043.688141F00893@smtp.kernel.org>
References: <20260608085043.688141F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M0qzrJwwKu7j73n+BV2qAyDzZMdEDff17lz0uFmcxVqRR1ZZmNLV8wPh
	+/pLOGOdFES5xY/Kbj8kDaZlD5WJqByR1vcZZHNp7MW/sgOZbjuoaZTeUskKNjA+LQH4n7q
	AMI0ddFZiCYikit98QLv44NqnRUaOpKNFjbUr6qGYmMmKWm5zfA2g5C6l/syFF01Os/rok9
	nL34xp25mDYep+XXURSCb2QZAPyS5em02/XXgGfZicjUgxxFyS15D6Hw/1nscklPwZpE81/
	rYibbwhm3NUbdpRAyjNJl3rHCurRD1812SkCwh4SgQZnYFuNssXZuUmwVUdws2qrtYDpnWt
	RtruDtivMyVp8hXGuq4mBdsDJFBWi/cr7g60nN7Yo0hBfi3locTQhEjqJHWhORvei0IxfVl
	LjoLeRvaZ2D5jpR1X+/TLJJgccyXZ6zs0mzyjj4wcgbDU4uSIhxthuNxzLwNuGgnISC0E/d
	ijZfAYNG4fGEDfHShFGDQV1jPl/MkfrJtG3PCEKaArjB7zQmXV6/rwlYeVMd9xNKD88eGja
	GqZ+iaPR9rSMM4YodGJUMCPAE4h/Exy9X0QSWfns2opg9JZZOK9HXc0Atlzv1Qnwck3bsoD
	Epj4g2XeVYtBHnbUrAoJBYBAQHIXZaqVY1YoNyLnjQGQm9utQ3ilJ9A/Q5yeZXy70y+yPyg
	uoJAiFKJCHvCbo/P2QzNlRnai0RZbKml8EJ0xADqkGKWyuwj0jeCNurZT3r2hF6cwyI3WZx
	nAG4Z0IS3jUDhHAsggHcDLyZieM8jLDcSSUNo6hxSXCJKN0R1Jn39wc2OvjHmUN0iarxbFc
	DS2XtJuRsfyAe0Bd2vr04nt8EnBdY9AdH5/qpc7pkYtBiuJCRfj8Iq1yHdt71h+6za1J8Xx
	lBp9xjzFyseixmzuqFNzJ59y4vZCMTUuiBMhIVxf0nQ7WhHGXV9xBzXTDixgu+V/+xoHhtx
	9/9xWV5lec2koLZJXkfhP1Tsv0WtEeVAcKGAmTR/Egq69PDTUdYgFByj5qpXTvk86CI6qRn
	w9rikvQqpJcIKgi5DyBqQbEJxkw/t73XThlDDkuQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64170-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jeff.hugo@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:zhaojinming@uniontech.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zhaojinming@uniontech.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,uniontech.com:mid,uniontech.com:dkim,uniontech.com:from_mime,uniontech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66CA4654E6E

Three issues exist in the error paths of rocket_job_run():

1) dma_fence reference leak: After creating a fence and taking an extra
   reference for job->done_fence via dma_fence_get(), the error paths
   return without releasing the extra reference held by job->done_fence.
   The leaked reference prevents the fence from being freed, causing
   resource accumulation on repeated failures.

2) pm_runtime_get_sync() usage counter leak: pm_runtime_get_sync()
   increments the runtime PM usage counter before attempting to resume
   the device. If the resume fails and returns an error, the usage
   counter remains incremented. The original error path does not call
   pm_runtime_put_noidle() to balance it. Repeated failures will
   permanently prevent the NPU from entering suspend.

3) Unsignaled fence returned on failure: The error paths return a valid
   but unsignaled dma_fence to the DRM scheduler. Since the hardware
   was never submitted, the fence is never signaled. When the scheduler
   eventually drops its reference, dma_fence_release() detects the
   unsignaled fence and triggers:
     WARN(1, "Fence ... released with pending signals!")
   and forcibly signals it with -EDEADLK.

Fix all three issues by:

- Replace pm_runtime_get_sync() with pm_runtime_resume_and_get(), which
  automatically decrements the usage counter on failure, eliminating
  the need for a manual pm_runtime_put_noidle() call and avoiding the
  usage counter leak. The pm_runtime_get_sync() documentation itself
  recommends pm_runtime_resume_and_get() as the preferred alternative
  when the return value is checked by the caller.

- Release both fence references (job->done_fence and the local fence)
  before returning ERR_PTR(ret) so the DRM scheduler cleanly aborts
  the job without triggering the unsignaled fence WARN.

- Add pm_runtime_put() on the iommu_attach_group error path to release
  the runtime PM reference that was successfully acquired.

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


