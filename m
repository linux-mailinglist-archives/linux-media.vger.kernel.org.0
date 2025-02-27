Return-Path: <linux-media+bounces-27109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730EAA473D0
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 04:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD6116B360
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 03:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B551D90DB;
	Thu, 27 Feb 2025 03:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RULBCZH+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11279270031
	for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 03:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740628360; cv=none; b=jBC2CXqDXSYJgnNgJ7nBsJYTlj0x+S3OSq8vYb9Y4bvvTpFrJ1Wsh5cER/CVsmXZXYxnI4JlXzXXOUlNFI/0xUpf40v58YQnl0PBtya+YGhX4ACoBUhpY9iGrrmYR7j9/DcXEh7Hwr9IeKJ9eYVrUwIo+EntiLOevWheg+sBgT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740628360; c=relaxed/simple;
	bh=my8yb9VwYf4jNugnX4MxHQlcOcQaFsLau70l7QeTCQU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Dj44noGd7L8o0pNo83N2Q3Qz7Y4RZPwaN7dnPAkT/4zFLLa3bvOb4hc+tFWomwaOndDatV4boKk8Gebxbcuhdb4Dz7IM2ZdChAPQUooTTEPgvwo632rNBros6wUUwLWPnEsSjcM8Uz2ap+Syc8RA7Pbo3qK2AG4am1P/3ThRFC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RULBCZH+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740628359; x=1772164359;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=my8yb9VwYf4jNugnX4MxHQlcOcQaFsLau70l7QeTCQU=;
  b=RULBCZH+N6+h0jmcT6KcHTqC4OEOaNq6BeWGioD5yqs7r2m5EYhq6fFU
   c1pOk0g+6dZ8xFgde5JqZEdEjA8YPc6GtTQwyCdG++s+8V4cmZ9Krsa7I
   4/Vu57uqnZfxQQzuFpaj10O13rc/u4+pK2v7dAbh0gs87G8VOQbPOnRXh
   RkxGlUhqEBRhnx2IZUBpFm3BtG8OR1kARI+YJhScFcLugNOvliljtYXBf
   U9ZZxvvfBikpSPBfB55j4Fra3Ny7knM5OICwS3Pw+JWV4/U9wArtMp9pi
   p2HhMsdQtJ4S06EAFSJnAO2NghOFHIM0OQvjxe/OiXP2Qmi40P3/+6f9S
   g==;
X-CSE-ConnectionGUID: Et4fPd/BS/yY1j8JdTR3Kg==
X-CSE-MsgGUID: wQwyuCi1RVekHIxSz4Te8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="66876250"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="66876250"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 19:52:38 -0800
X-CSE-ConnectionGUID: mJqrYJwDTxW9GrEhSWxNGw==
X-CSE-MsgGUID: IBBRQqhtQF2ZJjk72LGZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116776140"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 19:52:34 -0800
Subject: Re: [RFC PATCH 2/7] media: ipu7: add Intel IPU7 PCI device driver
To: phasta@kernel.org, bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, hdegoede@redhat.com
Cc: hans@hansg.org, stanislaw.gruszka@linux.intel.com, jerry.w.hu@intel.com,
 tian.shu.qiu@intel.com, daxing.li@intel.com, hao.yao@intel.com
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
 <20250221075252.3347582-3-bingbu.cao@intel.com>
 <5d9f9a8a877bc86e6780f3357c01e1e92150d19d.camel@mailbox.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <f608a81d-a957-5b49-8840-df9021f065b8@linux.intel.com>
Date: Thu, 27 Feb 2025 11:47:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <5d9f9a8a877bc86e6780f3357c01e1e92150d19d.camel@mailbox.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/26/25 6:00 PM, Philipp Stanner wrote:
> On Fri, 2025-02-21 at 15:52 +0800, bingbu.cao@intel.com wrote:
>> +
> 
> [SNIP]
> 
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
> 
> Oh and btw, since I just recognized this:
> PCI request functions must always get the *driver's* name as their last
> parameter.
> 
> This string will be printed if there is a collision, i.e., when another
> driver tries to request the same resource. The output is only useful
> when the print contains the name of the party who actually stole your
> PCI region. Saying on which PCI device the region is won't be helpful.
> 
> 
> btw, did you watch my Fosdem talk before or after I answered to this
> RFC? ;)

After. ;)

> 
> 
> Thx
> P.
> 
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "Failed to I/O memory remapping
>> (%d)\n",
>> +				     ret);
>> +
>> +	iomap = pcim_iomap_table(pdev);
>> +	if (!iomap)
>> +		return dev_err_probe(dev, -ENODEV, "Failed to iomap
>> table\n");
>> +
> 
> 

-- 
Best regards,
Bingbu Cao

