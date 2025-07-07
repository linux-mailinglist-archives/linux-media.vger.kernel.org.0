Return-Path: <linux-media+bounces-36978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED9FAFB089
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B3987AE441
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090E3289E2B;
	Mon,  7 Jul 2025 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jICd+IEA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B3D1DE8BB
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882291; cv=none; b=KWB4Bs33d7K/ClkeRfT1mUJoQ5PtNxQe+HBpPE6INa5YwPMlA8lJBGPzLJ8QRLujrhGyivNADc4oiVNrQbD+s3dRN49NLva7knPhQDPFCoiSGN0ouNaJfa6YKuVbVRrGsWWl36Fotc+/YN2ncz8m1lgdFXumFXu3hu3BrKCRfc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882291; c=relaxed/simple;
	bh=mKQAhIE8yxZRqWIj8fOgfeNKtnMq5nRkNBi2TImXttg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sZxSWMan7Prd3MliecBjDsQQB94n1Fdnf44o2aiGyDyAzl8aKy5T6/opPAMtLaxLL2WnmNv52Lb6MJe3jlmZbMPp2KVfzoJUZtIx5zzxo/tf3jpWutMndj49FZBjLzPzUg9oBhTrFIJaxf6Zsp6DS0NE0Uw0ChYkzPX/pZJeZl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jICd+IEA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751882289; x=1783418289;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mKQAhIE8yxZRqWIj8fOgfeNKtnMq5nRkNBi2TImXttg=;
  b=jICd+IEA4dv20NzLZVBIMLhRZrzm0l5aAjGggRYatq1Pr8u99pEh+zdI
   kRBngZT7PTJxOheFMG5ht/EkaC42DWKsU7g7CbYlrZWKaPCHX9Rh9qEQC
   LqWM3QanYs5W60y5vj2zcLdWUFYbTujB1KssuAhYn9SMmRT2REvhEM/Yt
   OtMx9MsdCrz4dlOkKHK3z16/0Cik++sR5QxMgasB7MCWJi1cFV8avHDKt
   7KrdGRGJesJDRaTQO2R/ihaIf1+VD14sqlbeqs5INU1IdZUTAE00WEnoY
   rM9gfIg3SW1qN39VVfinbrIR+yujO14zmyun3xzVbgmxtB2AKp8Irc85+
   Q==;
X-CSE-ConnectionGUID: qAi5R17qQNGenzevWDdmHA==
X-CSE-MsgGUID: 1Qo3BgEPRB6hEz9l8B27rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53957973"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="53957973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 02:58:08 -0700
X-CSE-ConnectionGUID: Ozh1bxk5Sn6yMceNLxP9HA==
X-CSE-MsgGUID: XSkSqXEfTn+OuYfkS+Jh0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="155914279"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jul 2025 02:58:07 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH] media: staging/ipu7: use 64-bit macro for post delay calculation
Date: Mon,  7 Jul 2025 17:58:06 +0800
Message-Id: <20250707095806.3425876-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

When build ipu7 driver with i386 config, it will report error:
ERROR: modpost: "__udivdi3" [../intel-ipu7-isys.ko] undefined!

This patch fix the problem by using correct math macro to implement
the 64-bit value division instead of C divide operator.

This patch also update the calculation to make it aligned with
the formula in the specification.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507051239.cb4TkmuW-lkp@intel.com/

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index 4407750c7f40..1ac68696983e 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -731,6 +731,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 	u16 delay_thresh;
 	u16 reset_thresh;
 	u16 cap_prog = 6U;
+	u32 t3 = 224U;
 	u16 reg;
 	u16 val;
 	u32 i;
@@ -815,9 +816,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
 				   deass_thresh, 0, 7);
 
-	delay_thresh =
-		((224U - (9U * 7U)) * 1000U) / (5U * mbps) - 7U;
-
+	delay_thresh = div64_u64((t3 - 63U) * 1000U, 5U * mbps) - 7U;
 	if (delay_thresh < 1)
 		delay_thresh = 1;
 
-- 
2.34.1


