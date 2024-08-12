Return-Path: <linux-media+bounces-16107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B34794E764
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E5DB1C217E2
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 07:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CD415F41F;
	Mon, 12 Aug 2024 07:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="diBuGuSf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD250154C02;
	Mon, 12 Aug 2024 07:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723446346; cv=none; b=q/1WXZoiWtgm+GbqPpP/JD3f1MhSGbRnAun/rOT5sxo9otsr+wf5uicQ1Op6YQNjEBhoVVVP0caS7m9Y2AOdX/NIPBzWmKpAtDWtATKVTmtf547Gd4rb5Wj8wRYKEW2tAiGYbIUNMwSSjqhrjerCxf5ONyMeVQDa7EAGMhQOOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723446346; c=relaxed/simple;
	bh=X0ZSpA6pYNtVglGXUJ8Hdn3nA3Sm4FX8yT8TZxIbhck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AsQBg1ifGEpK/uhqDTMdJ0f+Tbsww8/6ZIqZmoVlDvNtvtEcQGFK6iDspZBciPlQ4rm/nQ1f1xZyXr+G+u4tqDiEdIErvzfg+XRe80v7+efKyVHm1omPKUU7U/odTxg5qnCvFBAWxez1UEgG4TG2EuOtb/46QjL4OzbHi1vyXmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=diBuGuSf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723446344; x=1754982344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X0ZSpA6pYNtVglGXUJ8Hdn3nA3Sm4FX8yT8TZxIbhck=;
  b=diBuGuSfEQLQfqfskCsLaWuVSmSp/VwNCJJ/BJuDsAsVEdbdOaZBQDo3
   Cl1GzXcTCka1QrDgoGxRciEDYUporqSfJyg3BijnEu+gjhIr3e/8rP7NW
   Uk0LQSIwDfQmEixvF+tqGFWuqeml1xHCdzXSNUBHtsCy855UGDQ3A2fcR
   sxRfV7oxHWbD04oz4stwge5etKCxGu4S2+9T7nkX/Zd3cWBgFQJJqJGn1
   hg/JPMgBeysFz5lLDgDNEsxmvqftDgAAuN/uXAq7CyvByJ6S8lHPk7s18
   tHYx9V5Fg/W+ptR1w0rSpReI6bHIhfKs8nN2awZ2ou22lR2WU+CC4n09o
   w==;
X-CSE-ConnectionGUID: Tnra79dfTXy47E52ztLY2Q==
X-CSE-MsgGUID: YRUMoY5CSOCygeuVUpqTJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21418198"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21418198"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 00:05:44 -0700
X-CSE-ConnectionGUID: B1d9f9FpScSKBHKsscuddg==
X-CSE-MsgGUID: 4UYjLl2eTyOw7y8yheaagw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58070144"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2024 00:05:39 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH 2/2] ARM: dma-mapping: Use iommu_paging_domain_alloc()
Date: Mon, 12 Aug 2024 15:02:02 +0800
Message-Id: <20240812070202.9366-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812070202.9366-1-baolu.lu@linux.intel.com>
References: <20240812070202.9366-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since arm_iommu_create_mapping() now accepts the device, let's replace
iommu_domain_alloc() with iommu_paging_domain_alloc() to retire the former.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/r/20240610085555.88197-18-baolu.lu@linux.intel.com
---
 arch/arm/mm/dma-mapping.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 52f9c56cc3cb..88c2d68a69c9 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1585,9 +1585,11 @@ arm_iommu_create_mapping(struct device *dev, dma_addr_t base, u64 size)
 
 	spin_lock_init(&mapping->lock);
 
-	mapping->domain = iommu_domain_alloc(dev->bus);
-	if (!mapping->domain)
+	mapping->domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(mapping->domain)) {
+		err = PTR_ERR(mapping->domain);
 		goto err4;
+	}
 
 	kref_init(&mapping->kref);
 	return mapping;
-- 
2.34.1


