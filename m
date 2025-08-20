Return-Path: <linux-media+bounces-40450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AD4B2E0A6
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9AA6020AD
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD82932C307;
	Wed, 20 Aug 2025 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZ6mA+rF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A29321F55;
	Wed, 20 Aug 2025 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702068; cv=none; b=Ib7aNgUYanghIav9zjRgNmqvf+dW09BO+AWIUCHJLsbWwKxJZ6OxammevbnroQsJFLlWT+FEp7g3y9y/0Ohjr3Wvu5sLLlSqfwxw1PGYAx39ZJ0mM6uraX9X4GjcK+XMcd2nhJ7bUWPG7C+FEazyqr+mZo2UKuVqW50trecS0q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702068; c=relaxed/simple;
	bh=PjXU/sF1ocoTsuQYzmdPR4yg5cFS0zDzPmkuL8MGMn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFATdOmqydcvYutvl/BDuJUMOgQzCo4mhK38eZPsU/McJZg0AULav/OEItnK7gMCR86eaLLwCEf5V3RFA0K2Jr6T16h79f+ILxNWghroVP1DS3WU8qXn6W+3zo0+3cOpFZGQYbch8qVC8S2JblLNrnxHRVf6W+8Wy2jTHoRMcHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZ6mA+rF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755702067; x=1787238067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PjXU/sF1ocoTsuQYzmdPR4yg5cFS0zDzPmkuL8MGMn4=;
  b=bZ6mA+rFeWKUIfOvypDFIxXuXI2lzvetLhSl6c/Y6ibiZdq2niui9ux9
   kfXc2ixKmRYg3SFuRM1FSHNNmiahvKKgwG02i2jyPJm5K5ndb2azmKoR7
   jGEvxlUXMawLMnLMdfSjQ4mLn/6B+7TRdoN8w+BtaTEERNjefmu+J0cvK
   Ro6a6c0ug+YUuSS0HZf2UisIlgOYAl2TS1E5cU0fgoAeXzFJglyuoJGV4
   0gKM0/hPfPWHx5iI9ef/SdHtB4qI87q77OOtunBAjYsxqlrVxZCcIHuqF
   nz6Liu40vS+oUDgBkCcRrhRnKOdv9+RdP7rjiMRV9+g0gZumvbr5unokc
   A==;
X-CSE-ConnectionGUID: DOflF5REQQ61RWKKzcClNA==
X-CSE-MsgGUID: J+vJyPmZT5yNW5UFgkfYEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58041511"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="58041511"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 08:01:06 -0700
X-CSE-ConnectionGUID: xss5JKx9QWqayVtDn2pIGg==
X-CSE-MsgGUID: 2CF7EmZ9RhOHn50VEEeurg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167372726"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 08:01:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uokJB-00000006xvu-0onP;
	Wed, 20 Aug 2025 18:01:01 +0300
Date: Wed, 20 Aug 2025 18:01:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: Use vmemdup_user() instead of open-coding
Message-ID: <aKXjLOvJbpeMZaCv@smile.fi.intel.com>
References: <20250814133032.236533-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814133032.236533-1-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 14, 2025 at 09:30:29PM +0800, Qianfeng Rong wrote:
> Use vmemdup_user() to get a copy of the user buffer in
> atomisp_v4l2_framebuffer_to_css_frame().

> Compile-tested only.

Not sure if it worth to have in the commit message, but at least it doesn't
make it ugly. So, up to Hans.

...

> +	tmp_buf = vmemdup_user((void __user __force *)arg->base,
> +			       arg->fmt.sizeimage);

I know this is 85 characters on one line, but I would go as it makes a bit
better the readability in my opinion.

> +	if (IS_ERR(tmp_buf)) {
> +		ret = PTR_ERR(tmp_buf);
>  		goto err;
>  	}

...

>  err:
>  	if (ret && res)
>  		ia_css_frame_free(res);
> -	vfree(tmp_buf);
> +	if (!IS_ERR(tmp_buf))
> +		kvfree(tmp_buf);
>  	if (ret == 0)
>  		*result = res;
>  	return ret;

This is messy error handling, but it is definitely out of scope of the proposed
patch.

-- 
With Best Regards,
Andy Shevchenko



