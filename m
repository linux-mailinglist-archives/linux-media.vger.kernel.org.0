Return-Path: <linux-media+bounces-28125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FB4A5F070
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4405D19C0AE8
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358F2265600;
	Thu, 13 Mar 2025 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xixkgq0c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A74264F86
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861082; cv=none; b=IAVSSOke5RuZ8/8EZ+HNFX+0G4epGb8QiHBCKxEvyVJK9UWd3ZTE5Omru8reptWTLSNOgibe1JVDmbylPqGFqOyXY9Owqguf9ZQbhEG9Bkgv7w7B5kG4ZYb5rIVAZQUkalvb4BAXjXM2MeIzLRlEIbcA3gthqXhzrf2p1lUqEyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861082; c=relaxed/simple;
	bh=AxL6DPhFsh4HbSOCV6i8kruFeQznEnHw9qZalgjMWts=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NBo3k8nTvmilzeHG5X/LdnPjjrE1IxM3GTuRFIxiu0XHeruoV0dYIOnQ2PX2q8O8d0HDhYr1lbWoX5Hlw17MLy4TV3DgL/NBN/tk7lRaLT5M2rUg5o5EdnNa8CrsCxJ7GpcARwMcno5HczswyqeA2xGmW8ln/PhhmAr2PkcsO04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xixkgq0c; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741861082; x=1773397082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AxL6DPhFsh4HbSOCV6i8kruFeQznEnHw9qZalgjMWts=;
  b=Xixkgq0cwb6DTKQiQ5nq5IvTKRnUFzhoiyCijXBchVWLqFojT1f9l9EZ
   xYOYRCZto99Xpx7WyN7ehKWX614iGdoUgwTYktohmZYHDxefujaukFG1P
   /mRrkHBBgA4ieTvE4Z11mwfJs7pyG4qy9Vtk2xNbQZoduKRzYZbzdHd4X
   Whm92rxd1XdB5+cgPdG/+Ly0x8V7zGliDn2Xmk/rbjGXS0V6CAYenRkf7
   kf/UtfuktdxzltgbGB4R7hzuHZ3s1cUJK2AVcHDxtOFImpdw7b8xe/NW7
   JtgcsM/sIvawWPkd0/mTp+WWYrM/5vFoOucyWg5ObhEfPiMbgmwuWAumm
   A==;
X-CSE-ConnectionGUID: ZNPgG7ObR3WfRjYUqysakw==
X-CSE-MsgGUID: 7ush/AP/SjqRqNThq62+og==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42700014"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="42700014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:18:01 -0700
X-CSE-ConnectionGUID: CgTiMC8CQF2nqIF80ohwrQ==
X-CSE-MsgGUID: 9M55EjpMTcORRAnlO3S2Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="158070753"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:17:59 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 3/3] media: intel/ipu6: Constify ipu6_buttress_ctrl structure
Date: Thu, 13 Mar 2025 11:17:44 +0100
Message-Id: <20250313101744.128564-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313101744.128564-1-stanislaw.gruszka@linux.intel.com>
References: <20250313101744.128564-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make ipu6_buttress_ctrl constant since it is not modified any longer.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.c      | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h      | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.c b/drivers/media/pci/intel/ipu6/ipu6-bus.c
index 37d88ddb6ee7..5cee2748983b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-bus.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.c
@@ -82,7 +82,7 @@ static void ipu6_bus_release(struct device *dev)
 
 struct ipu6_bus_device *
 ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
-			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
+			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,
 			   char *name)
 {
 	struct auxiliary_device *auxdev;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/intel/ipu6/ipu6-bus.h
index ebf470806a74..b790f9cc37e3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-bus.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
@@ -25,7 +25,7 @@ struct ipu6_bus_device {
 	void *pdata;
 	struct ipu6_mmu *mmu;
 	struct ipu6_device *isp;
-	struct ipu6_buttress_ctrl *ctrl;
+	const struct ipu6_buttress_ctrl *ctrl;
 	u64 dma_mask;
 	const struct firmware *fw;
 	struct sg_table fw_sgt;
@@ -48,7 +48,7 @@ struct ipu6_auxdrv_data {
 
 struct ipu6_bus_device *
 ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
-			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
+			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,
 			   char *name);
 int ipu6_bus_add_device(struct ipu6_bus_device *adev);
 void ipu6_bus_del_devices(struct pci_dev *pdev);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 787fcbd1df09..103386c4f6ae 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -443,8 +443,8 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
 	return ret;
 }
 
-int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
-			bool on)
+int ipu6_buttress_power(struct device *dev,
+			const struct ipu6_buttress_ctrl *ctrl, bool on)
 {
 	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
 	u32 pwr_sts, val;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 4b9763acdfdd..51e5ad48db82 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -65,8 +65,8 @@ int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
 			       struct sg_table *sgt);
 void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
 				  struct sg_table *sgt);
-int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
-			bool on);
+int ipu6_buttress_power(struct device *dev,
+			const struct ipu6_buttress_ctrl *ctrl, bool on);
 bool ipu6_buttress_get_secure_mode(struct ipu6_device *isp);
 int ipu6_buttress_authenticate(struct ipu6_device *isp);
 int ipu6_buttress_reset_authentication(struct ipu6_device *isp);
-- 
2.34.1


