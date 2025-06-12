Return-Path: <linux-media+bounces-34616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07822AD6FF0
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56F9017BF80
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9AB22173D;
	Thu, 12 Jun 2025 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gudvIHpO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26F1EA65;
	Thu, 12 Jun 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730525; cv=none; b=c1l7IasFm0k2D/7u0uv2T60z6Ib3fIhUru6ukvtLqh4MLym9r3ec35eQj/5iTucKL2h3mFsHkTVOuazjMwPsnpzkQEOc1mzMbtv5XYDBt2+q7ZFvQH3l0Y5K5Fp+gVEYV6db3i9PImehmVTpp0uDsG+LDnrDqfuBmTGz+X6fB/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730525; c=relaxed/simple;
	bh=oUg64Lp4ouK6DMtf4tzr73t1t8m/jAYlfcW8PGJ+fzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bc0W0lpd9O9STtsi2YbPjpEXt6JU7Vm3cGbImkKcmCxNyXTHsnidc5uSQQYMdwkTyffE+T9hs697YccA68nzFM5/P4/OArcCFkC28+TgczuhEqPGS7f9WqVyzzclHbZ3HUCSO/BAuIk4LxscXJWmYP8iLbaFPDNHCttxeyqleXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gudvIHpO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749730524; x=1781266524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oUg64Lp4ouK6DMtf4tzr73t1t8m/jAYlfcW8PGJ+fzw=;
  b=gudvIHpOogvJ1oomOzmJdDXea5Ro5u6WnR0mgTA1uDZouSKWvXKxuI0Z
   3/ZSiZBaRIpt6HNYrXkjyWKXoT0VwIWjyoHJWvuBzHR7gyr07MwDTqhxG
   vIxvmz5hv8sCEpW/pxhezMNdJ5d04UJW1U7BI6avTmLswH0Y3jwDji9ec
   JZM/BuToiFEDBAkMaJpZiRkCniO1Je53ItJ70U1erS3E5bOOCfNEmlHSo
   NMtpoRGemPNGMFSQJ2EU1DNuO0B0sZlRqLECDracHXoZEiC6uKTIpQ7SM
   2J+uq2zS8YixhNQQk1Oqi9eQey7VxtrBL7qevWbFKAhwjSKDl36XBXfjP
   w==;
X-CSE-ConnectionGUID: DUucQXSYQ0eqOfs9SBM8ZA==
X-CSE-MsgGUID: OIUHbBCaRpaG9471qKIDMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51993046"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="51993046"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:15:23 -0700
X-CSE-ConnectionGUID: b6K50vP/RgyjqUsunZmkZw==
X-CSE-MsgGUID: mi6lf1KhQBeM98UX02mCJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152412828"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.205])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:15:19 -0700
Date: Thu, 12 Jun 2025 14:15:10 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com, 
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, 
	naush@raspberrypi.com, mchehab@kernel.org, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, arnd@arndb.de, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <hgczrxw25a7jn6ubuwijga7yn7epek4yhtya2gnd77awsgxdgs@lv2oxey567hu>
References: <20250521104115.176950-1-mehdi.djait@linux.intel.com>
 <mwh7xx675kulx6tdebuvqtdjfa4ih3ehi2brrcdxfemfnvxsrs@i5nxkvfskfhe>
 <20250521110944.GG12514@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521110944.GG12514@pendragon.ideasonboard.com>

Hi Laurent,

Thank you for the review!

A very small question below.

On Wed, May 21, 2025 at 01:09:44PM +0200, Laurent Pinchart wrote:
> On Wed, May 21, 2025 at 12:52:08PM +0200, Mehdi Djait wrote:

> > > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > > +{
> > > +	const char *clk_id __free(kfree) = NULL;
> > > +	struct clk_hw *clk_hw;
> > > +	struct clk *clk;
> > > +	u32 rate;
> > > +	int ret;
> > > +
> > > +	clk = devm_clk_get_optional(dev, id);
> > > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > > +
> > > +	if (clk) {
> > > +		if (!ret) {
> > > +			ret = clk_set_rate(clk, rate);
> > > +			if (ret)
> > > +				dev_warn(dev, "Failed to set clock rate: %u\n",
> > > +					 rate);
> 
> I would return ERR_PTR(ret) here.
> 
> > > +		}
> > > +
> > > +		return clk;
> > > +	}
> > > +
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> 
> And here, return a fixed error code, maybe -ENOENT, as propagating the
> device_property_read_u32() error could result in strange error code for
> the user.

device_property_read_u32() returns the following:

Return: number of values if @val was %NULL,
        %0 if the property was found (success),
          %-EINVAL if given arguments are not valid,
          %-ENODATA if the property does not have a value,
          %-EPROTO if the property is not an array of numbers,
          %-EOVERFLOW if the size of the property is not as expected.
          %-ENXIO if no suitable firmware interface is present.

Don't you think it is better to keep the return value and not overshadow
it ? The function is well documented and this may help understand where
the problem comes from if getting the clk fails.

--
Kind Regards
Mehdi Djait

