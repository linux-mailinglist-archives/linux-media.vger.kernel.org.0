Return-Path: <linux-media+bounces-49285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC71BCD4D74
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B91153005ABF
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 07:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB131E2606;
	Mon, 22 Dec 2025 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eb6s6Idd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A2E27F005
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387200; cv=none; b=SwguMFt1JLGVcn6XLcCsRnAB8sRt4H3EOCyq+Ud8VvwPklTJ8aGWjBXWo4nFZNye6wbatpmeQcynMYJvnh9PH6ddYjd8GSZxEsvLwv6n6LBMtGgXV9qHBBfFyu/oyPzx/xn7aZfwx3segHhKflETVE8zAVSRtpQ+omy5joU2YT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387200; c=relaxed/simple;
	bh=rWppK29ZtI0IDYpkkWaX3C382AYTekkijwNp2UaaiNU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P8CiNdDXSPCwD3CU6/n6yC8ooTc1offguOug+Si1qmLGr3zBUI6IZBJQNBdzUuRI3l+LlR0R/OR1ZpEy1mhZUg1j//Dgzmj/691tasFKvwluZPBs6oXGOzTlD58UnRahXmMZUC5qGHGrSlnlY0xLuU7Z51Mj9ZDKQMIzFcXtTh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eb6s6Idd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766387199; x=1797923199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rWppK29ZtI0IDYpkkWaX3C382AYTekkijwNp2UaaiNU=;
  b=Eb6s6IddTQyvl7A3FEZMe36rlFn9sd8LG3o9Q4lBRvs7NXHwYc0MvO8D
   uTPQrrU88gJ6htr0625hyqs7cXzsj6+uUd/axgZXFuWddSVWK65xyKjH8
   jvPOkrlNaZ7TDsBahBHFNE5S/2qb4uayCizijLPxsB0ocSzCrc3eCbLVt
   aQJP03bIEX39OBmTlB7i9mjbQoIVVn18+q11znQ+pxY8sDDLycpw+1rr2
   C/3rgi8tekXyxDRN/azPOmghhzYKyduNGPbFeRuQLeyq9T2MZnLWsmYJp
   f7Lz6jRAGxNmq6hwk9CpmNRjoWE8GYIPOzpJum0hqi/41g+ir00OXxDF6
   w==;
X-CSE-ConnectionGUID: Gl+1UO0YQ5WT6dWy8OIFyQ==
X-CSE-MsgGUID: KufUAbMwRYyatJZ0B+PyIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="55815099"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="55815099"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:06:39 -0800
X-CSE-ConnectionGUID: B/EhV8hOQ9i9nfDkUWqzvg==
X-CSE-MsgGUID: nRtAdl4ySNugzZbIp/Ra8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="200347425"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2025 23:06:38 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 4/4] media: ipu6/7: fix typo and coding errors in IPU mmu driver
Date: Mon, 22 Dec 2025 15:06:29 +0800
Message-Id: <20251222070629.2018807-5-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222070629.2018807-1-bingbu.cao@intel.com>
References: <20251222070629.2018807-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Fix the coding errors in ipu6-mmu.c and ipu7-mmu.c, it has
no impact on current driver functionality, however it needs
a fix.

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")
Fixes: 71d81c25683a ("media: staging/ipu7: add IPU7 DMA APIs and MMU mapping")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 4 ++--
 drivers/staging/media/ipu7/ipu7-mmu.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 6d1c0b90169d..85cc6d5b4dd1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -102,7 +102,7 @@ static void page_table_dump(struct ipu6_mmu_info *mmu_info)
 		if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval)
 			continue;
 
-		l2_phys = TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx];)
+		l2_phys = TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx]);
 		dev_dbg(mmu_info->dev,
 			"l1 entry %u; iovas 0x%8.8x-0x%8.8x, at %pap\n",
 			l1_idx, iova, iova + ISP_PAGE_SIZE, &l2_phys);
@@ -248,7 +248,7 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
 
 	dev_dbg(mmu_info->dev, "alloc_l2: get_zeroed_page() = %p\n", pt);
 
-	for (i = 0; i < ISP_L1PT_PTES; i++)
+	for (i = 0; i < ISP_L2PT_PTES; i++)
 		pt[i] = mmu_info->dummy_page_pteval;
 
 	return pt;
diff --git a/drivers/staging/media/ipu7/ipu7-mmu.c b/drivers/staging/media/ipu7/ipu7-mmu.c
index ded1986eb8ba..ea35cce4830a 100644
--- a/drivers/staging/media/ipu7/ipu7-mmu.c
+++ b/drivers/staging/media/ipu7/ipu7-mmu.c
@@ -231,7 +231,7 @@ static u32 *alloc_l2_pt(struct ipu7_mmu_info *mmu_info)
 
 	dev_dbg(mmu_info->dev, "alloc_l2: get_zeroed_page() = %p\n", pt);
 
-	for (i = 0; i < ISP_L1PT_PTES; i++)
+	for (i = 0; i < ISP_L2PT_PTES; i++)
 		pt[i] = mmu_info->dummy_page_pteval;
 
 	return pt;
-- 
2.34.1


