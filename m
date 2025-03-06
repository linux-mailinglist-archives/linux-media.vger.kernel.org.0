Return-Path: <linux-media+bounces-27713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5152BA54B81
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A146174BE1
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1A9209F44;
	Thu,  6 Mar 2025 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdK49UnD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8748520B80B
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266411; cv=none; b=qajlf3vYiGTxa/XwNn2l4tvg/8XVdVmCrOE8i3vjRX6j1XS6skeliP7mroixy+NGiuORS8bq1h8NpOhWmg0XzEsVNTfY/UHZXqFmPSEeUk3kuHnK0cbuPMvg1N8u9fj4t46as+OvD1ZaTkOB7W7jfo3U8x7w6seH4fE4Hl4LV/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266411; c=relaxed/simple;
	bh=TDAzhX/Zy/+x4P7nc110+tBXSY0/imKcBkSgLG5hTIg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hNP3+TMqnDRrJ1plYNhh2ZimAWFQUTfss2q21lPiOkfMbG3kH8V3tcq/hbBlRbt0Ww7pNSwbihvE7laEzBl3W22IfVmkwD62JTj1qGYXuwB6d3O/WPoixTX7OxIruy62IpVcm/FjaZXRywcrwNdFWzcueqjbasG9gU8ZH6wzObc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdK49UnD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741266411; x=1772802411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TDAzhX/Zy/+x4P7nc110+tBXSY0/imKcBkSgLG5hTIg=;
  b=IdK49UnDwqPhV4jSyAev1m1rv4TjE8x6Y7SABwee8ZgYl4e+47q9YcJb
   2sS7SOETreDNLL/04sixMsVTJhYNB1e6ZUbm40bqDply00xaddCstJnU2
   AgwJzq8yzliVBkK2s7XyKAE9TTB+kTkHRStfMI1QKBr056nET+H90QjVd
   iCaJKb3FRkgqyHW5cIS3wAfq63H7G+F5vL3ef0njhXeJDQXUWFkTUwIaj
   jJxeX1kYaiR1oV+p2relcc1lh6vB2a9uvZeMBno7PJdBIhmHE1xLS0jU5
   IzUrbU+d7rb0gH+L6v0hYyGDof5qOdVlEuDcjF7J0+PwoUQApdZ1XTqj3
   g==;
X-CSE-ConnectionGUID: 66O35cSzS72Gh6qtJFNfHg==
X-CSE-MsgGUID: FwL7OPupTvWHn3Q+pkrNUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42131874"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42131874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:06:50 -0800
X-CSE-ConnectionGUID: xt1yM3NURpyf6IehdUvRfQ==
X-CSE-MsgGUID: JIj3q0W7SAGew4HcPe3bLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="142241230"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.21.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:06:49 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: [PATCH v1 3/3] media: intel/ipu6: Constify ipu6_buttress_ctrl structure
Date: Thu,  6 Mar 2025 14:06:29 +0100
Message-Id: <20250306130629.885163-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
References: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make ipu6_buttress_ctrl constant since it is not modified
any longer.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.c      | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h      | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 3 ++-
 4 files changed, 6 insertions(+), 5 deletions(-)

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
index 787fcbd1df09..f8fdc07a953c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -443,7 +443,7 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
 	return ret;
 }
 
-int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
+int ipu6_buttress_power(struct device *dev, const struct ipu6_buttress_ctrl *ctrl,
 			bool on)
 {
 	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 4b9763acdfdd..cb008964f870 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -65,7 +65,8 @@ int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
 			       struct sg_table *sgt);
 void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
 				  struct sg_table *sgt);
-int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
+int ipu6_buttress_power(struct device *dev,
+			const struct ipu6_buttress_ctrl *ctrl,
 			bool on);
 bool ipu6_buttress_get_secure_mode(struct ipu6_device *isp);
 int ipu6_buttress_authenticate(struct ipu6_device *isp);
-- 
2.34.1


