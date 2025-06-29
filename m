Return-Path: <linux-media+bounces-36206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2115AED0F7
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC4F91896839
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5157266577;
	Sun, 29 Jun 2025 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyNcTa4+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2487265CB3
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228243; cv=none; b=Iwqt9YEHJdJx4aSZ1x2UPXzL7OFfW9zQFrKL7aFCsvrxkeXwMQU1QO/W3DK9wsGnu6+4eOfjkKgqt1iU8FI2eh0Kl8S2sbwUWuXOCX7NCUnOt5xnuXa/xPMCk+zyNoohIxfFu2vyskGzCaKLSzZ7n1hgwgiOGiA4Jvwk5HJnizQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228243; c=relaxed/simple;
	bh=W8kPWjbVzloymT+WUD1vDHZMSH23Ip4gfQjinZZYu1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=skXFtbQeCz5Ci8pMRFwlVxT3neyI7PuQIQ6zOeDgfw86SxPdD/CuXDih9Q6pGKqfLEsm4XmK4FCoz+I4xl9/q5ePr5gCPBOd1n9YN3YrC7sBo4J6AcWKok8CrGExjmajdRocEUpluVuRUe4xB/x2+6IMwJ1QwW3EcrI5lSrpcXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyNcTa4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TEjL7q018005
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b2JMHHLa1rE
	J4Hs2IxSKvgFj2W/GQDFpMVFHK3adsj0=; b=NyNcTa4+8m73k1HbMn2XjVtqYtl
	aI1vv58Rv0m8AUzm0WOp34p2RtyeYNbxWf/+xKirgziQ9+EIw0f0qLN/+zuhVcVz
	FlU2ueWEXdIVukr+a0qnZDUXtyvA6S6ar/x7UQM9Bpm15rQx+/PWk+3xLI8vWD8c
	6OQDE326sIiTDDad8VrQ4KQkXnAu7TrOiyCZKqV8ZHz7psB2kzDOYwpOF/UIFfOR
	gtmfAQTvdmKWyzeRy2t8N/lZPHYfJYQ+56EQ7W7spQxVMRb4W7NaFdN8D2yXLJ2t
	ywzxm4Xj/LmENEel0IL5+P1A3ZkyKtocCdKUmFtdz2lrzrymbaMe8yWh55Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801tmqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:17:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso2570665b3a.3
        for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 13:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228238; x=1751833038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2JMHHLa1rEJ4Hs2IxSKvgFj2W/GQDFpMVFHK3adsj0=;
        b=Ky8vdJTIQmdGP6E36SO432LkahYcW2LNs9nXdrLWor5hLmPL+owx3dEWNPZuFpoy99
         Rewc7HK18Dxw1iLu2QjBIODGjveJiifeE81C015whTZ9QWTYzTBnx9Tt4K2JMqSmKb7i
         hx5K/O5vXm3ZfWorfImGDKsOh7Wz8bbc+1bgzCrzGzucX7XFeTDs65C0LHwmss16LdaG
         qVK70ZnEOa5Gja5FDvrMgi3C8fH9eND9Q+xwpbPd2XJe0YE41Cq0KAYwf/CDccOX0zTy
         hmVYmf+DWQQr7ylnb4mHEbSFACrR19CDbkV+6jiGu2WAp1nt42lCZ7CT4ydzFGJQ0tFf
         aBvw==
X-Forwarded-Encrypted: i=1; AJvYcCW9iiDq8RBhE0cFj4ZjJn8YzM3HoGkTh1ihNPrnbh2xYCK9TbC4RlwWar2ZrN3ltkwH3ukhzxARNJugCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyohpn4Qd7ZdxpRoYa9xTYTLQYkmyPpMJapPXDVTGOViv9n0cAD
	SC05ugEhieJ2y0J5bjdykdLryM5XYrfJACoVdSGaVjHMa1Fi4s52gzLcDwnMb2Vi9yfTuxKFFvC
	xWhaBbgpC1IT443kOK2V6FvLNoidqQdZ/SIjmIbZ+lG1UPRB+5+G3lRmHye/o5Q05Dg==
X-Gm-Gg: ASbGnctHCmG8K0kk9RhPZYZYC5SMxXS6rUkUWmGIFv12GYL8b4/uX7/JmToJs1gHBHt
	AoETyfHJTyHQcgJVvgl/Pry2yU0i9GIgURyzfTzsQ6nzaOZaJXzc0fvEY/FGKsqzgLOyk69wkph
	glD1OwlV2p51PmkgBH0W5MdAeRFDck7oAgQDPcQ7f4tLo8fhu8eBvHku6AQsLYJZncY1eMbhNTB
	07pDqLoJgtnYGQx1DraV9Y6SrsHdPsVZ2w1P4U14xHRVk3K+FwZ7hnAIV/Fd4IBK6IRLRqyGMfk
	Fe7GxPXwNF3Kgv32j+vCYBY5VJ8KnClZpQ==
