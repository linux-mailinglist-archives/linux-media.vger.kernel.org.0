Return-Path: <linux-media+bounces-22821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3859E80E9
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 17:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E469188443E
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 16:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA3514EC73;
	Sat,  7 Dec 2024 16:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5lKRPnF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C09719CC2A;
	Sat,  7 Dec 2024 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588290; cv=none; b=shO8k/ByT+KIs5MHhnrAb9juzOGJN9VOYuB7F5vfPL1ol/bYbIhhZgDWZh7T3qlp4S2YSK9ncjbpJdaXjM1PVJd0bmIxFSmJebmufmcojMimXBuMIfUPMUOwOI5uC2ZkgXvXESS7Wmk7UsevEv2JvaYzkodgG12uhrIkIQJRK5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588290; c=relaxed/simple;
	bh=6F5rXoC0rbYASUq61SmXckbMTT9CcibObyF+eUK2tgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNvtBCJ2f124EPQDaorRfmBYH61xAiIUUUZHeCh+pKJAVwhjRElDlAZbKnF3Z/QvIHLUrXLywzBPViqu56dTJYrpAevmgRgNSyhMkrRNW/4z1E9lMH2svc3I8D7dIN+DRoEDR5Jxr63UqMgp/1iHSKENrYBF/69J8UHchI6bCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5lKRPnF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21561af95c3so25781035ad.3;
        Sat, 07 Dec 2024 08:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588287; x=1734193087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h1uhcGe1shthBGxBVlrXLlTzIKG363gSG371Gar4pg=;
        b=G5lKRPnFEyCv1UrIGho9ERr03kMK9r3dGyXqqs4HkzRRgu3Nczgg9wisuVRirAKsUj
         MJiaXsfHZR6jvsvhdBVh4ZWtj20SrXCmZ/sGyXo7niVFjxFnkfKqlOumk4gQkF8C5BVr
         o5KSIClOA12flfop8iG89sguyXBKm6wJ16sHzfde0VjBNgDHuX+3bwXNpokioj8bdjvj
         qSYqNYtRWkJT8JKd4czwDtMaa44xGXvadX04PySOL/1IFBccRlKqi48BLtFbNaXcjJaG
         uljU6bTBtdr1FavC0/O6wlPELIAvHI2b8t83R6ko7BNx/qvrun9bcyvFhNraMGa0cteF
         ggOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588287; x=1734193087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h1uhcGe1shthBGxBVlrXLlTzIKG363gSG371Gar4pg=;
        b=rdoZlawxa5e+NMqZC6qtFQ6S/azi1EjZak1mR4oqzT0e+wIMgZNBJfyMcAHZE69kQ7
         qIPPT2QOVMzKqNWgBKSisU0g6+NNFZTBrtKVWEkFlYw+8VgB6L8PJOHR1ZYil6r2Sxmj
         99ER+Vm5LXfR3WNrpY3XxzpKpR5JDL6XoSRltUBk+nwL59DHdILRgUbFxJnw8Pv3Mc2K
         kuPwyWWp4at1JiDCDtak0Q6CDZPZheJs8vrHEhIW4l7+6A4ifT9Cl8BEtmn814KymiWB
         Fqgix2CMSf9WwQ86CkDxepiSMFO/8hkuEWIIOShAco3gKjjYAfOmaAVDalXzQUd/Jsxy
         usfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEqAxnpBHLXqX6hCszzk0BvW1YKvexLK6rgDuItI8iVBL/Nw62WdCfR99ta+cp5RkBSI8VRGyg/I4uMuM=@vger.kernel.org, AJvYcCXU3DLXSsKzNxcNoErJTHZG6yzp1dL21xKEr3WVPVLitVS6gLhOb6j3JNI8Jt90FPXZ6gitQu6NjvKyNf0f@vger.kernel.org, AJvYcCXsFfW0kKzXY6nQcK5pB8/2xsTS0Qm/Z/TFh7JC3V7ktRpxuXdmLybOAS38uRcMLFgwKwr058FnkNPSpQbA@vger.kernel.org
X-Gm-Message-State: AOJu0YxzAAs0MhOq0J8rmqT7Ebvk8nfk3n2K2ZOepjwSVIvsDqsic9wU
	Sru3sKRervItDoMd2YMymyDzQTpdkE3PxhmLkGc8rlJ6jhH4JTkJ
