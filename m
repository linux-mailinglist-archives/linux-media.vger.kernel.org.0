Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60053765196
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 12:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbjG0KrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 06:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjG0KrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 06:47:09 -0400
Received: from mgamail.intel.com (unknown [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41EB26A8
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 03:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690454825; x=1721990825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+vNbfYCdft85OV2TNdQ4T5k7yzyT69/JtfRXql7dy1M=;
  b=PA02EeUjcU3du6jxcMfyPFT2QdkbLER5qOSbdd0cQZNdS/yK+RksfpD8
   WJAUkIO/X4apDA00hwKOnGSPpOaalSlnJTWqzaTB3/ELDwWXBWICtZFGk
   qMNWyVC1u23uMuSBFbHDkGZHFVlPMOfO9rtkpUiOmJEdx04bVwuIqFvox
   hwSAj3sJm3DuiYUOklff0Oa8RbzYSYAqVJMGzumN8iYb0YLO1GBY7Afew
   7FgB2vwPlfoo3Itc6U2SiS4Wi4ImgLbEGUDtyKQ45/Kd9jQxD/RiJosBv
   F4XJ1NSEqAYdjFLZBPUqp3BS+YzERiURWBHoYrbfurwfxxxUBpCqTeKlr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348555825"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="348555825"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 03:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057680066"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="1057680066"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2023 03:47:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qOyWK-000IML-1Q;
        Thu, 27 Jul 2023 13:47:00 +0300
Date:   Thu, 27 Jul 2023 13:47:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com,
        tfiga@chromium.org, senozhatsky@chromium.org, hdegoede@redhat.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 01/15] media: intel/ipu6: add Intel IPU6 PCI device driver
Message-ID: <ZMJLJGfH3vZDLb6U@smile.fi.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-2-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727071558.1148653-2-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 27, 2023 at 03:15:44PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Intel Image Processing Unit 6th Gen includes input and processing systems
> but the hardware presents itself as a single PCI device in system.
> 
> IPU6 PCI device driver basically does PCI configurations and load
> the firmware binary, initialises IPU virtual bus, and sets up platform
> specific variants to support multiple IPU6 devices in single device
> driver.

> +#ifndef IPU6_PLATFORM_REGS_H
> +#define IPU6_PLATFORM_REGS_H

Missing

bits.h

...

> +#define IPU6_ISYS_CSI_PORT_IRQ(irq_num)		(1 << (irq_num))

BIT() ?

...

> +#define S2M_PIXEL_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING 0xE4o

Why capital?

...

> +/*
> + * csi_be_soc_pixel_remapping is for the enabling of the pixel remapping.

Is it reference to a function? Please use func() format everywhere.

> + * This remapping is exactly like the stream2mmio remapping.
> + */
> +#define CSI_BE_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING    0xE4

Why capital?

> +enum nci_ab_access_mode {
> +	NCI_AB_ACCESS_MODE_RW,	/* read & write */
> +	NCI_AB_ACCESS_MODE_RO,	/* read only */
> +	NCI_AB_ACCESS_MODE_WO,	/* write only */
> +	NCI_AB_ACCESS_MODE_NA	/* No access at all */

Leave trailing comma, since it doesn't look like a terminating entry.

> +};

...

> +#define IPU6_PSYS_GPDEV_IRQ_FWIRQ(n)		(1 << (n))

BIT() ?

> +#endif /* IPU6_PLATFORM_REGS_H */

...

> +#ifndef IPU6_PLATFORM_H
> +#define IPU6_PLATFORM_H
> +
> +#include "ipu6-fw-isys.h"
> +
> +#define IPU6_NAME			"intel-ipu6"
> +
> +#define IPU6SE_FIRMWARE_NAME		"intel/ipu6se_fw.bin"
> +#define IPU6EP_FIRMWARE_NAME		"intel/ipu6ep_fw.bin"
> +#define IPU6_FIRMWARE_NAME		"intel/ipu6_fw.bin"
> +#define IPU6EPMTL_FIRMWARE_NAME		"intel/ipu6epmtl_fw.bin"

Maybe


#define IPU6_FIRMWARE_FOLDER		"intel"

#define IPU6SE_FIRMWARE_NAME		"ipu6se_fw.bin"
#define IPU6EP_FIRMWARE_NAME		"ipu6ep_fw.bin"
#define IPU6_FIRMWARE_NAME		"ipu6_fw.bin"
#define IPU6EPMTL_FIRMWARE_NAME		"ipu6epmtl_fw.bin"

And then concatenate in the code?

Or

#define IPU6SE_FIRMWARE_NAME		IPU6_FIRMWARE_FOLDER "/ipu6se_fw.bin"
#define IPU6EP_FIRMWARE_NAME		IPU6_FIRMWARE_FOLDER "/ipu6ep_fw.bin"
#define IPU6_FIRMWARE_NAME		IPU6_FIRMWARE_FOLDER "/ipu6_fw.bin"
#define IPU6EPMTL_FIRMWARE_NAME		IPU6_FIRMWARE_FOLDER "/ipu6epmtl_fw.bin"

?

> +#endif

...

> +#include <linux/acpi.h>

Not used.

> +#include <linux/bitfield.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/firmware.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>
> +#include <linux/pm_qos.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/timer.h>

Check this block if all of them are being used / needed and otherwise,
if something is missing (property.h and slab.h, for example).

> +#include "ipu6.h"
> +#include "ipu6-bus.h"
> +#include "ipu6-buttress.h"
> +#include "ipu6-cpd.h"
> +#include "ipu6-isys.h"
> +#include "ipu6-mmu.h"
> +#include "ipu6-platform.h"
> +#include "ipu6-platform-buttress-regs.h"
> +#include "ipu6-platform-isys-csi2-reg.h"
> +#include "ipu6-platform-regs.h"
> +#include "../ipu-bridge.h"

Ditto.

...

> +struct ipu6_cell_program_t {

No _t.
_t is used for typedef:s.

> +	u32 magic_number;
> +
> +	u32 blob_offset;
> +	u32 blob_size;
> +
> +	u32 start[3];
> +
> +	u32 icache_source;
> +	u32 icache_target;
> +	u32 icache_size;
> +
> +	u32 pmem_source;
> +	u32 pmem_target;
> +	u32 pmem_size;
> +
> +	u32 data_source;
> +	u32 data_target;
> +	u32 data_size;
> +
> +	u32 bss_target;
> +	u32 bss_size;
> +
> +	u32 cell_id;
> +	u32 regs_addr;
> +
> +	u32 cell_pmem_data_bus_address;
> +	u32 cell_dmem_data_bus_address;
> +	u32 cell_pmem_control_bus_address;
> +	u32 cell_dmem_control_bus_address;
> +
> +	u32 next;
> +	u32 dummy[2];

> +} __packed;

Why?! Please justify this.

...

> +	prog = (struct ipu6_cell_program_t *)((u64)isp->cpd_fw->data +
> +					      (server_fw_addr -
> +					       dma_addr));

This looks awful. Can you utilise something like offsetof()?

...

> +static int ipu6_isys_check_fwnode_graph(struct fwnode_handle *fwnode)
> +{
> +	struct fwnode_handle *endpoint;

> +	if (IS_ERR_OR_NULL(fwnode))
> +		return -EINVAL;

Isn't this already embedded in the below call?

But okay, you probably know better what's going on here.

> +	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (endpoint) {
> +		fwnode_handle_put(endpoint);
> +		return 0;
> +	}
> +
> +	return ipu6_isys_check_fwnode_graph(fwnode->secondary);
> +}

...

> +	ret = ipu6_isys_check_fwnode_graph(fwnode);
> +	if (ret) {

> +		if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {

Why is this check not part of the above call?

> +			dev_err(&pdev->dev,
> +				"fwnode graph has no endpoints connection\n");
> +			return ERR_PTR(-EINVAL);

> +		}
> +
> +		ret = ipu_bridge_init(pdev);
> +		if (ret) {
> +			dev_err_probe(&pdev->dev, ret,
> +				      "IPU6 bridge init failed\n");
> +			return ERR_PTR(ret);
> +		}
> +	}

...

> +	isys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
> +					       IPU6_ISYS_NAME);
> +	if (IS_ERR(isys_adev)) {
> +		dev_err_probe(&pdev->dev, PTR_ERR(isys_adev),
> +			      "ipu6_bus_add_device(isys_adev) failed\n");

I read another call name above... What is this message about?

> +		kfree(pdata);
> +		return ERR_CAST(isys_adev);
> +	}

