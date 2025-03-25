Return-Path: <linux-media+bounces-28736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C689A7076E
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38C0718881AF
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE2D25EF90;
	Tue, 25 Mar 2025 16:54:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED219EED3;
	Tue, 25 Mar 2025 16:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742921643; cv=none; b=vCzmzYCcodTYqR2XhWTPLuxHhI/Lf9TQrBko06eWAdKlCAESEKkQ/xbULfUobAHtJ9FV48ZfK5LCI7lhl1t8BbBrBk9ptukq3dd244U0QW35mcN8oLA67CC1QKL9PXe99GqMeC4GEl4WSk9ti0EBumOdVvygXYwnvdmloDsu6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742921643; c=relaxed/simple;
	bh=YH9BMHnUagWKdM0JG1Wjd6RQa8JyZ8QJkS1Gq/tlWig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWW71hot4OANKJ0Xp5Pkr8ev9mnwCFfPyY9RVbZ2ZzQfwoDeEOJGz6wjYuOPlpveE9z1W9yWNJAehuxbbP/+gRB94MTOHDKhRr1tBnytdvixfWFMkmGWK+J5lWGkqI/aNFBJXMDU9a6yAYuOi1MfzX68GCEy6NDhFQaSAJC/rSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: XoJvmaNmSzGEN6YOvRj8xQ==
X-CSE-MsgGUID: rdxk4UgtSiqNAmd2G5+qBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="47963334"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="47963334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:54:01 -0700
X-CSE-ConnectionGUID: PCyxTIY+SJywTehliwftWA==
X-CSE-MsgGUID: p1NkDJUpRzaUquSTcGg+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124904743"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:53:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tx7XI-00000005oBS-06YU;
	Tue, 25 Mar 2025 18:53:56 +0200
Date: Tue, 25 Mar 2025 18:53:55 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 5/8] platform/x86: int3472: Make regulator supply name
 configurable
Message-ID: <Z-LfoxE3VU3Z0v6P@smile.fi.intel.com>
References: <20250325161340.342192-1-hdegoede@redhat.com>
 <20250325161340.342192-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325161340.342192-6-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 25, 2025 at 05:13:37PM +0100, Hans de Goede wrote:
> This is a preparation patch for registering multiple regulators, which
> requires a different supply-name for each regulator. Make supply-name
> a parameter to skl_int3472_register_regulator() and use con-id to set it
> so that the existing int3472_gpio_map remapping can be used with it.
> 
> Since supply-name now is a parameter, drop the fixed
> skl_int3472_regulator_map_supplies[] array and instead add lower- +
> upper-case mappings of the passed in supply-name to the regulator.

...

> +	if (strlen(supply_name) >= GPIO_SUPPPLY_NAME_LENGTH) {

Hmm... This can potentially go up to the page fault.
If we are _not_ okay with that, strnlen() should be used.

> +		dev_err(int3472->dev, "supply-name '%s' length too long\n", supply_name);

> +		return -EOVERFLOW;

This error code is for integers, we use E2BIG for the string lengths.

> +	}

-- 
With Best Regards,
Andy Shevchenko



