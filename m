Return-Path: <linux-media+bounces-25526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8ECA25327
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A1793A363D
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 07:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5408D1E7C2D;
	Mon,  3 Feb 2025 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKBttR3T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A431D86C3;
	Mon,  3 Feb 2025 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738568533; cv=none; b=EQM2iONrTIbZlnvjSURpxkoAZfGU+MWxPrkKYodBDRnInR0vVX7lKxaMPHp2sYCwPC+wCQozzS3udfqw5pJa9YI6QdwzRfifTcjrnKb4tHFqSRWhACoPUa8838E2M5U61KRs1GBsTgAKHxwSeYU1AGgTZOS2J0Dxvhoy709MIns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738568533; c=relaxed/simple;
	bh=katazDSV7EEdXGf7Dxo427M+qO+PMMAx+TwWKzD3ZLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXUlStxOJ4VDUMNKxIZlXlRCyArKUKP3vsSOzULtKIH3N+F6NPfcPEY8n1T4Iz1S6ZirTsVDlrLB5nk5en8UbqG8jjjS/KgAkJq71PabeRBY44E7lgePa6zgNFfh6TlqgkJmnkVSLfrusWsMiRovfTCrKValGTUYHwQPDvTlD3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKBttR3T; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738568532; x=1770104532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=katazDSV7EEdXGf7Dxo427M+qO+PMMAx+TwWKzD3ZLg=;
  b=eKBttR3TxHlhf5ORHRuXpuBAZRIKxo4mi7UEOl3WQTb7MKUsdGHvZEj7
   VaXywtg+GhJ15flEWb+KqpdNq8tokZ0zukVvNrTLtkW4rbkZS0d9QutKA
   U7y3xnZ7nzSe1TGksxsg1UmpqcFp0TTp5YASqv47cEleepruCkyLTMDfr
   CIDVIBYIMgFHrkDOUVjTKAucjuOY4UaL0Fm8CRjzArAoJMQXpzXZsBCtF
   75ZkfUlvCJ9T5n33CNkECWdWcpJrsd6fkLNkzEtCJuVIeutx4EOQqXs07
   pfeEaova2soCfE1uYNcsmyotvFJUzmDgG05/QqauEHvaibaW5Nmy6i7uy
   A==;
X-CSE-ConnectionGUID: 3Ny4kCmWTUie2mRAOR9lzg==
X-CSE-MsgGUID: Zm2fpL8TTuu0J/5E0XJUig==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="61522418"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="61522418"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 23:42:11 -0800
X-CSE-ConnectionGUID: U5Z7AeUDSHeh0pabKUmNJw==
X-CSE-MsgGUID: 1EDG3UtbRMWA0/vE2DlqMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110052400"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 23:42:09 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 83D0411F9C3;
	Mon,  3 Feb 2025 09:42:06 +0200 (EET)
Date: Mon, 3 Feb 2025 07:42:06 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z6BzTrBOMp5ZoKNt@kekkonen.localdomain>
References: <20250131120152.1109476-1-sakari.ailus@linux.intel.com>
 <20250131120152.1109476-3-sakari.ailus@linux.intel.com>
 <Z50F_hUKMn3W98ur@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z50F_hUKMn3W98ur@smile.fi.intel.com>

Hi Andy,

On Fri, Jan 31, 2025 at 07:18:54PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 31, 2025 at 02:01:51PM +0200, Sakari Ailus wrote:
> > The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> > documentation) but the int3472 indiscriminately provides this as a "reset"
> > GPIO to sensor drivers. Take this into account by assigning it as "enable"
> > with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> > active low polarity remains the default GPIO name for other devices.
> 
> ...
> 
> > +static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
> > +					  const char **func, unsigned long *gpio_flags)
> >  {
> > -	switch (type) {
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
> > +		if (*type != int3472_gpio_map[i].type_from)
> > +			continue;
> 
> > +		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> > +			continue;
> 
> Hmm... But why? It's more natural to test if the device even present before
> continue to check the details of the quirk. This order looks suspicious

From the result point of view there's no difference. It makes sense to test
an integer before a rather more elaborate acpi_dev_hid_uid_match(). I don't
think that needs a comment.

> and unusual. At bare minimum it needs a comment. I.o.w. the Q here is "Why is
> the type_from check superior to the device?"
> 
> > +		*type = int3472_gpio_map[i].type_to;
> > +		*gpio_flags = int3472_gpio_map[i].polarity_low ?
> > +			GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
> > +		*func = int3472_gpio_map[i].func;
> > +		return;
> > +	}
> 

-- 
Regards,

Sakari Ailus

