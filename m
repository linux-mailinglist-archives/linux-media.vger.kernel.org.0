Return-Path: <linux-media+bounces-11400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1728C3E97
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 12:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65F71281429
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 10:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC71149DE0;
	Mon, 13 May 2024 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rxl+acGV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AF4148852
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 10:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715594842; cv=none; b=RoZR8wsoOP7GEaDYhdtwa4KSgnfnxzC7JY2qNPntNn0caGvVawggeQLHTEkJ30Dq9n7qB5I8qlITL/J7TMkS0+hzUXXKRA+LNFUqeWmZ+Vh2C5xrmq4Wp6sQfhVSU1LONyT2IdJ71HgF/PgFSFkv+2p7eG6xTh3dANlzk1R4hTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715594842; c=relaxed/simple;
	bh=8VptnbFSc/ceUWaL1K+qIX10b+ia288RLpHWvE40RlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zb7NSTTf3qPvTsprvP9scjK6al52w3PwU1zGqIOsMfx0JQ0YBS1rhmf3FbakVdqvS8GxYGs1+JgXzwXN8xz9iDz0wwjgs88YzrZrVqPGqBsavnE0iJDfYH6T9ZB7khDV4qNHAvv9q1S9lIKvEYOnXtxdQJOexubAxPcS+YZOyRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rxl+acGV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715594841; x=1747130841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8VptnbFSc/ceUWaL1K+qIX10b+ia288RLpHWvE40RlA=;
  b=Rxl+acGVp68WSJK16cggV7WWXZTULFAw64ZRrrGgIxpR9foP7FxvD8o1
   ZYFLPTKCBdecECDk8D91OgNpSZLoN0STYGR/7t3oLpF0tQkvXg6wkUT9E
   6GVbAmkmzAPEfHWKACYwV6/ldEDwkBrw/i53qDYFWcNqAZFWg5tlDE5DF
   1qz050j8uaYzPqzxT0X/kE+BmL1MStbOJnRuAC1pVbYPyPIVMca8sCxoO
   O6KUzkHNjugtsjT8fPm6qCYSrwiYSxkRDdUDI7QD41KGJrAvnOmG+k/6l
   pSzTRd36XDqI5mFav9Qr1IUylnJQDAGNMnfHlomr88QpskbwGgSJcnEst
   Q==;
X-CSE-ConnectionGUID: /6ud6nEWQb6ZW8oHo7BwSQ==
X-CSE-MsgGUID: AyOXVHHZSQS9Mxr5cTEVsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22097022"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="22097022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 03:07:20 -0700
X-CSE-ConnectionGUID: hLIlnXrUR3GkVNdj7lWrcA==
X-CSE-MsgGUID: ZnwwH1EJRsK1y+PCpX5+4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30850060"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.213.18.189])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 03:07:19 -0700
Date: Mon, 13 May 2024 12:07:16 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ov2740: Ensure proper reset sequence on probe()
Message-ID: <ZkHmVNloIZBY58d8@linux.intel.com>
References: <20240506132438.278920-1-hdegoede@redhat.com>
 <Zjy2ksnLCvKuWv4u@linux.intel.com>
 <f74981e4-ad5c-415d-9f1a-d03a8194db25@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f74981e4-ad5c-415d-9f1a-d03a8194db25@redhat.com>

Hi Hans

On Thu, May 09, 2024 at 03:42:25PM +0200, Hans de Goede wrote:
> Hi Stanislaw,
> 
> On 5/9/24 1:42 PM, Stanislaw Gruszka wrote:
> > On Mon, May 06, 2024 at 03:24:38PM +0200, Hans de Goede wrote:
> >> Before this commit on probe() the driver would do:
> >>
> >> reset=1                // from probe() calling gpiod_get(GPIOD_OUT_HIGH)
> >> reset=0                // from resume()
> >> msleep(20)             // from resume()
> >>
> >> So if reset was 0 before getting the GPIO the reset line would only be
> >> driven high for a very short time and sometimes there would be errors
> >> reading the id register afterwards.
> >>
> >> Add a msleep(20) after getting the reset line to ensure the sensor is
> >> properly reset:
> >>
> >> reset=1                // from probe() calling gpiod_get(GPIOD_OUT_HIGH)
> >> msleep(20)             // from probe()
> >> reset=0                // from resume()
> >> msleep(20)             // from resume()
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > 
> > This fixes this issue:
> > 
> > [    7.742633] ov2740 i2c-INT3474:01: chip id mismatch: 2740 != 0
> > [    7.742638] ov2740 i2c-INT3474:01: error -ENXIO: failed to find sensor
> > 
> > for me as well.
> 
> Thank you for testing.
> 
> However there is still the issue of the sensor not always starting to
> stream reliably being discussed here:
> 
> https://github.com/intel/ipu6-drivers/issues/187
> 
> I have been thinking about this and I think that something like this
> should fix this, can you give this a try (with the patch to disable
> runtime-pm reverted) :
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index c48dbcde9877..58818bcfe086 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -1294,7 +1294,14 @@ static int ov2740_suspend(struct device *dev)
>  	struct ov2740 *ov2740 = to_ov2740(sd);
>  
>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
> +	/*
> +	 * Ensure reset is asserted for at least 20 ms before disabling the clk.
> +	 * This also assures reset is properly asserted for 20 ms when a runtime
> +	 * suspend is immediately followed by a runtime resume.
> +	 */
> +	msleep(20);
>  	clk_disable_unprepare(ov2740->clk);
> +
>  	return 0;
>  }
>  
> @@ -1308,6 +1315,9 @@ static int ov2740_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	/* Give clk time to stabilize */
> +	msleep(20);
> +
>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>  	msleep(20);
>  
> 
> Hopefully this will fix the start / stop stream issues when runtime
> pm is enabled.

With the both patches I have quite good reproducible "chip id mismatch"
problem. I test patch 1 and patch 2 separately and both of them together.
Unfortunately non combination fixes the issues: mismatch and steam
start and some other problems with ov2740 on my lenovo x1 laptop

Looks previously I get good result with original patch just by sheer luck.
Those are random problems and reuire more testing before confirmation
of fix.

So sadly I have to scratch result that original patch fixes chip mishmash id
issue :-(

Problems need to be properly debugged and require deeper investigation.

Regards
Stanislaw
   

