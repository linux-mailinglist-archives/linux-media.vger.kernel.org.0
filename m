Return-Path: <linux-media+bounces-49388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6080CD831F
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 636523002500
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 05:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67732F5479;
	Tue, 23 Dec 2025 05:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsP0kGfu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496DA2F5A32
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 05:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766468337; cv=none; b=Q+q5hbTNvjS9HUJ0bKMOxxO2pf1VQgQVBEeKqkiUogHZv+nDCXtTzIAOgd1ONgQ97StpbtuqhnNf9sri+dPkwmQr6+UQ9eD+kneY/qSx8Yy03Id3lfEjlwdwA7dgoaeMSHPpm7453qbX7gMwW6ePQ4iZXbnf4U/MSXSiaPBj6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766468337; c=relaxed/simple;
	bh=2xhFMwJNR9TRm071yTmB4kDsnZPxn0e8jQ3sOr/WCUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uIh41wylM8lzpe8DWjNrItDi0AvX10GFqfdkxUIRJ5YYZBXDGeXpOOMvqwlNC0UkWU2gEy1cTv0NpDWCpXOQnKTxfGK8L2rHsOzvl3hgC+drAZr22BLAq0GmiHken9NkPmUEgigLPSJJZR/09AbvB/JznGC+pwsmSinxfoT21oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsP0kGfu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766468334; x=1798004334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2xhFMwJNR9TRm071yTmB4kDsnZPxn0e8jQ3sOr/WCUU=;
  b=JsP0kGfutEdHvipwfabg0Fdetw+dnulqU+qDpbJbFN01S3ljUpkDRJRr
   U5fYiBf5CCo2JdAPYigeG2R54G0uTar72iiXwCE+RU5yEmvNsmGQF4Nra
   Ivz/2qh5QIxR67xtPgHMKqMAOIrOtTq5XrFTJDOlcpcUmzwQdB+q7WBaI
   hreUmA8w7AYajmqKLcQvbENwC7LWrfSuB4SfOLgtoGQrqK56DhfIKE9PL
   PQqDzc+moqxg/yFQq4eKWpJd30UQ573h9/3ljw9As4xufWZdMU7I/4Jma
   tVKqoH7kA90sNiU8s+LJRh/UuT8CWCsrfbKW4GOOhxVs9VhqV/yrx9vq1
   w==;
X-CSE-ConnectionGUID: t5j6ePpHT8WVUiPhEI7/Fg==
X-CSE-MsgGUID: j84WuRNlR2qnu9Aacbg5vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68255990"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68255990"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 21:38:54 -0800
X-CSE-ConnectionGUID: RmWGeSciQmW6IU6hFGJI4A==
X-CSE-MsgGUID: iUvzIKHgTpuHdyQ0dgATqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199366578"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 21:38:52 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 4/6] media: staging/ipu7: call synchronous RPM suspend in probe failure
Date: Tue, 23 Dec 2025 13:38:42 +0800
Message-Id: <20251223053844.3124621-5-bingbu.cao@intel.com>
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

If firmware authentication failed during driver probe, driver call an
asynchronous API to suspend the psys device but the bus device will be
removed soon, thus runtime PM of bus device will be disabled soon, that
will cancel the suspend request, so use synchronous suspend to make
sure the runtime suspend before disabling its RPM.

IPU7 hardware has constraints that the PSYS device must be powered off
before ISYS, otherwise it will cause machine check error.

Cc: Stable@vger.kernel.org
Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 6c8c3eea44ac..fa5a1867626f 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2620,7 +2620,7 @@ static int ipu7_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
 		ipu7_mmu_cleanup(isp->isys->mmu);
 	if (!IS_ERR_OR_NULL(isp->psys))
-		pm_runtime_put(&isp->psys->auxdev.dev);
+		pm_runtime_put_sync(&isp->psys->auxdev.dev);
 	ipu7_bus_del_devices(pdev);
 	release_firmware(isp->cpd_fw);
 buttress_exit:
-- 
2.34.1


