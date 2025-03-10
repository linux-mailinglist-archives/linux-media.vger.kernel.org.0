Return-Path: <linux-media+bounces-27941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B15C9A5936A
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 452177A1E37
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D5B223323;
	Mon, 10 Mar 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLAyd9RZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD222156F;
	Mon, 10 Mar 2025 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608379; cv=none; b=IoafNgyspSU+lv+vdnf0q1hO3N2xARj9nZwS99d3Anqjvy9aslpi0EuyGzr79/IXMw/KWJUpl1MN390OaaYgER/9fifcMfeUnprWRUb3VrUGD5n6piINkh7EL2wvG4/oYj+DMGWSqj5G1MwiwT2rFHWQDDaGhIXouAbP5YvYydY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608379; c=relaxed/simple;
	bh=KGA4bM77hVjjtDjQ2JV/Z0dy4gGhmqSc97R1mS2xb1M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MSpIQkwZ51pwiLG1xFwa9gkjNgVCsoLzedEjfX5+B4pj+PRCHeWQiwe1uyEY00UB60/Bw8oSRrJ3DII5+ANmgm6kh3jRvQkU41+XlDVxopp3fsmpbrJCvPD9biLToqnp1u3DhGsfXFz7P3rv9UKYTlCLFuEekntk948aPeodA6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLAyd9RZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82263C4CEE5;
	Mon, 10 Mar 2025 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741608379;
	bh=KGA4bM77hVjjtDjQ2JV/Z0dy4gGhmqSc97R1mS2xb1M=;
	h=From:Subject:Date:To:Cc:From;
	b=BLAyd9RZHbM20BHFMAOkhZ1xa4HAbPJAgTsUShkU4nH4oDrB2KmmeYB+TR6U6cxMG
	 wBygh8fTKR/2TFFLZ8pe1DWUALnlAtu6yIyWC/nh0ppRJTiEZJ+kaUfOjb11zcmHQi
	 Wk6onFaab8DVOe544ZyTkqAe4HjkH46O4GTw6177WJXEsw+awOBXpu+koebZAHMYoR
	 0tNtAM/khWFx6/vOxn33GavtH/yiEtFDTs2Wtcu9ERwB7HlvErFPsbxPTcwEBn1ZWZ
	 KaJJzb5mTP6uUbgl9G+pXzX8omVq8hnmFE/ytak+/zCfJ6GHkz67siXkpCStPjDdWL
	 WxMWzUYLd5fTA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
Date: Mon, 10 Mar 2025 13:06:06 +0100
Message-Id: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7VzmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwNz3ZTc1Fzd5PSi/NKCYl1z47TUpOTUFANLC0sloJaCotS0zAqwcdF
 KQW7OSrG1tQBhlpIoYwAAAA==
X-Change-ID: 20250307-dmem-cgroups-73febced0989
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3616; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KGA4bM77hVjjtDjQ2JV/Z0dy4gGhmqSc97R1mS2xb1M=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm6I3B71zO3k9rdXbl4P0CvZEZRvHjKx739T6+WGh
 7uZq74bdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAigkoM/zM5ImbmNqrYlUix
 LTn14GPJ3H2q8saW91X6ly6U3v7bczEjwwLhfe77V07sVM6Z9HWjtPdGbctV/8zYn2tYvBSK/cW
 +ihUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

Here's preliminary work to enable dmem tracking for heavy users of DMA
allocations on behalf of userspace: v4l2, DRM, and dma-buf heaps.

It's not really meant for inclusion at the moment, because I really
don't like it that much, and would like to discuss solutions on how to
make it nicer.

In particular, the dma dmem region accessors don't feel that great to
me. It duplicates the logic to select the proper accessor in
dma_alloc_attrs(), and it looks fragile and potentially buggy to me.

One solution I tried is to do the accounting in dma_alloc_attrs()
directly, depending on a flag being set, similar to what __GFP_ACCOUNT
is doing.

It didn't work because dmem initialises a state pointer when charging an
allocation to a region, and expects that state pointer to be passed back
when uncharging. Since dma_alloc_attrs() returns a void pointer to the
allocated buffer, we need to put that state into a higher-level
structure, such as drm_gem_object, or dma_buf.

Since we can't share the region selection logic, we need to get the
region through some other mean. Another thing I consider was to return
the region as part of the allocated buffer (through struct page or
folio), but those are lost across the calls and dma_alloc_attrs() will
only get a void pointer. So that's not doable without some heavy
rework, if it's a good idea at all.

So yeah, I went for the dumbest possible solution with the accessors,
hoping you could suggest a much smarter idea :)

Thanks,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (12):
      cma: Register dmem region for each cma region
      cma: Provide accessor to cma dmem region
      dma: coherent: Register dmem region for each coherent region
      dma: coherent: Provide accessor to dmem region
      dma: contiguous: Provide accessor to dmem region
      dma: direct: Provide accessor to dmem region
      dma: Create default dmem region for DMA allocations
      dma: Provide accessor to dmem region
      dma-buf: Clear cgroup accounting on release
      dma-buf: cma: Account for allocations in dmem cgroup
      drm/gem: Add cgroup memory accounting
      media: videobuf2: Track buffer allocations through the dmem cgroup

 drivers/dma-buf/dma-buf.c                          |  7 ++++
 drivers/dma-buf/heaps/cma_heap.c                   | 18 ++++++++--
 drivers/gpu/drm/drm_gem.c                          |  5 +++
 drivers/gpu/drm/drm_gem_dma_helper.c               |  6 ++++
 .../media/common/videobuf2/videobuf2-dma-contig.c  | 19 +++++++++++
 include/drm/drm_device.h                           |  1 +
 include/drm/drm_gem.h                              |  2 ++
 include/linux/cma.h                                |  9 +++++
 include/linux/dma-buf.h                            |  5 +++
 include/linux/dma-direct.h                         |  2 ++
 include/linux/dma-map-ops.h                        | 32 ++++++++++++++++++
 include/linux/dma-mapping.h                        | 11 ++++++
 kernel/dma/coherent.c                              | 26 +++++++++++++++
 kernel/dma/direct.c                                |  8 +++++
 kernel/dma/mapping.c                               | 39 ++++++++++++++++++++++
 mm/cma.c                                           | 21 +++++++++++-
 mm/cma.h                                           |  3 ++
 17 files changed, 211 insertions(+), 3 deletions(-)
---
base-commit: 55a2aa61ba59c138bd956afe0376ec412a7004cf
change-id: 20250307-dmem-cgroups-73febced0989

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