X-Received: by 2002:a05:6a00:21c9:b0:740:9d7c:8f5c with SMTP id d2e1a72fcca58-74af6f4cfa2mr16519956b3a.18.1751228238131;
        Sun, 29 Jun 2025 13:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW3k2zWAY5y4ye1pG0x55foXVAYN4hmqQ2sf2QqrktZmybf7EtvoFCA4/tn6MAABQx2lQx3g==
X-Received: by 2002:a05:6a00:21c9:b0:740:9d7c:8f5c with SMTP id d2e1a72fcca58-74af6f4cfa2mr16519927b3a.18.1751228237682;
        Sun, 29 Jun 2025 13:17:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540b3d9sm7086468b3a.2.2025.06.29.13.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v9 41/42] drm/msm: Defer VMA unmap for fb unpins
Date: Sun, 29 Jun 2025 13:13:24 -0700
Message-ID: <20250629201530.25775-42-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W1DyoygTPYfaOZ8VSwf1bZfr1LaG4Wfu
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68619f4f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HvHaJK4xSQnTU1JWlMsA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: W1DyoygTPYfaOZ8VSwf1bZfr1LaG4Wfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX8LOByQAN0Y4V
 SLO3XcDqwCOOTwGpyH2U8nJfwrVE3kzyiP9TOaDGFfzQcKdCRTAx4KwKpDpLZs5zgyjf4NNgVdp
 qAzRRCJwhLyK+KAkURcPuJSZII6ZFHr2s5V9f/OXxub8RK0dc/iJhaRvNFSOLu+QFxiqDRHaDT3
 QMCX3B4C907ojWmP1vl5jwiNpyx33xzgCfv7PpJelJ93q0Leqc0LGLk7B6irxsh6fmHE8BXD3qL
 FlzJFOZcHAq4cTnSzLF/dL1HVdYFEfsack7lo2/gid/83FYjCJ6EplylwAK6FSJopouR11UQ4oy
 bOTUKF5ih7QmsoTpzwxwbVJIBovZnx80RI4UTutOthZkIWW5bFX7igMwUq1Xa4bpB84kVNa/tjJ
 JNEnMtLTD1Cv2pZO20lM38VYb/369mQ9TDlYkSD8YFT5j7J8yvp1L2QPyvNGos+z+TrPzdNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=884 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

With the conversion to drm_gpuvm, we lost the lazy VMA cleanup, which
means that fb cleanup/unpin when pageflipping to new scanout buffers
immediately unmaps the scanout buffer.  This is costly (with tlbinv,
it can be 4-6ms for a 1080p scanout buffer, and more for higher
resolutions)!

To avoid this, introduce a vma_ref, which is incremented whenever
userspace has a GEM handle or dma-buf fd.  When unpinning if the
vm is the kms->vm we defer tearing down the VMA until the vma_ref
drops to zero.  If the buffer is still part of a flip-chain then
userspace will be holding some sort of reference to the BO, either
via a GEM handle and/or dma-buf fd.  So this avoids unmapping the VMA
when there is a strong possibility that it will be needed again.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c       |  1 +
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_fb.c        |  5 ++-
 drivers/gpu/drm/msm/msm_gem.c       | 60 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h       | 28 ++++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 54 +++++++++++++++++++++++++-
 6 files changed, 123 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b1f1c1a41d4..0597ff6da317 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -830,6 +830,7 @@ static const struct drm_driver msm_driver = {
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.gem_prime_import   = msm_gem_prime_import,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 200c3135bbf9..2b49c4b800ee 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -269,6 +269,7 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
+struct drm_gem_object *msm_gem_prime_import(struct drm_device *dev, struct dma_buf *buf);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
 struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8ae2f326ec54..bc7c2bb8f01e 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -89,6 +89,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		return 0;
 
 	for (i = 0; i < n; i++) {
+		msm_gem_vma_get(fb->obj[i]);
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
@@ -114,8 +115,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 
-	for (i = 0; i < n; i++)
+	for (i = 0; i < n; i++) {
 		msm_gem_unpin_iova(fb->obj[i], vm);
+		msm_gem_vma_put(fb->obj[i]);
+	}
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3e87d27dfcb6..33d3354c6102 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -19,6 +19,7 @@
 #include "msm_drv.h"
 #include "msm_gem.h"
 #include "msm_gpu.h"
+#include "msm_kms.h"
 
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
@@ -39,6 +40,7 @@ static void update_ctx_mem(struct drm_file *file, ssize_t size)
 
 static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 {
+	msm_gem_vma_get(obj);
 	update_ctx_mem(file, obj->size);
 	return 0;
 }
@@ -46,33 +48,13 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			    bool close, const char *reason);
 
-static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
-{
-	msm_gem_assert_locked(obj);
-	drm_gpuvm_resv_assert_held(vm);
-
-	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_find(vm, obj);
-	if (vm_bo) {
-		struct drm_gpuva *vma;
-
-		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
-			if (vma->vm != vm)
-				continue;
-			msm_gem_vma_unmap(vma, "detach");
-			msm_gem_vma_close(vma);
-			break;
-		}
-
-		drm_gpuvm_bo_put(vm_bo);
-	}
-}
-
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
 	struct msm_context *ctx = file->driver_priv;
 	struct drm_exec exec;
 
 	update_ctx_mem(file, -obj->size);
