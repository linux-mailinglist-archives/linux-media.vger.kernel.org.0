Return-Path: <linux-media+bounces-33511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBDCAC65C3
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 11:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 906771BC3141
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 09:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7972777F3;
	Wed, 28 May 2025 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmcWVOQa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871BD275100
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424183; cv=none; b=iwBtvPSA27qbDk9NafPTQ6a5Y2I0friYyLMsPjunkHoCUCzyfHrH3C4VR8Nba6pR4Xhv27GRtEUr5VspCm4ntz5OvO/3WAMTt/nBumOJL1MkfuGXDAEpwUDDprggJEawR89nnxFGhQEUGmA/XBM8ztYNXKQsM/8RXGZE/UtkWWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424183; c=relaxed/simple;
	bh=gO9MYWqYmVRhiUTntVT8R6/c5X6bFfabnimhHVh2C8I=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dKazcY3a/cb1edNqg6Z2PmD3EuUTQ8NZqKxQNsQNNMPq1ZAtXfvfXa/rjQwT551b5hDgClQQgmVfQDg67HEzAWU1oaDoIa5gQ+fQbFU/ROQ6ncp4QwrFuuTUYmKSulNoB9Ft6BP7mUwlLtB3NvMFhSrI9UxLV3pDf62pTFq8Cw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmcWVOQa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748424181; x=1779960181;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=gO9MYWqYmVRhiUTntVT8R6/c5X6bFfabnimhHVh2C8I=;
  b=MmcWVOQaJPmyCd9KSeu3Znq60eui/DOvwxrRFR4lIAONyz4+D/rUT3zF
   4Cnxo5DiVxfSKjxhq9Fz7JUlRNvwMmNDkTQx5UO66p4yGYTXos+bhIptJ
   Ei+0EXnCstzPSyc4w48pmeTJpHZaYXd7FyraLvkRMTt30Mpxy8YTTBZpS
   len1T4Wnthf/ushqpYAZreNSiQAJZmzCGrP4gWhyE17f2ie/VzO7Ah9jC
   mfKLNzIBf8O9Jb6rTiV5lNgDeYOx0eGot+ws6L0iQjOUEBbL9a3CyJ71G
   RfmQh/GhScgYQN0+TbTZjqNl4GsR2jHJkoHtcKMb1TpLuDR74csGVBfnk
   g==;
X-CSE-ConnectionGUID: tGF4CfQESHiSS7IZKTR8nQ==
X-CSE-MsgGUID: vVOGbMdzSRGYrj49PFLAAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61072975"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61072975"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 02:22:51 -0700
X-CSE-ConnectionGUID: UJfY9DAcQaCjHbaz1YIoEA==
X-CSE-MsgGUID: zKyPc9w3S7Wfue5U/1f1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143156841"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 02:22:49 -0700
Subject: Re: [PATCH v2 1/8] media: Rename the IPU PCI device table header and
 add IPU7 PCI IDs
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, stanislaw.gruszka@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com, jerry.w.hu@intel.com,
 hao.yao@intel.com, tian.shu.qiu@intel.com
References: <20250528075146.1763079-1-bingbu.cao@intel.com>
 <20250528075146.1763079-2-bingbu.cao@intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <eec99ae8-d168-428b-c713-e00ab7de0572@linux.intel.com>
Date: Wed, 28 May 2025 17:18:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250528075146.1763079-2-bingbu.cao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Sakari,

On 5/28/25 3:51 PM, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Rename the IPU PCI device table header file and add the IPU7 PCI device
> IDs.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6.c                |  2 +-
>  drivers/media/pci/intel/ivsc/mei_csi.c             |  2 +-
>  .../media/{ipu6-pci-table.h => ipu-pci-table.h}    | 14 +++++++++++---
>  3 files changed, 13 insertions(+), 5 deletions(-)
>  rename include/media/{ipu6-pci-table.h => ipu-pci-table.h} (68%)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index 277af7cda8ee..aa859220ba94 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -21,7 +21,7 @@
>  #include <linux/types.h>
>  
>  #include <media/ipu-bridge.h>
> -#include <media/ipu6-pci-table.h>
> +#include <media/ipu-pci-table.h>
>  
>  #include "ipu6.h"
>  #include "ipu6-bus.h"
> diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
> index 92d871a378ba..47fc48c7619b 100644
> --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> @@ -27,7 +27,7 @@
>  #include <linux/workqueue.h>
>  
>  #include <media/ipu-bridge.h>
> -#include <media/ipu6-pci-table.h>
> +#include <media/ipu-pci-table.h>
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
> diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu-pci-table.h
> similarity index 68%
> rename from include/media/ipu6-pci-table.h
> rename to include/media/ipu-pci-table.h
> index 0899d9d2f978..528080c6f742 100644
> --- a/include/media/ipu6-pci-table.h
> +++ b/include/media/ipu-pci-table.h
> @@ -3,8 +3,8 @@
>   * Copyright (C) 2024 Intel Corporation
>   */
>  
> -#ifndef __IPU6_PCI_TBL_H__
> -#define __IPU6_PCI_TBL_H__
> +#ifndef __IPU_PCI_TBL_H__
> +#define __IPU_PCI_TBL_H__
>  
>  #include <linux/pci.h>
>  
> @@ -15,6 +15,9 @@
>  #define PCI_DEVICE_ID_INTEL_IPU6EP_RPLP		0xa75d
>  #define PCI_DEVICE_ID_INTEL_IPU6EP_MTL		0x7d19
>  
> +#define PCI_DEVICE_ID_INTEL_IPU7_PCI_ID		0x645d
> +#define PCI_DEVICE_ID_INTEL_IPU7P5_PCI_ID	0xb05d
> +
>  static const struct pci_device_id ipu6_pci_tbl[] = {
>  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
>  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE) },
> @@ -25,4 +28,9 @@ static const struct pci_device_id ipu6_pci_tbl[] = {
>  	{ }
>  };
>  
> -#endif /* __IPU6_PCI_TBL_H__ */
> +static const struct pci_device_id ipu7_pci_tbl[] = {

I got media-ci build errors:
In file included from drivers/media/pci/intel/ivsc/mei_csi.c:30:
./include/media/ipu-pci-table.h:31:35: warning: ‘ipu7_pci_tbl’
defined but not used [-Wunused-const-variable=]

Do you think is it OK using 1 table to cover IPU6 and IPU7?

> +	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7_PCI_ID)},
> +	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5_PCI_ID)},
> +	{ }
> +};
> +#endif /* __IPU_PCI_TBL_H__ */
> 

-- 
Best regards,
Bingbu Cao

