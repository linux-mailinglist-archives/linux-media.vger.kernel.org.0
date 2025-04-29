Return-Path: <linux-media+bounces-31263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD140AA0512
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 09:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65EFD1A84205
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 07:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A355279786;
	Tue, 29 Apr 2025 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbPbhMJV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0307927781F
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 07:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913478; cv=none; b=eGeHoKKqGHe4CAa7yH4z0v1lx12+2HslofivynJtFdkMk10RarwUm9ki5AZqWbZJUTufYxRzpE3PwrM8FM9nLiuUcMKCQzM2FEJ7PQDMAYeakbjRvpS3ohWev/lEbYyHRHwPPpr4VQWYbIUPR69k+4ZGw1i1sBuowzjq8mIPDIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913478; c=relaxed/simple;
	bh=bdX4vOH+ntbpcw6iIwdBX0HAGzvJboG9cuO4hRxMOnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLaDpzHP9SM/hsnARCI4SK3pivgb6BhU3U6RPKLCC+LDqyUahZv8mlCd5/xSsyE8EfMDc+7/nfwUlWyI0lRD2gqfiFdvf+OvK+D74ftERfY97tu09SV7iEQcE6S24pmz4iSAYnVOXeqXlfU4pLAS6C9F9hcegfKNYUOGsCy6pCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbPbhMJV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745913478; x=1777449478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bdX4vOH+ntbpcw6iIwdBX0HAGzvJboG9cuO4hRxMOnQ=;
  b=HbPbhMJVbZjZVkmrW/yrKE7nJWoTGV6/KBHp5QjUs+BNkV59cYI4ubIg
   L2BNw9MlDBTulMOyGWKq67Km/KYJV67ozCY2xSYIkgjoYB3wRkzIxbIkf
   Sl6YNFvgvOy/6L8bFYiunkCfKEcC62xKng9nVzaaW12aiojUwmiIqpDzI
   LmBth+KFsjnJxXqd+E5vvNn525rmuymybBY59hSOJD8HMh6SR2bDiJ0on
   IBrj/v2OZxNxDwqc699L7G4W8T+1Ua+xgV4SnAknYU8Dvxv7RW3WRm1PV
   R3UVW6FHASKUs+6LVuRBrdOfnEV4Rtu0mDDlnZhJOMvkEVSZeYo+YEmlC
   w==;
X-CSE-ConnectionGUID: Q4jx2hBaR8q11y01S3MJ7g==
X-CSE-MsgGUID: U59vtKoZSH2T6mztVr4iAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58513030"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58513030"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:57:57 -0700
X-CSE-ConnectionGUID: FzUfVZetTP+sBDR6v/dVgA==
X-CSE-MsgGUID: gFcLo8yFST26wEpCHYF8HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="133637802"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.84.5])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:57:53 -0700
Date: Tue, 29 Apr 2025 09:57:51 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com, phasta@mailbox.org,
	helgaas@kernel.org, jerry.w.hu@intel.com, hao.yao@intel.com,
	tian.shu.qiu@intel.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH 1/8] media: Rename the IPU PCI device table header and
 add IPU7 PCI IDs
Message-ID: <aBCGf66Wy2+kU3nl@linux.intel.com>
References: <20250429032841.115107-1-bingbu.cao@intel.com>
 <20250429032841.115107-2-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429032841.115107-2-bingbu.cao@intel.com>

On Tue, Apr 29, 2025 at 11:28:34AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Rename the IPU PCI device table header file and add the IPU7 PCI device
> IDs.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
>  drivers/media/pci/intel/ipu6/ipu6.c                |  2 +-
>  .../media/{ipu6-pci-table.h => ipu-pci-table.h}    | 14 +++++++++++---
>  2 files changed, 12 insertions(+), 4 deletions(-)
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
> +	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7_PCI_ID)},
> +	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5_PCI_ID)},
> +	{ }
> +};
> +#endif /* __IPU_PCI_TBL_H__ */
> -- 
> 2.34.1
> 

