Return-Path: <linux-media+bounces-22703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B809E54B3
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 12:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED2B11882B02
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 11:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B5E2144DC;
	Thu,  5 Dec 2024 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxvMoYKJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED962144DA
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733399826; cv=none; b=GT9SwAWWCn4gyQnV4reuT6fSlAmgyIL6VP65kCkY6qErSc1WgmQAtV+ES8X3x1dN09TDfUyv0pHU4jlvws5vr54xojAsL3q1W+p0gFHfsk6LWQVFiFrBPKLczE7L7a6owpbMkcOUHudFIe4UaN0PmbVQNoFqEAACfT79FtytPg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733399826; c=relaxed/simple;
	bh=W+Jdu5nI8amq7tiSPoBNgyTND6K2kxeUx5s7E6yQwCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjRws8zmtXUYmlHWXFSknljEauAGIWFPsqE4tpUBjdx5NAxXVgaf1WNcdGQFJodsrfpsua4l3Dr5if9KJXm/2ym54PgqMg7MhpzuAbUocLoXggKP0nwlDMpXzR3e/xq4zeaOd7R4O0CtG6Z1FNMG1xFGbRSq+BWL0bkljblIZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxvMoYKJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733399825; x=1764935825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W+Jdu5nI8amq7tiSPoBNgyTND6K2kxeUx5s7E6yQwCI=;
  b=GxvMoYKJcRwtMeLmTKxFnsv9FNGy1xBhCiKdUUyab30QXMDW2DAzqRAR
   LuWSHs1gpjX3YMe5m8eQfmyB1BQ4ThnwSchhx2+hwehyhZA9mM1rbyuTA
   TIV8m03UQgsBCv1yesq+cjqrKMB8VhmOXM6FnUll3A6QayU8OC6S0PGUY
   O1oaGgwE1GVJt62DLjv2mzj5A4MFISPGeP5KfcK+dv0zs9OtqOzklYyiw
   ubw80I5hpebPkbInkFWzCj80I3pgoxiKOmq0s+HCxBbBAMsLya2q5xFOF
   JqMSmFqC+tFs2JV7C1lsykhvHNQI5uD1Hxlc0eCFIHb5sNPa+aXTl8yVn
   A==;
X-CSE-ConnectionGUID: uOBLbwQZRE29fj572XVxgA==
X-CSE-MsgGUID: 9wRvdgZjSP2MXxx5/m9iMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33061015"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33061015"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 03:57:04 -0800
X-CSE-ConnectionGUID: VUzIvEN6QlCtWIopBOTFlg==
X-CSE-MsgGUID: f7idSHBcTpevhofhBnSaxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="94514008"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 03:57:03 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 63C9B11F89A;
	Thu,  5 Dec 2024 13:57:00 +0200 (EET)
Date: Thu, 5 Dec 2024 11:57:00 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-media@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH v3 1/1] media: ccs: Clean up parsed CCS static data on
 parse failure
Message-ID: <Z1GVDO4Z1njEG8Eu@kekkonen.localdomain>
References: <20241205094446.1491176-1-sakari.ailus@linux.intel.com>
 <l6jopnrvkmbycikl6pckfjnainwyppeiswhtkz7l2mzx55p2ql@5a656psljr5u>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l6jopnrvkmbycikl6pckfjnainwyppeiswhtkz7l2mzx55p2ql@5a656psljr5u>

Hi Mehdi,

Thanks for the review.

On Thu, Dec 05, 2024 at 10:54:10AM +0100, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Thu, Dec 05, 2024 at 11:44:46AM +0200, Sakari Ailus wrote:
> > ccs_data_parse() releases the allocated in-memory data structure when the
> > parser fails, but it does not clean up parsed metadata that is there to
> > help access the actual data. Do that, in order to return the data
> > structure in a sane state.
> > 
> > Reported-by: David Heidelberg <david@ixit.cz>
> > Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v2:
> > 
> > - Properly clean up after all error cases.
> > 
> >  drivers/media/i2c/ccs/ccs-data.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
> > index 9d42137f4799..2591dba51e17 100644
> > --- a/drivers/media/i2c/ccs/ccs-data.c
> > +++ b/drivers/media/i2c/ccs/ccs-data.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/limits.h>
> >  #include <linux/mm.h>
> >  #include <linux/slab.h>
> > +#include <linux/string.h>
> >  
> >  #include "ccs-data-defs.h"
> >  
> > @@ -948,15 +949,15 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
> >  
> >  	rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, verbose);
> >  	if (rval)
> > -		return rval;
> > +		goto out_cleanup;
> >  
> >  	rval = bin_backing_alloc(&bin);
> >  	if (rval)
> > -		return rval;
> > +		goto out_cleanup;
> >  
> >  	rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, false);
> >  	if (rval)
> > -		goto out_free;
> > +		goto out_cleanup;
> >  
> >  	if (verbose && ccsdata->version)
> >  		print_ccs_data_version(dev, ccsdata->version);
> > @@ -965,15 +966,16 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
> >  		rval = -EPROTO;
> >  		dev_dbg(dev, "parsing mismatch; base %p; now %p; end %p\n",
> >  			bin.base, bin.now, bin.end);
> > -		goto out_free;
> > +		goto out_cleanup;
> >  	}
> >  
> >  	ccsdata->backing = bin.base;
> >  
> >  	return 0;
> >  
> > -out_free:
> > +out_cleanup:
> 
> Don't you think some kind of logging or at least a dev_dbg() would be
> helpful here to let the user know that ccs_data_parse() failed ?

Good question. I think it's a good idea to print a warning, probably on
warning level. I alsoI think it should be a separate patch.

Could you write one? :-)

> 
> >  	kvfree(bin.base);
> > +	memset(ccsdata, 0, sizeof(*ccsdata));
> >  
> >  	return rval;
> >  }

-- 
Kind regards,

Sakari Ailus

