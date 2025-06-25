Return-Path: <linux-media+bounces-35861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0263AE7EFC
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 12:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40AD9171350
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 10:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B992857F1;
	Wed, 25 Jun 2025 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8y3AmdQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F6127E059
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846871; cv=none; b=qLDEQLhkX7RSO3jyvVHnDnT5bCq4EMfU7S/OlTaGneUGx1rmvt5BmVZtX6iYpzynZC5qXZWlLaKQEy9dfaPYSiCl2Op7zQpgE/1ahmjV9Wj5iHq/+rCGHeIsCoSoqwF5i3yySTCNP3Radh83yG1I+/sIIOUGdsGDMCyuZ6l80VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846871; c=relaxed/simple;
	bh=01eeXR9EQXT02NCQ4PRZh6KlCr3uOn3isq6XXtm7Hr8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rBnLuEDZkLdAS+Ujlp1ecZ8dnMPnzXqXi8qNLHr+i6Qa7X3YU2RLEFw+nOuAJE+zSeOOtCvdOPHXVdgOOOdGKoBrD+CTvChqFfUd6Ff28RflzC6IjbhoKP+iKDfbdiQXJMjyUjyWtorkCxilBJzcaqa7BtzL5L1qjPGo1wuqAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8y3AmdQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750846868; x=1782382868;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=01eeXR9EQXT02NCQ4PRZh6KlCr3uOn3isq6XXtm7Hr8=;
  b=N8y3AmdQcNw+0B4E8Q1EhZEXX2JaHcR/vUE3OQZw1uMV4PfQE47QDKqR
   BcCyMbjV1eEHcT6Ex3Q1Ucx15Dn4FP/udUYu0fgAxwU83IPVU6wBHdiBy
   hGvrXvrwtum4I808ZJSsUR4bD5tvQqoAW8cZvaLP57LLmwiHoLnIDch5L
   5beKZHcUEq2koIVf0kRT+n6RuYx+muBh+0zmo1glS/53gyjSqMy4hLpFd
   04WNzlr5fA4jicNc4nxrrkiA1kdtasjfVb79vyYgkIQeF+XjjXX5Qxi4l
   E0wyc/PVcZlTy0WbD8BGdYJT4dhz1WQSxUZuDTvGk1jZdMemvpwhajYku
   A==;
X-CSE-ConnectionGUID: pUABaR04SVOs0QFXSRQo3w==
X-CSE-MsgGUID: xkjFHwpASLC+K8UlAsqoZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52974636"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52974636"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:21:08 -0700
X-CSE-ConnectionGUID: k2hjk4K9RRyKQ3mgmjYG4g==
X-CSE-MsgGUID: DG+A0LWzRhmmqEHUVmIKmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152312139"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.155])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:21:06 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1863D11F9DF;
	Wed, 25 Jun 2025 13:21:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uUNFY-00A1pJ-07;
	Wed, 25 Jun 2025 13:21:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	stanislaw.gruszka@intel.com
Subject: [PATCH 1/1] media: staging: ipu7: Fix compiler warnings on x86
Date: Wed, 25 Jun 2025 13:21:03 +0300
Message-Id: <20250625102103.2390293-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix compiler warnings on 32-bit builds where dma_addr_t and phys_addr_t
are 32-bit (and no longer long long).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi folks,

I'll squash these to the ipu7 set.

 drivers/staging/media/ipu7/ipu7-boot.c | 4 ++--
 drivers/staging/media/ipu7/ipu7.c      | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
index 8e58d00566b4..666cede396f9 100644
--- a/drivers/staging/media/ipu7/ipu7-boot.c
+++ b/drivers/staging/media/ipu7/ipu7-boot.c
@@ -219,8 +219,8 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
 	void *queue_mem_ptr;
 	unsigned int i;
 
-	dev_dbg(dev, "boot config queues_nr: %d freq: %u sys_conf: 0x%llx\n",
-		num_queues, uc_freq, subsys_config);
+	dev_dbg(dev, "boot config queues_nr: %d freq: %u sys_conf: 0x%pad\n",
+		num_queues, uc_freq, &subsys_config);
 	/* Allocate boot config. */
 	adev->boot_config_size =
 		sizeof(*cfgs) * num_queues + sizeof(*boot_config);
diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index f1ca76d59dc2..4a70d3527cb7 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2323,8 +2323,8 @@ static int ipu7_map_fw_code_region(struct ipu7_bus_device *sys,
 
 	ipu7_dma_sync_sgtable(sys, sgt);
 
-	dev_dbg(dev, "fw code region mapped at 0x%llx entries %d\n",
-		sgt->sgl->dma_address, sgt->nents);
+	dev_dbg(dev, "fw code region mapped at 0x%pad entries %d\n",
+		&sgt->sgl->dma_address, sgt->nents);
 
 out:
 	kfree(pages);
@@ -2448,8 +2448,8 @@ static int ipu7_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	phys = pci_resource_start(pdev, IPU_PCI_BAR);
 	pb_phys = pci_resource_start(pdev, IPU_PCI_PBBAR);
-	dev_info(dev, "IPU7 PCI BAR0 base %llx BAR2 base %llx\n",
-		 phys, pb_phys);
+	dev_info(dev, "IPU7 PCI BAR0 base %pap BAR2 base %pap\n",
+		 &phys, &pb_phys);
 
 	isp->base = pcim_iomap_region(pdev, IPU_PCI_BAR, IPU_NAME);
 	if (IS_ERR(isp->base))
-- 
2.39.5


