Return-Path: <linux-media+bounces-39999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC2EB287B3
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 23:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 627971C80BF3
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 21:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A460C242D99;
	Fri, 15 Aug 2025 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSjDMK99"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E5D72606
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 21:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755293192; cv=none; b=PMkb7ChNUziRQsQBxujnkUnMYiG6YOrROyD9ZL1sdENqNS5ReI1fwERBZmGG+CcFPpdAPkUFaCb5UzdaFyEYeJX/H/7pO8omBMYLQgf9uQPcGBWNaFxEZ1KnKn3lpfrJ7GbUOJi9WkhpVpsWq5J/WB/BEIdmDE5CUyMPcLSE6lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755293192; c=relaxed/simple;
	bh=NdqI/OCc7JqBtc/K8cjR6ZozFBlHUig0XHdyiaJCTAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRfK1fl8suBiqlsbQpz50D9ZfeVVFXRplPvHK1uveQK6ERQM/9gTQG62R4hfs4XlqfXhTxnMEfdhIXcfr1izUbhFRidyyFAMJu/RVMUEboig5TiUQhLocQ9LFiuYu2lLAVOLQ3c78QWJXi0m+bPxOCVnKPFB67fGA4V6zZPDcVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSjDMK99; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755293190; x=1786829190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NdqI/OCc7JqBtc/K8cjR6ZozFBlHUig0XHdyiaJCTAM=;
  b=mSjDMK99ZTBe5XEIDtgsGZVzPBlNR3YSG5bvwb2lavB8/WoBCsYL2bJL
   Xs7i0ehVAXRFQPkYTy/cOFISiZ11NtKTHacvzu2a53itARV/oHg7AeoWp
   S5vk+CLjRJCWEU/X1994+9RUZuurPIKFP2DlStz64afiS7MYQChKmmIZ3
   7QZk5rYW/mvcePZJWZ2+pauHDLUaLg08+JEyCi1o0p8wWM1UKek39Ez9r
   IBmrK2sd46QqJOPK+KiwKHWlI42PzehRAckwze63r2X+m1+4Crb2OSUTg
   GLQnQHUUSjnVkApWbCnwgMQqviUxuSrwm/cTvStDkGvgHbit1nA63t0x6
   g==;
X-CSE-ConnectionGUID: 7mhh24qOSr2MY9OyYKsdzg==
X-CSE-MsgGUID: U6ulU2VjRYemAc8eH0aiLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="75183608"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="75183608"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 14:26:30 -0700
X-CSE-ConnectionGUID: 7v5EdPhxQjGKEhme4UD7Fw==
X-CSE-MsgGUID: 459o8MqfS6qDTFkqfkAYqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="204271165"
Received: from johunt-mobl9.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 14:26:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 60277121204;
	Sat, 16 Aug 2025 00:26:24 +0300 (EEST)
Date: Fri, 15 Aug 2025 21:26:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com, hans@jjverkuil.nl,
	jacopo.mondi@ideasonboard.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH 3/3] media: staging/ipu7: cleanup the MMU correctly in
 IPU7 driver release
Message-ID: <aJ-mALzD-mA_KXsa@kekkonen.localdomain>
References: <20250815092037.1825769-1-bingbu.cao@intel.com>
 <20250815092037.1825769-3-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815092037.1825769-3-bingbu.cao@intel.com>

Hi Bingbu,

Thanks for the set.

On Fri, Aug 15, 2025 at 05:20:37PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> IPU7 ISYS and PSYS auxiliary devices are released after
> ipu7_bus_del_devices(), so driver can not reference the MMU devices
> from ISYS and PSYS auxiliary devices, so move the MMUs cleanup before
> releasing the auxiliary devices.
> 
> Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")

Please also add Cc: stable tag if you have a Fixes: tag.

> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu7/ipu7.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
> index aef931d23510..3de41b3d1ae1 100644
> --- a/drivers/staging/media/ipu7/ipu7.c
> +++ b/drivers/staging/media/ipu7/ipu7.c
> @@ -2644,6 +2644,9 @@ static void ipu7_pci_remove(struct pci_dev *pdev)
>  	if (!IS_ERR_OR_NULL(isp->fw_code_region))
>  		vfree(isp->fw_code_region);
>  
> +	ipu7_mmu_cleanup(isp->isys->mmu);
> +	ipu7_mmu_cleanup(isp->psys->mmu);
> +
>  	ipu7_bus_del_devices(pdev);
>  
>  	pm_runtime_forbid(&pdev->dev);
> @@ -2653,8 +2656,6 @@ static void ipu7_pci_remove(struct pci_dev *pdev)
>  
>  	release_firmware(isp->cpd_fw);
>  

This newline will be extra once the two lines below have been removed.

Does the same issue exist in the IPU6 driver? These calls are located in
the same location but I haven't checked if that's the right place for them.

> -	ipu7_mmu_cleanup(isp->psys->mmu);
> -	ipu7_mmu_cleanup(isp->isys->mmu);
>  }
>  
>  static void ipu7_pci_reset_prepare(struct pci_dev *pdev)

-- 
Kind regards,

Sakari Ailus

