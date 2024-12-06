Return-Path: <linux-media+bounces-22805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 783F19E7475
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 16:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 387AB286487
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 15:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58B020DD6D;
	Fri,  6 Dec 2024 15:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH3EJflg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA00B20DD43;
	Fri,  6 Dec 2024 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499279; cv=none; b=pLpo6hp5rNF+Ax6eQvF+OLBkwn4ceYaROnyLgjrkCOD97NrPM9QkmtQi3fnv2J8m147qxEEmq7YK3fAgsABZvWG7lrMAyrXlbYk6OaIV8ePRtTxERumzSTGewjzFDxTDGYS+2+sqEL/mcMdt9zGsaI9+HZeD7cjbdkJUg4k0NA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499279; c=relaxed/simple;
	bh=ob41PRiaHdvAd/92XG25/M3XLgXJ0Gvcu2eu3AUbA10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0hxAd0tQ3YG9435rVBaohl7xoLYPZXoSIZrDxCC8yiwOSrra0UcyMhkSW1jNYltmP5VSbg+n1Y/rgf7FDQH6Xp7X7+AOyt89HwVIVxr4aZ92ZAezFqLOZH2m1Ynm1tTQBDYd8AD4m2O9RZOt37gg33NPtOVh8sVuHck+Q0ory8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH3EJflg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733499278; x=1765035278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ob41PRiaHdvAd/92XG25/M3XLgXJ0Gvcu2eu3AUbA10=;
  b=SH3EJflgAoiQyKt4SMWi2yuSxn+un+gxIb43xcS7lDTX8pcrVAxTc6g6
   9M4zGdosZYM+QfvfC4nMCqnt2CDLlTm1+m7uwkrTzZBWG/JOxCqytNlJM
   A5HAMx4KoUXWs9CwPUyEtlVhXRCkGnPXo+qMauY2jYC/zJdYFClZ22We7
   HIuoGm+8xPrY1/lpmcqNFTqm2gZyJxJiIxhn35WVhWcAY/QGWi5ag9eTp
   56hvUv72yS88oFmgm4MEctBddgke6ScM8U0JUBBRwHWaLpWAiUwdtqegf
   f0bw8Q0+oYy5yRi7PUlPYtQw8pBxyfCbLVvu1s38fcqONyZawAkpD1eW5
   g==;
X-CSE-ConnectionGUID: W+2ykv6BTP+gHHm1iuPXZw==
X-CSE-MsgGUID: 7a1FdrI+QhqximobE5YpRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="37532711"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="37532711"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 07:34:37 -0800
X-CSE-ConnectionGUID: 0em8r/N5T4K1gQcKO5CJkw==
X-CSE-MsgGUID: qvYEIrRqRna769XkvZQp/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="94634366"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 07:34:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJaLg-00000004YPX-31Jl;
	Fri, 06 Dec 2024 17:34:32 +0200
Date: Fri, 6 Dec 2024 17:34:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 00/15] media: i2c: ds90ub9xx: Misc fixes and
 improvements
Message-ID: <Z1MZiFg76jlZ4eDE@smile.fi.intel.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 06, 2024 at 10:26:36AM +0200, Tomi Valkeinen wrote:
> This series fixes various small issues in the drivers, and adds a few
> things (a couple of pixel formats and a debugging feature).
> 
> It also takes a few steps in adding more i2c read/write error handlings
> to the drivers, but covers only the easy places.
> 
> Adding error handling to all reads/writes needs more thinking, perhaps
> adding a "ret" parameter to the calls, similar to the cci_* functions,
> or perhaps adding helpers for writing multiple registers from a given
> table. Also, in some places rolling back from an error will require
> work.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



