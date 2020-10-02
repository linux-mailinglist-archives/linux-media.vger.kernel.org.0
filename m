Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554A9281A2F
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 19:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387957AbgJBRxn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 13:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733260AbgJBRxn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 13:53:43 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AC8C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 10:53:42 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so2495319wmi.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Ic9kLI7iEmx4fzg6K/MGmVs8Kbr/xz3cK5mQ8gVn9M=;
        b=GdOd/VH/FT5eF5Gfj5Q1p9o3Vy+IUnorHd0BlnwOL9uxqZXuqaW6hM5SPvXVoCliFo
         bYTAnUT5U/MmyPZiyzSRP+mItblvHt3dnKeVQamNmGl1Wkstvlwhpe9QI+eMQwsUSnFG
         vCIrvzCfJM5d8ZpALwF1YBf+lWT2Rg+eoosfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Ic9kLI7iEmx4fzg6K/MGmVs8Kbr/xz3cK5mQ8gVn9M=;
        b=f/XjDu135CqdlbSbPq1En8NYu7gvfyuOzIqETj/FFmV/8ndzginVnR9RAX43XizWdA
         bIe/1WIOoAvA3rk1m9A+mWOgwjAiJKe9zxL4KJS227baNWoSxXC8EtqZRhd6RYGE8IE2
         jGYxs3KwKTd3SakjQOeUUovzq94Nif1IJebRTFNwelW0tHElDvdb2Qxa3iEntCjNfPbD
         HZpMQuSuiGQJAVRKuPKi0SlGFLNR7UEFsw39NUL+u1q2DueobyhfHJJWSJR8qZrN+jYE
         Og8C9WEpLlmFwfzBA17go1Fb45mvUkgcnU9wlUI1P8S3G8kEfkxR9yaMFilS82HgjUQV
         XnWQ==
X-Gm-Message-State: AOAM533pVy9WF52BhqMCxGk9Ur4JgIWW8YHk4AiMKlNb/Roo8m0RZtAA
        KHcN94Ckgdw/y4jj0YKSZbjUdg==
X-Google-Smtp-Source: ABdhPJx4N0mByTSrMhoszno9AheTX2LZ7oZ+iqT+Q3TvlZQuWl0+xgzy8x8+JKsZ5hS5NTaTlr3Xeg==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr4030327wmg.164.1601661221643;
        Fri, 02 Oct 2020 10:53:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m10sm2585429wmc.9.2020.10.02.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 10:53:40 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Piskorski <ppiskorski@habana.ai>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH 1/2] mm/frame-vec: Drop gup_flags from get_vaddr_frames()
Date:   Fri,  2 Oct 2020 19:53:02 +0200
Message-Id: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

FOLL_WRITE | FOLL_FORCE is really the only reasonable thing to do for
simple dma device that can't guarantee write protection. Which is also
what all the callers are using.

So just simplify this.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pawel Osciak <pawel@osciak.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Tomer Tayar <ttayar@habana.ai>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pawel Piskorski <ppiskorski@habana.ai>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-mm@kvack.org
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c           | 3 +--
 drivers/media/common/videobuf2/videobuf2-memops.c | 3 +--
 drivers/misc/habanalabs/common/memory.c           | 3 +--
 include/linux/mm.h                                | 2 +-
 mm/frame_vector.c                                 | 4 ++--
 5 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 967a5cdc120e..ac452842bab3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -480,8 +480,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 		goto err_free;
 	}
 
-	ret = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
-		g2d_userptr->vec);
+	ret = get_vaddr_frames(start, npages, g2d_userptr->vec);
 	if (ret != npages) {
 		DRM_DEV_ERROR(g2d->dev,
 			      "failed to get user pages from userptr.\n");
diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/drivers/media/common/videobuf2/videobuf2-memops.c
index 6e9e05153f4e..9dd6c27162f4 100644
--- a/drivers/media/common/videobuf2/videobuf2-memops.c
+++ b/drivers/media/common/videobuf2/videobuf2-memops.c
@@ -40,7 +40,6 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
 	unsigned long first, last;
 	unsigned long nr;
 	struct frame_vector *vec;
-	unsigned int flags = FOLL_FORCE | FOLL_WRITE;
 
 	first = start >> PAGE_SHIFT;
 	last = (start + length - 1) >> PAGE_SHIFT;
@@ -48,7 +47,7 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
 	vec = frame_vector_create(nr);
 	if (!vec)
 		return ERR_PTR(-ENOMEM);
-	ret = get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
+	ret = get_vaddr_frames(start & PAGE_MASK, nr, vec);
 	if (ret < 0)
 		goto out_destroy;
 	/* We accept only complete set of PFNs */
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index 5ff4688683fd..43b10aee8150 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1287,8 +1287,7 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 		return -ENOMEM;
 	}
 
-	rc = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
-				userptr->vec);
+	rc = get_vaddr_frames(start, npages, userptr->vec);
 
 	if (rc != npages) {
 		dev_err(hdev->dev,
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 16b799a0522c..7d14aa2780d2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1757,7 +1757,7 @@ struct frame_vector {
 struct frame_vector *frame_vector_create(unsigned int nr_frames);
 void frame_vector_destroy(struct frame_vector *vec);
 int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
-		     unsigned int gup_flags, struct frame_vector *vec);
+		     struct frame_vector *vec);
 void put_vaddr_frames(struct frame_vector *vec);
 int frame_vector_to_pages(struct frame_vector *vec);
 void frame_vector_to_pfns(struct frame_vector *vec);
diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index 10f82d5643b6..5d34c9047e9c 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -12,7 +12,6 @@
  * get_vaddr_frames() - map virtual addresses to pfns
  * @start:	starting user address
  * @nr_frames:	number of pages / pfns from start to map
- * @gup_flags:	flags modifying lookup behaviour
  * @vec:	structure which receives pages / pfns of the addresses mapped.
  *		It should have space for at least nr_frames entries.
  *
@@ -32,10 +31,11 @@
  * This function takes care of grabbing mmap_lock as necessary.
  */
 int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
-		     unsigned int gup_flags, struct frame_vector *vec)
+		     struct frame_vector *vec)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
+	unsigned int gup_flags = FOLL_WRITE | FOLL_FORCE;
 	int ret = 0;
 	int err;
 	int locked;
-- 
2.28.0

