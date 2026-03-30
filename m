Return-Path: <linux-media+bounces-57555-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDjxNbQyymk66QUAu9opvQ
	(envelope-from <linux-media+bounces-57555-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:22:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CF1357097
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFB6F305E163
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439F53AE188;
	Mon, 30 Mar 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="UuJxpzjS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49303ACA4C;
	Mon, 30 Mar 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858339; cv=none; b=Rr8D9zN06msENE2J/xBtu32Rk2qVUlsylXRTvZ6qY0Wte5aUrLNLgTjZRaRLkcpnW8QPQBCORCd7c/GrA/iFGBH/L/Pw3BbmWkgzba1RLNsVe3xmhc1Y5Tql2wRdlmscjYHmGCoEN1293KR/31PMguH+pnKZUOmUIbJq67fdi+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858339; c=relaxed/simple;
	bh=Vt9rOXVB86+YkZB8q2mFlAfVz6lvZRqkwWqglbkw5dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ccKK0DlPHMtwA9PjMbpT24prym81tjl/jR2AqgHzMNfI4prB98SZMLv2VLucbKLe/sLjwW85n9uOgrR0ri+Ts36wQQLSvq1Etj/dmhyYbvLQJEvyT065iMZ24Sdl3BRVWet9zJrpF+COhLfK7n2WG4GGLs0troqM9sAvN3oO3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=UuJxpzjS; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5HJTj174202;
	Mon, 30 Mar 2026 08:57:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=q
	ejdoNCNFywlFiCDSneRuoAYHrORMXz0cJXIt13Na/I=; b=UuJxpzjSO1Xq+bM24
	xIozSQHzNhYhNHVkn2FcJvn6gTbMOj7ZgcJHxQKatiJx/NNf49Npo9mM+jAPt1+d
	I9MDPOybwr8KV8xuA5Rn5/kmUHj3a+w+/EsST/yTovSqzLTiahn9esEnt002i/+E
	cqo2g1bVvfFsorhuiA+yiWEumIISPGaznfST2XDPW4/bR5FQSH8mr3hFStFntHMY
	OtkSkHblfvAVkUA5Di/R4M7lLA6WORbbtwsH/6NnZdsh6nydedH/U9gnqm+MuFY5
	1mc8Az2WyfWVJ1IUcvR0Zq6O4o2rto3R7oa7lrmxSaRzyzM1RbTCO0NFAHUB0Hya
	wnh6A==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4d67xusfkv-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:57:00 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.106) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 08:56:59 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Mon, 30 Mar 2026 08:56:37 +0100
Subject: [PATCH 2/8] drm/imagination: Fit paired fragment job in the
 correct CCCB
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260330-job-submission-fixes-cleanup-v1-2-7de8c09cef8c@imgtec.com>
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
 Belle" <alessio.belle@imgtec.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774857418; l=7023;
 i=alessio.belle@imgtec.com; s=20251208; h=from:subject:message-id;
 bh=Vt9rOXVB86+YkZB8q2mFlAfVz6lvZRqkwWqglbkw5dY=;
 b=CBjen60I2AGSU+xH3JvmaR2YAsCFobGFvOeC6SmM7XCUiLkI5vmv5evZjyOwvAa3P4cjOJVWL
 z12lwSjnsWmA7aF11rZ1Ryd6uaXgK8wNDCfOUwOZy5DUmWy2pkzHzNB
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=2Vtuk+GKBRjwMqIHpKk+Gx6zl7cgtq0joszcOc0zF4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MSBTYWx0ZWRfX2I0bMxkF/Teu
 /ySiTbnC5EcIsVvZMxxosRqRQnSevy4m9CC4kOtmO4CHUSTntb3LZe7tyygqrUuqxeg9cc4E81u
 TXdXspPcNss9fbkJvjOc/dx0A6TgnO6T/oB2lpo5m0wHTJnYc8osD5Ft8BaKEthljV2HAzAZmFG
 AjAszJYPiHUC54h2emhDn1pogIdUouVfQ/yZR/7KxTXdYBKlDhR4aZDeMbXGsHnAftMK3QnpNpg
 OvKdQDfSb0KJgVKwoIcxeEJSAd6BAd9pspEO1r/tIxMUVrIpVnPJOVpbo9VIDgtIMVGrGpRRhnV
 p5ke4h/SpkjbcYv/en5WJgDyaL3uKXIS1uHFuXzesnRz9AeWV6Tl12DUmSxN7COoztGsg3hLVVm
 XvP0gTjKhy0nKdm29z/PplhJNAb8CcL3kRand152VDOnlFGuYGPF1WzlfiIjjE9EVXBz2fPdR4e
 Jil/qNq48GvBTf/sgtw==
