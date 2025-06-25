Return-Path: <linux-media+bounces-35904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EDAE8DEB
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 21:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F09FB6A1212
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 19:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99D92F9492;
	Wed, 25 Jun 2025 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X63vZWpT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062782F5474
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877953; cv=none; b=PunYU3jxDEQQZj++6LpS8pwOnX7Z9hwb0TJO//E39EvXE6HPUrMgmAcVY6Zq0LNQV9RAIBRBS2JT7ycxIF8tCFj5wFtPqJuRE5qCD9dBqzumiKr+GV8yNmvNJsV8rMhKvcStq1ZIoJ0vVd3tJafbcgVRVvTzQMocSeIJc+v/Ckc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877953; c=relaxed/simple;
	bh=6P72wyHUP0Uts1ho71jfImK3Za+ySadWpObyOKq/Ij8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XASe4qNo5Fyy9y+Ybnwy9v9kggAF3vVAkQjrEXHDKeuYic8lpRma507uS1OYMpRlqq00oY5ZG1j5AV7/qY5e3sEHGamQNQ6C+W8g0e7tZzsG0TdfgZ5CBGKNaSDy9pcl7S4HKNY+aRdwkxjmNg7SZrGY5P6entiMyOXmRDtb8B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X63vZWpT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PC43NY017315
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XUBhuSPLTTK
	SJ37M+CTYeQmfyEx8yN+0MTUmq1WzjRY=; b=X63vZWpTVGeWh9Dso5ZsT2qob8I
	NXQmVmMKk6G4MDxuE974sR967Pwo43Lb6KKdNaXRZdUVCF4LZzuLEJOQiAG7Zg6J
	bCWCHADXYdSEiTY5eQ0P3EcZokGV2FIOoH2/XzcYNn5hUiIqQe97G7ZkzgXyoKQo
	Zhc70otpNEebgm7Am7EF+ZQg4+9x9J2DV8o1TjIAydO21l3S4okFTExh5uRYmet5
	BNJX0W4Fksdoo4oTv9ynhy3rKLIGQW01j0nD+qDgiPuUOUuhsMwzw1nT1eJC/F5j
	esBcQakgXBL/j4I/Ryt7rZlfmePIvjGylMpXjerjAt+caltKJRw8XGYgUJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4t5fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 18:59:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2349fe994a9so1238105ad.1
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 11:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877949; x=1751482749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUBhuSPLTTKSJ37M+CTYeQmfyEx8yN+0MTUmq1WzjRY=;
        b=kpLCzWRHb0c1TcrmTaxLggHim58gLq0BAWlkyiXX7jQiAsgtGgPTqhIqn1tgdKo9Kv
         vcmpXk0skD6zUuCelKK2fnUdBHWER1c/+w5QGuq2q9MxXxqBtDs1Klfwcr3xwFbRJFo5
         6wR0Gkg1WhSsyB4qTFbHNmUQyc66QwI5hA7FCC/X+gipPZnnWBAkWzEfc6PHMyHvdXrW
         kUWw6ZAGa4BDz0tN/53cZnZn8EgJ7sVMC03+4jMQmieVZDKvDaqVSmmhT81nfUkySauJ
         ByxFMeE+gZ4LyXD99GUPQ3qZ1kuPfxWRI5J1njQI0b3vaWMv3Rg+RbNjjzPkcPEo7raX
         EncA==
X-Forwarded-Encrypted: i=1; AJvYcCU2pK/sRkEaLxGS6HS8EZzJQJQGC1WqZDZhcq6/V8Rqy1GVWM2jkK0ueTTvyuabvA8m3tmdj+wliIDqDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUAupna+g+KZlF6t3BWCDnmwBEGy4WWI0WkV3P38ya/GYfSCe
	Z1mG3oq32gnueIbYW9Pw64fUsOcrc0deRL4dd6PF1vKErWGsIFgpSYJhxPbG2UncIjTZxVL1avC
	26sBiogZmqFRMGza8kM0T+vsraMOuzi4cLw5PhXd37HYAGgdZSZ4leXj8ecghbkMUOA==
