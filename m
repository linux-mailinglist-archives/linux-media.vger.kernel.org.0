Return-Path: <linux-media+bounces-64349-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PdIKGCr+KGo/OgMAu9opvQ
	(envelope-from <linux-media+bounces-64349-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:03:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C67296660C1
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:03:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=NqULZSBC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64349-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64349-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFF673039C5D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 06:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DF53624B7;
	Wed, 10 Jun 2026 06:03:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0580940D577;
	Wed, 10 Jun 2026 06:03:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781071388; cv=none; b=noILA7VENXKghSxWsSYtjjzxhu6h8wqyDXp5VEe62rrcwX3HGKZz/KE4VxOpeWDaDxMhgrPBEhcVpTC+NQOQzizOj5wqUZPlmZx5Jgxeb684mX1jSlFj7KNPOuzLXKAcG0aC4vVdZkaIJ5wRy4SdYIiXkLcId0eesP8rW3zUWj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781071388; c=relaxed/simple;
	bh=OJgck8vcQ4MGVpurBxcbyHOd3yjxdbhWfjRQGMPyK5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PNR2pwYLQY1Mx5/JRrh8Z49ZvMh5NdBpytpLiq0cOlTRtQ2xD8sp2LX3j4hRry4CPZhPGVCPfDu7p2vWP/VS7kBYjaVABYyXg7rPtF0r3TiH5izqNfOoLjRPdL6oa62e15kBUA6XN/4e9v1fWPEpPXbCpez1OjHbzTjcyNp0xw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=NqULZSBC; arc=none smtp.client-ip=54.204.34.129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781071325;
	bh=FjDzXjUTCA7PwSwSBXMojIa1RoXXpb1tpWd5EIt2Ab4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=NqULZSBCZen31aNEFQyql5UpEYhb2NYiS3SkqfOXh0VEWAj2asgUbVaL5XuiTQPu8
	 TO3nc7VHsFkTGwVHhbYoPlaVD/YGmEMG/wCmmU++bqrc62jCybhKkO1zNSnvogOMsc
	 jciznXlq03FdsUI5x5VvQggKpan2eHS8oCLKgvq0=
X-QQ-mid: esmtpsz18t1781071305t3236f62b
X-QQ-Originating-IP: iePxYMPyCq/TYnXweTLz+Oc+mDGPzOvpeL8ckYEnAJM=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Jun 2026 14:01:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12200062237353553403
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
Subject: [PATCH v5 1/2] accel/rocket: Fix error path handling in rocket_job_run()
Date: Wed, 10 Jun 2026 14:01:31 +0800
Message-Id: <20260610060132.3239648-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260610031431.E8EA71F00893@smtp.kernel.org>
References: <20260610031431.E8EA71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MOdUEiNUAftlWk9vIicVUgL6IwBpYf6MWLHZLxKPsMPW/oc3I2yonn8F
	9TFnDQXHMz7sj8m1AexAh6z3XlVdrLRH0AfXqNeOUZX1NQBmcbucA/guNic9YYVL3uk2vV5
	NJ7bpwqWp2CMBx9o2BPAa0PDeCPIkIFZx+WffGyGCzM+x+GF75HRz8TFdArXXDa1aZ7YtNi
	2nvKTf/6pDlddQuz4QZz9hKXVe2Uid/BEqQnKUS1tEGnN+ylXbK4EFVjXoujSuJvcNyNOmL
	8AnY4BYPJKRtXNvf5F+O1LzZ1KefTxNWz9AHAQZUhVaysMB2DOJRzB4/Pw8+bIUSh+PousB
	8Wxq3HeI8AtAfkHt6ml9BMafsV/T3SWhodTWvNSTyi0+m4obOeLGm26lym8Q0g8ORMN6fGz
	ogWGuGtwKBwIP/GyZyvJRxat2c0A5j85nedVbAmqIWhNlDpkIDZTgdn5lbxbaya+7AEZCY0
	0EVax6ZLLAtPufxRh1Ka0uYzZ/KFakfZy1uSoaOuVE4WrFVfCoLVqy+1GsErfyIqJRUyziv
	TYgutLWQbCREt6z3kzPvlSWs9i2EYlJveqXe0JTW1oXq5qEMMbJrWB9d9AjoQYafDZMvntS
	CJzvkxKhd9456MnWvD/s00+VkQ5D3P1yMrpGCSaQF4hKNK6LnODPEDbrtQ4J07FboX+bBB/
	yo1xADn1xXXW4M3fqEHZX4OGuia+D3ISlA5LTrFJ72VkUy8oMGgVv6xzFWQ/88WIoe3XFPc
	T5isbpxsjGUmW5bOkvKbHMqYrywZe/57+OEHfhGzEHCjmLHfXb00/8bgA980yv1zFrnwOHT
	cbC9hF9Y+yZv1YbWck1cGItB+1ZHSeL9EvEiCeX4kNEyPCay4JrCwmZQSPmFbdnEpsNhCO6
	jJSc3px7qbW/ZmY/qXP60CBvY5mjGXZ7wRd9PJNlJyrFhHKc4jT7omkuFSYaS+xDSYQmmPw
	gy8/OVkrVFoM2dU+ibN3mXHW5lRe+/5rxTxpkOu1lT6YOzHL5LW08yBrXxdkdM17WYHKnhc
	MHC7I/7YVNfrRuRnub4/t9lwplgxbCqMHfJG/tuQotrUVw/M6+KYYyFeWPH5MsTNvNEzLG3
	A==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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
	TAGGED_FROM(0.00)[bounces-64349-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C67296660C1

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


