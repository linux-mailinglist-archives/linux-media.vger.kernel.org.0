Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A019287347
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 13:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729765AbgJHLXq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 07:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgJHLXq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 07:23:46 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B47C061755;
        Thu,  8 Oct 2020 04:23:46 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id ly6so7556585ejb.8;
        Thu, 08 Oct 2020 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g5slpzPB5zKh1WzF1mxgqBWxGWWJNpTg+Z0FPcFsWtg=;
        b=RRd5pSd2IwREt4izuuLm8dVSSb/OhWaKv4Raq6h8J84S8I+NOIk/xh7iDBib7SdVO1
         2ueWE41eulixX+/eFqp9ZdPonlVOYP7vpnvg802TdM2IYrhe3+2KBB4nbruPLk0Xxtms
         AF183RMBIsiZWFiVzRtlol7CmehCFswX4QkfHebY6Q3g0rlF+KK9zWW9TErlt+9CMsQv
         EC5RBtQRAWZ8p+3RYRrOitr6nk8N3Nellvqnel9wyIFDKmQrTAebnwpD8611fPlcjMcp
         TqtvVtAolzV5vWZG41B13APAK1geRMi1CW/ESBxBymQ8ltP/zBX0D1F1HOmMGWORjPqV
         rATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g5slpzPB5zKh1WzF1mxgqBWxGWWJNpTg+Z0FPcFsWtg=;
        b=WM7V4ohxwy8npm0bRkxG3Oq+gzITGnf1PJ1ere+evEl1sP0jIqwpuScbmxxcpMfzAM
         +g9m1arvJCSnpd9nqW0nFW11KVG3zNnVL5DUbaRFZD5elGYTwRVB0B60oTOsyop/w24M
         XpJN949rVnOtw5v/XLG6TBwMGUeZXMrvVW78hDCmRGqK2YM1OXKFAg6gFOSsfuv+uuUd
         MgiraMZ6YDgpKgvCscXIAOACGs5iTV6t4FfMHDxJVawe4kmi/+Wnomp4/rBaKySPCzrB
         fDYEjcFkxgRSqE7AQ1tyHJxQ8K5S68KtZokVfuH6dJDWNn6j84WVsDpluaW0srIzOrrn
         p+eQ==
X-Gm-Message-State: AOAM530SALzgQIM+XvBRRClWzkYRNioA27HONGBTNOKoO561393za9TX
        MRWCDVAekw03Q86RHFYqq/1rvbk6NYQ=
X-Google-Smtp-Source: ABdhPJxL+c3qJ91ehT1z0omwcR8U0j/1R6BZHCRub4+KUwONUqk/Q7OikaBhK2zqj3mk6LY7IhEcXA==
X-Received: by 2002:a17:906:2b85:: with SMTP id m5mr8624058ejg.143.1602156224656;
        Thu, 08 Oct 2020 04:23:44 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4c64:a9a0:5e0:905a])
        by smtp.gmail.com with ESMTPSA id i20sm3529030edv.96.2020.10.08.04.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 04:23:44 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org
Subject: [PATCH 1/4] mm: introduce vma_set_file function v2
Date:   Thu,  8 Oct 2020 13:23:39 +0200
Message-Id: <20201008112342.9394-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the new vma_set_file() function to allow changing
vma->vm_file with the necessary refcount dance.

v2: add more users of this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                  | 16 +++++-----------
 drivers/gpu/drm/etnaviv/etnaviv_gem.c      |  4 +---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  3 +--
 drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++--
 drivers/gpu/drm/msm/msm_gem.c              |  4 +---
 drivers/gpu/drm/omapdrm/omap_gem.c         |  3 +--
 drivers/gpu/drm/vgem/vgem_drv.c            |  3 +--
 drivers/staging/android/ashmem.c           |  5 ++---
 include/linux/mm.h                         |  2 ++
 mm/mmap.c                                  | 16 ++++++++++++++++
 10 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a6ba4d598f0e..e4316aa7e0f4 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1163,20 +1163,14 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		return -EINVAL;
 
 	/* readjust the vma */
-	get_file(dmabuf->file);
-	oldfile = vma->vm_file;
-	vma->vm_file = dmabuf->file;
+	oldfile = vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
 	ret = dmabuf->ops->mmap(dmabuf, vma);
