Return-Path: <linux-media+bounces-49398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B42E1CD85EF
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 08:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD0C63022A9A
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D96309F00;
	Tue, 23 Dec 2025 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHNV+aZB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CCA3090EB
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766474594; cv=none; b=QHyd4K9zhyjL5jJVizH2UgHXCAI1t+nhI6iBryKxY/65ev6RJm0IhI4e9jqGe7N2YFhLL3PQ4WFmkYKUTHYu/kfZid50fSAGTrTuDQmkbLEOVM7MJbbuRQMMu1ktMgMDLAOS4DDyBqf7fV1mgsdai86l8ZNCKEmGkPC9227+rsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766474594; c=relaxed/simple;
	bh=JRyZ7RH0Eb5ZxySYuXCSrO56rJzj8yNY/JxvjHZ6UZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fl0vRFuQ7TBWbdPFgcAp51IsC1+HOC55T5NTPAp0+uhmxY4kN4LrYo6Tn/xS8dbyvmO/e6jVzeWZUJ7R9wrCygLdR8AlbpOqSa8Adw+DZEkGRSMn3Gkjczs93xNZo+Pjdzm8TbDXm/OgI/fRBQOUym7ciy0kdI0NF85Em7osYzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHNV+aZB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766474593; x=1798010593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JRyZ7RH0Eb5ZxySYuXCSrO56rJzj8yNY/JxvjHZ6UZ4=;
  b=dHNV+aZBBnx49w1AqjqzuaKpnS7MbVxQs1ky74qL25TXr83JOIjAJ702
   NuHyiawG2JFSWwHif4JpSjADhHCoLk4dBT3Wvrw97CQKNmYbYBhgOAYJ+
   5OLD9izuy0DDcj3vmWDFfDxfWHp6jROCPlpbjb4oxZI+DPYMWFs3vBRMz
   cG1HLkiqVQHbK0MTkuX9zSRlV14UKJVywR7/vtlH/ckZcVkiUAQ/OD01D
   9ZYRoh+SA8KeyLQgvDAevcgTR6OQnD2xNblmEtaWJ3KIx6buD1Kntravg
   +uc0vb1rbb0its9JkfTmPVCrZ8cBcgHbPMTmatMRqBagJ/xiIRMUzYGBP
   g==;
X-CSE-ConnectionGUID: GAkNuVB1Squ/tQuApxaPQQ==
X-CSE-MsgGUID: d2Vsn7ZtQzOVMOM86VqaKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79043744"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79043744"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:23:10 -0800
X-CSE-ConnectionGUID: uBXbn5/FTdupiP1GYqKl/w==
X-CSE-MsgGUID: pohObvFtQay9ktc735t7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199747427"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 23:23:07 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 2/6] media: ipu6: fix RPM reference leak in probe error paths
Date: Tue, 23 Dec 2025 15:22:59 +0800
Message-Id: <20251223072303.4078094-3-bingbu.cao@intel.com>
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


