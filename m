Return-Path: <linux-media+bounces-57561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGT3BLQwymkA6AUAu9opvQ
	(envelope-from <linux-media+bounces-57561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:13:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FFA356F58
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73E15300D1EC
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F923B19AB;
	Mon, 30 Mar 2026 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="PrqUUOvV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B623AD53F;
	Mon, 30 Mar 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858342; cv=none; b=EqZmEk/t3b1jOAaaDzk6c2vlOnyFy7xNCs0sNiZFyd1ImAZJc92IHOpYaYpy2jakyliN/h41U0xSWJdeUrXVaqOJWCqmetHO6owjLIDQ/DyZSr2Arg8uNxJjholu4jVEmv2pDAqWLy/PtShOuJdHervTF7lHlRa7qjrmhpO8HVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858342; c=relaxed/simple;
	bh=kdk/oC7sY4R+WxO1hIAkVwVRZkcXYFspZAuC3d55vOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lDKaLOy+Fs+WTs/XtPa4istJe+e/UklmM/7S5K0QRlfkkJhlaiKrDRPVEggfv+Y7g1qHo+cob4f7NJJLPF/ooM1QVVb0d5Uif9qYbs/q75eEQTsbDoMU2eFnWb7qFrtolZj7uamDSFMt8LJ+38FfWbwsQVDrj9/9jhEUdcjWJD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=PrqUUOvV; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5HJTl174202;
	Mon, 30 Mar 2026 08:57:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=h
	1sJSKMVxHc+3A5Iix0o1+ziE+itBfbRCmdfz7cB1kA=; b=PrqUUOvV3hsZliwYr
	vN/yhwxwhqrGs8+PPrBEduFaad90XiZYNylnl17+H/AjPkugo4E4zZCdZd8cTfzq
	dh+Z0+bsVd4yi6i7sZP3G3F4R2IWjmSTiFRjdtMp/FblUR85TObD+pVHigqm9GSy
	Sgpfjf30jT4e4SUu7OveahIsXwuJ3mF/jSv98dQnG/DxBbLQa4Th2VEoyVYIB8mG
	qbOkNLKd+LfYy9Hrm2iQKL+Zr1I4s1ZSNjeoLJuntp54TaR3sVRoDTRPNE7j/NkW
	CRZFxU2C9QnQHL59faIFNeBOyAK6UwZjTTwyg1btpRDx6lQua/rPn0Rq2LHfTXvH
	K2V+g==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4d67xusfkv-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:57:01 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.106) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 08:57:00 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Mon, 30 Mar 2026 08:56:40 +0100
Subject: [PATCH 5/8] drm/imagination: Rename fence returned by
 pvr_queue_job_arm()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260330-job-submission-fixes-cleanup-v1-5-7de8c09cef8c@imgtec.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774857418; l=2991;
 i=alessio.belle@imgtec.com; s=20251208; h=from:subject:message-id;
 bh=kdk/oC7sY4R+WxO1hIAkVwVRZkcXYFspZAuC3d55vOM=;
 b=VcUZVMk6a20FtQkGaKtDTkfhbKCkark8UL0R3e7epwd5wdGvTjTfFpUu/X9fKqe1ICbId9ZcD
 JxDHfv19+5ZBakvox4JkQUqONnn51vxpRPU3GD2pxqmUIxpHrXic5Qz
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=2Vtuk+GKBRjwMqIHpKk+Gx6zl7cgtq0joszcOc0zF4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MSBTYWx0ZWRfX032EfnSrGDqD
 AlQDA/W4dMKGIx2nMc3+glLUEFq8TwM789XPIu1ULwjgsZ2wRg8hq7f1WuRJsEq+MjRCdv/xHit
 DKHEnUOY5TD6uqiiUIFnZ2ECdGcDGeTAN6EdLKVDMlqEnyIEPIdCV2uyTDxOhon3Ia+gfr6/9l2
 RruBWI+2b65Wz5SKopHaflnWSEIMunxtSrRsXrLH0GO7MIWoHTK/lzYxzxJ87juUV6g7UQ4Fh0V
 6pgY86SoqIQjct3V6IEXjFfQVXDaE52GXLlF/O8hnOplR91mzUGg6KfLhQNi7oN6Rrs440Tq17Z
 IiA8fLB4RLA3kCwg5mdQcoMZNDS/PRY9YEWKNM0Th4YFYRgA4M2lQcFhxc0ChBpqN6yAESVDM78
 8cprBawsD4z8N+YnQxCOeYAW1a0S4aUY0QDx6Spo7tVYdailY4dovmJNEaVmZwt23HoIMGoQ9BS
 cPF9cHYdAAxTZTYQBsA==
