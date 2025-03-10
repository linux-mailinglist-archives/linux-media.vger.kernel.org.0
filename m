Return-Path: <linux-media+bounces-27948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFFDA59396
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C32B1169144
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418A822B597;
	Mon, 10 Mar 2025 12:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYulIu1z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D2822AE4E;
	Mon, 10 Mar 2025 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608398; cv=none; b=j+1s4SA7vMhwAtoOoHOUQr8DNZsAgRSe5GIS9fSWko/4Kc4UBag1LPbQCVJM3GYhoqxD5yFLy8Ozn5b0ZJf6AOvG3F8Iq7joyvItmX8QteaRtg/pFhrrjCQyl/MpzsgeygjeNtwGBE7BisoEO6A87UQxiV4EXDJymJU5ywZFicg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608398; c=relaxed/simple;
	bh=WpLKbe0/o+ohbkFGUscUlJWaO731RUjLbL+Wu9pvI1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSvz9Xet15ten96DSxR9mqpqqtW0qfZ0s5USDjE3E3UrZJmQkMjyrnifbJ3PjBl+dEqEmPtfP46GAurukqJ35zgC1wdBJIo5yaCWz0mzObvfSbskqkcqq2CrNlj8+NGixR6ddX4MjC9c+2kOvU+TluHa78E7FWTm6WvM1RPtDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYulIu1z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C23C4CEF0;
	Mon, 10 Mar 2025 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741608398;
	bh=WpLKbe0/o+ohbkFGUscUlJWaO731RUjLbL+Wu9pvI1U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mYulIu1z9ZEz5XkKZ5ATnLojzzD1yagpF3IUFzymoYKt1M64RhIURBCwQz6UGL9jx
	 dk6SmnsmVNg7Ya2ZC8vhkX5HICDga1QdItNg2jKcZmRbM3Dvf6zEZ6FlXL88g4Pxhe
	 9hCpWzILTutINy+exPSa+BRv3t1IjGB1EMZy+SOiEXOEAm2vXSiaC0D7npv0EN+FS7
	 cyc49Rq6YCERbGqwe/I2kU3FX6yw62UbzY5H/PP2Smt77flePvWsu/3tOiRNiJzE+0
	 ASC5Nns3DUof7bktIcF4B6u3Z9uLN8X4wCyQfupoMhCvY37rSccXvJ5zGeZt/RfBI3
	 agHoPHP+GrWlA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:13 +0100
Subject: [PATCH RFC 07/12] dma: Create default dmem region for DMA
 allocations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-7-2984c1bc9312@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=mripard@kernel.org;
 h=from:subject:message-id; bh=WpLKbe0/o+ohbkFGUscUlJWaO731RUjLbL+Wu9pvI1U=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm6xM/5i39P7QfPABed6dt2fzyxeLHihdV/S9tw9B
 dnH5m/EOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRTeUM/73LJk6x+PrwzCb3
 CAWZ6DNLu2dcEL352d8z2iVgslmKngEjwxudlx/MBE50LEqRPi0r8LcjVG/iNCV3ptV2gT4ydX2
 m/AA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Some DMA allocations are not going to be performed through dedicated
sub-allocators but using the default path. We need to create a default
region to track those as well.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 kernel/dma/mapping.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index cda127027e48a757f2d9fb04a49249d2b0238871..7bc3957512fd84e0bf3a89c210338be72457b5c9 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -5,10 +5,11 @@
  * Copyright (c) 2006  SUSE Linux Products GmbH
  * Copyright (c) 2006  Tejun Heo <teheo@suse.de>
  */
 #include <linux/memblock.h> /* for max_pfn */
 #include <linux/acpi.h>
+#include <linux/cgroup_dmem.h>
 #include <linux/dma-map-ops.h>
 #include <linux/export.h>
 #include <linux/gfp.h>
 #include <linux/iommu-dma.h>
 #include <linux/kmsan.h>
@@ -25,10 +26,14 @@
 	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
 	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 bool dma_default_coherent = IS_ENABLED(CONFIG_ARCH_DMA_DEFAULT_COHERENT);
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+static struct dmem_cgroup_region *default_dmem_cgroup_region;
+#endif
+
 /*
  * Managed DMA API
  */
 struct dma_devres {
 	size_t		size;
@@ -587,10 +592,28 @@ u64 dma_get_required_mask(struct device *dev)
 	 */
 	return DMA_BIT_MASK(32);
 }
 EXPORT_SYMBOL_GPL(dma_get_required_mask);
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+static int __init dma_init_dmem_cgroup(void)
+{
+	struct dmem_cgroup_region *region;
+
+	if (default_dmem_cgroup_region)
+		return -EBUSY;
+
+	region = dmem_cgroup_register_region(U64_MAX, "dma/global");
+	if (IS_ERR(region))
+		return PTR_ERR(region);
+
+	default_dmem_cgroup_region = region;
+	return 0;
+}
+core_initcall(dma_init_dmem_cgroup);
+#endif
+
 void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t flag, unsigned long attrs)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	void *cpu_addr;

-- 
2.48.1


