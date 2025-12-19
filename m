Return-Path: <linux-media+bounces-49142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B8BCCF3D1
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76DD43024CA6
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08842F5A2C;
	Fri, 19 Dec 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+hwniCC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92F2F3630
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138319; cv=none; b=IF49CWETQe5cuuqFDXCQwx0DcQv7MmMN5M/+pLr1U9Yj7nP2ZLyRbx1ZhVsAu+eT1PLQME5w4hjgKTp44C1kVSP/2HLnLBEr0fdHead1oraCJsV7610TKLMWcxMxtdur/Ya2vadUEtu3En/lTktTesPIuVMkA4baiNUjByz4JVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138319; c=relaxed/simple;
	bh=fgAL4Jcx4y1mfyKTr643543oQvoQKJFZZ14TKaLXFtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnSC88/5v2MtbvCGb3JnV7juJB5eQ/MC5Y1M6FSMQiQuzvi8Nup6puC2JSyFeHtaQ9rKbk6cARgid71+NgffTiYWrtYVOOHMx5j3D+I8qV2qp54E+XCvLQlztYhCDsTAOZcnVj0m9MEXcj7CL/JxIe5XPQKnwvAzX8iA1nSr92Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+hwniCC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138317; x=1797674317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fgAL4Jcx4y1mfyKTr643543oQvoQKJFZZ14TKaLXFtc=;
  b=I+hwniCC51TPzKjArdmqz2vttbc9dGwx07pNiSlvrjCeJtkOia/1RmiB
   QL6Lkc8B0049QXhgm6vE3fmgYkMNu8+SPbt5bpw4uBbb6NE3+jdXvOVmG
   nDwwBFLnX6gqsijcyLUFJqghXCJ91G+ZX7mZ1IpCjvU83n3hprBqK2okm
   A4QNzf0mxoJH7wgNxHD2Dhwk1lcgT5hQVrmTQsxDeStwUuJVLm4EcVjIa
   bnDrknrbEZYAHrdL0EA/SUXdQ/29CVN0IaHL0AVVlIAmLzSmU9o6Dc4XB
   S04/kdohq/A65YKsCJgTk6bKkzkkA0oYAUJs73U/9J+E4tAHxtQOCpCKq
   A==;
X-CSE-ConnectionGUID: fhOe5rpTT3GXmf6BqyMWLg==
X-CSE-MsgGUID: YGwb4F6+SRaYu3BKec+ppw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945157"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945157"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:34 -0800
X-CSE-ConnectionGUID: 1YevNEAlS/CceTOx/KeHUw==
X-CSE-MsgGUID: 4oVpobgnTVSNStcyPJUGKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973375"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:33 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F2F3F121DA2;
	Fri, 19 Dec 2025 11:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsRU-2i79;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 02/13] media: ipu6: Drop MMU hardware initialisation in probe()
Date: Fri, 19 Dec 2025 11:58:18 +0200
Message-ID: <20251219095829.2830843-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
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


