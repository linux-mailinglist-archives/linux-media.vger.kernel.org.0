Return-Path: <linux-media+bounces-30485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CA1A922A4
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 18:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5538188B7C1
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 16:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736CC254867;
	Thu, 17 Apr 2025 16:25:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0DC320F;
	Thu, 17 Apr 2025 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744907133; cv=none; b=Wu5VDGpLItuxEZtiqunO3qXgQ7061gxJ0uIbe6WfUJMWBDWdR+3LbdMi2tiw4k+EDQ7E0I8jffV2MfcAWEeVPwqM92DMk/xmNdxSG5znbFIqC9y+xYY1NxtuJO4gax+4Rf1JVLYkyODVUUKo2voc2xm1W7GnmDaO8TXPxqY7iY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744907133; c=relaxed/simple;
	bh=mM6lullI1N8Yc3953w7MKHtByzV9DToaF+8uOVFCncw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlsO7My28RnPMMJAS1Jo+m4SFGxMQAQ3+NvwTQgr3qKzX8BJVvdSh6U7pkpLw7RJqkVDAYKPyncns7JwVShyxtATi8y/xvk1Fz1ngo5NzkoB7PZaRJSqzyWhlGh6NIRrF4rbauJ8O8veckN5ZdrYt/oKgqwZqYqOGBixPv0vgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: TAKSIBzeSZ2K8T4mkfPNjA==
X-CSE-MsgGUID: bWpY6/vXTCCQ5SCT2BvkIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50155910"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="50155910"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:25:30 -0700
X-CSE-ConnectionGUID: 7mRZJn5DQ6mIaNwRYSi0wg==
X-CSE-MsgGUID: 26khY2ADRGOD/mfWmSQALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131164976"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:25:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u5S3J-0000000DFgI-2dTr;
	Thu, 17 Apr 2025 19:25:25 +0300
Date: Thu, 17 Apr 2025 19:25:25 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 5/9] platform/x86: int3472: Make regulator supply name
 configurable
Message-ID: <aAErdSgr_F8L7Sgw@smile.fi.intel.com>
References: <20250417111337.38142-1-hdegoede@redhat.com>
 <20250417111337.38142-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417111337.38142-6-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 17, 2025 at 01:13:33PM +0200, Hans de Goede wrote:
> This is a preparation patch for registering multiple regulators, which
> requires a different supply-name for each regulator. Make supply-name
> a parameter to skl_int3472_register_regulator() and use con-id to set it
> so that the existing int3472_gpio_map remapping can be used with it.
> 
> Since supply-name is a parameter now, drop the fixed
> skl_int3472_regulator_map_supplies[] array and instead add lower- and
> upper-case mappings of the passed-in supply-name to the regulator.

With a comment and static_assert() LGTM now,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



