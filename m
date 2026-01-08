Return-Path: <linux-media+bounces-50196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE41DD01AA4
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 09:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3228E31E555F
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7FB37B3F9;
	Thu,  8 Jan 2026 08:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hT2NL7LV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8177C3559CE
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860240; cv=none; b=ryOkXD//kgtdyY+0jCQRloXLC9hpq6xz2jelV/Z3NKkICR3AaJtghD6dznG3EB6Vis0Vk0S5nEfweZnuShHTjvLKJVreDV8VrCsmptp2PvwmbiIcFQNG3jbywIVqFgXUPol8Y67ZK9B62K1W1Ska/ILLEiRLDBtHKFEh8UK4xWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860240; c=relaxed/simple;
	bh=zBMDHnDgfNy6XSkRUtIVzJbjB4R9LrbhCmP2DRAJYRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMUP5PEd8u2vumx2cvcidwPPLLQjtYTaLRa72vABi1Y+u7vM98BR5pFvkOXMkcHJ5XN/RvJGIIxwrDuEAFpNcfgk2ZGbQijfCpVxkj8nGa6KdhYzo8qPQcDuUu2F4zTOhETftCEGjL+2GTHB4rbjVEqdjWeNjBgCsHFouuTSXlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hT2NL7LV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860235; x=1799396235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zBMDHnDgfNy6XSkRUtIVzJbjB4R9LrbhCmP2DRAJYRQ=;
  b=hT2NL7LVdO7m+YU60LYedJ+zYOkoBzD3wlAomwjN/hN7VKYgYn8ZKCT+
   uenukLCrhcs+Hk8YFuYww9351jbqaYYc2Km3GSW2WAm8fCnBOuFJ8WfFp
   l0ok/NuFjNm70XArfXNJmeAtAwZekoDbMOJoaeMSMRk++g1ptIAIcIgCO
   hfrkZF2ND3EYOScZzWt5HPrneEAY99WgHZtVUnJC8BD8jnaRTgtmXdbU6
   VfLfNi3xe+Sq3pCl+YCRL0VT5RxuraWfwhimYItvIBD7kksnfl9sebQK5
   fqBzSqxTY0zYatMCCHNMI3Qb/FKGgB3VSv0IqYzBsBYyvh4bUO34yMOOg
   w==;
X-CSE-ConnectionGUID: X8SKECsGQ5G6SFDklUOn7Q==
X-CSE-MsgGUID: jraTFdbuTIuPppGbywgd7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869919"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869919"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:02 -0800
X-CSE-ConnectionGUID: c74puSd2S/aqMh8X8xDdjA==
X-CSE-MsgGUID: nVVp1zyhToGbd9jiDK9wCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842948"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:01 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 653E8121D85;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HSB-0OKN;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 02/14] media: ipu6: Drop MMU hardware initialisation in probe()
Date: Thu,  8 Jan 2026 10:16:59 +0200
Message-ID: <20260108081712.543704-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MMU hardware is initialised and cleaned up in the runtime PM resume
callbacks. Do not do this in probe().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index fc0ec0a4b8f5..226bfae21c16 100644
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
 
@@ -1125,8 +1121,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	if (ret)
 		goto free_fw_msg_bufs;
 
-	ipu6_mmu_hw_cleanup(adev->mmu);
-
 	return 0;
 
 free_fw_msg_bufs:
@@ -1148,8 +1142,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	mutex_destroy(&isys->mutex);
 	mutex_destroy(&isys->stream_mutex);
 
-	ipu6_mmu_hw_cleanup(adev->mmu);
-
 	return ret;
 }
 
-- 
2.47.3


