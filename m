Return-Path: <linux-media+bounces-26890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF76A434E0
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 07:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C758C17A1D5
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 06:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB752566FC;
	Tue, 25 Feb 2025 06:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1Zd3xK3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16521DFDE
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 06:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740463249; cv=none; b=FoOfp5DlJihhA4ctom1RI3sUw5CBkFyp0zhkUVWJhNC2s9gFPcSiirfNMfXyoQLZlFO7LvBE44yfgCPG1gdksvkDqBSAyd1Y/4aEyIRHGN1qq2Kiu1qJgFH/ye7Cm4/ZD5TVPIwGiwJW/BMSi7zpJ6jD29FvxZyW+kBMQy9/xVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740463249; c=relaxed/simple;
	bh=i+my42sHcr8A24cm78I5KRLy+5yo2gaon/1pzFJmD7Q=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=N6RXA/ITpeAVeydqF4fpJ2QOAODsESOxMhCbqbqdAslNylwn91hYcbd9IVILH4CPiJMrEFbnGMHFr3TYc9GgIfk9bJaMmEbhkFIZWTXK1uBL7PM8+p1tRQdPtZquG0BF8qDcFXqRktpXkMNZIKx3gwHp29Sp2weAzkNzz3ZeeP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1Zd3xK3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740463249; x=1771999249;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=i+my42sHcr8A24cm78I5KRLy+5yo2gaon/1pzFJmD7Q=;
  b=W1Zd3xK3FLhXOQA7XZaCMd/2q1H/GSQZnh0Ni4yWLByIOdJ7jdKk53Dz
   w3YvAMGJ8ST996UNFecUNJGzVR5iJkL83cVIwpWKyJ0KdgiiTYWaz0Ek7
   Q70wiqoz1LN3aEOofJO0vnaBb5hHJ/k6FPKltSS2yBIdK0Oc5Syiis9jZ
   ZcGNdFhkcbq/WI9Xt2x4b4itpcLLfyJrKcwu1LsNjsBI7mCrJLTqZ4LH7
   rzSkCA0/Xv23Ap9MHOaUVIx88v2Joa0YbVAHJz7Uh+da0DDioJTv4hgz+
   iWJl/yF2w8gpXmhcWWeOgFZmHfQfDeBvyJU7fW9VH/lwnFzGmXb0Jmezc
   Q==;
X-CSE-ConnectionGUID: CZuoskw0QZW9ncfa+FbcDA==
X-CSE-MsgGUID: Fl+9+2r/S0Kag6ydA/BW5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45036811"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="45036811"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 22:00:48 -0800
X-CSE-ConnectionGUID: b5/KrRZ8SOSfLYeDMRW9Ng==
X-CSE-MsgGUID: W3POHpoWTKe8o44Ai9nqaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="116917497"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 22:00:46 -0800
Subject: Re: [RFC PATCH 7/7] media: ipu7: add Makefile and Kconfig for IPU7
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, hdegoede@redhat.com
Cc: hans@hansg.org, stanislaw.gruszka@linux.intel.com
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
 <20250221075252.3347582-8-bingbu.cao@intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <1f46cbd1-384a-44f8-4ec1-414409ded771@linux.intel.com>
Date: Tue, 25 Feb 2025 13:55:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250221075252.3347582-8-bingbu.cao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

On 2/21/25 3:52 PM, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Add Kconfig and Makefile for IPU7 driver and also update
> the Makefile to build the IPU7 driver.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/Kconfig       |  1 +
>  drivers/media/pci/intel/Makefile      |  1 +
>  drivers/media/pci/intel/ipu7/Kconfig  | 18 ++++++++++++++++++
>  drivers/media/pci/intel/ipu7/Makefile | 23 +++++++++++++++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu7/Kconfig
>  create mode 100644 drivers/media/pci/intel/ipu7/Makefile
> 
> diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
> index d9fcddce028b..948cda08fff5 100644
> --- a/drivers/media/pci/intel/Kconfig
> +++ b/drivers/media/pci/intel/Kconfig
> @@ -2,6 +2,7 @@
>  
>  source "drivers/media/pci/intel/ipu3/Kconfig"
>  source "drivers/media/pci/intel/ipu6/Kconfig"
> +source "drivers/media/pci/intel/ipu7/Kconfig"
>  source "drivers/media/pci/intel/ivsc/Kconfig"
>  
>  config IPU_BRIDGE
> diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
> index 3a2cc6567159..ff0fea13422d 100644
> --- a/drivers/media/pci/intel/Makefile
> +++ b/drivers/media/pci/intel/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_IPU_BRIDGE) += ipu-bridge.o
>  obj-y	+= ipu3/
>  obj-y	+= ivsc/
>  obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= ipu6/
> +obj-$(CONFIG_VIDEO_INTEL_IPU7)	+= ipu7/
> diff --git a/drivers/media/pci/intel/ipu7/Kconfig b/drivers/media/pci/intel/ipu7/Kconfig
> new file mode 100644
> index 000000000000..b759d5e6c3a9
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu7/Kconfig
> @@ -0,0 +1,18 @@
> +config VIDEO_INTEL_IPU7
> +	tristate "Intel IPU7 driver"
> +	depends on ACPI || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	depends on X86 && X86_64 && HAS_DMA

depends on X86 && HAS_DMA

> +	depends on IPU_BRIDGE || !IPU_BRIDGE
> +	select AUXILIARY_BUS
> +	select IOMMU_IOVA
> +	select VIDEO_V4L2_SUBDEV_API
> +	select MEDIA_CONTROLLER
> +	select VIDEOBUF2_DMA_CONTIG

This should be VIDEOBUF2_DMA_SG, I forgot to amend it.

> +	select V4L2_FWNODE
> +	help
> +	  This is the 7th Gen Intel Image Processing Unit, found in Intel SoCs
> +	  and used for capturing images and video from camera sensors.
> +
> +	  To compile this driver, say Y here! It contains 2 modules -
> +	  intel_ipu7 and intel_ipu7_isys.
> diff --git a/drivers/media/pci/intel/ipu7/Makefile b/drivers/media/pci/intel/ipu7/Makefile
> new file mode 100644
> index 000000000000..9a15d119026a
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu7/Makefile
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2017 - 2024 Intel Corporation.
> +
> +intel-ipu7-objs				+= ipu7.o \
> +					   ipu7-bus.o \
> +					   ipu7-dma.o \
> +					   ipu7-mmu.o \
> +					   ipu7-buttress.o \
> +					   ipu7-cpd.o \
> +					   ipu7-syscom.o \
> +					   ipu7-boot.o
> +
> +obj-$(CONFIG_VIDEO_INTEL_IPU7)		+= intel-ipu7.o
> +
> +intel-ipu7-isys-objs			+= ipu7-isys.o \
> +					   ipu7-isys-csi2.o \
> +					   ipu7-isys-csi-phy.o \
> +					   ipu7-fw-isys.o \
> +					   ipu7-isys-video.o \
> +					   ipu7-isys-queue.o \
> +					   ipu7-isys-subdev.o
> +
> +obj-$(CONFIG_VIDEO_INTEL_IPU7)		+= intel-ipu7-isys.o
> 

-- 
Best regards,
Bingbu Cao

