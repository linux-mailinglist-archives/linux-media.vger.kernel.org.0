Return-Path: <linux-media+bounces-64158-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7puSKaKDJmpkXwIAu9opvQ
	(envelope-from <linux-media+bounces-64158-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:56:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A83C865443A
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:56:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=Po3xp9d8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64158-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64158-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0987430A84B0
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 08:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5A73C2B8F;
	Mon,  8 Jun 2026 08:40:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15CF3B47EB;
	Mon,  8 Jun 2026 08:39:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908007; cv=none; b=RyxEpQ1T1mFHLZScb5qj5opHqqraXNjmDZPSztKj04YcujULtOC+zgDSY+LKGbdScAm4E+LOH5U56kxD7ILzcS/twGUNcHkvrhD6rQXOO/v9WERiwUE4k8qCtaB3XKBNQczWuwyBdjhKT+/qaW6e7fKOx5XSLqrIcaK17RJwHBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908007; c=relaxed/simple;
	bh=xi88rL4G15fuzvZFceKK6FGjELi+t7SXLh+2RdLSMpU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pYdqkMwiW8O4zshmxYjWbihiwGlXuMp/z6eyerUNoAkLhm5PFoYaCFkBEChxtXnenaX06GLaUmcYfe9zBGk5krpD07BU66qt61/jFhrzPcqiAxnFotqTgi0lKT3CF2OPjmGjpbfCuTBkAEeYz2pnMrPfnEvku4cg0Xpu/6GCn+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Po3xp9d8; arc=none smtp.client-ip=52.59.177.22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780907942;
	bh=vh3Y7BnNL0KNAVUUItSrK29bMof+p1LbCi2NyecGDPQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Po3xp9d8iQ5Xcqu/YhSIby/F4dSCkBAlAvADnvFRq7pRUGg8GS40iBMwDm+HkFFOa
	 zCQp4UkWIz92HIAMgzw+5R5FLtBD9JuV0PG+vAxRFnskT7bXLkG6PSRHQRFW9MftYX
	 uFMa32NWFQWg6emVV9GW2g1pgZSRe5YKd+dTDR9Y=
X-QQ-mid: esmtpgz15t1780907923tcb38a38e
X-QQ-Originating-IP: GMbYBnF2GdFa2AUIpaC8/3TV0lWFeYQghvO0MOwDoaY=
Received: from localhost.localdomain ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Jun 2026 16:38:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15237671978310835776
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
Subject: [PATCH] accel/rocket: Fix dma_fence reference leak on error paths in rocket_job_run()
Date: Mon,  8 Jun 2026 16:38:24 +0800
Message-Id: <20260608083824.775261-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NQUKSFCHyTwkLQRJTVbP9k8ORZLuNn7VwLZ6NHZ9lzNCQ2YWidj0Yznm
	O8jBEb34cHrMctBE09y+mm1WJf4IvJL9DeUW7x8mRC+2FmcEoVutqoLp5gHElVHbhgOuR7W
	qf0BI1AqpP1N1TGSbWSS6MrruGP3bxyPH5FEv5XADwvNRGAT09mpGJlYEAgaTunhzKnqIwL
	9RPHVuvbEAvxT0z60u34AdukyK4ljYKVDKMom8Zoz9CS4DqSPbm4/Wc5OWaDZ0ESfyyKacr
	CaN93sh3SsTof5Y+nhSbEcAAPOvPOeWMYN6pbSiW2LJ2BHKqoFtzFPiM7WN4dMoE4IO545q
	7D3ovkeMEkTgEnwkUMORNXh2tHRPDVUkZQkUMUuqky75foI/lfC18WHxcmgf/VF26pggJIK
	EVspUoLORmgeQw8NIsMPlxfcsDysyqa9Fk4diUeN8MLEPJaEWEa9RKDDrcdqbQ1sUKhbxsT
	bBHAVf9Po7IdUOMECKRc9naXnY2AKGM9b18my3RHN8CL4XdxxDNTQWSkRt7tr/zCR1q8Nqj
	GY5WA1nUqZWkqklWFyyAfjPu07EaZsgtQy2OKCSaA53DwenHcV6LGKZ12z/+Hwz5+u7T6MJ
	iHoYGFxSMveJrqZvFdHftZ5ZZ4o4WsF/ez6vvMsPzfy9Dyw2+w2R27GV90CwvZZOHLzzlid
	RYLOfqRztPVD+QjwJ7iJIHpbKDHSMSAABs6uTyJp0MGD1CzoYNr5jT94krCFnJo7Ve0QkOV
	Ppbf7dyU4APDY8NwT8iZqgcrj7w2U4LVAOODQZwpzMvQ+5qFVqb/TdbcWu4zDqK3DbplMzd
	wPpAcO7OtlqYTqmoeW5zx8KGC+rUTfAOp5M2NcL+vZOeiMmyTacVXAU41U2w5XW/JU77k3X
	/PVG8s/l2bFrwm0WChnwuLxWa5dxp2p+l33jgjBatNWSKcqbcF383feFKE7aBH3rsPIA3BX
	+Nn6QkQK5+oK06pXb8egcmLS6VEO8MBewso1EPg/1Kaj6M6c9Efck6CEujlDmfba1heOjaP
	n6cVIj++ZNrkikVAWXlliaf8EFGs4=
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
	TAGGED_FROM(0.00)[bounces-64158-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A83C865443A

In rocket_job_run(), after creating a fence at line 305 and taking an
extra reference for job->done_fence at line 311 via dma_fence_get(),
two error paths fail to release that extra reference before returning:

  - Line 314: When pm_runtime_get_sync() fails, returns fence without
    putting job->done_fence.

  - Line 318: When iommu_attach_group() fails, returns fence without
    putting job->done_fence, and also omits pm_runtime_put() to balance
    the successful pm_runtime_get_sync() at line 313.

The leaked fence reference prevents the fence and its underlying rocket
device from being freed while job->done_fence still points to it.
Repeated failures will accumulate leaked fences, consuming kernel memory
and holding device resources indefinitely.

Fix both error paths by calling dma_fence_put(job->done_fence) and
setting job->done_fence to NULL before returning. Also add the missing
pm_runtime_put() on the iommu_attach_group error path.

Cc: stable@vger.kernel.org
Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/accel/rocket/rocket_job.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index ac51bff39833..66e4a1d57842 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -311,12 +311,19 @@ static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
 	job->done_fence = dma_fence_get(fence);
 
 	ret = pm_runtime_get_sync(core->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		dma_fence_put(job->done_fence);
+		job->done_fence = NULL;
 		return fence;
+	}
 
 	ret = iommu_attach_group(job->domain->domain, core->iommu_group);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put(core->dev);
+		dma_fence_put(job->done_fence);
+		job->done_fence = NULL;
 		return fence;
+	}
 
 	scoped_guard(mutex, &core->job_lock) {
 		core->in_flight_job = job;
-- 
2.20.1


