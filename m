Return-Path: <linux-media+bounces-66501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ftqDbjUR2qyfwAAu9opvQ
	(envelope-from <linux-media+bounces-66501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C68703D77
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Pwq0KeIB;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66501-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66501-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 444B030358BB
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1C441734D;
	Fri,  3 Jul 2026 15:26:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A381E417350
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092394; cv=none; b=lXZMpty6oJYAJo37hXT6PEDbSrEK2kPeRe8mYoGcU1+0sEv72FVRMeP9ORvYKGip/XwnWN4x/vlrcm/ECeU/a0F/QtmYpjHeY6hfRItRx3QVzQQwEHwc53Vi8t0Q45nRZtYvHOZV6uv0DV58dw7ju2+cn/a+pWry4yeZa3/pQvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092394; c=relaxed/simple;
	bh=EEbL2fCuQXtE2hdGykud9WTIhz9uasuPm+uKx4SS5Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZi0ZOQEyI+oCGVpYPyFpSe9kSfI7bu1D2D+4/J3cFnNxqNucYYf0elphu6xFOygOGMMRiLB+1nYbJkVQRy0PCGZeh+NYs7s36h5XQInMu+apHEWo98noM86a53ORKxiN3Ljb5V3zXFwqwkAeoUJthuj35FGDYraCy1uLH4OWkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pwq0KeIB; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092393; x=1814628393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EEbL2fCuQXtE2hdGykud9WTIhz9uasuPm+uKx4SS5Wo=;
  b=Pwq0KeIBV3wg+tWrG5mJUwwz0HgakLbv7IcN5wS+C8HbKyb5cghKuoDz
   n8J4bpa1nv1NXUJPigcqle2edwpko8pY1AmWw/3LbcAEGiyQPLB+AqaOY
   9Xyk0lTHVDORMbN3T+xx3cAn7UqOj4lXCTTU04aontEjKAjSn9DsPerqU
   HlJkBZ+3qviis3WnMY9SBZ2UMq3Mn1dKPLPffsOG02sfP2TAQ2bYxKic9
   VmYeP2HGjzGXueE22XukKJLNrAUrcsINQd281+S2jtUR87q8ZRWPaJ/oP
   mzGSarvDtMk7KnWnp+nVREsZiJpxq4SRbvCEjgX8xlqF9V685NheWsV5c
   Q==;
X-CSE-ConnectionGUID: vAFhOOtkS0uTNk88FU6PNw==
X-CSE-MsgGUID: Xl/dRMUkRaOotX6iZtlZGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396263"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396263"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:32 -0700
X-CSE-ConnectionGUID: Jcy+64pwTsGmmliXtW4faA==
X-CSE-MsgGUID: EAJ23SXGSZazj1panDEwQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799837"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:31 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 35/41] media: ipu6: Make fw mapping function more generic
Date: Fri,  3 Jul 2026 18:24:45 +0300
Message-ID: <20260703152451.1743132-36-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66501-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2C68703D77

Make ipu6_map_fw_region more generic as for ipu7 we want to map other
buffers too, not only firmware. Also add DMA data direction and mapping
attributes as arguments as these are different for ipu7.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 40 ++++++++++----------
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 10 ++---
 drivers/media/pci/intel/ipu6/ipu6-isys.c     |  7 ++--
 drivers/media/pci/intel/ipu6/ipu6.c          |  8 ++--
 4 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 582b63d6a9be..ee6e52a96767 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -742,55 +742,55 @@ int ipu6_buttress_reset_authentication(struct ipu6_device *isp)
 	return 0;
 }
 
