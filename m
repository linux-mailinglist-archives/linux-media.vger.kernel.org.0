Return-Path: <linux-media+bounces-41544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AA0B3FB5B
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD3FF7ACEDE
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7E72EE26F;
	Tue,  2 Sep 2025 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkPXHxox"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB27E27702A;
	Tue,  2 Sep 2025 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806878; cv=none; b=h3zvszNSKVk8Bbb10MJ/tv0E7SNC7+cAyXH8Y9uudhQ+zhRsVQ5t8i+/CumAutHjz7ZgK6L8vvfdAtvnG18ce/8nnybtppoJINs6fo34Wcc4jC5ij9C0bRSXLh66dJ9IXQ3l5X38PSbSLYsyftaGqN0Nb8Tg8Uc1DLLP6iIs/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806878; c=relaxed/simple;
	bh=mrWYcJsYgFEREkPfiWU5na3mwUt9On8OWsszpHczC6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjQBUcVoBDwukurCENZEIO//dkMMUhPZnRr2G7DJsxbBrL2SANcA4i+lBB+kiXvgK7Mi7mHEYbAzKrZV/jkYiVbPiDJR3WpeICcuWHm/AgkjdjGeMJnE3Slkj82wr1Qn7wPKzU/G1U6DdGUGDLlzM47msZTsTwNFRK/qNOQ8Wkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkPXHxox; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756806877; x=1788342877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mrWYcJsYgFEREkPfiWU5na3mwUt9On8OWsszpHczC6w=;
  b=OkPXHxoxtQXVWSpdzTPJb0XP2+Uc7BvaHnf2xyOuMNlcS6fJSKskLBi/
   CSIMxeuYLyFL7QgH80cjLNep7vSZrxFW9i89lYwUAs+TtPwdmEJcqFIP+
   6V1st+DKHdlTjzc3a6sCLXGRBmGK9KANU3pG5m844+Q2ZCZCnGUVwlC7H
   d3N6VYO30dtHzlMSDk35Fpr4JPYVGkz85O2xbh6tuf9Bt0cTPLQ1MR338
   /Pe5iLH48DGjDw3LdxL7RmSdLLoIZEOlbp8asI1y2g3PWOSVT7sb20b3z
   XKKNRm1Q3tWHaeu5r2I6NqQcekgglFeAFwg7DNf6+Y6VMM1OkGmdHMHYZ
   A==;
X-CSE-ConnectionGUID: HCfZlRJTSOewoE4kewEZDQ==
X-CSE-MsgGUID: L8dLCvCRSjWuhFPVgXpqrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58277748"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58277748"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:54:34 -0700
X-CSE-ConnectionGUID: aNRjji1wSgaKIaQvhq8ozA==
X-CSE-MsgGUID: nE4xiCayQya9ygb9wMscpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="176507746"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:54:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utNie-0000000AeyC-2MIl;
	Tue, 02 Sep 2025 12:54:28 +0300
Date: Tue, 2 Sep 2025 12:54:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC] staging: media: atomisp: Simplyfy masking bit logic
Message-ID: <aLa-1GPJDxpX-soG@smile.fi.intel.com>
References: <20250902073841.2338568-1-abarnas@google.com>
 <aLaypTjukJJloGuL@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLaypTjukJJloGuL@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 12:02:29PM +0300, Dan Carpenter wrote:
> On Tue, Sep 02, 2025 at 07:38:40AM +0000, Adrian Barnaś wrote:

...

> >  static inline hive_uedge
> >  inv_subword(hive_uedge w, unsigned int start, unsigned int end)
> >  {
> > -	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
> > +	return w & (~__GENMASK_ULL(end-1, start));
> >  }
> 
> nit: white space.  Add spaces.  Remove parentheses.
> 
> These are supposed to be opposites, right?  Subword and inverse Subword.
> You could dress them up to make them look more opposite.
> 
> 	return (w & __GENMASK_ULL(end - 1, start)) >> start;
> 	return w & ~__GENMASK_ULL(end - 1, start);

The problem is (and actually with the (end-1, start) above that it might
generate a really bad code on some CPUs, so I really, really prefer the way
when _at least_ one of the parameters is constant.
That said, using

	GENMASK_ULL(end - 1, 0)

in both cases makes also them look more similar (and opposition comes on how
start is being used).

-- 
With Best Regards,
Andy Shevchenko



