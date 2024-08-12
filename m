Return-Path: <linux-media+bounces-16118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CA194E7B4
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20AC01C21AEF
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 07:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46649165F0B;
	Mon, 12 Aug 2024 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSL2YLOf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2033115B0E2;
	Mon, 12 Aug 2024 07:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723447485; cv=none; b=pmDwv/FtbfDfgiUe6N39RX1ZX5uWMMwOPxPPILrBMENtQ2LougQT0Dgt6cjpB9c8KtU3OTgQjRyk2nRD1AKw8pqUdOMOlHqj5Q7D5/7ey+TYoL5LnL+80ldx3PSe3hsuu3P8CvsvxHqxLCo0QeyXgT2Kjptc0FZgmwYOMXk2Gf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723447485; c=relaxed/simple;
	bh=M4WD08AFJfwxIMKP9dD+34UuQOtKj8NZVES++ZlP7r8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dNaAmHvY0vUxnH0PF+w8qg2UuDC5WGOA04lglx9sGjjgdkNNAcd29vvi37X5YibfPKpps3UXh/pdq8j3TqGsymqvuqLK/pUyYlJKgMmRtm+C3FVgnJRsUoI65nwx6ETisHFAqd7e14xaiacNeBhD10BNA/lg4AM6ylL/pvuBfmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSL2YLOf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723447484; x=1754983484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M4WD08AFJfwxIMKP9dD+34UuQOtKj8NZVES++ZlP7r8=;
  b=DSL2YLOf62XpwOMeibz9FN1+mUA+53bL5Ap5tj05g5//CDdoOTMpIasf
   yjJzrvgoFzKQAiLd25S+RNLi/NXtFIgbb8tm3JusfV6cAXsGgnoAppSWG
   ozukNA7ZB9XJA9RPE8gaZ+sg1BVsw2vxce4YIhSaK3oSay3dQhlfV3E64
   Bjf+JUU1aOU0sxLWfmRV2xW0tDzsoOiK79ikN0LIqeGTZPpFZSr1nWAB5
   DfGBkbjUz6/lgTc9em1wHojNFTyTmzgi80mURZHmB/+dvARcofeGN43mX
   /s9JKsOFfETw8y35d6gJ0JaX05C8VFNRUYxyraE6nt/6hg7QgUkBkX/nH
   Q==;
X-CSE-ConnectionGUID: 5Qff7fbeQP+Ax/aDxB1KSA==
X-CSE-MsgGUID: ZHztckBBS/+LzC1BTAYCrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32691592"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="32691592"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 00:24:44 -0700
X-CSE-ConnectionGUID: LhQxLe41QF2DxBJXFNM/Ww==
X-CSE-MsgGUID: x1X5zubTSTiooV29cneh8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="62829623"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2024 00:24:39 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH 2/2] media: venus: firmware: Use iommu_paging_domain_alloc()
Date: Mon, 12 Aug 2024 15:21:05 +0800
Message-Id: <20240812072105.9578-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812072105.9578-1-baolu.lu@linux.intel.com>
References: <20240812072105.9578-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An iommu domain is allocated in venus_firmware_init() and is attached to
core->fw.dev in the same function. Use iommu_paging_domain_alloc() to
make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/r/20240610085555.88197-10-baolu.lu@linux.intel.com
---
 drivers/media/platform/qcom/venus/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index fe7da2b30482..66a18830e66d 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -316,10 +316,10 @@ int venus_firmware_init(struct venus_core *core)
 
 	core->fw.dev = &pdev->dev;
 
-	iommu_dom = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu_dom) {
+	iommu_dom = iommu_paging_domain_alloc(core->fw.dev);
+	if (IS_ERR(iommu_dom)) {
 		dev_err(core->fw.dev, "Failed to allocate iommu domain\n");
-		ret = -ENOMEM;
+		ret = PTR_ERR(iommu_dom);
 		goto err_unregister;
 	}
 
-- 
2.34.1