-int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
-			       const struct firmware *fw, struct sg_table *sgt)
+int ipu6_map_fw_region(struct ipu6_bus_device *sys, const void *data,
+		       size_t size, enum dma_data_direction dir,
+		       unsigned long attrs)
 {
-	bool is_vmalloc = is_vmalloc_addr(fw->data);
+	bool is_vmalloc = is_vmalloc_addr(data);
 	struct pci_dev *pdev = sys->isp->pdev;
+	struct sg_table *sgt = &sys->fw_sgt;
 	struct page **pages;
-	const void *addr;
 	unsigned long n_pages;
 	unsigned int i;
 	int ret;
 
-	if (!is_vmalloc && !virt_addr_valid(fw->data))
+	if (!is_vmalloc && !virt_addr_valid(data))
 		return -EDOM;
 
-	n_pages = PFN_UP(fw->size);
+	n_pages = PFN_UP(size);
 
 	pages = kmalloc_objs(*pages, n_pages);
 	if (!pages)
 		return -ENOMEM;
 
-	addr = fw->data;
 	for (i = 0; i < n_pages; i++) {
 		struct page *p = is_vmalloc ?
-			vmalloc_to_page(addr) : virt_to_page(addr);
+			vmalloc_to_page(data) : virt_to_page(data);
 
 		if (!p) {
 			ret = -ENOMEM;
 			goto out;
 		}
 		pages[i] = p;
-		addr += PAGE_SIZE;
+		data += PAGE_SIZE;
 	}
 
-	ret = sg_alloc_table_from_pages(sgt, pages, n_pages, 0, fw->size,
+	ret = sg_alloc_table_from_pages(sgt, pages, n_pages, 0, size,
 					GFP_KERNEL);
 	if (ret) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	ret = dma_map_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
+	ret = dma_map_sgtable(&pdev->dev, sgt, dir, 0);
 	if (ret) {
 		sg_free_table(sgt);
 		goto out;
 	}
 
-	ret = ipu6_dma_map_sgtable(sys, sgt, DMA_TO_DEVICE, 0);
+	ret = ipu6_dma_map_sgtable(sys, sgt, dir, attrs);
 	if (ret) {
-		dma_unmap_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
+		dma_unmap_sgtable(&pdev->dev, sgt, dir, 0);
 		sg_free_table(sgt);
 		goto out;
 	}
@@ -802,18 +802,18 @@ int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_buttress_map_fw_image, "INTEL_IPU6");
+EXPORT_SYMBOL_NS_GPL(ipu6_map_fw_region, "INTEL_IPU6");
 
-void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
-				  struct sg_table *sgt)
+void ipu6_unmap_fw_region(struct ipu6_bus_device *sys,
+			  enum dma_data_direction dir)
 {
 	struct pci_dev *pdev = sys->isp->pdev;
 
-	ipu6_dma_unmap_sgtable(sys, sgt, DMA_TO_DEVICE, 0);
-	dma_unmap_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
-	sg_free_table(sgt);
+	ipu6_dma_unmap_sgtable(sys, &sys->fw_sgt, dir, 0);
+	dma_unmap_sgtable(&pdev->dev, &sys->fw_sgt, dir, 0);
+	sg_free_table(&sys->fw_sgt);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_buttress_unmap_fw_image, "INTEL_IPU6");
+EXPORT_SYMBOL_NS_GPL(ipu6_unmap_fw_region, "INTEL_IPU6");
 
 int ipu6_buttress_authenticate(struct ipu6_device *isp)
 {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 419cf1380fc7..762c15036e0a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -86,11 +86,11 @@ struct ipu6_ipc_buttress_bulk_msg {
 
 int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			    struct ipu6_buttress_ipc *ipc);
-int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
-			       const struct firmware *fw,
-			       struct sg_table *sgt);
-void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
-				  struct sg_table *sgt);
+int ipu6_map_fw_region(struct ipu6_bus_device *sys, const void *data,
+		       size_t size, enum dma_data_direction dir,
+		       unsigned long attrs);
+void ipu6_unmap_fw_region(struct ipu6_bus_device *sys,
+			  enum dma_data_direction dir);
 int ipu6_buttress_power(struct device *dev,
 			const struct ipu6_buttress_ctrl *ctrl, bool on);
 bool ipu6_buttress_get_secure_mode(struct ipu6_device *isp);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index d374fdf80381..53a9500b8c26 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1046,7 +1046,8 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	if (!isp->secure_mode) {
 		fw = isp->cpd_fw;
-		ret = ipu6_buttress_map_fw_image(adev, fw, &adev->fw_sgt);
+		ret = ipu6_map_fw_region(adev, fw->data, fw->size,
+					 DMA_TO_DEVICE, 0);
 		if (ret)
 			goto release_firmware;
 
@@ -1086,7 +1087,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 		ipu6_cpd_free_pkg_dir(adev);
 remove_shared_buffer:
 	if (!isp->secure_mode)
-		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
+		ipu6_unmap_fw_region(adev, DMA_TO_DEVICE);
 release_firmware:
 	if (!isp->secure_mode)
 		release_firmware(adev->fw);
@@ -1116,7 +1117,7 @@ static void isys_remove(struct auxiliary_device *auxdev)
 
 	if (!isp->secure_mode) {
 		ipu6_cpd_free_pkg_dir(adev);
-		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
+		ipu6_unmap_fw_region(adev, DMA_TO_DEVICE);
 		release_firmware(adev->fw);
 	}
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 81664b777bef..67ca480e913d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -531,8 +531,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_rpm_put;
 	}
 
-	ret = ipu6_buttress_map_fw_image(isp->psys, isp->cpd_fw,
-					 &isp->psys->fw_sgt);
+	ret = ipu6_map_fw_region(isp->psys, isp->cpd_fw->data,
+				 isp->cpd_fw->size, DMA_TO_DEVICE, 0);
 	if (ret) {
 		dev_err_probe(&isp->pdev->dev, ret, "failed to map fw image\n");
 		goto out_ipu6_rpm_put;
@@ -585,7 +585,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 out_ipu6_bus_del_devices:
 	if (!IS_ERR_OR_NULL(isp->psys)) {
 		ipu6_cpd_free_pkg_dir(isp->psys);
-		ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
+		ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
 	}
 	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
 		ipu6_mmu_cleanup(isp->psys->mmu);
@@ -608,7 +608,7 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	ipu6_cpd_free_pkg_dir(isp->psys);
 
-	ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
+	ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
 	ipu6_buttress_exit(isp);
 
 	ipu6_bus_del_devices(pdev);
-- 
2.54.0


