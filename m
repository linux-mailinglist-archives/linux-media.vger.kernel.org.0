Return-Path: <linux-media+bounces-27110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDAEA473F6
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 05:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89FA37A2B70
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 04:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFC81BBBD3;
	Thu, 27 Feb 2025 04:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0D6OzJr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFE0155C83
	for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 04:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740629476; cv=none; b=G3O+tann6vf++qguq/G5F3gs8VfGFtRQJmNdLSof3OfILcEjmicfwP56jr5oXKBCgjNVrvDqmdt0th57OVwIP3v6xwnjzizRlPdxBpEogjmjby1Wsr7o4uQW7JrzbxCzC0UkRChKfuIen+F2R63Sfwl6xgHf/7ZVpxvPNA8b6c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740629476; c=relaxed/simple;
	bh=tHjSPk3VxhcnaJCBAePmxP5x98OCv9ZBtvRFmb455lQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=af8Y4/HcMfzxqT/ApQxx4I80g7susd/9e1sXXlIvaGkg5PwGxHG9fMuCmxfSwIsCIyRKLVrEHLCylZmQ0FZlkchxhFgswkZW/ag8R7sPXVmMsigvSi8y/C9tAl1Y1XWzXwsjLzH/XUg0LgkllFySbnbvpzAjgtaZiot1lU0Y+9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0D6OzJr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740629474; x=1772165474;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=tHjSPk3VxhcnaJCBAePmxP5x98OCv9ZBtvRFmb455lQ=;
  b=C0D6OzJrzKWIlQrWU2zTK9F5Yhqm49iDCG6c3rFM9f4GJHu3RRO/v/SA
   uRW5RLpX7F2lQtxRDwYOSQMhk9cr4w3f1u5VlbLTIAJVS8FpwHScqgrrX
   bAn4ubemcJWv9/uaIou7LCvYjJ0grUJC0/5pNSHVTbfi290lYD8yiFjYm
   4y1a3XRLIKxLXRi7GB2+wmg+ndWMgGRoUchtQ7nbtrShhf1Nkb8EF0GKR
   /zwOzUGw4Tp2Fm9459twXYlbQc70iVScmDUqjjvcAH5GjllOtRcDiUPF1
   WhQchKNgWb7h2yNiuTZwHswdM3UDQ8rONaBZS7RUc/lQiGNH0GrRIHULZ
   g==;
X-CSE-ConnectionGUID: J8rEX27MQFeQxhDJlzxN4A==
X-CSE-MsgGUID: tZ+41QjDTs2XRy/HcNmmcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="59040135"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="59040135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 20:11:14 -0800
X-CSE-ConnectionGUID: kEW5NSuqRSatwlSHVfIRzA==
X-CSE-MsgGUID: WxhWcqOtSBepFHldsxexXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117077670"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 20:11:11 -0800
Subject: Re: [RFC PATCH 2/7] media: ipu7: add Intel IPU7 PCI device driver
To: phasta@kernel.org, bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, hdegoede@redhat.com
Cc: hans@hansg.org, stanislaw.gruszka@linux.intel.com, jerry.w.hu@intel.com,
 tian.shu.qiu@intel.com, daxing.li@intel.com, hao.yao@intel.com
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
 <20250221075252.3347582-3-bingbu.cao@intel.com>
 <873cbddbc43638c2564ce27e373c25fe2f3dc2e9.camel@mailbox.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <adb53b1f-29e1-3d14-0e61-351fd2d3ff0d@linux.intel.com>
