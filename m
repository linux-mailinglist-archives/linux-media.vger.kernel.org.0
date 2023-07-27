Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339E37647F6
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 09:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbjG0HKR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 03:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbjG0HJT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 03:09:19 -0400
Received: from mgamail.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48134C19
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 00:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690441509; x=1721977509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wTXY9ruKgzG7qugcYRCCOb3MaWw+vCjmV8y6859KYwA=;
  b=iJbgzAixUx6nr6vt5hk7/w3O5rUPzO4G+c9j6OFdGeMjFBYGAZr1ZSd0
   XULwiZrPk//dD+xoJE5fJiWZFv9HumTVJ3oIn2aLvqlZO/qzPCTfbNtYb
   M1YB70fijj6E0AnDaaqP8NEM8Kg7ePXp5UdbViqNebn8XzCRILQ5/JAxX
   U7RiEACwIRRsKKf+80Eh8XntdWlGM5RU5hBOaCTtPskypp9tqhSwWct3T
   BsYzKrHd3JOEzqLL5IW3gWVNGCi9SAbPJCTEe9pQOA4H3+3/bA1EBjfyf
   s/COT9FcPMZ+pr5r23kz5QLgH7fbSlJRHZsMs6zzM7/Ccb6eEvHgvVEXd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370900720"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="370900720"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="704072541"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="704072541"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 00:03:56 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: [PATCH 02/15] media: intel/ipu6: add IPU auxiliary devices
Date:   Thu, 27 Jul 2023 15:15:45 +0800
Message-Id: <20230727071558.1148653-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230727071558.1148653-1-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/media/pci/intel/ipu6/ipu6-bus.c | 164 ++++++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-bus.h |  58 +++++++++
 2 files changed, 222 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.c b/drivers/media/pci/intel/ipu6/ipu6-bus.c
new file mode 100644
index 000000000000..0e58accf0654
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2013 - 2023 Intel Corporation
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-buttress.h"
+#include "ipu6-dma.h"
+#include "ipu6-platform.h"
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
+	dev_dbg(dev, "buttress power down %d\n", ret);
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
+	dev_dbg(dev, "buttress power up %d\n", ret);
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
+	}
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
+	dev_pm_domain_set(&auxdev->dev, &ipu6_bus_pm_domain);
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret < 0) {
+		dev_err(&isp->pdev->dev, "auxiliary device init failed (%d)\n",
+			ret);
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
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
index 000000000000..d1cd013f0e6b
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
+#include <linux/device.h>
+#include <linux/irqreturn.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/pci.h>
+
+#define IPU6_BUS_NAME	IPU6_NAME "-bus"
+
+struct ipu6_buttress_ctrl;
+struct ipu6_subsystem_trace_config;
+
+struct ipu6_auxdrv_data {
+	irqreturn_t (*isr)(struct ipu6_bus_device *adev);
+	irqreturn_t (*isr_threaded)(struct ipu6_bus_device *adev);
+	bool wake_isr_thread;
+};
+
+struct ipu6_bus_device {
+	struct auxiliary_device auxdev;
+	struct auxiliary_driver *auxdrv;
+	const struct ipu6_auxdrv_data *auxdrv_data;
+	struct list_head list;
+	void *pdata;
+	struct ipu6_mmu *mmu;
+	struct ipu6_device *isp;
+	struct ipu6_subsystem_trace_config *trace_cfg;
+	struct ipu6_buttress_ctrl *ctrl;
+	u64 dma_mask;
+
+	const struct firmware *fw;
+	struct sg_table fw_sgt;
+	u64 *pkg_dir;
+	dma_addr_t pkg_dir_dma_addr;
+	unsigned int pkg_dir_size;
+};
+
+#define to_ipu6_bus_device(_dev) container_of(to_auxiliary_dev(_dev), \
+					      struct ipu6_bus_device, auxdev)
+#define auxdev_to_adev(_auxdev) container_of(_auxdev,			\
+					     struct ipu6_bus_device, auxdev)
+#define to_ipu6_bus_driver(_drv) container_of(_drv, struct ipu6_bus_driver, drv)
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
2.40.1

