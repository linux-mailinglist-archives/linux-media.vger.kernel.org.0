Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94192A95BA
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 12:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbgKFLsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 06:48:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbgKFLsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 06:48:13 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03A8C0613CF;
        Fri,  6 Nov 2020 03:48:12 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id j20so947161edt.8;
        Fri, 06 Nov 2020 03:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wZu+XGFvlw0FEfc95UlskAJhekFUH3UYesXEzBCUZXE=;
        b=X3scQAf6IH774woaf74EJ6K9QQW9Hz+b4vME11wLdRalJ83vx7HHSweCc1q96cYBeq
         fyN2M7t+dXLJ/ubqMea3cV7bpZP0Fm6TioWe+QiA2zDSBYJ9X4cK7zRBqQUCgTYvi1/x
         zpXCgwn1bMUBmWT1dbIK1ECToTGi4NxJJSkHjRCbeHZNhg0Jw1Ows20P03FpLrTnNtPW
         jCCggTIMJvO13/rd5xCBjfkMyZLZ6bnPxTiQYlIeZaqDbvW7163fzfX15XeIRoktmKQv
         Y2dEnrRC2Zd4/Mh5FhdePyDgAwbjG/bXSRPjrJLXI7x+ILN3kyx1bI5aA76ueAdM33D9
         4TYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wZu+XGFvlw0FEfc95UlskAJhekFUH3UYesXEzBCUZXE=;
        b=Nboo5BfIgwUvGwuEHaPj0JJXwLaPUnOqMuHOyaM034M6D9QJpype2zUocTmFz9RcBD
         ReU4lvDbFC+tzFflBakj67mgplPhp87afDXF7tneqAZWJvXSbivhx6QM2Y0XzPISq3ur
         b0YBB1JHw71vFHnwgqeo/iiAFLM33bysr6KrCg0Z7YtmWCgQIA12g05IpDnT19pYvACH
         utl4lLIAh54EcQvX8/I63eBFpC3TO37THxeZ3+Ixnj9B0cp2Q1mvB2BMOhzwytXqGJus
         pX953DsfSyRCmekLD0UTRve5TAB8qYJkv70qwgcHlaA2OulgHySBIuJusb3/OES3LTqR
         Xzxw==
X-Gm-Message-State: AOAM530rwwPCYN1ARUeJeA0H2JZ1Bp18kW/yr0uXVYX4uw9MMYn4/f1h
        OkR07zCLhfKU3FW9vdacmN4=
X-Google-Smtp-Source: ABdhPJzmKUQRZoYcIMoblE1vSr/r3RORCBBlh4plUgqS+I3tvTTWmRVrECnmqAgEy0Gu7d44tJ0vjA==
X-Received: by 2002:a50:a40f:: with SMTP id u15mr1609050edb.307.1604663291597;
        Fri, 06 Nov 2020 03:48:11 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c066:c9fc:f8c2:d50b])
        by smtp.gmail.com with ESMTPSA id j8sm875933edk.79.2020.11.06.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 03:48:11 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: [PATCH 2/2] mm: introduce vma_set_file function v5
Date:   Fri,  6 Nov 2020 12:48:06 +0100
Message-Id: <20201106114806.46015-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106114806.46015-1-christian.koenig@amd.com>
References: <20201106114806.46015-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the new vma_set_file() function to allow changing
vma->vm_file with the necessary refcount dance.

v2: add more users of this.
v3: add missing EXPORT_SYMBOL, rebase on mmap cleanup,
    add comments why we drop the reference on two occasions.
v4: make it clear that changing an anonymous vma is illegal.
v5: move vma_set_file to mm/util.c

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v2)
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf.c                  |  3 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem.c      |  4 +---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  3 +--
 drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  5 +++--
 drivers/gpu/drm/msm/msm_gem.c              |  4 +---
 drivers/gpu/drm/omapdrm/omap_gem.c         |  3 +--
 drivers/gpu/drm/vgem/vgem_drv.c            |  3 +--
 drivers/staging/android/ashmem.c           |  6 +++---
 include/linux/mm.h                         |  2 ++
 mm/util.c                                  | 12 ++++++++++++
 10 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 282bd8b84170..e63684d4cd90 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1183,8 +1183,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		return -EINVAL;
 
 	/* readjust the vma */
-	fput(vma->vm_file);
-	vma->vm_file = get_file(dmabuf->file);
+	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
 	return dmabuf->ops->mmap(dmabuf, vma);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 67d9a2b9ea6a..4132acfa11be 100644
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
index 0dd477e56573..04e9c04545ad 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -114,8 +114,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
 	if (ret)
 		return ret;
 
-	fput(vma->vm_file);
-	vma->vm_file = get_file(obj->base.filp);
+	vma_set_file(vma, obj->base.filp);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 3d69e51f3e4d..ec28a6cde49b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -893,8 +893,9 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	 * requires avoiding extraneous references to their filp, hence why
 	 * we prefer to use an anonymous file for their mmaps.
 	 */
-	fput(vma->vm_file);
-	vma->vm_file = anon;
+	vma_set_file(vma, anon);
+	/* Drop the initial creation reference, the vma is now holding one. */
+	fput(anon);
 
 	switch (mmo->mmap_type) {
 	case I915_MMAP_TYPE_WC:
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2e1bce7c0b19..311721ceee50 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -212,10 +212,8 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
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
index d8e09792793a..f063f5a04fb0 100644
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
index 10b4be1f3e78..4789d36ddfd3 100644
--- a/drivers/staging/android/ashmem.c
+++ b/drivers/staging/android/ashmem.c
@@ -450,9 +450,9 @@ static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 		vma_set_anonymous(vma);
 	}
 
-	if (vma->vm_file)
-		fput(vma->vm_file);
-	vma->vm_file = asma->file;
+	vma_set_file(vma, asma->file);
+	/* XXX: merge this with the get_file() above if possible */
+	fput(asma->file);
 
 out:
 	mutex_unlock(&ashmem_mutex);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef360fe70aaf..2b7ac36c42dd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2719,6 +2719,8 @@ static inline void vma_set_page_prot(struct vm_area_struct *vma)
 }
 #endif
 
+void vma_set_file(struct vm_area_struct *vma, struct file *file);
+
 #ifdef CONFIG_NUMA_BALANCING
 unsigned long change_prot_numa(struct vm_area_struct *vma,
 			unsigned long start, unsigned long end);
diff --git a/mm/util.c b/mm/util.c
index 4ddb6e186dd5..8c9b7d1e7c49 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -311,6 +311,18 @@ int vma_is_stack_for_current(struct vm_area_struct *vma)
 	return (vma->vm_start <= KSTK_ESP(t) && vma->vm_end >= KSTK_ESP(t));
 }
 
+/*
+ * Change backing file, only valid to use during initial VMA setup.
+ */
+void vma_set_file(struct vm_area_struct *vma, struct file *file)
+{
+	/* Changing an anonymous vma with this is illegal */
+	get_file(file);
+	swap(vma->vm_file, file);
+	fput(file);
+}
+EXPORT_SYMBOL(vma_set_file);
+
 #ifndef STACK_RND_MASK
 #define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))     /* 8MB of VA */
 #endif
-- 
2.25.1

