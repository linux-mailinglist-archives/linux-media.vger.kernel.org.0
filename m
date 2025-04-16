Return-Path: <linux-media+bounces-30377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33608A90B20
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 20:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23311895E1A
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 18:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168D921ADDB;
	Wed, 16 Apr 2025 18:13:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E497718C32C;
	Wed, 16 Apr 2025 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827230; cv=none; b=Z+j3POBnVIn0QZXb7lM1kA2ULmzVsi7yGBgU0+I1+q/Rjb9s6B7/OGy+CHTDj6jIYml4ho7eZaLzMP6+yNUVA7FAZ3rlIzFAka54rz7//SPbZN0e+o/JaKr11V2JM3rTzfEWn/vmVXda6hucv5Ul+HBlwOc+ke/u8L9b5Kb2NlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827230; c=relaxed/simple;
	bh=/6XzfzDOM1RQJrmmo5s0h61HK4p3Zrx2dhwqOa8iMDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au6spcmGbv6HzBgRgayhRDFJVw+8tf1qhiYCHszxc61cW0EX4EQXUq5AscTjNncnbxCQy8fgtfSxmEVs/xy/bQjyCwJkMdvlAHxPOuIWJmMIGgnNXU5P0OwpLofxBlj6YAJZHmWHbZnNQaM+SxC94OAcJjkyKpMQ0VoCuRHXXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: pwCwhiG5THufXKdfPZfpBA==
X-CSE-MsgGUID: 8lgvwHqmSkOwWtrwwyDA9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46557823"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46557823"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:13:48 -0700
X-CSE-ConnectionGUID: Xcl5puEfTV+4UeVqco0aow==
X-CSE-MsgGUID: vm/QV3/MTLi2x6SJcT1btw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135369914"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:13:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u57GX-0000000Cw2Z-3K51;
	Wed, 16 Apr 2025 21:13:41 +0300
Date: Wed, 16 Apr 2025 21:13:41 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 5/9] platform/x86: int3472: Make regulator supply name
 configurable
Message-ID: <Z__zVTnMbJdkmyf3@smile.fi.intel.com>
References: <20250416124037.90508-1-hdegoede@redhat.com>
 <20250416124037.90508-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416124037.90508-6-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 02:40:33PM +0200, Hans de Goede wrote:
> This is a preparation patch for registering multiple regulators, which
> requires a different supply-name for each regulator. Make supply-name
> a parameter to skl_int3472_register_regulator() and use con-id to set it
> so that the existing int3472_gpio_map remapping can be used with it.
> 
> Since supply-name is a parameter now, drop the fixed
> skl_int3472_regulator_map_supplies[] array and instead add lower- and
> upper-case mappings of the passed-in supply-name to the regulator.

...

> +	for (i = 0, j = 0; i < GPIO_REGULATOR_SUPPLY_MAP_COUNT; i++) {
> +		const char *supply = i ? regulator->supply_name_upper : supply_name;

But this won't scale, it seems it relies on the fact that
GPIO_REGULATOR_SUPPLY_MAP_COUNT <= 2.

> +		regulator->supply_map[j].supply = supply;
> +		regulator->supply_map[j].dev_name = int3472->sensor_name;
>  		j++;
>  
>  		if (second_sensor) {
> -			int3472->regulator.supply_map[j].supply =
> -				skl_int3472_regulator_map_supplies[i];
> -			int3472->regulator.supply_map[j].dev_name = second_sensor;
> +			regulator->supply_map[j].supply = supply;
> +			regulator->supply_map[j].dev_name = second_sensor;
>  			j++;
>  		}

With that in mind, why not unroll the loop?

>  	}

...

> +/* lower- and upper-case mapping */
>  #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2

Code seems really relies on this not be bigger than 2, perhaps static assert?

-- 
With Best Regards,
Andy Shevchenko



