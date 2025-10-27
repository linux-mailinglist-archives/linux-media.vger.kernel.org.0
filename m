Return-Path: <linux-media+bounces-45617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C06C0BCAB
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E8543BC1A3
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 04:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA732D6E4B;
	Mon, 27 Oct 2025 04:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHMrcod9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2275F2D5C8E
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 04:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761540524; cv=none; b=fBCEXdcqIYXni4J1tZK2/qiRbrQ5EuL8RCARbAKO7hoDZSpyu5Xcm2JKRst+gc/pbzFS+Mk9mxGjHudiS4fyw9p3mEG4XU0e6/bCybCo/ImG06Vopw62czQIFjRUA0gd1dT6vr8wJ7KiEWVvMuM4L7IClNCe57Cacx+uYjkDYi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761540524; c=relaxed/simple;
	bh=zpNpP4igbgJE1ENVyl0vrsAZY8ZQDHHa5vxQ6v2GkUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1zMpuKjvq2LnYhyQHA18POCa7BgaF9yAD+3F8T5BkU8P+RiiG8CIaJDKB2H+FmIE403W6Egp73PzSV2Y7TevtuRZMC4EIqwGJV+BmM9akciO3TvVqgTxmyHAx1t+kJASYkgM1Hj7GZ3E9T8nN+MvUVsqQuUYx7Wn9NuCWjc01Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHMrcod9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761540523; x=1793076523;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zpNpP4igbgJE1ENVyl0vrsAZY8ZQDHHa5vxQ6v2GkUA=;
  b=iHMrcod9XEdzDR3qbsz1y5lrfyB5noyzh+q5SsgT+0MUmkizQUjlqRz/
   gGvFZh7QjYbWul4oyzpos49bhsO0YLJ3nxmYsxgFOz9DoHrXHsgildpow
   CERSB3NZFMKaRHPy89DRJyJjjzyK834nKvzfkqE2io9zaasWas0aEPz8X
   TwGCdvAOlm6F/h42jNiQa2vJiC9pDWCyykV6KgXLqJWAhtCEgR2GEj451
   HLXE9vk06PQ50YSAInn4+83d0gkLhxkNwQCXc9ZCvOvkuoi/wmWPhnHHo
   fn0iFoPHPHBVR96XhnQzc2Em1mUvUE28hYSHnHjbOwfDiJqXYCMgw75Xp
   w==;
X-CSE-ConnectionGUID: s7VXaBGSSpuOJqrmdg+2FA==
X-CSE-MsgGUID: JZ/hUwlFTKC6r9duBMOCyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63521073"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63521073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:37 -0700
X-CSE-ConnectionGUID: Lko4oLJ9S+Kh+PdIAj6/MA==
X-CSE-MsgGUID: ktT8FzxXTZGiGU51hjHpcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="188993000"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: [RFC v2 8/8] drm/xe/pt: Add an additional check for dmabuf BOs while doing bind
Date: Sun, 26 Oct 2025 21:44:20 -0700
Message-ID: <20251027044712.1676175-9-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a BO's dma_data.dma_addr pointer is valid, it means that it is
an imported dmabuf BO that has a backing store in VRAM. Therefore,
in this case, we need to iterate over its dma_addr array.

v2:
- Use a cursor to iterate over the entries in the dma_addr array
  instead of relying on SG iterator (Matt)

v3:
- Since XE_PPGTT_PTE_DM is added to the PTE flags in all cases,
  remove the bo->is_devmem_external check added in v2

v4:
- Drop is_devmem_external and instead rely on bo->dma_data.dma_addr
  to check for imported VRAM BOs (Matt)

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a1c88f9a6c76..18f959247e8d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -759,6 +759,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
 	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
+
+	if (bo && bo->dma_data.dma_addr)
+		xe_walk.dma_offset = 0;
+
 	if (!range)
 		xe_bo_assert_held(bo);
 
@@ -769,6 +773,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
 				     xe_vma_size(vma), &curs);
+		else if (bo && bo->dma_data.dma_addr)
+			xe_res_first_dma(bo->dma_data.dma_addr,
+					 xe_vma_bo_offset(vma),
+					 xe_vma_size(vma), &curs);
 		else
 			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
 					xe_vma_size(vma), &curs);
-- 
2.50.1


