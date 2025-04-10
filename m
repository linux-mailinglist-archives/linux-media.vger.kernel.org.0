Return-Path: <linux-media+bounces-29897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84440A83D84
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D81014671F8
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D1820C012;
	Thu, 10 Apr 2025 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVvpQlt6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1301DF97F
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275146; cv=none; b=f7q4kVUrQDlYoM77aj2TY1wnS5ZkcVTfXJ/YR2H5HoUPeoKXMt9Inv1eoqfLnIcBSqu4XTLF5hW0+MyqjYtltICWztvuE2Ov8s/2HGJexmzxgYotGEnTS/ycIW+EdOM6ig8pGLP6v1xWhFWHCx/9Vg+7Pi7f9s4OE6yUHle431s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275146; c=relaxed/simple;
	bh=4GPBan4qMJCSGyjNSErWGjEXTpb1Af0gDo+Zu+zd1XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRKT7/UvfOxglTtyx84u3Ou5wH4QhA0YqtSiNdBa06XPL0X7300i2CfbowRTJCQ65eow7KfAV/sQvxKtXh2TV3+XSoxKgNNttlGjkotg6vAhNbeBU7jAg2ahPJoN4fv6J/bZLL/9MSV/i8sSbfaytQqJuAUmkcqw0Wtq713Fakw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVvpQlt6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744275144; x=1775811144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4GPBan4qMJCSGyjNSErWGjEXTpb1Af0gDo+Zu+zd1XM=;
  b=JVvpQlt6MRyFkU2jIU2l9ONQ33UaQv7gecwvEIsbSpNbODbOQshMtRVF
   ig6wVG4/PZgCOBR04iitHSSGSWIQcKjJwECz2GPbqTN5PYkyckl61mJJO
   ITgK4uRfokkct0hEnDcc2bQIeq0vnMzDNkGJ+2ERSYxOg+umGrGsuo7Xb
   stA55p/uALFfigJNbK8A0BrbnQ/0K8uPy1Bk9uOyiRXgrOCqh+jHzTTaO
   JNM13XVuEwiicZKrzsMYAgv7PVOXid+rdlfZ1wWxnixQTsgvIZenN4+fj
   dzwQKPfs9ZsI9SFwTI4kETdsKVnZpmxTgMYLlIPxox/dKb5/Q9oeorDJT
   g==;
X-CSE-ConnectionGUID: Rpj3F5exTwSB/2FvpXzEuA==
X-CSE-MsgGUID: Ly5FvKJRTlSFQ2JTZW2ThA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="71160452"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="71160452"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 01:52:24 -0700
X-CSE-ConnectionGUID: 2/p2iqruSiikCQRlI9AM7A==
X-CSE-MsgGUID: sPSC9LZDQqaoXiW9oPznuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128581070"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.254.14])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 01:52:22 -0700
Date: Thu, 10 Apr 2025 10:52:19 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH] media: intel/ipu6: Fix dma mask for non-secure mode
Message-ID: <Z/eGw6D5aZ5WAqaJ@linux.intel.com>
References: <20250409095825.1014521-1-stanislaw.gruszka@linux.intel.com>
 <57590fee-9f62-8776-1597-6e125daafe58@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57590fee-9f62-8776-1597-6e125daafe58@linux.intel.com>

Hi Bingbu,

On Thu, Apr 10, 2025 at 02:53:45PM +0800, Bingbu Cao wrote:
> Stanislaw,
> 
> Thanks for the patch.
> 
> On 4/9/25 5:58 PM, Stanislaw Gruszka wrote:
> > We use dma_get_mask() of auxdev device for calculate iova pfn limit.
> > This is always 32 bit mask as we do not initialize the mask (and we can
> > not do so, since dev->dev_mask is NULL anyways for auxdev).
> 
> Indeed.
> 
> > 
> > Since we need 31 bit mask for non-secure mode create wrapper of
> > alloc_iova() which use mmu_info->aperture_end. This give us always
> > the correct mask.
> > 
> > Fixes: daabc5c64703 ("media: ipu6: not override the dma_ops of device in driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-dma.c |  6 ++----
> >  drivers/media/pci/intel/ipu6/ipu6-dma.h |  7 -------
> >  drivers/media/pci/intel/ipu6/ipu6-mmu.c |  3 +--
> >  drivers/media/pci/intel/ipu6/ipu6-mmu.h | 13 +++++++++++++
> >  4 files changed, 16 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > index b34022bad83b..a1d4ec35f802 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > @@ -171,8 +171,7 @@ void *ipu6_dma_alloc(struct ipu6_bus_device *sys, size_t size,
> >  	size = PAGE_ALIGN(size);
> >  	count = PHYS_PFN(size);
> >  
> > -	iova = alloc_iova(&mmu->dmap->iovad, count,
> > -			  PHYS_PFN(dma_get_mask(dev)), 0);
> 
> How about directly call?
> 	iova = alloc_iova(&mmu->dmap->iovad, count,
> 			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
> 
> Less change, better.

Yes, direct call results in smaller/nicer fix, I will do this in v2.

Regards
Stanislaw

