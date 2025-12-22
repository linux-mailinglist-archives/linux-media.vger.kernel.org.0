Return-Path: <linux-media+bounces-49367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3E4CD6BBA
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 17:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA6CB30136C8
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 16:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D2C34FF7C;
	Mon, 22 Dec 2025 16:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5cDYnd+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED672C3261
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 16:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766422773; cv=none; b=c3irU8UgY8vfkQwDdSeyCAe5na/vQPcAMFXNBCAa01dVH8ncg3ObTjujXO1sHUFPDzsTmmPavBfbregr1xiZvZyo6mcL1F+YAQy3EWCbwyxeOyeL1vF9P6gjgwHK/FkOuM1qsxBg5VS55RROLARJ5rFdhliaBSWf3sHLuhSzo/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766422773; c=relaxed/simple;
	bh=sIt16ifZXTT+6h5bKTfzO0huXLGroK6CJD2KDA1mWKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiJ0QYfXZZHkqIMa5f2dXEDezzGzEtuY2/ECoB3KL/tP44IoaJ/8gSLG1qrgA1knh3CphE7NbV5aaWnKn5i0Q7NVBeNKiEC7Lrm1bph6cWbNd8ueW3IjjG6fSaZ7dvzoCpG1wnnHAfRvdMTEKcq0UGX43LfCxiM9PGEeDhFrLoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5cDYnd+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766422772; x=1797958772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sIt16ifZXTT+6h5bKTfzO0huXLGroK6CJD2KDA1mWKg=;
  b=l5cDYnd+0nvXF+0JqeMAY59vs/0x7PzRvN2rRRKACpnimFC048kTiPrp
   tXn/jAe9/tG+jjYBBRXdX+SKUboUWc8wbANa0kMJXgWjmUPYhwOORvzJG
   uFXGQbm1XLGmcBdZC+rUtlrZqx5WbMCRdqKusSLnTjc9W+EgCP9/rD69N
   cpz1ltqgxIWOMcTzId+8ocTrBtvV7mGcnTiHPRVVEIdfsvB7+XRQxsGKA
   drAG7mYelwppwTaIH51t77TAyyK3Z1SjQodaKRbMUC7UKHdmjGA6AB7M6
   jhUfxoC/eeFGm77hDIIa2nn9RvEP0aAu4WvVLfzviViFCwNqXf3inHXAA
   w==;
X-CSE-ConnectionGUID: ZyofA0YvSoONZSlu7EgwtQ==
X-CSE-MsgGUID: g93wo7YZQSuNtTMOYD7ykA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72128642"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="72128642"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:59:31 -0800
X-CSE-ConnectionGUID: 97bUmlg4STK7tcFOOCl6/g==
X-CSE-MsgGUID: AKV7Yk3wTFSrAKhMb3Pesg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.187])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:59:29 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F2798121D86;
	Mon, 22 Dec 2025 18:59:29 +0200 (EET)
Date: Mon, 22 Dec 2025 18:59:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
Subject: Re: [PATCH v2 2/4] media: staging/ipu7: call synchronous RPM suspend
 in probe failure
Message-ID: <aUl48b0s5C5x8TGu@kekkonen.localdomain>
References: <20251222070629.2018807-1-bingbu.cao@intel.com>
 <20251222070629.2018807-3-bingbu.cao@intel.com>
 <aUkDHvTQ5JH-_xM5@kekkonen.localdomain>
 <8fd50787-87f6-ac31-739f-5f3c64961abc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fd50787-87f6-ac31-739f-5f3c64961abc@linux.intel.com>

Hi Bingbu,

On Mon, Dec 22, 2025 at 06:03:02PM +0800, Bingbu Cao wrote:
> Sakari,
> 
> Thanks for the review.
> 
> On 12/22/25 4:36 PM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > Thanks for the patchset.
> > 
> > On Mon, Dec 22, 2025 at 03:06:27PM +0800, bingbu.cao@intel.com wrote:
> >> From: Bingbu Cao <bingbu.cao@intel.com>
> >>
> >> If firmware authentication failed during driver probe, driver call
> >> an asynchronous API to suspend the psys device but the bus device
> >> will be removed soon, thus runtime PM of bus device will be disabled
> >> soon, that will cancel the suspend request, so use synchronous
> >> suspend to make sure the runtime suspend before disabling its RPM.
> >>
> >> IPU7 hardware has constraints that the PSYS device must be powered
> >> off before ISYS, otherwise it will cause machine check error.
> > 
> > How does this differ from IPU6? In the ipu6 driver this has been addressed
> > by making the PSYS a child of ISYS. Would this work on IPU7, too?
> 
> For both IPU6 and IPU7, PSYS is child of ISYS. It can guarantee that PSYS
> auxiliary device will be powered off before ISYS except the probe failure
> case. Runtime PM disabling(in ipu7_bus_del_devices) may cancel the pending
> PSYS suspend request which cause machine check error on PTL which has clock
> hardware constraint.

Thanks for the explanation.

The ipu6 driver is actually missing any pm_runtime_put*() in its probe
error path. :-o

> 
> > 
> >>
> >> Cc: Stable@vger.kernel.org
> >> Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
> >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >> ---
> >>  drivers/staging/media/ipu7/ipu7.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
> >> index 6c8c3eea44ac..fa5a1867626f 100644
> >> --- a/drivers/staging/media/ipu7/ipu7.c
> >> +++ b/drivers/staging/media/ipu7/ipu7.c
> >> @@ -2620,7 +2620,7 @@ static int ipu7_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >>  	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
> >>  		ipu7_mmu_cleanup(isp->isys->mmu);
> >>  	if (!IS_ERR_OR_NULL(isp->psys))
> >> -		pm_runtime_put(&isp->psys->auxdev.dev);
> >> +		pm_runtime_put_sync(&isp->psys->auxdev.dev);
> >>  	ipu7_bus_del_devices(pdev);
> >>  	release_firmware(isp->cpd_fw);
> >>  buttress_exit:
> > 
> 

-- 
Kind regards,

Sakari Ailus

