Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E0B2884C8
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 10:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732949AbgJIICb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 04:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732655AbgJIH7z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 03:59:55 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9137AC0613D8
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 00:59:54 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so8882908wmj.5
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 00:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HSRfALuX/IouQZitVihZxXHTCU7Rm5wzYoVT9RXb0bQ=;
        b=SWhf00TdPqOP8156zohQQyTtmDuNxJfK0W9fnCMqmPLciyxtuo7vcgbtxhhN5oO6gi
         /6m4diCL1wJuHJBYEV+zQ5FwryH8vdV7pMGhKi+N5RvkmTH/Ih3JSyB/yzMFawpej0G/
         CJPIqXdiS0DRGKulzrlj/AGXS9SyLuM2tSsog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HSRfALuX/IouQZitVihZxXHTCU7Rm5wzYoVT9RXb0bQ=;
        b=NqsJtNuQRop57cnuYIUTh7d/2fU74ValES2y3MUqpvfqasb8WlZimWBGkASSJ2pOVR
         A7GcK6pYU4FSVcEOAVwTZPfP/rN71KctHzAbDxGgNpf1UqEs1yV0aIpnW2XIs90fkBrf
         d/+4S5fdLlyfrDTYm+XXQiXbeqQE3QxAHqmdzjc8DFOjhTLYFjVCelut+vEYgNhfsbHJ
         dQCCWakfPrBvfbDSXgbLenuEbXsmx0+KqNWDsVQkVCL75S+2RthCEGRv+PafAd/0CL2Y
         U7pOho87/PVmovc0KpSV2Do3DCcsmR90a/KpHgYJtcwoXSJOW+ENH2sKKZpbIWSt/to8
         7Urg==
X-Gm-Message-State: AOAM531bnN4rfnbMI3Vpa1ipmOB0DSfl/8PQlDyOooN4bCE736g7oCkN
        aiZRFXtvemccJOv1nxzk4wr6pQ==
X-Google-Smtp-Source: ABdhPJwUS14aPNDu6Fdjhifpy3cbOOhq8GIbHY08/ZuG5GVGU/mBRM7HMVv9afMyQGpP+uPyZkh2Vg==
X-Received: by 2002:a1c:791a:: with SMTP id l26mr267265wme.163.1602230393288;
        Fri, 09 Oct 2020 00:59:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.00.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 00:59:52 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v2 01/17] drm/exynos: Stop using frame_vector helpers
Date:   Fri,  9 Oct 2020 09:59:18 +0200
Message-Id: <20201009075934.3509076-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All we need are a pages array, pin_user_pages_fast can give us that
directly. Plus this avoids the entire raw pfn side of get_vaddr_frames.

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
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
--
v2: Use unpin_user_pages_dirty_lock (John)
---
 drivers/gpu/drm/exynos/Kconfig          |  1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 47 +++++++++++--------------
 2 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 6417f374b923..43257ef3c09d 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -88,7 +88,6 @@ comment "Sub-drivers"
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
2.28.0