X-Authority-Analysis: v=2.4 cv=QO9lhwLL c=1 sm=1 tr=0 ts=69ca2ccc cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=txNhvCuK94MA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=TlYXyb1RBqvdDQlp59oA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: fnLGrxZ8qoXfarF7PMyEDN5P3FxINxls
X-Proofpoint-ORIG-GUID: fnLGrxZ8qoXfarF7PMyEDN5P3FxINxls
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57555-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alessio.belle@imgtec.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,imgtec.com:dkim,imgtec.com:email,imgtec.com:mid]
X-Rspamd-Queue-Id: 79CF1357097
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For geometry jobs with a paired fragment job, at the moment, the
DRM scheduler's prepare_job() callback:

- checks for internal (driver) dependencies for the geometry job;
- calls into pvr_queue_get_paired_frag_job_dep() to check for external
  dependencies for the fragment job (the two jobs are submitted together
  but the common scheduler code doesn't know about it, so this needs to
  be done at this point in time);
- calls into the prepare_job() callback again, but for the fragment job,
  to check its internal dependencies as well, passing the fragment job's
  drm_sched_job and the geometry job's drm_sched_entity / pvr_queue.

The problem with the last step is that pvr_queue_prepare_job() doesn't
always take the mismatched fragment job and geometry queue into account,
in particular when checking whether there is space for the fragment
command to be submitted, so the code ends up checking for space in the
geometry (i.e. wrong) CCCB.
The rest of the nested prepare_job() callback happens to work fine at
the moment as the other internal dependencies are not relevant for a
paired fragment job.

Move the initialisation of a paired fragment job's done fence and CCCB
fence to pvr_queue_get_paired_frag_job_dep(), inferring the correct
queue from the fragment job itself.

This fixes cases where prepare_job() wrongly assumed that there was
enough space for a paired fragment job in its own CCCB, unblocking
run_job(), which then returned early without writing the full sequence
of commands to the CCCB.

The above lead to kernel warnings such as the following and potentially
job timeouts (depending on waiters on the missing commands):

  [  552.421075] WARNING: drivers/gpu/drm/imagination/pvr_cccb.c:178 at pvr_cccb_write_command_with_header+0x2c4/0x330 [powervr], CPU#2: kworker/u16:5/63
  [  552.421230] Modules linked in:
  [  552.421592] CPU: 2 UID: 0 PID: 63 Comm: kworker/u16:5 Tainted: G        W           7.0.0-rc2-gc5d053e4dccb #39 PREEMPT
  [  552.421625] Tainted: [W]=WARN
  [  552.421637] Hardware name: Texas Instruments AM625 SK (DT)
  [  552.421655] Workqueue: powervr-sched drm_sched_run_job_work [gpu_sched]
  [  552.421744] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  [  552.421766] pc : pvr_cccb_write_command_with_header+0x2c4/0x330 [powervr]
  [  552.421850] lr : pvr_queue_submit_job_to_cccb+0x57c/0xa74 [powervr]
  [  552.421923] sp : ffff800084c47650
  [  552.421936] x29: ffff800084c47740 x28: 0000000000000df8 x27: ffff800088a77000
  [  552.421979] x26: 0000000000000030 x25: ffff800084c47680 x24: 0000000000001000
  [  552.422017] x23: ffff800084c47820 x22: 1ffff00010988ecc x21: 0000000000000008
  [  552.422055] x20: 0000000000000208 x19: ffff000006ad5a88 x18: 0000000000000000
  [  552.422093] x17: 0000000020020000 x16: 0000000000020000 x15: 0000000000000000
  [  552.422130] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
  [  552.422167] x11: 000000000000f2f2 x10: 00000000f3000000 x9 : 00000000f3f3f3f3
  [  552.422204] x8 : 00000000f2f2f200 x7 : ffff700010988ecc x6 : 0000000000000008
  [  552.422241] x5 : 0000000000000000 x4 : 1ffff0001114ee00 x3 : 0000000000000000
  [  552.422278] x2 : 0000000000000007 x1 : 0000000000000fff x0 : 000000000000002f
  [  552.422316] Call trace:
  [  552.422330]  pvr_cccb_write_command_with_header+0x2c4/0x330 [powervr] (P)
  [  552.422411]  pvr_queue_submit_job_to_cccb+0x57c/0xa74 [powervr]
  [  552.422486]  pvr_queue_run_job+0x3a4/0x990 [powervr]
  [  552.422562]  drm_sched_run_job_work+0x580/0xd48 [gpu_sched]
  [  552.422623]  process_one_work+0x520/0x1288
  [  552.422657]  worker_thread+0x3f0/0xb3c
  [  552.422679]  kthread+0x334/0x3d8
  [  552.422706]  ret_from_fork+0x10/0x20

