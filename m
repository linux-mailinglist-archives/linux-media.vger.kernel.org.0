Return-Path: <linux-media+bounces-29906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87898A83F49
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 11:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B041F7B76F6
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 09:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FB826A1C8;
	Thu, 10 Apr 2025 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2NU5XRf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B09F267701
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 09:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278433; cv=none; b=lihJiNN6obiPXfBz7Pd5fPd/NPCiDmCtonCmgiWQ52/xZI2IYShLHmtY5vHjhvRARBH7K/9eo1k6cngLSrklw/BxjCXblS3VoHAg/kg0B4ektzZfzPPU+8wJ/PHdc52WJ0e22tfdlfRfsP4Rntoj3uAmfWMwzXh+hjlZz5sHes8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278433; c=relaxed/simple;
	bh=Aww/rAoS5KDn4EfTjsZMNFP1hrrJbiMj1WeJnvVydfI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qJkrSaVKpEUTLJnavecsRBjkBWTLkhD5/thJrMcqDo78FoImfRXwtc/PrR+uFZ41VS2dmGHZmSlQTxiJeRyAhCiv/DKJWvHmYsZ+30MqddA450r4I8a+ptDrIZ9oroGKMs59422A1ijUPOXwpdKrhPIhoxWZtWzOjIXZK182KqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2NU5XRf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744278431; x=1775814431;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Aww/rAoS5KDn4EfTjsZMNFP1hrrJbiMj1WeJnvVydfI=;
  b=A2NU5XRfiArduaMISDzqamWx0wEpSg53q5V1wBNpDskVbb4/zQxppDyd
   lsGZW3P4yg4edhiDAdcbRXENh2w+p0tPZiOdl7x7I/KinIcgONRJeK7b4
   s/TPuSQP7X7CZAZBRLTt7PhQCabWc2f84Vb/n8qoTZ+2jKsOKdnoygM9f
   xRnXmcLpy83JrNKZSJLJRXBamgjD9BXHB30vTybuKnMHmu4gCjay0vitJ
   zl3+uhUKq+fST2ZMnAUGG6bbyFgUtR/a8taF9o3C8KthkNgGhpqAKuEuz
   aCe3L17xcKPqMUs3i3Zvnh0kBYf5MpAzZJDkVwslA44f3U3BPsjeoAGd9
   A==;
X-CSE-ConnectionGUID: h7bV6IJvQCC04Uof2KW1bg==
X-CSE-MsgGUID: E88CasjMS8uVR34z1ETX0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="33398052"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="33398052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 02:47:10 -0700
X-CSE-ConnectionGUID: bkN6o02fQdu5JfObROmFMA==
X-CSE-MsgGUID: iJd15WrlSoexX6guufGo6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="129796385"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.254.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 02:47:09 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2] media: intel/ipu6: Fix dma mask for non-secure mode
Date: Thu, 10 Apr 2025 11:47:06 +0200
Message-Id: <20250410094706.36958-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We use dma_get_mask() of auxdev device for calculate iova pfn limit.
This is always 32 bit mask as we do not initialize the mask (and we can
not do so, since dev->dev_mask is NULL anyways for auxdev).

Since we need 31 bit mask for non-secure mode use mmu_info->aperture_end
which is properly initialized to correct mask for both modes.

Fixes: daabc5c64703 ("media: ipu6: not override the dma_ops of device in driver")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
v1 -> v2: do not introduce wrapper

 drivers/media/pci/intel/ipu6/ipu6-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index 1ca60ca79dba..7296373d36b0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -172,7 +172,7 @@ void *ipu6_dma_alloc(struct ipu6_bus_device *sys, size_t size,
 	count = PHYS_PFN(size);
 
 	iova = alloc_iova(&mmu->dmap->iovad, count,
-			  PHYS_PFN(dma_get_mask(dev)), 0);
+			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
 	if (!iova)
 		goto out_kfree;
 
@@ -398,7 +398,7 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 		nents, npages);
 
 	iova = alloc_iova(&mmu->dmap->iovad, npages,
-			  PHYS_PFN(dma_get_mask(dev)), 0);
+			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
 	if (!iova)
 		return 0;
 
-- 
2.34.1