Date: Thu, 27 Feb 2025 12:06:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <873cbddbc43638c2564ce27e373c25fe2f3dc2e9.camel@mailbox.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/24/25 10:38 PM, Philipp Stanner wrote:
> Hi,
> 
> see below
> 
> On Fri, 2025-02-21 at 15:52 +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Intel Image Processing Unit 7th Gen includes input and processing
>> systems
>> and the hardware presents itself as a single PCI device in system
>> same
>> as IPU6.
>>
>> The IPU7 PCI device driver basically does PCI configurations, basic
>> hardware configuration by its buttress interfaces, loads the
>> firmware binary, register the auxiliary device which serve for the
>> ISYS
>> device driver.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/media/pci/intel/ipu7/ipu7-bus.c       |  158 +
>>  drivers/media/pci/intel/ipu7/ipu7-bus.h       |   69 +
>>  .../media/pci/intel/ipu7/ipu7-buttress-regs.h |  465 +++
>>  drivers/media/pci/intel/ipu7/ipu7-buttress.c  | 1187 +++++++
>>  drivers/media/pci/intel/ipu7/ipu7-buttress.h  |   84 +
>>  .../media/pci/intel/ipu7/ipu7-platform-regs.h |  146 +
>>  drivers/media/pci/intel/ipu7/ipu7.c           | 2791
>> +++++++++++++++++
>>  drivers/media/pci/intel/ipu7/ipu7.h           |  244 ++
>>  8 files changed, 5144 insertions(+)
>>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-bus.c
>>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-bus.h
>>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress-regs.h
>>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress.c
>>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress.h
>>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-platform-regs.h
>>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7.c
>>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7.h
>>

---snip---

