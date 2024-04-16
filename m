Return-Path: <linux-media+bounces-9603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1198A7540
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 22:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F29D1B225D0
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 20:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFB913A403;
	Tue, 16 Apr 2024 20:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nviiVi9R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F1913A24D
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 20:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298284; cv=none; b=qPvq0XrP9nmsZVbXC9uihC62i4CPmqa9YVbBmQUMtfUJ7QniuUzZKiyPE7ryQTnh3+Z3qooLioYp6LkR4OXGOR2UaLytA+JZiA44jMpFHqmzl0FEwtywie3JMktqotETaKb0T4fwOXP5vXhh/ZQyA4NLHrkxDg+IJR5MqIm30tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298284; c=relaxed/simple;
	bh=sObaXCu+MzG3lsVN+aus7qV3e7qFX/lAK++U72gJwM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ga4jFNc4aqGLn3f81KM5EMLSnawKJ2kf71wOBmFaXnjza4JQjBlVfIbOU4d0ba7Cbru/mtz1Ni/+0QT3koFzkH1F0D0xcmFUQJ4kUUpOLfbNwjMVBMxcYAuDFfWnMB9WHa7jSuTJRWLSFzqi52wfIgtLIxeuyZqyqjuCxqegkM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nviiVi9R; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713298284; x=1744834284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sObaXCu+MzG3lsVN+aus7qV3e7qFX/lAK++U72gJwM4=;
  b=nviiVi9RqJlaEftU7CkarbJJi1WMwzaOs7rmqFMauqqBbH/M3/kwIRdT
   mty+Ci8iPMEBx+ySw0KSFKPvNz7hSeAQadQ6PEct6rwl7qwWLtVYp/Ton
   DyZBLirU+4GpqNo+9yF960mTgJTTZe2LCxG7DmYPWYKas461OcNHpQhYA
   8ErlA77pzbcRvYsLoEhcpnH17PTaBKgLKblcNCgeeBt8HfG8ssVYh86Df
   VdarjI7nX8ilzMpuuTyDTR6Zs3Uv1qGZaiXpFy6pvuNQJd6rwpdE2w7zV
   xZ5bBja5Ew7l9RpY6inqBczyFuydzNc+oBrGXARrZGl1ptMMH3/AT2j26
   A==;
X-CSE-ConnectionGUID: B59lEOcgS8y3vx8dbke3aA==
X-CSE-MsgGUID: toTnkG0bRV2EYAAzMDRB7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8626649"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8626649"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:23 -0700
X-CSE-ConnectionGUID: xalG5pJ7RwyBM1D1j/hqYw==
X-CSE-MsgGUID: HGaz0VtCQ8GzERJnw/hZ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="27172289"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:19 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 816ED12056F;
	Tue, 16 Apr 2024 23:11:14 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v4 04/19] media: intel/ipu6: add IPU auxiliary devices
Date: Tue, 16 Apr 2024 23:10:50 +0300
Message-Id: <20240416201105.781496-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Even though the IPU input system and processing system are in a single PCI
device, each system has its own power sequence. Powering up the processing
system depends on first powering up the input system.

Besides, both the input and processing systems have their own MMU hardware
for IPU DMA address mapping.

Register the IS/PS devices on auxiliary bus and attach power domain to
implement the power sequence dependency.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.c | 165 ++++++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-bus.h |  58 +++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.c b/drivers/media/pci/intel/ipu6/ipu6-bus.c
new file mode 100644
index 000000000000..149ec098cdbf
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
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
index 000000000000..b26c6aee1621
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2024 Intel Corporation */
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
2.39.2


