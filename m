Return-Path: <linux-media+bounces-44353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEEEBD7D3F
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39CC84208AC
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 07:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B327F30E0F5;
	Tue, 14 Oct 2025 07:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXh0Q3NL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73D30E0C0
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426044; cv=none; b=R0KGd8in/FdEvquqqMuZdJTEqIUbqUBh2gxP+4g70v2Te9dsxVPaPhYOlqoG7MHxeyRE2ttM9UtQrvnwvrg+1nIFcqH4kTlDUgQNKOoaA7tOX7ql/Ji3KuVkdV96rYi7n7x57UNDB1WBZx4eOHT2HHQEMLmDYxQRNLFtu589c+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426044; c=relaxed/simple;
	bh=El6NYrXPZJg2JthYHW5V9bH56p5bvPHuTCM1ObR1r+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awplYNdB2foo5JFE9o3XsL/v61DW+6c3Ysv8pmv8TShR7AroQhgNmtvA00pe05w3kK57QryS+uGVIjkVaHfJabB9O2Kxtm+n1x5uiL/rFRvhYnSQ5wQjiiNHaoxtsnDdkFW7v0j21ND0cvZ1FEmfZuL6fzS3rCePbcrYCCpO2U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXh0Q3NL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426042; x=1791962042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=El6NYrXPZJg2JthYHW5V9bH56p5bvPHuTCM1ObR1r+c=;
  b=AXh0Q3NL5gOTisMSvtEE9OnlSx5RHr98+Hcr3WKDYDFZ9PHoQ5HEPE+k
   8hpg+zDWu2yS5QsjYCBYorOVsp+0N2rv8JaBypeRWTN2/NR/k9XvttKbn
   BIaigfywKU9rs6lG8JEQGOEtCjR0ilEbKiVLpRmTi1JxCV09eFFnjDVBt
   /fGnKSUu+JH5uxupLvZGAsUD+9kN1HgjGhrSMSjp29a/I1wZklLfGlvTy
   uksNxxDbuqDI80IWwiEuC3L6ZpFawGkpeiV1Qd/tz1rV7QV/c5c6s+ImK
   BfwW3r5r1PJw1Sjt9Q3ScRcGnyshqdYxjt71FonWpGIVyG/X76e8Rb+ee
   A==;
X-CSE-ConnectionGUID: SyK2tocUQMisHN44+hUp6Q==
X-CSE-MsgGUID: T+GdpYpCQRiW91B0jSNrkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257152"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="73257152"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:59 -0700
X-CSE-ConnectionGUID: QuIWljbRRoa26hMH3wExPA==
X-CSE-MsgGUID: 6uDrOax0QDiuA8AXvcj37w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="181369878"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:58 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC 8/8] drm/xe/pt: Add an additional check for dmabuf BOs while doing bind
Date: Tue, 14 Oct 2025 00:08:58 -0700
Message-ID: <20251014071243.811884-9-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014071243.811884-1-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a BO's is_devmem_external flag is set, it means that it is an
imported dmabuf BO that has a backing store in VRAM. Therefore, in
this case, need to iterate over its dma_addr array.

v2:
- Use a cursor to iterate over the entries in the dma_addr array
  instead of relying on SG iterator (Matt)

v3:
- Since XE_PPGTT_PTE_DM is added to the PTE flags in all cases,
  remove the bo->is_devmem_external check added in v2

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a1c88f9a6c76..5cc3775a3a12 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -759,6 +759,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
 	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
+
+	if (bo && bo->is_devmem_external)
+		xe_walk.dma_offset = 0;
+
 	if (!range)
 		xe_bo_assert_held(bo);
 
@@ -769,6 +773,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
 				     xe_vma_size(vma), &curs);
+		else if (bo && bo->is_devmem_external)
+			xe_res_first_dma(bo->dma_data.dma_addr,
+					 xe_vma_bo_offset(vma),
+					 xe_vma_size(vma), &curs);
 		else
 			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
 					xe_vma_size(vma), &curs);
-- 
2.50.1