X-Gm-Gg: ASbGnctrtHAMHDFLxuotLHdYxv7WNx/N+P/qA4Kzv05pX5W0qH+QD5TtXmPaq0mVZ9y
	jFZNHX6oDWmDXDN8ZD+JwuoQodF7C3F7Y+eLsvGa8KlbxVl/xrcwdSY8uzgkBi5DV1IilIoGiXc
	oPR4W+Wzj5fwSfLY7Ap8g2zXjJCLUs9HowMeqN5+XvqXc0I4c1uB1Paabx2/DkoBS99s+yrx/XD
	1haBGfhQQQkdJbf028u5Wp4dFGIhnNuyFwYmwM/ObKPTj0VBzph+P3+GV8cNML8kQuYz9noVhib
	8HrULTDXIFl3m0Ggxoc6hF76BSvd+pM2
X-Received: by 2002:a17:903:2f10:b0:234:f182:a759 with SMTP id d9443c01a7336-23824044709mr71556335ad.28.1750877949176;
        Wed, 25 Jun 2025 11:59:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvX5Sl/WDvH4+nu3fzC4yJunJqdJ8QtHBAtsyIN1MEJyeXJmSWnXLeTatrEQ7V5hMi05usVw==
X-Received: by 2002:a17:903:2f10:b0:234:f182:a759 with SMTP id d9443c01a7336-23824044709mr71555915ad.28.1750877948611;
        Wed, 25 Jun 2025 11:59:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8610177sm138762345ad.121.2025.06.25.11.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:08 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v7 31/42] drm/msm: Add VM_BIND submitqueue
Date: Wed, 25 Jun 2025 11:47:24 -0700
Message-ID: <20250625184918.124608-32-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685c46fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PnHp71_pcMtKiH-pJVMA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: vO4UizmZWM_x8CC25QQqRstaHIlXUzJQ
X-Proofpoint-ORIG-GUID: vO4UizmZWM_x8CC25QQqRstaHIlXUzJQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX7n1kIkIHrHd1
 pu0pvMQonoxhaWCNlPJuoN7hIfQc3FesV42VRnizQfmVjEYZMNnFcuTr1aV4kbBPqlNSsJtgrVb
 XWa5DD6TXiwTumA7SjxHeOM6NGub3GhWBJVWuxrRoB5gledlJLop4EdLsPctFG1+ZIDpV/TgrGh
 EcrlUzUqEtV4oTGjylVW37pZXy0RRoMGciXQRbKGmGVOMJpX8vCxbXul2ZyBljf3jPeQy7GYRBX
 5MtksHNRJJHihqT2J578c9/s22CfpuWntlN8JQYOS28o6VUbFJIz6ytOU2LAGPbY3aCzY2W5qTQ
 lLuLwsw+AGLroUdVOgnRfbarut7K/AcjektC9uESfTHnA0O/yyghY5zuXHenuZcLSDN9k6VKfV8
 e7nHsR0jP4XRyYCzBSq5C22WJ5JE9KROdXX+Lfz7ZM0/ju/7er9gwrJYGHb1S38CN3E0O77F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

