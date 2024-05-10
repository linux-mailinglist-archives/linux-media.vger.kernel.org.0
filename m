Return-Path: <linux-media+bounces-11337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9CC8C27F3
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BB4AB2495F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34FB171E6A;
	Fri, 10 May 2024 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAtPk/Ly"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEAD17166A;
	Fri, 10 May 2024 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715355403; cv=none; b=AGYOezCVb5qP2IHdsl+/JEvrDvQO8FQlnLURaptRk62zi3m6ay5ps3b9rn6ZeDwTzOHWdsaPcZ5xH43UbZmPRDQvLd8xfk72U9rWP26rTwe0iR8AJZLAlva6u3wtaQiYrjLlGi3WHP4oMSFXstbcRJ3yE1wKqX88KhBWKGYFbVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715355403; c=relaxed/simple;
	bh=ydiicGiKxdyumvATfb+liZuLZxRPWy6h/PLVbPk+dlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZK8aES6/axYudfwbMl1i8si7NHC4ayVe0jbqxWLmP4hdfzhPwI+wpybpeoykcYZ3plVK1n0f0TMk3Bn+Rz43QdrH+dV93YGAdRk34nSc1oWQ4HWcPcEVqWEmWvIKE/i8pdzGDoGU0DKxfm0jXnPLTZndtQ5fr6ap5d68ySVsiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAtPk/Ly; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715355402; x=1746891402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ydiicGiKxdyumvATfb+liZuLZxRPWy6h/PLVbPk+dlc=;
  b=LAtPk/LyQZShLvbcoLxYrNOsrNjH14VK6dUwr6/bCp0SH7eQtDi6tid0
   PmRp7vudnW+4ogEcg9SfPEktQlSlYrbqTGnJSCpza3Z90kqYONmfmMuJx
   hK0qN0gf6gayHBdq2s2QrKRbvV1d3H+ZtwU8AG1BeLOPnOH2Yy4I9hm0u
   hl+B2SUcZNEUJMKA29rFHxx+Uv3gn7EUL7AYqJg1hdUmKEKSCZqf2ip0E
   ThOiwBuE4pbq67K8+kLEe6kuAGcwKRkrrWRuv/PPZhR7ZlxTZs5p5OdzU
   SPOr8+XsRwavQUoJ2Jeto6g6ESYioh5NvC3dgScpdHmdKHAgfA+6ryHWH
   w==;
X-CSE-ConnectionGUID: 5djRvdnUQ4mv5k0mh1kurw==
X-CSE-MsgGUID: 0QfRFT9+Rvmnl2BD0qL2dQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22493693"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="22493693"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:36:42 -0700
X-CSE-ConnectionGUID: PnTLVcqWTgKz+1FNNtnZtA==
X-CSE-MsgGUID: y3pQmouDRhS5nTk+mWLFug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="30032098"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:36:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5SIW-000000069FG-1ESn;
	Fri, 10 May 2024 18:36:36 +0300
Date: Fri, 10 May 2024 18:36:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <Zj4_BBsUYuAeiOpr@smile.fi.intel.com>
References: <71dad56e-0e2f-48ba-90bc-75096112a1ba@moroto.mountain>
 <Zj46vpwTbfde4YX2@smile.fi.intel.com>
 <4ade89f8-cbd3-4dbf-81fb-0e9a4269dc0f@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ade89f8-cbd3-4dbf-81fb-0e9a4269dc0f@moroto.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 06:27:30PM +0300, Dan Carpenter wrote:
> On Fri, May 10, 2024 at 06:18:22PM +0300, Andy Shevchenko wrote:
> > On Fri, May 10, 2024 at 06:10:37PM +0300, Dan Carpenter wrote:
> > > Return -EINVAL if "bridge->n_sensors == 0".  Don't return success.

...

> > >  	ret = ipu_bridge_connect_sensors(bridge);
> > > -	if (ret || bridge->n_sensors == 0)
> > > +	if (ret || bridge->n_sensors == 0) {
> > > +		ret = ret ?: -EINVAL;
> > >  		goto err_unregister_ipu;
> > > +	}
> > 
> > I would split:
> > 
> > 	ret = ipu_bridge_connect_sensors(bridge);
> > 	if (ret)
> > 		goto err_unregister_ipu;
> > 
> > 	if (bridge->n_sensors == 0) {
> > 		ret = -EINVAL;
> > 		goto err_unregister_ipu;
> > 	}
> 
> It's always hard to know which way to go on these...  I wrote it that
> way in my first draft.  It's my prefered way as well but not everyone
> agrees.  I'll resend.

Is the generated assembly the same?

-- 
With Best Regards,
Andy Shevchenko