...

> +	ret = ipu6_bus_add_device(isys_adev);
> +
> +	return ret ? ERR_PTR(ret) : isys_adev;

No memory cleanups?

...

> +	ret = ipu6_bus_add_device(psys_adev);
> +
> +	return ret ? ERR_PTR(ret) : psys_adev;

Ditto.

...

> +static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
> +{
> +	u16 pci_command;
> +	int ret;
> +
> +	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
> +	pci_command |= PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
> +	pci_write_config_word(dev, PCI_COMMAND, pci_command);

Huh?! Why is it needed and why PCI core is not enough for these?

> +	/* No PCI msi capability for IPU6EP */
> +	if (hw_ver == IPU6_VER_6EP || hw_ver == IPU6_VER_6EP_MTL) {
> +		/* likely do nothing as msi not enabled by default */
> +		pci_disable_msi(dev);
> +		return 0;
> +	}

> +	ret = pci_enable_msi(dev);
> +	if (ret)
> +		dev_err(&dev->dev, "Failed to enable msi (%d)\n", ret);
> +	return ret;

No, use pci_alloc_irq_vectors() and respective clean up.

> +}

...

> +	ret = pcim_enable_device(pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to enable PCI device (%d)\n", ret);
> +		return ret;

		return dev_err_probe(...);

> +	}

