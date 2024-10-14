Return-Path: <linux-media+bounces-19524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653B99BE55
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 05:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF4311F22C5C
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 03:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CF21369B4;
	Mon, 14 Oct 2024 03:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwqEEfC0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A0136353
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 03:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728877665; cv=none; b=dr9T4Bg6R5eNQAd7ySOMoiCH6iMl6/mz9C9Toc+ThgZGyasYAUAJA8vcbovKmU0QH54RjQKOBicBTxg/7wTjjaz1MNsXcxKZhXUJ92IpSUw5a4LJL94IVeavZsySXsBY1hCheeRax3gCNKLaNT5rhokKV40CKYOORRN4vXEbLco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728877665; c=relaxed/simple;
	bh=uWDji3YErqRTVqEdsIVkrSSkEPui1bwDYKSJJWP2V2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ik1qXXexjHM0tVYp4jH43zb5Qc4XBoeNug4GnPS8A+5mcqtnKHFXEtpbbsRBMy3BTnAr105lUghSGniKy2mqqrs7kQZqlnsUs50i6shhzW9y5uVLHP90N31pLWve4NiAv3Cmt/41Ljpo+J2GzAKVkqLLgsazpW6GBMm5JmYA+MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwqEEfC0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728877664; x=1760413664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uWDji3YErqRTVqEdsIVkrSSkEPui1bwDYKSJJWP2V2Q=;
  b=UwqEEfC05WOz1WJ8DmsqIhseocZfCf6M7gu4qhN3t2sZ9UGcpIkErrPO
   qzxQSmUjj7PBYXbVI+w5sj1lbWlBeYgr/hHtEsxw5niQApbqILM1asQXr
   PXVDCtkMtFtn3JHmZ4u6yFeNgNGCjQy9B2xY6uxIwv0vGcSi4goxDLMYz
   XHsQH0vTgpW1ZyVLqTMF6QuTyvSu80TlSqmCQAeXXJ80O9GFJDHCwH1uC
   b5HSLLQ+veiiTg5H+aCUkwUGyuvB7yV1RbCnv8+Zhd58gD5GwfcLqZLuY
   M9iIGlDrpS0gobF4959Yl/CfidUPvz8XiZyXlXnDaxpjofegWi1vK7jce
   g==;
X-CSE-ConnectionGUID: coSi+vbJTkSBBM73WfNIDA==
X-CSE-MsgGUID: E2UqpigtQg2MaLcRcO+Txw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53632129"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="53632129"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 20:47:43 -0700
X-CSE-ConnectionGUID: YGe5MFo4QNu5h76ElNtWeA==
X-CSE-MsgGUID: Ff9+nlE5TRSJrG+jw/EG/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77076871"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa006.fm.intel.com with ESMTP; 13 Oct 2024 20:47:41 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hch@lst.de,
	andriy.shevchenko@linux.intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH 5/5] media: ipu6: use PFN_UP() and sg_virt() for code simplicity
Date: Mon, 14 Oct 2024 11:47:32 +0800
Message-Id: <20241014034732.3109440-5-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014034732.3109440-1-bingbu.cao@intel.com>
References: <20241014034732.3109440-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Use PFN_UP() and sg_virt() can be used to simplify the code.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.c      | 8 ++++----
 drivers/media/pci/intel/ipu6/ipu6-mmu.c      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index d66db537be4a..2cb828c87961 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -564,7 +564,7 @@ int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
 	if (!is_vmalloc && !virt_addr_valid(fw->data))
 		return -EDOM;
 
-	n_pages = PHYS_PFN(PAGE_ALIGN(fw->size));
+	n_pages = PFN_UP(fw->size);
 
 	pages = kmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index d03803e58881..207f67cd2b0c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -139,7 +139,7 @@ void ipu6_dma_sync_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 	int i;
 
 	for_each_sg(sglist, sg, nents, i)
-		clflush_cache_range(page_to_virt(sg_page(sg)), sg->length);
+		clflush_cache_range(sg_virt(sg), sg->length);
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_dma_sync_sg, INTEL_IPU6);
 
@@ -392,7 +392,7 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 	}
 
 	for_each_sg(sglist, sg, nents, i)
-		npages += PHYS_PFN(PAGE_ALIGN(sg_dma_len(sg)));
+		npages += PFN_UP(sg_dma_len(sg));
 
 	dev_dbg(dev, "dmamap trying to map %d ents %zu pages\n",
 		nents, npages);
@@ -421,7 +421,7 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 
 		sg_dma_address(sg) = PFN_PHYS(iova_addr);
 
-		iova_addr += PHYS_PFN(PAGE_ALIGN(sg_dma_len(sg)));
+		iova_addr += PFN_UP(sg_dma_len(sg));
 	}
 
 	dev_dbg(dev, "dmamap %d ents %zu pages mapped\n", nents, npages);
@@ -480,7 +480,7 @@ int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
 	if (WARN_ON(!info->pages))
 		return -ENOMEM;
 
-	n_pages = PHYS_PFN(PAGE_ALIGN(size));
+	n_pages = PFN_UP(size);
 
 	ret = sg_alloc_table_from_pages(sgt, info->pages, n_pages, 0, size,
 					GFP_KERNEL);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 2d9c6fbd5da2..07935350bb0e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -409,7 +409,7 @@ static void __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
 
 static int allocate_trash_buffer(struct ipu6_mmu *mmu)
 {
-	unsigned int n_pages = PHYS_PFN(PAGE_ALIGN(IPU6_MMUV2_TRASH_RANGE));
+	unsigned int n_pages = PFN_UP(IPU6_MMUV2_TRASH_RANGE);
 	struct iova *iova;
 	unsigned int i;
 	dma_addr_t dma;
-- 
2.34.1