+	msm_gem_vma_put(obj);
 
 	/*
 	 * If VM isn't created yet, nothing to cleanup.  And in fact calling
@@ -99,7 +81,31 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true, "close");
-	detach_vm(obj, ctx->vm);
+	drm_exec_fini(&exec);     /* drop locks */
+}
+
+/*
+ * Get/put for kms->vm VMA
+ */
+
+void msm_gem_vma_get(struct drm_gem_object *obj)
+{
+	atomic_inc(&to_msm_bo(obj)->vma_ref);
+}
+
+void msm_gem_vma_put(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_exec exec;
+
+	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
+		return;
+
+	if (!priv->kms)
+		return;
+
+	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
+	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
@@ -656,6 +662,13 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 	return ret;
 }
 
+static bool is_kms_vm(struct drm_gpuvm *vm)
+{
+	struct msm_drm_private *priv = vm->drm->dev_private;
+
+	return priv->kms && (priv->kms->vm == vm);
+}
+
 /*
  * Unpin a iova by updating the reference counts. The memory isn't actually
  * purged until something else (shrinker, mm_notifier, destroy, etc) decides
@@ -671,7 +684,8 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 	if (vma) {
 		msm_gem_unpin_locked(obj);
 	}
-	detach_vm(obj, vm);
+	if (!is_kms_vm(vm))
+		put_iova_spaces(obj, vm, true, "close");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1ce97f8a30bb..5c0c59e4835c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -211,9 +211,37 @@ struct msm_gem_object {
 	 * Protected by LRU lock.
 	 */
 	int pin_count;
+
+	/**
+	 * @vma_ref: Reference count of VMA users.
+	 *
+	 * With the vm_bo/vma holding a reference to the GEM object, we'd
+	 * otherwise have to actively tear down a VMA when, for example,
+	 * a buffer is unpinned for scanout, vs. the pre-drm_gpuvm approach
+	 * where a VMA did not hold a reference to the BO, but instead was
+	 * implicitly torn down when the BO was freed.
+	 *
+	 * To regain the lazy VMA teardown, we use the @vma_ref.  It is
+	 * incremented for any of the following:
+	 *
+	 * 1) the BO is exported as a dma_buf
+	 * 2) the BO has open userspace handle
+	 *
+	 * All of those conditions will hold an reference to the BO,
+	 * preventing it from being freed.  So lazily keeping around the
+	 * VMA will not prevent the BO from being freed.  (Or rather, the
+	 * reference loop is harmless in this case.)
+	 *
+	 * When the @vma_ref drops to zero, then kms->vm VMA will be
+	 * torn down.
+	 */
+	atomic_t vma_ref;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
+void msm_gem_vma_get(struct drm_gem_object *obj);
+void msm_gem_vma_put(struct drm_gem_object *obj);
+
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 4d93f2daeeaa..c0a33ac839cb 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -6,6 +6,7 @@
 
 #include <linux/dma-buf.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
 
 #include "msm_drv.h"
@@ -42,19 +43,68 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 	msm_gem_put_vaddr_locked(obj);
 }
 
+static void msm_gem_dmabuf_release(struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+
+	msm_gem_vma_put(obj);
+	drm_gem_dmabuf_release(dma_buf);
+}
+
+static const struct dma_buf_ops msm_gem_prime_dmabuf_ops =  {
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = drm_gem_map_dma_buf,
+	.unmap_dma_buf = drm_gem_unmap_dma_buf,
+	.release = msm_gem_dmabuf_release,
+	.mmap = drm_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+};
+
+struct drm_gem_object *msm_gem_prime_import(struct drm_device *dev,
+					    struct dma_buf *buf)
+{
+	if (buf->ops == &msm_gem_prime_dmabuf_ops) {
+		struct drm_gem_object *obj = buf->priv;
+		if (obj->dev == dev) {
+			/*
+			 * Importing dmabuf exported from our own gem increases
+			 * refcount on gem itself instead of f_count of dmabuf.
+			 */
+			drm_gem_object_get(obj);
+			return obj;
+		}
+	}
+
+	return drm_gem_prime_import(dev, buf);
+}
+
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg)
 {
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
-
 struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
 	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
 		return ERR_PTR(-EPERM);
 
-	return drm_gem_prime_export(obj, flags);
+	msm_gem_vma_get(obj);
+
+	struct drm_device *dev = obj->dev;
+	struct dma_buf_export_info exp_info = {
+		.exp_name = KBUILD_MODNAME, /* white lie for debug */
+		.owner = dev->driver->fops->owner,
+		.ops = &msm_gem_prime_dmabuf_ops,
+		.size = obj->size,
+		.flags = flags,
+		.priv = obj,
+		.resv = obj->resv,
+	};
+
+	return drm_gem_dmabuf_export(dev, &exp_info);
 }
 
 int msm_gem_prime_pin(struct drm_gem_object *obj)
-- 
2.50.0


