Return-Path: <linux-media+bounces-20823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBBA9BC368
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 03:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12966281CF4
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 02:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B294D9FB;
	Tue,  5 Nov 2024 02:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msZBWDC7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A28282F1
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 02:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730775150; cv=none; b=fUukE8pHZS2me/eEVlRE++8GCd4aqd76DNJ5VY+72T8GmHeWK/DYHl79INkyqNArbnp9dcEpjy324f1YHF9JDDquzIYvbFtdmwFAXLW3KLrjfbgbkwIPY0YK5QK30w6Ff9hsgs71WPcUhH/llQPkin2s9JCzHKKRE/H61lbaOk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730775150; c=relaxed/simple;
	bh=Z/ktKAhxJDu4xukqwxWheuHB8Th9Kx2aYlupPTCQjm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=S1b86ws5kroDdOdXPr9c/2fIlwjzpiT+hXV5WuqfFj5+5/6JfCzStljWubMb+lezpLo/rQ94PZ4wt/gHf9YfVM04Mh9Ro8MNyusJiVdHD4aLt5+v+BOioJR6nOdmMRXM8IM8oT0D9smKHJ3o6WqY7SDKqxGoyVTQCozSO4M5PuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msZBWDC7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730775148; x=1762311148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Z/ktKAhxJDu4xukqwxWheuHB8Th9Kx2aYlupPTCQjm8=;
  b=msZBWDC7OMfB1uZglW2gAIBbGmcqXdx7ylpXnwXxj3EInQkq9uqVRVsU
   vrts+DXDL55/sD3/yUg0uoFfMM383d40IXIk9Xx7LI6/OixN56YNXv8sy
   hdTnGomIHnOT2jBsJlQE5QCHbPyHVW36c7DaMrkXUewGKxzh4PSi16zDI
   CzVHzWvuMzqiSXmXdlzmWWPRPdS0l1KGeCrLnF5FwEN7ui8NhBBmWY2p2
   rbfjQKJuqikS+kQYiaEdW0AZCUjuA11I+cZS6EGZWd/IW3lgWI1BEag/p
   BWJgduHD/inBPlYKVQ3YnhRqW/NyYM/rRzDPXnQTaaylHP32rujfmkpsg
   Q==;
X-CSE-ConnectionGUID: CK1gn54dRgy3zDyjt4VpTA==
X-CSE-MsgGUID: 1mUWG3GJSIOF7X2jrSisBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30663701"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30663701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 18:52:25 -0800
X-CSE-ConnectionGUID: 0EhxSoWfQ/O5WbzMjfKj+w==
X-CSE-MsgGUID: q+u3C+v9RIy8h/tuyTa+1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="88422106"
Received: from ipu5-build.bj.intel.com ([10.238.232.136])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2024 18:48:15 -0800
From: Bingbu Cao <bingbu.cao@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v3 4/4] media: ipu6: make the ipu6_mmu_unmap() as a void function
Date: Tue,  5 Nov 2024 10:45:08 +0800
Message-Id: <1730774708-19594-4-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1730774708-19594-1-git-send-email-bingbu.cao@intel.com>
References: <1730774708-19594-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The DMA unmap API is not supposed to return value. Thus this patch
changes the ipu6_mmu_unmap() as a void function and DMA unmapping
didn't check the return value.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 15 +++++++--------
 drivers/media/pci/intel/ipu6/ipu6-mmu.h |  4 ++--
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index a8e087188ebb..2d9c6fbd5da2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -252,8 +252,8 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
 	return pt;
 }
 
-static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
-		       phys_addr_t dummy, size_t size)
+static void l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		     phys_addr_t dummy, size_t size)
 {
 	unsigned int l2_entries;
 	unsigned int l2_idx;
@@ -297,7 +297,6 @@ static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 
 	WARN_ON_ONCE(size);
 	spin_unlock_irqrestore(&mmu_info->lock, flags);
-	return l2_entries << ISP_PAGE_SHIFT;
 }
 
 static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
@@ -402,8 +401,8 @@ static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 	return l2_map(mmu_info, iova_start, paddr, size);
 }
 
-static size_t __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
-			       unsigned long iova, size_t size)
+static void __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
+			     unsigned long iova, size_t size)
 {
 	return l2_unmap(mmu_info, iova, 0, size);
 }
@@ -645,8 +644,8 @@ phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
 	return phy_addr;
 }
 
-size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
-		      size_t size)
+void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		    size_t size)
 {
 	unsigned int min_pagesz;
 
@@ -663,7 +662,7 @@ size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 	if (!IS_ALIGNED(iova | size, min_pagesz)) {
 		dev_err(NULL, "unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
 			iova, size, min_pagesz);
-		return 0;
+		return;
 	}
 
 	return __ipu6_mmu_unmap(mmu_info, iova, size);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
index 21cdb0f146eb..8e40b4a66d7d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
@@ -66,8 +66,8 @@ int ipu6_mmu_hw_init(struct ipu6_mmu *mmu);
 void ipu6_mmu_hw_cleanup(struct ipu6_mmu *mmu);
 int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 		 phys_addr_t paddr, size_t size);
-size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
-		      size_t size);
+void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		    size_t size);
 phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
 				  dma_addr_t iova);
 #endif
-- 
2.7.4