Fixes: eaf01ee5ba28 ("drm/imagination: Implement job submission and scheduling")
Cc: stable@vger.kernel.org
Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_queue.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 836feaa0b295..f1e54e6d940d 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -488,10 +488,11 @@ pvr_queue_get_job_kccb_fence(struct pvr_queue *queue, struct pvr_job *job)
 }
 
 static struct dma_fence *
-pvr_queue_get_paired_frag_job_dep(struct pvr_queue *queue, struct pvr_job *job)
+pvr_queue_get_paired_frag_job_dep(struct pvr_job *job)
 {
 	struct pvr_job *frag_job = job->type == DRM_PVR_JOB_TYPE_GEOMETRY ?
 				   job->paired_job : NULL;
+	struct pvr_queue *frag_queue = frag_job ? frag_job->ctx->queues.fragment : NULL;
 	struct dma_fence *f;
 	unsigned long index;
 
@@ -510,7 +511,10 @@ pvr_queue_get_paired_frag_job_dep(struct pvr_queue *queue, struct pvr_job *job)
 		return dma_fence_get(f);
 	}
 
-	return frag_job->base.sched->ops->prepare_job(&frag_job->base, &queue->entity);
+	/* Initialize the paired fragment job's done_fence, so we can signal it. */
+	pvr_queue_job_fence_init(frag_job->done_fence, frag_queue);
+
+	return pvr_queue_get_job_cccb_fence(frag_queue, frag_job);
 }
 
 /**
@@ -529,11 +533,6 @@ pvr_queue_prepare_job(struct drm_sched_job *sched_job,
 	struct pvr_queue *queue = container_of(s_entity, struct pvr_queue, entity);
 	struct dma_fence *internal_dep = NULL;
 
-	/*
-	 * Initialize the done_fence, so we can signal it. This must be done
-	 * here because otherwise by the time of run_job() the job will end up
-	 * in the pending list without a valid fence.
-	 */
 	if (job->type == DRM_PVR_JOB_TYPE_FRAGMENT && job->paired_job) {
 		/*
 		 * This will be called on a paired fragment job after being
@@ -543,18 +542,15 @@ pvr_queue_prepare_job(struct drm_sched_job *sched_job,
 		 */
 		if (job->paired_job->has_pm_ref)
 			return NULL;
-
-		/*
-		 * In this case we need to use the job's own ctx to initialise
-		 * the done_fence.  The other steps are done in the ctx of the
-		 * paired geometry job.
-		 */
-		pvr_queue_job_fence_init(job->done_fence,
-					 job->ctx->queues.fragment);
-	} else {
-		pvr_queue_job_fence_init(job->done_fence, queue);
 	}
 
+	/*
+	 * Initialize the done_fence, so we can signal it. This must be done
+	 * here because otherwise by the time of run_job() the job will end up
+	 * in the pending list without a valid fence.
+	 */
+	pvr_queue_job_fence_init(job->done_fence, queue);
+
 	/* CCCB fence is used to make sure we have enough space in the CCCB to
 	 * submit our commands.
 	 */
@@ -575,7 +571,7 @@ pvr_queue_prepare_job(struct drm_sched_job *sched_job,
 
 	/* The paired job fence should come last, when everything else is ready. */
 	if (!internal_dep)
-		internal_dep = pvr_queue_get_paired_frag_job_dep(queue, job);
+		internal_dep = pvr_queue_get_paired_frag_job_dep(job);
 
 	return internal_dep;
 }

-- 
2.43.0


