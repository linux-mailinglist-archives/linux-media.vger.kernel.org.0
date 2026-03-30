Return-Path: <linux-media+bounces-57560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLmcBMIwymkA6AUAu9opvQ
	(envelope-from <linux-media+bounces-57560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:13:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA4E356F60
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C89D301D31B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8133AEF5A;
	Mon, 30 Mar 2026 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="fD+vwSqu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C093ACA6B;
	Mon, 30 Mar 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858340; cv=none; b=FV+QOZEnIhaIYUPet5kEx9vh4KvKHCkxydsh3SmIQ23OGSeMuuiEXL6uB6GXFg9znlRlXuLRsqLQm67t3YHhkPRvlhHNct6UpaiREAh2BIwsY6ZGnZHHtHPo50ImCZ75ENFWua3VIztDzsYTVWSxFkhrT2WICrJwI4yQiJNddO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858340; c=relaxed/simple;
	bh=wKjXJFqWeTAgI5IR63yIm5CTJ4kzsbDkfI4R87cC/mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sxcgiPR+BeUYkahfrkTso0uNKpO40n8s3CzsPZy1+t6sN2t8Bp6lSHICsu/py82U3D2Bw+/ZFDo7WymQCN+2TTzGY649jjUg2z/dQQTO7UpUmStFSboBtaGWVSoFOXoNBjLKXPibPJfjRnBiQycqdtEZK+YNJ1RIYsAH5tmItu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=fD+vwSqu; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5HJTi174202;
	Mon, 30 Mar 2026 08:57:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=3
	wZDnaH+feEDKlSy0EuW3u44hA4Mz71lJfa0cw+XKSc=; b=fD+vwSquK7hE2uxhl
	cRZ5rO/4BkNMFVbtkRMpK1B5ZONq1xAQLZb3ab9G6RtFGLfy+mcDtw7KgxpJ37CH
	zLvmGNKkbCcZ2ZDCcsanzA3y5G1pzfXxj04pkZyQ04pRqK+O0///WvTWMHmDggug
	LMFWwIL4vuoM30b2rmauxgqR6+V/+/o+9nuoj3jBN5/U/Y7nZP2BS/wRzvvg6ney
	uUH4zGXDd2lAy/r51tmsjwRGBkwKNCsIqNA0z8XbSZwvIRh/EKGFcHMMJH9sHJsj
	wMdQxSJlORG1uqXmJ/CoeQxVH2owg5EVi8xzSpE04qjc4QZfOV+5gpnLzuo5dE9A
	96zIw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4d67xusfkv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:57:00 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.106) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 08:56:59 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Mon, 30 Mar 2026 08:56:36 +0100
Subject: [PATCH 1/8] drm/imagination: Count paired job fence as dependency
 in prepare_job()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260330-job-submission-fixes-cleanup-v1-1-7de8c09cef8c@imgtec.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774857418; l=5861;
 i=alessio.belle@imgtec.com; s=20251208; h=from:subject:message-id;
 bh=wKjXJFqWeTAgI5IR63yIm5CTJ4kzsbDkfI4R87cC/mc=;
 b=c0bP4kLXTzDwLuUDEj9PIZ3HXIUNOz05Jr2kq9sSW76g8lEh8Yui/uE//fJJDweaPrKrze2my
 CcWvmiEqE6ZCzU/Y5k7vrUQND53sYci+YMupgQJfN+5PU3Gn+xDK7MG
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=2Vtuk+GKBRjwMqIHpKk+Gx6zl7cgtq0joszcOc0zF4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MSBTYWx0ZWRfX/N7qpW4/2LB1
 eae7z9vuC8F0ddChcs6a0Wf1x17yvi9N7r651jLqe1cXz4/ceHXlcFodL7GFjXFteAGSZ3lPws0
 X1XoxDz2yizzvcNFSqUhAy98YjUzAlxaPOiOVfm3MDf6WNYqJ9yKRgWSvCodkWCp+GS42wa5QL8
 JI/jrHRmWw4GWMz0GhyWJV9WGg/f13QTMcerKpkVRRX7HCmstSmJC4If7FbU01Azfryazk3tjDu
 nA13eKOmsuv5Ne9oCgE7u+d9rDshs1jdtrG1PfSiVYrTuIxLGXJzO6/a3t0EOwjW4mAOniF3RlF
 64dQJI6ABvc78+zQ1JGWz6kKC687DXPtNJ7kk1U7XHUQHGUw43oIkgek0CC8KfRb5fuk7RVSA3z
 ey7TjhcIaifZRUVxjf0VAeuZXXYiB7bhHD/pOL17mvcDnUVZEeteRzliGFTrOrBZxvMQ1vyjvhp
 uZPp/TOCzj2d6cRIVdA==
