Return-Path: <linux-media+bounces-27949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E06BEA5939F
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A858E3AAB23
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B6E22B8D5;
	Mon, 10 Mar 2025 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYajrhN2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8122B8B3;
	Mon, 10 Mar 2025 12:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608401; cv=none; b=kM1/vUkdHOX0NrfnKvPTJZdJBYe3CBeyStF1nA5q1OJL8GA3WQ9RA50zlYxvFRwKLuHg8hzz/Pd0VF9y8Mj17k2jYWK1aGolPCnhS9a6MyNUEq3hyLYCfm8QrOTydcpai2s3zh6EZ/sgqFkoGoJC/ZdNjv4vaBx5xpbn29csCfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608401; c=relaxed/simple;
	bh=2NdYbFXqIu49ZMyAqVsyt9MyeVTM3FWe9Y2AJpwIrVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSFpEJhNzS1DMWDbhuwB7OehdcZRtQKyyf+GA7AfIBrcOgK1J9gCpB0dyfCYy1EYhxc8HvaFWPYMNvenqVU1iDsqYuBMI6g0vVpfrJOQDmnwqhgRFuVjpU8xVEcPDpA613o+qxgrK8okB8KaatiYnFrn3r3h7h1XapS1wrijmE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYajrhN2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41403C4CEE5;
	Mon, 10 Mar 2025 12:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741608400;
	bh=2NdYbFXqIu49ZMyAqVsyt9MyeVTM3FWe9Y2AJpwIrVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jYajrhN2FOK3TJWdSOSKnA5oMw9VDNtRvtBCins3Bmp0nNI7ucd/hvhBSHpBuqXnB
	 DZxNW1+a2aHyxnK0A9Fhi801grDQHgLQbP9q6YSvN3TyjhiipsaoEXi4iVGNfQITLV
	 z/f4jxpJmEAmk5mySweb9jjh8hKeTrCnr+SrE/WTTFy9N0QcT8yeoI77qcDcyCyy2E
	 vRAFsOF5L80KPBdeA+eL3rszThdAdsNd0ShRgdkd4DQaIabptpC91PIrJzNzl6Pr0F
	 DOm2EIZIbujiQev4qPzWpV6fKuoappVRYnSB2WD0v78u+e0i5g1HBvmQMQ9KMJUWuR
	 zRSpjxAyz59eg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:14 +0100
Subject: [PATCH RFC 08/12] dma: Provide accessor to dmem region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-8-2984c1bc9312@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2NdYbFXqIu49ZMyAqVsyt9MyeVTM3FWe9Y2AJpwIrVQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm75peFiuvT/C+0FG88Ve/+4tJ7nMofXWwHp6uCju
 0uFJq8621HKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJHOhgZPi5Vj9p5r1FnYXK
 4WFVDrwO+/8m2DX4nU/0zHXaXl8cMIuR4VS1X+61qKWurquOzrrzfObMiw++peSIhMTvsi6Keiw
 jzAUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Consumers of the DMA API will have to know which DMA region their device
allocate from in order for them to charge the memory allocation in the
right one.

Let's provide an accessor for that region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-mapping.h | 11 +++++++++++
 kernel/dma/mapping.c        | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index b79925b1c4333ce25e66c57d8ac1dae5c7b7fe37..75f5ca1d11a6297720742cea1359c7f28c23d741 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -351,10 +351,21 @@ static inline bool dma_need_sync(struct device *dev, dma_addr_t dma_addr)
 {
 	return false;
 }
 #endif /* !CONFIG_HAS_DMA || !CONFIG_DMA_NEED_SYNC */
 
+#if IS_ENABLED(CONFIG_HAS_DMA) && IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *
+dma_get_dmem_cgroup_region(struct device *dev);
+#else
+static inline struct dmem_cgroup_region *
+dma_get_dmem_cgroup_region(struct device *dev)
+{
+	return NULL;
+}
+#endif
+
 struct page *dma_alloc_pages(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
 void dma_free_pages(struct device *dev, size_t size, struct page *page,
 		dma_addr_t dma_handle, enum dma_data_direction dir);
 int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 7bc3957512fd84e0bf3a89c210338be72457b5c9..e45d63700183acb03c779f969ae33803dcf5cf1b 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -608,10 +608,26 @@ static int __init dma_init_dmem_cgroup(void)
 
 	default_dmem_cgroup_region = region;
 	return 0;
 }
 core_initcall(dma_init_dmem_cgroup);
+
+struct dmem_cgroup_region *
+dma_get_dmem_cgroup_region(struct device *dev)
+{
+	struct dmem_cgroup_region *region;
+
+	region = dma_coherent_get_dmem_cgroup_region(dev);
+	if (region)
+		return region;
+
+	if (dma_alloc_direct(dev, get_dma_ops(dev)))
+		return dma_direct_get_dmem_cgroup_region(dev);
+
+	return default_dmem_cgroup_region;
+}
+EXPORT_SYMBOL(dma_get_dmem_cgroup_region);
 #endif
 
 void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t flag, unsigned long attrs)
 {

-- 
2.48.1


