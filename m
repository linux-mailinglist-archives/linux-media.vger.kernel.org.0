Return-Path: <linux-media+bounces-29311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E78A1A7A178
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 12:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ECAD1723DD
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 10:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BD624BC00;
	Thu,  3 Apr 2025 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="em4UAbTB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422D1624E0;
	Thu,  3 Apr 2025 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677899; cv=none; b=tTaeYcQyomSoO35uqyR3fF56CZOkP6tWW3m8Earzal+dz6UdGO+tVJCj4XljQcA/7L0t7pSuwZJHsnoKo30kudEeC9ckw59r1mjJi+5N+RNRUzyLnZKGlNRF3cEiN6Uj+rJME3EwzcbFm8Y6VPUXtGXzC9Od9ke9hlABtUrkJdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677899; c=relaxed/simple;
	bh=9H/006uzT4PZBYnGc5gHSBDp37+pIiZD8lI/MwS4PhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBYXSaQ8e4Xb6mB+0WKsFJqLukO2QTTQ75s2OIDDdPkQXAMQOB2F8aOqUJkuSyreiamlCEvi+39gqnshWHNVillahJsir8SOuwyX4VBgxOHTDre+lY5Zsuhx3mJXi/aW8wyYYFwm5Gl4Tspq4n7D57Rgtr5oq+1NFOPN29AjyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=em4UAbTB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743677898; x=1775213898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9H/006uzT4PZBYnGc5gHSBDp37+pIiZD8lI/MwS4PhQ=;
  b=em4UAbTBolhaS078hJN6tYl7b//rQsIDLzmLt/mM2H4IMtRzi7dCF6JI
   tV42VGcspdx43TmPw+pxv4Ts9cmMS/SgLxvebJN9cF1Dpjvo9pFNZO/ZW
   28/NgwsiB6e3/ZG313JE4USGbQjLwsOyJ+LsJu1I6NohWNbXvdYn8dyBH
   19se+yh07Z6rbJfMrtA/Z+XK1vqXxyQ/rXwtaSamj+xicx2TXeDIQrgBB
   S+yyfIBoNnBrYi43v/gfCz8cKtSlrNOdnW2+plFlNdyy7ET0HXZ3k0s4c
   IihHDK9aCabqZ4UcobPGP5nEzA8Y4ADABmwiL+DzxuvBfo9Wp0kru2BgK
   g==;
X-CSE-ConnectionGUID: M41QbXgnQbiceWQrNkhEYg==
X-CSE-MsgGUID: DY0vusqZTYKu4SVVVK3IGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44791940"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44791940"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:58:17 -0700
X-CSE-ConnectionGUID: HYqabUctR+aelXQnabZ4eg==
X-CSE-MsgGUID: liPbEOD6QlWXYBPCMEwHIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127485117"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:58:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0IGw-00000008mUF-26eN;
	Thu, 03 Apr 2025 13:58:10 +0300
Date: Thu, 3 Apr 2025 13:58:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: ds90ub9x3: Remove unneeded
 of_gpio_n_cells assignment
Message-ID: <Z-5pwpoYEKKmtmPA@smile.fi.intel.com>
References: <20250331070200.3985562-1-andriy.shevchenko@linux.intel.com>
 <c7fd0bd4-4fc8-43f0-b980-b49472e76445@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7fd0bd4-4fc8-43f0-b980-b49472e76445@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 11:07:40AM +0300, Tomi Valkeinen wrote:
> On 31/03/2025 10:02, Andy Shevchenko wrote:
> > The default for of_gpio_n_cells is 2, no need to assign the same
> > in the user.
> 
> Where is this documented? I'm also having trouble finding the
> implementation.

The idea was introduced back in 391c970c0dd1 ("of/gpio: add default of_xlate
function if device has a node pointer"). But now I realised that it was never
assumed that default is 2 for the cases when the ->of_xlate() explicitly
provided. So, this is wrong patch, thanks for the review!

-- 
With Best Regards,
Andy Shevchenko



