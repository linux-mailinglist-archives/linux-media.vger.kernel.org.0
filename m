Return-Path: <linux-media+bounces-48972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBE8CC6B99
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 10:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F173B313A6D5
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 09:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4768633B94A;
	Wed, 17 Dec 2025 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="Uo1Er425"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB7519D092;
	Wed, 17 Dec 2025 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765962150; cv=pass; b=Y+HoS4j4nPTPdZPgqAm/xToyaNw4g3VM3pGt5bUuK3gA6brRfHonT4CCblOYt/rs6kanbjho/ShzZT7eQoU4wVOBx+W4ChWDy6xPrMBUae7p7zrjBIAC3KAXg3m61Q19A47kgOi+WMQZLaDQPZaMCqN3V1LVTXAsj8b1yk8L/t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765962150; c=relaxed/simple;
	bh=RVmO9lW6eehwdBNV5RAUpbB0ZvFmggl7YobpAFotihI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8sHzkc4PlkMo10pb5vIQEJEByaov+brmrUvTxRoYZs5FN3b5U32ao8XvQ5K5cumCOrArePP575HMpIwiYG4/K1UhbpFjN5+9CR6qy1H7tKvKHTT5VvJOfqYocC/wV0oew5gMfbmBE/fOK7vOgNmp7PDafy+oVCrOxjqt7LJedo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=Uo1Er425; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765962118; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MQOr1bkaW6D53AOQOMtEz2hCoqHSLi7Z5Ma9AsaT6F9wPbbfKL0l+Zm0ZSZoNnpzd+1Ymh7JUZrd/cuPrrVw9eDlmrRb8TdauYvDcd9b8Xwn3hDoIovBlY14lQBZV8vWiDTUma6Zbvx/uTKxBOZNuZrT+BY0qH2cLoqlH1nNsys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765962118; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CmX36RAUhkyAzoQriRKH2n45J/o9UqUfaBfGbZAHOVo=; 
	b=U6d1R/IGFZY1Kwit84IuMtg8nMQtlINXU3reDKItzztfGRi31vhYJEDuc/z3gRFIaxrfI3SgrzaRGH87g9dEMl4M6EWfbLEIZwost6jnHXitEojGdmFsa+LExDdPOpsN8UOuQMsv4/GBUWaghDEmP46N9C03JICSZqkgjwd/0zU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765962118;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CmX36RAUhkyAzoQriRKH2n45J/o9UqUfaBfGbZAHOVo=;
	b=Uo1Er425ZxLLeDatB8rAg48EZeP7+XgfT02adtU+dmlYUgKN4KNFrAhTIhtmWR/A
	GHBwUHAh1chGVPnBLCE0iQ/SXK3WOg8vDAVZvXEU4K0ZoJtnIDLhZHQYvvg/Mbsrp+R
	DrRPSu0zMFLgz+/KM5EnFkg0QUPTxIYIUtktIync=
Received: by mx.zohomail.com with SMTPS id 1765962115824604.2212636872432;
	Wed, 17 Dec 2025 01:01:55 -0800 (PST)
Message-ID: <913d3056-0619-4e05-ac5f-1a21cf0e47c9@collabora.com>
Date: Wed, 17 Dec 2025 10:01:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/7] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
To: kernel test robot <lkp@intel.com>, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-media@vger.kernel.org, kernel@collabora.com
References: <20251215085349.10155-6-benjamin.gaignard@collabora.com>
 <202512162315.lcRwm6Mr-lkp@intel.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <202512162315.lcRwm6Mr-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 16/12/2025 à 16:27, kernel test robot a écrit :
