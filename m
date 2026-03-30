Return-Path: <linux-media+bounces-57553-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GjKBD4yymk66QUAu9opvQ
	(envelope-from <linux-media+bounces-57553-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:20:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C15357034
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45C7C3056DB6
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8093AD50F;
	Mon, 30 Mar 2026 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="qcRyE5kF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B6D3ACA66;
	Mon, 30 Mar 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858339; cv=none; b=iZQCFrYPk41jMXd8Kyu3B+lcaeOlQgqAq0s4hprFnuR5Sl3TwgXgioMfnkrIaToHDO6CH3c6aPCpa3lhbOX7Tm41BbxN0ApbldHRbRnEA7QLPguUagbKc6dz7uCpelmU6zwCCe/TF8i+8C0IKlBt4HZhDyHYXy+bbK6hak0Zk7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858339; c=relaxed/simple;
	bh=Jud123WWRsFViT++lGJXkizulPVbeyW2ltbMqISSRbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gRSSdaxmxwJ4cMpa7oNU3KWA0aHX4T9h54a3NPHCFg7KKYsGnEkdXASgOdy8HdoDZh81iV5sfu6tYIBFmDXTv+t1BuhIbSHYiznNiw96/uLgnE7OBTvgJL7b/hoR8Geln2V6vd/y5WEOm7VYBd7U6ThoOAUfUN+G3EQkykVdWOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=qcRyE5kF; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5HJTm174202;
	Mon, 30 Mar 2026 08:57:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=/
	8FiZRrrQ/O+Rf5kOsCDAWuTUsDDkKsfFbvZz4NC9po=; b=qcRyE5kF9iQ1avMmt
	nH1fDHUusK7FSJ5LO/93IJHb2M2LeuFB67un+nJ0ETmVdeqChRl8nDHoqXEJ5LbX
	N+8mxjSCtIrn1ow2RAfUMTtueZty7ifFO1BfIgYo/5PTFdIsDTqmN/eITA73araw
	2i8WWJhuhu/gsWuVEIRITS9IsSbpR+uaM1CV5pGud22S261NyGo72nlAxoMZvqKS
	sEd7hpKRkmhjyLxJz3zzcv4lzOl7qk+tii8XL1SIpyezmDywLAdLRjXCE3seOzX/
	CDXgkjlPh6dnlAU2A3dtgr47KnB60XFN9VSA37IkNA24wZaKuXHudjIKZcbnh+6Z
	dF9LQ==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4d67xusfkv-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:57:02 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.106) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 08:57:00 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Mon, 30 Mar 2026 08:56:41 +0100
Subject: [PATCH 6/8] drm/imagination: Move repeated job fence check to its
 own function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260330-job-submission-fixes-cleanup-v1-6-7de8c09cef8c@imgtec.com>
References: <20260330-job-submission-fixes-cleanup-v1-0-7de8c09cef8c@imgtec.com>
In-Reply-To: <20260330-job-submission-fixes-cleanup-v1-0-7de8c09cef8c@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        Brajesh Gupta <brajesh.gupta@imgtec.com>,
        "Alexandru Dadu" <alexandru.dadu@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Boris Brezillon
	<boris.brezillon@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        "Alessio
 Belle" <alessio.belle@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774857418; l=1816;
 i=alessio.belle@imgtec.com; s=20251208; h=from:subject:message-id;
 bh=Jud123WWRsFViT++lGJXkizulPVbeyW2ltbMqISSRbY=;
 b=Us8Uqg2bcIei5LQeqV5+A3+PeVxiODs7azGrw4HFJvCPdodnoBN9XaRjosJv9U3EBmzjuJWrE
 wMTYRH4ofcNDWIcj5jOmJfWGTAyXXhqmoQ8Y11jl8NSM3fRo8OlmIy1
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=2Vtuk+GKBRjwMqIHpKk+Gx6zl7cgtq0joszcOc0zF4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MSBTYWx0ZWRfX3LbZ7G18Zoin
 YFA4KSKSmaBVaJMwkomSPR16kvSZcBU9TKLTl9KWzSE03/iHGkLDlvN6y2YSgz+jlzZD4u8mB2T
 lOMD8YdBoKCfnwQ0PiNYXuMKm2gXRrnPRTTskFkxfTDQg5t54fqcHYKSXu9YX+iDzTVDqka3kqS
 saWPiWuYWvVZzzyxiHj25XPlZaiWTo6XeS3LpSDtR/Kx2I+VJdecJ8hCn6AL8p44OTBfjZVqwTJ
 93Ue1u+sL6A3rD6UJ6raAPIkdNaMF6JFd9dhpGYP+vzVlhztK/B+s8uSZ34EZeyouUI6I8163xt
 MQbOr2U30RYP5v7E6KNFvdo1ISjs5gK42ZnhuizRnmkjmJ/3VDtmJ4+pJlPP+/AZlQcu+ip8rq7
 JU5SypaLRZEs02emRGnilz7WkpDMqOXC/Pmig1n6MLqzd1fQ3LOkjlnfUIpNuwdFjkLgiXd31kA
 r7YRCbf/OePJozP631w==
X-Authority-Analysis: v=2.4 cv=QO9lhwLL c=1 sm=1 tr=0 ts=69ca2cce cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=txNhvCuK94MA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=qN8rWf0lohQvQRdMElYA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: tYoNvPJFFQmVQXx88G-m8Pt_uuTJnAhj
X-Proofpoint-ORIG-GUID: tYoNvPJFFQmVQXx88G-m8Pt_uuTJnAhj
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57553-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alessio.belle@imgtec.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:dkim,imgtec.com:email,imgtec.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72C15357034
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This should make the code slightly clearer.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_queue.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index df0a110ed96f..4a49d954562e 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -177,6 +177,24 @@ static const struct dma_fence_ops pvr_queue_job_fence_ops = {
 	.release = pvr_queue_fence_release,
 };
 
+/**
+ * pvr_queue_fence_is_ufo_backed() - Check if a dma_fence is backed by a UFO.
+ * @f: The dma_fence to check.
+ *
+ * Return:
+ * * true if the dma_fence is backed by a UFO, or
+ * * false otherwise.
+ */
+static inline bool
+pvr_queue_fence_is_ufo_backed(struct dma_fence *f)
+{
+	/*
+	 * Currently the only dma_fence backed by a UFO object is the job fence,
+	 * e.g. pvr_job::done_fence, wrapped by a pvr_queue_fence object.
+	 */
+	return f && f->ops == &pvr_queue_job_fence_ops;
+}
+
 /**
  * to_pvr_queue_job_fence() - Return a pvr_queue_fence object if the fence is
  * already backed by a UFO.
@@ -194,7 +212,7 @@ to_pvr_queue_job_fence(struct dma_fence *f)
 	if (sched_fence)
 		f = sched_fence->parent;
 
-	if (f && f->ops == &pvr_queue_job_fence_ops)
+	if (pvr_queue_fence_is_ufo_backed(f))
 		return container_of(f, struct pvr_queue_fence, base);
 
 	return NULL;
@@ -915,10 +933,7 @@ bool pvr_queue_fence_is_native(struct dma_fence *f)
 	    sched_fence->sched->ops == &pvr_queue_sched_ops)
 		return true;
 
-	if (f && f->ops == &pvr_queue_job_fence_ops)
-		return true;
-
-	return false;
+	return pvr_queue_fence_is_ufo_backed(f);
 }
 
 /**

-- 
2.43.0


