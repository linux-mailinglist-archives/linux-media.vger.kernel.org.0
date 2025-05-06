Return-Path: <linux-media+bounces-31876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D105AACE77
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 21:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29DC43A455C
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 19:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C78021146C;
	Tue,  6 May 2025 19:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbnQs74z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33FB2747B
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746561472; cv=none; b=e5+tTHaq/WtmmdmFkQscMIToUv9p+ozhbTBPA+V8gl4Aq6JEgzebO4R8uCRXq81e6KkdV6qIW55vPfbOp2TAPOw1qie25bgHjfjbFJ+CzILwgZCbx+sChexne0H22Rlsx7qjvDBnXq56q/jYPJ5SVRPw1zHszu/uyzCC1t2NUz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746561472; c=relaxed/simple;
	bh=nt+/uD9LvcfvQSgpy7ESBXun9+Ck3/G4OkPAxDcm0cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L19eY47jiVzPJm8wj0potE6LLBypOfUMdvGyLRzMZ7o0OTRyW/SDt0ZOviIOMJi0q8x+P/jFR03LB8YcsfVQG6TXxpcHog2/POsSq8Ls00pB0BlHW4L6MlEWI4aweqLXkZ9aTKCiK7/I3CtfpRMurTO1AnDhA2P/VhAiB55P+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbnQs74z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746561471; x=1778097471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nt+/uD9LvcfvQSgpy7ESBXun9+Ck3/G4OkPAxDcm0cI=;
  b=kbnQs74zdYv26ReZrBYFII9WiC4rpxr0lXYVgGzPuhG77P3JUl9ZgiMK
   FyQoBB+wc22DJeuSQ0GNHCfzbQl65yamPljasbgPNSmC6NbLCifKhZ2eh
   s33Cb9ih9oS9Fm9+x+zJ/BUgvwVgQSJL+Nbab9xOrdEzXQjKP6AYOP3zq
   2jDEA1UMThF26BEqmqEoglRu2myjNjbrJBT8Pnv9IvNZMe9hpvYT03HCv
   bchDdfNDeSj0kmAmBmDOLjWUkUD63yUuiXe2MK7N7+GGBHUNB+jtqOZDW
   /kIBt08K9NoLUSUv5h02V3NNkMQ24J5hHlfNL1sTkOaUuCY73i2sjKSe0
   A==;
X-CSE-ConnectionGUID: zCvKic4sTP+EjVZUi4hvrQ==
X-CSE-MsgGUID: XLTL5KVMTd6OHdPDIfa+ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65785170"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="65785170"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 12:57:50 -0700
X-CSE-ConnectionGUID: lkST6J3BSJ2b9nEe5KLpPw==
X-CSE-MsgGUID: iyBQoOspSiCWTXDFZ3Ns7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="159019329"
Received: from savramon-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.89])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 12:57:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1D1CA11FCD0;
	Tue,  6 May 2025 22:57:46 +0300 (EEST)
Date: Tue, 6 May 2025 19:57:46 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ipu-bridge: Debug log link-number and
 lane-count from SSDB
Message-ID: <aBppurHZUqy-g8mJ@kekkonen.localdomain>
References: <20250506121843.250995-1-hdegoede@redhat.com>
 <20250506121843.250995-2-hdegoede@redhat.com>
 <aBoiRpAkR_8Yhf_c@kekkonen.localdomain>
 <323ed87d-074f-4bef-ac5b-4fc8ac0b478a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <323ed87d-074f-4bef-ac5b-4fc8ac0b478a@redhat.com>

Hi Hans,

On Tue, May 06, 2025 at 06:57:14PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 6-May-25 16:52, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Thanks for the set.
> > 
> > On Tue, May 06, 2025 at 02:18:43PM +0200, Hans de Goede wrote:
> >> Add a dev_dbg() call logging the link-number and lane-count from the SSDB.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> >> index a12bc1676c81..e342492e8f3b 100644
> >> --- a/drivers/media/pci/intel/ipu-bridge.c
> >> +++ b/drivers/media/pci/intel/ipu-bridge.c
> >> @@ -308,6 +308,8 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
> >>  		return -EINVAL;
> >>  	}
> >>  
> >> +	dev_dbg(ADEV_DEV(adev), "link %d lanes %d\n", ssdb.link, ssdb.lanes);
> > 
> > Do we need this? The V4L2 fwnode framework prints this, as well as other
> > related information.
> 
> Ah I see, one problem is that the drivers/media/v4l2-core/v4l2-fwnode.c
> code uses pr_debug, so on multi sensor systems it is not always clear
> which sensor the debug prints belong to.
> 
> Is there some way to improve the debug-logging there to give some more info?

The V4L2 fwnode functions don't have access to the device currently. I'm
not against adding it though, even just for printing purposes. It'd require
changing a lot of drivers though.

The functions do print the full path of the device's firmware node. Of
course it's not the same as the device, but in this context might be even
more useful as it also includes the port number.

> 
> Anyways I agree that this seems duplicate, so lets drop this patch.

Agreed.

-- 
Regards,

Sakari Ailus

