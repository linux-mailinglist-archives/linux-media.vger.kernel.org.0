Return-Path: <linux-media+bounces-57557-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMBeFIowymkA6AUAu9opvQ
	(envelope-from <linux-media+bounces-57557-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:12:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12741356F23
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5A2C300E24A
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7103AE190;
	Mon, 30 Mar 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="smMB3OvY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49C43ACA51;
	Mon, 30 Mar 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858339; cv=none; b=tpBJvdS5Kk71xv7dOv8/yRkekz+2bao8LyNHG9Av4mW/+qJnl7wNVqSvM2CdzpRsl3Hpa3UjvNwyrhp+lLDMRGwbDBo/IZb6WVCrTXSS2YLBvV0A7wz6iL7VNR6baiYnQO5587SOOMgQbK/VPyssLZNGDp1hqSObix1NDdNg1eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858339; c=relaxed/simple;
	bh=/yF7BgXFlPY5bgvNPfE6BIw+//D50tMFfBnZCd0SRJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aUfGjvWDNZwwFHsbIPB/135Ehp/+rJVnnnoovBmprqLWO4s2X4X8IbKks5auSaFspz0lpQXWWpNy5757gDdEMoNCrNMpwuGo3NaM+XF/0s8lobgGFh5L/nQJLOF3lQIqTXAph0a2usNmqBd4P8bdxl1Ugz6hILMrpHzDGvpYY5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=smMB3OvY; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5HJTp174202;
	Mon, 30 Mar 2026 08:57:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=j
	hCCpkEt+BkB84N1zMr4Vl04qUsVX6qxkMXkjdr3+Xg=; b=smMB3OvY7SY0HkV1k
	7bkGL23Yc9LMGcLqO7mJvkL4fP/hEYA/prpNDfmU4I1okFZB+APeoJpyLKHgzoJd
	BzbnVYp//WENvpChim7jTe+AKWFCZMfb/AEogJ520PSPMCAp5veUiytPwiU7F2NG
	RN/p/TpB29n+65SMFanMWylU5PTmNAssaCYRRe6QBYIjg/Aras49whi/0K1UaAsG
	YVhem+UgO46pW0uuSChbb6vzJxqRBfE8w+TF28T1EzATZAIbrxxEcmjS93QpR167
	s1ueOo7kmbQla6659hT7ZkyCFziz/qp2kaxcZWY9yp2aMnHMtKyIwfC694WBNoB1
	ISFdA==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4d67xusfkv-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:57:03 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.106) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 08:57:01 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Mon, 30 Mar 2026 08:56:43 +0100
Subject: [PATCH 8/8] drm/imagination: Minor improvements to job submission
 code documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260330-job-submission-fixes-cleanup-v1-8-7de8c09cef8c@imgtec.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774857418; l=5384;
 i=alessio.belle@imgtec.com; s=20251208; h=from:subject:message-id;
 bh=/yF7BgXFlPY5bgvNPfE6BIw+//D50tMFfBnZCd0SRJg=;
 b=vzkL/Rb9EvRS8z1K3VHubqV2TS66bAjYhwngM7cK+U0Y1w9kTtqr4cL/EPYutBLkvx9VKkx1f
 hiQ280MZ06ZBnpOBZpcqgG5aGIpKEO681AwfTjxUzYO6qyZ6MSotSUi
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=2Vtuk+GKBRjwMqIHpKk+Gx6zl7cgtq0joszcOc0zF4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MSBTYWx0ZWRfXzfQ1IDE1g9IL
 DtTr64FZbO4eQUEIc48jvCjh9kHOf02NQfmlo58hbt0LC9X345+aLuoSzG/uwZjdU+gDjEZzWw/
 pZ4/Un439IC4Mrt/aOmDv3Y0fn1G8ETGh+v+hg3vlcjjRQCgwyS3bCxUqbAGKTaQmzS0ldOUNzb
 4aI+dD80jSXOJXxdbr4GV/dftdq/HnZc1UuPdNfQto8yC56mbLNHVgNWmfBRdjQLRbTOLPJ7zja
 1PhddJ+szUBJEuL0g2IMQXtGznY+eiTAHs4V42NzugL/U4XcShXiS2mkuz6PcebhgpjYlWBrfSb
 Dg6zOkV+swOPVYXz7veHELpVcKqCjdaozM15H3ClClY/9o1UAMhtjW9EB4rU7gwwPebMxpjDQXy
 O1aC4Wx1K+banTkgeCoy/XAqV0TU4Ob/CMet7FOihOr+AeXqqu4JmB5RZz2yl/IwyS37ESJQXEO
 T97JAQDhlwPbenqByUA==
X-Authority-Analysis: v=2.4 cv=QO9lhwLL c=1 sm=1 tr=0 ts=69ca2ccf cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=txNhvCuK94MA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=KCFfvmjXgMu-EKTFBUoA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: hqAUf5kEAgU4PDF-85MHTxc2iYqDLrnB
X-Proofpoint-ORIG-GUID: hqAUf5kEAgU4PDF-85MHTxc2iYqDLrnB
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57557-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: 12741356F23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mixed list of clarifications and typo fixes.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_queue.c            | 38 ++++++++++++++--------
 .../gpu/drm/imagination/pvr_rogue_fwif_shared.h    | 10 +-----
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 303f4d6cc09e..b5bec656d13c 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -200,6 +200,13 @@ pvr_queue_fence_is_ufo_backed(struct dma_fence *f)
  * already backed by a UFO.
  * @f: The dma_fence to turn into a pvr_queue_fence.
  *
+ * This could be called on:
+ * - a job fence directly, in which case it simply returns the containing pvr_queue_fence;
+ * - a drm_sched_fence's scheduled or finished fence, in which case it will first try to follow
+ *   the parent pointer to find the job fence (note that the parent pointer is initialized
+ *   only after the run_job() callback is called on the drm_sched_fence's owning job);
+ * - any other dma_fence, in which case it will return NULL.
+ *
  * Return:
  *  * A non-NULL pvr_queue_fence object if the dma_fence is backed by a UFO, or
  *  * NULL otherwise.
@@ -367,11 +374,14 @@ static u32 ufo_cmds_size(u32 elem_count)
 
 static u32 job_cmds_size(struct pvr_job *job, u32 ufo_wait_count)
 {
-	/* One UFO cmd for the fence signaling, one UFO cmd per native fence native,
-	 * and a command for the job itself.
+	/*
+	 * One UFO command per native fence this job will be waiting on (unless any are
+	 * signaled by the time the job is submitted), plus a command for the job itself,
+	 * plus one UFO command for the fence signaling.
 	 */
-	return ufo_cmds_size(1) + ufo_cmds_size(ufo_wait_count) +
-	       pvr_cccb_get_size_of_cmd_with_hdr(job->cmd_len);
+	return ufo_cmds_size(ufo_wait_count) +
+	       pvr_cccb_get_size_of_cmd_with_hdr(job->cmd_len) +
+	       ufo_cmds_size(1);
 }
 
 static bool
@@ -517,12 +527,16 @@ pvr_queue_get_paired_frag_job_dep(struct pvr_job *job)
 	if (!frag_job)
 		return NULL;
 
+	/* Have the geometry job wait on the paired fragment job's dependencies as well. */
 	xa_for_each(&frag_job->base.dependencies, index, f) {
 		/* Skip already signaled fences. */
 		if (dma_fence_is_signaled(f))
 			continue;
 
-		/* Skip our own fence. */
+		/*
+		 * The paired job fence won't be signaled until both jobs have
+		 * been submitted, so we can't wait on it to schedule them.
+		 */
 		if (f == &job->base.s_fence->scheduled)
 			continue;
 
@@ -665,6 +679,7 @@ static void pvr_queue_submit_job_to_cccb(struct pvr_job *job)
 		if (!jfence)
 			continue;
 
+		/* Some dependencies might have been signaled since prepare_job() */
 		if (dma_fence_is_signaled(&jfence->base))
 			continue;
 
@@ -714,7 +729,7 @@ static void pvr_queue_submit_job_to_cccb(struct pvr_job *job)
 	pvr_cccb_write_command_with_header(cccb, job->fw_ccb_cmd_type, job->cmd_len, job->cmd,
 					   job->id, job->id);
 
-	/* Signal the job fence. */
+	/* Update command to signal the job fence. */
 	pvr_fw_object_get_fw_addr(queue->timeline_ufo.fw_obj, &ufos[0].addr);
 	ufos[0].value = job->done_fence->seqno;
 	pvr_cccb_write_command_with_header(cccb, ROGUE_FWIF_CCB_CMD_TYPE_UPDATE,
@@ -744,10 +759,8 @@ static struct dma_fence *pvr_queue_run_job(struct drm_sched_job *sched_job)
 	}
 
 	/* The only kind of jobs that can be paired are geometry and fragment, and
-	 * we bail out early if we see a fragment job that's paired with a geomtry
-	 * job.
-	 * Paired jobs must also target the same context and point to the same
-	 * HWRT.
+	 * we bail out early if we see a fragment job that's paired with a geometry job.
+	 * Paired jobs must also target the same context and point to the same HWRT.
 	 */
 	if (WARN_ON(job->paired_job &&
 		    (job->type != DRM_PVR_JOB_TYPE_GEOMETRY ||
@@ -966,9 +979,8 @@ pvr_queue_signal_done_fences(struct pvr_queue *queue)
 }
 
 /**
- * pvr_queue_check_job_waiting_for_cccb_space() - Check if the job waiting for CCCB space
- * can be unblocked
- * pushed to the CCCB
+ * pvr_queue_check_job_waiting_for_cccb_space() - Check if a job waiting for CCCB space
+ * can be unblocked and pushed to the CCCB.
  * @queue: Queue to check
  *
  * If we have a job waiting for CCCB, and this job now fits in the CCCB, we signal
diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h b/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
index 869d904e3649..fe54c1cad7a9 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
@@ -14,15 +14,7 @@
 
 #define ROGUE_NUM_GEOM_CORES_SIZE 2U
 
-/*
- * Maximum number of UFOs in a CCB command.
- * The number is based on having 32 sync prims (as originally), plus 32 sync
- * checkpoints.
- * Once the use of sync prims is no longer supported, we will retain
- * the same total (64) as the number of sync checkpoints which may be
- * supporting a fence is not visible to the client driver and has to
- * allow for the number of different timelines involved in fence merges.
- */
+/* Maximum number of UFOs in a CCB command. */
 #define ROGUE_FWIF_CCB_CMD_MAX_UFOS (32U + 32U)
 
 /*

-- 
2.43.0