X-Gm-Gg: ASbGncssXQMCl/yQhlkYr4ewRHI+HsI7MlBuZEaI679xp08p6P2WVbPmVYJaJv3v4bz
	FJ6irwRtdocyXbIpTYKcS8/OAkkh5t5Kf0DA4E63Ly6Wz1c0hNe7B8LbYlTIyLLQxW9ckdqvIjp
	9Y0ykOF/CTAdJxNcIZbogPyft5+i5O+FJuX2/icJ2hihZDF8Vi3nMayrEaexxa5sR7kyfxSdnpD
	b3WjLLi1dr4BWoY4WseiDX9ronUnRwxbOlSogGif+gwXsE7IMWTCwOXSDKat2jOtlNF5U583sJL
	SlRpvvcu
X-Google-Smtp-Source: AGHT+IHoc0cdu0fl4BkIxjrGdBeLkPtIQTBBV4VaO5/T66Kf51XXGOzTpAEPXBeRnjy6Om3Oobigjg==
X-Received: by 2002:a17:903:240a:b0:212:fa3:f627 with SMTP id d9443c01a7336-21614d457ebmr125472915ad.16.1733588286604;
        Sat, 07 Dec 2024 08:18:06 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21631bd2c2dsm9980865ad.263.2024.12.07.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [RFC 16/24] drm/msm: Extend SUBMIT ioctl for VM_BIND
Date: Sat,  7 Dec 2024 08:15:16 -0800
Message-ID: <20241207161651.410556-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This is a bit different than the path taken by other clean-slate
drivers.  But there is a lot in similar with BO pinning in the legacy
"EXEC" path and "VM_BIND" MAP path.  Also, we want the same fence and
syncobj handling.

(Why bother with fence fd's?  Because for virtgpu nctx for, guest
syncobj's exist only as dma_fence's between the guest kernel and host.)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        | 10 ++---
 drivers/gpu/drm/msm/msm_gem_submit.c | 65 ++++++++++++++++++++++++----
 include/uapi/drm/msm_drm.h           | 49 ++++++++++++++++++---
 3 files changed, 103 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7cb720137548..8e29e36ca9c5 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -345,13 +345,13 @@ struct msm_gem_submit {
 		uint32_t nr_relocs;
 		struct drm_msm_gem_submit_reloc *relocs;
 	} *cmd;  /* array of size nr_cmds */
-	struct {
+	struct msm_gem_submit_bo {
 		uint32_t flags;
-		union {
-			struct drm_gem_object *obj;
-			uint32_t handle;
-		};
+		uint32_t handle;
+		struct drm_gem_object *obj;
 		uint64_t iova;
+		uint64_t bo_offset;
+		uint64_t range;
 	} bos[];
 };
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 79bbe552f23e..9ac74f9a139e 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -115,23 +115,37 @@ void __msm_gem_submit_destroy(struct kref *kref)
 	kfree(submit);
 }
 
