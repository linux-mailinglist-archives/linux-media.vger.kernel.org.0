Return-Path: <linux-media+bounces-3496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B682A7C9
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 07:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B748BB213A8
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 06:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E3D468E;
	Thu, 11 Jan 2024 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/9ZjUwP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAA12583
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704955567; x=1736491567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+W7/h1ucUndaB9aUAWkhih3PVFXjOOT1oQYdYNTx2+s=;
  b=n/9ZjUwPwCc404h6/21XvdNmTyn6tMDMcN/GUP0fAoKW8Uuc9/uHC+0r
   LkG8tmyU+QdkywNIbjpeCIMEIwf23SPPtNNqW6KxwkxoZ/gZJu2DdJc1X
   n7HDIMLjjsDt9BfUnHPTyOnNfe/VLPtDP//w+7+/o4lvsE8D3IfjPjNNe
   sVRgGOA4o1CZQ3eF88Sxf/k1A4xpuooz67cX0sGcRnzSsQXNuTYa78wp8
   CyzkfDyqRX4faBHjaWEum7wRLQ27eICN4Mts8USwPE75BMiI0zBxmArra
   GSURp6ibqLQA+wFU4OfMQrNMLoxLE5xMjqrIjqCpY7x+4wpL8Phw81uUu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397629034"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="397629034"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 22:46:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775515481"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="775515481"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by orsmga007.jf.intel.com with ESMTP; 10 Jan 2024 22:46:02 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v3 02/17] media: intel/ipu6: add IPU auxiliary devices
Date: Thu, 11 Jan 2024 14:55:16 +0800
Message-ID: <20240111065531.2418836-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240111065531.2418836-1-bingbu.cao@intel.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Even the IPU input system and processing system are in a single PCI
device, each system has its own power sequence, the processing system
power up depends on the input system power up.

Besides, input system and processing system have their own MMU
hardware for IPU DMA address mapping.

