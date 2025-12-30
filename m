Return-Path: <linux-media+bounces-49722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A1ECE9BFA
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D71DE301E195
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B60921C160;
	Tue, 30 Dec 2025 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OffpVBkN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837B2144C7
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100215; cv=none; b=ilRNotNXNqy2N0Krk8JmGhxAVAXvEFNnWIMF7udaUfK59/iTmjgoA+BkFKzXyugV0nBEWyGss0qXR9kMvgxQwlFluFTf4Vkw5rnN7iqDM1q13WO1gLoXnx4HcG45GsajcFZvkm79tHBH5X7woiUH5eH2LNu7tlTKEu2QIRCHZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100215; c=relaxed/simple;
	bh=fgAL4Jcx4y1mfyKTr643543oQvoQKJFZZ14TKaLXFtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueO1EwUrh3mb/Wvo7AcN5pOtB1UBS6EVG5kCAcXDZ4tm4/DfGMLoY4ON7zbDfJATvt2+Es//qW5Bia2troUEbNFhIMiUTsm6LD9l8RhyFXANMFZXCTxr+syh4Qx0mQLBzhCVvZh6W/MmRnibR4a1uSANpkoKF6yUgX6PhzdlOkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OffpVBkN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100213; x=1798636213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fgAL4Jcx4y1mfyKTr643543oQvoQKJFZZ14TKaLXFtc=;
  b=OffpVBkNjQ8soTsFv1goWU+MnSno/f4TfHM3GaUh2NXfc/KgchNd0gEq
   U5Hcpkim0iXHZVxUySv1m3pP7NLq2ATLpmlF4w4PH4aKZ1trC51DMYYeF
   dql7POzFt1JZqc6bNVZjg2pu3NdFmzFRkWEoXSFkp/N6S2ATN9rx32Egr
   fbZnKpau3V8LEhtrGLc1LIsm4Z311MEVKUM1TmijH/YRKVhC5j1nWuM/6
   HL72uwYdCasw116Eu7bfSucsJNuiNyFzvNm5jtnt9FpNdvl/2Mby9iM5s
   EIRK5PxgXuoNZ1EyIdZgBQR5AD1xE29WzmExoWZU4UKXSGGWw22NjKay1
   A==;
X-CSE-ConnectionGUID: YwX1Na0dREmlzi8rON2LMw==
X-CSE-MsgGUID: L/clyU5aRDWpeBBwhIOn8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79808040"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79808040"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:08 -0800
X-CSE-ConnectionGUID: GzsA2ayzSN+rH/wSvXdiKA==
X-CSE-MsgGUID: Xh8ZHpwITZedDdWUxeQGYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="224710703"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:06 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 945C4121D82;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000Jbr-173A;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 02/13] media: ipu6: Drop MMU hardware initialisation in probe()
Date: Tue, 30 Dec 2025 15:10:02 +0200
Message-ID: <20251230131013.75338-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MMU hardware is initialised in the runtime PM resume callback. Do not
do it in probe().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index fc0ec0a4b8f5..eb45544a9f05 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1070,10 +1070,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	if (!isys->csi2)
 		return -ENOMEM;
 
-	ret = ipu6_mmu_hw_init(adev->mmu);
-	if (ret)
-		return ret;
-
 	/* initial sensor type */
 	isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
 
-- 
2.47.3


