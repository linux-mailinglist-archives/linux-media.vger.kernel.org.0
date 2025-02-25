Return-Path: <linux-media+bounces-26930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48534A43A38
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C183B178E30
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68787263F28;
	Tue, 25 Feb 2025 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kX0WqFSz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D79126157E
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476740; cv=none; b=M2RLmmQZarhdDtmehrBEzMUVmuGNsDPA0yNiSjqzVtyb4bEvKVBZnWFxvrBF0hpteQQEH7cBHJoFPlM1Lf4A8azUjTwVJI93PLlvhMFBnM5i9PbGpRTa6huwbmcJbfjJ7lrbFWPr8njpdebR06LpSG1WFt6GE8fsdlcuBppPjXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476740; c=relaxed/simple;
	bh=7RKNZN3DjXgj3DOCeyKljHsiHI5JkqWMI96vqJDySZY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=As28diNPQegm7rlFQdz9QSpaC/e70lJx5Qls2DXON3ikResFUJ+DWKYyHgKK3fKFvGiFHmSfXSJfVZRmDNy893hThDqTprnO+EHQbGHjm1wM61Ypluov0B6gudA1IwlHWPUuFFzvM2ywI0xENk5yXF3QbTgVwrCCTpE+5qwz0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kX0WqFSz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740476739; x=1772012739;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7RKNZN3DjXgj3DOCeyKljHsiHI5JkqWMI96vqJDySZY=;
  b=kX0WqFSz6JWX9rB7O6CRqdFBekXmR9IvS6nbqd1sBsy5mPFa4ppV8OdE
   G55DreD35hR7qOkz/7cwTLVlnIdmkAlIdH9m1YGMlLiCpPHkLIWOPHy7j
   d8hzSSUv+/0Dev5+Z5PGEk676pA8UzpcaOFXDJf5V+I7dqJzfBpkibnld
   bfCeLnz4ACUFiyUmhDSfrUYxGRIeuKHklS6uix2QWlsZ4wufndHcM3dnq
   JgTLWxtxJ+8oex/YqlYLZx3Bt8ls/7feQ1HfYGkco5/iXLgdPdg8s64GZ
   FYR/ax/MntTPxdVriqgwZGZgRKPFJNkCfVkmDeW9ENXiZHw4ydobHY4R6
   w==;
X-CSE-ConnectionGUID: 7KIB0QimQ4qSZnhK1Cp9QQ==
X-CSE-MsgGUID: jlhecnzFS4eVgkAFJGGY+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40459601"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="40459601"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:45:37 -0800
X-CSE-ConnectionGUID: PtsjxphKQ9aoIq1n7osEJg==
X-CSE-MsgGUID: WxciR5CaTJe/mMJlN5FB0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="139571912"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:45:36 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BB95111F944;
	Tue, 25 Feb 2025 11:45:32 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: stanislaw.gruszka@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH 1/1] media: ipu6: Drop unused ipu6_dma_get_sgtable()
Date: Tue, 25 Feb 2025 11:45:32 +0200
Message-Id: <20250225094532.40678-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu6_dma_get_sgtable() is now unused. Drop it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c | 33 -------------------------
 drivers/media/pci/intel/ipu6/ipu6-dma.h |  3 ---
 2 files changed, 36 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index 44e24da33907..052e396a28af 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -455,36 +455,3 @@ void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
 	ipu6_dma_unmap_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sgtable, "INTEL_IPU6");
-
-/*
- * Create scatter-list for the already allocated DMA buffer
- */
-int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
-			 void *cpu_addr, dma_addr_t handle, size_t size,
-			 unsigned long attrs)
-{
-	struct device *dev = &sys->auxdev.dev;
-	struct ipu6_mmu *mmu = sys->mmu;
-	struct vm_info *info;
-	int n_pages;
-	int ret = 0;
-
-	info = get_vm_info(mmu, handle);
-	if (!info)
-		return -EFAULT;
-
-	if (!info->vaddr)
-		return -EFAULT;
-
-	if (WARN_ON(!info->pages))
-		return -ENOMEM;
-
-	n_pages = PFN_UP(size);
-
-	ret = sg_alloc_table_from_pages(sgt, info->pages, n_pages, 0, size,
-					GFP_KERNEL);
-	if (ret)
-		dev_warn(dev, "get sgt table failed\n");
-
-	return ret;
-}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
index b51244add9e6..2882850d9366 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
@@ -43,7 +43,4 @@ int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
 			 enum dma_data_direction dir, unsigned long attrs);
 void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
 			    enum dma_data_direction dir, unsigned long attrs);
-int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
-			 void *cpu_addr, dma_addr_t handle, size_t size,
-			 unsigned long attrs);
 #endif /* IPU6_DMA_H */
-- 
2.39.5


