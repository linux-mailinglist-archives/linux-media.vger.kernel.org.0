Return-Path: <linux-media+bounces-1735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D76806BA0
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 11:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 739EAB20EC4
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 10:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA7E2D056;
	Wed,  6 Dec 2023 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mb3yFTUz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3998710FB
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 02:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701857668; x=1733393668;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G3IiAxEh20D9ZEZG3Zv9lXXsElK7pqNxC1UpsKtKhMg=;
  b=mb3yFTUz2PobDvplW3aeGkoD5BO1h+z37Qq6nU/XsBDPDosDB4/GbPGT
   bOqtDmRj+C/w7YgB3O30kCRa+jrUyMDNv8L47kUUijZg/w+nW/t51cIW5
   8M6Z2/aCVJUDIwjgM7GqF1eYskDNl3u92IqfYYr6x5/639b5qLxaul55o
   veCv+4mZZkmZ1f55PK8nGDZK84nTKnQYCgayuTIs2A7p18RmsqHnL6UFd
   DKlR5K9bWRJ2Z5xkA2xGv77i8O5lq9LRm4nJfizQ3yuyt/wPzYXG0siJi
   Quk02EXEEkSqvcEojK+fVWLedSz07TW2+EcIhc8UyMzimH5k2O06DcGn9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="924441"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="924441"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 02:14:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944603742"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="944603742"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 02:14:24 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6ECE911F995
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 12:14:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rAous-003g8B-1m
	for linux-media@vger.kernel.org;
	Wed, 06 Dec 2023 12:14:06 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: ccs: Select V4L2_CCI_I2C
Date: Wed,  6 Dec 2023 12:13:56 +0200
Message-Id: <20231206101356.876927-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select V4L2_CCI_I2C Kconfig option which the CCS driver now depends on.

Fixes: b72f6809088c ("media: ccs: Use V4L2 CCI for accessing sensor registers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312060941.CYiHppAp-lkp@intel.com/
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ccs/Kconfig b/drivers/media/i2c/ccs/Kconfig
index b55c93a2e204..710a729ae42d 100644
--- a/drivers/media/i2c/ccs/Kconfig
+++ b/drivers/media/i2c/ccs/Kconfig
@@ -2,6 +2,7 @@
 config VIDEO_CCS
 	tristate "MIPI CCS/SMIA++/SMIA sensor support"
 	depends on HAVE_CLK
+	select V4L2_CCI_I2C
 	select VIDEO_CCS_PLL
 	help
 	  This is a generic driver for MIPI CCS, SMIA++ and SMIA compliant
-- 
2.39.2


