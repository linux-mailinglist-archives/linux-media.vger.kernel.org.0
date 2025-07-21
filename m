Return-Path: <linux-media+bounces-38142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DACCEB0C14F
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 12:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F8B41759D2
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 10:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6995228FA9B;
	Mon, 21 Jul 2025 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7PabAcf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2DC2877F5;
	Mon, 21 Jul 2025 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753094321; cv=none; b=b3N24wy1xLSOGAcCBWpyEj5jAXVF7q/ZSWDcENS4kM0qwzyxySi+EtKBBeUSr9RumpABSe4B6V1aUAMz/BSbM9GTpvSlKsZBfsUPGBg+0pi21qLHhX9XfsuKp83Q+t9zuVljwzFZlK6YmsxUzajOs1JOadH/feeHg+5OHHaL78Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753094321; c=relaxed/simple;
	bh=b3BUzd5cXJbCKdreEUnq8PGiM1/tFuKiB7Qk0nwPZGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=focohPP1kxX7Z5NeqRa9Rbv5+r/Cg4ZIPJSVZcl8LHKbDuCyQ/lgoK92hI90LG0/qdZvLuhWoNfpn8vpFHMMIONlYteyF7oZ6zdGJ+SqcnRo+a0wc0f1RArbPsmC3G08MatDdGt7/j//VTb8mRZbQYLCs4M3dYzhM5Yysy8pMTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7PabAcf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753094320; x=1784630320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b3BUzd5cXJbCKdreEUnq8PGiM1/tFuKiB7Qk0nwPZGk=;
  b=H7PabAcfEPo9astY8BkLaCYGntZoEl1UgwElR5BMBRZ7mYrbpk0vUqSt
   80GxVg02KBxZkrjrz96YVrPlf99ZdyJ1rwxbZ3BzCdvVRa40r+SGlQvMK
   zcdqjkHdgvl6KM4zqAX/GbWy8Ums3x/UEIX1Ss0xYxbjShP6sGxy/WdDr
   g03ognpzF8LxhstPDafyv8ARzQ0WEY2DgHzxnPGd7KdGzCY8ro7icaC0X
   MOl1Q4tdRwywH1BYWJ6RX2GpA4TM1s1wH37zUZ652wLY/uqfC2Cs18VFk
   yA3SWhsStaZNK+PERXNvNO0sHU/uNv0izt/s0o2C1sxDX4jkdRK6PodGt
   w==;
X-CSE-ConnectionGUID: Kl5oEtLrQLCblDVEWsOuPg==
X-CSE-MsgGUID: t813He2pTnWwvbdQ33RpHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="59117259"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="59117259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 03:38:39 -0700
X-CSE-ConnectionGUID: 19iTBh0xQ0OdWgVOkZaL7A==
X-CSE-MsgGUID: Cr9SPju9Sv++0pQMRMCzSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="162839888"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.62])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 03:38:37 -0700
Date: Mon, 21 Jul 2025 12:38:28 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
Message-ID: <6w5vwjdhs2mbidaadzkkwx32rr6fkfqgrjlvbu7kvcre34rmn2@qifmnxaertxo>
References: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
 <20250717124001.108486-3-vladimir.zapolskiy@linaro.org>
 <175276139540.560048.14744394485094549778@ping.linuxembedded.co.uk>
 <CAPY8ntCiKFFdfepqW0ms_0dhCtJJCwJoT=bxmJ5i0K254i6fkA@mail.gmail.com>
 <7bb16a20-166a-477d-a103-a00fe83ecb66@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bb16a20-166a-477d-a103-a00fe83ecb66@linaro.org>

Hi Vladimir,

Thank you for the patch,

On Fri, Jul 18, 2025 at 06:27:54PM +0300, Vladimir Zapolskiy wrote:

[..]

> > > > +
> > > > +       ov6211->xvclk = devm_clk_get_optional(&client->dev, NULL);
> > > > +       if (IS_ERR(ov6211->xvclk)) {
> > > > +               ret = PTR_ERR(ov6211->xvclk);
> > > > +               dev_err(&client->dev, "failed to get XVCLK clock: %d\n", ret);
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       freq = clk_get_rate(ov6211->xvclk);
> > > > +       if (freq && freq != OV6211_MCLK_FREQ_24MHZ)
> > > > +               return dev_err_probe(&client->dev, -EINVAL,
> > > > +                               "XVCLK clock frequency %lu is not supported\n",
> > > > +                               freq);
> > 
> > This would be nicer to make use of the cleanups that have just been
> > implemented in
> > https://lore.kernel.org/linux-media/cover.1750942967.git.mehdi.djait@linux.intel.com/
> > and
> > https://lore.kernel.org/linux-media/20250710174808.5361-1-laurent.pinchart@ideasonboard.com/T/
> > 
> 
> Actually I've already checked it before publishing the code, as a summary:
> 
> 1. to my understanding the introduced API is still under review, I didn't
> find it in media/master or linux-next,
> 

It has already been reviewed but yes still not in the media tree.
Too late for 6.17 but it will be in the media tree soon.

> 2. the only needed change to get support of the new helper is to replace
> the single line of devm_clk_get_optional() with devm_v4l2_sensor_clk_get(),
> no more than that,
> 

Correct.

> 3. the internal complexity of devm_v4l2_sensor_clk_get() seems excessive
> right over here, what's worse I can not test devm_v4l2_sensor_clk_get()
> in this driver on any ACPI platform...
> 

You don't need to test it on a ACPI-based platform to use the helper, if
it works for your DT-based platform that's enough.

> To sum up and to minimize the overall complexity, I'd rather prefer to
> stick to devm_clk_get_optional() at the moment, the switch to the new
> proposed API can be done, when it's ready.
> 
> -- 
> Best wishes,
> Vladimir

--
Kind Regards
Mehdi Djait