+static bool invalid_alignment(uint64_t addr)
+{
+	/*
+	 * Technically this is about GPU alignment, not CPU alignment.  But
+	 * I've not seen any qcom SoC where the SMMU does not support the
+	 * CPU's smallest page size.
+	 */
+	return !PAGE_ALIGNED(addr);
+}
+
 static int submit_lookup_objects(struct msm_gem_submit *submit,
 		struct drm_msm_gem_submit *args, struct drm_file *file)
 {
-	unsigned i;
+	unsigned i, bo_stride = args->bos_stride;
 	int ret = 0;
 
+	if (!bo_stride)
+		bo_stride = sizeof(struct drm_msm_gem_submit_bo);
+
 	for (i = 0; i < args->nr_bos; i++) {
-		struct drm_msm_gem_submit_bo submit_bo;
+		struct drm_msm_gem_submit_bo_v2 submit_bo = {0};
 		void __user *userptr =
-			u64_to_user_ptr(args->bos + (i * sizeof(submit_bo)));
+			u64_to_user_ptr(args->bos + (i * bo_stride));
+		unsigned copy_sz = min(bo_stride, sizeof(submit_bo));
 
 		/* make sure we don't have garbage flags, in case we hit
 		 * error path before flags is initialized:
 		 */
 		submit->bos[i].flags = 0;
 
-		if (copy_from_user(&submit_bo, userptr, sizeof(submit_bo))) {
+		if (copy_from_user(&submit_bo, userptr, copy_sz)) {
 			ret = -EFAULT;
 			i = 0;
 			goto out;
@@ -141,14 +155,27 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 #define MANDATORY_FLAGS (MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE)
 
 		if ((submit_bo.flags & ~MSM_SUBMIT_BO_FLAGS) ||
-			!(submit_bo.flags & MANDATORY_FLAGS)) {
+		    !(submit_bo.flags & MANDATORY_FLAGS))
 			ret = SUBMIT_ERROR(EINVAL, submit, "invalid flags: %x\n", submit_bo.flags);
+
+		if (invalid_alignment(submit_bo.address))
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid address: %016llx\n", submit_bo.address);
+
+		if (invalid_alignment(submit_bo.bo_offset))
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid bo_offset: %016llx\n", submit_bo.bo_offset);
+
+		if (invalid_alignment(submit_bo.range))
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid range: %016llx\n", submit_bo.range);
+
+		if (ret) {
 			i = 0;
 			goto out;
 		}
 
 		submit->bos[i].handle = submit_bo.handle;
 		submit->bos[i].flags = submit_bo.flags;
+		submit->bos[i].bo_offset = submit_bo.bo_offset;
+		submit->bos[i].range = submit_bo.range;
 	}
 
 	spin_lock(&file->table_lock);
@@ -167,6 +194,15 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		drm_gem_object_get(obj);
 
+		if (submit->bos[i].bo_offset > obj->size)
+			ret = SUBMIT_ERROR(EINVAL, submit, "bo_offset to large: %016llx\n", submit->bos[i].bo_offset);
+
+		if ((submit->bos[i].bo_offset + submit->bos[i].range) > obj->size)
+			ret = SUBMIT_ERROR(EINVAL, submit, "range to large: %016llx\n", submit->bos[i].range);
+
+		if (ret)
+			goto out_unlock;
+
 		submit->bos[i].obj = obj;
 	}
 
@@ -182,6 +218,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 static int submit_lookup_cmds(struct msm_gem_submit *submit,
 		struct drm_msm_gem_submit *args, struct drm_file *file)
 {
+	struct msm_context *ctx = file->driver_priv;
 	unsigned i;
 	size_t sz;
 	int ret = 0;
@@ -213,6 +250,19 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 			goto out;
 		}
 
+		if (msm_context_is_vmbind(ctx)) {
+			if (submit_cmd.nr_relocs) {
+				ret = SUBMIT_ERROR(EINVAL, submit, "nr_relocs must be zero");
+				goto out;
+			}
+			if (submit_cmd.submit_idx || submit_cmd.submit_offset) {
+				ret = SUBMIT_ERROR(EINVAL, submit, "submit_idx/offset must be zero");
+				goto out;
+			}
+
+			submit->cmd[i].iova = submit_cmd.iova;
+		}
+
 		submit->cmd[i].type = submit_cmd.type;
 		submit->cmd[i].size = submit_cmd.size / 4;
 		submit->cmd[i].offset = submit_cmd.submit_offset / 4;
@@ -665,9 +715,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!gpu)
 		return -ENXIO;
 
-	if (args->pad)
-		return -EINVAL;
-
 	if (to_msm_vm(ctx->vm)->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
@@ -677,7 +724,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (MSM_PIPE_ID(args->flags) != MSM_PIPE_3D0)
 		return UERR(EINVAL, dev, "invalid pipe");
 
-	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_FLAGS)
+	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_EXEC_FLAGS)
 		return UERR(EINVAL, dev, "invalid flags");
 
 	if (args->flags & MSM_SUBMIT_SUDO) {
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 072e82a80607..1a948d49c610 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -245,7 +245,10 @@ struct drm_msm_gem_submit_cmd {
 	__u32 size;           /* in, cmdstream size */
 	__u32 pad;
 	__u32 nr_relocs;      /* in, number of submit_reloc's */
-	__u64 relocs;         /* in, ptr to array of submit_reloc's */
+	union {
+		__u64 relocs; /* in, ptr to array of submit_reloc's */
+		__u64 iova;   /* cmdstream address (for VM_BIND contexts) */
+	};
 };
 
 /* Each buffer referenced elsewhere in the cmdstream submit (ie. the
@@ -264,6 +267,19 @@ struct drm_msm_gem_submit_cmd {
 #define MSM_SUBMIT_BO_DUMP             0x0004
 #define MSM_SUBMIT_BO_NO_IMPLICIT      0x0008
 
+/* Map OP for for submits to a VM_BIND submitqueue:
+ *  - MAP:      map a specified range of the BO into the VM
+ *  - MAP_NULL: map a NULL page into the specified range of the VM, handle
+ *              and bo_offset MBZ.  A NULL range will return zero on reads
+ *              and discard writes
+ *              see: VkPhysicalDeviceSparseProperties::residencyNonResidentStrict
+ *  - UNMAP:    unmap a specified VM range, handle and bo_offset MBZ
+ */
+#define MSM_SUBMIT_BO_OP_MASK          0xf000
+#define MSM_SUBMIT_BO_OP_MAP           0x0000
+#define MSM_SUBMIT_BO_OP_MAP_NULL      0x1000
+#define MSM_SUBMIT_BO_OP_UNMAP         0x2000
+
 #define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | \
 					MSM_SUBMIT_BO_WRITE | \
 					MSM_SUBMIT_BO_DUMP | \
@@ -272,7 +288,16 @@ struct drm_msm_gem_submit_cmd {
 struct drm_msm_gem_submit_bo {
 	__u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
 	__u32 handle;         /* in, GEM handle */
-	__u64 presumed;       /* in/out, presumed buffer address */
+	__u64 address;        /* in/out, presumed buffer address */
+};
+
+struct drm_msm_gem_submit_bo_v2 {
+	__u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
+	__u32 handle;         /* in, GEM handle */
+	__u64 address;        /* in/out, presumed buffer address */
+	/* Remaining fields are only used with MSM_SUBMIT_OP_VM_BIND/_ASYNC: */
+	__u64 bo_offset;
+	__u64 range;
 };
 
 /* Valid submit ioctl flags: */
@@ -283,7 +308,8 @@ struct drm_msm_gem_submit_bo {
 #define MSM_SUBMIT_SYNCOBJ_IN    0x08000000 /* enable input syncobj */
 #define MSM_SUBMIT_SYNCOBJ_OUT   0x04000000 /* enable output syncobj */
 #define MSM_SUBMIT_FENCE_SN_IN   0x02000000 /* userspace passes in seqno fence */
-#define MSM_SUBMIT_FLAGS                ( \
+
+#define MSM_SUBMIT_EXEC_FLAGS            ( \
 		MSM_SUBMIT_NO_IMPLICIT   | \
 		MSM_SUBMIT_FENCE_FD_IN   | \
 		MSM_SUBMIT_FENCE_FD_OUT  | \
@@ -293,6 +319,13 @@ struct drm_msm_gem_submit_bo {
 		MSM_SUBMIT_FENCE_SN_IN   | \
 		0)
 
+#define MSM_SUBMIT_VM_BIND_FLAGS         ( \
+		MSM_SUBMIT_FENCE_FD_IN   | \
+		MSM_SUBMIT_FENCE_FD_OUT  | \
+		MSM_SUBMIT_SYNCOBJ_IN    | \
+		MSM_SUBMIT_SYNCOBJ_OUT   | \
+		0)
+
 #define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
 #define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
 		MSM_SUBMIT_SYNCOBJ_RESET | \
@@ -307,14 +340,17 @@ struct drm_msm_gem_submit_syncobj {
 /* Each cmdstream submit consists of a table of buffers involved, and
  * one or more cmdstream buffers.  This allows for conditional execution
  * (context-restore), and IB buffers needed for per tile/bin draw cmds.
+ *
+ * For MSM_SUBMIT_VM_BIND/_ASYNC operations, the queue must have been
+ * created with the MSM_SUBMITQUEUE_VM_BIND flag.
  */
 struct drm_msm_gem_submit {
 	__u32 flags;          /* MSM_PIPE_x | MSM_SUBMIT_x */
 	__u32 fence;          /* out (or in with MSM_SUBMIT_FENCE_SN_IN flag) */
 	__u32 nr_bos;         /* in, number of submit_bo's */
-	__u32 nr_cmds;        /* in, number of submit_cmd's */
+	__u32 nr_cmds;        /* in, number of submit_cmd's, MBZ for VM_BIND queue */
 	__u64 bos;            /* in, ptr to array of submit_bo's */
-	__u64 cmds;           /* in, ptr to array of submit_cmd's */
+	__u64 cmds;           /* in, ptr to array of submit_cmd's, MBZ for VM_BIND queue */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
 	__u32 queueid;        /* in, submitqueue id */
 	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
@@ -322,8 +358,7 @@ struct drm_msm_gem_submit {
 	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
 	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
 	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
-	__u32 pad;            /*in, reserved for future use, always 0. */
-
+	__u32 bos_stride;     /* in, stride of bos array, if zero 16bytes used. */
 };
 
 #define MSM_WAIT_FENCE_BOOST	0x00000001
-- 
2.47.1