This submitqueue type isn't tied to a hw ringbuffer, but instead
executes on the CPU for performing async VM_BIND ops.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h         | 12 +++++
 drivers/gpu/drm/msm/msm_gem_submit.c  | 60 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gem_vma.c     | 71 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         |  3 ++
 drivers/gpu/drm/msm/msm_submitqueue.c | 67 +++++++++++++++++++------
 include/uapi/drm/msm_drm.h            |  9 +++-
 6 files changed, 197 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index b44a4f7313c9..945a235d73cf 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -53,6 +53,13 @@ struct msm_gem_vm {
 	/** @base: Inherit from drm_gpuvm. */
 	struct drm_gpuvm base;
 
+	/**
+	 * @sched: Scheduler used for asynchronous VM_BIND request.
+	 *
+	 * Unused for kernel managed VMs (where all operations are synchronous).
+	 */
+	struct drm_gpu_scheduler sched;
+
 	/**
 	 * @mm: Memory management for kernel managed VA allocations
 	 *
@@ -71,6 +78,9 @@ struct msm_gem_vm {
 	 */
 	struct pid *pid;
 
+	/** @last_fence: Fence for last pending work scheduled on the VM */
+	struct dma_fence *last_fence;
+
 	/** @faults: the number of GPU hangs associated with this address space */
 	int faults;
 
@@ -100,6 +110,8 @@ struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed);
 
+void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
+
 struct msm_fence_context;
 
 #define MSM_VMA_DUMP (DRM_GPUVA_USERBITS << 0)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9f18771a1e88..e2174b7d0e40 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/dma-fence-unwrap.h>
 #include <linux/file.h>
 #include <linux/sync_file.h>
 #include <linux/uaccess.h>
@@ -258,30 +259,43 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
+	struct drm_exec *exec = &submit->exec;
 	int ret;
 
-// TODO need to add vm_bind path which locks vm resv + external objs
 	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		drm_exec_until_all_locked (&submit->exec) {
+			ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				return ret;
+
+			ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				return ret;
+		}
+
+		return 0;
+	}
+
 	drm_exec_until_all_locked (&submit->exec) {
 		ret = drm_exec_lock_obj(&submit->exec,
 					drm_gpuvm_resv_obj(submit->vm));
 		drm_exec_retry_on_contention(&submit->exec);
 		if (ret)
-			goto error;
+			return ret;
 		for (unsigned i = 0; i < submit->nr_bos; i++) {
 			struct drm_gem_object *obj = submit->bos[i].obj;
 			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
 			drm_exec_retry_on_contention(&submit->exec);
 			if (ret)
-				goto error;
+				return ret;
 		}
 	}
 
 	return 0;
-
-error:
-	return ret;
 }
 
 static int submit_fence_sync(struct msm_gem_submit *submit)
@@ -367,9 +381,18 @@ static void submit_unpin_objects(struct msm_gem_submit *submit)
 
 static void submit_attach_object_fences(struct msm_gem_submit *submit)
 {
-	int i;
+	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+	struct dma_fence *last_fence;
+
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		drm_gpuvm_resv_add_fence(submit->vm, &submit->exec,
+					 submit->user_fence,
+					 DMA_RESV_USAGE_BOOKKEEP,
+					 DMA_RESV_USAGE_BOOKKEEP);
+		return;
+	}
 
-	for (i = 0; i < submit->nr_bos; i++) {
+	for (unsigned i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
@@ -379,6 +402,10 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
 					   DMA_RESV_USAGE_READ);
 	}
+
+	last_fence = vm->last_fence;
+	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
+	dma_fence_put(last_fence);
 }
 
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
@@ -537,6 +564,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
+	if (queue->flags & MSM_SUBMITQUEUE_VM_BIND) {
+		ret = UERR(EINVAL, dev, "Invalid queue type");
+		goto out_post_unlock;
+	}
+
 	ring = gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
@@ -726,6 +758,18 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit_attach_object_fences(submit);
 
+	if (msm_context_is_vmbind(ctx)) {
+		/*
+		 * If we are not using VM_BIND, submit_pin_vmas() will validate
+		 * just the BOs attached to the submit.  In that case we don't
+		 * need to validate the _entire_ vm, because userspace tracked
+		 * what BOs are associated with the submit.
+		 */
+		ret = drm_gpuvm_validate(submit->vm, &submit->exec);
+		if (ret)
+			goto out;
+	}
+
 	/* The scheduler owns a ref now: */
 	msm_gem_submit_get(submit);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index e16a8cafd8be..cf37abb98235 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -16,6 +16,7 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	drm_mm_takedown(&vm->mm);
 	if (vm->mmu)
 		vm->mmu->funcs->destroy(vm->mmu);
