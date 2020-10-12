Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 811DD28B096
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 10:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgJLIwI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 04:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgJLIwI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 04:52:08 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB12C0613D0;
        Mon, 12 Oct 2020 01:52:07 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id dt13so22098643ejb.12;
        Mon, 12 Oct 2020 01:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CBlnFM0ChEy9B7QxHJePIezdcvEQo491ptqs/ckQrC4=;
        b=S8e+Ub4DMhb+lNFKC5YfcFgNrgepb/2wnScgkGXs8rn0Lz2xppiAq2Un+LIWXz3ilu
         3j2yvEZwgfrYZZY2xBe3DtiHFASTm4ezcFEAjvpAqyWl+zQ3qfWvrc5wPSFTj4sJajtT
         wBJEYT4IoIGqGFL25h7ODVpriTQQAgUZmzIc/GcEVq9OstI2Kqbg+bcoHzMmtANeDojY
         1dLgefncF77OuFQ0LFA2mYYjKBUahrnGrQ97i6mTlZnCJk0gA3g9B+08PxvSU8CKlWsF
         M7pweZTgVN2Pj9GZP1bIGX5t26m7NxZ71UDDiz/rssGyk9oRfXm36y5bX5VPVfNYxg5F
         vwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CBlnFM0ChEy9B7QxHJePIezdcvEQo491ptqs/ckQrC4=;
        b=r0Nfwq324srs1YxNchYqmo506krA0qO1aG4T3HMPkZSHmlXM+C59Z256N2NKT69rH3
         p7UmgL7ohIwh9NuArLafEqKBByIT/G0spEOeV3ur/i+YnBqHSZlQEWd+bcBLaEv5rJet
         nvZktpQo82zJbjj7OH5EOQHXWy3PMtbPp4ZU1UbZPEwh2nHQ6FuIoUwXXx24xw2iSkQZ
         ZnqfELZsaTa3QbTSEQn6PHpGD3j4kt+l7zB+QykgV3nCo1M6XucsQE9+1L8RFHBFVECJ
         ovn6usmKgRNw6V7SP35Be5MV4XiZfVfkwUKFwZplluB7TbZWJx/snDM489sRM4KjTM/R
         YYUw==
X-Gm-Message-State: AOAM532Bwe44ZExyCEmpktp4UVsrTcVZt8mkdF0dDh3FXm6LfjYaV25r
        OQv9UWTgXVFuUpYJpYQvAWu1DB0DivU=
X-Google-Smtp-Source: ABdhPJzz0tpRWtxpDmZoKoQtdkLCCFHehjJ4cAXWKGt4OFM0MelwzpHyj8JM2Ev2K5AjviBSGsM8Ag==
X-Received: by 2002:a17:906:7210:: with SMTP id m16mr27983728ejk.490.1602492726429;
        Mon, 12 Oct 2020 01:52:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6a6c:c67:2644:1d74])
        by smtp.gmail.com with ESMTPSA id o35sm8622988edd.4.2020.10.12.01.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 01:52:06 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, airlied@redhat.com, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
        jgg@ziepe.ca, linmiaohe@huawei.com
Subject: [PATCH 2/2] mm: introduce vma_set_file function v4
Date:   Mon, 12 Oct 2020 10:52:03 +0200
Message-Id: <20201012085203.56119-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201012085203.56119-1-christian.koenig@amd.com>
References: <20201012085203.56119-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v2)
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
 mm/mmap.c                                  | 12 ++++++++++++
 10 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 08630d057cf2..8e6a114c6034 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1160,8 +1160,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		return -EINVAL;
 
 	/* readjust the vma */
-	fput(vma->vm_file);
-	vma->vm_file = get_file(dmabuf->file);
+	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
 	return dmabuf->ops->mmap(dmabuf, vma);
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
index ca6e6a81576b..f7a005153d02 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2693,6 +2693,8 @@ static inline void vma_set_page_prot(struct vm_area_struct *vma)
 }
 #endif
 
+void vma_set_file(struct vm_area_struct *vma, struct file *file);
+
 #ifdef CONFIG_NUMA_BALANCING
 unsigned long change_prot_numa(struct vm_area_struct *vma,
 			unsigned long start, unsigned long end);
diff --git a/mm/mmap.c b/mm/mmap.c
index 3a2670d73355..8634d0bb54ad 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -136,6 +136,18 @@ void vma_set_page_prot(struct vm_area_struct *vma)
 	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
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
 /*
  * Requires inode->i_mapping->i_mmap_rwsem
  */
-- 
2.17.1

