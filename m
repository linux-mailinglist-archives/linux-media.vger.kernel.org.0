Return-Path: <linux-media+bounces-37052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72175AFC118
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 04:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C26C1AA6E6E
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 02:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812B6229B02;
	Tue,  8 Jul 2025 02:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jkh9xtZ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C52226CFE
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 02:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751943521; cv=none; b=SfPSCmjk7tIIP9q6JYj4N8Hohd62sieqSglomS+Cv2CgJYDVfCYQKBdgXSToEN9EdTnutzmaThHlneP+ZNkiCuvPVuzUvgbQPesVxGuEIeXyjkpHXirmjf2qpUaC1vQ7BVbUhtr6AbLQ2W8H9n0wP193uqSyYwHutBZb45+fp1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751943521; c=relaxed/simple;
	bh=IDyeqtHuYddPgq10sIvaP1em5O9fzF3HKIeF9sURRVY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qm52dQ/PaJ6HS5srUu1n28jXGYrIXC5scZ+2bV3ydnGchd5HK1Z0pga242ZXmeAQ0chGQvJfHt5tP1QkNcZuywrv8fmdAXrhQrbLbvZE1pB1CG50raqzCAgXA1Y3FTj8Yd6xli1uzHqchkTinyTgvXgHhitnk6p6+M5g0p23jSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jkh9xtZ7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751943520; x=1783479520;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IDyeqtHuYddPgq10sIvaP1em5O9fzF3HKIeF9sURRVY=;
  b=Jkh9xtZ7xqo/zSjkCCckUOm5iLmJWkmWpJvf1Y+Q6f7+aRHFKiwefhGm
   0sGC6JMMtBxmkxYHlpVp8UiFLWI0+VUfm/KLuGxzECkvnCBlD1yHx+rAE
   2nuVFQ4Di7UqtD3Nf1huWRVm6DRP7KCTF2l9Og1JewE+uXsovWBmsG+Vo
   xsGYUR6vA6WPjfVGKaqoxlqaw3KyJ2jR3TiQYUMmiVtf+F6DnRlaPlEyh
   CA8vu6DMe6uTjawNq96C7xbCfQ4EZe1Cuiua5ue4Yv4sPrGnvCF93XDQG
   Jmnkk9UehzetPqhd8SAVmhkkgm0/JP05Lz80paAiiLagN9gQDgAmhjj8J
   Q==;
X-CSE-ConnectionGUID: CahXKW7zTcK2HxdvoAJdMQ==
X-CSE-MsgGUID: FNYHxmETSJe8HX7J5b8X/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54099562"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="54099562"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 19:58:39 -0700
X-CSE-ConnectionGUID: /28mM3FJQmypdEPF+auG0g==
X-CSE-MsgGUID: ra/MiorPS3WKPLX64R16wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="160922109"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jul 2025 19:58:38 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v2] media: staging/ipu7: use 64-bit math macro for post delay calculation
Date: Tue,  8 Jul 2025 10:58:37 +0800
Message-Id: <20250708025837.3898579-1-bingbu.cao@intel.com>
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507051239.cb4TkmuW-lkp@intel.com/

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index 4407750c7f40..007c8dbcb8a8 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -815,9 +815,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
 				   deass_thresh, 0, 7);
 
-	delay_thresh =
-		((224U - (9U * 7U)) * 1000U) / (5U * mbps) - 7U;
-
+	delay_thresh = div64_u64((224U - 9U * 7U) * 1000U, 5U * mbps) - 7U;
 	if (delay_thresh < 1)
 		delay_thresh = 1;
 
-- 
2.34.1


