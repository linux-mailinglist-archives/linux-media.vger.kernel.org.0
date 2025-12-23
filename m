Return-Path: <linux-media+bounces-49402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E41CD8601
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 08:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB52D30351EF
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85022306B3D;
	Tue, 23 Dec 2025 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gen/1qnz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9336301026
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 07:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766474600; cv=none; b=TkS5x2Jn6Iy/eubiKG7JH9Z7tmO4oDDJqgMZtY4oW31Mi4Th8l3RJXE1R6XdE2uVDfRbVQlkAgTLssbjklQOlxSS1ymTp/txuIU9wwSaQ8O9C3XwbiyclVLaQzbR2n0ZeC9EBYFxwOGvYDSsSd27J2XFqvbFSXdGkd54xHe8IK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766474600; c=relaxed/simple;
	bh=tkrkbJziwV8gWy66PB2uYJ3otO579oyccog6MyYrLGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mjqpI2QIY5ffbmXD7fwfS+MfEF8KnOwHHdJ+pgXqUG93OCgxTX8l/+vOiQrTc8DP3o9EgU7CKPE92woMZW8NCB0Qf6leJfziTfGl8jm/T+34iZA+QYKrAn/C6MRoAQWB2AU4xg9SX304Xc3mMchY2LrX3h7ohEVSOhCN9EtRsdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gen/1qnz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766474598; x=1798010598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tkrkbJziwV8gWy66PB2uYJ3otO579oyccog6MyYrLGc=;
  b=gen/1qnzjXXEJRAoF56gNCPpP8p1Mjc5fH7AY7B6SO9Ia2rw6hzicTmQ
   RoiC9YaFkSNtnxpo1FwKLQ8SCAHZ4zo/ysOC6aFgbAKqtIG2HgJeyofd4
   YxPKtnm7vMTTEuBIFeVv9M0ixfqAsLVlMb6CL9Et/ACmebusfhQ3eX3v0
   XE3zoXF25CCilBmyTnik6VFw3tLqwcFOk51uM6E/4UreoqL33M5YJLD8W
   79XobQ18kbqW1uCUhc+HcKNGoZfe+DYcE/gbgnJEqMaISXnnp24PmVFqc
   hNVzeErEeI4KAqkd5eo/5sCO7WzaWbLirQxWJKZaHzFTiHo8w+49YpBmO
   A==;
X-CSE-ConnectionGUID: 83QXnnUESEakc31+cOJRYw==
X-CSE-MsgGUID: TrDSuMrtQy6PpcMrZ/14nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79043767"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79043767"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:23:17 -0800
X-CSE-ConnectionGUID: /+U28g8/SxWvrYMIp7BokA==
X-CSE-MsgGUID: mzl5Ihl3RUGugvhSPozupw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199747441"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 23:23:15 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 6/6] media: staging/ipu7: fix the loop bound in l2 table alloc
Date: Tue, 23 Dec 2025 15:23:03 +0800
Message-Id: <20251223072303.4078094-7-bingbu.cao@intel.com>
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

This patch fixes the incorrect loop bound in alloc_l2_pt(). When
initializing L2 page table entries, the loop was incorrectly using
ISP_L1PT_PTES instead of ISP_L2PT_PTES though the ISP_L1PT_PTES is
equal to ISP_L2PT_PTES.

Fixes: 71d81c25683a ("media: staging/ipu7: add IPU7 DMA APIs and MMU mapping")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7-mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


