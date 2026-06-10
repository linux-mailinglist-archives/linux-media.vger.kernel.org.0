Return-Path: <linux-media+bounces-64345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uZ2tM1XUKGpAKgMAu9opvQ
	(envelope-from <linux-media+bounces-64345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 05:04:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD046658AB
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 05:04:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=im191+tY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64345-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64345-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C62EC3020233
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 03:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540BC34216C;
	Wed, 10 Jun 2026 03:04:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0762DB780;
	Wed, 10 Jun 2026 03:04:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781060687; cv=none; b=AasV4xlS/Ac/1UXsV+8gx+J4anLS+ApXsoIx8DkMCsOyUtVB3t29MyDP360sY9xK6msxOAx+jkm1zMqbcueCgJ33+VWot4gtAU3YIgupAoHeLEgEyhplVZAvgRJtQ+9CbY0BezrWsw4FhqVYn9MIK3Qje/JkefLeHzAeJ7HWyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781060687; c=relaxed/simple;
	bh=OJgck8vcQ4MGVpurBxcbyHOd3yjxdbhWfjRQGMPyK5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=guujRUJ5iGOH6EO4TIyGskb0u6Uv6Kifk4xJXhCT8OMhAF1ceBUT1zhXfKjKZI33YXYbjDPVIgPqFw7e45Q6o6ZxfRrR4tNdLCAyj7SeetXaAHv9ikj/rZuAg/pF+DG4ITX71Jc/z99chlCTxBE+LeJUji3haNDCNEEtKReIyv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=im191+tY; arc=none smtp.client-ip=54.254.200.128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781060636;
	bh=FjDzXjUTCA7PwSwSBXMojIa1RoXXpb1tpWd5EIt2Ab4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=im191+tYgUA5nWAtnwvKYxgm8AgZKHXXTOKbRZQCSzQK3xsLaX/Au3Jh26Mje35i8
	 BtfmmFeXqmYpjRu1+v1tbKikd0PWRqyvgFdU0awZql4GOTL3cYATpROeD9kI6IcrEc
	 hJvj6cGaSR4MPAa6G09YXa7uT1BiCBdSYHXtIuHI=
X-QQ-mid: esmtpgz13t1781060616t4cb5f45a
X-QQ-Originating-IP: HqAmerhJ3hI49ZXtNeNqKA5HqnwfQOOj3mTqxE9tZT8=
Received: from localhost.localdomain ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Jun 2026 11:03:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4178767575033228324
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
Subject: [PATCH v4 1/2] accel/rocket: Fix error path handling in rocket_job_run()
Date: Wed, 10 Jun 2026 11:03:21 +0800
Message-Id: <20260610030322.2802744-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260609094756.8DDFD1F00893@smtp.kernel.org>
References: <20260609094756.8DDFD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MsqSUSn/kyQPQjiCyz75oXbJQh/snsUlhVklJHo5k/puxzxr+lGaXlpP
	d7wIdvzla2afja9/GAK5MOnJLSQC3GWUuV875W+WvKCuRxn/MhMhv//K6dk326kjfmmatcd
	n9EzdSSt8DaFNBzPfpKXfJJPgzhWjOerlFbvcwXKjZOUS+yV4K2bbLa06SynTDBZDMQXYjQ
	3UryfK5MdBKEoW0d9+cXYuxBBZxbWC1q6LoVq2wbUhuMdUKB4wpafcYy2dQAc34ZO/yVO3J
	zf0/tfx7oFn9mz/qIYPpoTziteZgKtwqKVs3a5BGScHZXHV9BiOQpthpfOvGEVt1LvGRnLb
	FsSgctwpgsNaEJEHKivpVtzZdCvOOvnMh5QPAiekxuZo9YmixLVJxTfJxBRpvYYMw+v377g
	Dx5++ZKyTNWhqqxvQ3ZRvBcrrV0VIsg2ftKqaMZxAFF/OSu8tY9+WuWQrbE8LXdrGDtwaF5
	oHHAiavnj7jV/niSNIA2gNMKzfnuUf6r8+7dFxINigafhBO64DKugwMFDl/4kuF73FYPAxx
	lo0Csmg+j1Ra2gy6KrBLKNIUVJAQf3KAZi9qffO+JYg6HAkISeTUGBScQetn0vsRv9UHG0s
	KPh80l6e2zKJp4HAijt63Uh3cIwVCgiRTtzbT1LLXVbPsExzqJzNSPctt6GLWUg/A54/5Px
	g6q5v1V+myd79uqhmen7HR6NMODclm1auvUuLu8S6PRJLgc/m8mP1LSnqc0GKXsTRNCxNVT
	ddETzoskDY0xXoWOrr+aH/UOcyhvxWTYoiFxbUIEUptacGR5leeNB9sfRUhpwUG0VTXH4yg
	ciCoeLK5P4wA6WUIYd19aaGyfzUCuxHU2khnILY2viSArgNVQ+HYg44wC0wisxRnwDew3cg
	mS7KRpS2qY6Td/lZbwyw+yn0zY4PwzHa4P/JeQsU4Ojui2aSK99m2UODpmUU6zK35Iyx7mC
	DlpMIFfgpMeCnh92Q5+89siCKMKkDQc/l6vBssUuGIaowWU80gIgunNNK0dY0mJ8ectemjT
	efJhH2LJ4ELNX4Th6bOTHX7ruKfaM=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64345-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jeff.hugo@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:zhaojinming@uniontech.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zhaojinming@uniontech.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBD046658AB

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


