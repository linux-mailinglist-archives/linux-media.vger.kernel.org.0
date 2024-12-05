Return-Path: <linux-media+bounces-22707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 095959E55A3
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 13:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB8B61883681
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 12:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37C6217F3A;
	Thu,  5 Dec 2024 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9bbDzvF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98B25765
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733402324; cv=none; b=Ddp8peabQfnsXnYIWlWbPAvdk53IqDxeOHh2E3Tr49DAl2Fr0gesm7XyCZ8rHZr9wCrYqDSOx/fs0QwddP77KrBezkABiLmeHDJQt6n7WylsKEVONkXi5YHRAmo0qLkBnElQenhDy2zQAbtIYE+jyzHBum9m/g0kG7ziDgmhr3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733402324; c=relaxed/simple;
	bh=ZvKmNiyqTGEtlIliZ4bXI7cO1JwnvkfnXF8WFSqYxLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKRnv89bTU+eZFFhDNaE4ixYN82z1zmuCOFcV2iQKs4qyM3ME1S1plMosAT2Z+4uS/L03g0L/mpuAM1Hp/rs+QsEzoYn3zmpPy/J8LWDm1Hn3Ir4rqD5sAydaniAktwHK02aZ829F0TKA17i/URpbU+KnxUA8VxGlho3pq2wW5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9bbDzvF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733402322; x=1764938322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZvKmNiyqTGEtlIliZ4bXI7cO1JwnvkfnXF8WFSqYxLg=;
  b=M9bbDzvFquDM8LPBWPa033ut/VAZdPoYJ+lPhkk48MIuhXbwtCc4kglh
   /nfBEXrVI3K91Uf/9GgYUNx8oFOs+NSXZKpF7KjnG/PBUF5WsBzI8sYuM
   +eXbSeWkQgDf9yZpk0A/RsArCfOqwiCyTQcraoh1hz3KM/8zxZWIQ+poz
   52hogCBpUGWdQbOGq4zxL8RC77FB+86eJw6kvxoR2r6mnp+mlmk1I7ym0
   LtIFPp02Sv2cNf6UXOBMgnQPbrs6qMMLCAZXWJVyovTAfrCw31J3F1s2X
   JWDNlfCjMWQ2cNnEWyi1zyZqU+bb5NkhKEisMpJuQ19H+74OZXTwQFhOk
   Q==;
X-CSE-ConnectionGUID: /AR5DJz6Rx+ef9LsurEl9A==
X-CSE-MsgGUID: 1Vj7HK4pQsiWJVkdOPOLFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37646825"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="37646825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 04:38:40 -0800
X-CSE-ConnectionGUID: fperiCDmRry4buE4vOZXFQ==
X-CSE-MsgGUID: 9aUYFKMFTWqHTVZVxqOcmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="99048999"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.32])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 04:38:39 -0800
Date: Thu, 5 Dec 2024 13:38:31 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH v3 1/1] media: ccs: Clean up parsed CCS static data on
 parse failure
Message-ID: <bsbdtsmnslcnsl6ptqaeeblgygai6ytpgncfj2ul3smbrdze32@hr2wdrumy7mo>
References: <20241205094446.1491176-1-sakari.ailus@linux.intel.com>
 <l6jopnrvkmbycikl6pckfjnainwyppeiswhtkz7l2mzx55p2ql@5a656psljr5u>
 <Z1GVDO4Z1njEG8Eu@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1GVDO4Z1njEG8Eu@kekkonen.localdomain>

Hi Sakari,

On Thu, Dec 05, 2024 at 11:57:00AM +0000, Sakari Ailus wrote:
> Hi Mehdi,
> 
> Thanks for the review.
> 
> On Thu, Dec 05, 2024 at 10:54:10AM +0100, Mehdi Djait wrote:
> > Hi Sakari,
> > 
> > On Thu, Dec 05, 2024 at 11:44:46AM +0200, Sakari Ailus wrote:
> > > ccs_data_parse() releases the allocated in-memory data structure when the
> > > parser fails, but it does not clean up parsed metadata that is there to
> > > help access the actual data. Do that, in order to return the data
> > > structure in a sane state.
> > > 
> > > Reported-by: David Heidelberg <david@ixit.cz>
> > > Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > since v2:
> > > 
> > > - Properly clean up after all error cases.
> > > 
> > >  drivers/media/i2c/ccs/ccs-data.c | 12 +++++++-----
> > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
> > > index 9d42137f4799..2591dba51e17 100644
> > > --- a/drivers/media/i2c/ccs/ccs-data.c
> > > +++ b/drivers/media/i2c/ccs/ccs-data.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/limits.h>
> > >  #include <linux/mm.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/string.h>
> > >  
> > >  #include "ccs-data-defs.h"
> > >  
> > > @@ -948,15 +949,15 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
> > >  
> > >  	rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, verbose);
> > >  	if (rval)
> > > -		return rval;
> > > +		goto out_cleanup;
> > >  
> > >  	rval = bin_backing_alloc(&bin);
> > >  	if (rval)
> > > -		return rval;
> > > +		goto out_cleanup;
> > >  
> > >  	rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, false);
> > >  	if (rval)
> > > -		goto out_free;
> > > +		goto out_cleanup;
> > >  
> > >  	if (verbose && ccsdata->version)
> > >  		print_ccs_data_version(dev, ccsdata->version);
> > > @@ -965,15 +966,16 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
> > >  		rval = -EPROTO;
> > >  		dev_dbg(dev, "parsing mismatch; base %p; now %p; end %p\n",
> > >  			bin.base, bin.now, bin.end);
> > > -		goto out_free;
> > > +		goto out_cleanup;
> > >  	}
> > >  
> > >  	ccsdata->backing = bin.base;
> > >  
> > >  	return 0;
> > >  
> > > -out_free:
> > > +out_cleanup:
> > 
> > Don't you think some kind of logging or at least a dev_dbg() would be
> > helpful here to let the user know that ccs_data_parse() failed ?
> 
> Good question. I think it's a good idea to print a warning, probably on
> warning level. I alsoI think it should be a separate patch.
> 
> Could you write one? :-)

Yes, I will take care of it.

With that
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> 
> > 
> > >  	kvfree(bin.base);
> > > +	memset(ccsdata, 0, sizeof(*ccsdata));
> > >  
> > >  	return rval;

--
Kind Regards
Mehdi Djait