X-Authority-Analysis: v=2.4 cv=QO9lhwLL c=1 sm=1 tr=0 ts=69ca2ccc cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=txNhvCuK94MA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=TaBFbORYhpiWZ8GSrjAA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: G79BI5Zqk6h1XdZcmjflEqYcXrG6dwHH
X-Proofpoint-ORIG-GUID: G79BI5Zqk6h1XdZcmjflEqYcXrG6dwHH
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57560-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alessio.belle@imgtec.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:dkim,imgtec.com:email,imgtec.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BA4E356F60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DRM scheduler's prepare_job() callback counts the remaining
non-signaled native dependencies for a job, preventing job submission
until those (plus job data and fence update) can fit in the job queue's
CCCB.

This means checking which dependencies can be waited upon in the
firmware, i.e. whether they are backed by a UFO object, i.e. whether
their drm_sched_fence::parent has been assigned to a
pvr_queue_fence::base fence. That happens when the job owning the fence
is submitted to the firmware.

Paired geometry and fragment jobs are submitted at the same time, which
means the dependency between them can't be checked this way before
submission.

Update job_count_remaining_native_deps() to take into account the
dependency between paired jobs.

This fixes cases where prepare_job() underestimated the space left in
an almost full fragment CCCB, wrongly unblocking run_job(), which then
returned early without writing the full sequence of commands to the
CCCB.

The above lead to kernel warnings such as the following and potentially
job timeouts (depending on waiters on the missing commands):

  [  375.702979] WARNING: drivers/gpu/drm/imagination/pvr_cccb.c:178 at pvr_cccb_write_command_with_header+0x2c4/0x330 [powervr], CPU#1: kworker/u16:3/47
  [  375.703160] Modules linked in:
  [  375.703571] CPU: 1 UID: 0 PID: 47 Comm: kworker/u16:3 Tainted: G        W           7.0.0-rc2-g817eb6b11ad5 #40 PREEMPT
  [  375.703613] Tainted: [W]=WARN
  [  375.703627] Hardware name: Texas Instruments AM625 SK (DT)
  [  375.703645] Workqueue: powervr-sched drm_sched_run_job_work [gpu_sched]
  [  375.703741] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  [  375.703764] pc : pvr_cccb_write_command_with_header+0x2c4/0x330 [powervr]
  [  375.703847] lr : pvr_queue_submit_job_to_cccb+0x578/0xa70 [powervr]
  [  375.703921] sp : ffff800084a97650
  [  375.703934] x29: ffff800084a97740 x28: 0000000000000958 x27: ffff80008565d000
  [  375.703979] x26: 0000000000000030 x25: ffff800084a97680 x24: 0000000000001000
  [  375.704017] x23: ffff800084a97820 x22: 1ffff00010952ecc x21: 0000000000000008
  [  375.704056] x20: 00000000000006a8 x19: ffff00002ff7da88 x18: 0000000000000000
  [  375.704093] x17: 0000000020020000 x16: 0000000000020000 x15: 0000000000000000
  [  375.704132] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
  [  375.704168] x11: 000000000000f2f2 x10: 00000000f3000000 x9 : 00000000f3f3f3f3
  [  375.704206] x8 : 00000000f2f2f200 x7 : ffff700010952ecc x6 : 0000000000000008
  [  375.704243] x5 : 0000000000000000 x4 : 1ffff00010acba00 x3 : 0000000000000000
  [  375.704279] x2 : 0000000000000007 x1 : 0000000000000fff x0 : 000000000000002f
  [  375.704317] Call trace:
  [  375.704331]  pvr_cccb_write_command_with_header+0x2c4/0x330 [powervr] (P)
  [  375.704411]  pvr_queue_submit_job_to_cccb+0x578/0xa70 [powervr]
  [  375.704487]  pvr_queue_run_job+0x3a4/0x990 [powervr]
  [  375.704562]  drm_sched_run_job_work+0x580/0xd48 [gpu_sched]
  [  375.704623]  process_one_work+0x520/0x1288
  [  375.704658]  worker_thread+0x3f0/0xb3c
  [  375.704680]  kthread+0x334/0x3d8
  [  375.704706]  ret_from_fork+0x10/0x20
  [  375.704736] ---[ end trace 0000000000000000 ]---

