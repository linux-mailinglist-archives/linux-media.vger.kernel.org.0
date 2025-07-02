Return-Path: <linux-media+bounces-36550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC42AF1482
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 092ED1BC031B
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BA42673BF;
	Wed,  2 Jul 2025 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAIhmyhN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985E72609EC;
	Wed,  2 Jul 2025 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456947; cv=none; b=awDTOXxZMcIRGTE8RIGz1RMkfBUX+7mqLiUfnXi5/fYjAuGGfnztd1taXICyQjvshrl7yRlzBp5dOTeZmpGrmHzUVTRSFRIq6hx2UbTJHLigaOuzFYZahbrJo8+5rU0QhLP/wGsxEc88UFO66utUroWGxrn6dkgYerHbxOZDpsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456947; c=relaxed/simple;
	bh=7S8TTbRAI6D+VSr2VmhATX//Kg/N5ZEOOWJqec90opI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shp4OJ/VqdGSQ83KxH8oZG4EorNVSn+OA0QXEbvWwayjlpq8+qK9bQwX5AxGhala3FGbGEV2E1w8dPNC51gfEyhe/EbE5Ql0vrCC1qamfHur/SXdxG3e6FzaCie3Rb7CSdWHuBN7AvMjegXBf6EJO71ZA5Nd9Ac29rsixV0RZbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAIhmyhN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751456945; x=1782992945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7S8TTbRAI6D+VSr2VmhATX//Kg/N5ZEOOWJqec90opI=;
  b=bAIhmyhNWvfzc3xDFwFSczR7oJyM4zTH1Cu2YeePLgdSsLVxgafCTbTR
   ttel+mXP7N8JeSGWarnMvN8nzZuHq/oIrU+hQWxnFqdv29Siyshw+2Nl9
   HBs+PEpHOc7dO+BZ2lungEs89D1REyQhqhNYteUSRZSJdtzAChnMevyps
   osT266Kdp9mPHevp0fXsXyP5dAU2lDYb3zNlMG+qp7dx4onLuz4kpYGAx
   9mKtsCY3ktq2JleDDbZluRtFTLGxEB+SFUkXDdy6I9DAwR238zzBzaNz5
   8qq/0t/JnXy7kRvC56aJZvP4It2XC7ZrOkfaqI9nqgUjoUohDJdWq0DVC
   g==;
X-CSE-ConnectionGUID: R/h5m9W8Si+WQrX/Jz+N1w==
X-CSE-MsgGUID: WYnbnmPsSKqoPbBWB0F7Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="56367662"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="56367662"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:49:05 -0700
X-CSE-ConnectionGUID: u2Qplt5xT6eAeamGXtqN8Q==
X-CSE-MsgGUID: K2fwQEKIRqCXt0KoO/fEsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158315396"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:49:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWvxS-0000000BuL3-3kTc;
	Wed, 02 Jul 2025 14:48:58 +0300
Date: Wed, 2 Jul 2025 14:48:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl, Hans de Goede <hdegoede@redhat.com>,
	u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com, stable@vger.kernel.org,
	dongcheng.yan@linux.intel.com, hao.yao@intel.com
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <aGUcqmCwmIM3sRiB@smile.fi.intel.com>
References: <20250425104331.3165876-1-dongcheng.yan@intel.com>
 <5a04f105-3075-3226-6ad6-f2c3f31b29da@linux.intel.com>
 <116ea6fa-e9b8-4c28-bc31-f4d1589eb34b@intel.com>
 <aGUPsDglThYGc/3g@svinhufvud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGUPsDglThYGc/3g@svinhufvud>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 01:53:36PM +0300, Sakari Ailus wrote:
> On Wed, Jul 02, 2025 at 06:23:19PM +0800, Yan, Dongcheng wrote:
> > On 7/2/2025 6:19 PM, Ilpo Järvinen wrote:
> > > On Fri, 25 Apr 2025, Dongcheng Yan wrote:

...

> > > I was informed about existance of this patch through an off-band channel 
> > > (as I was not among receipients). In future, please include all relevant 
> > > maintainers and MLs as receipients as indicated by 
> > > scripts/get_maintainers.pl.
> 
> Hans used to handle these previously and I think that's why you weren't
> cc'd.

There are two maintainers of this subsystem and both should be included, no?
At least I have my own script [1] to send patches and it gives a good heuristics
of who to include and not. I believe it might give better result then I don't
know how derived Cc list in this series.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko



