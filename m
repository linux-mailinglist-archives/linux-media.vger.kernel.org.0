Return-Path: <linux-media+bounces-49308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC2CD51EC
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E068305DE29
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F232874E3;
	Mon, 22 Dec 2025 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UECMMQ6C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8096123FC49
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392611; cv=none; b=XcWS+CoQzhmNAXl6gP6a4SDuL3H4ml72p2NEOnLBdiHxtnQdEMUq38w09LOJD7uowZRaXsDMvIC+feneEuRpl3ZHCVbtzVIWoC80aZoQdmviIzZIKx2BzjGRA+NuFMhi7Y6bEQZZCk00ZlF4PXDANSy+80g6zHKPi2ExDmcqkbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392611; c=relaxed/simple;
	bh=VQBUWdSz3VtXS7euPU4MP0nQ1lDf/FVORbIMyyA4x7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7iA43JEQnWZC5QQjjT6R7WO82t44yWt5DV/jDvpMNtF59dJK3oX4cvFMz8gA0gp3o+yjz1kfEUdbaDoYuPM91H3qKmSRqXv9UuvtEE0mK+mnfT+8+h5pKFmOoJ/ynsqwt+ciBORgyuHOxR7lAbaZqnCTlHmP4Ejy9ERmDPcFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UECMMQ6C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766392610; x=1797928610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VQBUWdSz3VtXS7euPU4MP0nQ1lDf/FVORbIMyyA4x7k=;
  b=UECMMQ6CCZm/YdYZwDvH9FvwVWD+QZcKW5gYqZEVGQTDVhL8iNrRNksd
   C1P4WVRWP1Sh0GuigkwjwyVHtORc4LXQbog7/D0VXk+cRQsOzm9Bykr9a
   BMLvrF9rIgcjKCH/QDaoEI3MkHHdzAVgIyZmTrLm5A9Hf4t793f8Ah7q9
   xwF0ot4VD5fI+tP0xoe8I6651TNnZ7Bm3ZedZ+o1x7GkuNz+RpXY1gqtY
   XKdrEUkqb79A//1C7ImDfBBEXZek0WizYnoIEzQS3VpZXc9Tkbc8uJ1CB
   ktB/EU2nivoG//qCEaH81SKGmnv25RphZB25f2kK7WLjM1TXp9APbxaTz
   w==;
X-CSE-ConnectionGUID: Zueo+9gVTlyW/EHO7gxYCQ==
X-CSE-MsgGUID: 2NPM4iTbTHq4KygEWVKsuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="71877424"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="71877424"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:36:47 -0800
X-CSE-ConnectionGUID: 7hYsabQFRfacz7Jyjyk1vw==
X-CSE-MsgGUID: dNMJVDOSRlaXqGK1q5cWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="236892551"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.187])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:36:45 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 88CCE11F87B;
	Mon, 22 Dec 2025 10:36:46 +0200 (EET)
Date: Mon, 22 Dec 2025 10:36:46 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
Subject: Re: [PATCH v2 2/4] media: staging/ipu7: call synchronous RPM suspend
 in probe failure
Message-ID: <aUkDHvTQ5JH-_xM5@kekkonen.localdomain>
References: <20251222070629.2018807-1-bingbu.cao@intel.com>
 <20251222070629.2018807-3-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222070629.2018807-3-bingbu.cao@intel.com>

Hi Bingbu,

Thanks for the patchset.

On Mon, Dec 22, 2025 at 03:06:27PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> If firmware authentication failed during driver probe, driver call
> an asynchronous API to suspend the psys device but the bus device
> will be removed soon, thus runtime PM of bus device will be disabled
> soon, that will cancel the suspend request, so use synchronous
> suspend to make sure the runtime suspend before disabling its RPM.
> 
> IPU7 hardware has constraints that the PSYS device must be powered
> off before ISYS, otherwise it will cause machine check error.

How does this differ from IPU6? In the ipu6 driver this has been addressed
by making the PSYS a child of ISYS. Would this work on IPU7, too?

> 
> Cc: Stable@vger.kernel.org
> Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu7/ipu7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
> index 6c8c3eea44ac..fa5a1867626f 100644
> --- a/drivers/staging/media/ipu7/ipu7.c
> +++ b/drivers/staging/media/ipu7/ipu7.c
> @@ -2620,7 +2620,7 @@ static int ipu7_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
>  		ipu7_mmu_cleanup(isp->isys->mmu);
>  	if (!IS_ERR_OR_NULL(isp->psys))
> -		pm_runtime_put(&isp->psys->auxdev.dev);
> +		pm_runtime_put_sync(&isp->psys->auxdev.dev);
>  	ipu7_bus_del_devices(pdev);
>  	release_firmware(isp->cpd_fw);
>  buttress_exit:

-- 
Kind regards,

Sakari Ailus