> +	dev_info(&pdev->dev, "Device 0x%x (rev: 0x%x)\n",
> +		 pdev->device, pdev->revision);

Useless noise. We have this in the kernel dmesg anyway.
Why do you need a dup?

...

> +	ret = pcim_iomap_regions(pdev, 1 << IPU6_PCI_BAR, pci_name(pdev));

BIT()

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to I/O mem remapping (%d)\n", ret);
> +		return ret;

dev_err_probe()

> +	}

> +	dev_dbg(&pdev->dev, "physical base address 0x%llx\n", phys);

Useless, see above.

...

> +	iomap = pcim_iomap_table(pdev);

> +	if (!iomap) {
> +		dev_err(&pdev->dev, "Failed to iomap table (%d)\n", ret);
> +		return -ENODEV;
> +	}

Dead code.

> +	isp->base = iomap[IPU6_PCI_BAR];

...

> +	default:
> +		dev_err(&pdev->dev, "Unsupported IPU6 device %x\n", id->device);
> +		return -ENODEV;

dev_err_probe()

> +	}

...

> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(39));
> +	if (ret) {

> +		dev_err(&pdev->dev, "Failed to set DMA mask (%d)\n", ret);
> +		return ret;

Ditto.

> +	}

...

> +	ret = devm_request_threaded_irq(&pdev->dev, pdev->irq,
> +					ipu6_buttress_isr,
> +					ipu6_buttress_isr_threaded,
> +					IRQF_SHARED, IPU6_NAME, isp);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Requesting irq failed(%d)\n", ret);
> +		return ret;

Ditto.

> +	}

...

> +	ret = request_cpd_fw(&isp->cpd_fw, isp->cpd_fw_name, &pdev->dev);
> +	if (ret) {
> +		dev_err(&isp->pdev->dev, "Requesting signed firmware failed\n");

Ditto.
		ret = dev_err_probe(...);

...and so on below.

> +		goto buttress_exit;
> +	}

...

> +	isys_ctrl = devm_kzalloc(&pdev->dev, sizeof(*isys_ctrl), GFP_KERNEL);
> +	if (!isys_ctrl) {
> +		ret = -ENOMEM;
> +		goto out_ipu6_bus_del_devices;
> +	}
> +
> +	memcpy(isys_ctrl, &isys_buttress_ctrl, sizeof(*isys_ctrl));

devm_kmemdup()?

...

> +	psys_ctrl = devm_kzalloc(&pdev->dev, sizeof(*psys_ctrl), GFP_KERNEL);
> +	if (!psys_ctrl) {
> +		ret = -ENOMEM;
> +		goto out_ipu6_bus_del_devices;
> +	}
> +
> +	memcpy(psys_ctrl, &psys_buttress_ctrl, sizeof(*psys_ctrl));

Ditto?

...