>> +static int ipu7_pci_probe(struct pci_dev *pdev, const struct
>> pci_device_id *id)
>> +{
>> +	struct ipu_buttress_ctrl *isys_ctrl = NULL, *psys_ctrl =
>> NULL;
>> +	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
>> +	const struct ipu_buttress_ctrl *isys_buttress_ctrl;
>> +	const struct ipu_buttress_ctrl *psys_buttress_ctrl;
>> +	struct ipu_isys_internal_pdata *isys_ipdata;
>> +	struct ipu_psys_internal_pdata *psys_ipdata;
>> +	unsigned int dma_mask = IPU_DMA_MASK;
>> +	struct device *dev = &pdev->dev;
>> +	void __iomem *isys_base = NULL;
>> +	void __iomem *psys_base = NULL;
>> +	void __iomem *const *iomap;
>> +	phys_addr_t phys, pb_phys;
>> +	struct ipu7_device *isp;
>> +	u32 is_es;
>> +	int ret;
>> +
>> +	if (!fwnode || fwnode_property_read_u32(fwnode, "is_es",
>> &is_es))
>> +		is_es = 0;
>> +
>> +	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
>> +	if (!isp)
>> +		return -ENOMEM;
>> +
>> +	dev_set_name(dev, "intel-ipu7");
>> +	isp->pdev = pdev;
>> +	INIT_LIST_HEAD(&isp->devices);
>> +
>> +	ret = pcim_enable_device(pdev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Enable PCI device
>> failed\n");
>> +
>> +	dev_info(dev, "Device 0x%x (rev: 0x%x)\n",
>> +		 pdev->device, pdev->revision);
>> +
>> +	phys = pci_resource_start(pdev, IPU_PCI_BAR);
>> +	pb_phys = pci_resource_start(pdev, IPU_PCI_PBBAR);
>> +	dev_info(dev, "IPU7 PCI BAR0 base %llx BAR2 base %llx\n",
>> +		 phys, pb_phys);
>> +
>> +	ret = pcim_iomap_regions(pdev, BIT(IPU_PCI_BAR) |
>> BIT(IPU_PCI_PBBAR),
>> +				 pci_name(pdev));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "Failed to I/O memory remapping
>> (%d)\n",
>> +				     ret);
>> +
>> +	iomap = pcim_iomap_table(pdev);
> 
> pcim_iomap_table() and pcim_iomap_regions() have been deprecated last
> year. That's also documented in those functions' docstrings. Please
> don't use them anymore.
> 
> You can achieve all you need with the simpler pcim_iomap_region()

Philipp,

I see that pcim_iomap_regions() and pcim_add_mapping_to_legacy_table()
have simple 'bar' checking, how does pcim_iomap_region() check that?

> 
> 
>> +	if (!iomap)
>> +		return dev_err_probe(dev, -ENODEV, "Failed to iomap
>> table\n");
>> +
>> +	isp->base = iomap[IPU_PCI_BAR];
>> +	isp->pb_base = iomap[IPU_PCI_PBBAR];
>> +	dev_info(dev, "IPU7 PCI BAR0 mapped at %p\n BAR2 mapped at
>> %p\n",
>> +		 isp->base, isp->pb_base);
>> +
>> +	pci_set_drvdata(pdev, isp);
>> +	pci_set_master(pdev);
>> +
>> +	switch (id->device) {
>> +	case IPU7_PCI_ID:
>> +		isp->hw_ver = IPU_VER_7;
>> +		isp->cpd_fw_name = IPU7_FIRMWARE_NAME;
>> +		isys_ipdata = &ipu7_isys_ipdata;
>> +		psys_ipdata = &ipu7_psys_ipdata;
>> +		isys_buttress_ctrl = &ipu7_isys_buttress_ctrl;
>> +		psys_buttress_ctrl = &ipu7_psys_buttress_ctrl;
>> +		break;
>> +	case IPU7P5_PCI_ID:
>> +		isp->hw_ver = IPU_VER_7P5;
>> +		isp->cpd_fw_name = IPU7P5_FIRMWARE_NAME;
>> +		isys_ipdata = &ipu7p5_isys_ipdata;
>> +		psys_ipdata = &ipu7p5_psys_ipdata;
>> +		isys_buttress_ctrl = &ipu7_isys_buttress_ctrl;
>> +		psys_buttress_ctrl = &ipu7_psys_buttress_ctrl;
>> +		break;
>> +	case IPU8_PCI_ID:
>> +		isp->hw_ver = IPU_VER_8;
>> +		isp->cpd_fw_name = IPU8_FIRMWARE_NAME;
>> +		isys_ipdata = &ipu8_isys_ipdata;
>> +		psys_ipdata = &ipu8_psys_ipdata;
>> +		isys_buttress_ctrl = &ipu8_isys_buttress_ctrl;
>> +		psys_buttress_ctrl = &ipu8_psys_buttress_ctrl;
>> +		break;
>> +	default:
>> +		WARN(1, "Unsupported IPU device");
>> +		return -ENODEV;
>> +	}
>> +
>> +	ipu_internal_pdata_init(isys_ipdata, psys_ipdata);
>> +
>> +	isys_base = isp->base + isys_ipdata->hw_variant.offset;
>> +	psys_base = isp->base + psys_ipdata->hw_variant.offset;
>> +
>> +	ret = dma_set_mask_and_coherent(dev,
>> DMA_BIT_MASK(dma_mask));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to set DMA
>> mask\n");
>> +
>> +	dma_set_max_seg_size(dev, UINT_MAX);
>> +
>> +	ret = ipu7_pci_config_setup(pdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ipu_buttress_init(isp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_info(dev, "firmware cpd file: %s\n", isp->cpd_fw_name);
>> +
>> +	ret = request_firmware(&isp->cpd_fw, isp->cpd_fw_name, dev);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret,
>> +			      "Requesting signed firmware %s
>> failed\n",
>> +			      isp->cpd_fw_name);
>> +		goto buttress_exit;
>> +	}
>> +
>> +	ret = ipu7_cpd_validate_cpd_file(isp, isp->cpd_fw->data,
>> +					 isp->cpd_fw->size);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "Failed to validate cpd\n");
>> +		goto out_ipu_bus_del_devices;
>> +	}
>> +
>> +	isys_ctrl = devm_kmemdup(dev, isys_buttress_ctrl,
>> +				 sizeof(*isys_buttress_ctrl),
>> GFP_KERNEL);
>> +	if (!isys_ctrl) {
>> +		ret = -ENOMEM;
>> +		goto out_ipu_bus_del_devices;
>> +	}
>> +
>> +	isp->isys = ipu7_isys_init(pdev, dev, isys_ctrl, isys_base,
>> +				   isys_ipdata, 0);
>> +	if (IS_ERR(isp->isys)) {
>> +		ret = PTR_ERR(isp->isys);
>> +		goto out_ipu_bus_del_devices;
>> +	}
>> +
>> +	psys_ctrl = devm_kmemdup(dev, psys_buttress_ctrl,
>> +				 sizeof(*psys_buttress_ctrl),
>> GFP_KERNEL);
>> +	if (!psys_ctrl) {
>> +		ret = -ENOMEM;
>> +		goto out_ipu_bus_del_devices;
>> +	}
>> +
>> +	isp->psys = ipu7_psys_init(pdev, &isp->isys->auxdev.dev,
>> +				   psys_ctrl, psys_base,
>> +				   psys_ipdata, 0);
>> +	if (IS_ERR(isp->psys)) {
>> +		ret = PTR_ERR(isp->psys);
>> +		goto out_ipu_bus_del_devices;
>> +	}
>> +
>> +	ret = devm_request_threaded_irq(dev, pdev->irq,
>> +					ipu_buttress_isr,
>> +					ipu_buttress_isr_threaded,
>> +					IRQF_SHARED, IPU_NAME, isp);
>> +	if (ret)
>> +		goto out_ipu_bus_del_devices;
>> +
>> +	if (!isp->secure_mode) {
>> +		ret = ipu7_init_fw_code_region(isp);
>> +		if (ret)
>> +			goto out_ipu_bus_del_devices;
>> +	} else {
>> +		ret = pm_runtime_get_sync(&isp->psys->auxdev.dev);
>> +		if (ret < 0) {
>> +			dev_err(&isp->psys->auxdev.dev,
>> +				"Failed to get runtime PM\n");
>> +			goto out_ipu_bus_del_devices;
>> +		}
>> +
>> +		ret = ipu7_mmu_hw_init(isp->psys->mmu);
>> +		if (ret) {
>> +			dev_err_probe(&isp->pdev->dev, ret,
>> +				      "Failed to init MMU
>> hardware\n");
>> +			goto out_ipu_bus_del_devices;
>> +		}
>> +
>> +		ret = ipu7_map_fw_code_region(isp->psys,
>> +					      (void *)isp->cpd_fw-
>>> data,
>> +					      isp->cpd_fw->size);
>> +		if (ret) {
>> +			dev_err_probe(&isp->pdev->dev, ret,
>> +				      "failed to map fw image\n");
>> +			goto out_ipu_bus_del_devices;
>> +		}
>> +
>> +		ret = ipu_buttress_authenticate(isp);
>> +		if (ret) {
>> +			dev_err_probe(&isp->pdev->dev, ret,
>> +				      "FW authentication failed\n");
>> +			goto out_ipu_bus_del_devices;
>> +		}
>> +
>> +		ipu7_mmu_hw_cleanup(isp->psys->mmu);
>> +		pm_runtime_put(&isp->psys->auxdev.dev);
>> +	}
>> +
>> +	pm_runtime_put_noidle(dev);
>> +	pm_runtime_allow(dev);
>> +
>> +	isp->ipu7_bus_ready_to_probe = true;
>> +
>> +	return 0;
>> +
>> +out_ipu_bus_del_devices:
>> +	if (!IS_ERR_OR_NULL(isp->isys) && isp->isys->fw_sgt.nents)
>> +		ipu7_unmap_fw_code_region(isp->isys);
>> +	if (!IS_ERR_OR_NULL(isp->psys) && isp->psys->fw_sgt.nents)
>> +		ipu7_unmap_fw_code_region(isp->psys);
>> +	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys-
>>> mmu))
>> +		ipu7_mmu_cleanup(isp->psys->mmu);
>> +	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys-
>>> mmu))
>> +		ipu7_mmu_cleanup(isp->isys->mmu);
>> +	if (!IS_ERR_OR_NULL(isp->psys))
>> +		pm_runtime_put(&isp->psys->auxdev.dev);
>> +	ipu7_bus_del_devices(pdev);
>> +	release_firmware(isp->cpd_fw);
>> +buttress_exit:
>> +	ipu_buttress_exit(isp);
>> +
>> +	return ret;
>> +}
>> +
>> +static void ipu7_pci_remove(struct pci_dev *pdev)
>> +{
>> +	struct ipu7_device *isp = pci_get_drvdata(pdev);
>> +
>> +	if (!IS_ERR_OR_NULL(isp->isys) && isp->isys->fw_sgt.nents)
>> +		ipu7_unmap_fw_code_region(isp->isys);
>> +	if (!IS_ERR_OR_NULL(isp->psys) && isp->psys->fw_sgt.nents)
>> +		ipu7_unmap_fw_code_region(isp->psys);
>> +
>> +	if (!IS_ERR_OR_NULL(isp->fw_code_region))
>> +		vfree(isp->fw_code_region);
>> +
>> +	ipu7_bus_del_devices(pdev);
>> +
>> +	pm_runtime_forbid(&pdev->dev);
>> +	pm_runtime_get_noresume(&pdev->dev);
>> +
>> +	pci_release_regions(pdev);
> 
> You don't need this if you request with a pcim_ function. The 'm'
> stands for "managed". Those are devres functions that will clean up
> automatically if probe() fails or once remove() is invoked.
> 
> Furthermore, you should not mix pcim_ and pci_ functions; at least not
> those.
> 
> And even if the pcim_ functions wouldn't do a cleanup, you would leak
> the IO mappings above, since pci_release_regions() just removes the
> region requests, but not the mapping cookies.
> 
> I recommend taking a look to the PCI subystem's documentation.
> 
>> +	pci_disable_device(pdev);
> 
> You also don't need this since you used pcim_enable_device(), which
> will disable the device automatically on driver-detach.
> 
> 
> P.
> 
>> +
>> +	ipu_buttress_exit(isp);
>> +
>> +	release_firmware(isp->cpd_fw);
>> +
>> +	ipu7_mmu_cleanup(isp->psys->mmu);
>> +	ipu7_mmu_cleanup(isp->isys->mmu);
>> +}
>> +
>> +static void ipu7_pci_reset_prepare(struct pci_dev *pdev)
>> +{
>> +	struct ipu7_device *isp = pci_get_drvdata(pdev);
>> +
>> +	dev_warn(&pdev->dev, "FLR prepare\n");
>> +	pm_runtime_forbid(&isp->pdev->dev);
>> +}
>> +
>> +static void ipu7_pci_reset_done(struct pci_dev *pdev)
>> +{
>> +	struct ipu7_device *isp = pci_get_drvdata(pdev);
>> +
>> +	ipu_buttress_restore(isp);
>> +	if (isp->secure_mode)
>> +		ipu_buttress_reset_authentication(isp);
>> +
>> +	isp->ipc_reinit = true;
>> +	pm_runtime_allow(&isp->pdev->dev);
>> +
>> +	dev_warn(&pdev->dev, "FLR completed\n");
>> +}
>> +
>> +/*
>> + * PCI base driver code requires driver to provide these to enable
>> + * PCI device level PM state transitions (D0<->D3)
>> + */
>> +static int ipu7_suspend(struct device *dev)
>> +{
>> +	return 0;
>> +}
>> +
>> +static int ipu7_resume(struct device *dev)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct ipu7_device *isp = pci_get_drvdata(pdev);
>> +	struct ipu_buttress *b = &isp->buttress;
>> +	int ret;
>> +
>> +	isp->secure_mode = ipu_buttress_get_secure_mode(isp);
>> +	dev_info(dev, "IPU7 in %s mode\n",
>> +		 isp->secure_mode ? "secure" : "non-secure");
>> +
>> +	ipu_buttress_restore(isp);
>> +
>> +	ret = ipu_buttress_ipc_reset(isp, &b->cse);
>> +	if (ret)
>> +		dev_err(dev, "IPC reset protocol failed!\n");
>> +
>> +	ret = pm_runtime_get_sync(&isp->psys->auxdev.dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to get runtime PM\n");
>> +		return 0;
>> +	}
>> +
>> +	ret = ipu_buttress_authenticate(isp);
>> +	if (ret)
>> +		dev_err(dev, "FW authentication failed(%d)\n", ret);
>> +
>> +	pm_runtime_put(&isp->psys->auxdev.dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ipu7_runtime_resume(struct device *dev)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct ipu7_device *isp = pci_get_drvdata(pdev);
>> +	int ret;
>> +
>> +	ipu_buttress_restore(isp);
>> +
>> +	if (isp->ipc_reinit) {
>> +		struct ipu_buttress *b = &isp->buttress;
>> +
>> +		isp->ipc_reinit = false;
>> +		ret = ipu_buttress_ipc_reset(isp, &b->cse);
>> +		if (ret)
>> +			dev_err(dev, "IPC reset protocol
>> failed!\n");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops ipu7_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(&ipu7_suspend, &ipu7_resume)
>> +	SET_RUNTIME_PM_OPS(&ipu7_suspend,	/* Same as in
>> suspend flow */
>> +			   &ipu7_runtime_resume,
>> +			   NULL)
>> +};
>> +
>> +static const struct pci_device_id ipu7_pci_tbl[] = {
>> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU7_PCI_ID)},
>> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU7P5_PCI_ID)},
>> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU8_PCI_ID)},
>> +	{0,}
>> +};
>> +MODULE_DEVICE_TABLE(pci, ipu7_pci_tbl);
>> +
>> +static const struct pci_error_handlers pci_err_handlers = {
>> +	.reset_prepare = ipu7_pci_reset_prepare,
>> +	.reset_done = ipu7_pci_reset_done,
>> +};
>> +
>> +static struct pci_driver ipu7_pci_driver = {
>> +	.name = IPU_NAME,
>> +	.id_table = ipu7_pci_tbl,
>> +	.probe = ipu7_pci_probe,
>> +	.remove = ipu7_pci_remove,
>> +	.driver = {
>> +		.pm = &ipu7_pm_ops,
>> +	},
>> +	.err_handler = &pci_err_handlers,
>> +};
>> +
>> +module_pci_driver(ipu7_pci_driver);
>> +
>> +MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
>> +MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
>> +MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
>> +MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
>> +MODULE_AUTHOR("Intel");
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Intel ipu7 pci driver");
>> diff --git a/drivers/media/pci/intel/ipu7/ipu7.h
>> b/drivers/media/pci/intel/ipu7/ipu7.h
>> new file mode 100644
>> index 000000000000..6f5705f403b7
>> --- /dev/null
>> +++ b/drivers/media/pci/intel/ipu7/ipu7.h
>> @@ -0,0 +1,244 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2013 - 2024 Intel Corporation
>> + */
>> +
>> +#ifndef IPU7_H
>> +#define IPU7_H
>> +
>> +#include <linux/list.h>
>> +#include <linux/pci.h>
>> +#include <linux/types.h>
>> +
>> +#include "ipu7-buttress.h"
>> +
>> +struct ipu7_bus_device;
>> +struct pci_dev;
>> +struct firmware;
>> +
>> +#define IPU_NAME			"intel-ipu7"
>> +#define IPU_MEDIA_DEV_MODEL_NAME	"ipu7"
>> +
>> +#define IPU7_FIRMWARE_NAME		"intel/ipu/ipu7_fw.bin"
>> +#define IPU7P5_FIRMWARE_NAME		"intel/ipu/ipu7ptl_fw.bin"
>> +#define IPU8_FIRMWARE_NAME		"intel/ipu/ipu8_fw.bin"
>> +
>> +#define IPU7_ISYS_NUM_STREAMS		12
>> +
>> +#define IPU7_PCI_ID			0x645d
>> +#define IPU7P5_PCI_ID			0xb05d
>> +#define IPU8_PCI_ID			0xd719
>> +
>> +#define FW_LOG_BUF_SIZE			(2 * 1024 * 1024)
>> +
>> +enum ipu_version {
>> +	IPU_VER_INVALID = 0,
>> +	IPU_VER_7 = 1,
>> +	IPU_VER_7P5 = 2,
>> +	IPU_VER_8 = 3,
>> +};
>> +
>> +static inline bool is_ipu7p5(u8 hw_ver)
>> +{
>> +	return hw_ver == IPU_VER_7P5;
>> +}
>> +
>> +static inline bool is_ipu7(u8 hw_ver)
>> +{
>> +	return hw_ver == IPU_VER_7;
>> +}
>> +
>> +static inline bool is_ipu8(u8 hw_ver)
>> +{
>> +	return hw_ver == IPU_VER_8;
>> +}
>> +
>> +#define IPU_UNIFIED_OFFSET		0
>> +
>> +/*
>> + * ISYS DMA can overshoot. For higher resolutions over allocation is
>> one line
>> + * but it must be at minimum 1024 bytes. Value could be different in
>> + * different versions / generations thus provide it via platform
>> data.
>> + */
>> +#define IPU_ISYS_OVERALLOC_MIN		1024
>> +
>> +#define IPU_FW_CODE_REGION_SIZE		0x1000000 /* 16MB */
>> +#define IPU_FW_CODE_REGION_START	0x4000000 /* 64MB */
>> +#define IPU_FW_CODE_REGION_END		(IPU_FW_CODE_REGION_START
>> +	\
>> +					 IPU_FW_CODE_REGION_SIZE) /*
>> 80MB */
>> +
>> +struct ipu7_device {
>> +	struct pci_dev *pdev;
>> +	struct list_head devices;
>> +	struct ipu7_bus_device *isys;
>> +	struct ipu7_bus_device *psys;
>> +	struct ipu_buttress buttress;
>> +
>> +	const struct firmware *cpd_fw;
>> +	const char *cpd_fw_name;
>> +	/* Only for non-secure mode. */
>> +	void *fw_code_region;
>> +
>> +	void __iomem *base;
>> +	void __iomem *pb_base;
>> +	u8 hw_ver;
>> +	bool ipc_reinit;
>> +	bool secure_mode;
>> +	bool ipu7_bus_ready_to_probe;
>> +};
>> +
>> +#define IPU_DMA_MASK			39
>> +#define IPU_LIB_CALL_TIMEOUT_MS		2000
>> +#define IPU_PSYS_CMD_TIMEOUT_MS		2000
>> +#define IPU_PSYS_OPEN_CLOSE_TIMEOUT_US	50
>> +#define IPU_PSYS_OPEN_CLOSE_RETRY	(10000 /
>> IPU_PSYS_OPEN_CLOSE_TIMEOUT_US)
>> +
>> +#define IPU_ISYS_NAME "isys"
>> +#define IPU_PSYS_NAME "psys"
>> +
>> +#define IPU_MMU_ADDR_BITS		32
>> +/* FW is accessible within the first 2 GiB only in non-secure mode.
>> */
>> +#define IPU_MMU_ADDR_BITS_NON_SECURE	31
>> +
>> +#define IPU7_IS_MMU_NUM			4
>> +#define IPU7_PS_MMU_NUM			4
>> +#define IPU7P5_IS_MMU_NUM		4
>> +#define IPU7P5_PS_MMU_NUM		4
>> +#define IPU8_IS_MMU_NUM			5
>> +#define IPU8_PS_MMU_NUM			4
>> +#define IPU_MMU_MAX_NUM			5 /* max(IS, PS) */
>> +#define IPU_MMU_MAX_TLB_L1_STREAMS	40
>> +#define IPU_MMU_MAX_TLB_L2_STREAMS	40
>> +#define IPU_ZLX_MAX_NUM			32
>> +#define IPU_ZLX_POOL_NUM		8
>> +#define IPU_UAO_PLANE_MAX_NUM		64
>> +
>> +/*
>> + * To maximize the IOSF utlization, IPU need to send requests in
>> bursts.
>> + * At the DMA interface with the buttress, there are CDC FIFOs with
>> burst
>> + * collection capability. CDC FIFO burst collectors have a
>> configurable
>> + * threshold and is configured based on the outcome of performance
>> measurements.
>> + *
>> + * isys has 3 ports with IOSF interface for VC0, VC1 and VC2
>> + * psys has 4 ports with IOSF interface for VC0, VC1w, VC1r and VC2
>> + *
>> + * Threshold values are pre-defined and are arrived at after
>> performance
>> + * evaluations on a type of IPU
>> + */
>> +#define IPU_MAX_VC_IOSF_PORTS		4
>> +
>> +/*
>> + * IPU must configure correct arbitration mechanism related to the
>> IOSF VC
>> + * requests. There are two options per VC0 and VC1 - > 0 means
>> rearbitrate on
>> + * stall and 1 means stall until the request is completed.
>> + */
>> +#define IPU_BTRS_ARB_MODE_TYPE_REARB	0
>> +#define IPU_BTRS_ARB_MODE_TYPE_STALL	1
>> +
>> +/* Currently chosen arbitration mechanism for VC0 */
>> +#define IPU_BTRS_ARB_STALL_MODE_VC0	IPU_BTRS_ARB_MODE_TYPE_REARB
>> +
>> +/* Currently chosen arbitration mechanism for VC1 */
>> +#define IPU_BTRS_ARB_STALL_MODE_VC1	IPU_BTRS_ARB_MODE_TYPE_REARB
>> +
>> +struct ipu7_isys_subdev_pdata;
>> +
>> +/* One L2 entry maps 1024 L1 entries and one L1 entry per page */
>> +#define IPU_MMUV2_L2_RANGE		(1024 * PAGE_SIZE)
>> +/* Max L2 blocks per stream */
>> +#define IPU_MMUV2_MAX_L2_BLOCKS		2
>> +/* Max L1 blocks per stream */
>> +#define IPU_MMUV2_MAX_L1_BLOCKS		16
>> +#define IPU_MMUV2_TRASH_RANGE		(IPU_MMUV2_L2_RANGE *	\
>> +					 IPU_MMUV2_MAX_L2_BLOCKS)
>> +/* Entries per L1 block */
>> +#define MMUV2_ENTRIES_PER_L1_BLOCK	16
>> +#define MMUV2_TRASH_L1_BLOCK_OFFSET	(MMUV2_ENTRIES_PER_L1_BLOCK
>> * PAGE_SIZE)
>> +#define MMUV2_TRASH_L2_BLOCK_OFFSET	IPU_MMUV2_L2_RANGE
>> +
>> +struct ipu7_mmu_hw {
>> +	char name[32];
>> +
>> +	void __iomem *base;
>> +	void __iomem *zlx_base;
>> +	void __iomem *uao_base;
>> +
>> +	u32 offset;
>> +	u32 zlx_offset;
>> +	u32 uao_offset;
>> +
>> +	u32 info_bits;
>> +	u32 refill;
>> +	u32 collapse_en_bitmap;
>> +	u32 at_sp_arb_cfg;
>> +
>> +	u32 l1_block;
>> +	u32 l2_block;
>> +
>> +	u8 nr_l1streams;
>> +	u8 nr_l2streams;
>> +	u32 l1_block_sz[IPU_MMU_MAX_TLB_L1_STREAMS];
>> +	u32 l2_block_sz[IPU_MMU_MAX_TLB_L2_STREAMS];
>> +
>> +	u8 zlx_nr;
>> +	u32 zlx_axi_pool[IPU_ZLX_POOL_NUM];
>> +	u32 zlx_en[IPU_ZLX_MAX_NUM];
>> +	u32 zlx_conf[IPU_ZLX_MAX_NUM];
>> +
>> +	u32 uao_p_num;
>> +	u32 uao_p2tlb[IPU_UAO_PLANE_MAX_NUM];
>> +};
>> +
>> +struct ipu7_mmu_pdata {
>> +	u32 nr_mmus;
>> +	struct ipu7_mmu_hw mmu_hw[IPU_MMU_MAX_NUM];
>> +	int mmid;
>> +};
>> +
>> +struct ipu7_isys_csi2_pdata {
>> +	void __iomem *base;
>> +};
>> +
>> +struct ipu7_isys_internal_csi2_pdata {
>> +	u32 nports;
>> +	u32 *offsets;
>> +	u32 gpreg;
>> +};
>> +
>> +struct ipu7_hw_variants {
>> +	unsigned long offset;
>> +	u32 nr_mmus;
>> +	struct ipu7_mmu_hw mmu_hw[IPU_MMU_MAX_NUM];
>> +	u8 cdc_fifos;
>> +	u8 cdc_fifo_threshold[IPU_MAX_VC_IOSF_PORTS];
>> +	u32 dmem_offset;
>> +	u32 spc_offset;	/* SPC offset from psys base */
>> +};
>> +
>> +struct ipu_isys_internal_pdata {
>> +	struct ipu7_isys_internal_csi2_pdata csi2;
>> +	struct ipu7_hw_variants hw_variant;
>> +	u32 num_parallel_streams;
>> +	u32 isys_dma_overshoot;
>> +};
>> +
>> +struct ipu7_isys_pdata {
>> +	void __iomem *base;
>> +	const struct ipu_isys_internal_pdata *ipdata;
>> +};
>> +
>> +struct ipu_psys_internal_pdata {
>> +	struct ipu7_hw_variants hw_variant;
>> +};
>> +
>> +struct ipu7_psys_pdata {
>> +	void __iomem *base;
>> +	const struct ipu_psys_internal_pdata *ipdata;
>> +};
>> +
>> +int request_cpd_fw(const struct firmware **firmware_p, const char
>> *name,
>> +		   struct device *device);
>> +void ipu_internal_pdata_init(struct ipu_isys_internal_pdata
>> *isys_ipdata,
>> +			     struct ipu_psys_internal_pdata
>> *psys_ipdata);
>> +void ipu7_dump_fw_error_log(const struct ipu7_bus_device *adev);
>> +#endif /* IPU7_H */
> 

-- 
Best regards,
Bingbu Cao

