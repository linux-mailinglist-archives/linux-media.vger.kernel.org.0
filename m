Return-Path: <linux-media+bounces-39977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED22BB27D01
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 11:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DC436248E0
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 09:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC230264F85;
	Fri, 15 Aug 2025 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdtzEDyT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D9325EF9C
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755249647; cv=none; b=Y4xomjEsc4pWCIUsNLsTWRUIhoLmEP1H2sxm+bPRLmiZ9W0q0DAkECgxH7WsMOMGsSVRkYVXwf50qEmmv6NH42f35QDBZy4v6D4Fjw0O+VLQ854igf5KIrxfkOWrMwG0v6lp7UKMpGMKO6ct/wMgRTRQCaqz9I9wiZqMQIZTyPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755249647; c=relaxed/simple;
	bh=QGhmHs4ae5bOc7VyQcVL4cUsW0dDx9TFK95KMWb4yLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tayJtV419M6KmWsDBzPgiKMmuC0WEgjm+15M1mTypEoF7eZVxy0Vd/gewgzIaGB/uYGVdDxdXe+qKSmdB9eg4Q8e4ASeXiYND4jVCu/gnhoLDwv4HEwlPHtElB7A5KhBHIHFypyZliBZoXmYnjIkHTc7CXQzLWn9F78kWctbUlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdtzEDyT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755249645; x=1786785645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QGhmHs4ae5bOc7VyQcVL4cUsW0dDx9TFK95KMWb4yLA=;
  b=EdtzEDyThAb/zg32MRw0QBmNNDBUFPgUPFNO8CHUx5THhy6n5MZF2G3M
   9EFXUlfetMTkikZaoOPGJbsWgAvRm61e8qBLhFEHjcANhhK/Trt8C2bcJ
   G+Kl4+ngnr7pIPIA22+lal8S9brDxt84RjTy+4A1yFX+7CY6K3P8ldmi6
   V6rnk6xDzY0fec6SZH8fkfUKtOJuZu49l08a0l+3gWwqdGfmgyWS+8ahc
   iQN1n3s7jlhQrxUfNueBencBHn7jW9Wz0SHEl7kXEQ1THiHNbBrD5QZ8U
   zFLGRfr3DOTVqNF55/SUeb0w5GEaweTuvc58mkPzhC2pwZQnCOHB06m4U
   A==;
X-CSE-ConnectionGUID: enfIkAcURa6tzNBwJ0OWlQ==
X-CSE-MsgGUID: +tXetHQMQUuD9AR2e/c1aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61378989"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61378989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:20:45 -0700
X-CSE-ConnectionGUID: 2vUI95uARcufCkUWwEe4iA==
X-CSE-MsgGUID: ZMcrtnv0ReCHC2eYhdEjdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171222572"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa003.jf.intel.com with ESMTP; 15 Aug 2025 02:20:43 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: tomi.valkeinen@ideasonboard.com,
	hans@jjverkuil.nl,
	jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 3/3] media: staging/ipu7: cleanup the MMU correctly in IPU7 driver release
Date: Fri, 15 Aug 2025 17:20:37 +0800
Message-Id: <20250815092037.1825769-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815092037.1825769-1-bingbu.cao@intel.com>
References: <20250815092037.1825769-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

IPU7 ISYS and PSYS auxiliary devices are released after
ipu7_bus_del_devices(), so driver can not reference the MMU devices
from ISYS and PSYS auxiliary devices, so move the MMUs cleanup before
releasing the auxiliary devices.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index aef931d23510..3de41b3d1ae1 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2644,6 +2644,9 @@ static void ipu7_pci_remove(struct pci_dev *pdev)
 	if (!IS_ERR_OR_NULL(isp->fw_code_region))
 		vfree(isp->fw_code_region);
 
+	ipu7_mmu_cleanup(isp->isys->mmu);
+	ipu7_mmu_cleanup(isp->psys->mmu);
+
 	ipu7_bus_del_devices(pdev);
 
 	pm_runtime_forbid(&pdev->dev);
@@ -2653,8 +2656,6 @@ static void ipu7_pci_remove(struct pci_dev *pdev)
 
 	release_firmware(isp->cpd_fw);
 
-	ipu7_mmu_cleanup(isp->psys->mmu);
-	ipu7_mmu_cleanup(isp->isys->mmu);
 }
 
 static void ipu7_pci_reset_prepare(struct pci_dev *pdev)
-- 
2.34.1


