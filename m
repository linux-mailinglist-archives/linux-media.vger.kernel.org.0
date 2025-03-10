Return-Path: <linux-media+bounces-27942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 335B2A5937C
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA1051888572
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CE222686B;
	Mon, 10 Mar 2025 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c80JmNrl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F8422257E;
	Mon, 10 Mar 2025 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608382; cv=none; b=aZoHbdOhmj630YrJW+xjyfRQdXaL/w3iFM7v1McFH0pZqeOEQCo7W0cmCr4aC9Jnk7dU5wokgNMZx7AfwUxluHF9nwrX0j6jpaBzV0FQ5WgfGsPh1hRf+KkWI16Ml2u+TGZgtVFqaKbqP6I92KsDEOJAMPlQJPXTm6nWBCHwn7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608382; c=relaxed/simple;
	bh=puYqO1ssZSB45zTuCROfUk1S84tNyfEdp3lei2L6VhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGMagCDP+MC2QaWojYVeu5BIoyAoZxO976L4NSXo+GN4v/L5D6Pl297tR3NqM4+B9dg/EIZoSDZnlPSR/m3RQZl/7UCLP/ItjTLh60Jmtw1X5lBOfWq7e62Ik2iqQUD9q3EIhMCb23+/Z5Cwby+nHMCHTl7ttiZ12gCRiTWgjW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c80JmNrl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298F9C4CEE5;
	Mon, 10 Mar 2025 12:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741608381;
	bh=puYqO1ssZSB45zTuCROfUk1S84tNyfEdp3lei2L6VhM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c80JmNrlsGJu+gfhNVupnj0VWlns+4/pVC3RM86KgB8KiTDIDjyOrmWfyN7yFImN8
	 D6sLjtXhwC8KZTSCgFwwOxxJ3hNFK/jbduYa9iB4I8Q1aOwbZS04rJqv3dxTRkO2BQ
	 dMT3I6EpHbyEVI0Fkp/ZotA5TSglVBTxOyiMnerpv4wvuscaQ8bxgw2WZiDIMI6KAB
	 bDvqXJZI26oybrcgKHJNt+Tgvn6Yy2rVurTL0ZzCKW+hPmFZX6lh6XWrbyj2UyBxWW
	 Q5TZ9vZ5QecLw/zLuCdRP1IiehVa/M0mFyHsQ0iWaoQkz+1O32/BHyZnOnVMuniHI8
	 Gvw70tpiJo1hw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:07 +0100
Subject: [PATCH RFC 01/12] cma: Register dmem region for each cma region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-1-2984c1bc9312@kernel.org>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737; i=mripard@kernel.org;
 h=from:subject:message-id; bh=puYqO1ssZSB45zTuCROfUk1S84tNyfEdp3lei2L6VhM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm6QcLoZ+FMqrfl2ctqrL9OmXf+s871rqqPODINHk
 U8ldk/k6ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBErN8x/Hd9+sB2ccFetYu7
 5+yPf/TV+aFc2Z/Zq+583HJu8v6FJzxmMzJsY3/16NtzE+Nb2dtWXe3Yb3b/v2PZ5QiZFqXqziO
 PK9/xAwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that the dmem cgroup has been merged, we need to create memory
regions for each allocator devices might allocate DMA memory from.

Since CMA is one of these allocators, we need to create such a region.
CMA can deal with multiple regions though, so we'll need to create a
dmem region per CMA region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 mm/cma.c | 14 +++++++++++++-
 mm/cma.h |  3 +++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/mm/cma.c b/mm/cma.c
index de5bc0c81fc232bf82cd7ef22f6097059ab605e2..41a9ae907dcf69a73e963830d2c5f589dfc44f22 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -21,10 +21,11 @@
 #include <linux/mm.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/log2.h>
 #include <linux/cma.h>
+#include <linux/cgroup_dmem.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/kmemleak.h>
 #include <trace/events/cma.h>
 
@@ -89,16 +90,25 @@ static void cma_clear_bitmap(struct cma *cma, unsigned long pfn,
 	spin_unlock_irqrestore(&cma->lock, flags);
 }
 
 static void __init cma_activate_area(struct cma *cma)
 {
+	struct dmem_cgroup_region *region;
 	unsigned long base_pfn = cma->base_pfn, pfn;
 	struct zone *zone;
 
+	region = dmem_cgroup_register_region(cma_get_size(cma), "cma/%s", cma->name);
+	if (IS_ERR(region))
+		goto out_error;
+
+#ifdef CONFIG_CGROUP_DMEM
+	cma->dmem_cgrp_region = region;
+#endif
+
 	cma->bitmap = bitmap_zalloc(cma_bitmap_maxno(cma), GFP_KERNEL);
 	if (!cma->bitmap)
-		goto out_error;
+		goto unreg_dmem;
 
 	/*
 	 * alloc_contig_range() requires the pfn range specified to be in the
 	 * same zone. Simplify by forcing the entire CMA resv range to be in the
 	 * same zone.
@@ -124,10 +134,12 @@ static void __init cma_activate_area(struct cma *cma)
 
 	return;
 
 not_in_zone:
 	bitmap_free(cma->bitmap);
+unreg_dmem:
+	dmem_cgroup_unregister_region(region);
 out_error:
 	/* Expose all pages to the buddy, they are useless for CMA. */
 	if (!cma->reserve_pages_on_error) {
 		for (pfn = base_pfn; pfn < base_pfn + cma->count; pfn++)
 			free_reserved_page(pfn_to_page(pfn));
diff --git a/mm/cma.h b/mm/cma.h
index 8485ef893e99d8da5ee41eb03194b5b00ff088ba..e05d3eb7c173f3fe75ad7808968925c77d190c80 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -29,10 +29,13 @@ struct cma {
 	atomic64_t nr_pages_failed;
 	/* the number of CMA page released */
 	atomic64_t nr_pages_released;
 	/* kobject requires dynamic object */
 	struct cma_kobject *cma_kobj;
+#endif
+#ifdef CONFIG_CGROUP_DMEM
+	struct dmem_cgroup_region *dmem_cgrp_region;
 #endif
 	bool reserve_pages_on_error;
 };
 
 extern struct cma cma_areas[MAX_CMA_AREAS];

-- 
2.48.1


