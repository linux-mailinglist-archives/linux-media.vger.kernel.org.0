Return-Path: <linux-media+bounces-49397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE38CD85EC
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 08:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BB88301A1C6
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CBF309EEA;
	Tue, 23 Dec 2025 07:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dK/ozcpj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49103FF1
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 07:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766474591; cv=none; b=dFElNyA5Foxbtut2nWgchWnP3jU0hmO2Ndco7gW4BzYG26WbynZFtnyYL4plEbqpGTPooOXlrrTH1e2CZWApyHQfU7ltNHXPCl/XO7RqguwFBwA3aPR525TCsPFF6k6zSXThhCHqIKZHTgmuU4mDpPTTkstVxzTZzqwyT2MaRZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766474591; c=relaxed/simple;
	bh=2MZhpG67wwodmVlCxjb79Hixgepv7csutEKFGKRczq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UtYI5IFzI3M54hCILimFWV5AMwsI5Li5r840QQeowu1zsWsGe3Lv33ibVx4pRmRbm73m1scnqZAt84H/cDBorAuVJ3f6cM6GkQ+89FVbirGxj+6FDFHEhFo84bSX1OnVHyjJ4qJYTbucbkEOFaaIXV8tSsX3+WuFsQsDXj5xjH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dK/ozcpj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766474590; x=1798010590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2MZhpG67wwodmVlCxjb79Hixgepv7csutEKFGKRczq8=;
  b=dK/ozcpjaiUF2VrjiX1M9eC3Jq2wXXWX02d8OQfuek1dSEKFlvG+tVOH
   56OGV3NHrnd7jx2NLqr9t+lrQF7pJrwm7vCrRyZ80DzTZiiQ1sve3OPkD
   wGZB09nQyo/UGTLh2JlJnRDzCGrOfY2781EPSvXfHX0D00HCBlEeTMJjf
   2U/2xSo7fOVQE4AJdcy0/rWzS5JBe0CwDkDLaM6v5j+nWUKXAWpAxI6Gc
   j4igB8sq16DmljvxRyihtG9pZMVXzQSW3Rr4Q6DAtRh+h007kzJAJTJLB
   GRFqzIzFFwEJX+bDMw4ObxvLTuzMW/8WQKaSQTNNyl2RsYqJnai4K73L7
   A==;
X-CSE-ConnectionGUID: LsLSoKeQSOKq7QBSNo2yJg==
X-CSE-MsgGUID: RimzxeYERxyuqTyhafQqjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79043741"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79043741"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:23:08 -0800
X-CSE-ConnectionGUID: 0Xdav/AkTV2fUnu+54pCCA==
X-CSE-MsgGUID: hKLnSdmhQOObpZuvTyUNyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199747412"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 23:23:05 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 1/6] media: ipu6: fix typo and wrong constant in ipu6-mmu.c
Date: Tue, 23 Dec 2025 15:22:58 +0800
Message-Id: <20251223072303.4078094-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223072303.4078094-1-bingbu.cao@intel.com>
References: <20251223072303.4078094-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Fix two coding errors in ipu6-mmu.c:

1. Fix syntax error in page_table_dump() where the closing parenthesis
   and semicolon were swapped in the TBL_PHYS_ADDR macro call.

2. Fix incorrect loop bound in alloc_l2_pt(). When initializing L2 page
   table entries, the loop was incorrectly using ISP_L1PT_PTES instead
   of ISP_L2PT_PTES.

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.34.1


