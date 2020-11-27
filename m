Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458D22C69A7
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731524AbgK0QmA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731508AbgK0QmA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:42:00 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A81C0613D1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:41:59 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id m6so6194351wrg.7
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/sh5bs9TsYHYjvxKHF7f8Ku58Ybt71LSBBC/IzYD81Y=;
        b=ZUgYtuqulcoekyn4/DmS1kFLLSpaYhGwPtaiS4etvDJ4hqCcKQ9cof4OsFdlK+OZwX
         /ER9XnkoUa8V6V6Qw8vMOYFotLZdmZyietIl3Zsl8wbRwbLmxfViSl5mIrxb8X/uTceC
         yaR+5hwHDEsE+H9iZ92RvTlkLr27AxXM+Atr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/sh5bs9TsYHYjvxKHF7f8Ku58Ybt71LSBBC/IzYD81Y=;
        b=FXOdrtLf91buR1Dep6ysb7v3u47UVybloC4Gre/vgV+c3TPo907E07iEwWr5qlh47Q
         J+Ul0LR725tG7+GWUUsYk/uLhJvMp+Yw3P0QF2uvsMY+j4j8W4/pKBF+xeWGz9KSVhY+
         l++ayL7aUfSxnMJaX2/BsxMMMoJeDGW/vXzbffNxIRq3LLDM9C4InzPP+Opgshwbqj47
         TmXrHAo6dH9mwHVouqJ4B+avG+O8V555jFws+CHF0uYJZKFpLMPilqV0j7dQEDLwTuC1
         kTZQfH9QIEUSXps+5Imd3M0uSOQjM1//7rcj+jWBq23vu2tnhHpkyO284xSywA+pt5bT
         wh0w==
X-Gm-Message-State: AOAM531yhKzWJMZcv2m91sot98fYYt2miMwxglkea+1ZOTFbGbEW/P+1
        BiVirSKgmD5Kf8agCAgsvI3oHw==
X-Google-Smtp-Source: ABdhPJxrHFLYiVOKd4LtxuEtdsZyIsxVIgBM9ROp4FnD1+Tfa5L6neNEaRf8jGsJWtkGxmbFQqkP0g==
X-Received: by 2002:adf:e54f:: with SMTP id z15mr12003413wrm.159.1606495318430;
        Fri, 27 Nov 2020 08:41:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q12sm14859078wrx.86.2020.11.27.08.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:41:57 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        John Hubbard <jhubbard@nvidia.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v7 01/17] drm/exynos: Stop using frame_vector helpers
Date:   Fri, 27 Nov 2020 17:41:15 +0100
Message-Id: <20201127164131.2244124-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All we need are a pages array, pin_user_pages_fast can give us that
directly. Plus this avoids the entire raw pfn side of get_vaddr_frames.

Note that pin_user_pages_fast is a safe replacement despite the
seeming lack of checking for vma->vm_flasg & (VM_IO | VM_PFNMAP). Such
ptes are marked with pte_mkspecial (which pup_fast rejects in the
fastpath), and only architectures supporting that support the
pin_user_pages_fast fastpath.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v2: Use unpin_user_pages_dirty_lock (John)
v6: Explain why pup_fast is safe, after discussions with John and
Christoph.
---
 drivers/gpu/drm/exynos/Kconfig          |  1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 47 +++++++++++--------------
 2 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 951d5f708e92..6a251e3aa779 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -89,7 +89,6 @@ comment "Sub-drivers"
 config DRM_EXYNOS_G2D
 	bool "G2D"
 	depends on VIDEO_SAMSUNG_S5P_G2D=n || COMPILE_TEST
-	select FRAME_VECTOR
 	help
 	  Choose this option if you want to use Exynos G2D for DRM.
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 967a5cdc120e..ecede41af9b9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -205,7 +205,8 @@ struct g2d_cmdlist_userptr {
 	dma_addr_t		dma_addr;
 	unsigned long		userptr;
 	unsigned long		size;
-	struct frame_vector	*vec;
+	struct page		**pages;
+	unsigned int		npages;
 	struct sg_table		*sgt;
 	atomic_t		refcount;
 	bool			in_pool;
@@ -378,7 +379,6 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
 					bool force)
 {
 	struct g2d_cmdlist_userptr *g2d_userptr = obj;
-	struct page **pages;
 
 	if (!obj)
 		return;
@@ -398,15 +398,9 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
 	dma_unmap_sgtable(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
 			  DMA_BIDIRECTIONAL, 0);
 
-	pages = frame_vector_pages(g2d_userptr->vec);
-	if (!IS_ERR(pages)) {
-		int i;
-
-		for (i = 0; i < frame_vector_count(g2d_userptr->vec); i++)
-			set_page_dirty_lock(pages[i]);
-	}
-	put_vaddr_frames(g2d_userptr->vec);
-	frame_vector_destroy(g2d_userptr->vec);
+	unpin_user_pages_dirty_lock(g2d_userptr->pages, g2d_userptr->npages,
+				    true);
+	kvfree(g2d_userptr->pages);
 
 	if (!g2d_userptr->out_of_list)
 		list_del_init(&g2d_userptr->list);
@@ -474,35 +468,34 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 	offset = userptr & ~PAGE_MASK;
 	end = PAGE_ALIGN(userptr + size);
 	npages = (end - start) >> PAGE_SHIFT;
-	g2d_userptr->vec = frame_vector_create(npages);
-	if (!g2d_userptr->vec) {
+	g2d_userptr->pages = kvmalloc_array(npages, sizeof(*g2d_userptr->pages),
+					    GFP_KERNEL);
+	if (!g2d_userptr->pages) {
 		ret = -ENOMEM;
 		goto err_free;
 	}
 
-	ret = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
-		g2d_userptr->vec);
+	ret = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+				  g2d_userptr->pages);
 	if (ret != npages) {
 		DRM_DEV_ERROR(g2d->dev,
 			      "failed to get user pages from userptr.\n");
 		if (ret < 0)
-			goto err_destroy_framevec;
-		ret = -EFAULT;
-		goto err_put_framevec;
-	}
-	if (frame_vector_to_pages(g2d_userptr->vec) < 0) {
+			goto err_destroy_pages;
+		npages = ret;
 		ret = -EFAULT;
-		goto err_put_framevec;
+		goto err_unpin_pages;
 	}
+	g2d_userptr->npages = npages;
 
 	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
 	if (!sgt) {
 		ret = -ENOMEM;
-		goto err_put_framevec;
+		goto err_unpin_pages;
 	}
 
 	ret = sg_alloc_table_from_pages(sgt,
-					frame_vector_pages(g2d_userptr->vec),
+					g2d_userptr->pages,
 					npages, offset, size, GFP_KERNEL);
 	if (ret < 0) {
 		DRM_DEV_ERROR(g2d->dev, "failed to get sgt from pages.\n");
@@ -538,11 +531,11 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 err_free_sgt:
 	kfree(sgt);
 
-err_put_framevec:
-	put_vaddr_frames(g2d_userptr->vec);
+err_unpin_pages:
+	unpin_user_pages(g2d_userptr->pages, npages);
 
-err_destroy_framevec:
-	frame_vector_destroy(g2d_userptr->vec);
+err_destroy_pages:
+	kvfree(g2d_userptr->pages);
 
 err_free:
 	kfree(g2d_userptr);
-- 
2.29.2