> +	ret = pm_runtime_get_sync(&isp->psys->auxdev.dev);
> +	if (ret < 0) {

Leaking reference count.

> +		dev_err(&isp->psys->auxdev.dev, "Failed to get runtime PM\n");
> +		goto out_ipu6_bus_del_devices;
> +	}

...

> +	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
> +		ipu6_mmu_cleanup(isp->psys->mmu);
> +	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
> +		ipu6_mmu_cleanup(isp->isys->mmu);

All these conditionals should be hidden in the callee.

> +	if (!IS_ERR_OR_NULL(isp->psys))

Why it doesn't cover all above?

> +		pm_runtime_put(&isp->psys->auxdev.dev);

...

> +static void ipu6_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct ipu6_device *isp = pci_get_drvdata(pdev);
> +
> +	dev_warn(&pdev->dev, "FLR prepare\n");

???

> +	pm_runtime_forbid(&isp->pdev->dev);
> +}

> +static void ipu6_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct ipu6_device *isp = pci_get_drvdata(pdev);
> +
> +	ipu6_buttress_restore(isp);
> +	if (isp->secure_mode)
> +		ipu6_buttress_reset_authentication(isp);
> +
> +	isp->need_ipc_reset = true;
> +	pm_runtime_allow(&isp->pdev->dev);
> +
> +	dev_info(&pdev->dev, "IPU6 PCI FLR completed\n");

???

Are these debug leftovers?

> +}

...

> +static const struct dev_pm_ops ipu6_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(&ipu6_suspend, &ipu6_resume)
> +	SET_RUNTIME_PM_OPS(&ipu6_suspend, &ipu6_runtime_resume, NULL)

Use new macros instead of obsolete ones.

> +};

...

> +static const struct pci_device_id ipu6_pci_tbl[] = {
> +	{ PCI_VDEVICE(INTEL, IPU6_PCI_ID) },
> +	{ PCI_VDEVICE(INTEL, IPU6SE_PCI_ID) },
> +	{ PCI_VDEVICE(INTEL, IPU6EP_ADL_P_PCI_ID) },
> +	{ PCI_VDEVICE(INTEL, IPU6EP_ADL_N_PCI_ID) },
> +	{ PCI_VDEVICE(INTEL, IPU6EP_RPL_P_PCI_ID) },
> +	{ PCI_VDEVICE(INTEL, IPU6EP_MTL_PCI_ID) },
> +	{ }
> +};

Can you make sure the device IDs are in the standard format?
PCI_DEVICE_ID_INTEL_... (if I remember correctly the template)


> +static struct pci_driver ipu6_pci_driver = {
> +	.name = IPU6_NAME,
> +	.id_table = ipu6_pci_tbl,
> +	.probe = ipu6_pci_probe,
> +	.remove = ipu6_pci_remove,
> +	.driver = {
> +		.pm = &ipu6_pm_ops,

pm_ptr()

> +	},
> +	.err_handler = &pci_err_handlers,
> +};

...

> +static int __init ipu6_init(void)
> +{
> +	int ret;
> +
> +	ret = pci_register_driver(&ipu6_pci_driver);
> +	if (ret)
> +		pr_warn("can't register PCI driver (%d)\n", ret);
> +
> +	return ret;
> +}
> +
> +static void __exit ipu6_exit(void)
> +{
> +	pci_unregister_driver(&ipu6_pci_driver);
> +}
> +
> +module_init(ipu6_init);
> +module_exit(ipu6_exit);

Use module_pci_driver().

...

> +MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
> +MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
> +MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
> +MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
> +MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
> +MODULE_AUTHOR("Hongju Wang <hongju.wang@intel.com>");

So many authors and so many issues with the code.
Did you pass an internal review?

...

> +#ifndef IPU6_H
> +#define IPU6_H
> +
> +#include <linux/firmware.h>
> +#include <linux/ioport.h>
> +#include <linux/list.h>
> +#include <linux/pci.h>
> +
> +#include "ipu6-buttress.h"

As usual, missing headers and not used one. Internally we have a wiki page that
describes hints and tricks for driver programming, please find it and read and
fix your series accordingly. Maybe you need to go for a new round(s) of
internal review.

I'm stopping here for now.

> +#endif /* IPU6_H */

-- 
With Best Regards,
Andy Shevchenko