+	dma_fence_put(vm->last_fence);
 	put_pid(vm->pid);
 	kfree(vm);
 }
@@ -154,6 +155,9 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
 };
 
+static const struct drm_sched_backend_ops msm_vm_bind_ops = {
+};
+
 /**
  * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
  * @drm: the drm device
@@ -195,6 +199,21 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		goto err_free_vm;
 	}
 
+	if (!managed) {
+		struct drm_sched_init_args args = {
+			.ops = &msm_vm_bind_ops,
+			.num_rqs = 1,
+			.credit_limit = 1,
+			.timeout = MAX_SCHEDULE_TIMEOUT,
+			.name = "msm-vm-bind",
+			.dev = drm->dev,
+		};
+
+		ret = drm_sched_init(&vm->sched, &args);
+		if (ret)
+			goto err_free_dummy;
+	}
+
 	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
 		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
 	drm_gem_object_put(dummy_gem);
@@ -206,8 +225,60 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	return &vm->base;
 
+err_free_dummy:
+	drm_gem_object_put(dummy_gem);
+
 err_free_vm:
 	kfree(vm);
 	return ERR_PTR(ret);
 
 }
+
+/**
+ * msm_gem_vm_close() - Close a VM
+ * @gpuvm: The VM to close
+ *
+ * Called when the drm device file is closed, to tear down VM related resources
+ * (which will drop refcounts to GEM objects that were still mapped into the
+ * VM at the time).
+ */
+void
+msm_gem_vm_close(struct drm_gpuvm *gpuvm)
+{
+	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
+	struct drm_gpuva *vma, *tmp;
+
+	/*
+	 * For kernel managed VMs, the VMAs are torn down when the handle is
+	 * closed, so nothing more to do.
+	 */
+	if (vm->managed)
+		return;
+
+	if (vm->last_fence)
+		dma_fence_wait(vm->last_fence, false);
+
+	/* Kill the scheduler now, so we aren't racing with it for cleanup: */
+	drm_sched_stop(&vm->sched, NULL);
+	drm_sched_fini(&vm->sched);
+
+	/* Tear down any remaining mappings: */
+	dma_resv_lock(drm_gpuvm_resv(gpuvm), NULL);
+	drm_gpuvm_for_each_va_safe (vma, tmp, gpuvm) {
+		struct drm_gem_object *obj = vma->gem.obj;
+
+		if (obj && obj->resv != drm_gpuvm_resv(gpuvm)) {
+			drm_gem_object_get(obj);
+			msm_gem_lock(obj);
+		}
+
+		msm_gem_vma_unmap(vma);
+		msm_gem_vma_close(vma);
+
+		if (obj && obj->resv != drm_gpuvm_resv(gpuvm)) {
+			msm_gem_unlock(obj);
+			drm_gem_object_put(obj);
+		}
+	}
+	dma_resv_unlock(drm_gpuvm_resv(gpuvm));
+}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 448ebf721bd8..9cbf155ff222 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -570,6 +570,9 @@ struct msm_gpu_submitqueue {
 	struct mutex lock;
 	struct kref ref;
 	struct drm_sched_entity *entity;
+
+	/** @_vm_bind_entity: used for @entity pointer for VM_BIND queues */
+	struct drm_sched_entity _vm_bind_entity[0];
 };
 
 struct msm_gpu_state_bo {
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8ced49c7557b..8617a82cd6b3 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -72,6 +72,9 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
+	if (queue->entity == &queue->_vm_bind_entity[0])
+		drm_sched_entity_destroy(queue->entity);
+
 	msm_context_put(queue->ctx);
 
 	kfree(queue);
@@ -102,7 +105,7 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 
 void msm_submitqueue_close(struct msm_context *ctx)
 {
-	struct msm_gpu_submitqueue *entry, *tmp;
+	struct msm_gpu_submitqueue *queue, *tmp;
 
 	if (!ctx)
 		return;
@@ -111,10 +114,17 @@ void msm_submitqueue_close(struct msm_context *ctx)
 	 * No lock needed in close and there won't
 	 * be any more user ioctls coming our way
 	 */
-	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
-		list_del(&entry->node);
-		msm_submitqueue_put(entry);
+	list_for_each_entry_safe(queue, tmp, &ctx->submitqueues, node) {
+		if (queue->entity == &queue->_vm_bind_entity[0])
+			drm_sched_entity_flush(queue->entity, MAX_WAIT_SCHED_ENTITY_Q_EMPTY);
+		list_del(&queue->node);
+		msm_submitqueue_put(queue);
 	}
+
+	if (!ctx->vm)
+		return;
+
+	msm_gem_vm_close(ctx->vm);
 }
 
 static struct drm_sched_entity *
@@ -160,8 +170,6 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
 	enum drm_sched_priority sched_prio;
-	extern int enable_preemption;
-	bool preemption_supported;
 	unsigned ring_nr;
 	int ret;
 
@@ -171,26 +179,53 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
-	preemption_supported = priv->gpu->nr_rings == 1 && enable_preemption != 0;
+	if (flags & MSM_SUBMITQUEUE_VM_BIND) {
+		unsigned sz;
 
-	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && preemption_supported)
-		return -EINVAL;
+		/* Not allowed for kernel managed VMs (ie. kernel allocs VA) */
+		if (!msm_context_is_vmbind(ctx))
+			return -EINVAL;
 
-	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
-	if (ret)
-		return ret;
+		if (prio)
+			return -EINVAL;
+
+		sz = struct_size(queue, _vm_bind_entity, 1);
+		queue = kzalloc(sz, GFP_KERNEL);
+	} else {
+		extern int enable_preemption;
+		bool preemption_supported =
+			priv->gpu->nr_rings == 1 && enable_preemption != 0;
+
+		if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && preemption_supported)
+			return -EINVAL;
 
