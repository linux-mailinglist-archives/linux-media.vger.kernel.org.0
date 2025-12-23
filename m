Return-Path: <linux-media+bounces-49386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7178ACD831C
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFB1B30022CF
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 05:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5D22F5319;
	Tue, 23 Dec 2025 05:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVjzNsIx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDDF2F5479
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 05:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766468333; cv=none; b=QXBIVzVM/c0Z5ACE+zlJL69rQwqPsJfxv751QXxTDFAuc1Tz+VIXGzD/2wuzqvxhZimPBuUoVGlGCpJh3u3e71tBOcTAxrbLm9OvCea0g3NjML7cNaJAEn5yHG8UndPd3HGDeZCXSIbVai967ptSGAila5TUjwOGsIHPmPBc4PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766468333; c=relaxed/simple;
	bh=JRyZ7RH0Eb5ZxySYuXCSrO56rJzj8yNY/JxvjHZ6UZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fWxIH5mTFQXRvb/mv+DBhtQUIMvH/W4p3n3KywBfBgMzq+yjOpzhIYfFiQNVdv1RLdkt0CjDRKZffjtfHDeuRC39qGjUtckFOxdcErW1v/NxfnaE7jw4QyjIr1gaNYbTuQ608z1iRb/pFejpm96hFkI35FlOwgJwM8WIbnNmHS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVjzNsIx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766468331; x=1798004331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JRyZ7RH0Eb5ZxySYuXCSrO56rJzj8yNY/JxvjHZ6UZ4=;
  b=XVjzNsIx7sWTVeo1AwXnuLSop1DPqzeaFcwNjTLHXcTmbvrj0H9AENfe
   iNxLvvSTElTmp9ZFNvCT2xBGvo/Us7NtaGZBqLLuYAeI1c1ft1wUnMS2Y
   x9UQ7F2o0YuizhRzGlfE2XSAJINqPLj75bwQ6OuKrpDu2j4wMwddLUXm1
   GeTUPvkh2vQ4a8DtJl5QHeneDLhKWb758DJd4AcsPL1g9WBzf2uxFiTts
   ObklXnRFC2qjU7JkZgU9sjZCj1K1aPFZUHdbhjizkt5FvV4G8Oye0SeGR
   F/pA8Dv87eBqzimimlSK69lYH1ga+pMQ/2vCqkz8ZIfdBe6mVPbSbtfdH
   g==;
X-CSE-ConnectionGUID: JpTkNjFFQV6l57bYIFVy9Q==
X-CSE-MsgGUID: hGMqHbT/RhG8sqJD8eYJdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68255981"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68255981"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 21:38:51 -0800
X-CSE-ConnectionGUID: anVKq5C1T1SmEH3EASkdfQ==
X-CSE-MsgGUID: QVjVkC7zTFGTp7aVHA3sKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199366571"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 21:38:48 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 2/6] media: ipu6: fix RPM reference leak in probe error paths
Date: Tue, 23 Dec 2025 13:38:40 +0800
Message-Id: <20251223053844.3124621-3-bingbu.cao@intel.com>
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

Several error paths in ipu6_pci_probe() were jumping directly to
out_ipu6_bus_del_devices without releasing the runtime PM reference.
Add pm_runtime_put_sync() before cleaning up other resources.

Cc: Stable@vger.kernel.org
Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 1f4f20b9c94d..a2768f44017a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -630,21 +630,21 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret) {
 		dev_err_probe(&isp->pdev->dev, ret,
 			      "Failed to set MMU hardware\n");
-		goto out_ipu6_bus_del_devices;
+		goto out_ipu6_rpm_put;
 	}
 
 	ret = ipu6_buttress_map_fw_image(isp->psys, isp->cpd_fw,
 					 &isp->psys->fw_sgt);
 	if (ret) {
 		dev_err_probe(&isp->pdev->dev, ret, "failed to map fw image\n");
-		goto out_ipu6_bus_del_devices;
+		goto out_ipu6_rpm_put;
 	}
 
 	ret = ipu6_cpd_create_pkg_dir(isp->psys, isp->cpd_fw->data);
 	if (ret) {
 		dev_err_probe(&isp->pdev->dev, ret,
 			      "failed to create pkg dir\n");
-		goto out_ipu6_bus_del_devices;
+		goto out_ipu6_rpm_put;
 	}
 
 	ret = devm_request_threaded_irq(dev, pdev->irq, ipu6_buttress_isr,
@@ -652,7 +652,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 					IRQF_SHARED, IPU6_NAME, isp);
 	if (ret) {
 		dev_err_probe(dev, ret, "Requesting irq failed\n");
-		goto out_ipu6_bus_del_devices;
+		goto out_ipu6_rpm_put;
 	}
 
 	ret = ipu6_buttress_authenticate(isp);
@@ -683,6 +683,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 out_free_irq:
 	devm_free_irq(dev, pdev->irq, isp);
+out_ipu6_rpm_put:
+	pm_runtime_put_sync(&isp->psys->auxdev.dev);
 out_ipu6_bus_del_devices:
 	if (isp->psys) {
 		ipu6_cpd_free_pkg_dir(isp->psys);
-- 
2.34.1


