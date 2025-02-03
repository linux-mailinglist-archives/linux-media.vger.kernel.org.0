Return-Path: <linux-media+bounces-25536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75109A25500
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C45693A1378
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC7520767D;
	Mon,  3 Feb 2025 08:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCy6ER51"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02643207679;
	Mon,  3 Feb 2025 08:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572777; cv=none; b=klUEdSpzf1fNQ67eH4N7zeEWkG6IkI2xgsLLsNlZPX/jCgLMJ5fwBHfNe90huxF9NaeXGYwLO3A9IMrW9H/POrGIVC00lT4B6DSDUXxOcpEcN/MN0wRjl+0GFHVnyoKtQ9HhNEJLdVFj+JqwpREpDPoFNNiZJjBTzy0SEfjVnrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572777; c=relaxed/simple;
	bh=ZGPwWGeLVeOe++UrrfoXsaeFBIfC9p+T2cPY4VKlj2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Avpr/007nQ4y1GgZ2KCG8kTx4KD25a/ybE5UdSL49kDpFUFD+8JS+vgYlA49lUD6FTufbTg4nquFc0/+97imxhPD+AVun0qfz8rsHNT8UZdFDkkJrfmB6HExrMPf4emJJHGke9iy7KSAEVwHrIaePPzhj7E7Y1V7CzfRl8LHN6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCy6ER51; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738572776; x=1770108776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZGPwWGeLVeOe++UrrfoXsaeFBIfC9p+T2cPY4VKlj2w=;
  b=nCy6ER51jZOSYIDBsQXqr6WIWNp5EYQfMzQ8nB4+bXwvgj/g3FTEZNUO
   9ZD8vbbSxy244BtaA1UPU2f6gZUCgoiqH3t7v5F9P+G+BBYiyEiXO3nCy
   3OMRQz+rHvDlNdheeMM6BarG6PHhBTq7w8iQpldi/cnRhTmdNipercPoX
   87ZbLz/sjeRx3+MQ1tAGn8g/0DabRa2jhUPWgiQW45yvn0t+Ucob0PX/e
   XHmYr7N0viptaY1ioTb67iq1JlkLwpCqz4fdLW5UlpQUumfHuJYLNcpCW
   4ZXXt63IulQPb916bg6u4YQrEAaaNoQZvVa/NEj6sUEA3JNz0Xy/Kn10Z
   Q==;
X-CSE-ConnectionGUID: Y64TcKjPQNqYV2w6DBJKyw==
X-CSE-MsgGUID: lSDrKAjvTYSkjjaMDiPplQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="41889570"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="41889570"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:52:55 -0800
X-CSE-ConnectionGUID: e1LZAmxsT8aBj45m4YUbjw==
X-CSE-MsgGUID: S2tiW9vLTkeL0q/SSfdOyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114854785"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:52:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tesCI-00000007ltw-3iIg;
	Mon, 03 Feb 2025 10:52:50 +0200
Date: Mon, 3 Feb 2025 10:52:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z6CD4n8Z5PUg4npb@smile.fi.intel.com>
References: <20250131120152.1109476-1-sakari.ailus@linux.intel.com>
 <20250131120152.1109476-3-sakari.ailus@linux.intel.com>
 <Z50F_hUKMn3W98ur@smile.fi.intel.com>
 <Z6BzTrBOMp5ZoKNt@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6BzTrBOMp5ZoKNt@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 07:42:06AM +0000, Sakari Ailus wrote:
> On Fri, Jan 31, 2025 at 07:18:54PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 31, 2025 at 02:01:51PM +0200, Sakari Ailus wrote:

...

> > > +static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
> > > +					  const char **func, unsigned long *gpio_flags)
> > >  {
> > > -	switch (type) {
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
> > > +		if (*type != int3472_gpio_map[i].type_from)
> > > +			continue;
> > 
> > > +		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> > > +			continue;
> > 
> > Hmm... But why? It's more natural to test if the device even present before
> > continue to check the details of the quirk. This order looks suspicious
> 
> From the result point of view there's no difference. It makes sense to test
> an integer before a rather more elaborate acpi_dev_hid_uid_match(). I don't
> think that needs a comment.

If it doesn't need a comment, it doesn't need to be like this.
Semantically and logically it's better to read:

1. Check the device first, if not, skip the quirk.
2. For the checked device, check if the type is what we are expecting, if not, continue.
3. Perform other checks.
4. Apply a quirk.

> > and unusual. At bare minimum it needs a comment. I.o.w. the Q here is "Why is
> > the type_from check superior to the device?"
> > 
> > > +		*type = int3472_gpio_map[i].type_to;
> > > +		*gpio_flags = int3472_gpio_map[i].polarity_low ?
> > > +			GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
> > > +		*func = int3472_gpio_map[i].func;
> > > +		return;
> > > +	}

-- 
With Best Regards,
Andy Shevchenko



