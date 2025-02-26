Return-Path: <linux-media+bounces-27025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8DEA45BFD
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 11:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F29DB3ADE02
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDCE2459F9;
	Wed, 26 Feb 2025 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VH9irwFS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97934642D
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740566317; cv=none; b=rFW269ywqx6VOH7jAG8UAbSFgP/2CrGnBZ78JorqfsFpbLUWV+5Zs/nI217Q7hULV13o/0lq5Dk0zQ4LSpf1U1Dd38YiVq23Z4iQ6UdTZJ4G+OBUS06IRU5SG2uZcmDh16OCr1RHWw/e08NEgjLycSgS3Yk++nrGxGqnTSzFzlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740566317; c=relaxed/simple;
	bh=zGU8ksFnOQH/EfVqouhyytA/OJOtFHZCehRcsTEm42s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyjjW+4yel48IV3FM6kg8trnNhb+PkKpTBTDZWDEdpXIDbWNU/nhsErBIb9+A6ndMj3J3ePXQvZ4tAunF0ZlZzKYgEpmv7bKJR2YOTnpWwacwkgjnk5zz/wYweh97j4gTdPmhlamCuABJ0qXuQxyPzUOEb0tV20/KqQ2+Nw5obg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VH9irwFS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740566316; x=1772102316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zGU8ksFnOQH/EfVqouhyytA/OJOtFHZCehRcsTEm42s=;
  b=VH9irwFSfX2EQHoGj0y9aGXTHsDoCpvoPL0dPl2DHBXQnhpvKP/rwhbf
   sOL9Mmeujx9/33laibUKYVsbeY2jemHBqTSZ+nBJtIiZMZjBDk94OCDIB
   +QiMz5J7xKE+DiI38LMCrxESqw8rio83WGXuyL0Wq+t0S8emW4KWe/8Ub
   OkWnrTt6/X+bt1yUi189iRlwE/X6dYUGtMMLKuLZV3AzLKnhzj37bIfSV
   QglsggZaHADWgcfSDcfDyblTsgkroVJ4OlCZPw5tEmvBSS4U/tjgx8fU+
   qu24JIOOZstGh+heO/RHNs5RIzJ8G9JX6TmOYjP7dz83cSV6LDwPE/OM5
   g==;
X-CSE-ConnectionGUID: AQjqmnFgQ4Onlmm/46bZdw==
X-CSE-MsgGUID: fwU0+tX7TWys8H4GCcmmlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52798066"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52798066"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 02:38:36 -0800
X-CSE-ConnectionGUID: Xrtz0eyfR5uO6V7zLgTrAw==
X-CSE-MsgGUID: LXavk0kZSDqgK4gFBekB3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116679977"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 02:38:33 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1080811F7E2;
	Wed, 26 Feb 2025 12:38:31 +0200 (EET)
Date: Wed, 26 Feb 2025 10:38:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
	bingbu.cao@intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/1] media: ipu6: Drop unused ipu6_dma_get_sgtable()
Message-ID: <Z77vJ4Y2mpOqptyP@kekkonen.localdomain>
References: <20250225094532.40678-1-sakari.ailus@linux.intel.com>
 <76556647-505b-1cea-7ae8-5f17873cf161@linux.intel.com>
 <Z77JiXJ2kyLSOuPi@kekkonen.localdomain>
 <305da783-fffd-76b4-5154-c9b2692fd2ac@linux.intel.com>
 <Z77TNQm5mxPa__FA@kekkonen.localdomain>
 <2b51451f-5450-bc68-835a-e91a792dedf9@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b51451f-5450-bc68-835a-e91a792dedf9@linux.intel.com>

On Wed, Feb 26, 2025 at 05:25:06PM +0800, Bingbu Cao wrote:
> >>>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> >>>>> index b51244add9e6..2882850d9366 100644
> >>>>> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
> >>>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> >>>>> @@ -43,7 +43,4 @@ int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >>>>>  			 enum dma_data_direction dir, unsigned long attrs);
> >>>>>  void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >>>>>  			    enum dma_data_direction dir, unsigned long attrs);
> >>>>> -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >>>>> -			 void *cpu_addr, dma_addr_t handle, size_t size,
> >>>>> -			 unsigned long attrs);
> >>>>
> >>>> ipu6_dma_get_sgtable() is used in downstream PS driver, I don't think it
> >>>> is necessary to remove it as it will be hard to integrate with downstream PS
> >>>> driver.
> >>>
> >>> When will there be an upstream PSYS driver?
> >>>
> >>> I suppose you can just as well apply a revert of this patch to your
> >>> downstream tree?
> >>>
> >>
> >> Sakari,
> >>
> >> I don't think all the OS vendors like this way, it make the downstream
> >> development harder. It's a trade-off, I cannot see removing offer any
> >> benefits that its side-effect.
> > 
> > I don't think the Linux distro maintainers like downstream drivers at all,
> > independently of how many patches they consist of.
> > 
> > You could as well move the function to the PSYS driver and use
> > find_vm_area(cpu_addr) instead to find the area.
> 
> My fault, I forgot I already removed the ipu6_dma_get_sgtable() from
> downstream driver months ago, so,
> 
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

Thanks, Bingbu!

-- 
Sakari Ailus