Register the IS/PS devices on auxiliary bus and attach power domain
to implement the power sequence dependency.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.c | 165 ++++++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-bus.h |  58 +++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.c b/drivers/media/pci/intel/ipu6/ipu6-bus.c
new file mode 100644
index 000000000000..e81b9a6518a1
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2023 Intel Corporation
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-buttress.h"
+#include "ipu6-dma.h"
+
+static int bus_pm_runtime_suspend(struct device *dev)
+{
+	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
+	int ret;
+
+	ret = pm_generic_runtime_suspend(dev);
+	if (ret)
+		return ret;
+
+	ret = ipu6_buttress_power(dev, adev->ctrl, false);
+	if (!ret)
+		return 0;
+
+	dev_err(dev, "power down failed!\n");
+
+	/* Powering down failed, attempt to resume device now */
+	ret = pm_generic_runtime_resume(dev);
+	if (!ret)
+		return -EBUSY;
+
+	return -EIO;
+}
+
+static int bus_pm_runtime_resume(struct device *dev)
+{
+	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
+	int ret;
+
+	ret = ipu6_buttress_power(dev, adev->ctrl, true);
+	if (ret)
+		return ret;
+
+	ret = pm_generic_runtime_resume(dev);
+	if (ret)
+		goto out_err;
+
+	return 0;
+
+out_err:
+	ipu6_buttress_power(dev, adev->ctrl, false);
+
+	return -EBUSY;
+}
+
+static struct dev_pm_domain ipu6_bus_pm_domain = {
+	.ops = {
+		.runtime_suspend = bus_pm_runtime_suspend,
+		.runtime_resume = bus_pm_runtime_resume,
+	},
+};
+
+static DEFINE_MUTEX(ipu6_bus_mutex);
+
+static void ipu6_bus_release(struct device *dev)
+{
+	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
+
+	kfree(adev->pdata);
+	kfree(adev);
+}
+
+struct ipu6_bus_device *
+ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
+			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
+			   char *name)
+{
+	struct auxiliary_device *auxdev;
+	struct ipu6_bus_device *adev;
+	struct ipu6_device *isp = pci_get_drvdata(pdev);
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return ERR_PTR(-ENOMEM);
+
+	adev->dma_mask = DMA_BIT_MASK(isp->secure_mode ? IPU6_MMU_ADDR_BITS :
+				      IPU6_MMU_ADDR_BITS_NON_SECURE);
+	adev->isp = isp;
+	adev->ctrl = ctrl;
+	adev->pdata = pdata;
+	auxdev = &adev->auxdev;
+	auxdev->name = name;
+	auxdev->id = (pci_domain_nr(pdev->bus) << 16) |
+		      PCI_DEVID(pdev->bus->number, pdev->devfn);
+
+	auxdev->dev.parent = parent;
+	auxdev->dev.release = ipu6_bus_release;
+	auxdev->dev.dma_ops = &ipu6_dma_ops;
+	auxdev->dev.dma_mask = &adev->dma_mask;
+	auxdev->dev.dma_parms = pdev->dev.dma_parms;
+	auxdev->dev.coherent_dma_mask = adev->dma_mask;
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret < 0) {
+		dev_err(&isp->pdev->dev, "auxiliary device init failed (%d)\n",
+			ret);
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	dev_pm_domain_set(&auxdev->dev, &ipu6_bus_pm_domain);
+
+	pm_runtime_forbid(&adev->auxdev.dev);
+	pm_runtime_enable(&adev->auxdev.dev);
+
+	return adev;
+}
+
+int ipu6_bus_add_device(struct ipu6_bus_device *adev)
+{
+	struct auxiliary_device *auxdev = &adev->auxdev;
+	int ret;
+
+	ret = auxiliary_device_add(auxdev);
+	if (ret) {
+		auxiliary_device_uninit(auxdev);
+		return ret;
+	}
+
+	mutex_lock(&ipu6_bus_mutex);
+	list_add(&adev->list, &adev->isp->devices);
+	mutex_unlock(&ipu6_bus_mutex);
+
+	pm_runtime_allow(&auxdev->dev);
+
+	return 0;
+}
+
+void ipu6_bus_del_devices(struct pci_dev *pdev)
+{
+	struct ipu6_device *isp = pci_get_drvdata(pdev);
+	struct ipu6_bus_device *adev, *save;
+
+	mutex_lock(&ipu6_bus_mutex);
+
+	list_for_each_entry_safe(adev, save, &isp->devices, list) {
+		pm_runtime_disable(&adev->auxdev.dev);
+		list_del(&adev->list);
+		auxiliary_device_delete(&adev->auxdev);
+		auxiliary_device_uninit(&adev->auxdev);
+	}
+
+	mutex_unlock(&ipu6_bus_mutex);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/intel/ipu6/ipu6-bus.h
new file mode 100644
index 000000000000..d46181354836
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_BUS_H
+#define IPU6_BUS_H
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/irqreturn.h>
+#include <linux/list.h>
+#include <linux/scatterlist.h>
+#include <linux/types.h>
+
+struct firmware;
+struct pci_dev;
+
+#define IPU6_BUS_NAME	IPU6_NAME "-bus"
+
+struct ipu6_buttress_ctrl;
+
+struct ipu6_bus_device {
+	struct auxiliary_device auxdev;
+	struct auxiliary_driver *auxdrv;
+	const struct ipu6_auxdrv_data *auxdrv_data;
+	struct list_head list;
+	void *pdata;
+	struct ipu6_mmu *mmu;
+	struct ipu6_device *isp;
+	struct ipu6_buttress_ctrl *ctrl;
+	u64 dma_mask;
+	const struct firmware *fw;
+	struct sg_table fw_sgt;
+	u64 *pkg_dir;
+	dma_addr_t pkg_dir_dma_addr;
+	unsigned int pkg_dir_size;
+};
+
+struct ipu6_auxdrv_data {
+	irqreturn_t (*isr)(struct ipu6_bus_device *adev);
+	irqreturn_t (*isr_threaded)(struct ipu6_bus_device *adev);
+	bool wake_isr_thread;
+};
+
+#define to_ipu6_bus_device(_dev) \
+	container_of(to_auxiliary_dev(_dev), struct ipu6_bus_device, auxdev)
+#define auxdev_to_adev(_auxdev) \
+	container_of(_auxdev, struct ipu6_bus_device, auxdev)
+#define ipu6_bus_get_drvdata(adev) dev_get_drvdata(&(adev)->auxdev.dev)
+
+struct ipu6_bus_device *
+ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
+			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
+			   char *name);
+int ipu6_bus_add_device(struct ipu6_bus_device *adev);
+void ipu6_bus_del_devices(struct pci_dev *pdev);
+
+#endif
-- 
2.42.0


