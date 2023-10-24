Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF7CE7D4EB3
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjJXLUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjJXLUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:20:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E82E109
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698146416; x=1729682416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ge3oYny9s8+NqTCETKetopgx0iAqMSYemYu+CHW5Q5s=;
  b=fdVq5PYQM8z6orTI5jpzS977Jej6Ho9lY350Py8r18qJ8+87hPYxwXO+
   CDbh29rk4ERJr32rTkEWfY3WuNnATSFX+gUndE03HQTbT5SKEcBg4Vj1c
   SgqWHwJOlHOf91CkxLT0lGHqeTSqifcZPORec01m6WZPvwxO5p6mA/ueU
   UbXoiwY3mLGocrOmhPYTpS53PJNwJyzn0r+UhVhdsKdRnU2VFjuKjhON3
   g6OGKCNOvBwLA1HxNuyb5sTNoqCQ08hHQ969vqNSpEc2Y/Uyo2yVSDOOy
   TNEBc9KqByZfId/se9H3X2Zl6kEJBYz8OUcFd4JfDJqKLrXWtTVOAUlUi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="473258681"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="473258681"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 04:20:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="762069838"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="762069838"
Received: from icg-kernel3.bj.intel.com ([172.16.126.174])
  by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2023 04:20:11 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: [PATCH v2 02/15] media: intel/ipu6: add IPU auxiliary devices
Date:   Tue, 24 Oct 2023 19:29:11 +0800
Message-ID: <20231024112924.3934228-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024112924.3934228-1-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
 drivers/media/pci/intel/ipu6/ipu6-bus.c | 157 ++++++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-bus.h |  50 ++++++++
 drivers/media/pci/intel/ipu6/ipu6.c     |   5 +-
 3 files changed, 211 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.c b/drivers/media/pci/intel/ipu6/ipu6-bus.c
new file mode 100644
index 000000000000..eabeda5ee4c9
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2023 Intel Corporation
+ */
+
+#include <linux/pci.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
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
index 000000000000..fa8bd73c3976
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_BUS_H
+#define IPU6_BUS_H
+
+#include <linux/auxiliary_bus.h>
+#include <linux/pci.h>
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
+#define to_ipu6_bus_device(_dev) container_of(to_auxiliary_dev(_dev), \
+					      struct ipu6_bus_device, auxdev)
+#define auxdev_to_adev(_auxdev) container_of(_auxdev, \
+					     struct ipu6_bus_device, auxdev)
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
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 84960a283daf..b652662fa72e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -666,7 +666,10 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to set DMA mask\n");
 
-	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+	ret = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to set max_seg_size\n");
 
 	ret = ipu6_pci_config_setup(pdev, isp->hw_ver);
 	if (ret)
-- 
2.42.0

