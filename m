Return-Path: <linux-media+bounces-20770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D48069BAE05
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 09:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9951D2820FE
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D281AAE39;
	Mon,  4 Nov 2024 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpTF6SiK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7838A18BC0E;
	Mon,  4 Nov 2024 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708766; cv=none; b=GOeV2+qahgfE5TBiKTLbS1uB3LIiNFTgVkjxNBa7AAmUV588r5EL3mOQ7t5kK/7SmtEW0/cFaO8Bu4+URn6z9rJ3OgShbkP4Qbh7yHsDDNs2Ea7EXZF7miBM7jf2IuEd6UU1vqxX9APwuYiZRaYiV5In65dNPxLB/9QdHJI/uNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708766; c=relaxed/simple;
	bh=5n26+7Eb9Ctuhh6z7GrE22CUnNft0rCMOTsCtn4nm8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bA365vNf7ap0YjZUHauYnvaOI5Ujy8sCiWi6ykUmayvgzw4OXZihqWtHDr9OqFPQdDQdK7xBGvEOyk8g3dTDtgV4JgoLakMvc1zyhavAfNNvhwRJTRQiF1csfi3F+kZE1TviqmKcJS8yI/BnJccaVlYVn6CYLTWfhQs11IOeMXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpTF6SiK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730708764; x=1762244764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5n26+7Eb9Ctuhh6z7GrE22CUnNft0rCMOTsCtn4nm8Q=;
  b=mpTF6SiKTfRFCqVIqjrgweT1QbCgZcLUc9i6y2oL3IZibXQH+Rs1f9YP
   K2G/COVVCJjUv0duM9kZ3yJ9OsvmhvBLkFqLN4npqUgu4VVkpLroR4rxX
   ypSlMO7KCw5gsw6IMcXYAGuut3UIpxaI+VJhRpqZAdgUicPlMt5rdgDvw
   PCGOx/7w++5GJnhGa0Hthl6QjdXq7tvI/SUuWezVGBo9L9cKAzet6jcng
   cqqXDjV5gYiVzrQinbvlYiRP56naiLjUmv+lNbIn+mzIphq8zu7XmuyE/
   wIBR/7aAGd9HH5+jYOXtChxgGzjmClnPGXrYyAGjZG4NwuIeDjCx9UnqQ
   w==;
X-CSE-ConnectionGUID: hS3fnjORStmOdU+OBxo/EA==
X-CSE-MsgGUID: kis/nuPgS0KTSvu4RjmosQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52954095"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52954095"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:26:03 -0800
X-CSE-ConnectionGUID: Rn0qklN4SCCXK8pukA8nmw==
X-CSE-MsgGUID: rQRhzDZiR32i6hqrr4yMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="106927565"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:26:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t7sPO-0000000AytU-1dpi;
	Mon, 04 Nov 2024 10:25:58 +0200
Date: Mon, 4 Nov 2024 10:25:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Li Huafei <lihuafei1@huawei.com>
Cc: mchehab@kernel.org, alan@linux.intel.com, hdegoede@redhat.com,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <ZyiFFr1fbEn2JkWq@smile.fi.intel.com>
References: <20241104145051.3088231-1-lihuafei1@huawei.com>
 <ZyiEXYWU1Yt03UNc@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyiEXYWU1Yt03UNc@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 04, 2024 at 10:22:53AM +0200, Andy Shevchenko wrote:
> On Mon, Nov 04, 2024 at 10:50:51PM +0800, Li Huafei wrote:
> > In ia_css_3a_statistics_allocate(), there is no check on the allocation
> > result of the rgby_data memory. If rgby_data is not successfully
> > allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> > ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.

...

> > --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> > @@ -4181,6 +4181,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
> >  		goto err;
> >  	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
> >  	me->rgby_data = kvmalloc(sizeof_hmem(HMEM0_ID), GFP_KERNEL);
> > +	if (!me->rgby_data)
> > +		goto err;
> 
> Which kernel version are you patching?
> 
> The problem, you have reported here was fixed ~4.5 years ago.

Ah, sorry, I misread the line. Indeed, this one is still present in the current
code base.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



