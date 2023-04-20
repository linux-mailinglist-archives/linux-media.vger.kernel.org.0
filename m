Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93666E987E
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 17:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjDTPj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 11:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjDTPj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 11:39:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202B1618C
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 08:39:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EEB19DE;
        Thu, 20 Apr 2023 17:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682005167;
        bh=YrbVPphxsqcgvUENP8xydTpYean7tp34tvRRrmVKT6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gveTNtaJ33H3ExJnWicMb4yZq05Jsx416qLOfxbf9mMnrryUFZBLkwDYuOATbtsW6
         arrEClWBzUJPJ2LBzkGqCGe16vkHM55ne3Dro7Ikz+YXxERKPbGVXI1tNV6XIc1GoJ
         4n0KUAte8yio0AB8gtviK3IYTzUCIf7mYKA5/i6U=
Date:   Thu, 20 Apr 2023 18:39:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, daniel.h.kang@intel.com
Subject: Re: [RFC PATCH 02/14] media: intel/ipu6: add IPU virtual bus driver
Message-ID: <20230420153947.GE17497@pendragon.ideasonboard.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
 <20230413100429.919622-3-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230413100429.919622-3-bingbu.cao@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

Thank you for the patch.

On Thu, Apr 13, 2023 at 06:04:17PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Even the IPU input system and processing system are a single PCI
> device, each system has its own power sequence, the processing system
> power up depends on the input system power up.
> 
> Besides, input system and processing system have their own MMU
> hardware for IPU DMA address mapping.
> 
> Define a virtual bus to help us to implement the power sequence
> dependency and DMA mapping requirement on specific device.

Have you considered using the aux bus instead of creating a custom bus
type (see [1]) ?

[1] https://lore.kernel.org/lkml/Y862WTT03%2FJxXUG8@kroah.com/

> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-bus.c | 263 ++++++++++++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-bus.h |  68 ++++++
>  2 files changed, 331 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.c b/drivers/media/pci/intel/ipu6/ipu6-bus.c
> new file mode 100644
> index 000000000000..9a758d7ae73c
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6-bus.c
> @@ -0,0 +1,263 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (C) 2013 - 2023 Intel Corporation
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "ipu6.h"
> +#include "ipu6-bus.h"
> +#include "ipu6-buttress.h"
> +#include "ipu6-dma.h"
> +#include "ipu6-platform.h"
> +
> +static struct bus_type ipu6_bus;
> +
> +static int bus_pm_runtime_suspend(struct device *dev)
> +{
> +	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
> +	int ret;
> +
> +	ret = pm_generic_runtime_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = ipu6_buttress_power(dev, adev->ctrl, false);
> +	dev_dbg(dev, "buttress power down %d\n", ret);
> +	if (!ret)
> +		return 0;
> +
> +	dev_err(dev, "power down failed!\n");
> +
> +	/* Powering down failed, attempt to resume device now */
> +	ret = pm_generic_runtime_resume(dev);
> +	if (!ret)
> +		return -EBUSY;
> +
> +	return -EIO;
> +}
> +
> +static int bus_pm_runtime_resume(struct device *dev)
> +{
> +	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
> +	int ret;
> +
> +	ret = ipu6_buttress_power(dev, adev->ctrl, true);
> +	dev_dbg(dev, "buttress power up %d\n", ret);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_generic_runtime_resume(dev);
> +	if (ret)
> +		goto out_err;
> +
> +	return 0;
> +
> +out_err:
> +	ipu6_buttress_power(dev, adev->ctrl, false);
> +
> +	return -EBUSY;
> +}
> +
> +static const struct dev_pm_ops ipu6_bus_pm_ops = {
> +	.runtime_suspend = bus_pm_runtime_suspend,
> +	.runtime_resume = bus_pm_runtime_resume,
> +};
> +
> +static int ipu6_bus_match(struct device *dev, struct device_driver *drv)
> +{
> +	struct ipu6_bus_driver *adrv = to_ipu6_bus_driver(drv);
> +	struct pci_dev *pci_dev = to_pci_dev(dev->parent);
> +	const struct pci_device_id *found_id;
> +
> +	found_id = pci_match_id(adrv->id_table, pci_dev);
> +	if (found_id)
> +		dev_dbg(dev, "%s %x:%x matched\n", dev_name(dev),
> +			found_id->vendor, found_id->device);
> +
> +	return found_id ? 1 : 0;
> +}
> +
> +static int ipu6_bus_probe(struct device *dev)
> +{
> +	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
> +	struct ipu6_bus_driver *adrv = to_ipu6_bus_driver(dev->driver);
> +	int ret;
> +
> +	if (!adev->isp->bus_ready_to_probe)
> +		return -EPROBE_DEFER;
> +
> +	dev_dbg(dev, "bus probe dev %s\n", dev_name(dev));
> +
> +	adev->adrv = adrv;
> +	if (!adrv->probe) {
> +		ret = -ENODEV;
> +		goto out_err;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(&adev->dev);
> +	if (ret < 0) {
> +		dev_err(&adev->dev, "Failed to get runtime PM\n");
> +		goto out_err;
> +	}
> +
> +	ret = adrv->probe(adev);
> +	pm_runtime_put(&adev->dev);
> +
> +	if (ret)
> +		goto out_err;
> +
> +	return 0;
> +
> +out_err:
> +	ipu6_bus_set_drvdata(adev, NULL);
> +	adev->adrv = NULL;
> +
> +	return ret;
> +}
> +
> +static void ipu6_bus_remove(struct device *dev)
> +{
> +	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
> +	struct ipu6_bus_driver *adrv = to_ipu6_bus_driver(dev->driver);
> +
> +	if (adrv->remove)
> +		adrv->remove(adev);
> +}
> +
> +static struct bus_type ipu6_bus = {
> +	.name = IPU6_BUS_NAME,
> +	.match = ipu6_bus_match,
> +	.probe = ipu6_bus_probe,
> +	.remove = ipu6_bus_remove,
> +	.pm = &ipu6_bus_pm_ops,
> +};
> +
> +static DEFINE_MUTEX(ipu6_bus_mutex);
> +
> +static void ipu6_bus_release(struct device *dev)
> +{
> +	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
> +
> +	kfree(adev);
> +}
> +
> +struct ipu6_bus_device *
> +ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
> +			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
> +			   char *name)
> +{
> +	struct ipu6_bus_device *adev;
> +	struct ipu6_device *isp = pci_get_drvdata(pdev);
> +
> +	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +	if (!adev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	adev->dev.parent = parent;
> +	adev->dev.bus = &ipu6_bus;
> +	adev->dev.release = ipu6_bus_release;
> +	adev->dev.dma_ops = &ipu6_dma_ops;
> +	adev->dma_mask = DMA_BIT_MASK(isp->secure_mode ? IPU6_MMU_ADDR_BITS :
> +				      IPU6_MMU_ADDR_BITS_NON_SECURE);
> +	adev->dev.dma_mask = &adev->dma_mask;
> +	adev->dev.dma_parms = pdev->dev.dma_parms;
> +	adev->dev.coherent_dma_mask = adev->dma_mask;
> +	adev->ctrl = ctrl;
> +	adev->pdata = pdata;
> +	adev->isp = isp;
> +	dev_set_name(&adev->dev, "%s", name);
> +
> +	device_initialize(&adev->dev);
> +	pm_runtime_forbid(&adev->dev);
> +	pm_runtime_enable(&adev->dev);
> +
> +	return adev;
> +}
> +
> +int ipu6_bus_add_device(struct ipu6_bus_device *adev)
> +{
> +	int ret;
> +
> +	ret = device_add(&adev->dev);
> +	if (ret) {
> +		put_device(&adev->dev);
> +		return ret;
> +	}
> +
> +	mutex_lock(&ipu6_bus_mutex);
> +	list_add(&adev->list, &adev->isp->devices);
> +	mutex_unlock(&ipu6_bus_mutex);
> +
> +	pm_runtime_allow(&adev->dev);
> +	return 0;
> +}
> +
> +void ipu6_bus_del_devices(struct pci_dev *pdev)
> +{
> +	struct ipu6_device *isp = pci_get_drvdata(pdev);
> +	struct ipu6_bus_device *adev, *save;
> +
> +	mutex_lock(&ipu6_bus_mutex);
> +
> +	list_for_each_entry_safe(adev, save, &isp->devices, list) {
> +		pm_runtime_disable(&adev->dev);
> +		list_del(&adev->list);
> +		device_unregister(&adev->dev);
> +	}
> +
> +	mutex_unlock(&ipu6_bus_mutex);
> +}
> +
> +int ipu6_bus_register_driver(struct ipu6_bus_driver *adrv)
> +{
> +	adrv->drv.bus = &ipu6_bus;
> +	return driver_register(&adrv->drv);
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu6_bus_register_driver, INTEL_IPU6);
> +
> +int ipu6_bus_unregister_driver(struct ipu6_bus_driver *adrv)
> +{
> +	driver_unregister(&adrv->drv);
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu6_bus_unregister_driver, INTEL_IPU6);
> +
> +int ipu6_bus_register(void)
> +{
> +	return bus_register(&ipu6_bus);
> +}
> +
> +void ipu6_bus_unregister(void)
> +{
> +	return bus_unregister(&ipu6_bus);
> +}
> +
> +static int flr_rpm_recovery(struct device *dev, void *p)
> +{
> +	/*
> +	 * We are not necessarily going through device from child to
> +	 * parent. runtime PM refuses to change state for parent if the child
> +	 * is still active. At FLR (full reset for whole IPU6) that doesn't
> +	 * matter. Everything has been power gated by HW during the FLR cycle
> +	 * and we are just cleaning up SW state. Thus, ignore child during
> +	 * set_suspended.
> +	 */
> +	dev_dbg(dev, "FLR recovery call\n");
> +	pm_suspend_ignore_children(dev, true);
> +	pm_runtime_set_suspended(dev);
> +	pm_suspend_ignore_children(dev, false);
> +
> +	return 0;
> +}
> +
> +int ipu6_bus_flr_recovery(void)
> +{
> +	bus_for_each_dev(&ipu6_bus, NULL, NULL, flr_rpm_recovery);
> +	return 0;
> +}
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/intel/ipu6/ipu6-bus.h
> new file mode 100644
> index 000000000000..de01bd56e786
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (C) 2013 - 2023 Intel Corporation */
> +
> +#ifndef IPU6_BUS_H
> +#define IPU6_BUS_H
> +
> +#include <linux/device.h>
> +#include <linux/irqreturn.h>
> +#include <linux/list.h>
> +#include <linux/mm.h>
> +#include <linux/pci.h>
> +
> +#define IPU6_BUS_NAME	IPU6_NAME "-bus"
> +
> +struct ipu6_buttress_ctrl;
> +struct ipu6_subsystem_trace_config;
> +
> +struct ipu6_bus_device {
> +	struct device dev;
> +	struct list_head list;
> +	void *pdata;
> +	struct ipu6_bus_driver *adrv;
> +	struct ipu6_mmu *mmu;
> +	struct ipu6_device *isp;
> +	struct ipu6_subsystem_trace_config *trace_cfg;
> +	struct ipu6_buttress_ctrl *ctrl;
> +	u64 dma_mask;
> +
> +	const struct firmware *fw;

Is there a firmware per device ? I may have understood things wrong, but
I thought the whole point of this architecture was to have a base PCI
device running a firmware, exposing multiple functions (ISYS and PSYS),
and implementing separate drivers for those functions.

> +	struct sg_table fw_sgt;
> +	u64 *pkg_dir;
> +	dma_addr_t pkg_dir_dma_addr;
> +	unsigned int pkg_dir_size;
> +};
> +
> +#define to_ipu6_bus_device(_dev) container_of(_dev, struct ipu6_bus_device, dev)
> +
> +struct ipu6_bus_driver {
> +	struct device_driver drv;
> +	const struct pci_device_id *id_table;

Why do you need the PCI ID table here ? The table from ipu6-isys.c is
the same as the one in ipu6.c.

> +	int (*probe)(struct ipu6_bus_device *adev);
> +	void (*remove)(struct ipu6_bus_device *adev);
> +	irqreturn_t (*isr)(struct ipu6_bus_device *adev);
> +	irqreturn_t (*isr_threaded)(struct ipu6_bus_device *adev);
> +	bool wake_isr_thread;
> +};
> +
> +#define to_ipu6_bus_driver(_drv) container_of(_drv, struct ipu6_bus_driver, drv)
> +
> +struct ipu6_bus_device *
> +ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
> +			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
> +			   char *name);
> +int ipu6_bus_add_device(struct ipu6_bus_device *adev);
> +void ipu6_bus_del_devices(struct pci_dev *pdev);
> +
> +int ipu6_bus_register_driver(struct ipu6_bus_driver *adrv);
> +int ipu6_bus_unregister_driver(struct ipu6_bus_driver *adrv);
> +
> +int ipu6_bus_register(void);
> +void ipu6_bus_unregister(void);
> +
> +#define ipu6_bus_set_drvdata(adev, data) dev_set_drvdata(&(adev)->dev, data)
> +#define ipu6_bus_get_drvdata(adev) dev_get_drvdata(&(adev)->dev)
> +
> +int ipu6_bus_flr_recovery(void);
> +
> +#endif

-- 
Regards,

Laurent Pinchart
