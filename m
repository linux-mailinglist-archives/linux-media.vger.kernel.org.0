Return-Path: <linux-media+bounces-30380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AF2A90B2B
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 20:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79EBB162F46
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 18:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8700E219A68;
	Wed, 16 Apr 2025 18:16:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CE0183CB0;
	Wed, 16 Apr 2025 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827397; cv=none; b=Gbr3RVtAAKIjczfo+2HzgEJ9JqVu4b6ucgx2yTSxtjRiEXCU5caJMwD7gBlpVnm9ROwpYiPkoZuu50YghDekp3pk9kDPj1f7cVIU5OZR1FR819vORzZy2zbHbZbWh2RJgzDlLvrxydvOp4+rYegpQBlIPW0ad2rcwmf4dEhhJrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827397; c=relaxed/simple;
	bh=2U6RQeOONhWeeEagFZmIK7WqwJISn1S3adKR+IsYDwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7XMUo9ITLDfBcEftJ2bcnQsX61UT/uGES5QYC/zqriewjUk7RaV+52MJDwnxJtRS6fKJ+c2BpUpUyDlu93zw/DbumLM1Y27MR6uJKTNENege0SUWtV3t2ELi3iiAVEbYBX7QH61wOrhyN5QnAEN0GGIuw7opPpPLLEWMJvvBM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: UTz+ZFaoR3WpViKhNNu+OQ==
X-CSE-MsgGUID: OVY8eWN2QuO8dZ0xMmTyJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="34011216"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="34011216"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:16:35 -0700
X-CSE-ConnectionGUID: trRwz+AUTsmMOoEazX5Nbg==
X-CSE-MsgGUID: hVWshIUMRjmsV4gnX1dOZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135543419"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:16:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u57JF-0000000Cw52-0d8s;
	Wed, 16 Apr 2025 21:16:29 +0300
Date: Wed, 16 Apr 2025 21:16:28 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 8/9] platform/x86: int3472: Add handshake pin support
Message-ID: <Z__z_G21Ro2jGDkP@smile.fi.intel.com>
References: <20250416124037.90508-1-hdegoede@redhat.com>
 <20250416124037.90508-9-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416124037.90508-9-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 02:40:36PM +0200, Hans de Goede wrote:
> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
> pin defined in the INT3472 sensor companion device which describes
> the sensor's GPIOs.
> 
> This pin is primarily used on designs with a Lattice FPGA chip which is
> capable of running the sensor independently of the main CPU for features
> like presence detection. This pin needs to be driven high to make the FPGA
> run the power-on sequence of the sensor. After driving the pin high,
> the FPGA "firmware" needs 25ms to complete the power-on sequence.
> 
> Add support for this modelling the handshake pin as a GPIO driven "dvdd"
> regulator with a 25 ms enable time. This model was chosen because:
> 
> 1. Sensor chips don't have a handshake pin, so we need to abstract this
>    in some way which does not require modification to the sensor drivers,
>    sensor drivers using the bulk-regulator API to get avdd + vddio + dvdd
>    is normal. So this will work to get the right value set to the handshake
>    pin without requiring sensor driver modifications.
> 
> 2. Sensors typically wait only a small time for the sensor to power-on
>    after de-asserting reset. Not the 25ms the Lattice chip requires.
>    Using the regulator framework's enable_time allows hiding the need for
>    this delay from the sensor drivers.

...

>  			if (ret)
>  				err_msg = "Failed to map regulator to sensor\n";
>  
> +			break;

> +			if (ret)
> +				err_msg = "Failed to map regulator to sensor\n";
> +
>  			break;

As discussed this might be changed to have the same format string with supplied
name as a parameter.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



