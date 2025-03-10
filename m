Return-Path: <linux-media+bounces-27947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF89A5938F
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41CD616DB98
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E3522488E;
	Mon, 10 Mar 2025 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRGd3NeX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D0522A7EB;
	Mon, 10 Mar 2025 12:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608395; cv=none; b=tZO3EHq9J4Wp9pSPNIcs94CH+nM93EX81Bo4b33FowfThUO18cmLDubV6AM263GcAH46UOgZcZzpPx1Yd3va9u4CalY2weNABq3kDLm9M7of4EPMbDrMDY/bowm8RDl55lGb6oevaI9KOluBzuiQL4wJSLZk2e55F1ZjDYj0Gbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608395; c=relaxed/simple;
	bh=jQ2wdxZs5p2NIjuWMi3iLvjazVfM2vh7CYHqVqwc7/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpnVInmsF6p+qdGjqsGByNsPC129jnzBzPPPsamrL1VkB4tzo53RV1V2+9cV5WFK25RYs1Cr89TSeMP7G42rOv8bmHM5o596iruRO+Sig4B4G2ogqvoSHmw7NO/msWisUkRFCuBZwm8VCGLqEUtEnrmwGuqNDqIuSOoMsHAI60Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRGd3NeX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35B6C4CEE5;
	Mon, 10 Mar 2025 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741608395;
	bh=jQ2wdxZs5p2NIjuWMi3iLvjazVfM2vh7CYHqVqwc7/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rRGd3NeXpx61Qk2kJA4Y5n2Q3ZA+BJvtEjFQ3Vr+CVpbqcP/8rR3AFkNjG5P45Zt8
	 mwe1DdNAP/4Bqr1vSdvdznL2CKdgaOrx2ud+6b9yARnq+o3eVlAXcYdzeaU38WPwr8
	 tMD14rstWeRf+Do2zeMBh6cJpNroiToDa1JKS573TJz0Yu/ga6T3LdyW7e36vOnxOp
	 7qe4zpzJOGa/KZfrbsbB7RrHcwdsUMEmuT6zlhf44Zn3eip3+5xNdNri1TdoGPFJDT
	 8/Pu3aN1MFxGhOtHOzj3SAbtUOl585CZjt/LN6bsZz/TnrFv9JQbi8sBpZ12Ieulol
	 iydyIfDrVutiA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:12 +0100
Subject: [PATCH RFC 06/12] dma: direct: Provide accessor to dmem region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-6-2984c1bc9312@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jQ2wdxZs5p2NIjuWMi3iLvjazVfM2vh7CYHqVqwc7/c=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm7+1Z2lL3v925ULPVvvNW2MV9R68lgvc6ZXb1V9y
 MPHMR5sHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhI33OGv8In5v5Qr3yoO5lx
 ifL90vVOjxitSlwP1Z7ymRN1r1hYgoeR4ey/JcGrjt25K8HcMWF/mZH/+8z3FSrbnUVY4tkXtC/
 NYQUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Consumers of the direct DMA API will have to know which region their
device allocate from in order for them to charge the memory allocation
in the right one.

Let's provide an accessor for that region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-direct.h | 2 ++
 kernel/dma/direct.c        | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index d7e30d4f7503a898a456df8eedf6a2cd284c35ff..2dd7cbccfaeed81c18c67aae877417fe89f2f2f5 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -145,6 +145,8 @@ void dma_direct_free_pages(struct device *dev, size_t size,
 		enum dma_data_direction dir);
 int dma_direct_supported(struct device *dev, u64 mask);
 dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs);
 
+struct dmem_cgroup_region *dma_direct_get_dmem_cgroup_region(struct device *dev);
+
 #endif /* _LINUX_DMA_DIRECT_H */
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 5b4e6d3bf7bcca8930877ba078aed4ce26828f06..ece1361077b6efeec5b202d838750afd967d473f 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -42,10 +42,18 @@ u64 dma_direct_get_required_mask(struct device *dev)
 	u64 max_dma = phys_to_dma_direct(dev, phys);
 
 	return (1ULL << (fls64(max_dma) - 1)) * 2 - 1;
 }
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *
+dma_direct_get_dmem_cgroup_region(struct device *dev)
+{
+	return dma_contiguous_get_dmem_cgroup_region(dev);
+}
+#endif
+
 static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 *phys_limit)
 {
 	u64 dma_limit = min_not_zero(
 		dev->coherent_dma_mask,
 		dev->bus_dma_limit);

-- 
2.48.1


