Return-Path: <linux-media+bounces-22667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC339E4FC0
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 907C0282654
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 08:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D17A1D27BB;
	Thu,  5 Dec 2024 08:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cl/w0lxE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AF81E517;
	Thu,  5 Dec 2024 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733387508; cv=none; b=mRRwDuhOujv5LdPy6J023knXxg+j1QmpCxMC2Btq0NyL+5FM+kRar/hNPj50vkpvgE7sKVJs++J8MEig4/kaPz4DmpmnFr1sbsDQV+1iCmbISSNKbPw6GBaTemGPPBIc1U3h1XFUfpUGNHhHbuvWMoauxbwh60dUhrBKpDBvbEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733387508; c=relaxed/simple;
	bh=PwUz5TT6if4KR6nx5xSKc3IlJvN+MCVxceBhNWnh3js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fR59FhcDg3ROucRY5QJUXNBTFPwuB+bVEfGW7Dr0WXtj1+fT6ONqnEo5P/Gl+4tybsliHrPrW2gDkkA43nIJfUof2dZ9YFuHRuBQ+xGuSuOIb+/kQHZm5ANrjsyiHCNRfRmz9hriph/WaO+dZpvn6SzGHaNs3iKSUL9oj1lLoTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cl/w0lxE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733387507; x=1764923507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PwUz5TT6if4KR6nx5xSKc3IlJvN+MCVxceBhNWnh3js=;
  b=cl/w0lxE8sx5+ERg+Oz1YonDv65NTaM50tJI2l7454wWuVqwG9I7tzQw
   5RJDwIA9cBzX3pEpc5qVyf1ZCuZTtypIQ19n6AwpiZTykBvSUPVDocJPn
   a2wbMMSsb+U9l0PCONkfuz9/JFe83hOvSgIBMuKYjgEX4SYqfiURQU9cO
   q7Q/mS6YNiWII+/62D3tqZRNuR4e45H285jfGztT/x3Ugll6BnzBlblO0
   npOAjwSpx3hfvw5scwqggr5du0dOs6TJvG4s90cxkhei+Og0+3DjR4qaY
   XQ8zEjK9M7CHVF0EBJrakdYFOSeOqF8x4sUdgEpfqMuWMRiXdB0aM1Y67
   Q==;
X-CSE-ConnectionGUID: HCl7UNtHSvGpjMM72ZB7IA==
X-CSE-MsgGUID: pElRg6sJQK+GyScmXUZ4ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33816457"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33816457"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:31:46 -0800
X-CSE-ConnectionGUID: Z9SZoJBqTCS3/bYeldthtw==
X-CSE-MsgGUID: 9r5WepzzQgyKFz7QtvhZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94495498"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:31:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJ7Gw-000000041ln-1NMt;
	Thu, 05 Dec 2024 10:31:42 +0200
Date: Thu, 5 Dec 2024 10:31:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/15] media: i2c: ds90ub960: Add support for I2C_RX_ID
Message-ID: <Z1Fk7jRVQJZzsTQp@smile.fi.intel.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <20241204-ub9xx-fixes-v3-7-a933c109b323@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-ub9xx-fixes-v3-7-a933c109b323@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 04, 2024 at 01:05:21PM +0200, Tomi Valkeinen wrote:
> Normally the driver accesses both the RX and the TX port registers via a
> paging mechanism: one register is used to select the page (i.e. the
> port), which dictates the port used when accessing the port specific
> registers.
> 
> The downside to this is that while debugging it's almost impossible to
> access the port specific registers from the userspace, as the driver can
> change the page at any moment.
> 
> The hardware supports another access mechanism: using the I2C_RX_ID
> registers (one for each RX port), i2c addresses can be chosen which,
> when accessed, will always use the specific port's registers, skipping
> the paging mechanism.
> 
> The support is only for the RX port, but it has proven very handy while
> debugging and testing. So let's add the code for this, but hide it
> behind a disabled define.

...

>  #define MHZ(v) ((u32)((v) * 1000000U))

Missed HZ_PER_MHZ from previous patch?

...

> +#ifdef UB960_DEBUG_I2C_RX_ID
> +	for (unsigned int i = 0; i < 4; i++)

Should it use _MAX_RX_NPORTS instead of 4?

> +		ub960_write(priv, UB960_SR_I2C_RX_ID(i),
> +			    (UB960_DEBUG_I2C_RX_ID + i) << 1);
> +#endif

-- 
With Best Regards,
Andy Shevchenko



