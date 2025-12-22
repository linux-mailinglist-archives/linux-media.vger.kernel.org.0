Return-Path: <linux-media+bounces-49275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFECDCD493F
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 03:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFC70300443A
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 02:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2666D3242AC;
	Mon, 22 Dec 2025 02:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGKB2GPm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796B32AD37
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 02:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371697; cv=none; b=M0RybRZLn0dkK3KhkOYMnrYTsEA1h7wN7gvvpOHfoglUO6uxflBk8Ukr+Xe6996nTGSSPEBgzWYHfsRH3Cu7H4JkZhoVho8O/F3fZxt9nREjNN6UNo80iPG2l66G9n/mEipwq25EZUXOIU7h2qo1W8cRvv+OiJhJxMr61l2xAno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371697; c=relaxed/simple;
	bh=rWppK29ZtI0IDYpkkWaX3C382AYTekkijwNp2UaaiNU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bfYP2bhf1grRS2vDwioAz1kzNt+V1LVAitUMunl+xSs5tVuvW25+P8MV0vL7IK/TDpz/MY2WnWR5o+ba7EP2uJHE9sDzs4tUkKYakbwAqkVCbX3cfIdS4qXIB7AbuoY59D+2Bc2OFo82n88tZkzqLGCtO51TIdypL3enU8L4glg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGKB2GPm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766371695; x=1797907695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rWppK29ZtI0IDYpkkWaX3C382AYTekkijwNp2UaaiNU=;
  b=YGKB2GPmZLsjRvx+1rrQgGqXa4xhrrSpJViVEninAXYHVLn6xzh/67Eu
   fxMegLj3TS51yasvdWwZeTvnzX5vacOiHCTQUC15f6s2HpxY6NYGHcE/n
   QNVsm4b4Cj1nwIcYGiomGkNobnW4hxJn7W4clJiwpOoxex1pQD9HcM55+
   QpnSX5bqpT0FOifOFhFmu7JUZuU9NWk1MOZNN5k7ob2URyEHHYs06hoHt
   rtCNn8cFBblAh9UmRSfjbI1sRzVU3LGyWP7l/DwFGlX0SwCC8n+S/GBqF
   Cuscl0HqQkoYjnDP9UN5qb1dvHt6SWgjrDA5NV/G2oDlXSlC8TcyltdzX
   w==;
X-CSE-ConnectionGUID: lnkbLZiuQa+qgpZXsa5ymw==
X-CSE-MsgGUID: VoAjWa7ySIOwL05IX4wQWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93701906"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="93701906"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:48:13 -0800
X-CSE-ConnectionGUID: 81rnEed8SdS+M8eEqlqvlg==
X-CSE-MsgGUID: ieb5I5c2TuOJUlWlSBdO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="203545265"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2025 18:48:12 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 4/4] media: ipu6/7: fix typo and coding errors in IPU mmu driver
Date: Mon, 22 Dec 2025 10:48:02 +0800
Message-Id: <20251222024802.1253754-5-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222024802.1253754-1-bingbu.cao@intel.com>
References: <20251222024802.1253754-1-bingbu.cao@intel.com>
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