-	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+		ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
+		if (ret)
+			return ret;
+
+		queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+	}
 
 	if (!queue)
 		return -ENOMEM;
 
 	kref_init(&queue->ref);
 	queue->flags = flags;
-	queue->ring_nr = ring_nr;
 
-	queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
-					 ring_nr, sched_prio);
+	if (flags & MSM_SUBMITQUEUE_VM_BIND) {
+		struct drm_gpu_scheduler *sched = &to_msm_vm(msm_context_vm(drm, ctx))->sched;
+
+		queue->entity = &queue->_vm_bind_entity[0];
+
+		drm_sched_entity_init(queue->entity, DRM_SCHED_PRIORITY_KERNEL,
+				      &sched, 1, NULL);
+	} else {
+		queue->ring_nr = ring_nr;
+
+		queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
+						 ring_nr, sched_prio);
+	}
+
 	if (IS_ERR(queue->entity)) {
 		ret = PTR_ERR(queue->entity);
 		kfree(queue);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 2c2fc4b284d0..6d6cd1219926 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -385,12 +385,19 @@ struct drm_msm_gem_madvise {
 /*
  * Draw queues allow the user to set specific submission parameter. Command
  * submissions specify a specific submitqueue to use.  ID 0 is reserved for
- * backwards compatibility as a "default" submitqueue
+ * backwards compatibility as a "default" submitqueue.
+ *
+ * Because VM_BIND async updates happen on the CPU, they must run on a
+ * virtual queue created with the flag MSM_SUBMITQUEUE_VM_BIND.  If we had
+ * a way to do pgtable updates on the GPU, we could drop this restriction.
  */
 
 #define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_VM_BIND	0x00000002  /* virtual queue for VM_BIND ops */
+
 #define MSM_SUBMITQUEUE_FLAGS		    ( \
 		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		MSM_SUBMITQUEUE_VM_BIND | \
 		0)
 
 /*
-- 
2.49.0