Fixes: eaf01ee5ba28 ("drm/imagination: Implement job submission and scheduling")
Cc: stable@vger.kernel.org
Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_queue.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index dd88949f6194..836feaa0b295 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -179,7 +179,7 @@ static const struct dma_fence_ops pvr_queue_job_fence_ops = {
 
 /**
  * to_pvr_queue_job_fence() - Return a pvr_queue_fence object if the fence is
- * backed by a UFO.
+ * already backed by a UFO.
  * @f: The dma_fence to turn into a pvr_queue_fence.
  *
  * Return:
@@ -356,6 +356,15 @@ static u32 job_cmds_size(struct pvr_job *job, u32 ufo_wait_count)
 	       pvr_cccb_get_size_of_cmd_with_hdr(job->cmd_len);
 }
 
+static bool
+is_paired_job_fence(struct dma_fence *fence, struct pvr_job *job)
+{
+	/* This assumes "fence" is one of "job"'s drm_sched_job::dependencies */
+	return job->type == DRM_PVR_JOB_TYPE_FRAGMENT &&
+	       job->paired_job &&
+	       &job->paired_job->base.s_fence->scheduled == fence;
+}
+
 /**
  * job_count_remaining_native_deps() - Count the number of non-signaled native dependencies.
  * @job: Job to operate on.
@@ -371,6 +380,17 @@ static unsigned long job_count_remaining_native_deps(struct pvr_job *job)
 	xa_for_each(&job->base.dependencies, index, fence) {
 		struct pvr_queue_fence *jfence;
 
+		if (is_paired_job_fence(fence, job)) {
+			/*
+			 * A fence between paired jobs won't resolve to a pvr_queue_fence (i.e.
+			 * be backed by a UFO) until the jobs have been submitted, together.
+			 * The submitting code will insert a partial render fence command for this.
+			 */
+			WARN_ON(dma_fence_is_signaled(fence));
+			remaining_count++;
+			continue;
+		}
+
 		jfence = to_pvr_queue_job_fence(fence);
 		if (!jfence)
 			continue;
@@ -630,9 +650,8 @@ static void pvr_queue_submit_job_to_cccb(struct pvr_job *job)
 		if (!jfence)
 			continue;
 
-		/* Skip the partial render fence, we will place it at the end. */
-		if (job->type == DRM_PVR_JOB_TYPE_FRAGMENT && job->paired_job &&
-		    &job->paired_job->base.s_fence->scheduled == fence)
+		/* This fence will be placed last, as partial render fence. */
+		if (is_paired_job_fence(fence, job))
 			continue;
 
 		if (dma_fence_is_signaled(&jfence->base))

-- 
2.43.0


