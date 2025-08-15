Return-Path: <linux-media+bounces-39975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D2BB27D0D
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 11:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B02CB079B5
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 09:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946B22609D0;
	Fri, 15 Aug 2025 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWzEP4yS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E7321C184
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755249643; cv=none; b=lkDkThl21O9ZT1J1Cvo3KUHN+qV5c5RVkBvD+C9k+sEH3YI0oMnxZPcWekcVwfrMGMaIs0V9b86XLx4ckCIRc5XUt1+XDyknRCrMPB2OA65h4+zRiUuHR5oMqMCHr8fOeu1FCaiiua47pJUzGXX1MvqBI2/v5c7oSau+8yY+tLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755249643; c=relaxed/simple;
	bh=JiDtrEiISFeLfPG914Up8bRk0k5NrPjCjfOmi64XlG4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y73PsYfKnGaDRa1D1CyGpAaLuYCf3AHqYSnlHMLbFV3CRDGhQRldW0ECpuA4sl2b1L3ZA0tyL1v0HIgUMP6IBHZkIJ94SqEMnHSNIf0LsXmNO5QhuEn0cUxE8keWq8L9jVhaThb49LBt/VmkZi9tq3mrNE6zbhQdQciVw4IBmXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWzEP4yS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755249641; x=1786785641;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JiDtrEiISFeLfPG914Up8bRk0k5NrPjCjfOmi64XlG4=;
  b=iWzEP4ySGUIDIqkWf3CG/6nuqUU/CZ6LH7hyw3HoEVnFE3YSmr+CIUNt
   wsIKNC+9qsJ6BU1pQi+juKj37G6pg5v8a3c7v6c2daI+4dSbRflaa1Ute
   fJdK5sMSOWuu+ibnBWkBz4/+yA8IcMcHZ4C3Eicni2pYvxp2V4EXGgX2B
   mFC6UCCy8A/Nzsp7Dcn1Av+sYLYm+YtdsD6j2luTpPorkFGfsbe98Ma3e
   72VFZ+qzqccETvsPhYv6GnOxokDjuK4T8BOMh4smJhQit4sWmK+p35dvA
   G9PL6EGTiV0pYDvucUnZJTHfG69FzOeJLGSk/WeBdDPvwOKdCWiJnaSYn
   w==;
X-CSE-ConnectionGUID: rND4gvPuT7+5fnBgRULyRQ==
X-CSE-MsgGUID: sccdrNmfRO+XaEOzIiJKcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61378976"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61378976"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:20:40 -0700
X-CSE-ConnectionGUID: 52vDw01XTZKPgdjjs/ebcA==
X-CSE-MsgGUID: 1inwOxUKSwGBuqQe7Zk6mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171222543"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa003.jf.intel.com with ESMTP; 15 Aug 2025 02:20:38 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: tomi.valkeinen@ideasonboard.com,
	hans@jjverkuil.nl,
	jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 1/3] media: staging/ipu7: convert to use pci_alloc_irq_vectors() API
Date: Fri, 15 Aug 2025 17:20:35 +0800
Message-Id: <20250815092037.1825769-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

pci_enable_msi() is a deprecated API, thus switch to use modern
pci_alloc_irq_vectors().

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 1b4f01db13ca..a8e8b0e23198 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2248,20 +2248,13 @@ void ipu7_dump_fw_error_log(const struct ipu7_bus_device *adev)
 }
 EXPORT_SYMBOL_NS_GPL(ipu7_dump_fw_error_log, "INTEL_IPU7");
 
-static int ipu7_pci_config_setup(struct pci_dev *dev)
+static void ipu7_pci_config_setup(struct pci_dev *dev)
 {
 	u16 pci_command;
-	int ret;
 
 	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
 	pci_command |= PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
 	pci_write_config_word(dev, PCI_COMMAND, pci_command);
-
-	ret = pci_enable_msi(dev);
-	if (ret)
-		dev_err(&dev->dev, "Failed to enable msi (%d)\n", ret);
-
-	return ret;
 }
 
 static int ipu7_map_fw_code_region(struct ipu7_bus_device *sys,
@@ -2510,13 +2503,15 @@ static int ipu7_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	ret = ipu7_pci_config_setup(pdev);
-	if (ret)
-		return ret;
+	ipu7_pci_config_setup(pdev);
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to alloc irq vector\n");
 
 	ret = ipu_buttress_init(isp);
 	if (ret)
-		return ret;
+		goto pci_irq_free;
 
 	dev_info(dev, "firmware cpd file: %s\n", isp->cpd_fw_name);
 
@@ -2632,6 +2627,8 @@ static int ipu7_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	release_firmware(isp->cpd_fw);
 buttress_exit:
 	ipu_buttress_exit(isp);
+pci_irq_free:
+	pci_free_irq_vectors(pdev);
 
 	return ret;
 }
-- 
2.34.1


