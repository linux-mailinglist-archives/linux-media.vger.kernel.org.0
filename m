Return-Path: <linux-media+bounces-44251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B021BD2198
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 10:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6BC3A348C22
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 08:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAAA2FB63E;
	Mon, 13 Oct 2025 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWiLvI7J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4582F8BF7;
	Mon, 13 Oct 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344534; cv=none; b=SWwFP5xY1gA08kVBlBJdEYR92zqUeBKi5fNnFKsgmSR2ulX5q3aMMr09vdO2KikU9h7yShiZSfq/ve58PnnpSAPkcE62iYzKz3M9faoZFWzbKf4ok/7jiD/sItckQInrw0+J7pM1gaJCjde9iL6AJPtBztahgDBeafff1kP9eLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344534; c=relaxed/simple;
	bh=86W+tMqIGJ9AE1Kqrh+zL9da/Dha/yDtcLOGrEf75Ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kg9OinK3h5vN+v2L/nbClEd3Ko7ju86ecf1vjfXJVeBLOmR6YvJDSYaRAFUlOtDpaprUiaTaacft4ZQB2oeJEJiq8m44aay2RV4urGIlJZYf+aRhUgu4xia1eQgpJSbYirJ+YypR01KfnBQTpCkhI7+S5a14ANaA/+/C4QJLfj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWiLvI7J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B715C4CEE7;
	Mon, 13 Oct 2025 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760344532;
	bh=86W+tMqIGJ9AE1Kqrh+zL9da/Dha/yDtcLOGrEf75Ss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XWiLvI7JXavv2mgEVXeUOzPMjY+KBbO+7mMEdBx6I35dBuc41wnN/wTfkd899wAek
	 xxVLhIT86GOTeK8YeNP/hmMfP/xO8wgUmxfu4rHa+rG0QL7TBMEUkQb3u3XnTsUcvB
	 OJNh+SsL1SnzH2G7tattrwNfm/T8CkSvuxsyV4XYK+CYh5W4smRW03MdXuJ/k+p0h6
	 ZszoBCReQlhGFhJKmjVVmSJvARYZ7lpepzifbp6vpCggzfbzvQW5Gxfjk5NoRVi/j9
	 5INvGi+N3jc4JNGGG2kEtNdGB23rvI5czBKQqAK/r5l06Ygl2uCFk1ijeFJuW5Zyt3
	 WafdFcjzgWndQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 13 Oct 2025 10:35:19 +0200
Subject: [PATCH v8 4/5] dma: contiguous: Reserve default CMA heap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-dma-buf-ecc-heap-v8-4-04ce150ea3d9@kernel.org>
References: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
In-Reply-To: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2

The CMA code, in addition to the reserved-memory regions in the device
tree, will also register a default CMA region if the device tree doesn't
provide any, with its size and position coming from either the kernel
command-line or configuration.

Let's register that one for use to create a heap for it.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 kernel/dma/contiguous.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index d67e95094749d45f43c1809c175e491a3f55b2e1..d8fd6f779f797f711b8e0fd628f868d644b8f784 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -240,17 +240,23 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
 		selected_size = max(size_bytes, cma_early_percent_memory());
 #endif
 	}
 
 	if (selected_size && !dma_contiguous_default_area) {
+		int ret;
+
 		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
 			 (unsigned long)selected_size / SZ_1M);
 
 		dma_contiguous_reserve_area(selected_size, selected_base,
 					    selected_limit,
 					    &dma_contiguous_default_area,
 					    fixed);
+
+		ret = dma_heap_cma_register_heap(dma_contiguous_default_area);
+		if (ret)
+			pr_warn("Couldn't register default CMA heap.");
 	}
 }
 
 void __weak
 dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)

-- 
2.51.0


