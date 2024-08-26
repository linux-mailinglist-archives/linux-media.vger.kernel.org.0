Return-Path: <linux-media+bounces-16855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0647D95F879
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 396871C225CD
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B5D199248;
	Mon, 26 Aug 2024 17:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKuyWnH7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7746198E6C;
	Mon, 26 Aug 2024 17:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724694274; cv=none; b=aIMjtpDqAvf4ZtmIxT7W6o/XKUDs0Inj/foP3DQjc3a7DNbKi9bo1tlz0ynASK2HULTYMJELCUq0YiJZevRy+Ns6wLd9Fhzfu6HUc03DVfPwFIDwkFbqseB6TaM+0uB4BmwuNjPVxN/bwe1pe6sWbqnW1AzoMwYMwmFfGo4O6eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724694274; c=relaxed/simple;
	bh=a5FzUTnE9HADVd0iHq5kRlEPg4MhnxIDXhDxBBh9q5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biDWpTBhMfhl6/dM/bKH8hPFeoWMpirTQ8kk3dHKZyoSrpRBsPFzq2s0jqIJkvvvE36fQOO0J1YEfnN4188iWpByr3F9Yrt7yo9xK6YL3bKR29CpB1PpAucRFOJEHAwR0w1FZhs4QernA8etWLUJPgo7GnjXwFmX12heWr/pELI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKuyWnH7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724694272; x=1756230272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a5FzUTnE9HADVd0iHq5kRlEPg4MhnxIDXhDxBBh9q5M=;
  b=YKuyWnH7DnLYZligp/IWQqitsIgF3SjL/WxbEyGl/cPcVkb0tXYDyB9c
   x4yM/ZGFnuhn5mSP/XIp3DtZWWZnS7XAoNdf7mhExHI2f1eJQNwk3zl8y
   BVqgG6E8ppXTZWZUzUYNOaL5jIOrm4dMIk5VxB8b3PPdKfgsgpmrRkNOw
   Wl0rtb1YPjfCmPArJG2i9EEIf7Zh7mTdbS025NuVWLYXKQx+cMZxrwEdg
   ///Wx/zsFG95X0+pMUqs3pyTsfYGvD3Iu+0kFx619xpE5m6m5mXcstoSR
   m9ReCglJvx4A9pie3zDDbfcy0lwcDoHy5D/ojyxl8dGVKlcQMvmJhmyP+
   A==;
X-CSE-ConnectionGUID: aDCSvph5RaWKyQ872opFNQ==
X-CSE-MsgGUID: 0+z+CK7LSoyItVOHQ/Iwvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22730130"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="22730130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 10:44:31 -0700
X-CSE-ConnectionGUID: EAKVgrsOQ0qjFLMDWPEuhA==
X-CSE-MsgGUID: Wu7q6B5aS32in6O5qJCBCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62640390"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 10:44:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sidlL-000000021ng-2l5k;
	Mon, 26 Aug 2024 20:44:19 +0300
Date: Mon, 26 Aug 2024 20:44:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sebastian.fricke@collabora.com, linux-doc@vger.kernel.org,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, s-jain1@ti.com,
	r-donadkar@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andi.shyti@linux.intel.com,
	nicolas@ndufresne.ca, jirislaby@kernel.org, davidgow@google.com,
	dlatypov@google.com, corbet@lwn.net, broonie@kernel.org,
	jani.nikula@intel.com, rdunlap@infradead.org, nik.borisov@suse.com,
	Dave.Martin@arm.com
Subject: Re: [PATCH v2 1/6] math.h: Add macros for rounding to the closest
 value
Message-ID: <Zsy-8xXQ01-JhL0m@smile.fi.intel.com>
References: <20240826150822.4057164-1-devarsht@ti.com>
 <20240826150822.4057164-2-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826150822.4057164-2-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 26, 2024 at 08:38:17PM +0530, Devarsh Thakkar wrote:
> Add below rounding related macros:
> 
> round_closest_up(x, y) : Rounds x to the closest multiple of y where y is a
> power of 2, with a preference to round up in case two nearest values are
> possible.
> 
> round_closest_down(x, y) : Rounds x to the closest multiple of y where y is
> a power of 2, with a preference to round down in case two nearest values
> are possible.
> 
> roundclosest(x, y) : Rounds x to the closest multiple of y, this macro
> should generally be used only when y is not multiple of 2 as otherwise
> round_closest* macros should be used which are much faster.

I understand the point, but if you need to send a v3, please explain
the equivalency between roundclosest() and one (or both?) of the
round_closest_*() in case the argument is power-of-2.

Because from the above I don't see what I'll get in such a case.

-- 
With Best Regards,
Andy Shevchenko



