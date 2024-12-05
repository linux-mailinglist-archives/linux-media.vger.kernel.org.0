Return-Path: <linux-media+bounces-22696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3959E51D8
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 11:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238C918825B7
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A163E1E282D;
	Thu,  5 Dec 2024 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFHG0eML"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D21E00BE
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392463; cv=none; b=iEFSptP3I1oC1YJnF9mKF4U5RXWqd/KJ6bQNBBvdE7vp7k4bd4tXckW7lWgv2a1EPPTh1dpaKEkDugZVdhgzegogEgjX27aZkA93eVcTohv3NCjNhvSzcRKnB3jmpHcFSzxdlVrsqoRRODCXU5wJZwt8/uvSFo3mG7SJKQZwq0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392463; c=relaxed/simple;
	bh=iepEHfrahwrAqNFAEM7quQvBvdx6tA6W3SAQ98e0o/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGuuikYHNMsg9Mk4Kd247ZvjE3a79E0ehpf8GEL3bE3h99uEeopeoGOokdDohTIXiD6BmBUYMgbsEuhLtWwUXxlQHNLKfR28QR+rhZ33WXeS1NQP9mGYq0Zmuzyv2UB2RqTGiQYOeMCwXf16nzG5gv0gWtbHsThBiL0yHbaqdao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFHG0eML; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733392461; x=1764928461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iepEHfrahwrAqNFAEM7quQvBvdx6tA6W3SAQ98e0o/s=;
  b=mFHG0eMLl7zqgOVKk0VGFbDsSkOHStoDxiG2SHzvQ4iK71W9+q9F7fax
   WIMtI02zSHyttKEVLyk2/LlWGWvJGOV+JNJqNccXWi3mYBInmyZaWOCIh
   ZOH50vvuK7Y7JX6VMaE5JHgKYTb/XZ8nuvBZFdmR9UZtumPCNkbEkljRT
   0xDgufAK1IYzJsFramFGTRCEJULc3JjPGnL/J3ymgGumJH3pxOHtZ3YJm
   pm37TEAOLx0TriWlUunSpVe0YLHdvcD1Sub+PK+A91kNlBERtsJ16/Dr8
   wtuJeYI4r/edTWXmbQ9DUikRfIae4F2DiIHeMU+rhXKw3cZM7fDyAfH6R
   Q==;
X-CSE-ConnectionGUID: 0jHjxJXAQtqMpwxXcs4o6A==
X-CSE-MsgGUID: xzndSi3uTzCEWhBPAF2QvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33045928"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33045928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:54:21 -0800
X-CSE-ConnectionGUID: nWbFqV0lRBmfhExnv0NtSw==
X-CSE-MsgGUID: abUv2HQxT/qZ5bs3/pMuFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99087914"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.32])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:54:20 -0800
Date: Thu, 5 Dec 2024 10:54:10 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH v3 1/1] media: ccs: Clean up parsed CCS static data on
 parse failure
Message-ID: <l6jopnrvkmbycikl6pckfjnainwyppeiswhtkz7l2mzx55p2ql@5a656psljr5u>
References: <20241205094446.1491176-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205094446.1491176-1-sakari.ailus@linux.intel.com>

Hi Sakari,

On Thu, Dec 05, 2024 at 11:44:46AM +0200, Sakari Ailus wrote:
> ccs_data_parse() releases the allocated in-memory data structure when the
> parser fails, but it does not clean up parsed metadata that is there to
> help access the actual data. Do that, in order to return the data
> structure in a sane state.
> 
> Reported-by: David Heidelberg <david@ixit.cz>
> Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v2:
> 
> - Properly clean up after all error cases.
> 
>  drivers/media/i2c/ccs/ccs-data.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
> index 9d42137f4799..2591dba51e17 100644
> --- a/drivers/media/i2c/ccs/ccs-data.c
> +++ b/drivers/media/i2c/ccs/ccs-data.c
> @@ -10,6 +10,7 @@
>  #include <linux/limits.h>
>  #include <linux/mm.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  
>  #include "ccs-data-defs.h"
>  
> @@ -948,15 +949,15 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
>  
>  	rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, verbose);
>  	if (rval)
> -		return rval;
> +		goto out_cleanup;
>  
>  	rval = bin_backing_alloc(&bin);
>  	if (rval)
> -		return rval;
> +		goto out_cleanup;
>  
>  	rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, false);
>  	if (rval)
> -		goto out_free;
> +		goto out_cleanup;
>  
>  	if (verbose && ccsdata->version)
>  		print_ccs_data_version(dev, ccsdata->version);
> @@ -965,15 +966,16 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
>  		rval = -EPROTO;
>  		dev_dbg(dev, "parsing mismatch; base %p; now %p; end %p\n",
>  			bin.base, bin.now, bin.end);
> -		goto out_free;
> +		goto out_cleanup;
>  	}
>  
>  	ccsdata->backing = bin.base;
>  
>  	return 0;
>  
> -out_free:
> +out_cleanup:

Don't you think some kind of logging or at least a dev_dbg() would be
helpful here to let the user know that ccs_data_parse() failed ?

>  	kvfree(bin.base);
> +	memset(ccsdata, 0, sizeof(*ccsdata));
>  
>  	return rval;
>  }
> -- 
> 2.39.5
> 

--
Kind Regards
Mehdi Djait

