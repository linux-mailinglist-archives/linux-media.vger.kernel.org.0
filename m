Return-Path: <linux-media+bounces-49385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 277ABCD8322
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA56E300FDAB
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 05:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4116D2E228D;
	Tue, 23 Dec 2025 05:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFsyIw9b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851262F5491
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 05:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766468332; cv=none; b=uiyH3Amzb320MpW6SXUSQbTpgGq6I4u0Ukkq2q6gjamOGRdfJtmUf9ruV2odu8CBNzEegNyMHQs74DIOSqpxTway8oB4CwHjhmq9+h6okdqfwEoKtGygGz1VYaa9ZXNEOsKLpOsVWTbLdLKb41bjxocu62laoRRglQh12yVZgMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766468332; c=relaxed/simple;
	bh=2MZhpG67wwodmVlCxjb79Hixgepv7csutEKFGKRczq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AIPAPo0BnX/PdMO0Wf3iiRNgHRh2SmnZWeKIXeZsQsQkOS+0JL0LydkdXyZC06p8MxR8MQ0wu7Q+KmxGG6SkYLKrz/Pkss2e623KENAIjDfSZFVUfNi9IR79EftkmXZqmi1ghdWjQ79tHjwzxNZKsm+bQSxFSMUCG69IKg6VuO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFsyIw9b; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766468330; x=1798004330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2MZhpG67wwodmVlCxjb79Hixgepv7csutEKFGKRczq8=;
  b=LFsyIw9bju9lQQ9xxLT6brG4dicKcc1IqRShlgLQRE5bawK8KX+7KLhZ
   tSWK5aAM4tQaiovT7hFuCgO68PyYoPxc6CnK2rE7Pc5upJEN4G28hkVnZ
   2tGR1pHOTAvnI03vawpBueE+HLsnUnDYDGDLpjBAubFprmXgWSzavKUR7
   5kTeOG7IP1alpk5gwGBq+RMcSMlOfI49JeOlaXoviFR08ghBFDBgM+af/
   ADZImB+QolmSF1Ydk6VUFgm5WFaqiV93i18/pZwarDw5Ap8ztyttwYGXT
   bRmcHrJCuzmTrIjFWIV5cfg60ru9d0TlfJXpfm9vnWTbC8aduFZ5vixcR
   g==;
X-CSE-ConnectionGUID: mWZx5XcSQpucFjGCJuKfSg==
X-CSE-MsgGUID: GuboPaobSgiffj0aieykxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68255979"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68255979"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 21:38:49 -0800
X-CSE-ConnectionGUID: /qqaFcOxSkeCza2MMc2oGw==
X-CSE-MsgGUID: /eUdrkOQSQGCXWeQQi3ZUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199366565"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 21:38:47 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 1/6] media: ipu6: fix typo and wrong constant in ipu6-mmu.c
Date: Tue, 23 Dec 2025 13:38:39 +0800
Message-Id: <20251223053844.3124621-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223053844.3124621-1-bingbu.cao@intel.com>
References: <20251223053844.3124621-1-bingbu.cao@intel.com>
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


