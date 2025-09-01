Return-Path: <linux-media+bounces-41462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB9B3EB56
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38D1918941C0
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B4C3596B;
	Mon,  1 Sep 2025 15:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNE8HIwF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4A332F764;
	Mon,  1 Sep 2025 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741355; cv=none; b=NnDsc1oaZa9tnq4inp+qzZopN2UK6DftFVX3DW0QojnFuOTXuNn3k1oey6rJ2sf8z+PE70CU7cgAUraHEasrwszG2bS9I2pc7zgM2qKRh+EIdJj5njG6A5ON8aao40LiX61CMwfzrAW2igxxZCYA9DJjoZUzR58R9rzXdvmBsA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741355; c=relaxed/simple;
	bh=41yILyPaRdGVTtOmRTVGMgEgTRygcovNRJ8+oQjhy8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmzlocrH+zSmweZm0V9MEXA9NH5RUOS5/jEKA8juLpsYOWnNL3uuaw8V6uRMYjtnqCn5AOInW06FwniF1pDN80NCrbgK9a3zm1XQbPDwzImb7h/bsP12ruznfHAJL4ImV1+JBwGkTWh3amH1Av8y509p2BfgE3zj4PoBLKJ6mUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNE8HIwF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756741354; x=1788277354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=41yILyPaRdGVTtOmRTVGMgEgTRygcovNRJ8+oQjhy8o=;
  b=YNE8HIwFc/DHubxUPb4idax8A7WZrEi1IKqAQxW/iJaevMhQnnJqMdfm
   a1CNUNtDBorCDpx1PEYjrdOJZixGzrc5UvfVTDKLgPnCeXj9r6AWCqi0y
   oaTxsVjwgJjhwDr26f4tR8avxrmsGJfJXiqtCqBY5Pe+jU58wlXX6JNwu
   jB9wpOro5OumOgYGvT1DkA7K8j8I9cfzbRq3o+bjzmZ5CiWfQpPK8mIAf
   +2S7jbYnSluKDNaZwnqPkWqy5ppdyeV2/GIPMU5bt6QuanbZsknDzbs0y
   RGav6gKNdKILRG4wWxrE8k9/qoExnRUUCXK6ztGIS1JMTvtBDTVjAh4za
   Q==;
X-CSE-ConnectionGUID: f+uLuOlZR6y1hbNAq3s76w==
X-CSE-MsgGUID: aol7O1E8QQGhkQRB/9KiaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="69709201"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69709201"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:42:33 -0700
X-CSE-ConnectionGUID: iWIyUrZTS6iG0koM7qv4Fw==
X-CSE-MsgGUID: lIbgDhB1RhWSK/DxIdYagg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171902172"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:42:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1ut6fr-0000000ASaN-3aHa;
	Mon, 01 Sep 2025 18:42:27 +0300
Date: Mon, 1 Sep 2025 18:42:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: media: atomisp: Remove typedefs for basic
 types in vmem.c
Message-ID: <aLW-45MfPpLSNi0n@smile.fi.intel.com>
References: <20250901091050.1935505-1-abarnas@google.com>
 <20250901091050.1935505-2-abarnas@google.com>
 <aLWS9QsvmzZW4Bak@smile.fi.intel.com>
 <CAATBrPFnSnxwzBQTOdbt0h=epXW7G5Rj8Sr_erKKzUzCH6xC5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAATBrPFnSnxwzBQTOdbt0h=epXW7G5Rj8Sr_erKKzUzCH6xC5g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 01, 2025 at 03:27:19PM +0200, Adrian Barnaś wrote:
> On Mon, Sep 1, 2025 at 2:35 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, Sep 01, 2025 at 09:10:49AM +0000, Adrian Barnaś wrote:

...

> > > -static inline hive_uedge
> > > -subword(hive_uedge w, unsigned int start, unsigned int end)
> > > +static inline unsigned long long
> > > +subword(unsigned long long w, unsigned int start, unsigned int end)
> > >  {
> > >       return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
> > >  }
> > >
> > >  /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx]LSB */
> > > -static inline hive_uedge
> > > -inv_subword(hive_uedge w, unsigned int start, unsigned int end)
> > > +static inline unsigned long long
> > > +inv_subword(unsigned long long w, unsigned int start, unsigned int end)
> > >  {
> > >       return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
> > >  }
> >
> > Also consider to simplify the above (in a separate change).
> >
> > static inline unsigned long long
> > subword(unsigned long long w, unsigned int start, unsigned int end)
> > {
> >         return (w & GENMASK_ULL(end, 0)) >> start;
> > }
> >
> > static inline unsigned long long
> > inv_subword(unsigned long long w, unsigned int start, unsigned int end)
> > {
> >         return w & (~GENMASK_ULL(end, 0) | GENMASK_ULL(start, 0));
> > }
> >
> > ...if I'm not mistaken, so double check all these.
> >
> > At least in my case the end == 64 is not allowed while it seems the original
> > code allows it to be equal to the end == 63 case. Needs testing anyway...
> 
> Those functions works odd:
> when (end = 8, start = 0) it affects bits 0...7

Yes, that's what I meant. But it does the same for 7, 0.
That's why every caller needs to be carefully checked for these corner cases.

64 is special because it will give complete garbage in my case.
I suspect they never extracting anything on the non-aligned byte borders.

> This should make the same results, will check twice if i not missed
> anything and post v2:
> 
> static inline unsigned long long _subword(unsigned long long w,
> unsigned int start,
> unsigned int end)
> {
> return (w & GENMASK_ULL(end-1, 0)) >> start;
> }
> 
> static inline unsigned long long _inv_subword(unsigned long long w,
> unsigned int start,
> unsigned int end)
> {
> return w & (~GENMASK_ULL(end-1, start));
> }

Maybe, but again needs to be carefully checked and tested.

You can propose a separate patch as RFC.

-- 
With Best Regards,
Andy Shevchenko



