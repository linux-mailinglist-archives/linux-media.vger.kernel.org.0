Return-Path: <linux-media+bounces-11332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F3F8C2783
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E208F288DD9
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DF5171658;
	Fri, 10 May 2024 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5PDoiv+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640151E502;
	Fri, 10 May 2024 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715354309; cv=none; b=jvsBJJE9ZyPo/FI1ptjifLYAOL5HbN8WOAkMhlNGZIpBhKdDsXcXIO/7Rl9wEHNs/T4gYyGXq+XUnSsu3vRunDLHwRgtyJqEOYIQmafKgKMqtU38hmN4Psw3EE1CfmDJ2LV99ldVklyzP2y/WDBjN3gl82GjMXf0H7SLDt+3yCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715354309; c=relaxed/simple;
	bh=rSpp9aZXpk0b/X8SmDDzpBXyot1jyDyExublcRfwLco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7Y4WAgLy5i9/hjjWHewTFMbai3ekuXtYtfeJfwwKQJYUSlEQwjBJ9tXC/Qq/4XuaViBfWpeQKfuYRYZJiLUTrPX8nBCu2kNZKRaR/tt7U7V70qcTN8/02sEnCXtycSGhW/9S25Yo8rrvdYnVYEwqwrp2tWV/IQ+WAwE6Gb8ev4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5PDoiv+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715354308; x=1746890308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rSpp9aZXpk0b/X8SmDDzpBXyot1jyDyExublcRfwLco=;
  b=R5PDoiv+Sgccs/l2yW5DuwuX/QhZGpbv4oZKBSWJufFKk45TXUwXsRRV
   lreZFg8qhC9aZrUiAZ4FqRH6Lyb5qIpYFCqJ5NYb8m6gbO/nkI0+fYSve
   Dmx9s9vI+A6JAtyoj/38v8kFv3Z46CdoSCKq5dB8zAQMMPYdnlvxsUMJv
   jlyqP9smL5JaoZZe5CQllVsX8rFzGX+B9VCSPGM+k6nU/cGZDwtMJ8TD2
   JPYwqXeU33thbMMQvfjlcxWpO99gI6itf6MrVkem08Ym+U7651vfp2GmH
   66fDl91AchCIThFDbHWgEhDc6CCsgAVJXzaHpy/v3VasJaZ6cDs1H8XjE
   A==;
X-CSE-ConnectionGUID: bNeKkaZOQXK+6sQ+zaBdwg==
X-CSE-MsgGUID: XDi4BYGqTj6NKeuY4wt80g==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11554511"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11554511"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:18:28 -0700
X-CSE-ConnectionGUID: 6AKYIFleQ/q2QT3bBLmBIg==
X-CSE-MsgGUID: 858xGBudSU+dIZFGTPxjHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29654699"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:18:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5S0s-000000068qL-3Xwd;
	Fri, 10 May 2024 18:18:22 +0300
Date: Fri, 10 May 2024 18:18:22 +0300
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
Message-ID: <Zj46vpwTbfde4YX2@smile.fi.intel.com>
References: <71dad56e-0e2f-48ba-90bc-75096112a1ba@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71dad56e-0e2f-48ba-90bc-75096112a1ba@moroto.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 06:10:37PM +0300, Dan Carpenter wrote:
> Return -EINVAL if "bridge->n_sensors == 0".  Don't return success.

...

>  	ret = ipu_bridge_connect_sensors(bridge);
> -	if (ret || bridge->n_sensors == 0)
> +	if (ret || bridge->n_sensors == 0) {
> +		ret = ret ?: -EINVAL;
>  		goto err_unregister_ipu;
> +	}

I would split:

	ret = ipu_bridge_connect_sensors(bridge);
	if (ret)
		goto err_unregister_ipu;

	if (bridge->n_sensors == 0) {
		ret = -EINVAL;
		goto err_unregister_ipu;
	}

-- 
With Best Regards,
Andy Shevchenko