-	if (ret) {
-		/* restore old parameters on failure */
-		vma->vm_file = oldfile;
-		fput(dmabuf->file);
-	} else {
-		if (oldfile)
-			fput(oldfile);
-	}
+	/* restore old parameters on failure */
+	if (ret)
+		vma_set_file(vma, oldfile);
+
 	return ret;
 
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 312e9d58d5a7..10ce267c0947 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -145,10 +145,8 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 		 * address_space (so unmap_mapping_range does what we want,
 		 * in particular in the case of mmap'd dmabufs)
 		 */
-		fput(vma->vm_file);
-		get_file(etnaviv_obj->base.filp);
 		vma->vm_pgoff = 0;
-		vma->vm_file  = etnaviv_obj->base.filp;
+		vma_set_file(vma, etnaviv_obj->base.filp);
 
 		vma->vm_page_prot = vm_page_prot;
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index fec0e1e3dc3e..8ce4c9e28b87 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -119,8 +119,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
 	if (ret)
 		return ret;
 
-	fput(vma->vm_file);
-	vma->vm_file = get_file(obj->base.filp);
+	vma_set_file(vma, obj->base.filp);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 3d69e51f3e4d..c9d5f1a38af3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -893,8 +893,8 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	 * requires avoiding extraneous references to their filp, hence why
 	 * we prefer to use an anonymous file for their mmaps.
 	 */
-	fput(vma->vm_file);
-	vma->vm_file = anon;
+	vma_set_file(vma, anon);
+	fput(anon);
 
 	switch (mmo->mmap_type) {
 	case I915_MMAP_TYPE_WC:
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index de915ff6f4b4..a71f42870d5e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -223,10 +223,8 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
 		 * address_space (so unmap_mapping_range does what we want,
 		 * in particular in the case of mmap'd dmabufs)
 		 */
-		fput(vma->vm_file);
-		get_file(obj->filp);
 		vma->vm_pgoff = 0;
-		vma->vm_file  = obj->filp;
+		vma_set_file(vma, obj->filp);
 
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	}
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 979d53a93c2b..0d4542ff1d7d 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -564,9 +564,8 @@ int omap_gem_mmap_obj(struct drm_gem_object *obj,
 		 * address_space (so unmap_mapping_range does what we want,
 		 * in particular in the case of mmap'd dmabufs)
 		 */
-		fput(vma->vm_file);
 		vma->vm_pgoff = 0;
-		vma->vm_file  = get_file(obj->filp);
+		vma_set_file(vma, obj->filp);
 
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	}
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index fa54a6d1403d..ea0eecae5153 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -397,8 +397,7 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
 	if (ret)
 		return ret;
 
-	fput(vma->vm_file);
-	vma->vm_file = get_file(obj->filp);
+	vma_set_file(vma, obj->filp);
 	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
 
diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
index 10b4be1f3e78..a51dc089896e 100644
--- a/drivers/staging/android/ashmem.c
+++ b/drivers/staging/android/ashmem.c
@@ -450,9 +450,8 @@ static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 		vma_set_anonymous(vma);
 	}
 
-	if (vma->vm_file)
-		fput(vma->vm_file);
-	vma->vm_file = asma->file;
+	vma_set_file(vma, asma->file);
+	fput(asma->file);
 
 out:
 	mutex_unlock(&ashmem_mutex);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ca6e6a81576b..a558602afe1b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2693,6 +2693,8 @@ static inline void vma_set_page_prot(struct vm_area_struct *vma)
 }
 #endif
 
+struct file *vma_set_file(struct vm_area_struct *vma, struct file *file);
+
 #ifdef CONFIG_NUMA_BALANCING
 unsigned long change_prot_numa(struct vm_area_struct *vma,
 			unsigned long start, unsigned long end);
diff --git a/mm/mmap.c b/mm/mmap.c
index 40248d84ad5f..d3c3c510f643 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -136,6 +136,22 @@ void vma_set_page_prot(struct vm_area_struct *vma)
 	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
 }
 
+/*
+ * Change backing file, only valid to use during initial VMA setup.
+ */
+struct file *vma_set_file(struct vm_area_struct *vma, struct file *file)
+{
+	if (file)
+	        get_file(file);
+
+	swap(vma->vm_file, file);
+
+	if (file)
+		fput(file);
+
+	return file;
+}
+
 /*
  * Requires inode->i_mapping->i_mmap_rwsem
  */
-- 
2.17.1

