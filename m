Return-Path: <linux-media+bounces-10034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0305B8B0D87
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FCF7B2513D
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D84915EFD5;
	Wed, 24 Apr 2024 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8ey+9hu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0696515E5D3
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713971104; cv=none; b=R16YqJ6/+N77dixRRyVStf/QviYls02018dLzudzMyeLDGD8BVqYYsfuDOV+1eogszPGJ2W4VIheIEzMZnNe8zWMNMmju/vTV38Blkp6iXU7/eBBZatn7Y1pxPUmz61L5KqZ+MRK+CbzJbARopkF3e9cufJKaqq2D2w9XQ46iY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713971104; c=relaxed/simple;
	bh=Cy+azT5rBaXXu4bV59nhAkztBhHnCZ72LPD9yd+NMo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jc0cIbnmGTGqYXn3h51Zr931UdZvdbjZijrnIBD/RUEuc5BlHof/hlQhGdmTO1ujwPJED3iIxQOgdCIIqQj1qkWY8H0R12S+BmO2c/OITT4C2y4TBo+eLeeFIhAnAw1Tjp3yZEM4lvyi3oRz+7+st/BA3hc9GmYZC3R6XjXMQl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8ey+9hu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713971100; x=1745507100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cy+azT5rBaXXu4bV59nhAkztBhHnCZ72LPD9yd+NMo4=;
  b=N8ey+9huinn3fRDfJiDO35ebLX6Wnwl8CmcBiHZ6c2jXmeSaC78Op5DT
   ffhFmrI1a6a0AOnFDfy36XLpkcTeIDyfArZc1Z4gADREFrwRVAs2lLq3p
   XycjScd4VwoxjrsoMn2XrVImvR7CMerd4K71PiqPsgVGIT/33CU8NX9Ta
   6VzS1Qpd6UBy9zoP/N6gRaoc3nMmQgpH1/XMcZbHlPaUki0rBtwypoRf9
   2WBq3ohVwqD+fDyUJnf2mhpqN5uYjk+r63qyI+qUDwjSWbZwHIWyS3Xh+
   aq3fOb/sfsF6n3BFr9aW+Npco7MTMjK6Kx7PQCMCRKzrLu9fr9jyQKa0q
   g==;
X-CSE-ConnectionGUID: byvHQ1D4Tv6eqeFANwmmAQ==
X-CSE-MsgGUID: fTJXkj3iSPGaIiNYNqSwwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20755705"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="20755705"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 08:04:59 -0700
X-CSE-ConnectionGUID: OOqaMZFJTpiPl+CoGiaiDQ==
X-CSE-MsgGUID: BD82SLdBS+WNP58H9zSnlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29393921"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 08:04:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzeB5-00000000gSK-2chP;
	Wed, 24 Apr 2024 18:04:55 +0300
Date: Wed, 24 Apr 2024 18:04:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wens@csie.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [GIT PULL FOR v6.10] media: various fixes
Message-ID: <Zikfl71LbB4HQLO3@smile.fi.intel.com>
References: <eafd2ebe-ed0b-43f4-b067-2ea5a26e4585@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eafd2ebe-ed0b-43f4-b067-2ea5a26e4585@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 24, 2024 at 01:48:04PM +0200, Hans Verkuil wrote:
> If there are no objections, then I plan to push this tomorrow.

No, only one thing is if it's possible to have
this one Message-ID: <20240423192529.3249134-2-andriy.shevchenko@linux.intel.com>
to be reviewed and included?


-- 
With Best Regards,
Andy Shevchenko