X-Authority-Analysis: v=2.4 cv=QO9lhwLL c=1 sm=1 tr=0 ts=69ca2ccd cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=txNhvCuK94MA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=t4At8a9FtDHClisqYPoA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: abByBp9JlzIzgcVJF8B4tV6QyzPaiTP2
X-Proofpoint-ORIG-GUID: abByBp9JlzIzgcVJF8B4tV6QyzPaiTP2
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57561-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alessio.belle@imgtec.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:dkim,imgtec.com:email,imgtec.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E1FFA356F58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename from done_fence to finished_fence, both because the function
returns a drm_sched_fence's finished fence, and to avoid confusion with
the job fence, which is called the same but has a different purpose.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_job.c  | 8 ++++----
 drivers/gpu/drm/imagination/pvr_sync.c | 4 ++--
 drivers/gpu/drm/imagination/pvr_sync.h | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/imagination/pvr_job.c
index 0c2f511a6178..dd9f5df01e08 100644
--- a/drivers/gpu/drm/imagination/pvr_job.c
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -326,7 +326,7 @@ prepare_job_syncs(struct pvr_file *pvr_file,
 		  struct pvr_job_data *job_data,
 		  struct xarray *signal_array)
 {
-	struct dma_fence *done_fence;
+	struct dma_fence *finished_fence;
 	int err = pvr_sync_signal_array_collect_ops(signal_array,
 						    from_pvr_file(pvr_file),
 						    job_data->sync_op_count,
@@ -359,13 +359,13 @@ prepare_job_syncs(struct pvr_file *pvr_file,
 			return err;
 	}
 
-	/* We need to arm the job to get the job done fence. */
-	done_fence = pvr_queue_job_arm(job_data->job);
+	/* We need to arm the job to get the job finished fence. */
+	finished_fence = pvr_queue_job_arm(job_data->job);
 
 	err = pvr_sync_signal_array_update_fences(signal_array,
 						  job_data->sync_op_count,
 						  job_data->sync_ops,
-						  done_fence);
+						  finished_fence);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/imagination/pvr_sync.c b/drivers/gpu/drm/imagination/pvr_sync.c
index 757a18b1ab8f..936f840a5221 100644
--- a/drivers/gpu/drm/imagination/pvr_sync.c
+++ b/drivers/gpu/drm/imagination/pvr_sync.c
@@ -160,7 +160,7 @@ int
 pvr_sync_signal_array_update_fences(struct xarray *array,
 				    u32 sync_op_count,
 				    const struct drm_pvr_sync_op *sync_ops,
-				    struct dma_fence *done_fence)
+				    struct dma_fence *finished_fence)
 {
 	for (u32 i = 0; i < sync_op_count; i++) {
 		struct dma_fence *old_fence;
@@ -175,7 +175,7 @@ pvr_sync_signal_array_update_fences(struct xarray *array,
 			return -EINVAL;
 
 		old_fence = sig_sync->fence;
-		sig_sync->fence = dma_fence_get(done_fence);
+		sig_sync->fence = dma_fence_get(finished_fence);
 		dma_fence_put(old_fence);
 
 		if (WARN_ON(!sig_sync->fence))
diff --git a/drivers/gpu/drm/imagination/pvr_sync.h b/drivers/gpu/drm/imagination/pvr_sync.h
index db6ccfda104a..48501ad27794 100644
--- a/drivers/gpu/drm/imagination/pvr_sync.h
+++ b/drivers/gpu/drm/imagination/pvr_sync.h
@@ -70,7 +70,7 @@ int
 pvr_sync_signal_array_update_fences(struct xarray *array,
 				    u32 sync_op_count,
 				    const struct drm_pvr_sync_op *sync_ops,
-				    struct dma_fence *done_fence);
+				    struct dma_fence *finished_fence);
 
 void
 pvr_sync_signal_array_push_fences(struct xarray *array);

-- 
2.43.0


