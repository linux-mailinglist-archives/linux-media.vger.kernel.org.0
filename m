Return-Path: <linux-media+bounces-19728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A846B9A0326
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 09:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A929287F02
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 07:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF821C4A1C;
	Wed, 16 Oct 2024 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar8jCS1T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7864D1B2193
	for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065199; cv=none; b=fMX1VMcyeN2bCOK6DGX+bzGAyJnfqVutwZb5FYBUXyi5NZqJazi7cypMBvDYKVePQcOVxbvaQ2ZAfztuiOgT+NR4e+wQWzkZANepH99CFCd+pPZL2jdSPRPNP2nqhYWVBuCExO58qQszS80Q11C+I8qyhcPz4ndxX/3yRbWypuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065199; c=relaxed/simple;
	bh=uWDji3YErqRTVqEdsIVkrSSkEPui1bwDYKSJJWP2V2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s4wcvZRZXN2DTS/cBdWyJMmWJvTXQlPKkafWP+KNpu2eV3NlFeJ5kqP4vXL3v9Qlmfu/1M+zyg6L8PzsbGk7dcsoMIqDL7RrLdkm9eFZqtjBICvCNWCuNlC6k1GSV8KoSwnwqnt+RQ1VrC3kBqfG54yq6HOWyqARI0JMNw9/jrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar8jCS1T; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729065197; x=1760601197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uWDji3YErqRTVqEdsIVkrSSkEPui1bwDYKSJJWP2V2Q=;
  b=ar8jCS1TO0PE7S6EMv28YJfoKaZgSdfmDkKBWxKnGdPxrAmx3EUbP4G8
   Wx/3DjCEnMwtbnbGUo6LgYzGx0ywKwlq/OLg1vN/xprZ9JAFQMCOcpnEE
   B2NqnRUYP1XYNF2rJaOnPAImYPRyXPKDzdq89Mz2YdX4UaUhdy7QCgstU
   3RW/mGzxvrO9cXoVmx2swh2Sn8B2kug7gvIyLhpIKeDcJrYifOtaO2mes
   GnVmGXMHhGP7TkDOUl8kr77EW+A8lrVPWYDWRWJ4CH5icdaIW6I0+4+dc
   zILoMRfES+cyEWeSfYoMlUXPwtTKy07TvgAmSWanIRbS9YyU63HJLmrZa
   w==;
X-CSE-ConnectionGUID: M+z8K2AkRg+GO2Nz5RtTcA==
X-CSE-MsgGUID: wXzS4/d5QD+HkbB0mr72SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27971563"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="27971563"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 00:53:17 -0700
X-CSE-ConnectionGUID: xF8s8Md1RvWoZWHrwkEobA==
X-CSE-MsgGUID: Hk2XZ0zcTaeJHbSWtrnUcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78313786"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2024 00:53:15 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hch@lst.de
Cc: andriy.shevchenko@linux.intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH v2 5/5] media: ipu6: use PFN_UP() and sg_virt() for code simplicity
Date: Wed, 16 Oct 2024 15:53:05 +0800
Message-Id: <20241016075305.508934-5-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016075305.508934-1-bingbu.cao@intel.com>
References: <20241016075305.508934-1-bingbu.cao@intel.com>
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