> Hi Benjamin,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.19-rc1 next-20251216]
> [cannot apply to robh/for-next rockchip/for-next arm64/for-next/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-vendor-prefixes-Add-Verisilicon/20251215-165740
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20251215085349.10155-6-benjamin.gaignard%40collabora.com
> patch subject: [PATCH v10 5/7] media: verisilicon: AV1: Restore IOMMU context before decoding a frame
> config: arm-randconfig-r063-20251216 (https://download.01.org/0day-ci/archive/20251216/202512162315.lcRwm6Mr-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162315.lcRwm6Mr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512162315.lcRwm6Mr-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> drivers/iommu/vsi-iommu.c:231:3: error: call to undeclared function 'report_iommu_fault'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       231 |                 report_iommu_fault(iommu->domain, iommu->dev, iova, status);
>           |                 ^
>>> drivers/iommu/vsi-iommu.c:245:21: error: no member named 'iommu_fwnode' in 'struct iommu_fwspec'
>       245 |                                                              fwspec->iommu_fwnode);
>           |                                                              ~~~~~~  ^
>>> drivers/iommu/vsi-iommu.c:254:28: error: call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       254 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>           |                                   ^
>     drivers/iommu/vsi-iommu.c:254:28: note: did you mean 'dev_iommu_fwspec_get'?
>     include/linux/iommu.h:1457:36: note: 'dev_iommu_fwspec_get' declared here
>      1457 | static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
>           |                                    ^
>>> drivers/iommu/vsi-iommu.c:254:20: error: incompatible integer to pointer conversion initializing 'struct vsi_iommu *' with an expression of type 'int' [-Wint-conversion]
>       254 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>           |                           ^       ~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/iommu/vsi-iommu.c:496:28: error: call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       496 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>           |                                   ^
>     drivers/iommu/vsi-iommu.c:496:20: error: incompatible integer to pointer conversion initializing 'struct vsi_iommu *' with an expression of type 'int' [-Wint-conversion]
>       496 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>           |                           ^       ~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/iommu/vsi-iommu.c:519:38: error: variable has incomplete type 'const struct iommu_domain_ops'
>       519 | static const struct iommu_domain_ops vsi_identity_ops = {
>           |                                      ^
>     include/linux/iommu.h:40:8: note: forward declaration of 'struct iommu_domain_ops'
>        40 | struct iommu_domain_ops;
>           |        ^
>     drivers/iommu/vsi-iommu.c:571:28: error: call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       571 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>           |                                   ^
>     drivers/iommu/vsi-iommu.c:571:20: error: incompatible integer to pointer conversion initializing 'struct vsi_iommu *' with an expression of type 'int' [-Wint-conversion]
>       571 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>           |                           ^       ~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/iommu/vsi-iommu.c:644:2: error: call to undeclared function 'dev_iommu_priv_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       644 |         dev_iommu_priv_set(dev, iommu);
>           |         ^
>     drivers/iommu/vsi-iommu.c:650:28: error: call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       650 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>           |                                   ^
>     drivers/iommu/vsi-iommu.c:650:20: error: incompatible integer to pointer conversion initializing 'struct vsi_iommu *' with an expression of type 'int' [-Wint-conversion]
>       650 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>           |                           ^       ~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/iommu/vsi-iommu.c:657:35: error: passing 'const uint32_t[16]' (aka 'const unsigned int[16]') to parameter of type 'u32 *' (aka 'unsigned int *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>       657 |         return iommu_fwspec_add_ids(dev, args->args, 1);
>           |                                          ^~~~~~~~~~
>     include/linux/iommu.h:1451:65: note: passing argument to parameter 'ids' here
>      1451 | static inline int iommu_fwspec_add_ids(struct device *dev, u32 *ids,
>           |                                                                 ^
>>> drivers/iommu/vsi-iommu.c:667:18: error: use of undeclared identifier 'generic_single_device_group'
>       667 |         .device_group = generic_single_device_group,
>           |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/iommu/vsi-iommu.c:669:25: error: variable has incomplete type 'const struct iommu_domain_ops'
>       669 |         .default_domain_ops = &(const struct iommu_domain_ops) {
>           |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       670 |                 .attach_dev             = vsi_iommu_attach_device,
>           |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       671 |                 .map_pages              = vsi_iommu_map,
>           |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       672 |                 .unmap_pages            = vsi_iommu_unmap,
>           |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       673 |                 .flush_iotlb_all        = vsi_iommu_flush_tlb_all,
>           |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       674 |                 .iova_to_phys           = vsi_iommu_iova_to_phys,
>           |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       675 |                 .free                   = vsi_iommu_domain_free,
>           |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       676 |         }
>           |         ~
>     include/linux/iommu.h:40:8: note: forward declaration of 'struct iommu_domain_ops'
>        40 | struct iommu_domain_ops;
>           |        ^
>     15 errors generated.
>
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for VSI_IOMMU
>     Depends on [n]: IOMMU_SUPPORT [=n] && (ARCH_ROCKCHIP [=n] && ARM64 || COMPILE_TEST [=y])
>     Selected by [m]:
>     - VIDEO_HANTRO_ROCKCHIP [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_HANTRO [=m] && (ARCH_ROCKCHIP [=n] || COMPILE_TEST [=y])VSI_IOMMU

I will make VIDEO_HANTRO_ROCKCHIP depends on VSI_IOMMU instead of select it on the next version.
Regards,
Benjamin

>
>
> vim +/report_iommu_fault +231 drivers/iommu/vsi-iommu.c
>
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  214
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  215  static irqreturn_t vsi_iommu_irq(int irq, void *dev_id)
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  216  {
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  217  	struct vsi_iommu *iommu = dev_id;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  218  	unsigned long flags;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  219  	dma_addr_t iova;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  220  	u32 status;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  221
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  222  	if (pm_runtime_resume_and_get(iommu->dev) < 0)
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  223  		return IRQ_NONE;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  224
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  225  	spin_lock_irqsave(&iommu->lock, flags);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  226
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  227  	status = readl(iommu->regs + VSI_MMU_STATUS_BASE);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  228  	if (status & VSI_MMU_IRQ_MASK) {
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  229  		dev_err(iommu->dev, "unexpected int_status=%08x\n", status);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  230  		iova = readl(iommu->regs + VSI_MMU_PAGE_FAULT_ADDR);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15 @231  		report_iommu_fault(iommu->domain, iommu->dev, iova, status);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  232  	}
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  233  	writel(0, iommu->regs + VSI_MMU_STATUS_BASE);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  234
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  235  	spin_unlock_irqrestore(&iommu->lock, flags);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  236  	pm_runtime_put_autosuspend(iommu->dev);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  237
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  238  	return IRQ_HANDLED;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  239  }
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  240
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  241  static struct vsi_iommu *vsi_iommu_get_from_dev(struct device *dev)
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  242  {
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  243  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  244  	struct device *iommu_dev = bus_find_device_by_fwnode(&platform_bus_type,
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15 @245  							     fwspec->iommu_fwnode);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  246
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  247  	put_device(iommu_dev);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  248
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  249  	return iommu_dev ? dev_get_drvdata(iommu_dev) : NULL;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  250  }
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  251
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  252  static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  253  {
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15 @254  	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  255  	struct vsi_iommu_domain *vsi_domain;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  256
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  257  	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  258  	if (!vsi_domain)
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  259  		return NULL;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  260
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  261  	vsi_domain->dev = iommu->dev;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  262  	spin_lock_init(&vsi_domain->lock);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  263
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  264  	/*
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  265  	 * iommu use a 2 level pagetable.
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  266  	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  267  	 * Allocate one 4 KiB page for each table.
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  268  	 */
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  269  	vsi_domain->dt = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  270  					      SPAGE_SIZE);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  271  	if (!vsi_domain->dt)
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  272  		goto err_free_domain;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  273
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  274  	vsi_domain->dt_dma = dma_map_single(vsi_domain->dev, vsi_domain->dt,
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  275  					    SPAGE_SIZE, DMA_TO_DEVICE);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  276  	if (dma_mapping_error(vsi_domain->dev, vsi_domain->dt_dma)) {
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  277  		dev_err(dev, "DMA map error for DT\n");
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  278  		goto err_free_dt;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  279  	}
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  280
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  281  	vsi_domain->pta = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  282  					       SPAGE_SIZE);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  283  	if (!vsi_domain->pta)
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  284  		goto err_unmap_dt;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  285
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  286  	vsi_domain->pta[0] = vsi_mk_pta(vsi_domain->dt_dma);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  287  	vsi_domain->pta_dma = dma_map_single(vsi_domain->dev, vsi_domain->pta,
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  288  					     SPAGE_SIZE, DMA_TO_DEVICE);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  289  	if (dma_mapping_error(vsi_domain->dev, vsi_domain->pta_dma)) {
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  290  		dev_err(dev, "DMA map error for PTA\n");
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  291  		goto err_free_pta;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  292  	}
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  293
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  294  	INIT_LIST_HEAD(&vsi_domain->iommus);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  295
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  296  	vsi_domain->domain.geometry.aperture_start = 0;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  297  	vsi_domain->domain.geometry.aperture_end   = DMA_BIT_MASK(32);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  298  	vsi_domain->domain.geometry.force_aperture = true;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  299  	vsi_domain->domain.pgsize_bitmap	   = SZ_4K;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  300
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  301  	return &vsi_domain->domain;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  302
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  303  err_free_pta:
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  304  	iommu_free_pages(vsi_domain->pta);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  305  err_unmap_dt:
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  306  	dma_unmap_single(vsi_domain->dev, vsi_domain->dt_dma,
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  307  			 SPAGE_SIZE, DMA_TO_DEVICE);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  308  err_free_dt:
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  309  	iommu_free_pages(vsi_domain->dt);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  310  err_free_domain:
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  311  	kfree(vsi_domain);
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  312
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  313  	return NULL;
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  314  }
> b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  315
>

